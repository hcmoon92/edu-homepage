(this["webpackJsonp@coreui/coreui-free-react-admin-template"]=this["webpackJsonp@coreui/coreui-free-react-admin-template"]||[]).push([[24],{621:function(e,t,s){"use strict";s.d(t,"a",(function(){return o}));var r=s(43),i=s(158),n=s(1),a=s.n(n),c=s(620),d=s(20),l=function(e){var t=e.name,s=e.text,n=Object(i.a)(e,["name","text"]),a=t?"https://coreui.io/react/docs/components/".concat(t):e.href;return Object(d.jsx)("div",{className:"card-header-actions",children:Object(d.jsx)(c.db,Object(r.a)(Object(r.a)({},n),{},{href:a,rel:"noreferrer noopener",target:"_blank",className:"card-header-action",children:Object(d.jsx)("small",{className:"text-muted",children:s||"docs"})}))})},o=a.a.memo(l)},630:function(e,t,s){"use strict";t.a=[{id:0,name:"John Doe",registered:"2018/01/01",role:"Guest",status:"Pending"},{id:1,name:"Samppa Nori",registered:"2018/01/01",role:"Member",status:"Active"},{id:2,name:"Estavan Lykos",registered:"2018/02/01",role:"Staff",status:"Banned"},{id:3,name:"Chetan Mohamed",registered:"2018/02/01",role:"Admin",status:"Inactive"},{id:4,name:"Derick Maximinus",registered:"2018/03/01",role:"Member",status:"Pending"},{id:5,name:"Friderik D\xe1vid",registered:"2018/01/21",role:"Staff",status:"Active"},{id:6,name:"Yiorgos Avraamu",registered:"2018/01/01",role:"Member",status:"Active"},{id:7,name:"Avram Tarasios",registered:"2018/02/01",role:"Staff",status:"Banned"},{id:8,name:"Quintin Ed",registered:"2018/02/01",role:"Admin",status:"Inactive"},{id:9,name:"En\xe9as Kwadwo",registered:"2018/03/01",role:"Member",status:"Pending"},{id:10,name:"Agapetus Tade\xe1\u0161",registered:"2018/01/21",role:"Staff",status:"Active"},{id:11,name:"Carwyn Fachtna",registered:"2018/01/01",role:"Member",status:"Active"},{id:12,name:"Nehemiah Tatius",registered:"2018/02/01",role:"Staff",status:"Banned"},{id:13,name:"Ebbe Gemariah",registered:"2018/02/01",role:"Admin",status:"Inactive"},{id:14,name:"Eustorgios Amulius",registered:"2018/03/01",role:"Member",status:"Pending"},{id:15,name:"Leopold G\xe1sp\xe1r",registered:"2018/01/21",role:"Staff",status:"Active"},{id:16,name:"Pompeius Ren\xe9",registered:"2018/01/01",role:"Member",status:"Active"},{id:17,name:"Pa\u0109jo Jadon",registered:"2018/02/01",role:"Staff",status:"Banned"},{id:18,name:"Micheal Mercurius",registered:"2018/02/01",role:"Admin",status:"Inactive"},{id:19,name:"Ganesha Dubhghall",registered:"2018/03/01",role:"Member",status:"Pending"},{id:20,name:"Hiroto \u0160imun",registered:"2018/01/21",role:"Staff",status:"Active"},{id:21,name:"Vishnu Serghei",registered:"2018/01/01",role:"Member",status:"Active"},{id:22,name:"Zbyn\u011bk Phoibos",registered:"2018/02/01",role:"Staff",status:"Banned"},{id:23,name:"Aulus Agmundr",registered:"2018/01/01",role:"Member",status:"Pending"},{id:42,name:"Ford Prefect",registered:"2001/05/25",role:"Alien",status:"Don't panic!"}]},663:function(e,t,s){"use strict";s.r(t);s(1);var r=s(620),i=s(621),n=s(630),a=s(20),c=function(e){switch(e){case"Active":return"success";case"Inactive":return"secondary";case"Pending":return"warning";case"Banned":return"danger";default:return"primary"}},d=["name","registered","role","status"];t.default=function(){return Object(a.jsxs)(a.Fragment,{children:[Object(a.jsxs)(r.wb,{children:[Object(a.jsx)(r.u,{xs:"12",lg:"6",children:Object(a.jsxs)(r.j,{children:[Object(a.jsxs)(r.n,{children:["Simple Table",Object(a.jsx)(i.a,{name:"CModal"})]}),Object(a.jsx)(r.k,{children:Object(a.jsx)(r.y,{items:n.a,fields:d,itemsPerPage:5,pagination:!0,scopedSlots:{status:function(e){return Object(a.jsx)("td",{children:Object(a.jsx)(r.b,{color:c(e.status),children:e.status})})}}})})]})}),Object(a.jsx)(r.u,{xs:"12",lg:"6",children:Object(a.jsxs)(r.j,{children:[Object(a.jsx)(r.n,{children:"Striped Table"}),Object(a.jsx)(r.k,{children:Object(a.jsx)(r.y,{items:n.a,fields:d,striped:!0,itemsPerPage:5,pagination:!0,scopedSlots:{status:function(e){return Object(a.jsx)("td",{children:Object(a.jsx)(r.b,{color:c(e.status),children:e.status})})}}})})]})})]}),Object(a.jsxs)(r.wb,{children:[Object(a.jsx)(r.u,{xs:"12",lg:"6",children:Object(a.jsxs)(r.j,{children:[Object(a.jsx)(r.n,{children:"Condensed Table"}),Object(a.jsx)(r.k,{children:Object(a.jsx)(r.y,{items:n.a,fields:d,size:"sm",itemsPerPage:5,pagination:!0,scopedSlots:{status:function(e){return Object(a.jsx)("td",{children:Object(a.jsx)(r.b,{color:c(e.status),children:e.status})})}}})})]})}),Object(a.jsx)(r.u,{xs:"12",lg:"6",children:Object(a.jsxs)(r.j,{children:[Object(a.jsx)(r.n,{children:"Bordered Table"}),Object(a.jsx)(r.k,{children:Object(a.jsx)(r.y,{items:n.a,fields:d,bordered:!0,itemsPerPage:5,pagination:!0,scopedSlots:{status:function(e){return Object(a.jsx)("td",{children:Object(a.jsx)(r.b,{color:c(e.status),children:e.status})})}}})})]})})]}),Object(a.jsx)(r.wb,{children:Object(a.jsx)(r.u,{children:Object(a.jsxs)(r.j,{children:[Object(a.jsx)(r.n,{children:"Combined All Table"}),Object(a.jsx)(r.k,{children:Object(a.jsx)(r.y,{items:n.a,fields:d,hover:!0,striped:!0,bordered:!0,size:"sm",itemsPerPage:10,pagination:!0,scopedSlots:{status:function(e){return Object(a.jsx)("td",{children:Object(a.jsx)(r.b,{color:c(e.status),children:e.status})})}}})})]})})}),Object(a.jsx)(r.wb,{children:Object(a.jsx)(r.u,{children:Object(a.jsxs)(r.j,{children:[Object(a.jsx)(r.n,{children:"Combined All dark Table"}),Object(a.jsx)(r.k,{children:Object(a.jsx)(r.y,{items:n.a,fields:d,dark:!0,hover:!0,striped:!0,bordered:!0,size:"sm",itemsPerPage:10,pagination:!0,scopedSlots:{status:function(e){return Object(a.jsx)("td",{children:Object(a.jsx)(r.b,{color:c(e.status),children:e.status})})}}})})]})})})]})}}}]);
//# sourceMappingURL=24.8a36d946.chunk.js.map