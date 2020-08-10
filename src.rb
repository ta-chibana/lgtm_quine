i = 0;
eval$s=%w(
  s=%(
    eval$s=%w(#{$s})*"";
  );

  WS = [
    "sgO2ME;poF1=m,@XWI?<.eYg3DGA8XD.uNmm:ewRFsB5vWGs1d_m[e4XahTnQ>GMBL,fal2T*JRpKM?R+o:_GFg;rH}X9fOsBo34aPvcye-+g3P9GIh?-N46TW_0oA+a_EeUk5UkRh3;",
    "sgO2ME;poF1=m,@XWI?<.eYg3DGA8XD/>7^pU0aduW3Ct++20b=<gEwgGw5U`d+GQP>o8x,:R^,7dH.t/0N1`;=f[6du<gc|zQ,2p]7H2{|?7]9pHh-Bpu98oJywSRBAN6jIs<VesOgO",
    "sgO2ME;poF1=m,@XWI?<.eYg3DGA8XD/N9]e]93ZsJkFBqt+~dAX8w1O9a2eRsey0tIUwk5>UShe1y`M*9AOrX=[v^mP,VV;Ct.T*vIu4K_e}wqRrLn^Yws7LELA^o9ZiWJMcegE=lUh",
    "sgO2ME;poF1=m,@XWI?<.eYg3DGA8XDoloMVV3`>Ae-{,w>-;X|~CVeyYWS,762;VI>swMN5CNO}=@>J`o:Nzv*1|[KH;D=SCD?~upxiJLZJKhnXoG3F7uEWMOkw+ueY@G0@K|mWbcC`"
  ];
  R = 19;
  C = 47;
  P = '1' * C;

  print("\e[2J\e[1;1H");
  WS.each { |ws|
    n = ws;
    f = 0;
    n.bytes { |m| f = f * 84 + (m - 8) % 85 };

    st = 0;
    ps = false;
    sep = 38.chr;

    g = -> l {
      cc = l.count('1');
      cs = '';
      nst = 0;
      ft = -> {
        h = s.slice(st..-1);
        nst = st + cc - s.size;
        if (!ps);
          s = '%q' + sep + s;
          ps = true;
        end;
        t = s.slice(0, nst);
        cs = h + t;
      };
      ff = -> {
        cs = s.slice(st, cc);
        nst = st + cc;
      };
      (st + cc > s.size) ? ft.call() : ff.call();
      st = nst;
      l.split('').reduce('') { |a, c|
        a + ((c == '1') ? cs.slice!(0) : 32.chr)
      }
    };

    4.times { puts(g[P]) };
    R.times { |y|
      puts(g[(0..C - 1).map { |x| f[x + y * C] }.join]);
    };
    puts(g[P], g[P], g[P], g[P[0..-2]] + sep);
    sleep(0.5);
    print("\e[2J\e[1;1H");
  }
)*"";
