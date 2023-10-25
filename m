Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91F428DBA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 13:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HpXj8qvV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698241874; x=1729777874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BZ4OU/6+7GvkYA351EMlCgYY6xHM2FSjvBKN5Q9IyNo=;
  b=HpXj8qvVO2n7DOl72a2KykJo43u5gndbubtx1gCkFRxWzUigjFJqPhVE
   UZUSz0V7Bkd1EzfQNEUZ4+mPwQthCd/uYhO4b6DhbyBI5NKDXwYnDCyf4
   2KsS4SFoj4dLLU3nVE808njg+6Ykfps7PcZk2I3XDYbqHM0nau6lcz6x5
   OPadHwgaOz9Yux5LVuKIzZAd+0cZWsGidl/Gv34imDBPjMz3EJXPQ0nuL
   zXD+Jh62Q45pSNUeBU/8JjpTPRZ+l931wOPclNISVz5/51iX2Ho+nFxMf
   gTJSgNPujWDiqGf9zfbITKhFHmf3yi36G/4dC8kJ9Jhi9u7MH5VTbM/8G
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="387128047"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="387128047"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 06:51:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="849530607"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="849530607"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Oct 2023 06:51:08 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qveHq-0008v1-1e;
	Wed, 25 Oct 2023 13:51:06 +0000
Date: Wed, 25 Oct 2023 21:50:15 +0800
From: kernel test robot <lkp@intel.com>
To: Mel Gorman <mgorman@suse.de>, Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Kefeng Wang <wangkefeng.wang@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Muchun Song <muchun.song@linux.dev>, Yuan Can <yuancan@huawei.com>
Subject: Re: Re: [PATCH resend] mm: hugetlb_vmemmap: use bulk allocator in
 alloc_vmemmap_page_list()
Message-ID: <202310252149.qzjGG49d-lkp@intel.com>
References: <20231025093254.xvomlctwhcuerzky@techsingularity.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025093254.xvomlctwhcuerzky@techsingularity.net>

Hi Mel,

kernel test robot noticed the following build errors:

[auto build test ERROR on trondmy-nfs/linux-next]
[also build test ERROR on linus/master v6.6-rc7]
[cannot apply to akpm-mm/mm-everything next-20231025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mel-Gorman/Re-PATCH-resend-mm-hugetlb_vmemmap-use-bulk-allocator-in-alloc_vmemmap_page_list/20231025-173425
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20231025093254.xvomlctwhcuerzky%40techsingularity.net
patch subject: Re: [PATCH resend] mm: hugetlb_vmemmap: use bulk allocator in alloc_vmemmap_page_list()
config: loongarch-randconfig-002-20231025 (https://download.01.org/0day-ci/archive/20231025/202310252149.qzjGG49d-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310252149.qzjGG49d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310252149.qzjGG49d-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/xfs_buf.c: In function 'xfs_buf_alloc_pages':
>> fs/xfs/xfs_buf.c:391:26: error: implicit declaration of function 'alloc_pages_bulk_array'; did you mean 'alloc_pages_bulk_node'? [-Werror=implicit-function-declaration]
     391 |                 filled = alloc_pages_bulk_array(gfp_mask, bp->b_page_count,
         |                          ^~~~~~~~~~~~~~~~~~~~~~
         |                          alloc_pages_bulk_node
   cc1: some warnings being treated as errors
--
   fs/btrfs/extent_io.c: In function 'btrfs_alloc_page_array':
>> fs/btrfs/extent_io.c:688:29: error: implicit declaration of function 'alloc_pages_bulk_array'; did you mean 'alloc_pages_bulk_node'? [-Werror=implicit-function-declaration]
     688 |                 allocated = alloc_pages_bulk_array(GFP_NOFS, nr_pages, page_array);
         |                             ^~~~~~~~~~~~~~~~~~~~~~
         |                             alloc_pages_bulk_node
   cc1: some warnings being treated as errors


vim +391 fs/xfs/xfs_buf.c

0e6e847ffe3743 fs/xfs/linux-2.6/xfs_buf.c Dave Chinner      2011-03-26  353  
0a683794ace283 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  354  static int
0a683794ace283 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  355  xfs_buf_alloc_pages(
0a683794ace283 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  356  	struct xfs_buf	*bp,
0a683794ace283 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  357  	xfs_buf_flags_t	flags)
0a683794ace283 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  358  {
289ae7b48c2c4d fs/xfs/xfs_buf.c           Dave Chinner      2021-06-07  359  	gfp_t		gfp_mask = __GFP_NOWARN;
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  360  	long		filled = 0;
0a683794ace283 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  361  
289ae7b48c2c4d fs/xfs/xfs_buf.c           Dave Chinner      2021-06-07  362  	if (flags & XBF_READ_AHEAD)
289ae7b48c2c4d fs/xfs/xfs_buf.c           Dave Chinner      2021-06-07  363  		gfp_mask |= __GFP_NORETRY;
289ae7b48c2c4d fs/xfs/xfs_buf.c           Dave Chinner      2021-06-07  364  	else
289ae7b48c2c4d fs/xfs/xfs_buf.c           Dave Chinner      2021-06-07  365  		gfp_mask |= GFP_NOFS;
289ae7b48c2c4d fs/xfs/xfs_buf.c           Dave Chinner      2021-06-07  366  
02c5117386884e fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  367  	/* Make sure that we have a page list */
934d1076bb2c5b fs/xfs/xfs_buf.c           Christoph Hellwig 2021-06-07  368  	bp->b_page_count = DIV_ROUND_UP(BBTOB(bp->b_length), PAGE_SIZE);
02c5117386884e fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  369  	if (bp->b_page_count <= XB_PAGES) {
02c5117386884e fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  370  		bp->b_pages = bp->b_page_array;
02c5117386884e fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  371  	} else {
02c5117386884e fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  372  		bp->b_pages = kzalloc(sizeof(struct page *) * bp->b_page_count,
02c5117386884e fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  373  					gfp_mask);
02c5117386884e fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  374  		if (!bp->b_pages)
02c5117386884e fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  375  			return -ENOMEM;
02c5117386884e fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  376  	}
02c5117386884e fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  377  	bp->b_flags |= _XBF_PAGES;
02c5117386884e fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  378  
0a683794ace283 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  379  	/* Assure zeroed buffer for non-read cases. */
0a683794ace283 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  380  	if (!(flags & XBF_READ))
0a683794ace283 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  381  		gfp_mask |= __GFP_ZERO;
0a683794ace283 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  382  
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  383  	/*
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  384  	 * Bulk filling of pages can take multiple calls. Not filling the entire
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  385  	 * array is not an allocation failure, so don't back off if we get at
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  386  	 * least one extra page.
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  387  	 */
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  388  	for (;;) {
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  389  		long	last = filled;
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  390  
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01 @391  		filled = alloc_pages_bulk_array(gfp_mask, bp->b_page_count,
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  392  						bp->b_pages);
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  393  		if (filled == bp->b_page_count) {
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  394  			XFS_STATS_INC(bp->b_mount, xb_page_found);
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  395  			break;
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  396  		}
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  397  
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  398  		if (filled != last)
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  399  			continue;
c9fa563072e133 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  400  
ce8e922c0e79c8 fs/xfs/linux-2.6/xfs_buf.c Nathan Scott      2006-01-11  401  		if (flags & XBF_READ_AHEAD) {
e7d236a6fe5102 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  402  			xfs_buf_free_pages(bp);
e7d236a6fe5102 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  403  			return -ENOMEM;
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  404  		}
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  405  
dbd329f1e44ed4 fs/xfs/xfs_buf.c           Christoph Hellwig 2019-06-28  406  		XFS_STATS_INC(bp->b_mount, xb_page_retries);
4034247a0d6ab2 fs/xfs/xfs_buf.c           NeilBrown         2022-01-14  407  		memalloc_retry_wait(gfp_mask);
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  408  	}
0e6e847ffe3743 fs/xfs/linux-2.6/xfs_buf.c Dave Chinner      2011-03-26  409  	return 0;
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  410  }
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  411  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
