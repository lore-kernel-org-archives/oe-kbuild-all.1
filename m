Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28A21BC59
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 13:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728049884; cv=none; b=bWme0xXnQA0I4oM47wAVlbHLbPZW/dQMEEReVu+1qbC5fx+omzog6Q9Mrn3SXEHv2WlGRcAlZvGmxAkNWaIAgJNzJVFP9KQWdzucWpj8L8iHnfXrJgIUPjAT5BMn6EIimw378sIsEbt2lDOMSmg2RwBXJR1GLFiEnf57QOJh90k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728049884; c=relaxed/simple;
	bh=4WfY2inVnnkq8hEAMSTNGbgSA2vBHsBugw1pbOgbmdw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mm2FxwES/W+1xtI3JmuI+KSKfUkGYXbH/d3YYafrrq8al6zsu7TXnBaird+QzNIwueKmFduGobsAbXfaQxMnbHljJFoHLizgCBPGdA5BGgLzefhKJidRR9gYAOTJNLzLBGt6mibN9frRDNtuYgSL81HhEDEyA5KjNGP3YIaYipQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PvuRni9e; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PvuRni9e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728049883; x=1759585883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4WfY2inVnnkq8hEAMSTNGbgSA2vBHsBugw1pbOgbmdw=;
  b=PvuRni9eB3+WTsX8LX7nZkzig3KIU5Jn/IFdpFPhBSVgwxC59LZx+4SX
   U6rN3oDONOyeb7qZOEu6aoDtorNcy2niEwxsiUSBeAeWuPZqiLJ1DX0Wp
   pzkQQ1U3E+HQCb7lFzlC/+myhrSEQhboc7IdgO0LVE4cCkcTOJ9NRzltX
   pubeDA0dFdu0hv4KTE23S1TALl6cfUp9Z6Bk4EMDapAH34f6DqXDEWEX3
   EM5p/S99xlAnaK8zazHUpikdAkTebDiSqWKKKXZurnHlsjXG9QdLCpL3R
   jXCA7p8xCwR+X+aNkIsmek7fHLJf9pcvt6oPHHVLSfPqQS5DYBkqHX+EO
   A==;
X-CSE-ConnectionGUID: PzkI0RCZTkGqQ0VYG+anXw==
X-CSE-MsgGUID: sepHWuVzTvuwC+ju4VP7vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27215599"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="27215599"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 06:51:22 -0700
X-CSE-ConnectionGUID: R8vpO+q8TWGrwl5Vw3k7fA==
X-CSE-MsgGUID: XTlEpAi5SSeXd4gjgfM1nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="74381326"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Oct 2024 06:51:21 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swiiE-0001ia-1p;
	Fri, 04 Oct 2024 13:51:18 +0000
Date: Fri, 4 Oct 2024 21:50:36 +0800
From: kernel test robot <lkp@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [linux-next:master 2050/2483] include/linux/fault-inject.h:97:15:
 error: unknown type name 'bool'
Message-ID: <202410042155.On1ck1h8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   58ca61c1a866bfdaa5e19fb19a2416764f847d75
commit: 91b2c42c214f570efaff80a666e30b8f6ce4f12b [2050/2483] drm/xe: Use fault injection infrastructure to find issues at probe time
config: i386-buildonly-randconfig-003-20241004 (https://download.01.org/0day-ci/archive/20241004/202410042155.On1ck1h8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410042155.On1ck1h8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410042155.On1ck1h8-lkp@intel.com/

Note: the linux-next/master HEAD 58ca61c1a866bfdaa5e19fb19a2416764f847d75 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_guc_ads.c:8:
>> include/linux/fault-inject.h:97:15: error: unknown type name 'bool'
      97 | static inline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
         |               ^~~~
>> include/linux/fault-inject.h:97:43: error: unknown type name 'gfp_t'
      97 | static inline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
         |                                           ^~~~~
   include/linux/fault-inject.h:106:57: error: unknown type name 'gfp_t'
     106 | static inline int should_failslab(struct kmem_cache *s, gfp_t gfpflags)
         |                                                         ^~~~~


vim +/bool +97 include/linux/fault-inject.h

cc689c5b352d4a Ingo Molnar     2017-02-01   93  
0866e82e40fba4 Kefeng Wang     2023-05-16   94  #ifdef CONFIG_FAIL_PAGE_ALLOC
53dabce2652fb8 Vlastimil Babka 2024-07-11   95  bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order);
0866e82e40fba4 Kefeng Wang     2023-05-16   96  #else
53dabce2652fb8 Vlastimil Babka 2024-07-11  @97  static inline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
0866e82e40fba4 Kefeng Wang     2023-05-16   98  {
0866e82e40fba4 Kefeng Wang     2023-05-16   99  	return false;
0866e82e40fba4 Kefeng Wang     2023-05-16  100  }
0866e82e40fba4 Kefeng Wang     2023-05-16  101  #endif /* CONFIG_FAIL_PAGE_ALLOC */
0866e82e40fba4 Kefeng Wang     2023-05-16  102  

:::::: The code at line 97 was first introduced by commit
:::::: 53dabce2652fb854eae84609ce9c37429d5d87ba mm, page_alloc: put should_fail_alloc_page() back behing CONFIG_FAIL_PAGE_ALLOC

:::::: TO: Vlastimil Babka <vbabka@suse.cz>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
