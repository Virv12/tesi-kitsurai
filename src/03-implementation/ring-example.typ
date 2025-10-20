#import "@preview/cetz:0.4.2"

#set page(width: 8.45cm, height: auto, margin: 1pt)
#set text(size: 8pt)

#let vals = (0, 1, 2, 0, 1, 3, 0, 1, 4, 0, 2, 4)

#align(center)[
  #cetz.canvas({
    import cetz.draw: *

    let R = 2.5
    let r = .30

    circle((0, 0), radius: R, stroke: 1pt)

    let n = vals.len()
    for (i, v) in vals.enumerate() {
      let a = 90deg - 360deg * i / n
      let p = (R * calc.cos(a), R * calc.sin(a))

      let (b, s) = if 2 <= i and i < 5 {
        ("bold", 1.2pt)
      } else {
        ("regular", 1pt)
      };

      circle(p, radius: r, fill: white, stroke: s)
      content(p, text(weight: b)[#v])
    }

    let a = 90deg - 45deg;
    let x = R * calc.cos(a);
    let y = R * calc.sin(a);
    line(
      (x + 1, y + 1),
      (x + 0.5, y - 0.1),
      mark: (end: ">")
    );
    content(
      (x + 1.2, y + 1.2),
      [ Key's starting position ]
    );

    let Ra = R * 0.9
    arc(
      (Ra * calc.cos(-50deg) + 1, Ra * calc.sin(-50deg)),
      start: -50deg,
      stop: 50deg,
      radius: Ra,
    );
  })
]
