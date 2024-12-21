Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB176143895
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 18:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734806796; cv=none; b=bzbMyEfQwTdu2/7yQewQjBbAEgTb2hxPc3GnvKNFuGCxu/SsFZs0EXotsNkz5gzup9lwATT+xs0cGXll0XJeVSenyfdZLn4h5BCZA7lGO8ZAWzBp37x/lAG0Kvr4+XYmd7ddQ6g/OUebWJRW6H6q8Mw9RXfQ8AhXWaMx7TAflzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734806796; c=relaxed/simple;
	bh=F7THzvlX8AaFakuNH26sYQitfB4UmKso0LYUWyltPi8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AFFeNqUeAQ9aqUFlA2/0kvE7UiobwtU1LOQksuv7U8XxTQIK9wlSpGrO0PfS3TlpDtG0KKloAQRO/Qxa2fkagxbuzjDvdj3VSmeFEOF8PuYPTmz9LPr5Vw1CWpfVZeyWPj1/xVh5FVGmm1umj6EQADNLnHDKgNBnTJ0TfJGItLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHeG28LT; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHeG28LT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734806795; x=1766342795;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=F7THzvlX8AaFakuNH26sYQitfB4UmKso0LYUWyltPi8=;
  b=GHeG28LTZsiZhtjSh3ZDhVem7J39nFyQFUj5sIm6GITXv1zYxqw5ykFf
   27VyLJWS2q80KwqabcPUWoMBaH6vZNDimT6OyVrLiqfLlaNiMSySVwYNb
   8MpuFhb4EiXnudM2jq9GP63hyCbyNdJxkHMtO3o6C0mpSRqsj87iIAcFa
   PbuBvmDb88404bjdeEtE1ThFmTAWFujDCg5d2UhOPL10PLzABm+Fthf69
   5C9Vs+nbIdE1eLuOL9unFC4kjRvgK1sNds8Jw/DKTT7+nJG6EInj2fUO8
   G5OVm0ErYgCL0TlWZDonZzEjL67oPPkWSTcxJ/cFFxvO01+IxfgNHy75U
   Q==;
X-CSE-ConnectionGUID: gJ1jLyu4STyLRxjpvKRG3g==
X-CSE-MsgGUID: 04ZOozhTQUKy7VNpGtpaog==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="22918770"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="22918770"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 10:46:34 -0800
X-CSE-ConnectionGUID: G1opYLruQrys/e6Xc6bY+w==
X-CSE-MsgGUID: kE5uXSSqSpOxACYCl4dXEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="103886652"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Dec 2024 10:46:32 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP4Ug-0002PO-02;
	Sat, 21 Dec 2024 18:46:30 +0000
Date: Sun, 22 Dec 2024 02:45:56 +0800
From: kernel test robot <lkp@intel.com>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Pavel <pavel@ucw.cz>
Subject: drivers/leds/leds-lm3692x.c:121: warning: Function parameter or
 struct member 'brightness_ctrl' not described in 'lm3692x_led'
Message-ID: <202412220226.Dfmc2u0x-lkp@intel.com>
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
commit: 260718b3a35d23fe89d27cc7b5e8bd30f4bba1aa leds: lm3692x: Disable chip on brightness 0
date:   5 years ago
config: s390-randconfig-002-20241220 (https://download.01.org/0day-ci/archive/20241222/202412220226.Dfmc2u0x-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220226.Dfmc2u0x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220226.Dfmc2u0x-lkp@intel.com/

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
