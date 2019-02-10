HTMLWidgets.widget({

  name: 'g2R',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance



    return {

      renderValue: function(x) {

        console.log(x);

        const container = document.getElementById(el.id);

        const options = x.options

        // Initialize chart
        const chart = new G2.Chart({
          container: container,
          forceFit: x.chart.forcefit,
          width: x.chart.width,
          height: x.chart.height,
          animate: x.chart.animate,
          theme: x.chart.theme,
          renderer: x.chart.renderer,
          data: x.data,
          options: options
        });

         console.log(chart);

        window.y = chart;
        //coord = chart.coord(x.coord.type)
        // if(x.coord.rotate !== undefined) {
        //   coord.rotate(x.coord.rotate)
        // }
        // if(x.coord.scale !== undefined) {
        //   coord.scale(x.coord.scale)
        // }
        // console.log(x.coord.reflect)
        // if(x.coord.reflect !== "") {
        //   coord.reflect(x.coord.reflect)
        // }
        // console.log(x.coord.transpose)
        // if(x.coord.transpose === true) {
        //   coord.transpose()
        // }


        // // Read in dataset
        // chart.source(x.data)


        // // Define geometries
        // geom = chart[x.geom.geom]()
        // geom.position(x.geom.x + '*' + x.geom.y);
        // geom.color(x.geom.color)

        // if(x.geom.size !== undefined) {
        //   geom.size(x.geom.size)
        // }
        // if(x.geom.shape !== undefined) {
        //    geom.shape(x.geom.shape)
        //  }
        // if(x.geom.opacity !== undefined) {
        //   geom.opacity(x.geom.opacity)
        // }
        // if(x.geom.adjust !== undefined) {
        //   geom.adjust(x.geom.adjust)
        // }
        // if(x.geom.tooltip !== undefined) {
        //   geom.tooltip(x.geom.tooltip)
        // }
        // if(x.geom.label !== undefined) {
        //   geom.label(x.geom.label)
        // }
        // if(x.geom.style !== undefined) {
        //   geom.style(x.geom.style)
        // }
        // if(x.geom.select !== undefined) {
        //   geom.select(x.geom.select)
        // }



        //Define Scale

        //Define Axis

        chart.render();

        //chart.coord().transpose();


      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});

