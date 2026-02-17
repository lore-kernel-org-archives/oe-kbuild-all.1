Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A427B321F42
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 12:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771330725; cv=none; b=gfsVEI5EZOd6pf7KF0ugEE9cnVU114+Aqd/uMOnSmQagCVTC7iJAzqEc7Pw0fXhAlI8fHt6fGOOdrlCqMaA5KM1tmzrzFn5NfMZhnQIAbDTsCSeLelwui3933y8/ZGEyZESaGIwKB6WVNZRL9OPkZN/rTHdzhcS3c64383a7eqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771330725; c=relaxed/simple;
	bh=gxv6GPfvEdt3I88BAhetX4DcIa295ymdfyKLNpySCfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LKTNn4KfFUbh9uan7OsDO0NeQ6bhSbf4EppV5ZDGhd+WHPGli69UPiAoMfqOeIlAORt9Br2c8OMsRjoU9PBZW4d+YYc2Wfk+TlzAxZS6BzNZ1esnfiWJD4zVRYL5reQVkx1QsQwXKOJrUMtDZg2O4F5jYzxGLU6kHhlmgYTfGKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BTR145G3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BTR145G3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771330723; x=1802866723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gxv6GPfvEdt3I88BAhetX4DcIa295ymdfyKLNpySCfo=;
  b=BTR145G3aMhl1FPHVwj6decRt63yhoqtN3CnR4ukZDOns5EzAKHO7T7g
   plpNVBruT8kcdWs/jZiJm5NUxEuVFqq51M1TdWA5I4eKyZHgwo5Y2rORm
   4JsAH7uv5xwbusNfm0/d2PquFxIx0l9zIU8QI1BonTld96KrYsTP9EQdO
   mLvgtSRuj3OT1H6XlTGjcu1//hT5pJL0105uT9mzB7E4eOW0EzOtQ2L6m
   XfAl1nWWnBTjZBRahuAWSwStg2zPC1CArhcrg1F665YGJhC6bO+onHrAv
   N1oBJbBTvqC2npUdpV5NVl9aeDSuoXvM8U6ZQGZP25q6DU9vjYrpsd2CI
   g==;
X-CSE-ConnectionGUID: gJMP+JVPSkayzPkg2ky/Wg==
X-CSE-MsgGUID: nPV0DqzOTBaB2wCj6ZgfCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72108210"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="72108210"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 04:18:43 -0800
X-CSE-ConnectionGUID: 5+Zoq9ohSqijtT9PXHlpFA==
X-CSE-MsgGUID: NyOLsov8S4adFFzo9eyCoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="213127162"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Feb 2026 04:18:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsK2G-000000010vk-3Fth;
	Tue, 17 Feb 2026 12:18:36 +0000
Date: Tue, 17 Feb 2026 20:18:02 +0800
From: kernel test robot <lkp@intel.com>
To: Youngjun Park <youngjun.park@lge.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	gunho.lee@lge.com, taejoon.song@lge.com, austin.kim@lge.com,
	youngjun.park@lge.com
Subject: Re: [PATCH v4 3/4] mm: memcontrol: add interfaces for swap tier
 selection
Message-ID: <202602172046.jWVum2TN-lkp@intel.com>
References: <20260217000950.4015880-4-youngjun.park@lge.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217000950.4015880-4-youngjun.park@lge.com>

Hi Youngjun,

kernel test robot noticed the following build errors:

[auto build test ERROR on 776250964cbaa49ebe6b8bb2870765cc89cece59]

url:    https://github.com/intel-lab-lkp/linux/commits/Youngjun-Park/mm-swap-introduce-swap-tier-infrastructure/20260217-121406
base:   776250964cbaa49ebe6b8bb2870765cc89cece59
patch link:    https://lore.kernel.org/r/20260217000950.4015880-4-youngjun.park%40lge.com
patch subject: [PATCH v4 3/4] mm: memcontrol: add interfaces for swap tier selection
config: powerpc64-randconfig-001-20260217 (https://download.01.org/0day-ci/archive/20260217/202602172046.jWVum2TN-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602172046.jWVum2TN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602172046.jWVum2TN-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/swap_tier.c: In function 'swap_tier_memcg_propagate':
>> mm/swap_tier.c:342:8: error: dereferencing pointer to incomplete type 'struct mem_cgroup'
      child->tier_mask |= mask;
           ^~


vim +342 mm/swap_tier.c

   330	
   331	/*
   332	 * When a tier is removed, set its bit in every memcg's tier_mask and
   333	 * tier_effective_mask. This prevents stale tier indices from being
   334	 * silently filtered out if the same index is reused later.
   335	 */
   336	static void swap_tier_memcg_propagate(int mask)
   337	{
   338		struct mem_cgroup *child;
   339	
   340		rcu_read_lock();
   341		for_each_mem_cgroup_tree(child, root_mem_cgroup) {
 > 342			child->tier_mask |= mask;
   343			child->tier_effective_mask |= mask;
   344		}
   345		rcu_read_unlock();
   346	}
   347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
