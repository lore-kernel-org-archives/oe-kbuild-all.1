Content-Type: multipart/mixed; boundary="===============4446345385832452583=="
MIME-Version: 1.0
From: Jiri Olsa <jolsa@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [jolsa-perf:bpf/kallsyms 2/10] arch/x86/mm/init_32.c:241:19: error: redefinition of 'is_kernel_text'
Date: Thu, 06 Feb 2020 20:02:36 +0100
Message-ID: <20200206190236.GC1669706@krava>
In-Reply-To: <202002040830.4CQKC9fi%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4446345385832452583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 04, 2020 at 08:28:10AM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bp=
f/kallsyms
> head:   f256d1349d6fcc0d1b049a866fb3eaedc315476f
> commit: 7f6f86fa6e5ef5120d0fec0f801ac94f23889580 [2/10] bpf: Add name to =
struct bpf_ksym
> config: i386-tinyconfig (attached as .config)
> compiler: gcc-7 (Debian 7.5.0-3) 7.5.0
> reproduce:
>         git checkout 7f6f86fa6e5ef5120d0fec0f801ac94f23889580
>         # save the attached .config to linux build tree
>         make ARCH=3Di386 =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

> >> arch/x86/mm/init_32.c:241:19: error: redefinition of 'is_kernel_text'
>     static inline int is_kernel_text(unsigned long addr)
>                       ^~~~~~~~~~~~~~
>    In file included from include/linux/bpf.h:21:0,
>                     from include/linux/bpf-cgroup.h:5,
>                     from include/linux/cgroup-defs.h:22,
>                     from include/linux/cgroup.h:28,
>                     from include/linux/hugetlb.h:9,
>                     from arch/x86/mm/init_32.c:18:
>    include/linux/kallsyms.h:31:19: note: previous definition of 'is_kerne=
l_text' was here
>     static inline int is_kernel_text(unsigned long addr)
>                       ^~~~~~~~~~~~~~
> =

> vim +/is_kernel_text +241 arch/x86/mm/init_32.c
> =

> ^1da177e4c3f41 arch/i386/mm/init.c   Linus Torvalds  2005-04-16  240  =

> ^1da177e4c3f41 arch/i386/mm/init.c   Linus Torvalds  2005-04-16 @241  sta=
tic inline int is_kernel_text(unsigned long addr)
> ^1da177e4c3f41 arch/i386/mm/init.c   Linus Torvalds  2005-04-16  242  {
> 5bd5a452662bc3 arch/x86/mm/init_32.c Matthieu CASTET 2010-11-16  243  	if=
 (addr >=3D (unsigned long)_text && addr <=3D (unsigned long)__init_end)
> ^1da177e4c3f41 arch/i386/mm/init.c   Linus Torvalds  2005-04-16  244  		r=
eturn 1;
> ^1da177e4c3f41 arch/i386/mm/init.c   Linus Torvalds  2005-04-16  245  	re=
turn 0;
> ^1da177e4c3f41 arch/i386/mm/init.c   Linus Torvalds  2005-04-16  246  }
> ^1da177e4c3f41 arch/i386/mm/init.c   Linus Torvalds  2005-04-16  247  =

> =

> :::::: The code at line 241 was first introduced by commit
> :::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2
> =

> :::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
> :::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>
> =

> ---
> 0-DAY kernel test infrastructure                 Open Source Technology C=
enter
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corp=
oration

yep, reproduced.. will add the fix with the Reported-by tag ;-)

thanks a lot!
jirka

--===============4446345385832452583==--

