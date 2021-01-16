am4core.useTheme(am4themes_animated);

var chart = am4core.create("chartdiv", am4charts.SankeyDiagram);
chart.hiddenState.properties.opacity = 0; // this creates initial fade-in


chart.data = [
    { from: "1", value: 3, id:"Babosa-1", color: "#c7c2c2" },
    { from: "2", value: 5, id:"Babosa-2",color: "#c7c2c2" },
    { from: "3", value: 0.5,id:"Babosa-3", color: "#c7c2c2" },
    { from: "4", value: 1.6,id:"Babosa-4", color: "#c7c2c2"},
    { from: "5", value: 3, id:"Babosa-5",color: "#c7c2c2" },
    { from: "6", value: 5, id:"Babosa-6",color: "#c7c2c2" },
    { from: "7", value: 2, id:"Babosa-7",color: "#c7c2c2" },
    { from: "8", value: 1.5, id:"Babosa-8",color: "#c7c2c2" },
    { from: "9", value: 13, id:"Babosa-9",color: "#c7c2c2" },
    { from: "10", value: 18, id:"Babosa-10",color: "#c7c2c2" },
    { from: "11", value: 3.5,id:"Babosa-11", color: "#c7c2c2" },
    { from: "12", value: 14,id:"Babosa-12", color: "#c7c2c2" },
    { from: "13", value: 4.5, id:"Babosa-13",color: "#c7c2c2" },
    { from: "14", value: 1.5, id:"Babosa-14",color: "#c7c2c2" },


    { from: "1", to: "Verde", value: 17, id:"Babosa-1",color: "#66c14f" },
    { from: "2", to: "Verde", value: 10, id:"Babosa-2",color: "#66c14f" },
    { from: "3", to: "Verde", value: 19.5, id:"Babosa-3",color: "#66c14f" },
    { from: "4", to: "Azul", value: 9, color: "#4f69c1"},
    { from: "5", to: "Anaranjado", value: 17.5, color: "#de8c1e"},
    // { from: "6", to: "Centro", value: 2 },
    { from: "7", to: "Rojo", value: 1.5, color: "#b21111" },
    { from: "8", to: "Verde", value: 18.5 },
    { from: "9", to: "Rojo", value: 4 },
    { from: "10", to: "Azul", value: 7 },
    { from: "11", to: "Anaranjado", value: 11.5 },
    { from: "12", to: "Azul", value: 6},
    { from: "13", to: "Azul", value: 18.5 },
    { from: "14", to: "Verde", value: 18.5 },

    
    

];


chart.dataFields.fromName = "from";
chart.dataFields.toName = "to";
chart.dataFields.value = "value";
chart.dataFields.color = "color";



// for right-most label to fit
chart.paddingRight = 300;
chart.paddingLeft = 30;

// Orden de los nodos
chart.sortBy = "none";



chart.links.template.propertyFields.id = "id";


// make nodes draggable
var nodeTemplate = chart.nodes.template;
nodeTemplate.draggable = true;
nodeTemplate.inert = true;
nodeTemplate.readerTitle = "Drag to rearrange or click to show&hide";
nodeTemplate.showSystemTooltip = true;
nodeTemplate.width = 30;

chart.nodes.template.width = 10;
chart.nodes.template.height = 0;


var defaultState = nodeTemplate.background.defaultState;
var defaultDropShadow = defaultState.filters.push(new am4core.DropShadowFilter());
defaultDropShadow.opacity = 0;

var hoverState = nodeTemplate.background.states.create("hover");
var hoverDropShadow = hoverState.filters.push(new am4core.DropShadowFilter());
hoverDropShadow.dy = 0;