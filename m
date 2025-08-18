Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308871A4F12
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 02:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755482499; cv=none; b=pkTqdIswTUV1lqg0GaYXBS5UPURe1qO/YpuYqyJ1miM+K3XsFHLTtVNwOWw5yf3J1AM88QZg9gUBd612zXMBn1HWIPOFHCQztAsQX2kZBC9jEUsSEMuUic9K7o2Z6abx6pE2SVkdJEbEnZFdzqZS4QH0speXyXc7oBcJn0qSUag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755482499; c=relaxed/simple;
	bh=onBoDw8UcFsFhA9SkYcODFJDYACjxBDeIFwVKnzYCLA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MLyPBzLlXM3K7GBk5MAv867FjkA1YXnPomM9oV53730z37Iu1WjiLZhvXbwuATiHQsbWNGVz09SJ3UmOIebq5sptPGhIKKhaYYWEt9Kh2WdstdfospwJzuGo5MtAq3I5E89r/AEBg0d5smBdfpEY+C7LuMJiHTKus+5qUW2M7Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KfYi5Uj5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KfYi5Uj5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755482497; x=1787018497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=onBoDw8UcFsFhA9SkYcODFJDYACjxBDeIFwVKnzYCLA=;
  b=KfYi5Uj5jxTwcv+Nex9Fdjj6TZ82O0ttWp7do5C5MkBpZYjsYCtEqwaT
   liEu8JA6I7e9G/H/4h64jcFJvicBt42WRf2q5+K0RdaIg1RLelUjnKQH2
   vW0aLItaGSeoRXNpIFjTPZbQR2EUwGMZYMwT1vEh5ZlLQMVWlzVER0MRs
   r9tdJFODy8cCqoUBB3sIu9yXL/yvN+vT57n/nZRIC2vrMnWbgceObjHps
   6DFszP41Lm6VMmw600yZX/YDLBYcLxcM9RQYwXfU0ZBMUOb17Twqk5Awz
   i4HspVL8Devt00MVGePXq3mxYbIOIbHcbBsTbni6o1dJ8kdwWkTLSe+3L
   A==;
X-CSE-ConnectionGUID: /rqY6y8mSw6r6fp9BXjf8g==
X-CSE-MsgGUID: 8RPgdl4fT4em0JYXYYzJCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="67967780"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="67967780"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 19:01:37 -0700
X-CSE-ConnectionGUID: y5mmLIxST7WKRu//ghL9QQ==
X-CSE-MsgGUID: 68cX/9t4SQOo6ldd36QQRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167845582"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 17 Aug 2025 19:01:35 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unpBl-000Dpr-0a;
	Mon, 18 Aug 2025 02:01:33 +0000
Date: Mon, 18 Aug 2025 10:00:39 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/large-buffers-v3 17/25]
 drivers/net/ethernet/broadcom/bnxt/bnxt.c:3839:30: error: assignment of
 read-only variable 'agg_size_fac'
Message-ID: <202508180935.x3gDoHxB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/large-buffers-v3
head:   15b55cf15dc11c9fafb9aea322713d3c85471946
commit: a3e6f9d865d26748a16676302d02bc64f7bf3849 [17/25] eth: bnxt: adjust the fill level of agg queues with larger buffers
config: arc-randconfig-001-20250818 (https://download.01.org/0day-ci/archive/20250818/202508180935.x3gDoHxB-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508180935.x3gDoHxB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508180935.x3gDoHxB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_alloc_rx_page_pool':
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:3839:30: error: assignment of read-only variable 'agg_size_fac'
    3839 |                 agg_size_fac = 1;
         |                              ^


vim +/agg_size_fac +3839 drivers/net/ethernet/broadcom/bnxt/bnxt.c

  3828	
  3829	static int bnxt_alloc_rx_page_pool(struct bnxt *bp,
  3830					   struct bnxt_rx_ring_info *rxr,
  3831					   int numa_node)
  3832	{
  3833		const unsigned int agg_size_fac = rxr->rx_page_size / BNXT_RX_PAGE_SIZE;
  3834		const unsigned int rx_size_fac = PAGE_SIZE / SZ_4K;
  3835		struct page_pool_params pp = { 0 };
  3836		struct page_pool *pool;
  3837	
  3838		if (WARN_ON_ONCE(agg_size_fac == 0))
> 3839			agg_size_fac = 1;
  3840	
  3841		pp.pool_size = bnxt_rx_agg_ring_fill_level(bp, rxr) / agg_size_fac;
  3842		if (BNXT_RX_PAGE_MODE(bp))
  3843			pp.pool_size += bp->rx_ring_size / rx_size_fac;
  3844	
  3845		pp.order = get_order(rxr->rx_page_size);
  3846		pp.nid = numa_node;
  3847		pp.netdev = bp->dev;
  3848		pp.dev = &bp->pdev->dev;
  3849		pp.dma_dir = bp->rx_dir;
  3850		pp.max_len = PAGE_SIZE << pp.order;
  3851		pp.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV |
  3852			   PP_FLAG_ALLOW_UNREADABLE_NETMEM;
  3853		pp.queue_idx = rxr->bnapi->index;
  3854	
  3855		pool = page_pool_create(&pp);
  3856		if (IS_ERR(pool))
  3857			return PTR_ERR(pool);
  3858		rxr->page_pool = pool;
  3859	
  3860		rxr->need_head_pool = page_pool_is_unreadable(pool);
  3861		rxr->need_head_pool |= !!pp.order;
  3862		if (bnxt_separate_head_pool(rxr)) {
  3863			pp.order = 0;
  3864			pp.max_len = PAGE_SIZE;
  3865			pp.pool_size = min(bp->rx_ring_size / rx_size_fac, 1024);
  3866			pp.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV;
  3867			pool = page_pool_create(&pp);
  3868			if (IS_ERR(pool))
  3869				goto err_destroy_pp;
  3870		}
  3871		rxr->head_pool = pool;
  3872	
  3873		return 0;
  3874	
  3875	err_destroy_pp:
  3876		page_pool_destroy(rxr->page_pool);
  3877		rxr->page_pool = NULL;
  3878		return PTR_ERR(pool);
  3879	}
  3880	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
