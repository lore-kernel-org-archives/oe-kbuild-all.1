Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E238633FE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 14:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734792771; cv=none; b=lnsTv8Ax7Gez85PpgmfK+p8q1i9Ml7/g2OeQLw/yYK2L8ecM5T9wkfAIKqef4po0dWCp+mOk1rNX6ri9Bt95j4Oux1KAIA4RKJdd48wGp+vORfqlFSbh+w/Qv8jNn6vr/+7dHGLhXAR/0xJzbYOwFjWeFpFwqUDrpu4g17tBB1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734792771; c=relaxed/simple;
	bh=sczLQXD7MFWXKNIebYDCA2+qSjRLAWA3F9wMCoFUiJg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DEo/szXvSjb+ikNqK1q+RMvLjCDKq3a9LNLY+khyl/BgChkrNBbpTdcxjcD56KAVgf/o2S1igCuppj8fFarMkBmq8VwchEPeILM8kxHui0F+wcSV0Db4LN4BCMlzzbi9eEFAIhnW8xPjXPlMkejyuqrG1530JYwWKAyIFXc6PCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cv/deLsM; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cv/deLsM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734792770; x=1766328770;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sczLQXD7MFWXKNIebYDCA2+qSjRLAWA3F9wMCoFUiJg=;
  b=cv/deLsMcGQjZXKb7HjS1mwOymoxSvsl3RZsDvSZ4SVZIKDHSLAFDEcj
   LzOTLFIqQvUo4vgV5fTU2rV4AxZJfWiyvGo0iWyDUL+vRF6MYNJYPfO9n
   CP/wpEu/uSZJkjjMq7ZEL6suRtc2xztHnQF6SL/NZap1vyt7UY07CjXxn
   +mAfXS43MON0KcJoOkuUrUXT2BanyxQPHCnCOaIHy7h/6Ma4/uArEnb3d
   RgRnB7I013gFIIdxo/MwuYSjudFG/b5i0g/kUSNkiAgNFQLWuaNu4O7ci
   0SsuOoykCBj9V4N9CjN6q7YKCcfQacj+FBdUnxk7BIFsg4hy2exlLDy5w
   g==;
X-CSE-ConnectionGUID: 8SxjgicxRUWV8BHCpOkvpA==
X-CSE-MsgGUID: MgEwiX5wRn2KfSs0i9LgLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="60705967"
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="60705967"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 06:52:49 -0800
X-CSE-ConnectionGUID: F/sDgTCVRDSqDXENMQpHFA==
X-CSE-MsgGUID: gHYDgNdHS6mAolJn2RQqag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122072741"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Dec 2024 06:52:48 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP0qT-0002Er-2u;
	Sat, 21 Dec 2024 14:52:45 +0000
Date: Sat, 21 Dec 2024 22:51:56 +0800
From: kernel test robot <lkp@intel.com>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Pavel <pavel@ucw.cz>
Subject: drivers/leds/leds-lm3692x.c:119: warning: Function parameter or
 struct member 'boost_ctrl' not described in 'lm3692x_led'
Message-ID: <202412212228.jUObiZwY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   499551201b5f4fd3c0618a3e95e3d0d15ea18f31
commit: cffd61a5c7755546154539dcd7f36590e91e002f leds: lm3692x: Allow to configure over voltage protection
date:   5 years ago
config: s390-randconfig-002-20241220 (https://download.01.org/0day-ci/archive/20241221/202412212228.jUObiZwY-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412212228.jUObiZwY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412212228.jUObiZwY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/leds/leds-lm3692x.c:119: warning: Function parameter or struct member 'lock' not described in 'lm3692x_led'
   drivers/leds/leds-lm3692x.c:119: warning: Function parameter or struct member 'client' not described in 'lm3692x_led'
   drivers/leds/leds-lm3692x.c:119: warning: Function parameter or struct member 'led_dev' not described in 'lm3692x_led'
   drivers/leds/leds-lm3692x.c:119: warning: Function parameter or struct member 'regmap' not described in 'lm3692x_led'
   drivers/leds/leds-lm3692x.c:119: warning: Function parameter or struct member 'enable_gpio' not described in 'lm3692x_led'
   drivers/leds/leds-lm3692x.c:119: warning: Function parameter or struct member 'regulator' not described in 'lm3692x_led'
   drivers/leds/leds-lm3692x.c:119: warning: Function parameter or struct member 'led_enable' not described in 'lm3692x_led'
   drivers/leds/leds-lm3692x.c:119: warning: Function parameter or struct member 'model_id' not described in 'lm3692x_led'
>> drivers/leds/leds-lm3692x.c:119: warning: Function parameter or struct member 'boost_ctrl' not described in 'lm3692x_led'


vim +119 drivers/leds/leds-lm3692x.c

9699cb6bbef273 Dan Murphy    2017-12-12   96  
9699cb6bbef273 Dan Murphy    2017-12-12   97  /**
9699cb6bbef273 Dan Murphy    2017-12-12   98   * struct lm3692x_led -
9699cb6bbef273 Dan Murphy    2017-12-12   99   * @lock - Lock for reading/writing the device
9699cb6bbef273 Dan Murphy    2017-12-12  100   * @client - Pointer to the I2C client
9699cb6bbef273 Dan Murphy    2017-12-12  101   * @led_dev - LED class device pointer
9699cb6bbef273 Dan Murphy    2017-12-12  102   * @regmap - Devices register map
9699cb6bbef273 Dan Murphy    2017-12-12  103   * @enable_gpio - VDDIO/EN gpio to enable communication interface
9699cb6bbef273 Dan Murphy    2017-12-12  104   * @regulator - LED supply regulator pointer
07abd4325e7013 Dan Murphy    2018-07-02  105   * @led_enable - LED sync to be enabled
07abd4325e7013 Dan Murphy    2018-07-02  106   * @model_id - Current device model ID enumerated
9699cb6bbef273 Dan Murphy    2017-12-12  107   */
9699cb6bbef273 Dan Murphy    2017-12-12  108  struct lm3692x_led {
9699cb6bbef273 Dan Murphy    2017-12-12  109  	struct mutex lock;
9699cb6bbef273 Dan Murphy    2017-12-12  110  	struct i2c_client *client;
9699cb6bbef273 Dan Murphy    2017-12-12  111  	struct led_classdev led_dev;
9699cb6bbef273 Dan Murphy    2017-12-12  112  	struct regmap *regmap;
9699cb6bbef273 Dan Murphy    2017-12-12  113  	struct gpio_desc *enable_gpio;
9699cb6bbef273 Dan Murphy    2017-12-12  114  	struct regulator *regulator;
07abd4325e7013 Dan Murphy    2018-07-02  115  	int led_enable;
07abd4325e7013 Dan Murphy    2018-07-02  116  	int model_id;
cffd61a5c77555 Guido Günther 2020-01-04  117  
cffd61a5c77555 Guido Günther 2020-01-04  118  	u8 boost_ctrl;
9699cb6bbef273 Dan Murphy    2017-12-12 @119  };
9699cb6bbef273 Dan Murphy    2017-12-12  120  

:::::: The code at line 119 was first introduced by commit
:::::: 9699cb6bbef273d7be25441bfc20a2db9ee0f509 leds: lm3692x: Introduce LM3692x dual string driver

:::::: TO: Dan Murphy <dmurphy@ti.com>
:::::: CC: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
