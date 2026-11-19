Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795049692;
	b=5bFyUxEtgLl1IY0kBywz4SUYj7jEO6UdOWfeG190dABZhQURHNW0jd8dBes73CtjFbG8
	 f7Zd75+w55MnJH6c/ezFpqVT20c1FHD95UejaonUdcllzyqljqfV6u6lbSPQg5vQNKEcN
	 +CqmX4AfyanOpKmIf9ANfrqSo/vdmSxCoILGRY4z1i3r/3FEBRDjloqS22eHO8e+i0j84
	 Fn8HFO3cBYNb0H8cEFKOq8GbaTi0r4lc8+2rNVnu292NAT7wbhJ6yns4IfaQGYuFWbWyM
	 N11jpwwHl4l8hyW+cX1WLgGVI4ZNwNMCuzZZUUvP7yXGkHxClM4TE6d1nFWwk6T/p3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795049692;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=CfjJelpWEALiwd+SioXH2RodsFB9qvuactp+axrsWUA=;
	b=UgLFmc39G1wPQi1XlDcZxevbG1d2SSxbeu0q4sm8JxMIJRZ3PnpH7BOCINXmCOEMMJu6
	 o1LHUQwx9PYRiZxaR/LZ0XZK4Wsq3j/BAqsOr5bHbA6t/IT8d1YwS/l5j8MhZ0WFeGONZ
	 A4jWhM4hwfCgjjrqiWudr/KgI8Rs57xK9jLOKjYkXBX/Q2rHdE9w6JksiL5dr/p5mWnW6
	 OkDiNWdRA1Ta0wY3g5t1tmfBiraDHnYWo/kTvGs1IbEp87dR8Oc2FE/eTtSZpdHYY1+iG
	 JgPNAFZM35poWp0Jvko1nd2mG0CihVqFe1uVqahItNAxyyMXK14rKr8Hr7TjUgPHQXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kl5Dr9KK;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC72606A320
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 00:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FC72606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kl5Dr9KK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795049692; x=1826585692;
  h=date:from:to:cc:subject:message-id;
  bh=gP8OxqIjBhhMJa/zSwzmEO70qnSlzMUcq9WQxjSW9LA=;
  b=kl5Dr9KKT0+M78M8mnh+fl+/66zwmCSrA3veDxbW1mSyFFqvR8CG+WTO
   W7Jj/WfNj4PggVUkRL+syn/wsdcx4xrZQ2xmlQR3lPRLrZaW/PBfVf/Gp
   83zCnbj062OjLgLpkj5FCZjmN8YxtHUtm10BvV98wb3DsfZEKyVtbr5Zw
   UM8O4tiKVnPadsCYUwRxZIc7CoONxfoAAnsJJQQd6dJ8t8K/IPePSgedk
   4XXaH1KhhsK+I0SFZ1TR2jO12cFq54jj4ZCmKRLMd+18VAV+zz8Auj9O6
   s7rIjInSw5KtHcpu2dB3JzNX5RrKtbGOK/bxztctjVcqiQLLpJWPuh/WA
   Q==;
X-CSE-ConnectionGUID: +tBiaOsiR8yKYGEtDx7cwg==
X-CSE-MsgGUID: 3yWBB02+RT2e4sYsxkbU4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3987802"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3987802"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 16:54:52 -0800
X-CSE-ConnectionGUID: 7kxQQL5PTAKm7iEGDRXiVQ==
X-CSE-MsgGUID: RY1mYTejRGCiWDae807cQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10196461"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 18 Nov 2026 16:54:50 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTqQK-000000003Yb-1WKz;
	Thu, 19 Nov 2026 00:54:48 +0000
Date: Thu, 19 Nov 2026 01:54:46 +0100
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 272/460]
 sound/soc/codecs/cs35l56-shared.c:515:27: error: implicit declaration of
 function 'to_spi_device'; did you mean 'to_rtc_device'?
Message-ID: <20261119015135.HKvs0tsR-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/bvanassche/linux thread-safety
head:   754c0efaaee1c85b67fd7f8a45f7be89900b661f
commit: b92d6bdb8a97a9e35c1baf80d282833e714e75de [272/460] spi: Convert to_spi_device() into an inline function
config: nios2-randconfig-2200-20261118 (https://download.01.org/0day-ci/archive/20261119/20261119015135.HKvs0tsR-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119015135.HKvs0tsR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119015135.HKvs0tsR-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from sound/soc/codecs/cs35l56-shared.c:20:
   include/linux/spi/spi.h:284:1: error: attributes should be specified before the declarator in a function definition
    static inline struct spi_device *to_spi_device(struct device *dev)
    ^~~~~~
   include/linux/spi/spi.h:290:1: error: attributes should be specified before the declarator in a function definition
    static inline struct spi_device *to_spi_device(void *dev)
    ^~~~~~
   include/linux/spi/spi.h:296:1: error: attributes should be specified before the declarator in a function definition
    static inline const struct spi_device *to_spi_device(const struct device *dev)
    ^~~~~~
   sound/soc/codecs/cs35l56-shared.c: In function 'cs35l56_spi_system_reset':
>> sound/soc/codecs/cs35l56-shared.c:515:27: error: implicit declaration of function 'to_spi_device'; did you mean 'to_rtc_device'? [-Werror=implicit-function-declaration]
     struct spi_device *spi = to_spi_device(cs35l56_base->dev);
                              ^~~~~~~~~~~~~
                              to_rtc_device
>> sound/soc/codecs/cs35l56-shared.c:515:27: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors


vim +515 sound/soc/codecs/cs35l56-shared.c

769c1b79295c38 Richard Fitzgerald 2025-02-25  512  
769c1b79295c38 Richard Fitzgerald 2025-02-25  513  static void cs35l56_spi_system_reset(struct cs35l56_base *cs35l56_base)
769c1b79295c38 Richard Fitzgerald 2025-02-25  514  {
769c1b79295c38 Richard Fitzgerald 2025-02-25 @515  	struct spi_device *spi = to_spi_device(cs35l56_base->dev);
769c1b79295c38 Richard Fitzgerald 2025-02-25  516  	unsigned int val;
769c1b79295c38 Richard Fitzgerald 2025-02-25  517  	int read_ret, ret;
769c1b79295c38 Richard Fitzgerald 2025-02-25  518  
769c1b79295c38 Richard Fitzgerald 2025-02-25  519  	/*
769c1b79295c38 Richard Fitzgerald 2025-02-25  520  	 * There must not be any other SPI bus activity while the amp is
769c1b79295c38 Richard Fitzgerald 2025-02-25  521  	 * soft-resetting.
769c1b79295c38 Richard Fitzgerald 2025-02-25  522  	 */
f7a7818d7c687b Bart Van Assche    2026-11-02  523  	spi_bus_lock(spi->controller);
769c1b79295c38 Richard Fitzgerald 2025-02-25  524  
769c1b79295c38 Richard Fitzgerald 2025-02-25  525  	cs35l56_spi_issue_bus_locked_reset(cs35l56_base, spi);
769c1b79295c38 Richard Fitzgerald 2025-02-25  526  	spi_bus_unlock(spi->controller);
769c1b79295c38 Richard Fitzgerald 2025-02-25  527  
769c1b79295c38 Richard Fitzgerald 2025-02-25  528  	/*
769c1b79295c38 Richard Fitzgerald 2025-02-25  529  	 * Check firmware boot by testing for a response in MBOX_2.
769c1b79295c38 Richard Fitzgerald 2025-02-25  530  	 * HALO_STATE cannot be trusted yet because the reset sequence
769c1b79295c38 Richard Fitzgerald 2025-02-25  531  	 * can leave it with stale state. But MBOX is reset.
769c1b79295c38 Richard Fitzgerald 2025-02-25  532  	 * The regmap must remain in cache-only until the chip has
769c1b79295c38 Richard Fitzgerald 2025-02-25  533  	 * booted, so use a bypassed read.
769c1b79295c38 Richard Fitzgerald 2025-02-25  534  	 */
007699d278a655 Richard Fitzgerald 2026-06-11  535  	val = 0;
769c1b79295c38 Richard Fitzgerald 2025-02-25  536  	ret = read_poll_timeout(regmap_read_bypassed, read_ret,
769c1b79295c38 Richard Fitzgerald 2025-02-25  537  				(val > 0) && (val < 0xffffffff),
769c1b79295c38 Richard Fitzgerald 2025-02-25  538  				CS35L56_HALO_STATE_POLL_US,
769c1b79295c38 Richard Fitzgerald 2025-02-25  539  				CS35L56_HALO_STATE_TIMEOUT_US,
769c1b79295c38 Richard Fitzgerald 2025-02-25  540  				false,
769c1b79295c38 Richard Fitzgerald 2025-02-25  541  				cs35l56_base->regmap,
769c1b79295c38 Richard Fitzgerald 2025-02-25  542  				CS35L56_DSP_VIRTUAL1_MBOX_2,
769c1b79295c38 Richard Fitzgerald 2025-02-25  543  				&val);
769c1b79295c38 Richard Fitzgerald 2025-02-25  544  	if (ret) {
769c1b79295c38 Richard Fitzgerald 2025-02-25  545  		dev_err(cs35l56_base->dev, "SPI reboot timed out(%d): MBOX2=%#x\n",
769c1b79295c38 Richard Fitzgerald 2025-02-25  546  			read_ret, val);
769c1b79295c38 Richard Fitzgerald 2025-02-25  547  	}
769c1b79295c38 Richard Fitzgerald 2025-02-25  548  }
769c1b79295c38 Richard Fitzgerald 2025-02-25  549  

:::::: The code at line 515 was first introduced by commit
:::::: 769c1b79295c38d60fde4c0a8f5f31e01360c54f ASoC: cs35l56: Prevent races when soft-resetting using SPI control

:::::: TO: Richard Fitzgerald <rf@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
