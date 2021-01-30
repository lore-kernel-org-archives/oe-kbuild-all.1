Content-Type: multipart/mixed; boundary="===============0667650775803215039=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [android-common:android12-5.10 3709/4176] mm/memory.c:4918:20: warning: ISO C90 forbids mixing declarations and code
Date: Sun, 31 Jan 2021 04:00:32 +0800
Message-ID: <202101310427.1tSBFdhL-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0667650775803215039==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   d98d9f83c075242d5474ad71b36e675031dd18f0
commit: 2946798ed0905de19cafc23279242917066d3c49 [3709/4176] FROMLIST: arm6=
4/mm: define ARCH_SUPPORTS_SPECULATIVE_PAGE_FAULT
config: arm64-randconfig-r015-20210130 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 275c6a=
f7d7f1ed63a03d05b4484413e447133269)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        git remote add android-common https://android.googlesource.com/kern=
el/common
        git fetch --no-tags android-common android12-5.10
        git checkout 2946798ed0905de19cafc23279242917066d3c49
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/memory.c:4918:20: warning: ISO C90 forbids mixing declarations and co=
de [-Wdeclaration-after-statement]
           struct mempolicy *pol;
                             ^
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on NET && WIRELESS
   Selected by
   - GKI_LEGACY_WEXT_ALLCONFIG
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on NET && WIRELESS && (CFG80211_WEXT || WIRELESS_EXT
   Selected by
   - GKI_LEGACY_WEXT_ALLCONFIG
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on NET && WIRELESS && PROC_FS && WEXT_CORE
   Selected by
   - GKI_LEGACY_WEXT_ALLCONFIG
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on NET && WIRELESS
   Selected by
   - GKI_LEGACY_WEXT_ALLCONFIG
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on NET && WIRELESS
   Selected by
   - GKI_LEGACY_WEXT_ALLCONFIG


vim +4918 mm/memory.c

1c5371744061fc Peter Zijlstra 2018-04-17  4814  =

1c5371744061fc Peter Zijlstra 2018-04-17  4815  #ifndef CONFIG_ARCH_HAS_PTE=
_SPECIAL
1c5371744061fc Peter Zijlstra 2018-04-17  4816  /* This is required by vm_n=
ormal_page() */
1c5371744061fc Peter Zijlstra 2018-04-17  4817  #error "Speculative page fa=
ult handler requires CONFIG_ARCH_HAS_PTE_SPECIAL"
1c5371744061fc Peter Zijlstra 2018-04-17  4818  #endif
1c5371744061fc Peter Zijlstra 2018-04-17  4819  /*
1c5371744061fc Peter Zijlstra 2018-04-17  4820   * vm_normal_page() adds so=
me processing which should be done while
1c5371744061fc Peter Zijlstra 2018-04-17  4821   * hodling the mmap_sem.
1c5371744061fc Peter Zijlstra 2018-04-17  4822   */
99e15a079959a7 Laurent Dufour 2018-04-17  4823  =

99e15a079959a7 Laurent Dufour 2018-04-17  4824  /*
99e15a079959a7 Laurent Dufour 2018-04-17  4825   * Tries to handle the page=
 fault in a speculative way, without grabbing the
99e15a079959a7 Laurent Dufour 2018-04-17  4826   * mmap_sem.
99e15a079959a7 Laurent Dufour 2018-04-17  4827   * When VM_FAULT_RETRY is r=
eturned, the vma pointer is valid and this vma must
99e15a079959a7 Laurent Dufour 2018-04-17  4828   * be checked later when th=
e mmap_sem has been grabbed by calling
99e15a079959a7 Laurent Dufour 2018-04-17  4829   * can_reuse_spf_vma().
99e15a079959a7 Laurent Dufour 2018-04-17  4830   * This is needed as the re=
turned vma is kept in memory until the call to
99e15a079959a7 Laurent Dufour 2018-04-17  4831   * can_reuse_spf_vma() is m=
ade.
99e15a079959a7 Laurent Dufour 2018-04-17  4832   */
1c5371744061fc Peter Zijlstra 2018-04-17  4833  int __handle_speculative_fa=
ult(struct mm_struct *mm, unsigned long address,
99e15a079959a7 Laurent Dufour 2018-04-17  4834  			       unsigned int flag=
s, struct vm_area_struct **vma)
1c5371744061fc Peter Zijlstra 2018-04-17  4835  {
1c5371744061fc Peter Zijlstra 2018-04-17  4836  	struct vm_fault vmf =3D {
1c5371744061fc Peter Zijlstra 2018-04-17  4837  		.address =3D address,
1c5371744061fc Peter Zijlstra 2018-04-17  4838  	};
1c5371744061fc Peter Zijlstra 2018-04-17  4839  	pgd_t *pgd, pgdval;
1c5371744061fc Peter Zijlstra 2018-04-17  4840  	p4d_t *p4d, p4dval;
1c5371744061fc Peter Zijlstra 2018-04-17  4841  	pud_t pudval;
99e15a079959a7 Laurent Dufour 2018-04-17  4842  	int seq, ret;
1c5371744061fc Peter Zijlstra 2018-04-17  4843  =

1c5371744061fc Peter Zijlstra 2018-04-17  4844  	/* Clear flags that may le=
ad to release the mmap_sem to retry */
1c5371744061fc Peter Zijlstra 2018-04-17  4845  	flags &=3D ~(FAULT_FLAG_AL=
LOW_RETRY|FAULT_FLAG_KILLABLE);
1c5371744061fc Peter Zijlstra 2018-04-17  4846  	flags |=3D FAULT_FLAG_SPEC=
ULATIVE;
1c5371744061fc Peter Zijlstra 2018-04-17  4847  =

99e15a079959a7 Laurent Dufour 2018-04-17  4848  	*vma =3D get_vma(mm, addre=
ss);
99e15a079959a7 Laurent Dufour 2018-04-17  4849  	if (!*vma)
99e15a079959a7 Laurent Dufour 2018-04-17  4850  		return VM_FAULT_RETRY;
99e15a079959a7 Laurent Dufour 2018-04-17  4851  	vmf.vma =3D *vma;
1c5371744061fc Peter Zijlstra 2018-04-17  4852  =

1c5371744061fc Peter Zijlstra 2018-04-17  4853  	/* rmb <-> seqlock,vma_rb_=
erase() */
99e15a079959a7 Laurent Dufour 2018-04-17  4854  	seq =3D raw_read_seqcount(=
&vmf.vma->vm_sequence);
736ae8bde8da3c Laurent Dufour 2018-04-17  4855  	if (seq & 1) {
99e15a079959a7 Laurent Dufour 2018-04-17  4856  		trace_spf_vma_changed(_RE=
T_IP_, vmf.vma, address);
99e15a079959a7 Laurent Dufour 2018-04-17  4857  		return VM_FAULT_RETRY;
736ae8bde8da3c Laurent Dufour 2018-04-17  4858  	}
1c5371744061fc Peter Zijlstra 2018-04-17  4859  =

1c5371744061fc Peter Zijlstra 2018-04-17  4860  	/*
1c5371744061fc Peter Zijlstra 2018-04-17  4861  	 * Can't call vm_ops servi=
ce has we don't know what they would do
1c5371744061fc Peter Zijlstra 2018-04-17  4862  	 * with the VMA.
1c5371744061fc Peter Zijlstra 2018-04-17  4863  	 * This include huge page =
from hugetlbfs.
1c5371744061fc Peter Zijlstra 2018-04-17  4864  	 */
99e15a079959a7 Laurent Dufour 2018-04-17  4865  	if (vmf.vma->vm_ops) {
99e15a079959a7 Laurent Dufour 2018-04-17  4866  		trace_spf_vma_notsup(_RET=
_IP_, vmf.vma, address);
99e15a079959a7 Laurent Dufour 2018-04-17  4867  		return VM_FAULT_RETRY;
736ae8bde8da3c Laurent Dufour 2018-04-17  4868  	}
1c5371744061fc Peter Zijlstra 2018-04-17  4869  =

1c5371744061fc Peter Zijlstra 2018-04-17  4870  	/*
1c5371744061fc Peter Zijlstra 2018-04-17  4871  	 * __anon_vma_prepare() re=
quires the mmap_sem to be held
1c5371744061fc Peter Zijlstra 2018-04-17  4872  	 * because vm_next and vm_=
prev must be safe. This can't be guaranteed
1c5371744061fc Peter Zijlstra 2018-04-17  4873  	 * in the speculative path.
1c5371744061fc Peter Zijlstra 2018-04-17  4874  	 */
99e15a079959a7 Laurent Dufour 2018-04-17  4875  	if (unlikely(!vmf.vma->ano=
n_vma)) {
99e15a079959a7 Laurent Dufour 2018-04-17  4876  		trace_spf_vma_notsup(_RET=
_IP_, vmf.vma, address);
99e15a079959a7 Laurent Dufour 2018-04-17  4877  		return VM_FAULT_RETRY;
736ae8bde8da3c Laurent Dufour 2018-04-17  4878  	}
1c5371744061fc Peter Zijlstra 2018-04-17  4879  =

99e15a079959a7 Laurent Dufour 2018-04-17  4880  	vmf.vma_flags =3D READ_ONC=
E(vmf.vma->vm_flags);
99e15a079959a7 Laurent Dufour 2018-04-17  4881  	vmf.vma_page_prot =3D READ=
_ONCE(vmf.vma->vm_page_prot);
1c5371744061fc Peter Zijlstra 2018-04-17  4882  =

1c5371744061fc Peter Zijlstra 2018-04-17  4883  	/* Can't call userland pag=
e fault handler in the speculative path */
736ae8bde8da3c Laurent Dufour 2018-04-17  4884  	if (unlikely(vmf.vma_flags=
 & VM_UFFD_MISSING)) {
99e15a079959a7 Laurent Dufour 2018-04-17  4885  		trace_spf_vma_notsup(_RET=
_IP_, vmf.vma, address);
99e15a079959a7 Laurent Dufour 2018-04-17  4886  		return VM_FAULT_RETRY;
736ae8bde8da3c Laurent Dufour 2018-04-17  4887  	}
1c5371744061fc Peter Zijlstra 2018-04-17  4888  =

736ae8bde8da3c Laurent Dufour 2018-04-17  4889  	if (vmf.vma_flags & VM_GRO=
WSDOWN || vmf.vma_flags & VM_GROWSUP) {
1c5371744061fc Peter Zijlstra 2018-04-17  4890  		/*
1c5371744061fc Peter Zijlstra 2018-04-17  4891  		 * This could be detected=
 by the check address against VMA's
1c5371744061fc Peter Zijlstra 2018-04-17  4892  		 * boundaries but we want=
 to trace it as not supported instead
1c5371744061fc Peter Zijlstra 2018-04-17  4893  		 * of changed.
1c5371744061fc Peter Zijlstra 2018-04-17  4894  		 */
99e15a079959a7 Laurent Dufour 2018-04-17  4895  		trace_spf_vma_notsup(_RET=
_IP_, vmf.vma, address);
99e15a079959a7 Laurent Dufour 2018-04-17  4896  		return VM_FAULT_RETRY;
736ae8bde8da3c Laurent Dufour 2018-04-17  4897  	}
1c5371744061fc Peter Zijlstra 2018-04-17  4898  =

99e15a079959a7 Laurent Dufour 2018-04-17  4899  	if (address < READ_ONCE(vm=
f.vma->vm_start)
99e15a079959a7 Laurent Dufour 2018-04-17  4900  	    || READ_ONCE(vmf.vma->=
vm_end) <=3D address) {
99e15a079959a7 Laurent Dufour 2018-04-17  4901  		trace_spf_vma_changed(_RE=
T_IP_, vmf.vma, address);
99e15a079959a7 Laurent Dufour 2018-04-17  4902  		return VM_FAULT_RETRY;
736ae8bde8da3c Laurent Dufour 2018-04-17  4903  	}
1c5371744061fc Peter Zijlstra 2018-04-17  4904  =

99e15a079959a7 Laurent Dufour 2018-04-17  4905  	if (!arch_vma_access_permi=
tted(vmf.vma, flags & FAULT_FLAG_WRITE,
1c5371744061fc Peter Zijlstra 2018-04-17  4906  				       flags & FAULT_FL=
AG_INSTRUCTION,
99e15a079959a7 Laurent Dufour 2018-04-17  4907  				       flags & FAULT_FL=
AG_REMOTE))
99e15a079959a7 Laurent Dufour 2018-04-17  4908  		goto out_segv;
1c5371744061fc Peter Zijlstra 2018-04-17  4909  =

1c5371744061fc Peter Zijlstra 2018-04-17  4910  	/* This is one is required=
 to check that the VMA has write access set */
1c5371744061fc Peter Zijlstra 2018-04-17  4911  	if (flags & FAULT_FLAG_WRI=
TE) {
99e15a079959a7 Laurent Dufour 2018-04-17  4912  		if (unlikely(!(vmf.vma_fl=
ags & VM_WRITE)))
99e15a079959a7 Laurent Dufour 2018-04-17  4913  			goto out_segv;
99e15a079959a7 Laurent Dufour 2018-04-17  4914  	} else if (unlikely(!(vmf.=
vma_flags & (VM_READ|VM_EXEC|VM_WRITE))))
99e15a079959a7 Laurent Dufour 2018-04-17  4915  		goto out_segv;
1c5371744061fc Peter Zijlstra 2018-04-17  4916  =

1c5371744061fc Peter Zijlstra 2018-04-17  4917  #ifdef CONFIG_NUMA
1c5371744061fc Peter Zijlstra 2018-04-17 @4918  	struct mempolicy *pol;
1c5371744061fc Peter Zijlstra 2018-04-17  4919  =

1c5371744061fc Peter Zijlstra 2018-04-17  4920  	/*
1c5371744061fc Peter Zijlstra 2018-04-17  4921  	 * MPOL_INTERLEAVE implies=
 additional checks in
1c5371744061fc Peter Zijlstra 2018-04-17  4922  	 * mpol_misplaced() which =
are not compatible with the
1c5371744061fc Peter Zijlstra 2018-04-17  4923  	 *speculative page fault p=
rocessing.
1c5371744061fc Peter Zijlstra 2018-04-17  4924  	 */
99e15a079959a7 Laurent Dufour 2018-04-17  4925  	pol =3D __get_vma_policy(v=
mf.vma, address);
1c5371744061fc Peter Zijlstra 2018-04-17  4926  	if (!pol)
1c5371744061fc Peter Zijlstra 2018-04-17  4927  		pol =3D get_task_policy(c=
urrent);
736ae8bde8da3c Laurent Dufour 2018-04-17  4928  	if (!pol)
736ae8bde8da3c Laurent Dufour 2018-04-17  4929  		if (pol && pol->mode =3D=
=3D MPOL_INTERLEAVE) {
99e15a079959a7 Laurent Dufour 2018-04-17  4930  			trace_spf_vma_notsup(_RE=
T_IP_, vmf.vma, address);
99e15a079959a7 Laurent Dufour 2018-04-17  4931  			return VM_FAULT_RETRY;
736ae8bde8da3c Laurent Dufour 2018-04-17  4932  		}
1c5371744061fc Peter Zijlstra 2018-04-17  4933  #endif
1c5371744061fc Peter Zijlstra 2018-04-17  4934  =

1c5371744061fc Peter Zijlstra 2018-04-17  4935  	/*
1c5371744061fc Peter Zijlstra 2018-04-17  4936  	 * Do a speculative lookup=
 of the PTE entry.
1c5371744061fc Peter Zijlstra 2018-04-17  4937  	 */
1c5371744061fc Peter Zijlstra 2018-04-17  4938  	local_irq_disable();
1c5371744061fc Peter Zijlstra 2018-04-17  4939  	pgd =3D pgd_offset(mm, add=
ress);
1c5371744061fc Peter Zijlstra 2018-04-17  4940  	pgdval =3D READ_ONCE(*pgd);
1c5371744061fc Peter Zijlstra 2018-04-17  4941  	if (pgd_none(pgdval) || un=
likely(pgd_bad(pgdval)))
1c5371744061fc Peter Zijlstra 2018-04-17  4942  		goto out_walk;
1c5371744061fc Peter Zijlstra 2018-04-17  4943  =

1c5371744061fc Peter Zijlstra 2018-04-17  4944  	p4d =3D p4d_offset(pgd, ad=
dress);
1c5371744061fc Peter Zijlstra 2018-04-17  4945  	p4dval =3D READ_ONCE(*p4d);
1c5371744061fc Peter Zijlstra 2018-04-17  4946  	if (p4d_none(p4dval) || un=
likely(p4d_bad(p4dval)))
1c5371744061fc Peter Zijlstra 2018-04-17  4947  		goto out_walk;
1c5371744061fc Peter Zijlstra 2018-04-17  4948  =

1c5371744061fc Peter Zijlstra 2018-04-17  4949  	vmf.pud =3D pud_offset(p4d=
, address);
1c5371744061fc Peter Zijlstra 2018-04-17  4950  	pudval =3D READ_ONCE(*vmf.=
pud);
1c5371744061fc Peter Zijlstra 2018-04-17  4951  	if (pud_none(pudval) || un=
likely(pud_bad(pudval)))
1c5371744061fc Peter Zijlstra 2018-04-17  4952  		goto out_walk;
1c5371744061fc Peter Zijlstra 2018-04-17  4953  =

1c5371744061fc Peter Zijlstra 2018-04-17  4954  	/* Huge pages at PUD level=
 are not supported. */
1c5371744061fc Peter Zijlstra 2018-04-17  4955  	if (unlikely(pud_trans_hug=
e(pudval)))
1c5371744061fc Peter Zijlstra 2018-04-17  4956  		goto out_walk;
1c5371744061fc Peter Zijlstra 2018-04-17  4957  =

1c5371744061fc Peter Zijlstra 2018-04-17  4958  	vmf.pmd =3D pmd_offset(vmf=
.pud, address);
1c5371744061fc Peter Zijlstra 2018-04-17  4959  	vmf.orig_pmd =3D READ_ONCE=
(*vmf.pmd);
1c5371744061fc Peter Zijlstra 2018-04-17  4960  	/*
1c5371744061fc Peter Zijlstra 2018-04-17  4961  	 * pmd_none could mean tha=
t a hugepage collapse is in progress
1c5371744061fc Peter Zijlstra 2018-04-17  4962  	 * in our back as collapse=
_huge_page() mark it before
1c5371744061fc Peter Zijlstra 2018-04-17  4963  	 * invalidating the pte (w=
hich is done once the IPI is catched
1c5371744061fc Peter Zijlstra 2018-04-17  4964  	 * by all CPU and we have =
interrupt disabled).
1c5371744061fc Peter Zijlstra 2018-04-17  4965  	 * For this reason we cann=
ot handle THP in a speculative way since we
1c5371744061fc Peter Zijlstra 2018-04-17  4966  	 * can't safely indentify =
an in progress collapse operation done in our
1c5371744061fc Peter Zijlstra 2018-04-17  4967  	 * back on that PMD.
1c5371744061fc Peter Zijlstra 2018-04-17  4968  	 * Regarding the order of =
the following checks, see comment in
1c5371744061fc Peter Zijlstra 2018-04-17  4969  	 * pmd_devmap_trans_unstab=
le()
1c5371744061fc Peter Zijlstra 2018-04-17  4970  	 */
1c5371744061fc Peter Zijlstra 2018-04-17  4971  	if (unlikely(pmd_devmap(vm=
f.orig_pmd) ||
1c5371744061fc Peter Zijlstra 2018-04-17  4972  		     pmd_none(vmf.orig_pm=
d) || pmd_trans_huge(vmf.orig_pmd) ||
1c5371744061fc Peter Zijlstra 2018-04-17  4973  		     is_swap_pmd(vmf.orig=
_pmd)))
1c5371744061fc Peter Zijlstra 2018-04-17  4974  		goto out_walk;
1c5371744061fc Peter Zijlstra 2018-04-17  4975  =

1c5371744061fc Peter Zijlstra 2018-04-17  4976  	/*
1c5371744061fc Peter Zijlstra 2018-04-17  4977  	 * The above does not allo=
cate/instantiate page-tables because doing so
1c5371744061fc Peter Zijlstra 2018-04-17  4978  	 * would lead to the possi=
bility of instantiating page-tables after
1c5371744061fc Peter Zijlstra 2018-04-17  4979  	 * free_pgtables() -- and =
consequently leaking them.
1c5371744061fc Peter Zijlstra 2018-04-17  4980  	 *
1c5371744061fc Peter Zijlstra 2018-04-17  4981  	 * The result is that we t=
ake at least one !speculative fault per PMD
1c5371744061fc Peter Zijlstra 2018-04-17  4982  	 * in order to instantiate=
 it.
1c5371744061fc Peter Zijlstra 2018-04-17  4983  	 */
1c5371744061fc Peter Zijlstra 2018-04-17  4984  =

1c5371744061fc Peter Zijlstra 2018-04-17  4985  	vmf.pte =3D pte_offset_map=
(vmf.pmd, address);
1c5371744061fc Peter Zijlstra 2018-04-17  4986  	vmf.orig_pte =3D READ_ONCE=
(*vmf.pte);
1c5371744061fc Peter Zijlstra 2018-04-17  4987  	barrier(); /* See comment =
in handle_pte_fault() */
1c5371744061fc Peter Zijlstra 2018-04-17  4988  	if (pte_none(vmf.orig_pte)=
) {
1c5371744061fc Peter Zijlstra 2018-04-17  4989  		pte_unmap(vmf.pte);
1c5371744061fc Peter Zijlstra 2018-04-17  4990  		vmf.pte =3D NULL;
1c5371744061fc Peter Zijlstra 2018-04-17  4991  	}
1c5371744061fc Peter Zijlstra 2018-04-17  4992  =

99e15a079959a7 Laurent Dufour 2018-04-17  4993  	vmf.pgoff =3D linear_page_=
index(vmf.vma, address);
99e15a079959a7 Laurent Dufour 2018-04-17  4994  	vmf.gfp_mask =3D __get_fau=
lt_gfp_mask(vmf.vma);
1c5371744061fc Peter Zijlstra 2018-04-17  4995  	vmf.sequence =3D seq;
1c5371744061fc Peter Zijlstra 2018-04-17  4996  	vmf.flags =3D flags;
1c5371744061fc Peter Zijlstra 2018-04-17  4997  =

1c5371744061fc Peter Zijlstra 2018-04-17  4998  	local_irq_enable();
1c5371744061fc Peter Zijlstra 2018-04-17  4999  =

1c5371744061fc Peter Zijlstra 2018-04-17  5000  	/*
1c5371744061fc Peter Zijlstra 2018-04-17  5001  	 * We need to re-validate =
the VMA after checking the bounds, otherwise
1c5371744061fc Peter Zijlstra 2018-04-17  5002  	 * we might have a false p=
ositive on the bounds.
1c5371744061fc Peter Zijlstra 2018-04-17  5003  	 */
99e15a079959a7 Laurent Dufour 2018-04-17  5004  	if (read_seqcount_retry(&v=
mf.vma->vm_sequence, seq)) {
99e15a079959a7 Laurent Dufour 2018-04-17  5005  		trace_spf_vma_changed(_RE=
T_IP_, vmf.vma, address);
99e15a079959a7 Laurent Dufour 2018-04-17  5006  		return VM_FAULT_RETRY;
736ae8bde8da3c Laurent Dufour 2018-04-17  5007  	}
1c5371744061fc Peter Zijlstra 2018-04-17  5008  =

1c5371744061fc Peter Zijlstra 2018-04-17  5009  	mem_cgroup_enter_user_faul=
t();
1c5371744061fc Peter Zijlstra 2018-04-17  5010  	ret =3D handle_pte_fault(&=
vmf);
1c5371744061fc Peter Zijlstra 2018-04-17  5011  	mem_cgroup_exit_user_fault=
();
1c5371744061fc Peter Zijlstra 2018-04-17  5012  =

99e15a079959a7 Laurent Dufour 2018-04-17  5013  	/*
99e15a079959a7 Laurent Dufour 2018-04-17  5014  	 * If there is no need to =
retry, don't return the vma to the caller.
99e15a079959a7 Laurent Dufour 2018-04-17  5015  	 */
99e15a079959a7 Laurent Dufour 2018-04-17  5016  	if (ret !=3D VM_FAULT_RETR=
Y) {
caf05c003b5b62 Laurent Dufour 2018-04-17  5017  		count_vm_event(SPECULATIV=
E_PGFAULT);
99e15a079959a7 Laurent Dufour 2018-04-17  5018  		put_vma(vmf.vma);
99e15a079959a7 Laurent Dufour 2018-04-17  5019  		*vma =3D NULL;
99e15a079959a7 Laurent Dufour 2018-04-17  5020  	}
1c5371744061fc Peter Zijlstra 2018-04-17  5021  =

1c5371744061fc Peter Zijlstra 2018-04-17  5022  	/*
1c5371744061fc Peter Zijlstra 2018-04-17  5023  	 * The task may have enter=
ed a memcg OOM situation but
1c5371744061fc Peter Zijlstra 2018-04-17  5024  	 * if the allocation error=
 was handled gracefully (no
1c5371744061fc Peter Zijlstra 2018-04-17  5025  	 * VM_FAULT_OOM), there is=
 no need to kill anything.
1c5371744061fc Peter Zijlstra 2018-04-17  5026  	 * Just clean up the OOM s=
tate peacefully.
1c5371744061fc Peter Zijlstra 2018-04-17  5027  	 */
1c5371744061fc Peter Zijlstra 2018-04-17  5028  	if (task_in_memcg_oom(curr=
ent) && !(ret & VM_FAULT_OOM))
1c5371744061fc Peter Zijlstra 2018-04-17  5029  		mem_cgroup_oom_synchroniz=
e(false);
1c5371744061fc Peter Zijlstra 2018-04-17  5030  	return ret;
1c5371744061fc Peter Zijlstra 2018-04-17  5031  =

1c5371744061fc Peter Zijlstra 2018-04-17  5032  out_walk:
99e15a079959a7 Laurent Dufour 2018-04-17  5033  	trace_spf_vma_notsup(_RET_=
IP_, vmf.vma, address);
1c5371744061fc Peter Zijlstra 2018-04-17  5034  	local_irq_enable();
99e15a079959a7 Laurent Dufour 2018-04-17  5035  	return VM_FAULT_RETRY;
99e15a079959a7 Laurent Dufour 2018-04-17  5036  =

99e15a079959a7 Laurent Dufour 2018-04-17  5037  out_segv:
99e15a079959a7 Laurent Dufour 2018-04-17  5038  	trace_spf_vma_access(_RET_=
IP_, vmf.vma, address);
99e15a079959a7 Laurent Dufour 2018-04-17  5039  	/*
99e15a079959a7 Laurent Dufour 2018-04-17  5040  	 * We don't return VM_FAUL=
T_RETRY so the caller is not expected to
99e15a079959a7 Laurent Dufour 2018-04-17  5041  	 * retrieve the fetched VM=
A.
99e15a079959a7 Laurent Dufour 2018-04-17  5042  	 */
99e15a079959a7 Laurent Dufour 2018-04-17  5043  	put_vma(vmf.vma);
99e15a079959a7 Laurent Dufour 2018-04-17  5044  	*vma =3D NULL;
99e15a079959a7 Laurent Dufour 2018-04-17  5045  	return VM_FAULT_SIGSEGV;
99e15a079959a7 Laurent Dufour 2018-04-17  5046  }
99e15a079959a7 Laurent Dufour 2018-04-17  5047  =


:::::: The code at line 4918 was first introduced by commit
:::::: 1c5371744061fcce2cc93540fa30ac104db13db7 FROMLIST: mm: provide specu=
lative fault infrastructure

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Suren Baghdasaryan <surenb@google.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0667650775803215039==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
Wg3cONWL1n8B7eDjizDYAQA=
--===============0667650775803215039==--

