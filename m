Content-Type: multipart/mixed; boundary="===============0394357499500383882=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 11894/13554] arch/riscv/mm/ptdump.c:255:17: error: initialization of 'void (*)(struct ptdump_state *, long unsigned int, int, u64)' {aka 'void (*)(struct ptdump_state *, long unsigned int, int, long long unsigned int)'} from incompatible pointer type 'void (*)(struct ptdump_state *, long unsigned int, int, long unsigned int)'
Date: Fri, 29 May 2020 11:22:12 -0700
Message-ID: <20200529112212.42e84af2ba0f1030b33658dd@linux-foundation.org>
In-Reply-To: <202005300054.IITfkKUU%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0394357499500383882==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 30 May 2020 00:14:57 +0800 kbuild test robot <lkp@intel.com> wrot=
e:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   ff387fc20c697cdc887b2abf7ef494e853795a2f
> commit: f6396a9ececda3fa26571ccd38167373db1d2ec3 [11894/13554] mm: ptdump=
: expand type of 'val' in note_page()
> config: riscv-allyesconfig (attached as .config)
> compiler: riscv64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout f6396a9ececda3fa26571ccd38167373db1d2ec3
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Driscv =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>, old ones prefixed by <<):
> =

> arch/riscv/mm/ptdump.c: In function 'ptdump_walk':
> >> arch/riscv/mm/ptdump.c:255:17: error: initialization of 'void (*)(stru=
ct ptdump_state *, long unsigned int,  int,  u64)' {aka 'void (*)(struct pt=
dump_state *, long unsigned int,  int,  long long unsigned int)'} from inco=
mpatible pointer type 'void (*)(struct ptdump_state *, long unsigned int,  =
int,  long unsigned int)' [-Werror=3Dincompatible-pointer-types]
> 255 |    .note_page =3D note_page,

Thanks.

--- a/arch/riscv/mm/ptdump.c~mm-ptdump-expand-type-of-val-in-note_page-fix
+++ a/arch/riscv/mm/ptdump.c
@@ -204,7 +204,7 @@ static void note_prot_wx(struct pg_state
 }
 =

 static void note_page(struct ptdump_state *pt_st, unsigned long addr,
-		      int level, unsigned long val)
+		      int level, u64 val)
 {
 	struct pg_state *st =3D container_of(pt_st, struct pg_state, ptdump);
 	u64 pa =3D PFN_PHYS(pte_pfn(__pte(val)));
_

--===============0394357499500383882==--

