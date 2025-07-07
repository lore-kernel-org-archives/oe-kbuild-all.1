Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E674128CF61
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Jul 2025 09:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879294; cv=none; b=WypS5Yj9MKo6UD32FtIOD2Oo/urG8P/2T2V/KFbqO+PYdu31HSNxfR5R5H5ojWoEv9trQ4Ze0zWdPDYfOt5RlWnHTsfMERXAOkHkjPKj29OTvViAPYBae2yQrysqOPdXi4BwcbK2bfZqNbfsal+/s/EXjo/rD69oG3HJL1kU6P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879294; c=relaxed/simple;
	bh=l0D1e8PLVO0x4K8aIVxu438T8+tt19uXwiTEpYrXs4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vr381hR6b7RWkuwJF+13wss+qas4ZbTdqYLWAVS71pEnSguul3njI5JxGL/9MKiI7/kC1EJG9qAXJW7Zed2Zi5hpzLAIPAiWVgT9o/HMiJaFNZXm6ME7MQpkN4NN4sB2p3JJu5mdDgI7B9iO2i999p94yS/D1b8DdpPTrLIe+Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A02D168F;
	Mon,  7 Jul 2025 02:07:59 -0700 (PDT)
Received: from [10.57.82.4] (unknown [10.57.82.4])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3312F3F694;
	Mon,  7 Jul 2025 02:08:11 -0700 (PDT)
Message-ID: <0e0f674b-3b7e-494f-ae7a-fc9dbb98dad4@arm.com>
Date: Mon, 7 Jul 2025 10:08:09 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [akpm-mm:mm-unstable 77/240] mm/filemap.c:3283:37-43: WARNING:
 Consider using vma_pages helper on vma (fwd)
Content-Language: en-GB
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>, Jan Kara <jack@suse.cz>,
 oe-kbuild-all@lists.linux.dev
References: <de97ec15-b151-6133-1c81-3afd5daa6eff@inria.fr>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <de97ec15-b151-6133-1c81-3afd5daa6eff@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Thanks for the report.

Andrew, would you mind squashing in the below?


On 07/07/2025 09:19, Julia Lawall wrote:
> 
> 
> ---------- Forwarded message ----------
> Date: Mon, 7 Jul 2025 14:53:04 +0800
> From: kernel test robot <lkp@intel.com>
> To: oe-kbuild@lists.linux.dev
> Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> Subject: [akpm-mm:mm-unstable 77/240] mm/filemap.c:3283:37-43: WARNING: Consider
>      using vma_pages helper on vma
> 
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> TO: Ryan Roberts <ryan.roberts@arm.com>
> CC: Andrew Morton <akpm@linux-foundation.org>
> CC: Linux Memory Management List <linux-mm@kvack.org>
> CC: Jan Kara <jack@suse.cz>
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   5aa46327724d1abe18a36e9dec4f26dba8989710
> commit: b58187b2ba0af49c48448c3fe1b400cf8fa14232 [77/240] mm/filemap: allow arch to request folio size for exec memory
> :::::: branch date: 33 hours ago
> :::::: commit date: 33 hours ago
> config: i386-randconfig-052-20250707 (https://download.01.org/0day-ci/archive/20250707/202507071459.lLPSj5Bd-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> | Closes: https://lore.kernel.org/r/202507071459.lLPSj5Bd-lkp@intel.com/
> 
> cocci warnings: (new ones prefixed by >>)
>>> mm/filemap.c:3283:37-43: WARNING: Consider using vma_pages helper on vma
> 
> vim +3283 mm/filemap.c
> 
> 4687fdbb805a92 Matthew Wilcox (Oracle  2021-07-24  3240)
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3241  	/*
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3242  	 * If we don't want any read-ahead, don't bother. VM_EXEC case below is
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3243  	 * already intended for random access.
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3244  	 */
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3245  	if ((vm_flags & (VM_RAND_READ | VM_EXEC)) == VM_RAND_READ)
> 6b4c9f4469819a Josef Bacik             2019-03-13  3246  		return fpin;
> 275b12bf5486f6 Wu Fengguang            2011-05-24  3247  	if (!ra->ra_pages)
> 6b4c9f4469819a Josef Bacik             2019-03-13  3248  		return fpin;
> ef00e08e26dd5d Linus Torvalds          2009-06-16  3249
> dcfa24ba68991a Matthew Wilcox (Oracle  2022-05-25  3250) 	if (vm_flags & VM_SEQ_READ) {
> 6b4c9f4469819a Josef Bacik             2019-03-13  3251  		fpin = maybe_unlock_mmap_for_io(vmf, fpin);
> fcd9ae4f7f3b5f Matthew Wilcox (Oracle  2021-04-07  3252) 		page_cache_sync_ra(&ractl, ra->ra_pages);
> 6b4c9f4469819a Josef Bacik             2019-03-13  3253  		return fpin;
> ef00e08e26dd5d Linus Torvalds          2009-06-16  3254  	}
> ef00e08e26dd5d Linus Torvalds          2009-06-16  3255
> 207d04baa3591a Andi Kleen              2011-05-24  3256  	/* Avoid banging the cache line if not needed */
> e630bfac79456d Kirill A. Shutemov      2020-08-14  3257  	mmap_miss = READ_ONCE(ra->mmap_miss);
> e630bfac79456d Kirill A. Shutemov      2020-08-14  3258  	if (mmap_miss < MMAP_LOTSAMISS * 10)
> e630bfac79456d Kirill A. Shutemov      2020-08-14  3259  		WRITE_ONCE(ra->mmap_miss, ++mmap_miss);
> ef00e08e26dd5d Linus Torvalds          2009-06-16  3260
> ef00e08e26dd5d Linus Torvalds          2009-06-16  3261  	/*
> ef00e08e26dd5d Linus Torvalds          2009-06-16  3262  	 * Do we miss much more than hit in this file? If so,
> ef00e08e26dd5d Linus Torvalds          2009-06-16  3263  	 * stop bothering with read-ahead. It will only hurt.
> ef00e08e26dd5d Linus Torvalds          2009-06-16  3264  	 */
> e630bfac79456d Kirill A. Shutemov      2020-08-14  3265  	if (mmap_miss > MMAP_LOTSAMISS)
> 6b4c9f4469819a Josef Bacik             2019-03-13  3266  		return fpin;
> ef00e08e26dd5d Linus Torvalds          2009-06-16  3267
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3268  	fpin = maybe_unlock_mmap_for_io(vmf, fpin);
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3269  	if (vm_flags & VM_EXEC) {
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3270  		/*
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3271  		 * Allow arch to request a preferred minimum folio order for
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3272  		 * executable memory. This can often be beneficial to
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3273  		 * performance if (e.g.) arm64 can contpte-map the folio.
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3274  		 * Executable memory rarely benefits from readahead, due to its
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3275  		 * random access nature, so set async_size to 0.
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3276  		 *
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3277  		 * Limit to the boundaries of the VMA to avoid reading in any
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3278  		 * pad that might exist between sections, which would be a waste
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3279  		 * of memory.
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3280  		 */
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3281  		struct vm_area_struct *vma = vmf->vma;
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3282  		unsigned long start = vma->vm_pgoff;
> b58187b2ba0af4 Ryan Roberts            2025-06-09 @3283  		unsigned long end = start + ((vma->vm_end - vma->vm_start) >> PAGE_SHIFT);


Please squash the following into Commit 9fc12248e06c ("mm/filemap: allow arch to 
request folio size for exec memory") (that's the SHA it has in today's mm-
unstable), to use the vma_pages() helper instead of open-coding:

---8<---
diff --git a/mm/filemap.c b/mm/filemap.c
index 957189a12968..0d0369fb5fa1 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3279,7 +3279,7 @@ static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
 		 */
 		struct vm_area_struct *vma = vmf->vma;
 		unsigned long start = vma->vm_pgoff;
-		unsigned long end = start + ((vma->vm_end - vma->vm_start) >> PAGE_SHIFT);
+		unsigned long end = start + vma_pages(vma);
 		unsigned long ra_end;
 
 		ra->order = exec_folio_order();
---8<---

Thanks,
Ryan


> b58187b2ba0af4 Ryan Roberts            2025-06-09  3284  		unsigned long ra_end;
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3285
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3286  		ra->order = exec_folio_order();
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3287  		ra->start = round_down(vmf->pgoff, 1UL << ra->order);
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3288  		ra->start = max(ra->start, start);
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3289  		ra_end = round_up(ra->start + ra->ra_pages, 1UL << ra->order);
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3290  		ra_end = min(ra_end, end);
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3291  		ra->size = ra_end - ra->start;
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3292  		ra->async_size = 0;
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3293  	} else {
> d30a11004e3411 Wu Fengguang            2009-06-16  3294  		/*
> d30a11004e3411 Wu Fengguang            2009-06-16  3295  		 * mmap read-around
> d30a11004e3411 Wu Fengguang            2009-06-16  3296  		 */
> db660d462525c4 David Howells           2020-10-15  3297  		ra->start = max_t(long, 0, vmf->pgoff - ra->ra_pages / 2);
> 600e19afc5f8a6 Roman Gushchin          2015-11-05  3298  		ra->size = ra->ra_pages;
> 600e19afc5f8a6 Roman Gushchin          2015-11-05  3299  		ra->async_size = ra->ra_pages / 4;
> 28b31a2b2dbfc0 Ryan Roberts            2025-06-09  3300  		ra->order = 0;
> b58187b2ba0af4 Ryan Roberts            2025-06-09  3301  	}
> db660d462525c4 David Howells           2020-10-15  3302  	ractl._index = ra->start;
> 28b31a2b2dbfc0 Ryan Roberts            2025-06-09  3303  	page_cache_ra_order(&ractl, ra);
> 6b4c9f4469819a Josef Bacik             2019-03-13  3304  	return fpin;
> ef00e08e26dd5d Linus Torvalds          2009-06-16  3305  }
> ef00e08e26dd5d Linus Torvalds          2009-06-16  3306
> 

