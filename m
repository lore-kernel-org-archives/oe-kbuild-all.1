Content-Type: multipart/mixed; boundary="===============2344159654998554116=="
MIME-Version: 1.0
From: Souptick Joarder <jrdr.linux@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 2950/3150] mm/mremap.c:285:8: warning: variable 'pud' set but not used
Date: Wed, 19 May 2021 01:01:45 +0530
Message-ID: <CAFqt6zZ+LXQWH=bu6e2-3GrLpVPxV_VGoj6j9gMA2B6cN0KVww@mail.gmail.com>
In-Reply-To: <202105180059.7qbrqAhs-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2344159654998554116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 9:49 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   cd557f1c605fc5a2c0eb0b540610f50dc67dd849
> commit: dbee97d1f49a2f2f1f5c26bf15151cc998572e89 [2950/3150] mm/mremap: u=
se pmd/pud_poplulate to update page table entries
> config: i386-randconfig-r006-20210517 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=3D1 build):
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git/commit/?id=3Ddbee97d1f49a2f2f1f5c26bf15151cc998572e89
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/ke=
rnel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout dbee97d1f49a2f2f1f5c26bf15151cc998572e89
>         # save the attached .config to linux build tree
>         make W=3D1 W=3D1 ARCH=3Di386
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    mm/mremap.c: In function 'move_normal_pud':
> >> mm/mremap.c:285:8: warning: variable 'pud' set but not used [-Wunused-=
but-set-variable]
>      285 |  pud_t pud;
>          |        ^~~
>
>
> vim +/pud +285 mm/mremap.c
>
> 2c91bd4a4e2e53 Joel Fernandes (Google  2019-01-03  278)
> c49dd340180260 Kalesh Singh            2020-12-14  279  #ifdef CONFIG_HAV=
E_MOVE_PUD
> c49dd340180260 Kalesh Singh            2020-12-14  280  static bool move_=
normal_pud(struct vm_area_struct *vma, unsigned long old_addr,
> c49dd340180260 Kalesh Singh            2020-12-14  281                   =
 unsigned long new_addr, pud_t *old_pud, pud_t *new_pud)
> c49dd340180260 Kalesh Singh            2020-12-14  282  {
> c49dd340180260 Kalesh Singh            2020-12-14  283          spinlock_=
t *old_ptl, *new_ptl;
> c49dd340180260 Kalesh Singh            2020-12-14  284          struct mm=
_struct *mm =3D vma->vm_mm;
> c49dd340180260 Kalesh Singh            2020-12-14 @285          pud_t pud;
> c49dd340180260 Kalesh Singh            2020-12-14  286
> c49dd340180260 Kalesh Singh            2020-12-14  287          /*
> c49dd340180260 Kalesh Singh            2020-12-14  288           * The de=
stination pud shouldn't be established, free_pgtables()
> c49dd340180260 Kalesh Singh            2020-12-14  289           * should=
 have released it.
> c49dd340180260 Kalesh Singh            2020-12-14  290           */
> c49dd340180260 Kalesh Singh            2020-12-14  291          if (WARN_=
ON_ONCE(!pud_none(*new_pud)))
> c49dd340180260 Kalesh Singh            2020-12-14  292                  r=
eturn false;
> c49dd340180260 Kalesh Singh            2020-12-14  293
> c49dd340180260 Kalesh Singh            2020-12-14  294          /*
> c49dd340180260 Kalesh Singh            2020-12-14  295           * We don=
't have to worry about the ordering of src and dst
> c49dd340180260 Kalesh Singh            2020-12-14  296           * ptlock=
s because exclusive mmap_lock prevents deadlock.
> c49dd340180260 Kalesh Singh            2020-12-14  297           */
> c49dd340180260 Kalesh Singh            2020-12-14  298          old_ptl =
=3D pud_lock(vma->vm_mm, old_pud);
> c49dd340180260 Kalesh Singh            2020-12-14  299          new_ptl =
=3D pud_lockptr(mm, new_pud);
> c49dd340180260 Kalesh Singh            2020-12-14  300          if (new_p=
tl !=3D old_ptl)
> c49dd340180260 Kalesh Singh            2020-12-14  301                  s=
pin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
> c49dd340180260 Kalesh Singh            2020-12-14  302
> c49dd340180260 Kalesh Singh            2020-12-14  303          /* Clear =
the pud */
> c49dd340180260 Kalesh Singh            2020-12-14  304          pud =3D *=
old_pud;
> c49dd340180260 Kalesh Singh            2020-12-14  305          pud_clear=
(old_pud);
> c49dd340180260 Kalesh Singh            2020-12-14  306
> c49dd340180260 Kalesh Singh            2020-12-14  307          VM_BUG_ON=
(!pud_none(*new_pud));
> c49dd340180260 Kalesh Singh            2020-12-14  308
> dbee97d1f49a2f Aneesh Kumar K.V        2021-05-14  309          pud_popul=
ate(mm, new_pud, (pmd_t *)pud_page_vaddr(pud));

pud is passed to pud_page_vaddr().

> c49dd340180260 Kalesh Singh            2020-12-14  310          flush_tlb=
_range(vma, old_addr, old_addr + PUD_SIZE);
> c49dd340180260 Kalesh Singh            2020-12-14  311          if (new_p=
tl !=3D old_ptl)
> c49dd340180260 Kalesh Singh            2020-12-14  312                  s=
pin_unlock(new_ptl);
> c49dd340180260 Kalesh Singh            2020-12-14  313          spin_unlo=
ck(old_ptl);
> c49dd340180260 Kalesh Singh            2020-12-14  314
> c49dd340180260 Kalesh Singh            2020-12-14  315          return tr=
ue;
> c49dd340180260 Kalesh Singh            2020-12-14  316  }
> c49dd340180260 Kalesh Singh            2020-12-14  317  #else
> c49dd340180260 Kalesh Singh            2020-12-14  318  static inline boo=
l move_normal_pud(struct vm_area_struct *vma,
> c49dd340180260 Kalesh Singh            2020-12-14  319                  u=
nsigned long old_addr, unsigned long new_addr, pud_t *old_pud,
> c49dd340180260 Kalesh Singh            2020-12-14  320                  p=
ud_t *new_pud)
> c49dd340180260 Kalesh Singh            2020-12-14  321  {
> c49dd340180260 Kalesh Singh            2020-12-14  322          return fa=
lse;
> c49dd340180260 Kalesh Singh            2020-12-14  323  }
> c49dd340180260 Kalesh Singh            2020-12-14  324  #endif
> c49dd340180260 Kalesh Singh            2020-12-14  325
>
> :::::: The code at line 285 was first introduced by commit
> :::::: c49dd340180260c6239e453263a9a244da9a7c85 mm: speedup mremap on 1GB=
 or larger regions
>
> :::::: TO: Kalesh Singh <kaleshsingh@google.com>
> :::::: CC: Linus Torvalds <torvalds@linux-foundation.org>
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2344159654998554116==--

