Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C905139D16
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 08:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719993608; cv=none; b=QC+0Bl7ipGUiDucQISt4RjsmQ/c2+r8OTQW23mFlRjOs/VPgj0ypVG0kXwDG3nuXVk+WCq9HKrYwMe5UZqcn2de5EfV0ytgJfunt0PAKzZnydcnfVoPl0SH0ZoxO9LVxDVkAukaz+eGB+y5qs8eIQcBy9ZnGlDl3JRKadnFAhWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719993608; c=relaxed/simple;
	bh=kIpEelEnwwzHP5/JoqrqWS/pvDBHVcR8dJt6tbvc9RM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=seBcvwymtk/imjc9M8sEkA65qmjtLYHlWBMI5JQARAo0wzzaL56/AHTTYUt2KUHVqA4xEiE3yIZF6AUfaLJ/HZPRtzOqfCL4+0DGp5bfDzusua8q+ZdQ3Q5t46S4T17nZ7n4/iiWnutMmx0j82sxR6HJkrg7ULLWGFcerhRvq3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LG+QmRyn; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LG+QmRyn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719993607; x=1751529607;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kIpEelEnwwzHP5/JoqrqWS/pvDBHVcR8dJt6tbvc9RM=;
  b=LG+QmRynRCCXo2tjL10+YNYi+Uy8BEh7cReCmQHZo2V59H478ubBERN7
   YoZRJzx+FWEv4v9bq54JnU1hWp5iSlVls2/VQm4eleq4mmDHVO7N2Etg7
   x4601clkblZogNj6dYG2aGXAAZ9JwL84MHjeKgFhr1rzi6ubXROcr/AP2
   TtdZiK/bxW3kEFi3IqaZnAtmcVk/lDCXt3qUkiiIf6wGiF2HQv0YJEUU1
   I4yW8V3vuBUgFlf1gCpjDNy0d32dKoF2ev63a23vZF5Byi5eb8GS2sxCS
   1s2OHMVf4EVenVfVyJbd2xEYf7rQX+OifeSxRfntZ7h9IgAJaFGJVd+oI
   A==;
X-CSE-ConnectionGUID: kmM+FqZeTXqvvi2HWpyL0w==
X-CSE-MsgGUID: p6J6PTsbRF2qlftlSiOyiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17342363"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="17342363"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 01:00:06 -0700
X-CSE-ConnectionGUID: EvgdL2wjQ+qkYbNc4E2Utw==
X-CSE-MsgGUID: fZxKSrLWR3uP6DBA8aFmjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="46313798"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Jul 2024 01:00:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOuuI-000PWf-2E;
	Wed, 03 Jul 2024 08:00:02 +0000
Date: Wed, 3 Jul 2024 15:59:31 +0800
From: kernel test robot <lkp@intel.com>
To: Huan Yang <link@vivo.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/4] mm: memcg: pmc: support oom release
Message-ID: <202407031554.qxjXhgHV-lkp@intel.com>
References: <20240702084423.1717904-5-link@vivo.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702084423.1717904-5-link@vivo.com>

Hi Huan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 727900b675b749c40ba1f6669c7ae5eb7eb8e837]

url:    https://github.com/intel-lab-lkp/linux/commits/Huan-Yang/mm-memcg-pmc-framework/20240702-165351
base:   727900b675b749c40ba1f6669c7ae5eb7eb8e837
patch link:    https://lore.kernel.org/r/20240702084423.1717904-5-link%40vivo.com
patch subject: [RFC PATCH 4/4] mm: memcg: pmc: support oom release
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20240703/202407031554.qxjXhgHV-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407031554.qxjXhgHV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407031554.qxjXhgHV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/gfp.h:7,
                    from include/linux/xarray.h:15,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13,
                    from include/linux/compat.h:17,
                    from arch/powerpc/kernel/asm-offsets.c:12:
>> include/linux/mmzone.h:626:31: error: field 'oom_nb' has incomplete type
     626 |         struct notifier_block oom_nb;
         |                               ^~~~~~
   make[3]: *** [scripts/Makefile.build:117: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/oom_nb +626 include/linux/mmzone.h

   614	
   615	struct mem_cgroup_per_node_cache {
   616		/* per zone cache */
   617		struct mem_cgroup_zone_cache zone_cachep[MAX_NR_ZONES];
   618		struct mem_cgroup *memcg;
   619	
   620		/* cycle cache reclaim time unit, us, default 5s, 0 means disable reaper */
   621	#define DEFAULT_PMC_REAPER_TIME ((5 * 1000 * 1000))
   622		unsigned int reaper_wait;
   623		struct delayed_work reaper_work;
   624	
   625		/* listen oom event, release hold cache */
 > 626		struct notifier_block oom_nb;
   627	
   628		/* max number to hold page, unit page, default 100MB */
   629	#define DEFAULT_PMC_HOLD_LIMIX ((100 << 20) >> PAGE_SHIFT)
   630		unsigned int hold_limit;
   631	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
