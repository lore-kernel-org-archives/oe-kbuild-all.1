Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22A038F9C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 23:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761694184; cv=none; b=QYqYbRkBdNEgHjAseAhMTD1t0XuGZoen2U0l15bv0My8LTauxmFz/eXKvqU5qy1gJ/FJ7oicjITdfnoYS/knP3bO80BfAGYzrtjlvPVz0s2h5jzjHDdpeSFpaflvroU86PBsjTI6WxCaJm3QtcYCIxiZ9WcsVgyYP2B0OET/o4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761694184; c=relaxed/simple;
	bh=Ee5Byuz3gjQvvf2B522mzq3D4uduaED8vz5P2Cfr55o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eeuoMClkhJ/mwGP7+I+FiSVLMYsUUQe8uWwxYBbJVeZUY99Z1vxUBmvZkLTHXLbvlHLcFv/BudGs73qEOylUrNCpVifiO7rN1zshz4TWDWgWZ9+Mci4LZmI7mNGipmi2rIGRtS9jQZOmpmn9hH6Xc/wqy6ImATjKDQpvvS76iJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kArHYAcz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kArHYAcz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761694182; x=1793230182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ee5Byuz3gjQvvf2B522mzq3D4uduaED8vz5P2Cfr55o=;
  b=kArHYAczz3r2XwPX3xULcn67CNeO3PDL++gpV++wzgMowimKou7yPYKP
   AJz1NtrqNRf9P3SRkQqwarfRPvQ2ZE50C7N0o2RzzczFYxLWnnXa8BH0u
   ZCdd+zRxwW2z8NjIuTW/HAk66pqT2tPMtmlQrXfIU6fw1zoXA58H6EiV1
   P623O+oWYh7Sm41oStThh8iKIAU5jXvL52cN4Omyy+yLPY1XdwNfqQ1N6
   F9S03qYzvshiipKd21FHaM0rKyIwa564/eGh1KCyHvrgzx0JX6X7jC+PU
   XopW/8KRYDE+2gQRKeyz4l11UmAqRIT8btHkkjBdg8n/6nIgo2F8Q0IX6
   Q==;
X-CSE-ConnectionGUID: NxwER66YQn2W5N3dBDIhaA==
X-CSE-MsgGUID: 3VZd67z2TsqZw+gJkClbzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75255645"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="75255645"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 16:29:42 -0700
X-CSE-ConnectionGUID: ifIo6jk1RYuuq/LXGG6v3w==
X-CSE-MsgGUID: Ou3hQHhjR8KK6G2nuoQp+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="184677933"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 28 Oct 2025 16:29:42 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDt8C-000JsX-1u;
	Tue, 28 Oct 2025 23:29:37 +0000
Date: Wed, 29 Oct 2025 07:28:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1890/1890]
 arch/x86/events/zhaoxin/uncore.c:2789:36-50: opportunity for
 str_enabled_disabled(uncore_enabled)
Message-ID: <202510290723.7bXIAhsR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3749a0fa9e1453451f807b1ca86250ed77c17f05
commit: 80e508024be6ebad4efb6e9c0f2cc273e6ce3ce2 [1890/1890] perf/zhaoxin/uncore: Enhance uncore support and fix related bugs
config: x86_64-randconfig-r062-20251028 (https://download.01.org/0day-ci/archive/20251029/202510290723.7bXIAhsR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510290723.7bXIAhsR-lkp@intel.com/

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
