Content-Type: multipart/mixed; boundary="===============5036312871790739182=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [peterz-queue:locking/kcsan 14/21] arch/arm64/mm/fault.c:144:15: sparse: sparse: cast to non-scalar
Date: Fri, 15 May 2020 21:25:19 +0800
Message-ID: <202005152114.lc93pPDT%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5036312871790739182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git lo=
cking/kcsan
head:   ffed638b6a2180da8fd002a46632d746af72b299
commit: 7b364f0949ae2dd205d5e9afa4b82ee17030d928 [14/21] READ_ONCE: Drop po=
inter qualifiers when reading from scalar types
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-193-gb8fad4bc-dirty
        git checkout 7b364f0949ae2dd205d5e9afa4b82ee17030d928
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> arch/arm64/mm/fault.c:144:15: sparse: sparse: cast to non-scalar
>> arch/arm64/mm/fault.c:144:15: sparse: sparse: cast from non-scalar
   arch/arm64/mm/fault.c:156:23: sparse: sparse: cast to non-scalar
   arch/arm64/mm/fault.c:156:23: sparse: sparse: cast from non-scalar
   arch/arm64/mm/fault.c:161:24: sparse: sparse: cast to non-scalar
   arch/arm64/mm/fault.c:161:24: sparse: sparse: cast from non-scalar
   arch/arm64/mm/fault.c:162:23: sparse: sparse: cast to non-scalar
   arch/arm64/mm/fault.c:162:23: sparse: sparse: cast from non-scalar
   arch/arm64/mm/fault.c:167:24: sparse: sparse: cast to non-scalar
   arch/arm64/mm/fault.c:167:24: sparse: sparse: cast from non-scalar
   arch/arm64/mm/fault.c:168:23: sparse: sparse: cast to non-scalar
   arch/arm64/mm/fault.c:168:23: sparse: sparse: cast from non-scalar
   arch/arm64/mm/fault.c:191:21: sparse: sparse: cast to non-scalar
   arch/arm64/mm/fault.c:191:21: sparse: sparse: cast from non-scalar
   arch/arm64/mm/fault.c:406:24: sparse: sparse: incorrect type in return e=
xpression (different base types) @@    expected restricted vm_fault_t @@   =
 got t_t @@
   arch/arm64/mm/fault.c:406:24: sparse:    expected restricted vm_fault_t
   arch/arm64/mm/fault.c:406:24: sparse:    got int
   arch/arm64/mm/fault.c:414:32: sparse: sparse: incorrect type in return e=
xpression (different base types) @@    expected restricted vm_fault_t @@   =
 got t_t @@
   arch/arm64/mm/fault.c:414:32: sparse:    expected restricted vm_fault_t
   arch/arm64/mm/fault.c:414:32: sparse:    got int
   arch/arm64/mm/fault.c:416:32: sparse: sparse: incorrect type in return e=
xpression (different base types) @@    expected restricted vm_fault_t @@   =
 got t_t @@
   arch/arm64/mm/fault.c:416:32: sparse:    expected restricted vm_fault_t
   arch/arm64/mm/fault.c:416:32: sparse:    got int
   arch/arm64/mm/fault.c:424:24: sparse: sparse: incorrect type in return e=
xpression (different base types) @@    expected restricted vm_fault_t @@   =
 got t_t @@
   arch/arm64/mm/fault.c:424:24: sparse:    expected restricted vm_fault_t
   arch/arm64/mm/fault.c:424:24: sparse:    got int
   arch/arm64/mm/fault.c:534:13: sparse: sparse: restricted vm_fault_t degr=
ades to integer
   arch/arm64/mm/fault.c:534:13: sparse: sparse: restricted vm_fault_t degr=
ades to integer
   arch/arm64/mm/fault.c:596:39: sparse: sparse: restricted vm_fault_t degr=
ades to integer
--
>> arch/arm64/mm/mmu.c:146:16: sparse: sparse: cast to non-scalar
>> arch/arm64/mm/mmu.c:146:16: sparse: sparse: cast from non-scalar
>> arch/arm64/mm/mmu.c:146:16: sparse: sparse: cast to non-scalar
>> arch/arm64/mm/mmu.c:146:16: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:148:33: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:148:33: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:172:21: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:172:21: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:180:23: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:180:23: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:207:16: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:207:16: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:207:16: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:207:16: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:209:33: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:209:33: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:243:21: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:243:21: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:254:23: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:254:23: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:293:21: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:293:21: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:300:23: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:300:23: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:306:33: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:306:33: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:647:17: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:647:17: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:702:22: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:702:22: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:706:15: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:706:15: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:713:16: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:713:16: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:714:15: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:714:15: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:721:16: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:721:16: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:722:15: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:722:15: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:766:24: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:766:24: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:767:23: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:767:23: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:787:24: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:787:24: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:788:23: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:788:23: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:820:23: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:820:23: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:852:23: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:852:23: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:870:23: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:870:23: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:887:24: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:887:24: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:888:23: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:888:23: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:905:16: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:905:16: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:907:22: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:907:22: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:925:24: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:925:24: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:926:23: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:926:23: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:945:16: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:945:16: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:947:22: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:947:22: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:966:23: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:966:23: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:987:22: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:987:22: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:1006:23: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:1006:23: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:1024:23: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:1024:23: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:1129:15: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:1129:15: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:1144:13: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:1144:13: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:1298:14: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:1298:14: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:1306:14: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:1306:14: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:1317:15: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:1317:15: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:1324:17: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:1324:17: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:1338:15: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:1338:15: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:1345:17: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:1345:17: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:1093:21: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:1093:21: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:1103:21: sparse: sparse: cast to non-scalar
   arch/arm64/mm/mmu.c:1103:21: sparse: sparse: cast from non-scalar
   arch/arm64/mm/mmu.c:1107:16: sparse: sparse: cast to non-scalar
>> arch/arm64/mm/mmu.c:1107:16: sparse: sparse: too many warnings
--
>> arch/arm64/mm/pageattr.c:25:21: sparse: sparse: cast to non-scalar
>> arch/arm64/mm/pageattr.c:25:21: sparse: sparse: cast from non-scalar
   arch/arm64/mm/pageattr.c:210:22: sparse: sparse: cast to non-scalar
   arch/arm64/mm/pageattr.c:210:22: sparse: sparse: cast from non-scalar
   arch/arm64/mm/pageattr.c:214:15: sparse: sparse: cast to non-scalar
   arch/arm64/mm/pageattr.c:214:15: sparse: sparse: cast from non-scalar
   arch/arm64/mm/pageattr.c:220:16: sparse: sparse: cast to non-scalar
   arch/arm64/mm/pageattr.c:220:16: sparse: sparse: cast from non-scalar
   arch/arm64/mm/pageattr.c:221:15: sparse: sparse: cast to non-scalar
   arch/arm64/mm/pageattr.c:221:15: sparse: sparse: cast from non-scalar
   arch/arm64/mm/pageattr.c:227:16: sparse: sparse: cast to non-scalar
   arch/arm64/mm/pageattr.c:227:16: sparse: sparse: cast from non-scalar
   arch/arm64/mm/pageattr.c:228:16: sparse: sparse: cast to non-scalar
   arch/arm64/mm/pageattr.c:228:16: sparse: sparse: cast from non-scalar
--
>> arch/arm64/kvm/../../../virt/kvm/arm/mmu.c:180:28: sparse: sparse: cast =
to non-scalar
>> arch/arm64/kvm/../../../virt/kvm/arm/mmu.c:180:28: sparse: sparse: cast =
from non-scalar
   arch/arm64/kvm/../../../virt/kvm/arm/mmu.c:247:27: sparse: sparse: cast =
to non-scalar
   arch/arm64/kvm/../../../virt/kvm/arm/mmu.c:247:27: sparse: sparse: cast =
from non-scalar
   arch/arm64/kvm/../../../virt/kvm/arm/mmu.c:369:15: sparse: sparse: cast =
to non-scalar
   arch/arm64/kvm/../../../virt/kvm/arm/mmu.c:369:15: sparse: sparse: cast =
from non-scalar
   arch/arm64/kvm/../../../virt/kvm/arm/mmu.c:462:43: sparse: sparse: cast =
to non-scalar
   arch/arm64/kvm/../../../virt/kvm/arm/mmu.c:462:43: sparse: sparse: cast =
from non-scalar
   arch/arm64/kvm/../../../virt/kvm/arm/mmu.c:471:28: sparse: sparse: cast =
to non-scalar
   arch/arm64/kvm/../../../virt/kvm/arm/mmu.c:471:28: sparse: sparse: cast =
from non-scalar
   arch/arm64/kvm/../../../virt/kvm/arm/mmu.c:482:27: sparse: sparse: cast =
to non-scalar
   arch/arm64/kvm/../../../virt/kvm/arm/mmu.c:482:27: sparse: sparse: cast =
from non-scalar
   arch/arm64/kvm/../../../virt/kvm/arm/mmu.c:499:27: sparse: sparse: cast =
to non-scalar
   arch/arm64/kvm/../../../virt/kvm/arm/mmu.c:499:27: sparse: sparse: cast =
from non-scalar
   arch/arm64/kvm/../../../virt/kvm/arm/mmu.c:618:23: sparse: sparse: cast =
to non-scalar
   arch/arm64/kvm/../../../virt/kvm/arm/mmu.c:618:23: sparse: sparse: cast =
from non-scalar
   arch/arm64/kvm/../../../virt/kvm/arm/mmu.c:635:23: sparse: sparse: cast =
to non-scalar
   arch/arm64/kvm/../../../virt/kvm/arm/mmu.c:635:23: sparse: sparse: cast =
from non-scalar
   arch/arm64/kvm/../../../virt/kvm/arm/mmu.c:1193:16: sparse: sparse: cast=
 to non-scalar
   arch/arm64/kvm/../../../virt/kvm/arm/mmu.c:1193:16: sparse: sparse: cast=
 from non-scalar
   arch/arm64/kvm/../../../virt/kvm/arm/mmu.c:1282:15: sparse: sparse: cast=
 to non-scalar
   arch/arm64/kvm/../../../virt/kvm/arm/mmu.c:1282:15: sparse: sparse: cast=
 from non-scalar
   arch/arm64/kvm/../../../virt/kvm/arm/mmu.c:1426:15: sparse: sparse: cast=
 to non-scalar
   arch/arm64/kvm/../../../virt/kvm/arm/mmu.c:1426:15: sparse: sparse: cast=
 from non-scalar
>> arch/arm64/include/asm/stage2_pgtable.h:176:24: sparse: sparse: cast to =
non-scalar
>> arch/arm64/include/asm/stage2_pgtable.h:176:24: sparse: sparse: cast fro=
m non-scalar
>> arch/arm64/include/asm/stage2_pgtable.h:176:24: sparse: sparse: cast to =
non-scalar
>> arch/arm64/include/asm/stage2_pgtable.h:176:24: sparse: sparse: cast fro=
m non-scalar
>> arch/arm64/include/asm/stage2_pgtable.h:176:24: sparse: sparse: cast to =
non-scalar
>> arch/arm64/include/asm/stage2_pgtable.h:176:24: sparse: sparse: cast fro=
m non-scalar
>> arch/arm64/include/asm/stage2_pgtable.h:176:24: sparse: sparse: cast to =
non-scalar
>> arch/arm64/include/asm/stage2_pgtable.h:176:24: sparse: sparse: cast fro=
m non-scalar
>> arch/arm64/include/asm/stage2_pgtable.h:176:24: sparse: sparse: cast to =
non-scalar
>> arch/arm64/include/asm/stage2_pgtable.h:176:24: sparse: sparse: cast fro=
m non-scalar
>> arch/arm64/include/asm/stage2_pgtable.h:176:24: sparse: sparse: cast to =
non-scalar
>> arch/arm64/include/asm/stage2_pgtable.h:176:24: sparse: sparse: cast fro=
m non-scalar
>> arch/arm64/include/asm/pgtable.h:709:15: sparse: sparse: cast to non-sca=
lar
>> arch/arm64/include/asm/pgtable.h:709:15: sparse: sparse: cast from non-s=
calar
>> arch/arm64/include/asm/stage2_pgtable.h:176:24: sparse: sparse: cast to =
non-scalar
>> arch/arm64/include/asm/stage2_pgtable.h:176:24: sparse: sparse: cast fro=
m non-scalar
--
>> fs/proc/task_mmu.c:594:15: sparse: sparse: cast to non-scalar
>> fs/proc/task_mmu.c:594:15: sparse: sparse: cast from non-scalar
   fs/proc/task_mmu.c:1049:15: sparse: sparse: cast to non-scalar
   fs/proc/task_mmu.c:1049:15: sparse: sparse: cast from non-scalar
   fs/proc/task_mmu.c:1407:26: sparse: sparse: cast to non-scalar
   fs/proc/task_mmu.c:1407:26: sparse: sparse: cast from non-scalar
   fs/proc/task_mmu.c:1736:26: sparse: sparse: cast to non-scalar
   fs/proc/task_mmu.c:1736:26: sparse: sparse: cast from non-scalar
   fs/proc/task_mmu.c:583:28: sparse: sparse: context imbalance in 'smaps_p=
te_range' - unexpected unlock
>> arch/arm64/include/asm/pgtable.h:709:15: sparse: sparse: cast to non-sca=
lar
>> arch/arm64/include/asm/pgtable.h:709:15: sparse: sparse: cast from non-s=
calar
>> arch/arm64/include/asm/pgtable.h:709:15: sparse: sparse: cast to non-sca=
lar
>> arch/arm64/include/asm/pgtable.h:709:15: sparse: sparse: cast from non-s=
calar
   fs/proc/task_mmu.c:1042:28: sparse: sparse: context imbalance in 'clear_=
refs_pte_range' - unexpected unlock
   fs/proc/task_mmu.c:1395:28: sparse: sparse: context imbalance in 'pagema=
p_pmd_range' - unexpected unlock
   fs/proc/task_mmu.c:1729:28: sparse: sparse: context imbalance in 'gather=
_pte_stats' - unexpected unlock

vim +144 arch/arm64/mm/fault.c

e4365f968fcd5e Mark Rutland       2019-10-03  113  =

1d18c47c735e8a Catalin Marinas    2012-03-05  114  /*
67ce16ec15ce9d Kristina Martsenko 2017-06-09  115   * Dump out the page tab=
les associated with 'addr' in the currently active mm.
1d18c47c735e8a Catalin Marinas    2012-03-05  116   */
7048a5973eb1d6 Will Deacon        2019-04-03  117  static void show_pte(uns=
igned long addr)
1d18c47c735e8a Catalin Marinas    2012-03-05  118  {
67ce16ec15ce9d Kristina Martsenko 2017-06-09  119  	struct mm_struct *mm;
20a004e7b017cc Will Deacon        2018-02-15  120  	pgd_t *pgdp;
20a004e7b017cc Will Deacon        2018-02-15  121  	pgd_t pgd;
1d18c47c735e8a Catalin Marinas    2012-03-05  122  =

356607f21e6035 Andrey Konovalov   2018-12-28  123  	if (is_ttbr0_addr(addr)=
) {
67ce16ec15ce9d Kristina Martsenko 2017-06-09  124  		/* TTBR0 */
67ce16ec15ce9d Kristina Martsenko 2017-06-09  125  		mm =3D current->active=
_mm;
67ce16ec15ce9d Kristina Martsenko 2017-06-09  126  		if (mm =3D=3D &init_mm=
) {
67ce16ec15ce9d Kristina Martsenko 2017-06-09  127  			pr_alert("[%016lx] us=
er address but active_mm is swapper\n",
67ce16ec15ce9d Kristina Martsenko 2017-06-09  128  				 addr);
67ce16ec15ce9d Kristina Martsenko 2017-06-09  129  			return;
67ce16ec15ce9d Kristina Martsenko 2017-06-09  130  		}
356607f21e6035 Andrey Konovalov   2018-12-28  131  	} else if (is_ttbr1_add=
r(addr)) {
67ce16ec15ce9d Kristina Martsenko 2017-06-09  132  		/* TTBR1 */
1d18c47c735e8a Catalin Marinas    2012-03-05  133  		mm =3D &init_mm;
67ce16ec15ce9d Kristina Martsenko 2017-06-09  134  	} else {
67ce16ec15ce9d Kristina Martsenko 2017-06-09  135  		pr_alert("[%016lx] add=
ress between user and kernel address ranges\n",
67ce16ec15ce9d Kristina Martsenko 2017-06-09  136  			 addr);
67ce16ec15ce9d Kristina Martsenko 2017-06-09  137  		return;
67ce16ec15ce9d Kristina Martsenko 2017-06-09  138  	}
1d18c47c735e8a Catalin Marinas    2012-03-05  139  =

5383cc6efed137 Steve Capper       2019-08-07  140  	pr_alert("%s pgtable: %=
luk pages, %llu-bit VAs, pgdp=3D%016lx\n",
1eb34b6e5160f2 Will Deacon        2017-05-15  141  		 mm =3D=3D &init_mm ? =
"swapper" : "user", PAGE_SIZE / SZ_1K,
e4365f968fcd5e Mark Rutland       2019-10-03  142  		 vabits_actual, mm_to_=
pgd_phys(mm));
20a004e7b017cc Will Deacon        2018-02-15  143  	pgdp =3D pgd_offset(mm,=
 addr);
20a004e7b017cc Will Deacon        2018-02-15 @144  	pgd =3D READ_ONCE(*pgdp=
);
20a004e7b017cc Will Deacon        2018-02-15  145  	pr_alert("[%016lx] pgd=
=3D%016llx", addr, pgd_val(pgd));
1d18c47c735e8a Catalin Marinas    2012-03-05  146  =

1d18c47c735e8a Catalin Marinas    2012-03-05  147  	do {
20a004e7b017cc Will Deacon        2018-02-15  148  		pud_t *pudp, pud;
20a004e7b017cc Will Deacon        2018-02-15  149  		pmd_t *pmdp, pmd;
20a004e7b017cc Will Deacon        2018-02-15  150  		pte_t *ptep, pte;
1d18c47c735e8a Catalin Marinas    2012-03-05  151  =

20a004e7b017cc Will Deacon        2018-02-15  152  		if (pgd_none(pgd) || p=
gd_bad(pgd))
1d18c47c735e8a Catalin Marinas    2012-03-05  153  			break;
1d18c47c735e8a Catalin Marinas    2012-03-05  154  =

20a004e7b017cc Will Deacon        2018-02-15  155  		pudp =3D pud_offset(pg=
dp, addr);
20a004e7b017cc Will Deacon        2018-02-15  156  		pud =3D READ_ONCE(*pud=
p);
20a004e7b017cc Will Deacon        2018-02-15  157  		pr_cont(", pud=3D%016l=
lx", pud_val(pud));
20a004e7b017cc Will Deacon        2018-02-15  158  		if (pud_none(pud) || p=
ud_bad(pud))
1d18c47c735e8a Catalin Marinas    2012-03-05  159  			break;
1d18c47c735e8a Catalin Marinas    2012-03-05  160  =

20a004e7b017cc Will Deacon        2018-02-15  161  		pmdp =3D pmd_offset(pu=
dp, addr);
20a004e7b017cc Will Deacon        2018-02-15  162  		pmd =3D READ_ONCE(*pmd=
p);
20a004e7b017cc Will Deacon        2018-02-15  163  		pr_cont(", pmd=3D%016l=
lx", pmd_val(pmd));
20a004e7b017cc Will Deacon        2018-02-15  164  		if (pmd_none(pmd) || p=
md_bad(pmd))
1d18c47c735e8a Catalin Marinas    2012-03-05  165  			break;
1d18c47c735e8a Catalin Marinas    2012-03-05  166  =

20a004e7b017cc Will Deacon        2018-02-15  167  		ptep =3D pte_offset_ma=
p(pmdp, addr);
20a004e7b017cc Will Deacon        2018-02-15  168  		pte =3D READ_ONCE(*pte=
p);
20a004e7b017cc Will Deacon        2018-02-15  169  		pr_cont(", pte=3D%016l=
lx", pte_val(pte));
20a004e7b017cc Will Deacon        2018-02-15  170  		pte_unmap(ptep);
1d18c47c735e8a Catalin Marinas    2012-03-05  171  	} while(0);
1d18c47c735e8a Catalin Marinas    2012-03-05  172  =

6ef4fb387d50fa Mark Rutland       2017-01-03  173  	pr_cont("\n");
1d18c47c735e8a Catalin Marinas    2012-03-05  174  }
1d18c47c735e8a Catalin Marinas    2012-03-05  175  =


:::::: The code at line 144 was first introduced by commit
:::::: 20a004e7b017cce282a46ac5d02c2b9c6b9bb1fa arm64: mm: Use READ_ONCE/WR=
ITE_ONCE when accessing page tables

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5036312871790739182==--

