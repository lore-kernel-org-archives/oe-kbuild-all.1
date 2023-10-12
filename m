Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C32B134CB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 20:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9ok1et6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697143349; x=1728679349;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GyslXrM6Dvsb0KYL0SNALa215blUsPll26fD93mja/s=;
  b=k9ok1et6iXH7uUqfXfAstNrZ/a3JTOKbBPjOPDATAJZl6nDwsxxUaEZU
   FrFQdOrhhs54shsyCBYHx5u2PAjjwQb/m/wBSDislN2UGytGWvaXHlpPJ
   D5H5a8AA3MIQDrwEJ8xj3MCTzT2AL1w+ne8RvVkHvJzib/Jhx9vKjqgQn
   ome65nOkBnuxztPxKvamt+d8SIdDXXdx0Im6yLouwITOwSHtl31kAV2zl
   1UNH1lj3FXogggr0ZProkOBwV/Ke7ot1oYdY+uZv+lsI6vfwrXSbfQQHD
   C5DGQtmazJcTam/OQvZcDshOjUtKeFwrfgsyGC27StHe8ruG8igSb9FSG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375385860"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="375385860"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 13:42:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="824755409"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="824755409"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 12 Oct 2023 13:42:05 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr2VP-0003rb-2J;
	Thu, 12 Oct 2023 20:42:03 +0000
Date: Fri, 13 Oct 2023 04:41:30 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-pwm@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>
Subject: [thierry-reding-pwm:for-next 10/36] drivers/pwm/pwm-samsung.c:92:
 warning: Function parameter or member 'channel' not described in
 'samsung_pwm_chip'
Message-ID: <202310130404.uQ33q5Dk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm.git for-next
head:   b02229080a8e98c8f944ab1ce0d5df0f2a0e3644
commit: 4c9548d24c0d4034f056e2c9f0e72599a382a846 [10/36] pwm: samsung: Put per-channel data into driver data
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231013/202310130404.uQ33q5Dk-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310130404.uQ33q5Dk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130404.uQ33q5Dk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pwm/pwm-samsung.c:92: warning: Function parameter or member 'channel' not described in 'samsung_pwm_chip'


vim +92 drivers/pwm/pwm-samsung.c

11ad39ede24ee4 Tomasz Figa               2013-04-06  69  
11ad39ede24ee4 Tomasz Figa               2013-04-06  70  /**
11ad39ede24ee4 Tomasz Figa               2013-04-06  71   * struct samsung_pwm_chip - private data of PWM chip
11ad39ede24ee4 Tomasz Figa               2013-04-06  72   * @chip:		generic PWM chip
11ad39ede24ee4 Tomasz Figa               2013-04-06  73   * @variant:		local copy of hardware variant data
11ad39ede24ee4 Tomasz Figa               2013-04-06  74   * @inverter_mask:	inverter status for all channels - one bit per channel
08a4d8ec4262c6 Bartlomiej Zolnierkiewicz 2017-04-24  75   * @disabled_mask:	disabled status for all channels - one bit per channel
11ad39ede24ee4 Tomasz Figa               2013-04-06  76   * @base:		base address of mapped PWM registers
11ad39ede24ee4 Tomasz Figa               2013-04-06  77   * @base_clk:		base clock used to drive the timers
11ad39ede24ee4 Tomasz Figa               2013-04-06  78   * @tclk0:		external clock 0 (can be ERR_PTR if not present)
11ad39ede24ee4 Tomasz Figa               2013-04-06  79   * @tclk1:		external clock 1 (can be ERR_PTR if not present)
11ad39ede24ee4 Tomasz Figa               2013-04-06  80   */
11ad39ede24ee4 Tomasz Figa               2013-04-06  81  struct samsung_pwm_chip {
11ad39ede24ee4 Tomasz Figa               2013-04-06  82  	struct pwm_chip chip;
11ad39ede24ee4 Tomasz Figa               2013-04-06  83  	struct samsung_pwm_variant variant;
11ad39ede24ee4 Tomasz Figa               2013-04-06  84  	u8 inverter_mask;
08a4d8ec4262c6 Bartlomiej Zolnierkiewicz 2017-04-24  85  	u8 disabled_mask;
11ad39ede24ee4 Tomasz Figa               2013-04-06  86  
11ad39ede24ee4 Tomasz Figa               2013-04-06  87  	void __iomem *base;
11ad39ede24ee4 Tomasz Figa               2013-04-06  88  	struct clk *base_clk;
11ad39ede24ee4 Tomasz Figa               2013-04-06  89  	struct clk *tclk0;
11ad39ede24ee4 Tomasz Figa               2013-04-06  90  	struct clk *tclk1;
4c9548d24c0d40 Uwe Kleine-König          2023-07-05  91  	struct samsung_pwm_channel channel[SAMSUNG_PWM_NUM];
11ad39ede24ee4 Tomasz Figa               2013-04-06 @92  };
11ad39ede24ee4 Tomasz Figa               2013-04-06  93  

:::::: The code at line 92 was first introduced by commit
:::::: 11ad39ede24ee42909d58dc95031d96da46e33bd pwm: Add new pwm-samsung driver

:::::: TO: Tomasz Figa <tomasz.figa@gmail.com>
:::::: CC: Tomasz Figa <tomasz.figa@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
