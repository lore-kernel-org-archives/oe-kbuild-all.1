Content-Type: multipart/mixed; boundary="===============8493665910842522076=="
MIME-Version: 1.0
From: Stephen Boyd <sboyd@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 6122/12912] drivers/clk/ingenic/tcu.c:326:34: warning: unused variable 'ingenic_tcu_of_match'
Date: Thu, 28 May 2020 16:32:52 -0700
Message-ID: <159070877291.69627.13269208631006456530@swboyd.mtv.corp.google.com>
In-Reply-To: <202005270146.iZ16Zb9Q%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8493665910842522076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Quoting kbuild test robot (2020-05-26 10:54:49)
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   b0523c7b1c9d0edcd6c0fe6d2cb558a9ad5c60a8
> commit: bbd7ffdbef6888459f301c5889f3b14ada38b913 [6122/12912] clk: Allow =
the common clk framework to be selectable
> config: mips-randconfig-r012-20200526 (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 3393=
cc4cebf9969db94dc424b7a2b6195589c33b)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install mips cross compiling tool for clang build
>         # apt-get install binutils-mips-linux-gnu
>         git checkout bbd7ffdbef6888459f301c5889f3b14ada38b913
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dmips =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> =

> >> drivers/clk/ingenic/tcu.c:326:34: warning: unused variable 'ingenic_tc=
u_of_match' [-Wunused-const-variable]
> static const struct of_device_id ingenic_tcu_of_match[] __initconst =3D {

Looks like we need to add a __maybe_unused marking here. I'll do that
now.
--===============8493665910842522076==--

