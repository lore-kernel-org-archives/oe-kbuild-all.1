Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29C71B0414
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 14:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734532023; cv=none; b=BdetCIYrs0EoJ123hYsJJ1WKbr5cU4iuKBpIeCrLneDSBe0IIbUqC9pwF7mmDIXyCS1s25bJ6FYO858KHL6OgaffhsPhkbeJkNtWQKt2TGLg390km6SEUKfCHBNvz1cQLcwtPymYl7wjrYGRXYoz48bCRW9HP/i43CPkXskTfm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734532023; c=relaxed/simple;
	bh=yq1YNLSGsWLbD1CsjKOE6pyaCLjmGuwoSnJpg8ulcUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s2zhYcoYDi+wM949BkQDG3Zh01WhJ+aFRL+1zx2knNSkBGpo7SeU+6NCcyyLk5bcQ3kKiZoFjrNmlgj8BkqKWTj4Z6M7nlotUaB3zlJxfVTBxPYqjtd4VBA+UYsRFNkU08QyNxeOttp3xRSyhpi4aE8zxgfIBo1e1u55m2rTgF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U4LJITeH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4LJITeH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734532022; x=1766068022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yq1YNLSGsWLbD1CsjKOE6pyaCLjmGuwoSnJpg8ulcUY=;
  b=U4LJITeHcye2sIq8ou4T76uWy4NbFWlOQfU5EhMWV+01QbTOmJFA2jXt
   XaB4smUnJUksy7sIiRnwlOwQ4dHpjhPI9BnkQa8Q+hzm7ZhAlsByWP7yR
   tS2EzAoPSz+STWhxvylcnj6bwR8GEMrGq2tAerSqC33lyEZk21ZxqlFzw
   UFHfS7imcAek2gCQVKN0Ra4oH1LDQpYXZxFM+t0ngsv6R0ecTDTkoS9Qf
   BHgLFykLBbZuvE627Qu4X8ba9VK4hvxSoFSe8tOrEWAkrZBScBhWP6huh
   JNXYxz3vkCbH5Q8cfx43VdzvaGwXZeyfaPiax1z2UFM3qqg5o+ZwRZApA
   Q==;
X-CSE-ConnectionGUID: 2cwB7XtWRh+q6FkegYErCA==
X-CSE-MsgGUID: 4bjsYGYFQfezUdpLnTOlkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="45700998"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="45700998"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 06:27:01 -0800
X-CSE-ConnectionGUID: tOfgaAhtRJqJ7I6WdLutQg==
X-CSE-MsgGUID: 2A+5jbAtSHuric8uet9H/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102873305"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Dec 2024 06:26:57 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNv0k-000GNq-3C;
	Wed, 18 Dec 2024 14:26:50 +0000
Date: Wed, 18 Dec 2024 22:25:59 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Hannes Reinecke <hare@suse.de>
Subject: [mcgrof:large-block-buffer-heads-20241217 7/14] fs/buffer.c:2441:21:
 warning: unused variable 'i'
Message-ID: <202412182210.uihMSMvf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git large-block-buffer-heads-20241217
head:   a9052a4e88861e96d9295dfc21e7e73b0924d952
commit: f5eb17e9daca255888a27ed1ce0d3339f9d5c68f [7/14] fs/buffer: add iteration support for block_read_full_folio()
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241218/202412182210.uihMSMvf-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412182210.uihMSMvf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412182210.uihMSMvf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/buffer.c: In function 'bh_read_iter':
>> fs/buffer.c:2441:21: warning: unused variable 'i' [-Wunused-variable]
    2441 |         int nr = 0, i = 0;
         |                     ^


vim +/i +2441 fs/buffer.c

  2425	
  2426	/*
  2427	 * Reads up to MAX_BUF_PER_PAGE buffer heads at a time on a folio on the given
  2428	 * block range iblock to lblock and helps update the number of buffer-heads
  2429	 * which were not uptodate or unmapped for which we issued an async read for
  2430	 * on iter->bh_folio_reads for the full folio. Returns the last buffer-head we
  2431	 * worked on.
  2432	 */
  2433	static struct buffer_head *bh_read_iter(struct folio *folio,
  2434						struct buffer_head *pivot,
  2435						struct buffer_head *head,
  2436						struct inode *inode,
  2437						struct bh_iter *iter, sector_t lblock)
  2438	{
  2439		struct buffer_head *arr[MAX_BUF_PER_PAGE];
  2440		struct buffer_head *bh = pivot, *last;
> 2441		int nr = 0, i = 0;
  2442		size_t blocksize = head->b_size;
  2443		bool no_reads = false;
  2444		bool fully_mapped = false;
  2445	
  2446		/* Stage one - collect buffer heads we need issue a read for */
  2447	
  2448		/* collect buffers not uptodate and not mapped yet */
  2449		for_each_bh_pivot(bh, last, head) {
  2450			BUG_ON(nr >= MAX_BUF_PER_PAGE);
  2451	
  2452			if (buffer_uptodate(bh)) {
  2453				iter->iblock++;
  2454				continue;
  2455			}
  2456	
  2457			if (!buffer_mapped(bh)) {
  2458				int err = 0;
  2459	
  2460				iter->unmapped++;
  2461				if (iter->iblock < lblock) {
  2462					WARN_ON(bh->b_size != blocksize);
  2463					err = iter->get_block(inode, iter->iblock,
  2464							      bh, 0);
  2465					if (err)
  2466						iter->any_get_block_error = true;
  2467				}
  2468				if (!buffer_mapped(bh)) {
  2469					folio_zero_range(folio, bh_offset(bh),
  2470							blocksize);
  2471					if (!err)
  2472						set_buffer_uptodate(bh);
  2473					iter->iblock++;
  2474					continue;
  2475				}
  2476				/*
  2477				 * get_block() might have updated the buffer
  2478				 * synchronously
  2479				 */
  2480				if (buffer_uptodate(bh)) {
  2481					iter->iblock++;
  2482					continue;
  2483				}
  2484			}
  2485			arr[nr++] = bh;
  2486			iter->iblock++;
  2487		}
  2488	
  2489		iter->bh_folio_reads += nr;
  2490	
  2491		WARN_ON_ONCE(!bh_is_last(last, head));
  2492	
  2493		if (bh_is_last(last, head)) {
  2494			if (!iter->bh_folio_reads)
  2495				no_reads = true;
  2496			if (!iter->unmapped)
  2497				fully_mapped = true;
  2498		}
  2499	
  2500		bh_read_batch_async(folio, nr, arr, fully_mapped, no_reads,
  2501				    iter->any_get_block_error);
  2502	
  2503		return last;
  2504	}
  2505	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
