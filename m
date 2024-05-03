Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493C726AF5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 15:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714751982; cv=none; b=VwFkKb5XC3xugwDYxNWK06iPzCM2fdErEl7aYUAbrTwVZOoXuBPq/Xq0J9Xd2LGrcjq1PGSJyDbpq/Bda52Tfa1IB4u8Y4yUxlNjRQkshPkhZUdwZS/axmZRwNQ9nbodqQXnAeKLM7ZFfAiuD4YNbMpFJz7CzZPYDdTaxaGSm+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714751982; c=relaxed/simple;
	bh=u42GgyaiWnc+HVsyFaIIaJLRwSRoV3zeQARc100SanM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FaTDGKd1pKIOCzx3rQwNRS5zespwOMydbmUuLLjWpfm0m1WTaKQ0dRCZsjjR9ovDfc+CrGzgPJYwygTXP21tCWDb1Rj5BbBrROgCdxq+paGUcfuzCcHo2KdBhsyk2qu2MjTge+Ap64jmPkn+vE86IsgbrtWNywMVDwb+4soYqfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFbAFgp1; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFbAFgp1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714751981; x=1746287981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u42GgyaiWnc+HVsyFaIIaJLRwSRoV3zeQARc100SanM=;
  b=mFbAFgp1f4JHfyHLP5H18tP65kF/flEIJOsmNxl0zv5i3xzFkxfcYOuP
   4Tnmdj9dPvq1PErr5c2K741G/i40n6Oi8YtnP2TrVx5qz30M7naYpnCc9
   VAHYUXbKAl/j7OEtaqhgtRdHMQmDnjeGvEwKt3VPaB6rZZAdI08wDNaWG
   pxobBDkOyMWgQeU1OEhYr8Tdv0TfE7YleX4rv/Ck5RRDgtnvSNr8GQ/Vt
   BkBT29IudgorKSD/1/Dyjoj7ESLKfxHRzc5j1NgewHXcaJJykgL4KApuM
   fOXOfrbC0v2hURbkjzrSG/lNbjkFuiBxLtLxfwhmE0TiQcP/hjaaQ58Kx
   Q==;
X-CSE-ConnectionGUID: 1TWPw+oOQSuVrYIF5K06Jg==
X-CSE-MsgGUID: 2SLvQOC6QF2wO6X5qvB7bQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10691684"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="10691684"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 08:59:40 -0700
X-CSE-ConnectionGUID: d8C1ASsHSoCt0aaUPq3pFg==
X-CSE-MsgGUID: kz6A7BCLRoa0qHu/BdFK+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="58393468"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 May 2024 08:59:39 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2vJw-000BpY-0n;
	Fri, 03 May 2024 15:59:36 +0000
Date: Fri, 3 May 2024 23:59:19 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 531/1143]
 drivers/gpio/gpio-aspeed.c:1490:48: error: too few arguments to function
 call, expected 3, have 2
Message-ID: <202405032355.WWWrod2r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: 7392e5986bb9b125be146a6c3d12d994af58412e [531/1143] gpio: aspeed: Support the aspeed g7 gpio controller
config: arm-randconfig-001-20240503 (https://download.01.org/0day-ci/archive/20240503/202405032355.WWWrod2r-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405032355.WWWrod2r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405032355.WWWrod2r-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-aspeed.c:1490:48: error: too few arguments to function call, expected 3, have 2
    1490 |                 return pinctrl_gpio_set_config(offset, config);
         |                        ~~~~~~~~~~~~~~~~~~~~~~~               ^
   include/linux/pinctrl/consumer.h:36:5: note: 'pinctrl_gpio_set_config' declared here
      36 | int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
         |     ^                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      37 |                                 unsigned long config);
         |                                 ~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +1490 drivers/gpio/gpio-aspeed.c

  1478	
  1479	static int aspeed_g7_gpio_set_config(struct gpio_chip *chip,
  1480					     unsigned int offset, unsigned long config)
  1481	{
  1482		unsigned long param = pinconf_to_config_param(config);
  1483		u32 arg = pinconf_to_config_argument(config);
  1484	
  1485		if (param == PIN_CONFIG_INPUT_DEBOUNCE)
  1486			return set_g7_debounce(chip, offset, arg);
  1487		else if (param == PIN_CONFIG_BIAS_DISABLE ||
  1488			 param == PIN_CONFIG_BIAS_PULL_DOWN ||
  1489			 param == PIN_CONFIG_DRIVE_STRENGTH)
> 1490			return pinctrl_gpio_set_config(offset, config);
  1491		else if (param == PIN_CONFIG_DRIVE_OPEN_DRAIN ||
  1492			 param == PIN_CONFIG_DRIVE_OPEN_SOURCE)
  1493			/* Return -EOPNOTSUPP to trigger emulation, as per datasheet */
  1494			return -EOPNOTSUPP;
  1495		else if (param == PIN_CONFIG_PERSIST_STATE)
  1496			return aspeed_g7_gpio_reset_tolerance(chip, offset, arg);
  1497	
  1498		return -EOPNOTSUPP;
  1499	}
  1500	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
