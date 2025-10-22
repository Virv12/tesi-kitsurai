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

    let cluster(x, y, letter: "", router: false) = {
      rect(
        (x, y),
        (x + 3, y + 3),
        radius: 0.3cm,
        border: (color: black, width: 1pt),
      );

      let router = if router { " (Router)" } else { "" };
      computer(x + 1.5, y + 2, caption: "Node " + letter + "1" + router);
      computer(x + 0.9, y + 0.7, caption: "Node " + letter + "2");
      computer(x + 2.1, y + 0.7, caption: "Node " + letter + "3");

      content((x + 1.5, y - 0.3), align(center)[ Availability Zone #letter ]);
    };

    cluster(0, 0, letter: "A");
    cluster(4, 0, letter: "B");
    cluster(2, 4, letter: "C", router: true);

    client(3.5, 8.2);

    set-style(
      stroke: (dash: "dashed"),
      mark: (stroke: (dash: "solid")),
    );

    line((3.5, 7.5), (3.5, 6.6), mark: (start: ">", end: ">"));

    line((3.0, 6.3), (1.5, 6.3), mark: (start: ">"));
    line((1.5, 6.3), (1.5, 2.6), mark: (end: ">"));

    line((3.0, 6.1), (2.1, 6.1), mark: (start: ">"));
    line((2.1, 6.1), (2.1, 4.6));
    line((2.1, 4.6), (2.5, 4.6), mark: (end: ">"));

    line((4.0, 6.2), (6.1, 6.2), mark: (start: ">"));
    line((6.1, 6.2), (6.1, 1.3), mark: (end: ">"));
  })
]
