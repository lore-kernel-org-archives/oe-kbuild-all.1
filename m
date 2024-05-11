Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A032A610B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 May 2024 07:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715414277; cv=none; b=E3fWMusM5WQ3N3OB1m2qUiUtMvAIMhPJ5+1JTysfebSwp30G0y4I5NGG71Dnkff5kuAXTdxYDKtljD1lLuCBMOdFtFHVXxBQa5euph3kZ/NWdVum5Xdgk84STfki/jMyP2IaulbjTdcfRK5EDtEahKQquEmLatSbstVZjKyUz8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715414277; c=relaxed/simple;
	bh=5pQtC9LiFQTg9WzQsDbzDVawMlY/u2vhNtdEo5vjXxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PfwbfaDni7lDiKy7mK45zAg/EMqwkMMvPn2Hs2oDr7ZKfcqi2jU7248WeTJJh3pqz7YwC7TK6jKBFEdxr+dW/mS+vn6XyKTwLIi9rUaEaU0ApLdKcCPYcFjmMkkaElQAlIqZSmVHfIwuvfkylhNFxnUjFvSPth9gAU1xEvn8JNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YezPHMcd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YezPHMcd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715414276; x=1746950276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5pQtC9LiFQTg9WzQsDbzDVawMlY/u2vhNtdEo5vjXxM=;
  b=YezPHMcdHVeOc2YLHnxr7wqd1mNjTTWZFhwf4fzg9mlOaoGBOzFUpwNA
   20FBgQYZAp2gK3xqKOtONlCeLOXRO4KEWf51kP2iz5hgwisSlD+wP96J+
   7ZKxk+7oBlkmN1YACuQgRDLm+6FA+8BgeRuYBiYPq6Dp0/a90N4D9+D0Y
   lAsDIVhA9zAisu1LTBNQh5iwpmKTOGdwpmQDYljvyyzB4/Fyw7kpt3avI
   3UJWKBpF5S2uC7YZBoL4ZSysW4y57TCvV21O9t77h3YRz7M/7od4Zbk9U
   9ZQHvQz35VvdGBxVoPmSSyB0PAoWksUWbG2qApDXuRXv4C8CdXKMQLWoC
   A==;
X-CSE-ConnectionGUID: gRtusjYmR+Wnyu2Cyn7SmQ==
X-CSE-MsgGUID: 0hJeRqp3R4Gmrq2sDYVMFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11547608"
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="11547608"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 00:57:55 -0700
X-CSE-ConnectionGUID: Yl1ywe/lTUuYTsecv3+9FQ==
X-CSE-MsgGUID: jA9VTLoaQI2tEi6E2rca3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="34299728"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 May 2024 00:57:53 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5hc7-000779-1m;
	Sat, 11 May 2024 07:57:51 +0000
Date: Sat, 11 May 2024 15:57:01 +0800
From: kernel test robot <lkp@intel.com>
To: Nirmala Devi Mal Nadar <m.nirmaladevi@ltts.com>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
	Bhargav Raviprakash <bhargav.r@ltts.com>
Subject: [lee-mfd:ib-mfd-misc-pinctrl-regulator-6.10 9/9]
 drivers/pinctrl/pinctrl-tps6594.c:240:21: sparse: sparse: symbol
 'tps65224_muxval_remap' was not declared. Should it be static?
Message-ID: <202405111523.9yt759uX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-misc-pinctrl-regulator-6.10
head:   2088297159178ffc7c695fa34a7a88707371927d
commit: 2088297159178ffc7c695fa34a7a88707371927d [9/9] pinctrl: pinctrl-tps6594: Add TPS65224 PMIC pinctrl and GPIO
config: x86_64-randconfig-122-20240511 (https://download.01.org/0day-ci/archive/20240511/202405111523.9yt759uX-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405111523.9yt759uX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405111523.9yt759uX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/pinctrl-tps6594.c:240:21: sparse: sparse: symbol 'tps65224_muxval_remap' was not declared. Should it be static?
>> drivers/pinctrl/pinctrl-tps6594.c:246:21: sparse: sparse: symbol 'tps6594_muxval_remap' was not declared. Should it be static?

vim +/tps65224_muxval_remap +240 drivers/pinctrl/pinctrl-tps6594.c

   239	
 > 240	struct muxval_remap tps65224_muxval_remap[] = {
   241		{5, TPS6594_PINCTRL_DISABLE_WDOG_FUNCTION, TPS65224_PINCTRL_WKUP_FUNCTION_GPIO5},
   242		{5, TPS65224_PINCTRL_SYNCCLKIN_FUNCTION, TPS65224_PINCTRL_SYNCCLKIN_FUNCTION_GPIO5},
   243		{5, TPS65224_PINCTRL_NSLEEP2_FUNCTION, TPS65224_PINCTRL_NSLEEP2_FUNCTION_GPIO5},
   244	};
   245	
 > 246	struct muxval_remap tps6594_muxval_remap[] = {
   247		{8, TPS6594_PINCTRL_DISABLE_WDOG_FUNCTION, TPS6594_PINCTRL_DISABLE_WDOG_FUNCTION_GPIO8},
   248		{8, TPS6594_PINCTRL_SYNCCLKOUT_FUNCTION, TPS6594_PINCTRL_SYNCCLKOUT_FUNCTION_GPIO8},
   249		{9, TPS6594_PINCTRL_CLK32KOUT_FUNCTION, TPS6594_PINCTRL_CLK32KOUT_FUNCTION_GPIO9},
   250	};
   251	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
