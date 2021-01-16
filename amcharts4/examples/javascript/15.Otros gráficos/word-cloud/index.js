am4core.useTheme(am4themes_animated);
var chart = am4core.create("chartdiv", am4plugins_wordCloud.WordCloud);
var series = chart.series.push(new am4plugins_wordCloud.WordCloudSeries());

series.accuracy = 1;
series.step = 15;
series.rotationThreshold = 0.7;
series.maxCount = 100;
series.minWordLength = 1;
series.maxFontSize = am4core.percent(30);

series.text = "Estupendo Fantabuloso Espantaculitico Intenso Distinto Novedoso Interesante Interactivo Práctico Visual Biológico Creativo Ilustrativo Dinámico Interesante Dinámico Variado Integrativo Funcional Básico Participativo Digital Útil Productivo Bueno Bueno EnormePotencial Actual Intenso Productivo Útil Práctico Innovador Informativo Didáctico Retador Práctico Interactivo Creativo Completo Congruente Satisfactorio "; 
