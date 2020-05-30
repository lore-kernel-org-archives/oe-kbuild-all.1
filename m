Content-Type: multipart/mixed; boundary="===============0802718374033287571=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: kbuild-all@lists.01.org
Subject: Re: [kees:for-next/pstore 8/35] fs//pstore/inode.c:288:16: warning: no previous prototype for function 'psinfo_lock_root'
Date: Sat, 30 May 2020 10:34:47 -0700
Message-ID: <202005301034.C76C7F9@keescook>
In-Reply-To: <202005301645.xhmuTeZu%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0802718374033287571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2020 at 04:38:48PM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git fo=
r-next/pstore
> head:   3e01c33ced486b6ba180486f828b2b317c0fda01
> commit: 6bcaa233a90ba3be98a6093cf346ac51eb05258f [8/35] pstore: Add locki=
ng around superblock changes
> config: x86_64-randconfig-a015-20200529 (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 2d06=
8e534f1671459e1b135852c1b3c10502e929)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         git checkout 6bcaa233a90ba3be98a6093cf346ac51eb05258f
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> =

> >> fs//pstore/inode.c:288:16: warning: no previous prototype for function=
 'psinfo_lock_root' [-Wmissing-prototypes]
> struct dentry *psinfo_lock_root(void)
> ^
> fs//pstore/inode.c:288:1: note: declare 'static' if the function is not i=
ntended to be used outside of this translation unit
> struct dentry *psinfo_lock_root(void)
> ^
> static
> 1 warning generated.
> =

> vim +/psinfo_lock_root +288 fs//pstore/inode.c
> =

>    287	=

>  > 288	struct dentry *psinfo_lock_root(void)

Thanks! Yes, this should be static. Fixed now.

-Kees

>    289	{
>    290		struct dentry *root;
>    291	=

>    292		mutex_lock(&pstore_sb_lock);
>    293		/*
>    294		 * Having no backend is fine -- no records appear.
>    295		 * Not being mounted is fine -- nothing to do.
>    296		 */
>    297		if (!psinfo || !pstore_sb) {
>    298			mutex_unlock(&pstore_sb_lock);
>    299			return NULL;
>    300		}
>    301	=

>    302		root =3D pstore_sb->s_root;
>    303		inode_lock(d_inode(root));
>    304		mutex_unlock(&pstore_sb_lock);
>    305	=

>    306		return root;
>    307	}
>    308	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org



-- =

Kees Cook
--===============0802718374033287571==--

