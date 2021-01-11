Content-Type: multipart/mixed; boundary="===============1682645083032487137=="
MIME-Version: 1.0
From: Stafford Horne <shorne@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: drivers/soc/litex/litex_soc_ctrl.c:143:34: warning: unused variable 'litex_soc_ctrl_of_match'
Date: Mon, 11 Jan 2021 21:30:55 +0900
Message-ID: <20210111123055.GA2002709@lianli.shorne-pla.net>
In-Reply-To: <202101070445.8Kz6oJcS-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1682645083032487137==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 07, 2021 at 04:04:47AM +0800, kernel test robot wrote:
> Hi Pawel,
> =

> FYI, the error/warning still remains.
> =

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62
> commit: 22447a99c97e353bde8f90c2353873f27681d57c drivers/soc/litex: add L=
iteX SoC Controller driver
> date:   8 weeks ago
> config: x86_64-randconfig-a001-20210107 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 5c95=
1623bc8965fa1e89660f2f5f4a2944e4981a)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D22447a99c97e353bde8f90c2353873f27681d57c
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 22447a99c97e353bde8f90c2353873f27681d57c
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

> >> drivers/soc/litex/litex_soc_ctrl.c:143:34: warning: unused variable 'l=
itex_soc_ctrl_of_match' [-Wunused-const-variable]
>    static const struct of_device_id litex_soc_ctrl_of_match[] =3D {
>                                     ^
>    1 warning generated.
> =

> =

> vim +/litex_soc_ctrl_of_match +143 drivers/soc/litex/litex_soc_ctrl.c
> =

>    142	=

>  > 143	static const struct of_device_id litex_soc_ctrl_of_match[] =3D {
>    144		{.compatible =3D "litex,soc-controller"},
>    145		{},
>    146	};
>    147	=

> =


I don't use clang but GCC, and I cannot reproduce this warning.

$ make drivers/soc/litex/litex_soc_ctrl.o =

  CALL    scripts/checksyscalls.sh
  CALL    scripts/atomic/check-atomics.sh
  DESCEND  objtool
  CC      drivers/soc/litex/litex_soc_ctrl.o

Also, I can see litex_soc_ctrl_of_match is used.  I am not sure what is goi=
ng on
here.

-Stafford
--===============1682645083032487137==--

