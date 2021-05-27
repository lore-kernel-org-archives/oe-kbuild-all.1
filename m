Content-Type: multipart/mixed; boundary="===============5080057596582016463=="
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
To: kbuild-all@lists.01.org
Subject: Re: [pcmoore-selinux:working-io_uring 9/9] security/smack/smack_lsm.c:4702:5: warning: no previous prototype for function 'smack_uring_override_creds'
Date: Thu, 27 May 2021 11:29:08 -0400
Message-ID: <CAHC9VhRy=oD=B9G_ZZejPX0dL1+vsyLkYLs59vj-SJoeVMs53g@mail.gmail.com>
In-Reply-To: <202105270909.1fgRW8Wk-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5080057596582016463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2021 at 9:51 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.g=
it working-io_uring
> head:   1f25193a3f5495eefbc9826b1de1a008a2439351
> commit: 1f25193a3f5495eefbc9826b1de1a008a2439351 [9/9] Smack: Brutalist i=
o_uring support with debug
> config: x86_64-randconfig-r013-20210526 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 9915=
5e913e9bad5f7f8a247f8bb3a3ff3da74af1)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux=
.git/commit/?id=3D1f25193a3f5495eefbc9826b1de1a008a2439351
>         git remote add pcmoore-selinux https://git.kernel.org/pub/scm/lin=
ux/kernel/git/pcmoore/selinux.git
>         git fetch --no-tags pcmoore-selinux working-io_uring
>         git checkout 1f25193a3f5495eefbc9826b1de1a008a2439351
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> security/smack/smack_lsm.c:4702:5: warning: no previous prototype for =
function 'smack_uring_override_creds' [-Wmissing-prototypes]
>    int smack_uring_override_creds(const struct cred *new)
>        ^
>    security/smack/smack_lsm.c:4702:1: note: declare 'static' if the funct=
ion is not intended to be used outside of this translation unit
>    int smack_uring_override_creds(const struct cred *new)
>    ^
>    static
> >> security/smack/smack_lsm.c:4739:5: warning: no previous prototype for =
function 'smack_uring_sqpoll' [-Wmissing-prototypes]
>    int smack_uring_sqpoll(void)
>        ^
>    security/smack/smack_lsm.c:4739:1: note: declare 'static' if the funct=
ion is not intended to be used outside of this translation unit
>    int smack_uring_sqpoll(void)
>    ^
>    static
>    2 warnings generated.

FYI, Casey I took the liberty of making the Smack functions static (I
had made the same mistake with the SELinux code).

-- =

paul moore
www.paul-moore.com
--===============5080057596582016463==--

