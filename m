Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1238078F47
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 10:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735468369; cv=none; b=eWvLGU1Rcb8XfYADtHip2YFCfgehhapwbFq830h8dO8fnlpMPr+Z1qNowxu39Rhn2Wb83x6JnZfFAOICk+2lZ5+T557cpZeceCZIJBxGuaxCcj0XKYXr4MO2gmTxjM5UsN5Y6VxZ+HeY0N4nK5XY3pPFWP2DlkMTdUQ8MkzNB4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735468369; c=relaxed/simple;
	bh=H25YvWiZRgrBYQSF1rpCoQiyQjuV55hOjL7PEdMniq8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mso4RSAOc8VcwYLR9KUqpWcf2uKJoM+AICkGGTrHYB1q+zytPSxLths5+kjowtswVuFJrQ35ln5Oh+VnPZgvLtvaG2E5gmcWhgwcnJTd9zQPU5FxQe6fpzQJPSYjYOTJCbr1fKAUpmpp0YdQYc0fDhGKnOwsTTMYD5ckRfkNAQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y3zjVm4I; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y3zjVm4I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735468368; x=1767004368;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=H25YvWiZRgrBYQSF1rpCoQiyQjuV55hOjL7PEdMniq8=;
  b=Y3zjVm4IW+/UrFfBUDrmRMoOUnsUrdqCCCpGRNZEl6ai9dFtRyG70yDu
   jdJ7mv46+DRXqBAskhzCTzGKrSyIeY506nGpYpXT4HX0hY9XVa0LQi83p
   Al8iueEkitLXaTn1SK6ptsaBMIADjKDPrhkpWX59GqEsfipAZR4meJNLM
   KbbBHe9H/DuMcWA7tGCBSoAVkpPBtrnghogrJhI6cG9VchhwVTGtBNtMT
   gpLXre28aLPrd+oea1S7ECzMqFv8n+T5bWbY12VQOXqzNqfCnkVkNwjBB
   QlGMNlC+rp1HTD+E4AwJbzVrnEus/AfDAZsf2MGJfLXJGB8cBEaS4XoGv
   w==;
X-CSE-ConnectionGUID: xkLkTqUmQj2VET2YMTWiZA==
X-CSE-MsgGUID: gAiXlgQkRZS3JVNDorjhNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="46784256"
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="46784256"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 02:32:45 -0800
X-CSE-ConnectionGUID: cgd9C/7eQmS1JenLrkMWRw==
X-CSE-MsgGUID: PJqHLxTLTBO0wgvzRv/oNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="105618529"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Dec 2024 02:32:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRqbB-0004br-2C;
	Sun, 29 Dec 2024 10:32:41 +0000
Date: Sun, 29 Dec 2024 18:32:33 +0800
From: kernel test robot <lkp@intel.com>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Pavel <pavel@ucw.cz>
Subject: drivers/leds/leds-lm3692x.c:121: warning: Function parameter or
 struct member 'brightness_ctrl' not described in 'lm3692x_led'
Message-ID: <202412291851.oUEqhWj3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Guido,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   059dd502b263d8a4e2a84809cf1068d6a3905e6f
commit: 260718b3a35d23fe89d27cc7b5e8bd30f4bba1aa leds: lm3692x: Disable chip on brightness 0
date:   5 years ago
config: sparc-randconfig-002-20241212 (https://download.01.org/0day-ci/archive/20241229/202412291851.oUEqhWj3-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412291851.oUEqhWj3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412291851.oUEqhWj3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/leds/leds-lm3692x.c:121: warning: Function parameter or struct member 'lock' not described in 'lm3692x_led'
   drivers/leds/leds-lm3692x.c:121: warning: Function parameter or struct member 'client' not described in 'lm3692x_led'
   drivers/leds/leds-lm3692x.c:121: warning: Function parameter or struct member 'led_dev' not described in 'lm3692x_led'
   drivers/leds/leds-lm3692x.c:121: warning: Function parameter or struct member 'regmap' not described in 'lm3692x_led'
   drivers/leds/leds-lm3692x.c:121: warning: Function parameter or struct member 'enable_gpio' not described in 'lm3692x_led'
   drivers/leds/leds-lm3692x.c:121: warning: Function parameter or struct member 'regulator' not described in 'lm3692x_led'
   drivers/leds/leds-lm3692x.c:121: warning: Function parameter or struct member 'led_enable' not described in 'lm3692x_led'
   drivers/leds/leds-lm3692x.c:121: warning: Function parameter or struct member 'model_id' not described in 'lm3692x_led'
   drivers/leds/leds-lm3692x.c:121: warning: Function parameter or struct member 'boost_ctrl' not described in 'lm3692x_led'
>> drivers/leds/leds-lm3692x.c:121: warning: Function parameter or struct member 'brightness_ctrl' not described in 'lm3692x_led'
>> drivers/leds/leds-lm3692x.c:121: warning: Function parameter or struct member 'enabled' not described in 'lm3692x_led'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for COMPAT_BINFMT_ELF
   Depends on [n]: COMPAT [=y] && BINFMT_ELF [=n]
   Selected by [y]:
   - COMPAT [=y] && SPARC64 [=y]


vim +121 drivers/leds/leds-lm3692x.c

9699cb6bbef273 Dan Murphy    2017-12-12   97  
9699cb6bbef273 Dan Murphy    2017-12-12   98  /**
9699cb6bbef273 Dan Murphy    2017-12-12   99   * struct lm3692x_led -
9699cb6bbef273 Dan Murphy    2017-12-12  100   * @lock - Lock for reading/writing the device
9699cb6bbef273 Dan Murphy    2017-12-12  101   * @client - Pointer to the I2C client
9699cb6bbef273 Dan Murphy    2017-12-12  102   * @led_dev - LED class device pointer
9699cb6bbef273 Dan Murphy    2017-12-12  103   * @regmap - Devices register map
9699cb6bbef273 Dan Murphy    2017-12-12  104   * @enable_gpio - VDDIO/EN gpio to enable communication interface
9699cb6bbef273 Dan Murphy    2017-12-12  105   * @regulator - LED supply regulator pointer
07abd4325e7013 Dan Murphy    2018-07-02  106   * @led_enable - LED sync to be enabled
07abd4325e7013 Dan Murphy    2018-07-02  107   * @model_id - Current device model ID enumerated
9699cb6bbef273 Dan Murphy    2017-12-12  108   */
9699cb6bbef273 Dan Murphy    2017-12-12  109  struct lm3692x_led {
9699cb6bbef273 Dan Murphy    2017-12-12  110  	struct mutex lock;
9699cb6bbef273 Dan Murphy    2017-12-12  111  	struct i2c_client *client;
9699cb6bbef273 Dan Murphy    2017-12-12  112  	struct led_classdev led_dev;
9699cb6bbef273 Dan Murphy    2017-12-12  113  	struct regmap *regmap;
9699cb6bbef273 Dan Murphy    2017-12-12  114  	struct gpio_desc *enable_gpio;
9699cb6bbef273 Dan Murphy    2017-12-12  115  	struct regulator *regulator;
07abd4325e7013 Dan Murphy    2018-07-02  116  	int led_enable;
07abd4325e7013 Dan Murphy    2018-07-02  117  	int model_id;
cffd61a5c77555 Guido Günther 2020-01-04  118  
260718b3a35d23 Guido Günther 2020-01-06  119  	u8 boost_ctrl, brightness_ctrl;
260718b3a35d23 Guido Günther 2020-01-06  120  	bool enabled;
9699cb6bbef273 Dan Murphy    2017-12-12 @121  };
9699cb6bbef273 Dan Murphy    2017-12-12  122  

:::::: The code at line 121 was first introduced by commit
:::::: 9699cb6bbef273d7be25441bfc20a2db9ee0f509 leds: lm3692x: Introduce LM3692x dual string driver

:::::: TO: Dan Murphy <dmurphy@ti.com>
:::::: CC: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
