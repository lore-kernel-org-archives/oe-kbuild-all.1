Content-Type: multipart/mixed; boundary="===============0780213994505050842=="
MIME-Version: 1.0
From: Nathan Chancellor <nathan@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `drivers/media/platform/rockchip/rkisp1/rkisp1-capture.o' being placed in section `.eh_frame'
Date: Sat, 30 Jan 2021 13:07:51 -0700
Message-ID: <20210130200751.GA2853543@localhost>
In-Reply-To: <202101310313.LdtIZjU6-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0780213994505050842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 31, 2021 at 03:52:15AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   0e9bcda5d286f4a26a5407bb38f55c55b453ecfb
> commit: e6938cc1cb7763a363f62b78147f1f2fb972f49c media: rockchip: rkisp1:=
 destage Rockchip ISP1 driver
> date:   3 months ago
> config: arm64-randconfig-r013-20210130 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 275c=
6af7d7f1ed63a03d05b4484413e447133269)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3De6938cc1cb7763a363f62b78147f1f2fb972f49c
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout e6938cc1cb7763a363f62b78147f1f2fb972f49c
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Darm64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `driver=
s/input/input.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `driver=
s/input/input-compat.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `driver=
s/input/input-mt.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `driver=
s/input/input-poller.o' being placed in section `.eh_frame'

https://lore.kernel.org/lkml/20210130004650.2682422-1-nathan(a)kernel.org/

Cheers,
Nathan
--===============0780213994505050842==--

