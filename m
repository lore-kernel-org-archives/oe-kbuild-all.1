Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA9A22A808
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 10:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751965; cv=none; b=Hae9VchZCG6tEY9L/KzeM6jIsYHbNjzhJlCwF072xGZoJf4mpOPflCaCqrt/7UO9g3AkHhDyjUYms2lPXqxc4Y9RvJeMPygxbKXnwuZ/DXsuvN6UPBJJmXEFWRh6Vg93SicFQ3Yj40SV/S8pXlhVRoj1EyDcwO44MewJWZFGuDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751965; c=relaxed/simple;
	bh=C1vTbtblxMThMwXtCPFa3tGgwgROq4XLhG+l6jbkLx4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G+WXQzwenRYWbIlQ0JHexDBGZgrHnzdpuyEUAuiR/0pUnCw1I3FpTC8/WFIJoSjOac1IET5N97s7PZRWsN0VGdKyMEtz8TII1QQMI6I1Yk9wYN4eMWxBqEELZWwJ1s6Q6M9XLpyMkHoAXnSg9VwzUzzxNqTHF27Ng2TEmCxEtRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oAmvPVDt; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oAmvPVDt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738751963; x=1770287963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C1vTbtblxMThMwXtCPFa3tGgwgROq4XLhG+l6jbkLx4=;
  b=oAmvPVDt62L5qVzDE/DZT5ydw50sg1QfPa0CNyp+7TwtboEijBRJ0N/I
   o0y72u8s5/q+zFnFjKNUkJMLsVvGnL6KNQYGJaI45Jc+gUQLw6rVPYoKL
   YzyRyyOaL+BGc6TA9xXZovyRk4IeaRN47sDGf7oBckdJMO1VulljYpHsS
   RU23DtjZFo20+AsLNXWTUgSci7necH+24kcB1O4UroTMmVBEyqm4rwqxh
   ynTFr2hBlG28N9CBtRgUwZHZXhbuCrvwa5IFjdGAI1grzCHOYBxMmEuxu
   Vs6WVaOQ8BFUhCNBKgcC2KCQyeCcpEwSjq++WYLwLzvy0OQOgvOljm7XH
   g==;
X-CSE-ConnectionGUID: tfCL/R+YRDC3p+B6xFNCDA==
X-CSE-MsgGUID: rIfYQwUAQG+nygZ3w1dy0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38544567"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="38544567"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 02:39:23 -0800
X-CSE-ConnectionGUID: Ox3/mOu3RZK7n5Txm94oOA==
X-CSE-MsgGUID: ycxqCiZsTtSZxIR3fsOJqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114937762"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Feb 2025 02:39:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfcoS-000tmt-0a;
	Wed, 05 Feb 2025 10:39:20 +0000
Date: Wed, 5 Feb 2025 18:39:10 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <treding@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thierryreding:pmc 1/26] drivers/irqchip/exynos-combiner.c:209:
 warning: Function parameter or struct member 'ops' not described in
 'combiner_suspend'
Message-ID: <202502051834.Kj3jKw2n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thierryreding/linux pmc
head:   a402c19b24a5dc1ba2f6fb41de0080a97c202c1b
commit: f5ff652a1c2ce0a75ce86425cbc5f499933c9018 [1/26] syscore: Pass context data to callbacks
config: i386-buildonly-randconfig-004-20250205 (https://download.01.org/0day-ci/archive/20250205/202502051834.Kj3jKw2n-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502051834.Kj3jKw2n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502051834.Kj3jKw2n-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/exynos-combiner.c:209: warning: Function parameter or struct member 'ops' not described in 'combiner_suspend'
>> drivers/irqchip/exynos-combiner.c:227: warning: Function parameter or struct member 'ops' not described in 'combiner_resume'
--
>> kernel/irq/pm.c:234: warning: Function parameter or struct member 'ops' not described in 'irq_pm_syscore_resume'


vim +209 drivers/irqchip/exynos-combiner.c

6fd4899a54a522 Javier Martinez Canillas 2015-06-12  200  
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  201  /**
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  202   * combiner_suspend - save interrupt combiner state before suspend
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  203   *
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  204   * Save the interrupt enable set register for all combiner groups since
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  205   * the state is lost when the system enters into a sleep state.
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  206   *
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  207   */
f5ff652a1c2ce0 Thierry Reding           2025-01-31  208  static int combiner_suspend(struct syscore_ops *ops)
6fd4899a54a522 Javier Martinez Canillas 2015-06-12 @209  {
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  210  	int i;
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  211  
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  212  	for (i = 0; i < max_nr; i++)
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  213  		combiner_data[i].pm_save =
2a4fe14bc8da0a Ben Dooks                2016-06-21  214  			readl_relaxed(combiner_data[i].base + COMBINER_ENABLE_SET);
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  215  
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  216  	return 0;
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  217  }
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  218  
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  219  /**
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  220   * combiner_resume - restore interrupt combiner state after resume
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  221   *
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  222   * Restore the interrupt enable set register for all combiner groups since
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  223   * the state is lost when the system enters into a sleep state on suspend.
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  224   *
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  225   */
f5ff652a1c2ce0 Thierry Reding           2025-01-31  226  static void combiner_resume(struct syscore_ops *ops)
6fd4899a54a522 Javier Martinez Canillas 2015-06-12 @227  {
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  228  	int i;
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  229  
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  230  	for (i = 0; i < max_nr; i++) {
2a4fe14bc8da0a Ben Dooks                2016-06-21  231  		writel_relaxed(combiner_data[i].irq_mask,
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  232  			     combiner_data[i].base + COMBINER_ENABLE_CLEAR);
2a4fe14bc8da0a Ben Dooks                2016-06-21  233  		writel_relaxed(combiner_data[i].pm_save,
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  234  			     combiner_data[i].base + COMBINER_ENABLE_SET);
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  235  	}
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  236  }
6fd4899a54a522 Javier Martinez Canillas 2015-06-12  237  

:::::: The code at line 209 was first introduced by commit
:::::: 6fd4899a54a522ccd6a24fea2318d3b515b95945 irqchip: exynos-combiner: Save IRQ enable set on suspend

:::::: TO: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
