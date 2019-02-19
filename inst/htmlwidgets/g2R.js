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
        window.x = x

        if(x.view !== undefined) {
          for (let i in x.view) {
            console.log(x.view[i].options)

            i = chart.view({
              data: x.data,
              options: x.view[i].options
            })

          }
        }

        // // Read in dataset
        // chart.source(x.data)

        // Define views

        // Define geometries

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

