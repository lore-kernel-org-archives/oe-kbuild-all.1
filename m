Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2240B3D96F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Dec 2023 16:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GV6OdbqG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701448832; x=1732984832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nFEattXnDb/mQ/So5Uee5RogWDbtc+5+P7wibT+wb1M=;
  b=GV6OdbqGpHwQjza8MHpf1fhuYC802ErBYh+W0+dmj1uGeUZCchMysj6w
   x+Q5L1ffNJX2VZ3VAlpjSYdQQ+lEJPd4RGt9dKljm7qqe7DxIiHNrlfOm
   aGHs7IdX7aZXgRy3DInn9/e8hMtuv+h+l4OSKwNbyPOwe9udbX+SO5d3b
   7b4TLM3k2k0r07wRb0tcfk/yVWK8/t5EpwoTuLhjLUjiq5eDYg15L6hy6
   oz9IRVwtNCRP5AbRqJGd4PCUBXdetsd1TTCkrCc9eTw3aJDip9xKmGIvs
   tC4DljYWt2bMR5NtITFZ8T0yIRDiKXSMmncRXRR66UKQhSUEsaXWA6zzd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="401927"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="401927"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 08:40:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="1017085928"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="1017085928"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 01 Dec 2023 08:40:29 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r96Z1-0003yX-1g;
	Fri, 01 Dec 2023 16:40:27 +0000
Date: Sat, 2 Dec 2023 00:39:27 +0800
From: kernel test robot <lkp@intel.com>
To: Ming Lei <ming.lei@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>, David Jeffery <djeffery@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: block/blk-mq.c:2334:33: sparse: sparse: Using plain integer as NULL
 pointer
Message-ID: <202312020005.Avlspwql-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   994d5c58e50e91bb02c7be4a91d5186292a895c8
commit: bd63141d585bef14f4caf111f6d0e27fe2300ec6 blk-mq: clear stale request in tags->rq[] before freeing one request pool
date:   2 years, 6 months ago
config: hexagon-randconfig-r121-20231119 (https://download.01.org/0day-ci/archive/20231202/202312020005.Avlspwql-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231202/202312020005.Avlspwql-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312020005.Avlspwql-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/blk-mq.c:2334:33: sparse: sparse: Using plain integer as NULL pointer

vim +2334 block/blk-mq.c

  2314	
  2315	/* called before freeing request pool in @tags */
  2316	static void blk_mq_clear_rq_mapping(struct blk_mq_tag_set *set,
  2317			struct blk_mq_tags *tags, unsigned int hctx_idx)
  2318	{
  2319		struct blk_mq_tags *drv_tags = set->tags[hctx_idx];
  2320		struct page *page;
  2321		unsigned long flags;
  2322	
  2323		list_for_each_entry(page, &tags->page_list, lru) {
  2324			unsigned long start = (unsigned long)page_address(page);
  2325			unsigned long end = start + order_to_size(page->private);
  2326			int i;
  2327	
  2328			for (i = 0; i < set->queue_depth; i++) {
  2329				struct request *rq = drv_tags->rqs[i];
  2330				unsigned long rq_addr = (unsigned long)rq;
  2331	
  2332				if (rq_addr >= start && rq_addr < end) {
  2333					WARN_ON_ONCE(refcount_read(&rq->ref) != 0);
> 2334					cmpxchg(&drv_tags->rqs[i], rq, NULL);
  2335				}
  2336			}
  2337		}
  2338	
  2339		/*
  2340		 * Wait until all pending iteration is done.
  2341		 *
  2342		 * Request reference is cleared and it is guaranteed to be observed
  2343		 * after the ->lock is released.
  2344		 */
  2345		spin_lock_irqsave(&drv_tags->lock, flags);
  2346		spin_unlock_irqrestore(&drv_tags->lock, flags);
  2347	}
  2348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
