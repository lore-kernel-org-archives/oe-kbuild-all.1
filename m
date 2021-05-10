Content-Type: multipart/mixed; boundary="===============6656786762811357779=="
MIME-Version: 1.0
From: Arnd Bergmann <arnd@arndb.de>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v5 3/3] asm-generic/io.h: warn in inb() and friends with undefined PCI_IOBASE
Date: Mon, 10 May 2021 15:47:29 +0200
Message-ID: <CAK8P3a1uTgFyPL+m2Ts3vigVc1V=BNLhMpF5UtJdnd+-FQy2_g@mail.gmail.com>
In-Reply-To: <202105102014.AoEdJzot-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6656786762811357779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 10, 2021 at 3:08 PM kernel test robot <lkp@intel.com> wrote:
>
>    In file included from include/linux/kernel.h:10,
>                     from drivers/media/rc/nuvoton-cir.c:25:
>    include/linux/scatterlist.h: In function 'sg_set_buf':
>    include/asm-generic/page.h:89:50: warning: ordered comparison of point=
er with null pointer [-Wextra]
>       89 | #define virt_addr_valid(kaddr) (((void *)(kaddr) >=3D (void *)=
PAGE_OFFSET) && \
>          |                                                  ^~
>    include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
>       78 | # define unlikely(x) __builtin_expect(!!(x), 0)
>          |                                          ^
>    include/linux/scatterlist.h:137:2: note: in expansion of macro 'BUG_ON'
>      137 |  BUG_ON(!virt_addr_valid(buf));
>          |  ^~~~~~
>    include/linux/scatterlist.h:137:10: note: in expansion of macro 'virt_=
addr_valid'
>      137 |  BUG_ON(!virt_addr_valid(buf));
>          |          ^~~~~~~~~~~~~~~
>    drivers/media/rc/nuvoton-cir.c: In function 'nvt_get_rx_ir_data':
> >> drivers/media/rc/nuvoton-cir.c:761:15: warning: iteration 32 invokes u=
ndefined behavior [-Waggressive-loop-optimizations]
>      761 |   nvt->buf[i] =3D nvt_cir_reg_read(nvt, CIR_SRXFIFO);

I think you can ignore this one, it's a preexisting issue with this
driver that gets uncovered by your patch: if "fifocount" is read from
a broken device as 0xff, the loop causes a buffer overflow.

The code is already unreachable because the interrupt handler
will have aborted already, so the compiler's dead code elimination
should have shut up that warning, but adding a range check
before the loop would address this as well.

As far as I can tell, this warning only shows up when building with
"make W=3D1".

       Arnd
--===============6656786762811357779==--

