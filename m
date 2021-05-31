Content-Type: multipart/mixed; boundary="===============1810135799729182567=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@suse.de>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 5596/5886] arch/x86/include/asm/fixmap.h:103:48: error: use of undeclared identifier 'NR_CPUS'
Date: Mon, 31 May 2021 10:39:17 +0100
Message-ID: <20210531093917.GL3672@suse.de>
In-Reply-To: <202105301909.iEwOXNWt-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1810135799729182567==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 30, 2021 at 07:58:14PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   3e029760e6f8ce90c122c267a039ae73b3f1f5a4
> commit: 366e9aec4a22d77b869f1b7641a74fdd96f02b4c [5596/5886] mm/early_ior=
emap: add prototype for early_memremap_pgprot_adjust
> config: x86_64-randconfig-a006-20210530 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project bc67=
99f2f79f0ae87e9f1ebf9d25ba799fbd25a9)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git/commit/?id=3D366e9aec4a22d77b869f1b7641a74fdd96f02b4c
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/ke=
rnel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 366e9aec4a22d77b869f1b7641a74fdd96f02b4c
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64 =

> =


Hi Andrew,

Can you please drop the patch
mm-early_ioremap-add-prototype-for-early_memremap_pgprot_adjust.patch?

-- =

Mel Gorman
SUSE Labs
--===============1810135799729182567==--

