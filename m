Content-Type: multipart/mixed; boundary="===============2045101322844800291=="
MIME-Version: 1.0
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [staging:staging-next 201/268] drivers/staging/rtl8723bs/core/rtw_security.c:89:6: warning: stack frame size of 1120 bytes in function 'rtw_wep_encrypt'
Date: Fri, 21 May 2021 16:26:57 +0200
Message-ID: <20210521142656.GA1409@agape.jhs>
In-Reply-To: <202105201711.QuzeTqRK-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2045101322844800291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi robot,

On Thu, May 20, 2021 at 05:03:14PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.gi=
t staging-next
> head:   b9f38e913a926b455e5048a95f53a993b515509f
> commit: 1b11e893eda0907fc9b28696271e2d9c4337e42d [201/268] staging: rtl87=
23bs: replace private arc4 encryption with in-kernel one
> config: powerpc64-randconfig-r011-20210520 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project bf9e=
f3efaa99c02e7bfc4c57207301b8de39a278)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install powerpc64 cross compiling tool for clang build
>         # apt-get install binutils-powerpc64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.=
git/commit/?id=3D1b11e893eda0907fc9b28696271e2d9c4337e42d
>         git remote add staging https://git.kernel.org/pub/scm/linux/kerne=
l/git/gregkh/staging.git
>         git fetch --no-tags staging staging-next
>         git checkout 1b11e893eda0907fc9b28696271e2d9c4337e42d
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dpowerpc64 =


can't compile this, I get the following error:

make CONFIG_OF_ALL_DTBS=3Dy CONFIG_DTC=3Dy HOSTCC=3D/home/fabio/0day/clang/=
bin/clang CC=3D/home/fabio/0day/clang/bin/clang LD=3D/home/fabio/0day/clang=
/bin/ld.lld HOSTLD=3D/home/fabio/0day/clang/bin/ld.lld AR=3D/home/fabio/0da=
y/clang/bin/llvm-ar NM=3D/home/fabio/0day/clang/bin/llvm-nm STRIP=3D/home/f=
abio/0day/clang/bin/llvm-strip OBJDUMP=3D/home/fabio/0day/clang/bin/llvm-ob=
jdump OBJSIZE=3D/home/fabio/0day/clang/bin/llvm-size READELF=3D/home/fabio/=
0day/clang/bin/llvm-readelf HOSTCXX=3D/home/fabio/0day/clang/bin/clang++ HO=
STAR=3D/home/fabio/0day/clang/bin/llvm-ar CROSS_COMPILE=3Dpowerpc-linux-gnu=
- --jobs=3D8 LLVM_IAS=3D1 ARCH=3Dpowerpc drivers/staging/rtl8723bs/
  CC      scripts/mod/empty.o
clang: error: unsupported argument '-me500' to option 'Wa,'
make[1]: *** [scripts/Makefile.build:272: scripts/mod/empty.o] Error 1
make[1]: *** Attesa per i processi non terminati....
make: *** [Makefile:1226: prepare0] Error 2

moreover I had to add LLVM_IAS=3D1, and ARCH=3Dpowerpc64 is not a valid arc=
hitecture (used powerpc instead).

Could you help me?

thank you,

fabio
--===============2045101322844800291==--

