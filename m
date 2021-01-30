Content-Type: multipart/mixed; boundary="===============6859363285518904709=="
MIME-Version: 1.0
From: Nathan Chancellor <nathan@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `arch/arm64/kernel/ftrace.o' being placed in section `.eh_frame'
Date: Fri, 29 Jan 2021 18:25:05 -0700
Message-ID: <20210130012505.GA2709570@localhost>
In-Reply-To: <202101300946.OtCDTkmd-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6859363285518904709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 30, 2021 at 09:21:49AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   bec4c2968fce2f44ce62d05288a633cd99a722eb
> commit: b3e5d80d0c48c0cc7bce56473672f4e6e1210910 arm64/build: Warn on orp=
han section placement
> date:   5 months ago
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
git/commit/?id=3Db3e5d80d0c48c0cc7bce56473672f4e6e1210910
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout b3e5d80d0c48c0cc7bce56473672f4e6e1210910
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Darm64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

>    aarch64-linux-gnu-ld: warning: -z norelro ignored
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `init/m=
ain.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `init/v=
ersion.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `init/d=
o_mounts.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `init/d=
o_mounts_rd.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `init/d=
o_mounts_initrd.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `init/i=
nitramfs.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `init/c=
alibrate.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `init/i=
nit_task.o' being placed in section `.eh_frame'

https://lore.kernel.org/lkml/20210130004650.2682422-1-nathan(a)kernel.org/

Cheers,
Nathan
--===============6859363285518904709==--

