Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEDF3368AE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 03:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785469006; cv=none; b=O6lZVHtJXktJF2FWb1NvuCNNElTtu/kBEgIyzyrxfpOJzudux78VncGCyocdyEJW3iyXlrrATJ9Zd6pzy3If19pq7IxoC1FWPY0pC/4UstdIBJjTk6zu99Ai2hmOyjMbAipHC90ThLz13bTLn9KxvP4uFz/kTVGySZqNwkZdzwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785469006; c=relaxed/simple;
	bh=pbGudSxIWADdBKfgUDvcjnDPFVWk9dr7gNvetveAex4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QcmNWd0HEAlQIA+eaci5/sorlnyuTjtTivO2s6slLXVz9hn1+aFg6yT7/0i1F3w+pZ5SDCUrkHtyF8ns9TJ1XbrXO9E1ZRhyzBk41zEiN3+GfQOm3OjVHArhfcCSRJh0uuFV1FDtCdzaabnOJx8TuwyJE8EnEMJNFCBFr/g09yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZsDTzqN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZsDTzqN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785469004; x=1817005004;
  h=date:from:to:cc:subject:message-id;
  bh=pbGudSxIWADdBKfgUDvcjnDPFVWk9dr7gNvetveAex4=;
  b=CZsDTzqNbib50uqYzPaQbLYOVX0JXPlEaOm96hL3pvmfk9/rfm7oMVey
   yvggJjrVz5MWkl3jDDGWVo9yPfO4o+AvhoK4FAnJS6e/Y5ru5t0d/Kqp2
   JYMy1ksU8jz63ucxHZXibj17pLvoPCeaYQt51yamaKepclD3mTyUIGyDD
   S0l3832JdJIulbu+TKkNFQLXVoq5WNa7ywt5JNHMDmNh1fDxZ9yLLDxTP
   G1ZpSDU8CW0yGI8ir0TWn6axIzr7cfuE7RNBdUwMcA6dNFdAvYFyOPqtP
   TZqoGF6RAIaFOR3aR9pCrB90j7J6EEJNFHj6Z2c/4j2FSIcnQz02k6GJ3
   A==;
X-CSE-ConnectionGUID: 31I5+xPWQsuLFa4SHLsCCA==
X-CSE-MsgGUID: 62sJtkiqQCyPgiFnY3ELEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86173493"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="86173493"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 20:36:43 -0700
X-CSE-ConnectionGUID: DO7HVyStQnyy/rTvYaKF9Q==
X-CSE-MsgGUID: yfDKZtZTSSK1CwNM2VZmdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="283800364"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Jul 2026 20:36:42 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpe35-0000000002T-3qVl;
	Fri, 31 Jul 2026 03:36:39 +0000
Date: Fri, 31 Jul 2026 11:35:58 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:blk-iobuf-pool-v5-premap-iova 12/14] Warning:
 block/blk-map.c:516 function parameter 'opts' not described in
 'blk_rq_map_user_iov_opts'
Message-ID: <202607311138.abShvxCM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git blk-iobuf-pool-v5-premap-iova
head:   912328a605c4767433d483436a2d592d06063095
commit: ca011e66fdccef93bc916c7cf32323ad7b6fe2e2 [12/14] block, io_uring: premap a pool buffer to exceed the dma_opt clamp
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260731/202607311138.abShvxCM-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311138.abShvxCM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607311138.abShvxCM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: block/blk-map.c:366 Excess function parameter 'op' description in 'bio_copy_kern'
>> Warning: block/blk-map.c:516 function parameter 'opts' not described in 'blk_rq_map_user_iov_opts'
>> Warning: block/blk-map.c:516 expecting prototype for blk_rq_map_user_iov(). Prototype was for blk_rq_map_user_iov_opts() instead
   Warning: block/blk-map.c:366 Excess function parameter 'op' description in 'bio_copy_kern'
--
>> Warning: block/blk-mq-dma.c:235 cannot understand function prototype: '/*  * Premapped path: the buffer is persistently DMA-mapped as one contiguous IOVA  * (dma_iova_*), so hand the whole mapping to the iterator as a single segment  * instead of allocating an IOVA per I/O.  This is what lets a premapped request  * exceed the dma_opt_mapping_size() clamp folded into max_hw_sectors.  The  * completion path must NOT unmap it (see nvme_unmap_data).  *  * NOTE: this emits the mapping from its start, i.e. it assumes the request  * covers the buffer from offset 0.  The whole-buffer fixed-buffer command path  * used by the pool selftest satisfies that; an arbitrary buffer offset needs'
   Warning: block/blk-mq-dma.c:430 Excess function parameter 'state' description in 'blk_rq_integrity_dma_map_iter_next'
   Warning: block/blk-mq-dma.c:430 Excess function parameter 'state' description in 'blk_rq_integrity_dma_map_iter_next'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
