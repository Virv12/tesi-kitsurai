#import "@preview/cetz:0.4.2"

#set page(width: 8.45cm, height: auto, margin: 1pt)
#set text(size: 8pt)

#align(center)[
  #cetz.canvas({
    import cetz.draw: *

    let computer(x, y, caption: "", img: "server.svg") = {
      content((x, y), [
        #set align(center);
        #set par(spacing: 0.5em);

        #image(img, width: 0.8cm)

        #caption
      ]);
    };

    let client(x, y, caption: "Client") = {
      computer(x, y, caption: "Client", img: "client.svg");
    };

    let cluster(x, y, caption: "", router: "") = {
      rect(
        (x, y),
        (x + 3, y + 3),
        radius: 0.3cm,
        border: (color: black, width: 1pt),
      );

      computer(x + 1.5, y + 2, caption: router);
      computer(x + 1, y + 0.5);
      computer(x + 2, y + 0.5);

      content((x + 1.5, y - 0.3), align(center, caption));
    };

    cluster(0, 0, caption: "Availability Zone A");
    cluster(4, 0, caption: "Availability Zone B");
    cluster(2, 4, caption: "Availability Zone C", router: "Router");

    client(3.5, 8.2);

    line((3.5, 7.5), (3.5, 6.6), mark: (end: ">"));

    line((3.0, 6.3), (1.5, 6.3));
    line((1.5, 6.3), (1.5, 2.6), mark: (end: ">"));

    line((3.0, 6.1), (2.8, 6.1));
    line((2.8, 6.1), (2.8, 5.1), mark: (end: ">"));

    line((4.0, 6.2), (6.1, 6.2));
    line((6.1, 6.2), (6.1, 1.1), mark: (end: ">"));
  })
]
