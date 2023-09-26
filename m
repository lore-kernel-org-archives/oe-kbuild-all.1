Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAD71C296
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 21:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5736DC4166B;
	Tue, 26 Sep 2023 21:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1695763398;
	bh=DlxP2CXCbVJasxbRyBVxVkyjBSZhsVre5sFgvi0B/xE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KJ8zcHVQZCNdTVRvpY4wGxTEiVHj8qJPwTE6p0mRLayBmlnWs9777pA7X2kxD2csM
	 Ol9GM0vRbN39bSUtitAFOtxZjo5RWjggBtrsDSOYAM+/vPAlmjd+hvl93iNOA4hHb7
	 vPq5ILLsiWUOEdcGxFfMgTn9RqlD51PQN3SMiFsQ=
Date: Tue, 26 Sep 2023 14:23:17 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, =?UTF-8?Q?Micha=C5=82_Miros=C5=82aw?=
 <mirq-linux@rere.qmqm.pl>, Andrei Vagin <avagin@gmail.com>
Subject: Re: [akpm-mm:mm-unstable 264/269] fs/proc/task_mmu.c:2018:13:
 warning: 'pagemap_scan_backout_range' defined but not used
Message-Id: <20230926142317.3a7cb6314a72912251b91131@linux-foundation.org>
In-Reply-To: <202309260903.qzpqNFz3-lkp@intel.com>
References: <202309260903.qzpqNFz3-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 26 Sep 2023 09:32:34 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   81fd55e0d6b6bd11a50070f7639c996a0e3aeea8
> commit: 93538f467c0f64ef3fda61cd862115dca782faa4 [264/269] fs/proc/task_mmu: implement IOCTL to get and optionally clear info about PTEs
> config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230926/202309260903.qzpqNFz3-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309260903.qzpqNFz3-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309260903.qzpqNFz3-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> fs/proc/task_mmu.c:2018:13: warning: 'pagemap_scan_backout_range' defined but not used [-Wunused-function]
>     2018 | static void pagemap_scan_backout_range(struct pagemap_scan_private *p,
>          |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> 

Thanks.  I guess moving the definition inside CONFIG_HUGETLB_PAGE will
suffice,

--- a/fs/proc/task_mmu.c~fs-proc-task_mmu-implement-ioctl-to-get-and-optionally-clear-info-about-ptes-fix-fix-fix
+++ a/fs/proc/task_mmu.c
@@ -1940,6 +1940,19 @@ static void make_uffd_wp_huge_pte(struct
 		set_huge_pte_at(vma->vm_mm, addr, ptep,
 				make_pte_marker(PTE_MARKER_UFFD_WP), psize);
 }
+
+static void pagemap_scan_backout_range(struct pagemap_scan_private *p,
+				       unsigned long addr, unsigned long end)
+{
+	struct page_region *cur_buf = &p->vec_buf[p->vec_buf_index];
+
+	if (cur_buf->start != addr)
+		cur_buf->end = addr;
+	else
+		cur_buf->start = cur_buf->end = 0;
+
+	p->found_pages -= (end - addr) / PAGE_SIZE;
+}
 #endif /* CONFIG_HUGETLB_PAGE */
 
 static bool pagemap_scan_is_interesting_page(unsigned long categories,
@@ -2019,19 +2032,6 @@ static bool pagemap_scan_push_range(unsi
 	return true;
 }
 
-static void pagemap_scan_backout_range(struct pagemap_scan_private *p,
-				       unsigned long addr, unsigned long end)
-{
-	struct page_region *cur_buf = &p->vec_buf[p->vec_buf_index];
-
-	if (cur_buf->start != addr)
-		cur_buf->end = addr;
-	else
-		cur_buf->start = cur_buf->end = 0;
-
-	p->found_pages -= (end - addr) / PAGE_SIZE;
-}
-
 static int pagemap_scan_output(unsigned long categories,
 			       struct pagemap_scan_private *p,
 			       unsigned long addr, unsigned long *end)
_

