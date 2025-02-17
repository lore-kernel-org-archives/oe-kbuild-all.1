Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107B1148FE6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 15:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739807276; cv=none; b=godV9IyHiKr7YLjGRUHINPhuTcP6keOsC9GcmM0ITlTja5tC0tAnpycWfd6oqEQqnuOB/9v9H0jl/oNSVMs+QuzNUtvUd4DjdFIrsqI/U3ovScGx00RIdhKoO8uoSq1Ly9Sxt+Yn0crCr++2wswqxw2L5rd7RMmIqUaVzZ9RqYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739807276; c=relaxed/simple;
	bh=sjVB4P42XPS39qY8j6mnwqmpgkr5DlcyXmIEqHA/kQI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=STBHMbbFvIf2kQdtzRnW1tSHieZgj43EBjj+52vAxWbVPRCKWk9D//wL1RpTTrvObcQv6g5QMS1nKxcyPi25RCSbhnv/GIqbkKmjbSEHZsAC5sRAFOHcJuaNbEHScDI7G/viaUKtQfVkRozF0cqBtOLy4yLUQc8Yr1lVyQHst2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=clJM9Agk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="clJM9Agk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739807275; x=1771343275;
  h=date:from:cc:subject:message-id:mime-version;
  bh=sjVB4P42XPS39qY8j6mnwqmpgkr5DlcyXmIEqHA/kQI=;
  b=clJM9Agk1F0jYokA47KKFb/X0qn7Bk1GP8u/G1gnttdUg8MlOUDX+G6P
   Gwrk8iYF7fpShQu88DzSc+5rzJfGkblfuvUvm043V7BfsFQy9XGGejnvn
   4orVJRlKSZh2BXn3Xcz+72z2Bl5OtEBaro8rWtpmQje0wo0O44ELAQGAc
   G441H+BZP/FDDjNQ/A9BFU012ShJ2b3OM/ZkNhjgF1Mv3G6rrkQYq8pN3
   QrERn8FbWduS+HM1v9eYA/QRyl4DkpGYfm1Ht1pXYIE8jZFxJOcqKR+m+
   /8iW0soQi1NCAHCFZj5eImo+OYYuSiwjZ8q38qe0w4r5jwK4pimqR1XMh
   w==;
X-CSE-ConnectionGUID: BjEoNOh/T1S/BrCtaidgww==
X-CSE-MsgGUID: yqA4HUFnSMOIOguvBAbi3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40754674"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="40754674"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 07:47:54 -0800
X-CSE-ConnectionGUID: Dh+N8Lz0QVu7kC+kgquEhw==
X-CSE-MsgGUID: BXDOIwdMSDeBhbqaLbAILg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137393659"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Feb 2025 07:47:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tk3Lb-001DIR-1Y
	for oe-kbuild-all@lists.linux.dev;
	Mon, 17 Feb 2025 15:47:51 +0000
Date: Mon, 17 Feb 2025 23:47:01 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] drivers/pinctrl/pxa/../pinctrl-utils.h:36:22:
 warning: 'enum pinctrl_map_type' declared inside parameter list will not be
 visible outside of this definition or declaration
Message-ID: <202502172344.9klZOL1D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vladimir,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: 87eff9af7efb154cc4a940ed12efc803a0bf3fba [1/1] pinctrl: remove pinctrl/machine.h inclusion from pinctrl/pinconf.h
config: i386-buildonly-randconfig-002-20250217 (https://download.01.org/0day-ci/archive/20250217/202502172344.9klZOL1D-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502172344.9klZOL1D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502172344.9klZOL1D-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/xarray.h:14,
                    from include/linux/radix-tree.h:31,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:14,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:17,
                    from drivers/pinctrl/pxa/pinctrl-pxa2xx.c:14:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1161:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1161 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1152:27: note: 'mem_section' declared here
    1152 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   In file included from drivers/pinctrl/pxa/pinctrl-pxa2xx.c:24:
   drivers/pinctrl/pxa/../pinctrl-utils.h: At top level:
>> drivers/pinctrl/pxa/../pinctrl-utils.h:36:22: warning: 'enum pinctrl_map_type' declared inside parameter list will not be visible outside of this definition or declaration
      36 |                 enum pinctrl_map_type type);
         |                      ^~~~~~~~~~~~~~~~
   drivers/pinctrl/pxa/pinctrl-pxa2xx.c:431:5: warning: no previous prototype for 'pxa2xx_pinctrl_exit' [-Wmissing-prototypes]
     431 | int pxa2xx_pinctrl_exit(struct platform_device *pdev)
         |     ^~~~~~~~~~~~~~~~~~~


vim +36 drivers/pinctrl/pxa/../pinctrl-utils.h

1eb207a9ecaafb Laxman Dewangan 2013-08-06  24  
1eb207a9ecaafb Laxman Dewangan 2013-08-06  25  int pinctrl_utils_reserve_map(struct pinctrl_dev *pctldev,
1eb207a9ecaafb Laxman Dewangan 2013-08-06  26  		struct pinctrl_map **map, unsigned *reserved_maps,
1eb207a9ecaafb Laxman Dewangan 2013-08-06  27  		unsigned *num_maps, unsigned reserve);
1eb207a9ecaafb Laxman Dewangan 2013-08-06  28  int pinctrl_utils_add_map_mux(struct pinctrl_dev *pctldev,
1eb207a9ecaafb Laxman Dewangan 2013-08-06  29  		struct pinctrl_map **map, unsigned *reserved_maps,
1eb207a9ecaafb Laxman Dewangan 2013-08-06  30  		unsigned *num_maps, const char *group,
1eb207a9ecaafb Laxman Dewangan 2013-08-06  31  		const char *function);
1eb207a9ecaafb Laxman Dewangan 2013-08-06  32  int pinctrl_utils_add_map_configs(struct pinctrl_dev *pctldev,
1eb207a9ecaafb Laxman Dewangan 2013-08-06  33  		struct pinctrl_map **map, unsigned *reserved_maps,
1eb207a9ecaafb Laxman Dewangan 2013-08-06  34  		unsigned *num_maps, const char *group,
1eb207a9ecaafb Laxman Dewangan 2013-08-06  35  		unsigned long *configs, unsigned num_configs,
1eb207a9ecaafb Laxman Dewangan 2013-08-06 @36  		enum pinctrl_map_type type);
1eb207a9ecaafb Laxman Dewangan 2013-08-06  37  int pinctrl_utils_add_config(struct pinctrl_dev *pctldev,
1eb207a9ecaafb Laxman Dewangan 2013-08-06  38  		unsigned long **configs, unsigned *num_configs,
1eb207a9ecaafb Laxman Dewangan 2013-08-06  39  		unsigned long config);
d32f7fd3bbc327 Irina Tirdea    2016-03-31  40  void pinctrl_utils_free_map(struct pinctrl_dev *pctldev,
1eb207a9ecaafb Laxman Dewangan 2013-08-06  41  		struct pinctrl_map *map, unsigned num_maps);
1eb207a9ecaafb Laxman Dewangan 2013-08-06  42  

:::::: The code at line 36 was first introduced by commit
:::::: 1eb207a9ecaafb980704d8bc055a9a0269f62f8e pinctrl: add utility functions for add map/configs

:::::: TO: Laxman Dewangan <ldewangan@nvidia.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
