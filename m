Content-Type: multipart/mixed; boundary="===============1785174587527177629=="
MIME-Version: 1.0
From: Arnd Bergmann <arnd@arndb.de>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 6122/12912] drivers/clk/ingenic/tcu.c:326:34: warning: unused variable 'ingenic_tcu_of_match'
Date: Fri, 29 May 2020 01:39:04 +0200
Message-ID: <CAK8P3a3N8qyyS+T5_MJZtcDdh1LSLBVjb9t3JtCVHZW8TU5y1g@mail.gmail.com>
In-Reply-To: <159070877291.69627.13269208631006456530@swboyd.mtv.corp.google.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1785174587527177629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2020 at 1:32 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting kbuild test robot (2020-05-26 10:54:49)
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   b0523c7b1c9d0edcd6c0fe6d2cb558a9ad5c60a8
> > commit: bbd7ffdbef6888459f301c5889f3b14ada38b913 [6122/12912] clk: Allo=
w the common clk framework to be selectable
> > config: mips-randconfig-r012-20200526 (attached as .config)
> > compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 33=
93cc4cebf9969db94dc424b7a2b6195589c33b)
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install mips cross compiling tool for clang build
> >         # apt-get install binutils-mips-linux-gnu
> >         git checkout bbd7ffdbef6888459f301c5889f3b14ada38b913
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
ARCH=3Dmips
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kbuild test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> >
> > >> drivers/clk/ingenic/tcu.c:326:34: warning: unused variable 'ingenic_=
tcu_of_match' [-Wunused-const-variable]
> > static const struct of_device_id ingenic_tcu_of_match[] __initconst =3D=
 {
>
> Looks like we need to add a __maybe_unused marking here. I'll do that
> now.

Either that, or mark the driver 'depends on OF', which is probably
needed anyway.

      Arnd
--===============1785174587527177629==--

