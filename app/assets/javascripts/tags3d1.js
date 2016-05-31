var TAGS3d = {
	radius: 120,
	dtr: Math.PI/180,
	d: 300,
	mcList: [],
	active: false,
	lasta: 1,
	lastb: 1,
	distr: true,
	tspeed: 10,
	size: 250,
	mouseX: 0,
	mouseY: 0,
	howElliptical: 1,
	aA: null,
	oDiv: null,
	init: function(){
		var self = this;
		this.oDiv = document.getElementById('tags');
		this.aA = this.oDiv.getElementsByTagName('a');
		console.log(this.aA)
		for(var i = 0; i < this.aA.length; i++){
			var oTag = {};
			oTag.offsetWidth = this.aA[i].offsetWidth;
			oTag.offsetHeight = this.aA[i].offsetHeight;
			this.mcList.push(oTag);
		}
		console.log('init')
		this.sineCosine(0, 0, 0);
		this.positionAll();
		this.oDiv.onmouseover = function (){
			self.active = true;
		};

		this.oDiv.onmouseout = function (){
			self.active = false;
		};

		this.oDiv.onmousemove = function (ev){
			var oEvent = window.event || ev;
			this.mouseX = oEvent.clientX - (this.oDiv.offsetLeft + this.oDiv.offsetWidth / 2);
			this.mouseY = oEvent.clientY - (this.oDiv.offsetTop + this.oDiv.offsetHeight / 2);
			this.mouseX /= 5;
			this.mouseY /= 5;
		};
		setInterval(this.update, 30);
	},
	sineCosine: function(a, b, c){
		this.sa = Math.sin(a * this.dtr);
		this.ca = Math.cos(a * this.dtr);
		this.sb = Math.sin(b * this.dtr);
		this.cb = Math.cos(b * this.dtr);
		this.sc = Math.sin(c * this.dtr);
		this.cc = Math.cos(c * this.dtr);
	},
	positionAll: function(){
		var phi = 0;
		var theta = 0;
		var max = this.mcList.length;
		var aTmp = [];
		var oFragment = document.createDocumentFragment();
		for(var i = 0; i < this.aA.length; i++){
			aTmp.push(this.aA[i]);
		}
		aTmp.sort(function (){
			return Math.random() < 0.5 ? 1 : -1;
		});
		for(var i=0; i < aTmp.length; i++){
			oFragment.appendChild(aTmp[i]);
		}
		this.oDiv.appendChild(oFragment);

		for( var i = 1; i < max + 1; i++){
			if( this.distr ){
				phi = Math.acos(-1 + ( 2 * i - 1) / max);
				theta = Math.sqrt( max * Math.PI) * phi;
			}	else {
				phi = Math.random() * Math.PI;
				theta = Math.random() * ( 2 * Math.PI);
			}

			this.mcList[i-1].cx = this.radius * Math.cos(theta) * Math.sin(phi);
			this.mcList[i-1].cy = this.radius * Math.sin(theta) * Math.sin(phi);
			this.mcList[i-1].cz = this.radius * Math.cos(phi);

			this.aA[i-1].style.left = this.mcList[i-1].cx + this.oDiv.offsetWidth / 2 - this.mcList[i-1].offsetWidth/2 + 'px';
			this.aA[i-1].style.top = this.mcList[i-1].cy + this.oDiv.offsetHeight / 2 - this.mcList[i-1].offsetHeight/2 + 'px';
		}
	},
	update: function(){
		var a;
		var b;
		if (this.active){
			a = (-Math.min( Math.max( -mouseY, -size ), size ) / radius ) * tspeed;
			b = (Math.min( Math.max( -mouseX, -size ), size ) / radius ) * tspeed;
		} else {
			a = this.lasta * 0.98;
			b = this.lastb * 0.98;
		}

		this.lasta = a;
		this.lastb = b;

		if (Math.abs(a) <= 0.01 && Math.abs(b) <= 0.01){
			return;
		}

		var c = 0;
		this.sineCosine(a, b, c);
		for (var j = 0; j < this.mcList.length; j++){
			var rx1 = this.mcList[j].cx;
			var ry1 = this.mcList[j].cy * this.ca + this.mcList[j].cz * (-this.sa);
			var rz1 = this.mcList[j].cy * this.sa + this.mcList[j].cz * this.ca;

			var rx2 = rx1 * cb + rz1 * sb;
			var ry2 = ry1;
			var rz2 = rx1 * (-sb) + rz1 * cb;

			var rx3 = rx2 * this.cc + ry2 * (-this.sc);
			var ry3 = rx2 * this.sc + ry2 * this.cc;
			var rz3 = rz2;

			this.mcList[j].cx = rx3;
			this.mcList[j].cy = ry3;
			this.mcList[j].cz = rz3;

			per = this.d / (this.d + rz3);

			this.mcList[j].x = (this.howElliptical * rx3 * per) - (this.howElliptical * 2);
			this.mcList[j].y = ry3 * per;
			this.mcList[j].scale = per;
			this.mcList[j].alpha = per;
			// console.log('alpha1:'+mcList[j].alpha);
			this.mcList[j].alpha=(this.mcList[j].alpha-0.6) * (10/6);
			// console.log('alpha2:'+mcList[j].alpha);
		}

		this.doPosition();
		this.depthSort();
	},
	doPosition: function (){
		var l = this.oDiv.offsetWidth / 2;
		var t = this.oDiv.offsetHeight / 2;
		for(var i = 0; i < this.mcList.length; i++){
			this.aA[i].style.left = this.mcList[i].cx + l - this.mcList[i].offsetWidth / 2 + 'px';
			this.aA[i].style.top = this.mcList[i].cy + t - this.mcList[i].offsetHeight / 2 + 'px';

			this.aA[i].style.fontSize = Math.ceil(12 * this.mcList[i].scale/2) + 8 + 'px';

			this.aA[i].style.filter = "alpha(opacity=" + 100 * this.mcList[i].alpha + ")";
			this.aA[i].style.opacity = this.mcList[i].alpha;
		}
	},
	//深度冒泡
	depthSort: function(){
		var aTmp = [];
		for(var i=0; i < this.aA.length; i++){
			aTmp.push(this.aA[i]);
		}
		aTmp.sort(function (vItem1, vItem2){
				if(vItem1.cz > vItem2.cz){
					return -1;
				}	else if(vItem1.cz < vItem2.cz){
					return 1;
				}	else {
					return 0;
				}
			}
		);
		for(var i = 0; i < this.aTmp.length; i++){
			this.aTmp[i].style.zIndex = i;
		}
	}
}

window.load = function(){
	console.log('load')
	// Object.create(TAGS3d).init();
}

$(document).ready(function(){
	console.log('ready')
	Object.create(TAGS3d).init()
})
// console.log(123)



//
//
//
// var radius = 120;
// var dtr = Math.PI/180;
// var d=300;
//
// var mcList = [];
// var active = false;
// var lasta = 1;
// var lastb = 1;
// var distr = true;
// var tspeed=10;
// var size=250;
//
// var mouseX=0;
// var mouseY=0;
//
// var howElliptical=1;
//
// var aA=null;
// var oDiv=null;
//
// window.onload=function ()
// {
// 	oDiv=document.getElementById('tags');
// 	aA=oDiv.getElementsByTagName('a');
// 	for(var i=0;i<aA.length;i++)
// 	{
// 		var oTag={};
// 		oTag.offsetWidth=aA[i].offsetWidth;
// 		oTag.offsetHeight=aA[i].offsetHeight;
// 		mcList.push(oTag);
// 	}
//
// 	sineCosine( 0,0,0 );
//
// 	positionAll();
//
// 	oDiv.onmouseover=function ()
// 	{
// 		active=true;
// 	};
//
// 	oDiv.onmouseout=function ()
// 	{
// 		active=false;
// 	};
//
// 	oDiv.onmousemove=function (ev)
// 	{
// 		var oEvent=window.event || ev;
//
// 		mouseX=oEvent.clientX-(oDiv.offsetLeft+oDiv.offsetWidth/2);
// 		mouseY=oEvent.clientY-(oDiv.offsetTop+oDiv.offsetHeight/2);
//
// 		mouseX/=5;
// 		mouseY/=5;
// 	};
//
// 	setInterval(update, 30);
// };
//
// //更新位置坐标
// function update()
// {
// 	var a;
// 	var b;
//
// 	if(active)
// 	{
// 		a = (-Math.min( Math.max( -mouseY, -size ), size ) / radius ) * tspeed;
// 		b = (Math.min( Math.max( -mouseX, -size ), size ) / radius ) * tspeed;
// 	}
// 	else
// 	{
// 		a = lasta * 0.98;
// 		b = lastb * 0.98;
// 	}
//
// 	lasta=a;
// 	lastb=b;
//
// 	if(Math.abs(a)<=0.01 && Math.abs(b)<=0.01)
// 	{
// 		return;
// 	}
//
// 	var c=0;
// 	sineCosine(a,b,c);
// 	// sineCosine(1,1,0);
// 	for(var j=0;j<mcList.length;j++)
// 	{
// 		var rx1=mcList[j].cx;
// 		var ry1=mcList[j].cy*ca+mcList[j].cz*(-sa);
// 		var rz1=mcList[j].cy*sa+mcList[j].cz*ca;
//
// 		var rx2=rx1*cb+rz1*sb;
// 		var ry2=ry1;
// 		var rz2=rx1*(-sb)+rz1*cb;
//
// 		var rx3=rx2*cc+ry2*(-sc);
// 		var ry3=rx2*sc+ry2*cc;
// 		var rz3=rz2;
//
// 		mcList[j].cx=rx3;
// 		mcList[j].cy=ry3;
// 		mcList[j].cz=rz3;
//
// 		per=d/(d+rz3);
//
// 		mcList[j].x=(howElliptical*rx3*per)-(howElliptical*2);
// 		mcList[j].y=ry3*per;
// 		mcList[j].scale=per;
// 		mcList[j].alpha=per;
// 		// console.log('alpha1:'+mcList[j].alpha);
// 		mcList[j].alpha=(mcList[j].alpha-0.6)*(10/6);
// 		// console.log('alpha2:'+mcList[j].alpha);
// 	}
//
// 	doPosition();
// 	depthSort();
// }
//
// //深度冒泡
// function depthSort()
// {
// 	var i=0;
// 	var aTmp=[];
//
// 	for(i=0;i<aA.length;i++)
// 	{
// 		aTmp.push(aA[i]);
// 	}
//
// 	aTmp.sort
// 	(
// 		function (vItem1, vItem2)
// 		{
// 			if(vItem1.cz>vItem2.cz)
// 			{
// 				return -1;
// 			}
// 			else if(vItem1.cz<vItem2.cz)
// 			{
// 				return 1;
// 			}
// 			else
// 			{
// 				return 0;
// 			}
// 		}
// 	);
//
// 	for(i=0;i<aTmp.length;i++)
// 	{
// 		aTmp[i].style.zIndex=i;
// 	}
// }
//
// //初始化
// function positionAll()
// {
// 	var phi=0;
// 	var theta=0;
// 	var max=mcList.length;
// 	var i=0;
//
// 	var aTmp=[];
// 	var oFragment=document.createDocumentFragment();
//
// 	//Ëæ»úÅÅÐò
// 	for(i=0;i<aA.length;i++)
// 	{
// 		aTmp.push(aA[i]);
// 	}
//
// 	aTmp.sort
// 	(
// 		function ()
// 		{
// 			return Math.random()<0.5?1:-1;
// 		}
// 	);
//
// 	for(i=0;i<aTmp.length;i++)
// 	{
// 		oFragment.appendChild(aTmp[i]);
// 	}
//
// 	oDiv.appendChild(oFragment);
//
// 	for( var i=1; i<max+1; i++){
// 		if( distr )
// 		{
// 			phi = Math.acos(-1+(2*i-1)/max);
// 			theta = Math.sqrt(max*Math.PI)*phi;
// 		}
// 		else
// 		{
// 			phi = Math.random()*(Math.PI);
// 			theta = Math.random()*(2*Math.PI);
// 		}
// 		//×ø±ê±ä»»
// 		mcList[i-1].cx = radius * Math.cos(theta)*Math.sin(phi);
// 		mcList[i-1].cy = radius * Math.sin(theta)*Math.sin(phi);
// 		mcList[i-1].cz = radius * Math.cos(phi);
//
// 		aA[i-1].style.left=mcList[i-1].cx+oDiv.offsetWidth/2-mcList[i-1].offsetWidth/2+'px';
// 		aA[i-1].style.top=mcList[i-1].cy+oDiv.offsetHeight/2-mcList[i-1].offsetHeight/2+'px';
// 	}
// }
//
// //位置变幻时的效果处理
// function doPosition()
// {
// 	var l=oDiv.offsetWidth/2;
// 	var t=oDiv.offsetHeight/2;
// 	for(var i=0;i<mcList.length;i++)
// 	{
// 		aA[i].style.left=mcList[i].cx+l-mcList[i].offsetWidth/2+'px';
// 		aA[i].style.top=mcList[i].cy+t-mcList[i].offsetHeight/2+'px';
//
// 		aA[i].style.fontSize=Math.ceil(12*mcList[i].scale/2)+8+'px';
//
// 		aA[i].style.filter="alpha(opacity="+100*mcList[i].alpha+")";
// 		aA[i].style.opacity=mcList[i].alpha;
// 	}
// }
//
// function sineCosine( a, b, c)
// {
// 	sa = Math.sin(a * dtr);
// 	ca = Math.cos(a * dtr);
// 	sb = Math.sin(b * dtr);
// 	cb = Math.cos(b * dtr);
// 	sc = Math.sin(c * dtr);
// 	cc = Math.cos(c * dtr);
// }
