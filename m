Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5843D41C62
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 15:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762009740; cv=none; b=EvA6tfUvi+lizWUW90fo+fPGmtVaCy9dj61HFJNKiZ0VNDTHJcFImJIkPmsWF1s/RjuMWoqIvb0tSwwyh7ZYB1wfhyGOQ5N9vfvDBvioZzg8aatQWr5XVQs0aiLZ/pryRpOfzF6PGm06PNErlSazGfDwPQMHhbelUd0uVL3BuPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762009740; c=relaxed/simple;
	bh=pvvqZQuv30h623QMQ5zKdUDjUcomMvwxffZ7eYirorw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QuEB0ZXlhoZ0fQoH2glngkWjyrsPv2CVLwsZnF+WjxAf6XXRyK/hQEWWjyaL0zkZ8JjWQFB6DdTMAtohnyW4jWPBkc54q4UaFucRvQv2ROQngxEXWj+lB3YGYs2CD7yxlm6Z8Mpkp7auDG6Rp3wFSmiv0CiUiQx7m+gwwCoG3b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RyoW7yJu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RyoW7yJu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762009738; x=1793545738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pvvqZQuv30h623QMQ5zKdUDjUcomMvwxffZ7eYirorw=;
  b=RyoW7yJuhJqBKbVRUodJQkUBTWqek67uVGImr1CP/zTmeI5z/N/FkUjv
   +sNO9w625ON62fjkk27FpGNoyGJ+EezrRB7VMMywua3FdUcdaUGtVBHQR
   ETVQAofMZJL0T1x//EBJ/VpWt4z3RM/ySYY/xc5fNbjmo5wVxAW/rFUg2
   8Po3E2GY2nxhqoGH98loPnpx8oFHqJwucK+AJXpBQ6L+FJuUMOm/QZsrQ
   WKqObGx1S9pgwG5Mpu7WLQYQFRcPgimjMAeYS8mK5971DbB9DE7H0IfAI
   IjvaBnLuD8M94jzcibn40MCOgchtJfmH3LcTWvNPNlxH4vvt/I7csgR/Z
   A==;
X-CSE-ConnectionGUID: wFjU798lSHiBIr23Kpd76Q==
X-CSE-MsgGUID: EwAaUR+5Q16IA0D7t1vKdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="74442286"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="74442286"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 08:08:57 -0700
X-CSE-ConnectionGUID: 6+JQFUpxQXyA2t4bbGv8eA==
X-CSE-MsgGUID: 3gDJd7mSRQy1nmUPPdcs2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="186346953"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 01 Nov 2025 08:08:55 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFDDi-000ONC-0P;
	Sat, 01 Nov 2025 15:08:49 +0000
Date: Sat, 1 Nov 2025 23:08:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1890/1890]
 arch/x86/events/zhaoxin/uncore.c:2789:36-50: opportunity for
 str_enabled_disabled(uncore_enabled)
Message-ID: <202511012255.csuhL1If-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bca20ebb0eb886b6eef61fe75d9b476d02f92611
commit: 80e508024be6ebad4efb6e9c0f2cc273e6ce3ce2 [1890/1890] perf/zhaoxin/uncore: Enhance uncore support and fix related bugs
config: x86_64-randconfig-r062-20251028 (https://download.01.org/0day-ci/archive/20251101/202511012255.csuhL1If-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511012255.csuhL1If-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/events/zhaoxin/uncore.c:2789:36-50: opportunity for str_enabled_disabled(uncore_enabled)

vim +2789 arch/x86/events/zhaoxin/uncore.c

  2775	
  2776	/*
  2777	 * Process kernel command-line parameter at boot time.
  2778	 * zhaoxin_pmc_uncore={0|off} or zhaoxin_pmc_uncore={1|on}
  2779	 */
  2780	static int __init zhaoxin_uncore_enable(char *str)
  2781	{
  2782		if (!strcasecmp(str, "off") || !strcmp(str, "0"))
  2783			uncore_enabled = 0;
  2784		else if (!strcasecmp(str, "on") || !strcmp(str, "1"))
  2785			uncore_enabled = 1;
  2786		else
  2787			pr_err("zhaoxin_pmc_uncore: invalid parameter value (%s)\n", str);
  2788	
> 2789		pr_info("Zhaoxin PMC uncore %s\n", uncore_enabled ? "enabled" : "disabled");
  2790	
  2791		return 1;
  2792	}
  2793	__setup("zhaoxin_pmc_uncore=", zhaoxin_uncore_enable);
  2794	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
