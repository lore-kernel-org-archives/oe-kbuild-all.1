Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F8730EF6C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Sep 2026 01:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788658830; cv=none; b=VTZE4pWzIKMrXITDDcyVFYNnEFG4BIPlZdZ8iso5mOZVTNC3N/CY8ZvSl9Ew2jqbxftnfMRJhQQ+ADGIuY6mO5rBqzn6iVJ4R7l3V9E8Ts974VASZdKCzDiLonQaMoCHnqtsC6+zvEC9gsVPDnswbCOqTzvmxAhEcCQGEyDD86k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788658830; c=relaxed/simple;
	bh=zExBKJ/LqfzkIOJCh2zRqylL6KY8F2ZiraJrmVRLqPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VMnkGcdNsFOFKEu17J2bevAKh8QMaceSmRl7ZhpuErjTaxFbeom4DpmMa5K2rEmmn9E37E6UG0pDHmO7viS4Q3uZMuH32L/Cwx88bMj7sYGqNBNikt3T2YC+nWgZTTkW3bgX4C1uICq+WbNhNHWI05rwXiK5wJiFyW50RIIEEN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BWjlVzZt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BWjlVzZt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788658829; x=1820194829;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zExBKJ/LqfzkIOJCh2zRqylL6KY8F2ZiraJrmVRLqPU=;
  b=BWjlVzZtb3XGg0riHNX3N+xopcgcZymsPdqVBtjrjRK8hBmbhvdIwOw6
   70X586ibnAzRXvCNETiDRdHl4LEqsvIG25rRLvS+GO8Tcy9H2bIA1NvMe
   SibN8OUzHeUD4SemaL2wofol3esgy/lvcRR5DlUZw3g0Npl8dSKRSjA9j
   IPBeFrNBIs1VG5sBRjEUXLP5z4C6cNZOIDuFz6UcqDyMjMPcLrpvne+iK
   4i/3hBZn7n2wtRq/I5hOdxkJsz9F8GE1XkSNbP4nCDfNB0j4Oxs78mE7n
   ngbmmml5xn9vPY5v/tie3hRP9H1ixH3/O19HBS73NyRG7zqHDQPA9cG8N
   w==;
X-CSE-ConnectionGUID: d/y0IZSfRhu24Gj8ICqKcw==
X-CSE-MsgGUID: 0L/7WI7TQoWdd3lMBtCniA==
X-IronPort-AV: E=McAfee;i="6800,10657,11897"; a="89130292"
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="89130292"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 18:40:28 -0700
X-CSE-ConnectionGUID: dXHfqpevSNWbilNQyq7dYg==
X-CSE-MsgGUID: E/rsdpVGQrygcfAzHHwu1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="274526985"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Sep 2026 18:40:27 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x31rt-000000001H9-0gcs;
	Sun, 06 Sep 2026 01:40:25 +0000
Date: Sun, 6 Sep 2026 09:40:20 +0800
From: kernel test robot <lkp@intel.com>
To: Bo Zhang <zhangbo0325@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] mm: vmscan: avoid anon scanning for GFP_NOIO with
 low swapcache
Message-ID: <202609060948.O3LniW01-lkp@intel.com>
References: <20260903040131.4016290-1-zhangbo56@xiaomi.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903040131.4016290-1-zhangbo56@xiaomi.com>

Hi Bo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Bo-Zhang/mm-vmscan-avoid-anon-scanning-for-GFP_NOIO-with-low-swapcache/20260903-120131
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260903040131.4016290-1-zhangbo56%40xiaomi.com
patch subject: [RFC PATCH] mm: vmscan: avoid anon scanning for GFP_NOIO with low swapcache
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20260906/202609060948.O3LniW01-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260906/202609060948.O3LniW01-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609060948.O3LniW01-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/vmscan.c: In function 'reclaimable_anon_is_low':
>> mm/vmscan.c:396:47: error: 'NR_SWAPCACHE' undeclared (first use in this function)
     396 |         swapcache = lruvec_page_state(lruvec, NR_SWAPCACHE);
         |                                               ^~~~~~~~~~~~
   mm/vmscan.c:396:47: note: each undeclared identifier is reported only once for each function it appears in


vim +/NR_SWAPCACHE +396 mm/vmscan.c

   384	
   385	static inline bool reclaimable_anon_is_low(struct mem_cgroup *memcg,
   386			int nid, struct scan_control *sc)
   387	{
   388		struct lruvec *lruvec = get_lruvec(memcg, nid);
   389		unsigned long anon_pages, swapcache;
   390	
   391		if (!sc || (sc->gfp_mask & __GFP_IO))
   392			return false;
   393	
   394		anon_pages = lruvec_page_state(lruvec, NR_INACTIVE_ANON) +
   395			     lruvec_page_state(lruvec, NR_ACTIVE_ANON);
 > 396		swapcache = lruvec_page_state(lruvec, NR_SWAPCACHE);
   397	
   398		return swapcache < min(anon_pages >> 6, SWAP_CLUSTER_MAX);
   399	}
   400	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
