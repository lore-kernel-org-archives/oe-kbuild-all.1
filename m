Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318021EB21
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 21:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714772523; cv=none; b=Sb51agjd2sHp/PrfG65MKT/fEba3DZbX1acX6WsGkzJkoQWPzEAG8pUhbot0NEsV4ZTiniTlNARdOlpSOtHFaAuZ1xpixbrbSl1wQe7+eADGSCAHBMoH7yDSD6SmVIUVCCUAotu7tfbX4UvPFb4D9UGfYx19CmlRtJIF+TcWez4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714772523; c=relaxed/simple;
	bh=4MvIo3VwvrzZ8YMSKWxMhw1mSKxmDXGBGTiJ4hCH0BE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCH22Gw8fHf6UcUdFrizgOYGGBXLFwQD4/hGLeHjJeQVkbS4sZc2SXl6wwbvwo9qM5kEECyXKlHl8tORRMADoXEGHTSm8s3UmmOL+fcYNYOm6mF+TRQ3iPhUcy3jslX9FZVIuruYL2vx3Lss3FrGg7lpsQnW7+AOAf6OrQHrtYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tm7r6OGk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tm7r6OGk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714772521; x=1746308521;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4MvIo3VwvrzZ8YMSKWxMhw1mSKxmDXGBGTiJ4hCH0BE=;
  b=Tm7r6OGkwJ8YQqhGCcSbV08UX8E29ryJRmH82FPDmJ0jMDSge8GUGb54
   MToS7tWAgclk42sGrSjEohpFMKvtAxfCdNg/Bk2AjzkRmrunY7FZLs9xy
   tzvXU/JIge7Shb1gN3UKW7n9SYK1eW6X4i1nUtwFfJ8wRASymWnhtz+mX
   OFlvgR05rnzj0s/IUm2Oa/9gM84pvXyOOG5RW/BhOBrsxom+klCDlPhqc
   4aw+fJSYP9rFalSvNKiyb4gjG6ZrH//5iD4edM9mCKVdJeyFcuS0vHmy4
   EKmcKeQScJZCRC4Rwuy/tc2BDwHBS+2mEsBgEd8vCleUCiZ8Ng+gzhAYE
   A==;
X-CSE-ConnectionGUID: JX3fC3FoQsOOYm0uJ0oz6A==
X-CSE-MsgGUID: S3pgLuYQS9WkGJKe1MzFfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10756352"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="10756352"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 14:42:01 -0700
X-CSE-ConnectionGUID: Mvuqe2STRruncSwo9i3jxw==
X-CSE-MsgGUID: cCjsVzXWSba8VEJntYW/IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27595990"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 May 2024 14:41:59 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s30fF-000C7A-0F;
	Fri, 03 May 2024 21:41:57 +0000
Date: Sat, 4 May 2024 05:41:49 +0800
From: kernel test robot <lkp@intel.com>
To: Dhananjay Ugwekar <Dhananjay.Ugwekar@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] perf/x86/rapl: Fix the energy-pkg event for AMD CPUs
Message-ID: <202405040552.zOVBIwCE-lkp@intel.com>
References: <20240502095115.177713-3-Dhananjay.Ugwekar@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502095115.177713-3-Dhananjay.Ugwekar@amd.com>

Hi Dhananjay,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/master]
[cannot apply to tip/auto-latest linus/master v6.9-rc6 next-20240503]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dhananjay-Ugwekar/perf-x86-rapl-Rename-maxdie-to-nr_rapl_pmu-and-dieid-to-rapl_pmu_idx/20240502-175418
base:   tip/master
patch link:    https://lore.kernel.org/r/20240502095115.177713-3-Dhananjay.Ugwekar%40amd.com
patch subject: [PATCH 2/2] perf/x86/rapl: Fix the energy-pkg event for AMD CPUs
config: x86_64-randconfig-122-20240504 (https://download.01.org/0day-ci/archive/20240504/202405040552.zOVBIwCE-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405040552.zOVBIwCE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405040552.zOVBIwCE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/events/rapl.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>> arch/x86/events/rapl.c:154:40: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected struct cpumask [usertype] * @@     got struct cpumask const * @@
   arch/x86/events/rapl.c:154:40: sparse:     expected struct cpumask [usertype] *
   arch/x86/events/rapl.c:154:40: sparse:     got struct cpumask const *
>> arch/x86/events/rapl.c:154:40: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected struct cpumask [usertype] * @@     got struct cpumask const * @@
   arch/x86/events/rapl.c:154:40: sparse:     expected struct cpumask [usertype] *
   arch/x86/events/rapl.c:154:40: sparse:     got struct cpumask const *

vim +154 arch/x86/events/rapl.c

   151	
   152	static inline cpumask_t *get_rapl_pmu_cpumask(int cpu)
   153	{
 > 154		return rapl_pmu_is_pkg_scope() ? topology_core_cpumask(cpu) :
   155						 topology_die_cpumask(cpu);
   156	}
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
