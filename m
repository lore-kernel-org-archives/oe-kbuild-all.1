Content-Type: multipart/mixed; boundary="===============4123273591845443298=="
MIME-Version: 1.0
From: Andrea Arcangeli <aarcange@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [aa:mapcount_deshare 20/27] mm/gup.c:2756:3: error: implicit declaration of function 'mm_set_has_pinned_flag'
Date: Tue, 11 May 2021 08:31:23 -0400
Message-ID: <YJp5G5gdySlpVHwV@redhat.com>
In-Reply-To: <202105111829.jGDViOAc-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4123273591845443298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

thanks to the report.

Peter, this isn't immediately clear to me, is it perhaps something
related to clang?

This is commit 8dec302e87453234fc7ac1cf4d09e4d577a06cf3

>From 8dec302e87453234fc7ac1cf4d09e4d577a06cf3 Mon Sep 17 00:00:00 2001
From: Andrea Arcangeli <aarcange@redhat.com>
Date: Fri, 7 May 2021 11:05:53 -0400
Subject: [PATCH 1/1] mm: gup: pack has_pinned in MMF_HAS_PINNED

has_pinned 32bit can be packed in the MMF_HAS_PINNED bit as a noop
cleanup.

Any atomic_inc/dec to the mm cacheline shared by all threads in
pin-fast would reintroduce a loss of SMP scalability to pin-fast, so
there's no future potential usefulness to keep an atomic in the mm for
this.

set_bit(MMF_HAS_PINNED) will be theoretically a bit slower than
WRITE_ONCE (atomic_set is equivalent to WRITE_ONCE), but the set_bit
(just like atomic_set after this commit) has to be still issued only
once per "mm", so the difference between the two will be lost in the
noise.

will-it-scale "mmap2" shows no change in performance with enterprise
config as expected.

will-it-scale "pin_fast" retains the > 4000% SMP scalability
performance improvement against upstream as expected.

This is a noop as far as overall performance and SMP scalability are
concerned.

Signed-off-by: Andrea Arcangeli <aarcange@redhat.com>
[peterx: Fix build for task_mmu.c, introduce mm_set_has_pinned_flag, fix
 comment here and there]
Signed-off-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Andrea Arcangeli <aarcange@redhat.com>
---
 include/linux/mm.h             |  2 +-
 include/linux/mm_types.h       | 10 ----------
 include/linux/sched/coredump.h |  8 ++++++++
 kernel/fork.c                  |  1 -
 mm/gup.c                       | 19 +++++++++++++++----
 5 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 5c297b0a97e1..639b3b27ffb7 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1352,7 +1352,7 @@ static inline bool page_needs_cow_for_dma(struct vm_a=
rea_struct *vma,
 	if (!is_cow_mapping(vma->vm_flags))
 		return false;
 =

-	if (!atomic_read(&vma->vm_mm->has_pinned))
+	if (!test_bit(MMF_HAS_PINNED, &vma->vm_mm->flags))
 		return false;
 =

 	return page_maybe_dma_pinned(page);
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index ebfece42843c..7fc7a3320ad9 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -441,16 +441,6 @@ struct mm_struct {
 		 */
 		atomic_t mm_count;
 =

-		/**
-		 * @has_pinned: Whether this mm has pinned any pages.  This can
-		 * be either replaced in the future by @pinned_vm when it
-		 * becomes stable, or grow into a counter on its own. We're
-		 * aggresive on this bit now - even if the pinned pages were
-		 * unpinned later on, we'll still keep this bit set for the
-		 * lifecycle of this mm just for simplicity.
-		 */
-		atomic_t has_pinned;
-
 		/**
 		 * @write_protect_seq: Locked when any thread is write
 		 * protecting pages mapped by this mm to enforce a later COW,
diff --git a/include/linux/sched/coredump.h b/include/linux/sched/coredump.h
index dfd82eab2902..4d9e3a656875 100644
--- a/include/linux/sched/coredump.h
+++ b/include/linux/sched/coredump.h
@@ -73,6 +73,14 @@ static inline int get_dumpable(struct mm_struct *mm)
 #define MMF_OOM_VICTIM		25	/* mm is the oom victim */
 #define MMF_OOM_REAP_QUEUED	26	/* mm was queued for oom_reaper */
 #define MMF_MULTIPROCESS	27	/* mm is shared between processes */
+/*
+ * MMF_HAS_PINNED: Whether this mm has pinned any pages.  This can be eith=
er
+ * replaced in the future by mm.pinned_vm when it becomes stable, or grow =
into
+ * a counter on its own. We're aggresive on this bit for now: even if the
+ * pinned pages were unpinned later on, we'll still keep this bit set for =
the
+ * lifecycle of this mm, just for simplicity.
+ */
+#define MMF_HAS_PINNED		28	/* FOLL_PIN has run, never cleared */
 #define MMF_DISABLE_THP_MASK	(1 << MMF_DISABLE_THP)
 =

 #define MMF_INIT_MASK		(MMF_DUMPABLE_MASK | MMF_DUMP_FILTER_MASK |\
diff --git a/kernel/fork.c b/kernel/fork.c
index dc06afd725cb..e31541da7dbd 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1029,7 +1029,6 @@ static struct mm_struct *mm_init(struct mm_struct *mm=
, struct task_struct *p,
 	mm_pgtables_bytes_init(mm);
 	mm->map_count =3D 0;
 	mm->locked_vm =3D 0;
-	atomic_set(&mm->has_pinned, 0);
 	atomic64_set(&mm->pinned_vm, 0);
 	memset(&mm->rss_stat, 0, sizeof(mm->rss_stat));
 	spin_lock_init(&mm->page_table_lock);
diff --git a/mm/gup.c b/mm/gup.c
index 8ca5e923b54f..d8751840ad0b 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1382,6 +1382,17 @@ int fixup_user_fault(struct mm_struct *mm,
 }
 EXPORT_SYMBOL_GPL(fixup_user_fault);
 =

+/*
+ * Set the MMF_HAS_PINNED if not set yet; after set it'll be there for the=
 mm's
+ * lifecycle.  Avoid setting the bit unless necessary, or it might cause w=
rite
+ * cache bouncing on large SMP machines for concurrent pinned gups.
+ */
+static inline void mm_set_has_pinned_flag(unsigned long *mm_flags)
+{
+       if (!test_bit(MMF_HAS_PINNED, mm_flags))
+               set_bit(MMF_HAS_PINNED, mm_flags);
+}
+
 /*
  * Please note that this function, unlike __get_user_pages will not
  * return 0 for nr_pages > 0 without FOLL_NOWAIT
@@ -1404,8 +1415,8 @@ static __always_inline long __get_user_pages_locked(s=
truct mm_struct *mm,
 		BUG_ON(*locked !=3D 1);
 	}
 =

-	if ((flags & FOLL_PIN) && !atomic_read(&mm->has_pinned))
-		atomic_set(&mm->has_pinned, 1);
+	if (flags & FOLL_PIN)
+		mm_set_has_pinned_flag(&mm->flags);
 =

 	/*
 	 * FOLL_PIN and FOLL_GET are mutually exclusive. Traditional behavior
@@ -2741,8 +2752,8 @@ static int internal_get_user_pages_fast(unsigned long=
 start,
 				       FOLL_FAST_ONLY)))
 		return -EINVAL;
 =

-	if ((gup_flags & FOLL_PIN) && !atomic_read(&current->mm->has_pinned))
-		atomic_set(&current->mm->has_pinned, 1);
+	if (gup_flags & FOLL_PIN)
+		mm_set_has_pinned_flag(&current->mm->flags);
 =

 	if (!(gup_flags & FOLL_FAST_ONLY))
 		might_lock_read(&current->mm->mmap_lock);


On Tue, May 11, 2021 at 06:45:36PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/andrea/aa.git map=
count_deshare
> head:   3e2f198cce0c1792ad71d6d81974b091019b6483
> commit: 8dec302e87453234fc7ac1cf4d09e4d577a06cf3 [20/27] mm: gup: pack ha=
s_pinned in MMF_HAS_PINNED
> config: arm-randconfig-r014-20210511 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project a0fe=
d635fe1701470062495a6ffee1c608f3f1bc)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/andrea/aa.git/c=
ommit/?id=3D8dec302e87453234fc7ac1cf4d09e4d577a06cf3
>         git remote add aa https://git.kernel.org/pub/scm/linux/kernel/git=
/andrea/aa.git
>         git fetch --no-tags aa mapcount_deshare
>         git checkout 8dec302e87453234fc7ac1cf4d09e4d577a06cf3
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 ARCH=3Darm =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

> >> mm/gup.c:2756:3: error: implicit declaration of function 'mm_set_has_p=
inned_flag' [-Werror,-Wimplicit-function-declaration]
>                    mm_set_has_pinned_flag(&current->mm->flags);
>                    ^
>    1 error generated.
> =

> =

> vim +/mm_set_has_pinned_flag +2756 mm/gup.c
> =

>   2740	=

>   2741	static int internal_get_user_pages_fast(unsigned long start,
>   2742						unsigned long nr_pages,
>   2743						unsigned int gup_flags,
>   2744						struct page **pages)
>   2745	{
>   2746		unsigned long len, end;
>   2747		unsigned long nr_pinned;
>   2748		int ret;
>   2749	=

>   2750		if (WARN_ON_ONCE(gup_flags & ~(FOLL_WRITE | FOLL_LONGTERM |
>   2751					       FOLL_FORCE | FOLL_PIN | FOLL_GET |
>   2752					       FOLL_FAST_ONLY)))
>   2753			return -EINVAL;
>   2754	=

>   2755		if (gup_flags & FOLL_PIN)
> > 2756			mm_set_has_pinned_flag(&current->mm->flags);
>   2757	=

>   2758		if (!(gup_flags & FOLL_FAST_ONLY))
>   2759			might_lock_read(&current->mm->mmap_lock);
>   2760	=

>   2761		start =3D untagged_addr(start) & PAGE_MASK;
>   2762		len =3D nr_pages << PAGE_SHIFT;
>   2763		if (check_add_overflow(start, len, &end))
>   2764			return 0;
>   2765		if (unlikely(!access_ok((void __user *)start, len)))
>   2766			return -EFAULT;
>   2767	=

>   2768		nr_pinned =3D lockless_pages_from_mm(start, end, gup_flags, pages=
);
>   2769		if (nr_pinned =3D=3D nr_pages || gup_flags & FOLL_FAST_ONLY)
>   2770			return nr_pinned;
>   2771	=

>   2772		/* Slow path: try to get the remaining pages with get_user_pages =
*/
>   2773		start +=3D nr_pinned << PAGE_SHIFT;
>   2774		pages +=3D nr_pinned;
>   2775		ret =3D __gup_longterm_unlocked(start, nr_pages - nr_pinned, gup_=
flags,
>   2776					      pages);
>   2777		if (ret < 0) {
>   2778			/*
>   2779			 * The caller has to unpin the pages we already pinned so
>   2780			 * returning -errno is not an option
>   2781			 */
>   2782			if (nr_pinned)
>   2783				return nr_pinned;
>   2784			return ret;
>   2785		}
>   2786		return ret + nr_pinned;
>   2787	}
>   2788	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


--===============4123273591845443298==--

