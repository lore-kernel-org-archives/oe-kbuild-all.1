Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ABD19F40A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Feb 2026 01:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770514084; cv=none; b=b1UYspOa+hSWe+/a15UxQEPv9hj/MEJL2b32tyUpoWyweC0mkfEMgPMBqggxMZwZ7GRCFCxX63AAHrTBJIQgO6bppOXVLxRoK/4Pa4opsaZqzh+M29Tm1hl2uZyGr8f9Zyh4dQo9P6tvy2MvjSH7F2MBFhRTmknavdabXq1zlUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770514084; c=relaxed/simple;
	bh=r1galk+5Ji5xocrZJs6QTKll8rF69PwnhMXM38HJNxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=odUIGB/gdVDJQE7yYzWoPp/L6DiIvkHR/3v+Hr5WLMpx6C9/x+5q1vkzDpLYxOOWWajIDVrEu1SiHJ7a81jq1dEpmNzOnAO5MgqZPwE/AKC8ZWLAXqMuFhvUIRY+td/3c92ctWIhGJr4BD65PtHtah51C9qRJ45fgYKvKkhBbOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H2rKqbMS; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H2rKqbMS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770514083; x=1802050083;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r1galk+5Ji5xocrZJs6QTKll8rF69PwnhMXM38HJNxo=;
  b=H2rKqbMSwEqtYTakwmycUWgyMDPw/xgV4gXcj5CnbF9vu0fCr2PpJVKF
   18OR/Tc3YQfMTtqyi/lwtUBGQiUg2NC5Ho31LEGYGgLrY5RXz/m6s1l67
   QzG98AQAgl+4pYUqjxudkC1/KMEDN//NXVlLCc8p9OJt+v8vDScx6AwWy
   KZb4XwQ4j+f1UjX7bBqngkjr4I87cqP1c/O0wnQNWAXF6j8SPhiyRFq4z
   FdoZun6vnbufO2vPhHimt6SPjtNEkdN9FSh+6mcLgNUTvUhzJ2pqu0DvC
   tJRzojuphrYVdc8r+5bcT/6WMafMOuVSU9ZIwT8VbWIFm0MojwCoRO+bt
   g==;
X-CSE-ConnectionGUID: AuRuaEEYQ562Nf4ofJiQyA==
X-CSE-MsgGUID: B9ExuvAdQD2KS6Q8wXGjIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11694"; a="89251176"
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="89251176"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 17:28:03 -0800
X-CSE-ConnectionGUID: yb3fv8/ARGWB9f6GNm/KpQ==
X-CSE-MsgGUID: adLb/J0uS7i9gXkafc8aLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="210951511"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Feb 2026 17:28:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1votai-00000000m02-0JSd;
	Sun, 08 Feb 2026 01:28:00 +0000
Date: Sun, 8 Feb 2026 09:27:59 +0800
From: kernel test robot <lkp@intel.com>
To: Qiliang Yuan <realwujing@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 01/12] sched/isolation: Remove __init restriction
 from housekeeping cores
Message-ID: <202602080949.LInEjVb0-lkp@intel.com>
References: <20260206-feature-dynamic_isolcpus_dhei-v1-1-00a711eb0c74@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206-feature-dynamic_isolcpus_dhei-v1-1-00a711eb0c74@gmail.com>

Hi Qiliang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 1f97d9dcf53649c41c33227b345a36902cbb08ad]

url:    https://github.com/intel-lab-lkp/linux/commits/Qiliang-Yuan/sched-isolation-Remove-__init-restriction-from-housekeeping-cores/20260206-150801
base:   1f97d9dcf53649c41c33227b345a36902cbb08ad
patch link:    https://lore.kernel.org/r/20260206-feature-dynamic_isolcpus_dhei-v1-1-00a711eb0c74%40gmail.com
patch subject: [PATCH RFC 01/12] sched/isolation: Remove __init restriction from housekeeping cores
config: arc-randconfig-002-20260208 (https://download.01.org/0day-ci/archive/20260208/202602080949.LInEjVb0-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260208/202602080949.LInEjVb0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602080949.LInEjVb0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:101:
   kernel/sched/isolation.c: In function 'housekeeping_setup_type':
>> kernel/sched/isolation.c:115:13: warning: the comparison will always evaluate as 'true' for the address of 'cpumasks' will never be NULL [-Waddress]
     115 |         if (!housekeeping.cpumasks[type])
         |             ^
   kernel/sched/isolation.c:25:23: note: 'cpumasks' declared here
      25 |         cpumask_var_t cpumasks[HK_TYPE_MAX];
         |                       ^~~~~~~~


vim +115 kernel/sched/isolation.c

   106	
   107	static void housekeeping_setup_type(enum hk_type type,
   108						   cpumask_var_t housekeeping_staging)
   109	{
   110		unsigned int gfp = GFP_KERNEL;
   111	
   112		if (system_state < SYSTEM_RUNNING)
   113			gfp = GFP_NOWAIT;
   114	
 > 115		if (!housekeeping.cpumasks[type])
   116			alloc_cpumask_var(&housekeeping.cpumasks[type], gfp);
   117	
   118		cpumask_copy(housekeeping.cpumasks[type],
   119			     housekeeping_staging);
   120	}
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
