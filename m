Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3A5136989
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 20:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709844813; cv=none; b=AKKdG9n0eMFD5Gm8QqCvW6yBRvJ+HhRPQP7czQLVqt5WZry04uOzUyJEnARWjCLgYwle4MlxAtWDAHZiid76VgQ3o6mwn58v6omdkhxwBsvE6HNg6kNr8lHnhJjqeyNCYls0EHyPrlfKJtu4BL/9YstDIZdIWsmDMO/xM+0hlwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709844813; c=relaxed/simple;
	bh=HNygQW1ZM7/UlHMtnsMjVLjzmZwf6X7bgkpQlm/VEaM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V8u7dmlcf80BeI0Gx7i4IEYe74S99XXTAeCrCD5C8Kam1uFD383ur4IUwxvbdlUMkYhrjrfRvGF4+BF5yVshQYr1mXqIkvUji2Xe8NTq6gCnCIB6ZK2LwGSM7T1bNTRR3WMcCmE+6a5N3AFDQXzCniat/l/81o+GUIXG2O3hByU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G4nBbGo3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G4nBbGo3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709844812; x=1741380812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HNygQW1ZM7/UlHMtnsMjVLjzmZwf6X7bgkpQlm/VEaM=;
  b=G4nBbGo3VTDZCuIfdb8Moa568VqI2DOyDLM/8OUnhpy+mhA9R8ymDu1c
   ki7jT0sYVlSpWzfOlTqAtGIxZVvSrNPoGMMKMvChchDiviMYwRh5NBJ+W
   8nBHcJBlsXpDnKa0nXe/L4ToKqM8JRo2Fm7ZfoiT4Qo0rXGZJzeK0Q19a
   ShYTR4lY0VZ1csuFRZl6gGSrdtsdhFOuNE2ySGs0prgfAarBHPWKrvych
   fdvSzkKl3RYfx6nKAYDEiApKN/cCe0bsZzt5QNkIS/nGyRTr7IIzHX5Ra
   LuiacjfH1qSpyOPVdbAJttYAPrpsanK+7uphqWlmROPj6qMGgomOu+G3t
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="27015836"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="27015836"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 12:53:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="14922601"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Mar 2024 12:53:22 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riKju-0005gv-1r;
	Thu, 07 Mar 2024 20:53:18 +0000
Date: Fri, 8 Mar 2024 04:52:19 +0800
From: kernel test robot <lkp@intel.com>
To: Phil Elwell <phil@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>
Subject: [jmondi:pispbe/media-staging/be-upstream 6/143]
 drivers/pinctrl/bcm/pinctrl-bcm2712.c:1009:20: warning: variable 'arg' set
 but not used
Message-ID: <202403080407.XUxwc1kH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git pispbe/media-staging/be-upstream
head:   b7b928a1ff80dc548d6f5c1b8c00b2082212e38e
commit: e839a3c9e275f9506bcc5f49c5a2b0c45b047985 [6/143] pinctrl: bcm2712 pinctrl/pinconf driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240308/202403080407.XUxwc1kH-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403080407.XUxwc1kH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403080407.XUxwc1kH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pinctrl/bcm/pinctrl-bcm2712.c: In function 'bcm2712_pinconf_set':
>> drivers/pinctrl/bcm/pinctrl-bcm2712.c:1009:20: warning: variable 'arg' set but not used [-Wunused-but-set-variable]
    1009 |         u32 param, arg;
         |                    ^~~
   drivers/pinctrl/bcm/pinctrl-bcm2712.c: At top level:
>> drivers/pinctrl/bcm/pinctrl-bcm2712.c:682:39: warning: 'bcm2712_d0_aon_sgpio_pin_funcs' defined but not used [-Wunused-const-variable=]
     682 | static const struct bcm2712_pin_funcs bcm2712_d0_aon_sgpio_pin_funcs[] = {
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/bcm/pinctrl-bcm2712.c:598:39: warning: 'bcm2712_c0_aon_sgpio_pin_funcs' defined but not used [-Wunused-const-variable=]
     598 | static const struct bcm2712_pin_funcs bcm2712_c0_aon_sgpio_pin_funcs[] = {
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/arg +1009 drivers/pinctrl/bcm/pinctrl-bcm2712.c

  1003	
  1004	static int bcm2712_pinconf_set(struct pinctrl_dev *pctldev,
  1005				       unsigned int pin, unsigned long *configs,
  1006				       unsigned int num_configs)
  1007	{
  1008		struct bcm2712_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
> 1009		u32 param, arg;
  1010		int i;
  1011	
  1012		for (i = 0; i < num_configs; i++) {
  1013			param = pinconf_to_config_param(configs[i]);
  1014			arg = pinconf_to_config_argument(configs[i]);
  1015	
  1016			switch (param) {
  1017			case PIN_CONFIG_BIAS_DISABLE:
  1018				bcm2712_pull_config_set(pc, pin, BCM2712_PULL_NONE);
  1019				break;
  1020			case PIN_CONFIG_BIAS_PULL_DOWN:
  1021				bcm2712_pull_config_set(pc, pin, BCM2712_PULL_DOWN);
  1022				break;
  1023			case PIN_CONFIG_BIAS_PULL_UP:
  1024				bcm2712_pull_config_set(pc, pin, BCM2712_PULL_UP);
  1025				break;
  1026			default:
  1027				return -ENOTSUPP;
  1028			}
  1029		} /* for each config */
  1030	
  1031		return 0;
  1032	}
  1033	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
