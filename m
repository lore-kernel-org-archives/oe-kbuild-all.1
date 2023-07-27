Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3B2FBF9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 09:25:47 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d16639e16e6so630996276.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 02:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690449946; x=1691054746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FM7dbmsUNQ9ephJiHm7mnMG3bHxM2q6uJO1Stbh0MgY=;
        b=lVB3E3dsB+i9axdSdSHQ03OHkQsXhPl5UjJEjhsEw8+QKnWrRoRf8gH17qmRlFuO95
         hngX0kfBFmaxVakmxf6a2om/4N2FN58VZ+1Lod/bjNN7m+hppH40P97bAGDYJgJo7z7U
         S+jkjTXGkLdHZG6oqiM3iqRyV4Y6sP5199sb2xdsqiE7PuQRMc7vOAf66GqJLtBzQICz
         8eUoNAn5TUfkPiyFMuZy3hnUVyKKFls5HprMPkR6SPrmeV7IQaT/MS9I2IhSQHc/E9eH
         eL1JSEOFwmSscaMooCShj0fU3er1jWiOkxUG7PLNmoVhCc/1caLMNnHABbHn04ERQQuN
         GU6w==
X-Gm-Message-State: ABy/qLa6NEG1GdZs6HFm3oqGhXR0MstvT8MEUYWIREf43p4OsY0OCdKG
	GjVybBaJF8AR9ZKxXQNHVaLAUwCIdjQRDA==
X-Google-Smtp-Source: APBJJlEBPabXYZHq03G/r0sTwBfF6+jzicT5qu0tv+/ZS6mijmvWtQXe1tJYJwele9AndJFSZGrCGA==
X-Received: by 2002:a25:5d0f:0:b0:d23:829e:cd53 with SMTP id r15-20020a255d0f000000b00d23829ecd53mr742629ybb.20.1690449946100;
        Thu, 27 Jul 2023 02:25:46 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id v125-20020a25c583000000b00d0b6ca620besm200387ybe.30.2023.07.27.02.25.44
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 02:25:45 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-579de633419so7924887b3.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 02:25:44 -0700 (PDT)
X-Received: by 2002:a25:db04:0:b0:d18:1fbf:c11d with SMTP id
 g4-20020a25db04000000b00d181fbfc11dmr3898899ybf.47.1690449944618; Thu, 27 Jul
 2023 02:25:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2307270709580.3082@hadrien>
 <OS0PR01MB59227764417EB66A9CBDE69F8601A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <bf5c77ec-fc9f-419a-d0e8-15ad54df2fb@inria.fr> <OS0PR01MB592291F0C8AE19F7118DCF0F8601A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592291F0C8AE19F7118DCF0F8601A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Jul 2023 11:25:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXhS-u-n+ZThnNM6w81rc0LsOUyaJ5UxXwbC44e7NFw8w@mail.gmail.com>
Message-ID: <CAMuHMdXhS-u-n+ZThnNM6w81rc0LsOUyaJ5UxXwbC44e7NFw8w@mail.gmail.com>
Subject: Re: [linux-next:master 2742/4710] drivers/clk/clk-versaclock3.c:404:2-8:
 WARNING: do_div() does a 64-by-32 division, please consider using div64_ul
 instead. (fwd)
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Julia Lawall <julia.lawall@inria.fr>, 
	Linux Memory Management List <linux-mm@kvack.org>, Stephen Boyd <sboyd@kernel.org>, 
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Thu, Jul 27, 2023 at 11:19=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> > versaclock3.c:404:2-8: WARNING: do_div() does a 64-by-32 division, plea=
se
> > consider using div64_ul instead. (fwd)
> >
> > On Thu, 27 Jul 2023, Biju Das wrote:
> > > The reproduce link is not working for me.
> > >
> > > Can you please provide instruction to reproduce this issue?
> >
> > I don't think it's intended to be reproduced.  The issue is just that a
> > long value is being passed to an integer that is 32 bit.  If the long
> > value will never be very big, then you can just ignore the warning.
>
> The rate values are well below max 32 bit, 4294967296. So I guess, it is =
ok.

The type of the parent_rate in/output parameter of clk_ops.round_rate()
is unsigned long.  Hence you should use div64_ul().

> > > > versaclock3.c:404:2-8: WARNING: do_div() does a 64-by-32 division,
> > > > please consider using div64_ul instead. (fwd)
> > > >
> > > >
> > > >
> > > > ---------- Forwarded message ----------
> > > > Date: Thu, 27 Jul 2023 08:50:37 +0800
> > > > From: kernel test robot <lkp@intel.com>
> > > > To: oe-kbuild@lists.linux.dev
> > > > Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> > > > Subject: [linux-next:master 2742/4710] drivers/clk/clk-
> > > > versaclock3.c:404:2-8:
> > > >     WARNING: do_div() does a 64-by-32 division,
> > > >     please consider using div64_ul instead.
> > > >
> > > > BCC: lkp@intel.com
> > > > CC: oe-kbuild-all@lists.linux.dev
> > > > CC: Linux Memory Management List <linux-mm@kvack.org>
> > > > TO: Biju Das <biju.das.jz@bp.renesas.com>
> > > > CC: Stephen Boyd <sboyd@kernel.org>
> > > >
> > > > tree:
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a ne=
w
> > > > version of the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> > > > | Closes:
> > > %2BsY49B78%3D&reserved=3D0
> > > >
> > > > cocci warnings: (new ones prefixed by >>)
> > > > >> drivers/clk/clk-versaclock3.c:404:2-8: WARNING: do_div() does a
> > > > >> 64-
> > > > by-32 division, please consider using div64_ul instead.
> > > >
> > > > vim +404 drivers/clk/clk-versaclock3.c
> > > >
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  382
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  383  static long
> > > > vc3_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  384
> > unsigned
> > > > long *parent_rate)
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  385  {
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  386   struct vc3_hw_data *vc3 =
=3D
> > > > container_of(hw, struct vc3_hw_data, hw);
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  387   const struct vc3_pll_data
> > *pll
> > > > =3D vc3->data;
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  388   u64 div_frc;
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  389
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  390   if (rate < pll->vco_min)
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  391           rate =3D pll->vco=
_min;
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  392   if (rate > pll->vco_max)
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  393           rate =3D pll->vco=
_max;
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  394
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  395   vc3->div_int =3D rate /
> > > > *parent_rate;
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  396
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  397   if (pll->num =3D=3D VC3_P=
LL2)
> > {
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  398           if (vc3->div_int =
>
> > 0x7ff)
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  399                   rate =3D
> > *parent_rate
> > > > * 0x7ff;
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  400
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  401           /* Determine best
> > > > fractional part, which is 16 bit wide */
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  402           div_frc =3D rate =
%
> > > > *parent_rate;
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  403           div_frc *=3D BIT(=
16) -
> > 1;
> > > > 6e9aff555db7b6 Biju Das 2023-07-05 @404           do_div(div_frc,
> > > > *parent_rate);
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  405
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  406           vc3->div_frc =3D
> > > > (u32)div_frc;
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  407           rate =3D (*parent=
_rate
> > *
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  408                   (vc3->div=
_int
> > *
> > > > VC3_2_POW_16 + div_frc) / VC3_2_POW_16);
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  409   } else {
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  410           rate =3D *parent_=
rate
> > *
> > > > vc3->div_int;
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  411   }
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  412
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  413   return rate;
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  414  }
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  415
> > > >
> > > > --
> > > > 0-DAY CI Kernel Test Service
> > >



--=20
Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
