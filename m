Content-Type: multipart/mixed; boundary="===============6868386146258372478=="
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: kbuild-all@lists.01.org
Subject: Re: [renesas-drivers:sh-pfc-for-v5.7 13/13] drivers/pinctrl/sh-pfc/core.c:1037:1: error: expected identifier or '(' before '}' token
Date: Mon, 10 Feb 2020 19:47:22 +0100
Message-ID: <CAMuHMdWPG7=vEBFWXQ6TJ4SEXbFAn-0JcpLq2EeseX+82nPuHw@mail.gmail.com>
In-Reply-To: <202002110233.bPq1aJyL%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6868386146258372478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2020 at 7:27 PM kbuild test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-dri=
vers.git sh-pfc-for-v5.7
> head:   143a21c22d849a243c899408c1cf8bd8bdcd72cd
> commit: 143a21c22d849a243c899408c1cf8bd8bdcd72cd [13/13] pinctrl: sh-pfc:=
 checker: Add function GPIO checks
> config: i386-allyesconfig (attached as .config)
> compiler: gcc-7 (Debian 7.5.0-3) 7.5.0
> reproduce:
>         git checkout 143a21c22d849a243c899408c1cf8bd8bdcd72cd
>         # save the attached .config to linux build tree
>         make ARCH=3Di386
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> drivers/pinctrl/sh-pfc/core.c:1037:1: error: expected identifier or '(=
' before '}' token
>     }
>     ^

Thanks, bad fixup. Fixed.

Gr{oetje,eeting}s,

                        Geert

-- =

Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert(a)linux-m6=
8k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
--===============6868386146258372478==--

