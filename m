Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFC11B813
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 01:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729646000; cv=none; b=p6m8ZoFIYnGctE1matLBSie3c4XoyttoJ38sFPU7HsPsBuMcGIQdsGbOf7HeJ14DeG92XAfm/CBO8d4LZs8VcDBRqUmNYNaLPn7c8v6UGp7WzmS5ufvrq0wEx2mWMNipkH2Nrv36FjNksthmjlGs3ZuPRla/0PC+BH4Jw17AvPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729646000; c=relaxed/simple;
	bh=zqgXDLdXnDbywwdNPfi7CDXpirj2xSRqquwC/DuaZtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=buZvsnalLKaLA2D6lvHqsahuTSC57+Mk1YHdehkV68mi2v+EmJ/w3uRCuyIj+bBWRinco7x39ze5dCa3e+gleOqV1haLe4MKgMtcwIpmz/kebWxhUpEdeTjW+jww3dmEmRRFJi6zd0+FZOgJajbStDsMJvUbk+ppcL+aosai6vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WzvQo4bi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WzvQo4bi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729645998; x=1761181998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zqgXDLdXnDbywwdNPfi7CDXpirj2xSRqquwC/DuaZtI=;
  b=WzvQo4bilsaZqElZpQKxjLVj5TtrQ6U1f1olLBVbnSxiOwxUZavCxn8F
   M6NUT0ScybKUoQPIrf2xEY3hIWQ4ohA38kCOVHQ1jA3PgOdmnu2aaWgsj
   U5RQSo5YzLJZjf6acCmyYtzscG+nFm5NW4J5JjW0+9jZOrrxqSohoxVNn
   epSz+wILC+N4DJ5GeX/9245djd0huIKn2+mW3h/AIVjYEG8ICYz+IquEl
   bhzlgCrVrY9Pp855uMZcjxx4GhtpJsvJtHldiOidGZMcBgYfgi0bKUssM
   Aw8QU0oP5lE93QRxzCp8A4ZnmUXHKbOUomr9haP6ObTMDu+n26ZRcq+Ry
   Q==;
X-CSE-ConnectionGUID: V0enqaD9S0OLqYby94zqlw==
X-CSE-MsgGUID: lpQqp33xSWictc1aGCGRig==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="33136138"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="33136138"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 18:13:16 -0700
X-CSE-ConnectionGUID: UO9l1QnoRGe9EpYixuXj/w==
X-CSE-MsgGUID: U9IIGs2YQoi7rNYdIskzeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="117510587"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Oct 2024 18:13:15 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3Pw0-000UIE-2E;
	Wed, 23 Oct 2024 01:13:12 +0000
Date: Wed, 23 Oct 2024 09:12:20 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-split-wip 11/26] mm/hmm.c:642:17: error: 'struct
 device' has no member named 'dma_skip_sync'
Message-ID: <202410230904.pPSwIFSx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-split-wip
head:   c651d2118e26e1ac43db75c53cc4b4a51c41984b
commit: 8beafe484c79bce5de4807d390d93250449fecee [11/26] mm/hmm: generalize managing PFN and DMA lists
config: i386-randconfig-141-20241023 (https://download.01.org/0day-ci/archive/20241023/202410230904.pPSwIFSx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410230904.pPSwIFSx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410230904.pPSwIFSx-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/hmm.c: In function 'hmm_map_alloc':
>> mm/hmm.c:642:17: error: 'struct device' has no member named 'dma_skip_sync'
     642 |         if (!dev->dma_skip_sync || dma_addressing_limited(dev))
         |                 ^~


vim +642 mm/hmm.c

   618	
   619	/**
   620	 * hmm_map_alloc - Allocate HMM map structure
   621	 * @dev: device to allocate structure for
   622	 * @map: HMM map to allocate
   623	 * @nr_entries: number of entries in the map
   624	 * @dma_entry_size: size of the DMA entry in the map
   625	 *
   626	 * Allocate the HMM map structure and all the lists it contains.
   627	 * Return 0 on success, -ENOMEM on failure.
   628	 */
   629	int hmm_map_alloc(struct device *dev, struct hmm_map *map, size_t nr_entries,
   630			  size_t dma_entry_size)
   631	{
   632		bool use_iova;
   633	
   634		if (!(nr_entries * PAGE_SIZE / dma_entry_size))
   635			return -EINVAL;
   636	
   637		/*
   638		 * The HMM API violates our normal DMA buffer ownership rules and can't
   639		 * transfer buffer ownership.  The dma_addressing_limited() check is a
   640		 * best approximation to ensure no swiotlb buffering happens.
   641		 */
 > 642		if (!dev->dma_skip_sync || dma_addressing_limited(dev))
   643			return -EOPNOTSUPP;
   644	
   645		map->dma_entry_size = dma_entry_size;
   646		map->pfn_list =
   647			kvcalloc(nr_entries, sizeof(*map->pfn_list), GFP_KERNEL);
   648		if (!map->pfn_list)
   649			return -ENOMEM;
   650	
   651		use_iova = dma_iova_try_alloc(dev, &map->state, 0,
   652				nr_entries * PAGE_SIZE);
   653		if (!use_iova && dma_need_unmap(dev)) {
   654			map->dma_list = kvcalloc(nr_entries, sizeof(*map->dma_list),
   655						 GFP_KERNEL);
   656			if (!map->dma_list)
   657				goto err_dma;
   658		}
   659		return 0;
   660	
   661	err_dma:
   662		kfree(map->pfn_list);
   663		return -ENOMEM;
   664	}
   665	EXPORT_SYMBOL_GPL(hmm_map_alloc);
   666	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
