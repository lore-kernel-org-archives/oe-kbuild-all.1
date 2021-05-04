Content-Type: multipart/mixed; boundary="===============3495804666182443356=="
MIME-Version: 1.0
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2 12/14] seq_file: Replace seq_escape() with inliner
Date: Tue, 04 May 2021 16:53:21 +0300
Message-ID: <YJFR0atvema45xQs@smile.fi.intel.com>
In-Reply-To: <202105042134.dgC8x5iF-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3495804666182443356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 04, 2021 at 09:17:35PM +0800, kernel test robot wrote:
> Hi Andy,
> =

> I love your patch! Perhaps something to improve:
> =

> [auto build test WARNING on linux/master]
> [also build test WARNING on linus/master v5.12 next-20210504]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:    https://github.com/0day-ci/linux/commits/Andy-Shevchenko/lib-stri=
ng_helpers-get-rid-of-ugly-_escape_mem_ascii/20210504-182828
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t 1fe5501ba1abf2b7e78295df73675423bd6899a0
> config: s390-randconfig-r033-20210504 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 8f5a=
2a5836cc8e4c1def2bdeb022e7b496623439)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install s390 cross compiling tool for clang build
>         # apt-get install binutils-s390x-linux-gnu
>         # https://github.com/0day-ci/linux/commit/047508aa8c09cb58cf304e9=
025283021731b3921
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Andy-Shevchenko/lib-string_helpe=
rs-get-rid-of-ugly-_escape_mem_ascii/20210504-182828
>         git checkout 047508aa8c09cb58cf304e9025283021731b3921
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 ARCH=3Ds390 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

> >> drivers/tty/vt/selection.c:36:9: warning: 'isspace' macro redefined [-=
Wmacro-redefined]
>    #define isspace(c)      ((c) =3D=3D ' ')

Nice!
Also for the rest of redefinitions...

I'll prepare fixes.

-- =

With Best Regards,
Andy Shevchenko


--===============3495804666182443356==--

