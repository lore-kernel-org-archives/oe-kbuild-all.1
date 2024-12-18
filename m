Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700711591EA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 15:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734536945; cv=none; b=qtWlO7naC9FYYj2tcGkRW83/N+tGouf8L11u+C+hMBhknpKMGCuHN76WD0zXCHU1DIH26Ut4NdRPGGh003USrT9i3ewEjF9JDgyCblqrPSr/1JiXIPtBnr13PdKjAk3XQzQA1heC+/Ji5XMSVSSMPr0Bw3oVopXA7oDJllO0rjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734536945; c=relaxed/simple;
	bh=y1Bo/Trp2lXKWKTv60myvvr+rkyWalou5Dz527NTSmA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XPNu28b3g0ujm77CfvLawqXKpLJb/vmqp1bLAVFHPflztodqg+xM0w0wfFn9t85T/xM8exYCj6LaFCh4ffgHeklLvT4ORwnX+Lv8DDzS2DSVSpsu5fIbLAm1GwBRA6AK5we9Wav9/9GF8OxhtsIqynyUrbrHG5V0TqgAhDvueQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LcLBPgZ1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LcLBPgZ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734536943; x=1766072943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y1Bo/Trp2lXKWKTv60myvvr+rkyWalou5Dz527NTSmA=;
  b=LcLBPgZ1QjeSi98KAFUGS4m5IfYIl8gpWNZhVDZLzSsaTCpwUFY05a1u
   ILb8Az5tfW+DdlPWXFvOaqGCFFlYp70KG0kXu5GbAexMPFqvH6BAaxJ5H
   sXTs4wxG8KmPmoVu3m5cN4TnnuKosJEoCqfqxxgY7fIGtZAgch5z6xs4d
   UXpRAQXZGRFl2iqHAKMMfR2smbwK5rVZKscrYKtgYbeuIKKOs3+MEzETC
   gQW7xC80HeqI/HsXnn2k/qTxWYr5XibSo/4h6ZTqJYK6U2XLw9gWFHQi9
   tPHTRajNPlDhdRo/6Bj0vSPP0vs7VjVGIWim/khB33J35/wetyDvTnUux
   Q==;
X-CSE-ConnectionGUID: VIrWn19BRPy5jXB1SBmiCA==
X-CSE-MsgGUID: Mty9h0knTbScLKrpLnN0EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35145715"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="35145715"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 07:49:02 -0800
X-CSE-ConnectionGUID: CILLBLmWTuKGW4ukeTWPMw==
X-CSE-MsgGUID: ltsCOF9bRsC8F9pWiJpU8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="97792955"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Dec 2024 07:49:00 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNwIE-000GRa-1c;
	Wed, 18 Dec 2024 15:48:58 +0000
Date: Wed, 18 Dec 2024 23:47:59 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Hannes Reinecke <hare@suse.de>
Subject: [mcgrof:large-block-buffer-heads-20241217 8/14] fs/buffer.c:2446:13:
 warning: unused variable 'chunk_idx'
Message-ID: <202412182307.4pdB1nhe-lkp@intel.com>
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
commit: d84d978abde5632d47f74cebcdfface64780c324 [8/14] fs/buffer: reduce stack usage on bh_read_iter()
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241218/202412182307.4pdB1nhe-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412182307.4pdB1nhe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412182307.4pdB1nhe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/buffer.c: In function 'bh_read_iter':
>> fs/buffer.c:2446:13: warning: unused variable 'chunk_idx' [-Wunused-variable]
    2446 |         int chunk_idx = MAX_BUF_CHUNK * iter->chunk_number;
         |             ^~~~~~~~~
   fs/buffer.c:2444:21: warning: unused variable 'i' [-Wunused-variable]
    2444 |         int nr = 0, i = 0;
         |                     ^


vim +/chunk_idx +2446 fs/buffer.c

  2428	
  2429	/*
  2430	 * Reads up to MAX_BUF_CHUNK buffer heads at a time on a folio on the given
  2431	 * block range iblock to lblock and helps update the number of buffer-heads
  2432	 * which were not uptodate or unmapped for which we issued an async read for
  2433	 * on iter->bh_folio_reads for the full folio. Returns the last buffer-head we
  2434	 * worked on.
  2435	 */
  2436	static struct buffer_head *bh_read_iter(struct folio *folio,
  2437						struct buffer_head *pivot,
  2438						struct buffer_head *head,
  2439						struct inode *inode,
  2440						struct bh_iter *iter, sector_t lblock)
  2441	{
  2442		struct buffer_head *arr[MAX_BUF_CHUNK];
  2443		struct buffer_head *bh = pivot, *last;
  2444		int nr = 0, i = 0;
  2445		size_t blocksize = head->b_size;
> 2446		int chunk_idx = MAX_BUF_CHUNK * iter->chunk_number;
  2447		bool no_reads = false;
  2448		bool fully_mapped = false;
  2449	
  2450		/* Stage one - collect buffer heads we need issue a read for */
  2451	
  2452		/* collect buffers not uptodate and not mapped yet */
  2453		for_each_bh_pivot(bh, last, head) {
  2454			if (nr >= MAX_BUF_CHUNK)
  2455				break;
  2456	
  2457			if (buffer_uptodate(bh)) {
  2458				iter->iblock++;
  2459				continue;
  2460			}
  2461	
  2462			if (!buffer_mapped(bh)) {
  2463				int err = 0;
  2464	
  2465				iter->unmapped++;
  2466				if (iter->iblock < lblock) {
  2467					WARN_ON(bh->b_size != blocksize);
  2468					err = iter->get_block(inode, iter->iblock,
  2469							      bh, 0);
  2470					if (err)
  2471						iter->any_get_block_error = true;
  2472				}
  2473				if (!buffer_mapped(bh)) {
  2474					folio_zero_range(folio, bh_offset(bh),
  2475							blocksize);
  2476					if (!err)
  2477						set_buffer_uptodate(bh);
  2478					iter->iblock++;
  2479					continue;
  2480				}
  2481				/*
  2482				 * get_block() might have updated the buffer
  2483				 * synchronously
  2484				 */
  2485				if (buffer_uptodate(bh)) {
  2486					iter->iblock++;
  2487					continue;
  2488				}
  2489			}
  2490			arr[nr++] = bh;
  2491			iter->iblock++;
  2492		}
  2493	
  2494		iter->bh_folio_reads += nr;
  2495		iter->chunk_number++;
  2496	
  2497		if (bh_is_last(last, head)) {
  2498			if (!iter->bh_folio_reads)
  2499				no_reads = true;
  2500			if (!iter->unmapped)
  2501				fully_mapped = true;
  2502		}
  2503	
  2504		bh_read_batch_async(folio, nr, arr, fully_mapped, no_reads,
  2505				    iter->any_get_block_error);
  2506	
  2507		return last;
  2508	}
  2509	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
