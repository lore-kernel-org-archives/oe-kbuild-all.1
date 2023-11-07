Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF86A31
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 05:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KI9kI5zt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699334361; x=1730870361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oADdWft+c+fJAacTcqaU/BhGI3DMHOCU/vGv3xW4hlQ=;
  b=KI9kI5ztNl4ZZFotugXoWSo1OclmpEfw2o4EnRda5eIQmTEJyeBOgUGX
   +/ifmm6h9bYjFUYU1TymFXdBcyLQ8+y407tlT9CiTggT09PmjsRS/RkLL
   Kvsal5BeeOkJ2+YEmbFKcASX3/TsY63ZlS+qxDSRTVC3zsUGEemzKbpVS
   mO3a7bNmtHEVWVeQFeNHJ62X5HYVhoBxRC6y4iPX0fpk+8dUaNToeW5dQ
   QhxHdG1SbkCHzWhFCd5rsV2ktf0kSxQT+IEcVRFNvNfz166y3w6B/qg+U
   JuqxJOCutGiZA1VaBbPjycmhAFQ7sbAd1rDenbsRapqQX0GGvzJ0zkDam
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="2356415"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="2356415"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 21:19:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="3691354"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Nov 2023 21:19:18 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0EUd-0006wW-1l;
	Tue, 07 Nov 2023 05:19:15 +0000
Date: Tue, 7 Nov 2023 13:18:21 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: drivers/pinctrl/cirrus/pinctrl-lochnagar.c:52:53: error: pasting
 "LOCHNAGAR1_" and "(" does not give a valid preprocessing token
Message-ID: <202311071303.JJMAOjy4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   be3ca57cfb777ad820c6659d52e60bbdd36bf5ff
commit: 0548448b719ac78fa18fdbcd03856952ba6cc7dc pinctrl: lochnagar: Add support for the Cirrus Logic Lochnagar
date:   4 years, 7 months ago
config: mips-buildonly-randconfig-r006-20220821 (https://download.01.org/0day-ci/archive/20231107/202311071303.JJMAOjy4-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231107/202311071303.JJMAOjy4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311071303.JJMAOjy4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/cirrus/pinctrl-lochnagar.c:52:53: error: pasting "LOCHNAGAR1_" and "(" does not give a valid preprocessing token
      52 |         .name = NAME, .type = LN_PTYPE_GPIO, .reg = LOCHNAGAR##REV##_##REG, \
         |                                                     ^~~~~~~~~
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:67:9: note: in expansion of macro 'LN_PIN_GPIO'
      67 |         LN_PIN_GPIO(1, ID, NAME, REG, SHIFT, INVERT)
         |         ^~~~~~~~~~~
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:200:1: note: in expansion of macro 'LN1_PIN_GPIO'
     200 | LN1_PIN_GPIO(CDC_RESET,    "codec-reset",    RST,      CDC_RESET,    1);
         | ^~~~~~~~~~~~
>> drivers/pinctrl/cirrus/pinctrl-lochnagar.c:52:53: error: implicit declaration of function 'LOCHNAGAR1_'; did you mean 'LOCHNAGAR1_RST'? [-Werror=implicit-function-declaration]
      52 |         .name = NAME, .type = LN_PTYPE_GPIO, .reg = LOCHNAGAR##REV##_##REG, \
         |                                                     ^~~~~~~~~
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:67:9: note: in expansion of macro 'LN_PIN_GPIO'
      67 |         LN_PIN_GPIO(1, ID, NAME, REG, SHIFT, INVERT)
         |         ^~~~~~~~~~~
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:200:1: note: in expansion of macro 'LN1_PIN_GPIO'
     200 | LN1_PIN_GPIO(CDC_RESET,    "codec-reset",    RST,      CDC_RESET,    1);
         | ^~~~~~~~~~~~
>> drivers/pinctrl/cirrus/pinctrl-lochnagar.c:52:53: error: initializer element is not constant
      52 |         .name = NAME, .type = LN_PTYPE_GPIO, .reg = LOCHNAGAR##REV##_##REG, \
         |                                                     ^~~~~~~~~
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:67:9: note: in expansion of macro 'LN_PIN_GPIO'
      67 |         LN_PIN_GPIO(1, ID, NAME, REG, SHIFT, INVERT)
         |         ^~~~~~~~~~~
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:200:1: note: in expansion of macro 'LN1_PIN_GPIO'
     200 | LN1_PIN_GPIO(CDC_RESET,    "codec-reset",    RST,      CDC_RESET,    1);
         | ^~~~~~~~~~~~
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:52:53: note: (near initialization for 'lochnagar1_CDC_RESET_pin.reg')
      52 |         .name = NAME, .type = LN_PTYPE_GPIO, .reg = LOCHNAGAR##REV##_##REG, \
         |                                                     ^~~~~~~~~
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:67:9: note: in expansion of macro 'LN_PIN_GPIO'
      67 |         LN_PIN_GPIO(1, ID, NAME, REG, SHIFT, INVERT)
         |         ^~~~~~~~~~~
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:200:1: note: in expansion of macro 'LN1_PIN_GPIO'
     200 | LN1_PIN_GPIO(CDC_RESET,    "codec-reset",    RST,      CDC_RESET,    1);
         | ^~~~~~~~~~~~
>> drivers/pinctrl/cirrus/pinctrl-lochnagar.c:52:53: error: pasting "LOCHNAGAR1_" and "(" does not give a valid preprocessing token
      52 |         .name = NAME, .type = LN_PTYPE_GPIO, .reg = LOCHNAGAR##REV##_##REG, \
         |                                                     ^~~~~~~~~
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:67:9: note: in expansion of macro 'LN_PIN_GPIO'
      67 |         LN_PIN_GPIO(1, ID, NAME, REG, SHIFT, INVERT)
         |         ^~~~~~~~~~~
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:201:1: note: in expansion of macro 'LN1_PIN_GPIO'
     201 | LN1_PIN_GPIO(DSP_RESET,    "dsp-reset",      RST,      DSP_RESET,    1);
         | ^~~~~~~~~~~~
>> drivers/pinctrl/cirrus/pinctrl-lochnagar.c:52:53: error: initializer element is not constant
      52 |         .name = NAME, .type = LN_PTYPE_GPIO, .reg = LOCHNAGAR##REV##_##REG, \
         |                                                     ^~~~~~~~~
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:67:9: note: in expansion of macro 'LN_PIN_GPIO'
      67 |         LN_PIN_GPIO(1, ID, NAME, REG, SHIFT, INVERT)
         |         ^~~~~~~~~~~
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:201:1: note: in expansion of macro 'LN1_PIN_GPIO'
     201 | LN1_PIN_GPIO(DSP_RESET,    "dsp-reset",      RST,      DSP_RESET,    1);
         | ^~~~~~~~~~~~
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:52:53: note: (near initialization for 'lochnagar1_DSP_RESET_pin.reg')
      52 |         .name = NAME, .type = LN_PTYPE_GPIO, .reg = LOCHNAGAR##REV##_##REG, \
         |                                                     ^~~~~~~~~
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:67:9: note: in expansion of macro 'LN_PIN_GPIO'
      67 |         LN_PIN_GPIO(1, ID, NAME, REG, SHIFT, INVERT)
         |         ^~~~~~~~~~~
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:201:1: note: in expansion of macro 'LN1_PIN_GPIO'
     201 | LN1_PIN_GPIO(DSP_RESET,    "dsp-reset",      RST,      DSP_RESET,    1);
         | ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +52 drivers/pinctrl/cirrus/pinctrl-lochnagar.c

    49	
    50	#define LN_PIN_GPIO(REV, ID, NAME, REG, SHIFT, INVERT) \
    51	static const struct lochnagar_pin lochnagar##REV##_##ID##_pin = { \
  > 52		.name = NAME, .type = LN_PTYPE_GPIO, .reg = LOCHNAGAR##REV##_##REG, \
    53		.shift = LOCHNAGAR##REV##_##SHIFT##_SHIFT, .invert = INVERT, \
    54	}
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
