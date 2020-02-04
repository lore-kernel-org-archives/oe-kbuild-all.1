Content-Type: multipart/mixed; boundary="===============7664556709200275266=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [jolsa-perf:bpf/kallsyms 2/10] include/linux/kallsyms.h:31:19: sparse: the previous one is here
Date: Tue, 04 Feb 2020 23:29:29 +0800
Message-ID: <202002042352.VjvR5Sfs%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7664556709200275266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/=
kallsyms
head:   f256d1349d6fcc0d1b049a866fb3eaedc315476f
commit: 7f6f86fa6e5ef5120d0fec0f801ac94f23889580 [2/10] bpf: Add name to st=
ruct bpf_ksym
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-154-g1dc00f87-dirty
        git checkout 7f6f86fa6e5ef5120d0fec0f801ac94f23889580
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   arch/x86/mm/init_32.c:241:19: sparse: sparse: multiple definitions for f=
unction 'is_kernel_text'
>> include/linux/kallsyms.h:31:19: sparse:  the previous one is here

vim +31 include/linux/kallsyms.h

04b8eb7a4ccd9e Sergey Senozhatsky 2017-12-06  30  =

04b8eb7a4ccd9e Sergey Senozhatsky 2017-12-06 @31  static inline int is_kern=
el_text(unsigned long addr)
04b8eb7a4ccd9e Sergey Senozhatsky 2017-12-06  32  {
04b8eb7a4ccd9e Sergey Senozhatsky 2017-12-06  33  	if ((addr >=3D (unsigned=
 long)_stext && addr <=3D (unsigned long)_etext) ||
04b8eb7a4ccd9e Sergey Senozhatsky 2017-12-06  34  	    arch_is_kernel_text(=
addr))
04b8eb7a4ccd9e Sergey Senozhatsky 2017-12-06  35  		return 1;
04b8eb7a4ccd9e Sergey Senozhatsky 2017-12-06  36  	return in_gate_area_no_m=
m(addr);
04b8eb7a4ccd9e Sergey Senozhatsky 2017-12-06  37  }
04b8eb7a4ccd9e Sergey Senozhatsky 2017-12-06  38  =


:::::: The code@line 31 was first introduced by commit
:::::: 04b8eb7a4ccd9ef9343e2720ccf2a5db8cfe2f67 symbol lookup: introduce de=
reference_symbol_descriptor()

:::::: TO: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
:::::: CC: Petr Mladek <pmladek@suse.com>

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============7664556709200275266==--

