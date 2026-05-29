Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F89C3A9D9A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 07:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780038595; cv=none; b=RYxQ2aMsgGXJCrZ+ygAY9rDKeiem24pj/8d2tx4tPc2SBlI5FUJJrGGcetzl9qbsoemHcj1gIlRTQlrLyWn6qTzmsv+OMiBI+b3p+UF1E2j4wgadymLb6EX+O9NGMtMuESvDnKxKonOgkFLEBBThyFwqTRF5iU5/shN6U/1Qx8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780038595; c=relaxed/simple;
	bh=IVXGCmJYd3atIRp24DxE9XBI0PNQwZcgFCN+Pv3VN/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfBicn7QJZbDdaN+sSUQytfBa3JPav5Fi0IIZFCEJtIQk+bktJkNlE2S9+eyYPEuUQ8fQ2fDCO4uE8e5QBBP2AJdU37dSkYkPGLGEDzZId5I4X3JjKx20proLVqNvYdAy6QIp3DaEScaqftNNBLoQrk0sWggAMLlocWL4l+GHr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NlESnqLS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NlESnqLS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780038594; x=1811574594;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IVXGCmJYd3atIRp24DxE9XBI0PNQwZcgFCN+Pv3VN/U=;
  b=NlESnqLSZYHCVwH5zfHL2FLqTRsrc0BXc7ekWLFs+3QykfQRF0h18Uyw
   AbCUWX06cW4xk59ECinkG471v1rf7dEkSmxYXJrnaUXrpx39HeSUnyuoS
   P5g9YreuRrHZds7olyiWjEgkAt1kHiA9q/sn+0ofyo6hme0u0bZUmXuTE
   083v/GgbnDr7heib1lkz3DdSGPMfQwJYp+RR9FcPzDOwBk/JkobQsvQ3o
   VcFEGC3BB4xS7Tb8vF0l1kwEIXOsJ63Bg//5yj+RtkRiqLQo6dREWBRG6
   W3fixJnerzuGlYOLjpnyEUX1KNgkId8z/CTD2tgcrxRpaCGbxpaDucizX
   w==;
X-CSE-ConnectionGUID: Tpp3cqH8RzCLzNV+/QM0zA==
X-CSE-MsgGUID: Ud0CDve4RgOT5ny6tIT+Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80741238"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="80741238"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 00:09:50 -0700
X-CSE-ConnectionGUID: vuzsPRqoRTqPEr9XjjZCyw==
X-CSE-MsgGUID: htdXkUk2RJ2fyCEtfaz18g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="239759452"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 May 2026 00:09:48 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSrLm-000000006t0-0qZu;
	Fri, 29 May 2026 07:09:46 +0000
Date: Fri, 29 May 2026 15:09:25 +0800
From: kernel test robot <lkp@intel.com>
To: liuqiqi@kylinos.cn, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, akpm@linux-foundation.org,
	ying.huang@linux.alibaba.com, Qiqi Liu <liuqiqi@kylinos.cn>
Subject: Re: [PATCH 1/1] mm/memory-tier: add node_tier_id as stable tier
 identifier
Message-ID: <202605291430.iafzIZCL-lkp@intel.com>
References: <20260528134212.240492-2-liuqiqi@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528134212.240492-2-liuqiqi@kylinos.cn>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on rppt-memblock/for-next rppt-memblock/fixes linus/master v7.1-rc5 next-20260528]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/liuqiqi-kylinos-cn/mm-memory-tier-add-node_tier_id-as-stable-tier-identifier/20260528-214338
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260528134212.240492-2-liuqiqi%40kylinos.cn
patch subject: [PATCH 1/1] mm/memory-tier: add node_tier_id as stable tier identifier
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20260529/202605291430.iafzIZCL-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291430.iafzIZCL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605291430.iafzIZCL-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/mm_init.c: In function 'free_area_init_node':
>> mm/mm_init.c:1713:14: error: 'pg_data_t' {aka 'struct pglist_data'} has no member named 'node_tier_id'
    1713 |         pgdat->node_tier_id = -1;
         |              ^~


vim +1713 mm/mm_init.c

  1698	
  1699	static void __init free_area_init_node(int nid)
  1700	{
  1701		pg_data_t *pgdat = NODE_DATA(nid);
  1702		unsigned long start_pfn = 0;
  1703		unsigned long end_pfn = 0;
  1704	
  1705		/* pg_data_t should be reset to zero when it's allocated */
  1706		WARN_ON(pgdat->nr_zones || pgdat->kswapd_highest_zoneidx);
  1707	
  1708		get_pfn_range_for_nid(nid, &start_pfn, &end_pfn);
  1709	
  1710		pgdat->node_id = nid;
  1711		pgdat->node_start_pfn = start_pfn;
  1712		pgdat->per_cpu_nodestats = NULL;
> 1713		pgdat->node_tier_id = -1;
  1714	
  1715		if (start_pfn != end_pfn) {
  1716			pr_info("Initmem setup node %d [mem %#018Lx-%#018Lx]\n", nid,
  1717				(u64)start_pfn << PAGE_SHIFT,
  1718				end_pfn ? ((u64)end_pfn << PAGE_SHIFT) - 1 : 0);
  1719	
  1720			calculate_node_totalpages(pgdat, start_pfn, end_pfn);
  1721		} else {
  1722			pr_info("Initmem setup node %d as memoryless\n", nid);
  1723	
  1724			reset_memoryless_node_totalpages(pgdat);
  1725		}
  1726	
  1727		alloc_node_mem_map(pgdat);
  1728		pgdat_set_deferred_range(pgdat);
  1729	
  1730		free_area_init_core(pgdat);
  1731		lru_gen_init_pgdat(pgdat);
  1732	}
  1733	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
