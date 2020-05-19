Content-Type: multipart/mixed; boundary="===============9123792561306363229=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: kbuild-all@lists.01.org
Subject: Re: [tip:x86/mm 1/23] arch/x86/mm/init.c:75:6: warning: no previous prototype for function 'x86_has_pat_wp'
Date: Tue, 19 May 2020 22:55:05 +0200
Message-ID: <20200519205505.GD444@zn.tnic>
In-Reply-To: <202005200123.gFjGzJEH%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9123792561306363229==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2020 at 01:51:25AM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/mm
> head:   bd1de2a7aace4d1d312fb1be264b8fafdb706208
> commit: 1f6f655e01adebf5bd5e6c3da2e843c104ded051 [1/23] x86/mm: Add a x86=
_has_pat_wp() helper
> config: x86_64-randconfig-r012-20200519 (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 135b=
877874fae96b4372c8a3fbfaa8ff44ff86e3)
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         git checkout 1f6f655e01adebf5bd5e6c3da2e843c104ded051
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> =

> >> arch/x86/mm/init.c:75:6: warning: no previous prototype for function '=
x86_has_pat_wp' [-Wmissing-prototypes]
> bool x86_has_pat_wp(void)
> ^

Triggers with gcc too:

make W=3D1 arch/x86/mm/init.o

...

arch/x86/mm/init.c:81:6: warning: no previous prototype for =E2=80=98x86_ha=
s_pat_wp=E2=80=99 [-Wmissing-prototypes]
   81 | bool x86_has_pat_wp(void)
      |      ^~~~~~~~~~~~~~


-Wmissing-prototypes is default off, though, dunno why clang 11 has it
on.

Anyway, something for Benni to fix. CCed and leaving the rest for him as
reference.

> arch/x86/mm/init.c:75:1: note: declare 'static' if the function is not in=
tended to be used outside of this translation unit
> bool x86_has_pat_wp(void)
> ^
> static
> arch/x86/mm/init.c:866:13: warning: no previous prototype for function 'm=
em_encrypt_free_decrypted_mem' [-Wmissing-prototypes]
> void __weak mem_encrypt_free_decrypted_mem(void) { }
> ^
> arch/x86/mm/init.c:866:1: note: declare 'static' if the function is not i=
ntended to be used outside of this translation unit
> void __weak mem_encrypt_free_decrypted_mem(void) { }
> ^
> static
> 2 warnings generated.
> =

> vim +/x86_has_pat_wp +75 arch/x86/mm/init.c
> =

>     73	=

>     74	/* Check that the write-protect PAT entry is set for write-protect=
 */
>   > 75	bool x86_has_pat_wp(void)
>     76	{
>     77		return __pte2cachemode_tbl[_PAGE_CACHE_MODE_WP] =3D=3D _PAGE_CACH=
E_MODE_WP;
>     78	}
>     79	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org



-- =

Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
--===============9123792561306363229==--

