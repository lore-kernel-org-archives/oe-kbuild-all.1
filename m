Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C37833993;
	Sat, 17 Jan 2026 01:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768612032; cv=none; b=kc/Cu9UcBtquP4HPF1Mds5lbfpOU4IhRPVOXMKs9WSFhwN4AZcMzLmgMzBTp1hOGxcAr7TNz+5jGwpCKI0UqmCMIvsKz/os1EZ28i+D0aATCppBAPymp/AXftw8VcKvBc1f2TMJPv3SxZ1RvzqFUVUi52VHOxGvMmX3q0EZubQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768612032; c=relaxed/simple;
	bh=Yb4v3IajHaFF5TUgV9j7J4S6o9nlOQUjjSjdutEwvZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EWeyU735qbCrHW1O6Eov9GnTzss5djBVXy6ecoTNhNVXjsVTyb5EY7jUdllXijMn4lrSwL0XkKsuvAQrlBjPEaXTFU6VkwobnmnvRHMw8dnlpnBRpEznHmkHzqL9B9ac1S8VVG2VxgNX/eQJ9lwDEGQm3MTRib5NpsAKuEsbG0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sXJ14kh+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sXJ14kh+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80632C116C6;
	Sat, 17 Jan 2026 01:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768612031;
	bh=Yb4v3IajHaFF5TUgV9j7J4S6o9nlOQUjjSjdutEwvZg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sXJ14kh+megJR7ZOJymB4hVjgWQBTshQgWAykPvbODTIMgJBlTSk/DaQoHenmk21y
	 21PeMOXoVGnOPPx4zOtNaGYWrt1L6gGQqBA3oxqRPlxnL++iZ6oC9Anz/sIElqByzm
	 yuEpQXXvsdb+p3y/4auAV++rBvZgKfaPome271UnCHY6jxXZmpwdmDRh52xpP0Yj88
	 a7jbSPDLSyD0Vr375udWQlgyjbCK11jkGP6DlFvzo6sYAwDLAW+czzdqCGkKpm34Ij
	 G8Rbg4FKg54onWj2NLup2HUjqV2q91UBle7ge9YfaohoZBQ1SQvPVu5brs/HXa78fO
	 HpZUnfUJmCCtw==
From: SeongJae Park <sj@kernel.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: SeongJae Park <sj@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	kernel test robot <lkp@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	shikemeng@huaweicloud.com,
	kasong@tencent.com,
	nphamcs@gmail.com,
	bhe@redhat.com,
	baohua@kernel.org,
	chrisl@kernel.org,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2 08/10] mm/vma: Use unmap_desc in exit_mmap() and vms_clear_ptes()
Date: Fri, 16 Jan 2026 17:07:06 -0800
Message-ID: <20260117010707.202128-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <vcxnsoihqohhmgurdkbx2hvybuhaql7yruv45k63jwevlpkdod@4eugq6xubcug>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 16 Jan 2026 11:15:43 -0500 "Liam R. Howlett" <Liam.Howlett@oracle.com> wrote:

> * Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [260116 03:27]:
> > On Fri, Jan 16, 2026 at 10:04:27AM +0800, kernel test robot wrote:
> > > Hi Liam,
> > >
> > > kernel test robot noticed the following build errors:
> > >
> > > [auto build test ERROR on akpm-mm/mm-everything]
> > > [also build test ERROR on linus/master v6.19-rc5 next-20260115]
> > > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > > And when submitting patch, we suggest to use '--base' as documented in
> > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > >
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Liam-R-Howlett/mm-mmap-Move-exit_mmap-trace-point/20260116-023126
> > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> > > patch link:    https://lore.kernel.org/r/20260115182720.1691130-9-Liam.Howlett%40oracle.com
> > > patch subject: [PATCH v2 08/10] mm/vma: Use unmap_desc in exit_mmap() and vms_clear_ptes()
> > > config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20260116/202601160925.VR8a2hUw-lkp@intel.com/config)
> > > compiler: m68k-linux-gcc (GCC) 15.2.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160925.VR8a2hUw-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202601160925.VR8a2hUw-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > >    In file included from mm/internal.h:23,
> > >                     from mm/filemap.c:54:
> > >    mm/vma.h: In function 'unmap_all_init':
> > > >> mm/vma.h:175:27: error: 'FIRST_USER_ADDRESS' undeclared (first use in this function)
> > >      175 |         unmap->pg_start = FIRST_USER_ADDRESS;
> > >          |                           ^~~~~~~~~~~~~~~~~~
> > >    mm/vma.h:175:27: note: each undeclared identifier is reported only once for each function it appears in
> > > >> mm/vma.h:176:25: error: 'USER_PGTABLES_CEILING' undeclared (first use in this function)
> > >      176 |         unmap->pg_end = USER_PGTABLES_CEILING;
> > >          |                         ^~~~~~~~~~~~~~~~~~~~~
> > >
> > 
> > Suspect you need to add:
> > 
> > #include <linux/pgtable.h>
> > 
> > to mm/vma_internal.h.
> > 
> > Some arches don't define it and that header has:
> > 
> > #ifndef USER_PGTABLES_CEILING
> > #define USER_PGTABLES_CEILING	0UL
> > #endif
> > 
> > ...
> > 
> > #ifndef FIRST_USER_ADDRESS
> > #define FIRST_USER_ADDRESS	0UL
> > #endif

But the macro definitions are enclosed by '#ifdef CONFIG_MMU'.  I have
!CONFIG_MMU build test, which shows similar errors, even after Lorenzo's
suggestion is applied.  Should we move the definitions out of the '#ifdef
CONFIG_MMU', or implement another unmap_all_init() for !CONFIG_MMU case?

I confirmed a simple version of the first option (moving definitions out of
CONFIG_MMU, in addition to including pgtable.h) like below works at least for
my !CONFIG_MMU test.


Thanks,
SJ

[...]
=== >8 ===
From d5b441af2f31164a46240ce4179db8e0d2fff372 Mon Sep 17 00:00:00 2001
From: SeongJae Park <sj@kernel.org>
Date: Fri, 16 Jan 2026 17:01:27 -0800
Subject: [PATCH] mm/vma: temporal build fix

Link: https://lkml.kernel.org/r/20260115182720.1691130-9-Liam.Howlett@oracle.com
Signed-off-by: SeongJae Park <sj@kernel.org>
---
 include/linux/pgtable.h | 38 +++++++++++++++++++-------------------
 mm/vma_internal.h       |  1 +
 2 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index ce2dbebade4c..4f063438a4fc 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -22,25 +22,6 @@
 #error CONFIG_PGTABLE_LEVELS is not consistent with __PAGETABLE_{P4D,PUD,PMD}_FOLDED
 #endif
 
-/*
- * On almost all architectures and configurations, 0 can be used as the
- * upper ceiling to free_pgtables(): on many architectures it has the same
- * effect as using TASK_SIZE.  However, there is one configuration which
- * must impose a more careful limit, to avoid freeing kernel pgtables.
- */
-#ifndef USER_PGTABLES_CEILING
-#define USER_PGTABLES_CEILING	0UL
-#endif
-
-/*
- * This defines the first usable user address. Platforms
- * can override its value with custom FIRST_USER_ADDRESS
- * defined in their respective <asm/pgtable.h>.
- */
-#ifndef FIRST_USER_ADDRESS
-#define FIRST_USER_ADDRESS	0UL
-#endif
-
 /*
  * This defines the generic helper for accessing PMD page
  * table page. Although platforms can still override this
@@ -1660,6 +1641,25 @@ void arch_sync_kernel_mappings(unsigned long start, unsigned long end);
 
 #endif /* CONFIG_MMU */
 
+/*
+ * On almost all architectures and configurations, 0 can be used as the
+ * upper ceiling to free_pgtables(): on many architectures it has the same
+ * effect as using TASK_SIZE.  However, there is one configuration which
+ * must impose a more careful limit, to avoid freeing kernel pgtables.
+ */
+#ifndef USER_PGTABLES_CEILING
+#define USER_PGTABLES_CEILING	0UL
+#endif
+
+/*
+ * This defines the first usable user address. Platforms
+ * can override its value with custom FIRST_USER_ADDRESS
+ * defined in their respective <asm/pgtable.h>.
+ */
+#ifndef FIRST_USER_ADDRESS
+#define FIRST_USER_ADDRESS	0UL
+#endif
+
 /*
  * No-op macros that just return the current protection value. Defined here
  * because these macros can be used even if CONFIG_MMU is not defined.
diff --git a/mm/vma_internal.h b/mm/vma_internal.h
index 2f05735ff190..2da6d224c1a8 100644
--- a/mm/vma_internal.h
+++ b/mm/vma_internal.h
@@ -46,6 +46,7 @@
 #include <linux/swap.h>
 #include <linux/uprobes.h>
 #include <linux/userfaultfd_k.h>
+#include <linux/pgtable.h>
 
 #include <asm/current.h>
 #include <asm/tlb.h>
-- 
2.47.3


