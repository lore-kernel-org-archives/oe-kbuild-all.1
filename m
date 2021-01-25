Content-Type: multipart/mixed; boundary="===============1874173371080808259=="
MIME-Version: 1.0
From: Axel Rasmussen <axelrasmussen@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2 7/9] userfaultfd: add UFFDIO_CONTINUE ioctl
Date: Mon, 25 Jan 2021 09:50:46 -0800
Message-ID: <CAJHvVcjHmSNXVNxtR3gJSxUnB0yifr+CSi9GnZDXrHeQwi2EpA@mail.gmail.com>
In-Reply-To: <202101252146.VjG3nQXC-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1874173371080808259==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This build error seems to be caused by a missing #ifdef
CONFIG_USERFAULTFD. I'll send a v3 with this fix, after waiting for
other feedback on the v2 version.

On Mon, Jan 25, 2021 at 5:37 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Axel,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on arm64/for-next/core]
> [also build test ERROR on powerpc/next s390/features tip/perf/core linus/=
master v5.11-rc5 next-20210122]
> [cannot apply to hp-parisc/for-next hnaz-linux-mm/master ia64/next sparc-=
next/master sparc/master]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Axel-Rasmussen/userfault=
fd-add-minor-fault-handling/20210125-104035
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git f=
or-next/core
> config: x86_64-randconfig-a013-20210125 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 12d0=
753aca22896fda2cf76781b0ee0524d55065)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # https://github.com/0day-ci/linux/commit/b8fb53c3a341b9b853aa328=
6286c807088311dbd
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Axel-Rasmussen/userfaultfd-add-m=
inor-fault-handling/20210125-104035
>         git checkout b8fb53c3a341b9b853aa3286286c807088311dbd
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    In file included from mm/hugetlb.c:39:
>    include/linux/hugetlb.h:142:10: warning: declaration of 'enum mcopy_at=
omic_mode' will not be visible outside of this function [-Wvisibility]
>                                    enum mcopy_atomic_mode mode,
>                                         ^
>    mm/hugetlb.c:4659:13: warning: declaration of 'enum mcopy_atomic_mode'=
 will not be visible outside of this function [-Wvisibility]
>                                enum mcopy_atomic_mode mode,
>                                     ^
> >> mm/hugetlb.c:4654:5: error: conflicting types for 'hugetlb_mcopy_atomi=
c_pte'
>    int hugetlb_mcopy_atomic_pte(struct mm_struct *dst_mm,
>        ^
>    include/linux/hugetlb.h:138:5: note: previous declaration is here
>    int hugetlb_mcopy_atomic_pte(struct mm_struct *dst_mm, pte_t *dst_pte,
>        ^
> >> mm/hugetlb.c:4659:31: error: variable has incomplete type 'enum mcopy_=
atomic_mode'
>                                enum mcopy_atomic_mode mode,
>                                                       ^
>    mm/hugetlb.c:4659:13: note: forward declaration of 'enum mcopy_atomic_=
mode'
>                                enum mcopy_atomic_mode mode,
>                                     ^
> >> mm/hugetlb.c:4675:25: error: use of undeclared identifier 'MCOPY_ATOMI=
C_CONTINUE'
>            if (!*pagep && mode !=3D MCOPY_ATOMIC_CONTINUE) {
>                                   ^
>    mm/hugetlb.c:4692:21: error: use of undeclared identifier 'MCOPY_ATOMI=
C_CONTINUE'
>            } else if (mode =3D=3D MCOPY_ATOMIC_CONTINUE) {
>                               ^
>    mm/hugetlb.c:4711:27: error: use of undeclared identifier 'MCOPY_ATOMI=
C_CONTINUE'
>            if (vm_shared && mode !=3D MCOPY_ATOMIC_CONTINUE) {
>                                     ^
>    mm/hugetlb.c:4771:14: error: use of undeclared identifier 'MCOPY_ATOMI=
C_CONTINUE'
>            if (mode !=3D MCOPY_ATOMIC_CONTINUE)
>                        ^
>    2 warnings and 6 errors generated.
>
>
> vim +/hugetlb_mcopy_atomic_pte +4654 mm/hugetlb.c
>
> 86e5216f8d8aa25 Adam Litke        2006-01-06  4649
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4650  /*
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4651   * Used by userfaultf=
d UFFDIO_COPY.  Based on mcopy_atomic_pte with
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4652   * modifications for =
huge pages.
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4653   */
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22 @4654  int hugetlb_mcopy_ato=
mic_pte(struct mm_struct *dst_mm,
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4655                       =
   pte_t *dst_pte,
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4656                       =
   struct vm_area_struct *dst_vma,
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4657                       =
   unsigned long dst_addr,
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4658                       =
   unsigned long src_addr,
> b8fb53c3a341b9b Axel Rasmussen    2021-01-22 @4659                       =
   enum mcopy_atomic_mode mode,
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4660                       =
   struct page **pagep)
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4661  {
> 1e3921471354244 Andrea Arcangeli  2017-11-02  4662      struct address_sp=
ace *mapping;
> 1e3921471354244 Andrea Arcangeli  2017-11-02  4663      pgoff_t idx;
> 1e3921471354244 Andrea Arcangeli  2017-11-02  4664      unsigned long siz=
e;
> 1c9e8def43a3452 Mike Kravetz      2017-02-22  4665      int vm_shared =3D=
 dst_vma->vm_flags & VM_SHARED;
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4666      struct hstate *h =
=3D hstate_vma(dst_vma);
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4667      pte_t _dst_pte;
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4668      spinlock_t *ptl;
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4669      int ret;
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4670      struct page *page;
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4671
> b8fb53c3a341b9b Axel Rasmussen    2021-01-22  4672      mapping =3D dst_v=
ma->vm_file->f_mapping;
> b8fb53c3a341b9b Axel Rasmussen    2021-01-22  4673      idx =3D vma_hugec=
ache_offset(h, dst_vma, dst_addr);
> b8fb53c3a341b9b Axel Rasmussen    2021-01-22  4674
> b8fb53c3a341b9b Axel Rasmussen    2021-01-22 @4675      if (!*pagep && mo=
de !=3D MCOPY_ATOMIC_CONTINUE) {
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4676              ret =3D -=
ENOMEM;
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4677              page =3D =
alloc_huge_page(dst_vma, dst_addr, 0);
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4678              if (IS_ER=
R(page))
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4679                      g=
oto out;
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4680
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4681              ret =3D c=
opy_huge_page_from_user(page,
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4682                       =
                       (const void __user *) src_addr,
> 810a56b943e265b Mike Kravetz      2017-02-22  4683                       =
                       pages_per_huge_page(h), false);
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4684
> c1e8d7c6a7a682e Michel Lespinasse 2020-06-08  4685              /* fallba=
ck to copy_from_user outside mmap_lock */
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4686              if (unlik=
ely(ret)) {
> 9e368259ad98835 Andrea Arcangeli  2018-11-30  4687                      r=
et =3D -ENOENT;
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4688                      *=
pagep =3D page;
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4689                      /=
* don't free the page */
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4690                      g=
oto out;
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4691              }
> b8fb53c3a341b9b Axel Rasmussen    2021-01-22  4692      } else if (mode =
=3D=3D MCOPY_ATOMIC_CONTINUE) {
> b8fb53c3a341b9b Axel Rasmussen    2021-01-22  4693              ret =3D -=
EFAULT;
> b8fb53c3a341b9b Axel Rasmussen    2021-01-22  4694              page =3D =
find_lock_page(mapping, idx);
> b8fb53c3a341b9b Axel Rasmussen    2021-01-22  4695              *pagep =
=3D NULL;
> b8fb53c3a341b9b Axel Rasmussen    2021-01-22  4696              if (!page)
> b8fb53c3a341b9b Axel Rasmussen    2021-01-22  4697                      g=
oto out;
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4698      } else {
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4699              page =3D =
*pagep;
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4700              *pagep =
=3D NULL;
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4701      }
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4702
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4703      /*
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4704       * The memory bar=
rier inside __SetPageUptodate makes sure that
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4705       * preceding stor=
es to the page contents become visible before
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4706       * the set_pte_at=
() write.
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4707       */
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4708      __SetPageUptodate=
(page);
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4709
> b8fb53c3a341b9b Axel Rasmussen    2021-01-22  4710      /* Add shared, ne=
wly allocated pages to the page cache. */
> b8fb53c3a341b9b Axel Rasmussen    2021-01-22  4711      if (vm_shared && =
mode !=3D MCOPY_ATOMIC_CONTINUE) {
> 1e3921471354244 Andrea Arcangeli  2017-11-02  4712              size =3D =
i_size_read(mapping->host) >> huge_page_shift(h);
> 1e3921471354244 Andrea Arcangeli  2017-11-02  4713              ret =3D -=
EFAULT;
> 1e3921471354244 Andrea Arcangeli  2017-11-02  4714              if (idx >=
=3D size)
> 1e3921471354244 Andrea Arcangeli  2017-11-02  4715                      g=
oto out_release_nounlock;
> 1c9e8def43a3452 Mike Kravetz      2017-02-22  4716
> 1e3921471354244 Andrea Arcangeli  2017-11-02  4717              /*
> 1e3921471354244 Andrea Arcangeli  2017-11-02  4718               * Serial=
ization between remove_inode_hugepages() and
> 1e3921471354244 Andrea Arcangeli  2017-11-02  4719               * huge_a=
dd_to_page_cache() below happens through the
> 1e3921471354244 Andrea Arcangeli  2017-11-02  4720               * hugetl=
b_fault_mutex_table that here must be hold by
> 1e3921471354244 Andrea Arcangeli  2017-11-02  4721               * the ca=
ller.
> 1e3921471354244 Andrea Arcangeli  2017-11-02  4722               */
> 1c9e8def43a3452 Mike Kravetz      2017-02-22  4723              ret =3D h=
uge_add_to_page_cache(page, mapping, idx);
> 1c9e8def43a3452 Mike Kravetz      2017-02-22  4724              if (ret)
> 1c9e8def43a3452 Mike Kravetz      2017-02-22  4725                      g=
oto out_release_nounlock;
> 1c9e8def43a3452 Mike Kravetz      2017-02-22  4726      }
> 1c9e8def43a3452 Mike Kravetz      2017-02-22  4727
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4728      ptl =3D huge_pte_=
lockptr(h, dst_mm, dst_pte);
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4729      spin_lock(ptl);
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4730
> 1e3921471354244 Andrea Arcangeli  2017-11-02  4731      /*
> 1e3921471354244 Andrea Arcangeli  2017-11-02  4732       * Recheck the i_=
size after holding PT lock to make sure not
> 1e3921471354244 Andrea Arcangeli  2017-11-02  4733       * to leave any p=
age mapped (as page_mapped()) beyond the end
> 1e3921471354244 Andrea Arcangeli  2017-11-02  4734       * of the i_size =
(remove_inode_hugepages() is strict about
> 1e3921471354244 Andrea Arcangeli  2017-11-02  4735       * enforcing that=
). If we bail out here, we'll also leave a
> 1e3921471354244 Andrea Arcangeli  2017-11-02  4736       * page in the ra=
dix tree in the vm_shared case beyond the end
> 1e3921471354244 Andrea Arcangeli  2017-11-02  4737       * of the i_size,=
 but remove_inode_hugepages() will take care
> 1e3921471354244 Andrea Arcangeli  2017-11-02  4738       * of it as soon =
as we drop the hugetlb_fault_mutex_table.
> 1e3921471354244 Andrea Arcangeli  2017-11-02  4739       */
> 1e3921471354244 Andrea Arcangeli  2017-11-02  4740      size =3D i_size_r=
ead(mapping->host) >> huge_page_shift(h);
> 1e3921471354244 Andrea Arcangeli  2017-11-02  4741      ret =3D -EFAULT;
> 1e3921471354244 Andrea Arcangeli  2017-11-02  4742      if (idx >=3D size)
> 1e3921471354244 Andrea Arcangeli  2017-11-02  4743              goto out_=
release_unlock;
> 1e3921471354244 Andrea Arcangeli  2017-11-02  4744
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4745      ret =3D -EEXIST;
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4746      if (!huge_pte_non=
e(huge_ptep_get(dst_pte)))
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4747              goto out_=
release_unlock;
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4748
> 1c9e8def43a3452 Mike Kravetz      2017-02-22  4749      if (vm_shared) {
> 1c9e8def43a3452 Mike Kravetz      2017-02-22  4750              page_dup_=
rmap(page, true);
> 1c9e8def43a3452 Mike Kravetz      2017-02-22  4751      } else {
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4752              ClearPage=
Private(page);
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4753              hugepage_=
add_new_anon_rmap(page, dst_vma, dst_addr);
> 1c9e8def43a3452 Mike Kravetz      2017-02-22  4754      }
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4755
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4756      _dst_pte =3D make=
_huge_pte(dst_vma, page, dst_vma->vm_flags & VM_WRITE);
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4757      if (dst_vma->vm_f=
lags & VM_WRITE)
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4758              _dst_pte =
=3D huge_pte_mkdirty(_dst_pte);
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4759      _dst_pte =3D pte_=
mkyoung(_dst_pte);
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4760
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4761      set_huge_pte_at(d=
st_mm, dst_addr, dst_pte, _dst_pte);
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4762
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4763      (void)huge_ptep_s=
et_access_flags(dst_vma, dst_addr, dst_pte, _dst_pte,
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4764                       =
               dst_vma->vm_flags & VM_WRITE);
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4765      hugetlb_count_add=
(pages_per_huge_page(h), dst_mm);
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4766
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4767      /* No need to inv=
alidate - it was non-present before */
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4768      update_mmu_cache(=
dst_vma, dst_addr, dst_pte);
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4769
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4770      spin_unlock(ptl);
> b8fb53c3a341b9b Axel Rasmussen    2021-01-22  4771      if (mode !=3D MCO=
PY_ATOMIC_CONTINUE)
> cb6acd01e2e43fd Mike Kravetz      2019-02-28  4772              set_page_=
huge_active(page);
> 1c9e8def43a3452 Mike Kravetz      2017-02-22  4773      if (vm_shared)
> 1c9e8def43a3452 Mike Kravetz      2017-02-22  4774              unlock_pa=
ge(page);
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4775      ret =3D 0;
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4776  out:
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4777      return ret;
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4778  out_release_unlock:
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4779      spin_unlock(ptl);
> 1c9e8def43a3452 Mike Kravetz      2017-02-22  4780      if (vm_shared)
> 1c9e8def43a3452 Mike Kravetz      2017-02-22  4781              unlock_pa=
ge(page);
> 5af10dfd0afc559 Andrea Arcangeli  2017-08-10  4782  out_release_nounlock:
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4783      put_page(page);
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4784      goto out;
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4785  }
> 8fb5debc5fcd450 Mike Kravetz      2017-02-22  4786
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1874173371080808259==--

