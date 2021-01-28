Content-Type: multipart/mixed; boundary="===============5976781635141674686=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [android-common:android12-5.10 3715/4011] mm/memory.c:5027:20: sparse: sparse: restricted vm_fault_t degrades to integer
Date: Thu, 28 Jan 2021 17:29:19 +0800
Message-ID: <202101281715.dLLYRIl9-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5976781635141674686==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   86a65e277a7885b9264b343afbdc36a6007bd871
commit: 08c1a30975dd9294db1ae704ee9fb09cfb3fe5ab [3715/4011] FROMLIST: x86/=
mm: define ARCH_SUPPORTS_SPECULATIVE_PAGE_FAULT
config: x86_64-randconfig-s022-20210128 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.3-212-g56dbccf5-dirty
        git remote add android-common https://android.googlesource.com/kern=
el/common
        git fetch --no-tags android-common android12-5.10
        git checkout 08c1a30975dd9294db1ae704ee9fb09cfb3fe5ab
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=
=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   mm/memory.c:3009:19: sparse: sparse: incorrect type in initializer (diff=
erent base types) @@     expected int ret @@     got restricted vm_fault_t =
@@
   mm/memory.c:3009:19: sparse:     expected int ret
   mm/memory.c:3009:19: sparse:     got restricted vm_fault_t
   mm/memory.c:3054:21: sparse: sparse: incorrect type in assignment (diffe=
rent base types) @@     expected int ret @@     got restricted vm_fault_t @@
   mm/memory.c:3054:21: sparse:     expected int ret
   mm/memory.c:3054:21: sparse:     got restricted vm_fault_t
   mm/memory.c:3148:16: sparse: sparse: incorrect type in return expression=
 (different base types) @@     expected restricted vm_fault_t @@     got in=
t ret @@
   mm/memory.c:3148:16: sparse:     expected restricted vm_fault_t
   mm/memory.c:3148:16: sparse:     got int ret
   mm/memory.c:3440:13: sparse: sparse: incorrect type in assignment (diffe=
rent base types) @@     expected restricted vm_fault_t [usertype] ret @@   =
  got int @@
   mm/memory.c:3440:13: sparse:     expected restricted vm_fault_t [usertyp=
e] ret
   mm/memory.c:3440:13: sparse:     got int
   mm/memory.c:4861:24: sparse: sparse: incorrect type in return expression=
 (different base types) @@     expected int @@     got restricted vm_fault_=
t @@
   mm/memory.c:4861:24: sparse:     expected int
   mm/memory.c:4861:24: sparse:     got restricted vm_fault_t
   mm/memory.c:4868:24: sparse: sparse: incorrect type in return expression=
 (different base types) @@     expected int @@     got restricted vm_fault_=
t @@
   mm/memory.c:4868:24: sparse:     expected int
   mm/memory.c:4868:24: sparse:     got restricted vm_fault_t
   mm/memory.c:4878:24: sparse: sparse: incorrect type in return expression=
 (different base types) @@     expected int @@     got restricted vm_fault_=
t @@
   mm/memory.c:4878:24: sparse:     expected int
   mm/memory.c:4878:24: sparse:     got restricted vm_fault_t
   mm/memory.c:4888:24: sparse: sparse: incorrect type in return expression=
 (different base types) @@     expected int @@     got restricted vm_fault_=
t @@
   mm/memory.c:4888:24: sparse:     expected int
   mm/memory.c:4888:24: sparse:     got restricted vm_fault_t
   mm/memory.c:4897:24: sparse: sparse: incorrect type in return expression=
 (different base types) @@     expected int @@     got restricted vm_fault_=
t @@
   mm/memory.c:4897:24: sparse:     expected int
   mm/memory.c:4897:24: sparse:     got restricted vm_fault_t
   mm/memory.c:4907:24: sparse: sparse: incorrect type in return expression=
 (different base types) @@     expected int @@     got restricted vm_fault_=
t @@
   mm/memory.c:4907:24: sparse:     expected int
   mm/memory.c:4907:24: sparse:     got restricted vm_fault_t
   mm/memory.c:4913:24: sparse: sparse: incorrect type in return expression=
 (different base types) @@     expected int @@     got restricted vm_fault_=
t @@
   mm/memory.c:4913:24: sparse:     expected int
   mm/memory.c:4913:24: sparse:     got restricted vm_fault_t
   mm/memory.c:5017:24: sparse: sparse: incorrect type in return expression=
 (different base types) @@     expected int @@     got restricted vm_fault_=
t @@
   mm/memory.c:5017:24: sparse:     expected int
   mm/memory.c:5017:24: sparse:     got restricted vm_fault_t
   mm/memory.c:5021:13: sparse: sparse: incorrect type in assignment (diffe=
rent base types) @@     expected int ret @@     got restricted vm_fault_t @@
   mm/memory.c:5021:13: sparse:     expected int ret
   mm/memory.c:5021:13: sparse:     got restricted vm_fault_t
>> mm/memory.c:5027:20: sparse: sparse: restricted vm_fault_t degrades to i=
nteger
   mm/memory.c:5039:51: sparse: sparse: restricted vm_fault_t degrades to i=
nteger
   mm/memory.c:5046:16: sparse: sparse: incorrect type in return expression=
 (different base types) @@     expected int @@     got restricted vm_fault_=
t @@
   mm/memory.c:5046:16: sparse:     expected int
   mm/memory.c:5046:16: sparse:     got restricted vm_fault_t
   mm/memory.c:5056:16: sparse: sparse: incorrect type in return expression=
 (different base types) @@     expected int @@     got restricted vm_fault_=
t @@
   mm/memory.c:5056:16: sparse:     expected int
   mm/memory.c:5056:16: sparse:     got restricted vm_fault_t
   mm/memory.c:5691:22: sparse: sparse: cast removes address space '__user'=
 of expression
   mm/memory.c:338:9: sparse: sparse: incompatible types in conditional exp=
ression (different base types):
   mm/memory.c:338:9: sparse:    void
   mm/memory.c:338:9: sparse:    int

vim +5027 mm/memory.c

1c5371744061fc Peter Zijlstra 2018-04-17  4825  =

1c5371744061fc Peter Zijlstra 2018-04-17  4826  #ifndef CONFIG_ARCH_HAS_PTE=
_SPECIAL
1c5371744061fc Peter Zijlstra 2018-04-17  4827  /* This is required by vm_n=
ormal_page() */
1c5371744061fc Peter Zijlstra 2018-04-17  4828  #error "Speculative page fa=
ult handler requires CONFIG_ARCH_HAS_PTE_SPECIAL"
1c5371744061fc Peter Zijlstra 2018-04-17  4829  #endif
1c5371744061fc Peter Zijlstra 2018-04-17  4830  /*
1c5371744061fc Peter Zijlstra 2018-04-17  4831   * vm_normal_page() adds so=
me processing which should be done while
1c5371744061fc Peter Zijlstra 2018-04-17  4832   * hodling the mmap_sem.
1c5371744061fc Peter Zijlstra 2018-04-17  4833   */
99e15a079959a7 Laurent Dufour 2018-04-17  4834  =

99e15a079959a7 Laurent Dufour 2018-04-17  4835  /*
99e15a079959a7 Laurent Dufour 2018-04-17  4836   * Tries to handle the page=
 fault in a speculative way, without grabbing the
99e15a079959a7 Laurent Dufour 2018-04-17  4837   * mmap_sem.
99e15a079959a7 Laurent Dufour 2018-04-17  4838   * When VM_FAULT_RETRY is r=
eturned, the vma pointer is valid and this vma must
99e15a079959a7 Laurent Dufour 2018-04-17  4839   * be checked later when th=
e mmap_sem has been grabbed by calling
99e15a079959a7 Laurent Dufour 2018-04-17  4840   * can_reuse_spf_vma().
99e15a079959a7 Laurent Dufour 2018-04-17  4841   * This is needed as the re=
turned vma is kept in memory until the call to
99e15a079959a7 Laurent Dufour 2018-04-17  4842   * can_reuse_spf_vma() is m=
ade.
99e15a079959a7 Laurent Dufour 2018-04-17  4843   */
1c5371744061fc Peter Zijlstra 2018-04-17  4844  int __handle_speculative_fa=
ult(struct mm_struct *mm, unsigned long address,
99e15a079959a7 Laurent Dufour 2018-04-17  4845  			       unsigned int flag=
s, struct vm_area_struct **vma)
1c5371744061fc Peter Zijlstra 2018-04-17  4846  {
1c5371744061fc Peter Zijlstra 2018-04-17  4847  	struct vm_fault vmf =3D {
1c5371744061fc Peter Zijlstra 2018-04-17  4848  		.address =3D address,
1c5371744061fc Peter Zijlstra 2018-04-17  4849  	};
1c5371744061fc Peter Zijlstra 2018-04-17  4850  	pgd_t *pgd, pgdval;
1c5371744061fc Peter Zijlstra 2018-04-17  4851  	p4d_t *p4d, p4dval;
1c5371744061fc Peter Zijlstra 2018-04-17  4852  	pud_t pudval;
99e15a079959a7 Laurent Dufour 2018-04-17  4853  	int seq, ret;
1c5371744061fc Peter Zijlstra 2018-04-17  4854  =

1c5371744061fc Peter Zijlstra 2018-04-17  4855  	/* Clear flags that may le=
ad to release the mmap_sem to retry */
1c5371744061fc Peter Zijlstra 2018-04-17  4856  	flags &=3D ~(FAULT_FLAG_AL=
LOW_RETRY|FAULT_FLAG_KILLABLE);
1c5371744061fc Peter Zijlstra 2018-04-17  4857  	flags |=3D FAULT_FLAG_SPEC=
ULATIVE;
1c5371744061fc Peter Zijlstra 2018-04-17  4858  =

99e15a079959a7 Laurent Dufour 2018-04-17  4859  	*vma =3D get_vma(mm, addre=
ss);
99e15a079959a7 Laurent Dufour 2018-04-17  4860  	if (!*vma)
99e15a079959a7 Laurent Dufour 2018-04-17  4861  		return VM_FAULT_RETRY;
99e15a079959a7 Laurent Dufour 2018-04-17  4862  	vmf.vma =3D *vma;
1c5371744061fc Peter Zijlstra 2018-04-17  4863  =

1c5371744061fc Peter Zijlstra 2018-04-17  4864  	/* rmb <-> seqlock,vma_rb_=
erase() */
99e15a079959a7 Laurent Dufour 2018-04-17  4865  	seq =3D raw_read_seqcount(=
&vmf.vma->vm_sequence);
736ae8bde8da3c Laurent Dufour 2018-04-17  4866  	if (seq & 1) {
99e15a079959a7 Laurent Dufour 2018-04-17  4867  		trace_spf_vma_changed(_RE=
T_IP_, vmf.vma, address);
99e15a079959a7 Laurent Dufour 2018-04-17  4868  		return VM_FAULT_RETRY;
736ae8bde8da3c Laurent Dufour 2018-04-17  4869  	}
1c5371744061fc Peter Zijlstra 2018-04-17  4870  =

1c5371744061fc Peter Zijlstra 2018-04-17  4871  	/*
1c5371744061fc Peter Zijlstra 2018-04-17  4872  	 * Can't call vm_ops servi=
ce has we don't know what they would do
1c5371744061fc Peter Zijlstra 2018-04-17  4873  	 * with the VMA.
1c5371744061fc Peter Zijlstra 2018-04-17  4874  	 * This include huge page =
from hugetlbfs.
1c5371744061fc Peter Zijlstra 2018-04-17  4875  	 */
99e15a079959a7 Laurent Dufour 2018-04-17  4876  	if (vmf.vma->vm_ops) {
99e15a079959a7 Laurent Dufour 2018-04-17  4877  		trace_spf_vma_notsup(_RET=
_IP_, vmf.vma, address);
99e15a079959a7 Laurent Dufour 2018-04-17  4878  		return VM_FAULT_RETRY;
736ae8bde8da3c Laurent Dufour 2018-04-17  4879  	}
1c5371744061fc Peter Zijlstra 2018-04-17  4880  =

1c5371744061fc Peter Zijlstra 2018-04-17  4881  	/*
1c5371744061fc Peter Zijlstra 2018-04-17  4882  	 * __anon_vma_prepare() re=
quires the mmap_sem to be held
1c5371744061fc Peter Zijlstra 2018-04-17  4883  	 * because vm_next and vm_=
prev must be safe. This can't be guaranteed
1c5371744061fc Peter Zijlstra 2018-04-17  4884  	 * in the speculative path.
1c5371744061fc Peter Zijlstra 2018-04-17  4885  	 */
99e15a079959a7 Laurent Dufour 2018-04-17  4886  	if (unlikely(!vmf.vma->ano=
n_vma)) {
99e15a079959a7 Laurent Dufour 2018-04-17  4887  		trace_spf_vma_notsup(_RET=
_IP_, vmf.vma, address);
99e15a079959a7 Laurent Dufour 2018-04-17  4888  		return VM_FAULT_RETRY;
736ae8bde8da3c Laurent Dufour 2018-04-17  4889  	}
1c5371744061fc Peter Zijlstra 2018-04-17  4890  =

99e15a079959a7 Laurent Dufour 2018-04-17  4891  	vmf.vma_flags =3D READ_ONC=
E(vmf.vma->vm_flags);
99e15a079959a7 Laurent Dufour 2018-04-17  4892  	vmf.vma_page_prot =3D READ=
_ONCE(vmf.vma->vm_page_prot);
1c5371744061fc Peter Zijlstra 2018-04-17  4893  =

1c5371744061fc Peter Zijlstra 2018-04-17  4894  	/* Can't call userland pag=
e fault handler in the speculative path */
736ae8bde8da3c Laurent Dufour 2018-04-17  4895  	if (unlikely(vmf.vma_flags=
 & VM_UFFD_MISSING)) {
99e15a079959a7 Laurent Dufour 2018-04-17  4896  		trace_spf_vma_notsup(_RET=
_IP_, vmf.vma, address);
99e15a079959a7 Laurent Dufour 2018-04-17  4897  		return VM_FAULT_RETRY;
736ae8bde8da3c Laurent Dufour 2018-04-17  4898  	}
1c5371744061fc Peter Zijlstra 2018-04-17  4899  =

736ae8bde8da3c Laurent Dufour 2018-04-17  4900  	if (vmf.vma_flags & VM_GRO=
WSDOWN || vmf.vma_flags & VM_GROWSUP) {
1c5371744061fc Peter Zijlstra 2018-04-17  4901  		/*
1c5371744061fc Peter Zijlstra 2018-04-17  4902  		 * This could be detected=
 by the check address against VMA's
1c5371744061fc Peter Zijlstra 2018-04-17  4903  		 * boundaries but we want=
 to trace it as not supported instead
1c5371744061fc Peter Zijlstra 2018-04-17  4904  		 * of changed.
1c5371744061fc Peter Zijlstra 2018-04-17  4905  		 */
99e15a079959a7 Laurent Dufour 2018-04-17  4906  		trace_spf_vma_notsup(_RET=
_IP_, vmf.vma, address);
99e15a079959a7 Laurent Dufour 2018-04-17  4907  		return VM_FAULT_RETRY;
736ae8bde8da3c Laurent Dufour 2018-04-17  4908  	}
1c5371744061fc Peter Zijlstra 2018-04-17  4909  =

99e15a079959a7 Laurent Dufour 2018-04-17  4910  	if (address < READ_ONCE(vm=
f.vma->vm_start)
99e15a079959a7 Laurent Dufour 2018-04-17  4911  	    || READ_ONCE(vmf.vma->=
vm_end) <=3D address) {
99e15a079959a7 Laurent Dufour 2018-04-17  4912  		trace_spf_vma_changed(_RE=
T_IP_, vmf.vma, address);
99e15a079959a7 Laurent Dufour 2018-04-17 @4913  		return VM_FAULT_RETRY;
736ae8bde8da3c Laurent Dufour 2018-04-17  4914  	}
1c5371744061fc Peter Zijlstra 2018-04-17  4915  =

99e15a079959a7 Laurent Dufour 2018-04-17  4916  	if (!arch_vma_access_permi=
tted(vmf.vma, flags & FAULT_FLAG_WRITE,
1c5371744061fc Peter Zijlstra 2018-04-17  4917  				       flags & FAULT_FL=
AG_INSTRUCTION,
99e15a079959a7 Laurent Dufour 2018-04-17  4918  				       flags & FAULT_FL=
AG_REMOTE))
99e15a079959a7 Laurent Dufour 2018-04-17  4919  		goto out_segv;
1c5371744061fc Peter Zijlstra 2018-04-17  4920  =

1c5371744061fc Peter Zijlstra 2018-04-17  4921  	/* This is one is required=
 to check that the VMA has write access set */
1c5371744061fc Peter Zijlstra 2018-04-17  4922  	if (flags & FAULT_FLAG_WRI=
TE) {
99e15a079959a7 Laurent Dufour 2018-04-17  4923  		if (unlikely(!(vmf.vma_fl=
ags & VM_WRITE)))
99e15a079959a7 Laurent Dufour 2018-04-17  4924  			goto out_segv;
99e15a079959a7 Laurent Dufour 2018-04-17  4925  	} else if (unlikely(!(vmf.=
vma_flags & (VM_READ|VM_EXEC|VM_WRITE))))
99e15a079959a7 Laurent Dufour 2018-04-17  4926  		goto out_segv;
1c5371744061fc Peter Zijlstra 2018-04-17  4927  =

1c5371744061fc Peter Zijlstra 2018-04-17  4928  #ifdef CONFIG_NUMA
1c5371744061fc Peter Zijlstra 2018-04-17  4929  	struct mempolicy *pol;
1c5371744061fc Peter Zijlstra 2018-04-17  4930  =

1c5371744061fc Peter Zijlstra 2018-04-17  4931  	/*
1c5371744061fc Peter Zijlstra 2018-04-17  4932  	 * MPOL_INTERLEAVE implies=
 additional checks in
1c5371744061fc Peter Zijlstra 2018-04-17  4933  	 * mpol_misplaced() which =
are not compatible with the
1c5371744061fc Peter Zijlstra 2018-04-17  4934  	 *speculative page fault p=
rocessing.
1c5371744061fc Peter Zijlstra 2018-04-17  4935  	 */
99e15a079959a7 Laurent Dufour 2018-04-17  4936  	pol =3D __get_vma_policy(v=
mf.vma, address);
1c5371744061fc Peter Zijlstra 2018-04-17  4937  	if (!pol)
1c5371744061fc Peter Zijlstra 2018-04-17  4938  		pol =3D get_task_policy(c=
urrent);
736ae8bde8da3c Laurent Dufour 2018-04-17  4939  	if (!pol)
736ae8bde8da3c Laurent Dufour 2018-04-17  4940  		if (pol && pol->mode =3D=
=3D MPOL_INTERLEAVE) {
99e15a079959a7 Laurent Dufour 2018-04-17  4941  			trace_spf_vma_notsup(_RE=
T_IP_, vmf.vma, address);
99e15a079959a7 Laurent Dufour 2018-04-17  4942  			return VM_FAULT_RETRY;
736ae8bde8da3c Laurent Dufour 2018-04-17  4943  		}
1c5371744061fc Peter Zijlstra 2018-04-17  4944  #endif
1c5371744061fc Peter Zijlstra 2018-04-17  4945  =

1c5371744061fc Peter Zijlstra 2018-04-17  4946  	/*
1c5371744061fc Peter Zijlstra 2018-04-17  4947  	 * Do a speculative lookup=
 of the PTE entry.
1c5371744061fc Peter Zijlstra 2018-04-17  4948  	 */
1c5371744061fc Peter Zijlstra 2018-04-17  4949  	local_irq_disable();
1c5371744061fc Peter Zijlstra 2018-04-17  4950  	pgd =3D pgd_offset(mm, add=
ress);
1c5371744061fc Peter Zijlstra 2018-04-17  4951  	pgdval =3D READ_ONCE(*pgd);
1c5371744061fc Peter Zijlstra 2018-04-17  4952  	if (pgd_none(pgdval) || un=
likely(pgd_bad(pgdval)))
1c5371744061fc Peter Zijlstra 2018-04-17  4953  		goto out_walk;
1c5371744061fc Peter Zijlstra 2018-04-17  4954  =

1c5371744061fc Peter Zijlstra 2018-04-17  4955  	p4d =3D p4d_offset(pgd, ad=
dress);
1c5371744061fc Peter Zijlstra 2018-04-17  4956  	p4dval =3D READ_ONCE(*p4d);
1c5371744061fc Peter Zijlstra 2018-04-17  4957  	if (p4d_none(p4dval) || un=
likely(p4d_bad(p4dval)))
1c5371744061fc Peter Zijlstra 2018-04-17  4958  		goto out_walk;
1c5371744061fc Peter Zijlstra 2018-04-17  4959  =

1c5371744061fc Peter Zijlstra 2018-04-17  4960  	vmf.pud =3D pud_offset(p4d=
, address);
1c5371744061fc Peter Zijlstra 2018-04-17  4961  	pudval =3D READ_ONCE(*vmf.=
pud);
1c5371744061fc Peter Zijlstra 2018-04-17  4962  	if (pud_none(pudval) || un=
likely(pud_bad(pudval)))
1c5371744061fc Peter Zijlstra 2018-04-17  4963  		goto out_walk;
1c5371744061fc Peter Zijlstra 2018-04-17  4964  =

1c5371744061fc Peter Zijlstra 2018-04-17  4965  	/* Huge pages at PUD level=
 are not supported. */
1c5371744061fc Peter Zijlstra 2018-04-17  4966  	if (unlikely(pud_trans_hug=
e(pudval)))
1c5371744061fc Peter Zijlstra 2018-04-17  4967  		goto out_walk;
1c5371744061fc Peter Zijlstra 2018-04-17  4968  =

1c5371744061fc Peter Zijlstra 2018-04-17  4969  	vmf.pmd =3D pmd_offset(vmf=
.pud, address);
1c5371744061fc Peter Zijlstra 2018-04-17  4970  	vmf.orig_pmd =3D READ_ONCE=
(*vmf.pmd);
1c5371744061fc Peter Zijlstra 2018-04-17  4971  	/*
1c5371744061fc Peter Zijlstra 2018-04-17  4972  	 * pmd_none could mean tha=
t a hugepage collapse is in progress
1c5371744061fc Peter Zijlstra 2018-04-17  4973  	 * in our back as collapse=
_huge_page() mark it before
1c5371744061fc Peter Zijlstra 2018-04-17  4974  	 * invalidating the pte (w=
hich is done once the IPI is catched
1c5371744061fc Peter Zijlstra 2018-04-17  4975  	 * by all CPU and we have =
interrupt disabled).
1c5371744061fc Peter Zijlstra 2018-04-17  4976  	 * For this reason we cann=
ot handle THP in a speculative way since we
1c5371744061fc Peter Zijlstra 2018-04-17  4977  	 * can't safely indentify =
an in progress collapse operation done in our
1c5371744061fc Peter Zijlstra 2018-04-17  4978  	 * back on that PMD.
1c5371744061fc Peter Zijlstra 2018-04-17  4979  	 * Regarding the order of =
the following checks, see comment in
1c5371744061fc Peter Zijlstra 2018-04-17  4980  	 * pmd_devmap_trans_unstab=
le()
1c5371744061fc Peter Zijlstra 2018-04-17  4981  	 */
1c5371744061fc Peter Zijlstra 2018-04-17  4982  	if (unlikely(pmd_devmap(vm=
f.orig_pmd) ||
1c5371744061fc Peter Zijlstra 2018-04-17  4983  		     pmd_none(vmf.orig_pm=
d) || pmd_trans_huge(vmf.orig_pmd) ||
1c5371744061fc Peter Zijlstra 2018-04-17  4984  		     is_swap_pmd(vmf.orig=
_pmd)))
1c5371744061fc Peter Zijlstra 2018-04-17  4985  		goto out_walk;
1c5371744061fc Peter Zijlstra 2018-04-17  4986  =

1c5371744061fc Peter Zijlstra 2018-04-17  4987  	/*
1c5371744061fc Peter Zijlstra 2018-04-17  4988  	 * The above does not allo=
cate/instantiate page-tables because doing so
1c5371744061fc Peter Zijlstra 2018-04-17  4989  	 * would lead to the possi=
bility of instantiating page-tables after
1c5371744061fc Peter Zijlstra 2018-04-17  4990  	 * free_pgtables() -- and =
consequently leaking them.
1c5371744061fc Peter Zijlstra 2018-04-17  4991  	 *
1c5371744061fc Peter Zijlstra 2018-04-17  4992  	 * The result is that we t=
ake at least one !speculative fault per PMD
1c5371744061fc Peter Zijlstra 2018-04-17  4993  	 * in order to instantiate=
 it.
1c5371744061fc Peter Zijlstra 2018-04-17  4994  	 */
1c5371744061fc Peter Zijlstra 2018-04-17  4995  =

1c5371744061fc Peter Zijlstra 2018-04-17  4996  	vmf.pte =3D pte_offset_map=
(vmf.pmd, address);
1c5371744061fc Peter Zijlstra 2018-04-17  4997  	vmf.orig_pte =3D READ_ONCE=
(*vmf.pte);
1c5371744061fc Peter Zijlstra 2018-04-17  4998  	barrier(); /* See comment =
in handle_pte_fault() */
1c5371744061fc Peter Zijlstra 2018-04-17  4999  	if (pte_none(vmf.orig_pte)=
) {
1c5371744061fc Peter Zijlstra 2018-04-17  5000  		pte_unmap(vmf.pte);
1c5371744061fc Peter Zijlstra 2018-04-17  5001  		vmf.pte =3D NULL;
1c5371744061fc Peter Zijlstra 2018-04-17  5002  	}
1c5371744061fc Peter Zijlstra 2018-04-17  5003  =

99e15a079959a7 Laurent Dufour 2018-04-17  5004  	vmf.pgoff =3D linear_page_=
index(vmf.vma, address);
99e15a079959a7 Laurent Dufour 2018-04-17  5005  	vmf.gfp_mask =3D __get_fau=
lt_gfp_mask(vmf.vma);
1c5371744061fc Peter Zijlstra 2018-04-17  5006  	vmf.sequence =3D seq;
1c5371744061fc Peter Zijlstra 2018-04-17  5007  	vmf.flags =3D flags;
1c5371744061fc Peter Zijlstra 2018-04-17  5008  =

1c5371744061fc Peter Zijlstra 2018-04-17  5009  	local_irq_enable();
1c5371744061fc Peter Zijlstra 2018-04-17  5010  =

1c5371744061fc Peter Zijlstra 2018-04-17  5011  	/*
1c5371744061fc Peter Zijlstra 2018-04-17  5012  	 * We need to re-validate =
the VMA after checking the bounds, otherwise
1c5371744061fc Peter Zijlstra 2018-04-17  5013  	 * we might have a false p=
ositive on the bounds.
1c5371744061fc Peter Zijlstra 2018-04-17  5014  	 */
99e15a079959a7 Laurent Dufour 2018-04-17  5015  	if (read_seqcount_retry(&v=
mf.vma->vm_sequence, seq)) {
99e15a079959a7 Laurent Dufour 2018-04-17  5016  		trace_spf_vma_changed(_RE=
T_IP_, vmf.vma, address);
99e15a079959a7 Laurent Dufour 2018-04-17  5017  		return VM_FAULT_RETRY;
736ae8bde8da3c Laurent Dufour 2018-04-17  5018  	}
1c5371744061fc Peter Zijlstra 2018-04-17  5019  =

1c5371744061fc Peter Zijlstra 2018-04-17  5020  	mem_cgroup_enter_user_faul=
t();
1c5371744061fc Peter Zijlstra 2018-04-17  5021  	ret =3D handle_pte_fault(&=
vmf);
1c5371744061fc Peter Zijlstra 2018-04-17  5022  	mem_cgroup_exit_user_fault=
();
1c5371744061fc Peter Zijlstra 2018-04-17  5023  =

99e15a079959a7 Laurent Dufour 2018-04-17  5024  	/*
99e15a079959a7 Laurent Dufour 2018-04-17  5025  	 * If there is no need to =
retry, don't return the vma to the caller.
99e15a079959a7 Laurent Dufour 2018-04-17  5026  	 */
99e15a079959a7 Laurent Dufour 2018-04-17 @5027  	if (ret !=3D VM_FAULT_RETR=
Y) {
caf05c003b5b62 Laurent Dufour 2018-04-17  5028  		count_vm_event(SPECULATIV=
E_PGFAULT);
99e15a079959a7 Laurent Dufour 2018-04-17  5029  		put_vma(vmf.vma);
99e15a079959a7 Laurent Dufour 2018-04-17  5030  		*vma =3D NULL;
99e15a079959a7 Laurent Dufour 2018-04-17  5031  	}
1c5371744061fc Peter Zijlstra 2018-04-17  5032  =

1c5371744061fc Peter Zijlstra 2018-04-17  5033  	/*
1c5371744061fc Peter Zijlstra 2018-04-17  5034  	 * The task may have enter=
ed a memcg OOM situation but
1c5371744061fc Peter Zijlstra 2018-04-17  5035  	 * if the allocation error=
 was handled gracefully (no
1c5371744061fc Peter Zijlstra 2018-04-17  5036  	 * VM_FAULT_OOM), there is=
 no need to kill anything.
1c5371744061fc Peter Zijlstra 2018-04-17  5037  	 * Just clean up the OOM s=
tate peacefully.
1c5371744061fc Peter Zijlstra 2018-04-17  5038  	 */
1c5371744061fc Peter Zijlstra 2018-04-17  5039  	if (task_in_memcg_oom(curr=
ent) && !(ret & VM_FAULT_OOM))
1c5371744061fc Peter Zijlstra 2018-04-17  5040  		mem_cgroup_oom_synchroniz=
e(false);
1c5371744061fc Peter Zijlstra 2018-04-17  5041  	return ret;
1c5371744061fc Peter Zijlstra 2018-04-17  5042  =

1c5371744061fc Peter Zijlstra 2018-04-17  5043  out_walk:
99e15a079959a7 Laurent Dufour 2018-04-17  5044  	trace_spf_vma_notsup(_RET_=
IP_, vmf.vma, address);
1c5371744061fc Peter Zijlstra 2018-04-17  5045  	local_irq_enable();
99e15a079959a7 Laurent Dufour 2018-04-17  5046  	return VM_FAULT_RETRY;
99e15a079959a7 Laurent Dufour 2018-04-17  5047  =

99e15a079959a7 Laurent Dufour 2018-04-17  5048  out_segv:
99e15a079959a7 Laurent Dufour 2018-04-17  5049  	trace_spf_vma_access(_RET_=
IP_, vmf.vma, address);
99e15a079959a7 Laurent Dufour 2018-04-17  5050  	/*
99e15a079959a7 Laurent Dufour 2018-04-17  5051  	 * We don't return VM_FAUL=
T_RETRY so the caller is not expected to
99e15a079959a7 Laurent Dufour 2018-04-17  5052  	 * retrieve the fetched VM=
A.
99e15a079959a7 Laurent Dufour 2018-04-17  5053  	 */
99e15a079959a7 Laurent Dufour 2018-04-17  5054  	put_vma(vmf.vma);
99e15a079959a7 Laurent Dufour 2018-04-17  5055  	*vma =3D NULL;
99e15a079959a7 Laurent Dufour 2018-04-17  5056  	return VM_FAULT_SIGSEGV;
99e15a079959a7 Laurent Dufour 2018-04-17  5057  }
99e15a079959a7 Laurent Dufour 2018-04-17  5058  =


:::::: The code at line 5027 was first introduced by commit
:::::: 99e15a079959a70d0e13c61c8b39a400f6e1e18a FROMLIST: mm: speculative p=
age fault handler return VMA

:::::: TO: Laurent Dufour <ldufour@linux.vnet.ibm.com>
:::::: CC: Suren Baghdasaryan <surenb@google.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5976781635141674686==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5976781635141674686==--

