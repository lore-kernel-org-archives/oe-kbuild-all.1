Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01A41DFC9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 23:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USDGfNqs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702943259; x=1734479259;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XoZx2Lkh8vxMTvHH87zeZ1YiOpLAmC24tPqOBq4QJt0=;
  b=USDGfNqsJPk27A7KepzUwDhCj7M8zWy8rrzzybzgfq1TQ7vKYtuK1HHc
   N6TrKQ2YyXEwUnYJ2g/8hVnRbhD/ZIqA4FVuNu9g0Gom7QHnjcHvraiNh
   nHHJC4tLagknEOo51CBWDZvl25rHA0ZA2OiSjHR4AcTM69myUFynYjWOS
   rsJcxKVBC81kQJIFj/hP4/f+F493kJ3u/KYvI7B81Ap+ZMDsLoD427bDl
   aob9J7DnCK+jSpPeXzSed6xKdEILlH9VU7WuAUUjGFz8smBr6gsyYOny1
   ge5eel3ZjdiGZ7WqpfrBxgq5yDPQInGJJr9TzujUroANQKnwiFH2aedMm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="2675987"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="2675987"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 15:47:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="846127261"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="846127261"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 18 Dec 2023 15:47:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFNKg-0004eP-1v;
	Mon, 18 Dec 2023 23:47:34 +0000
Date: Tue, 19 Dec 2023 07:47:33 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [linux-next:master 5497/9113] drivers/pwm/pwm-cros-ec.c:32: warning:
 Excess struct member 'dev' description in 'cros_ec_pwm_device'
Message-ID: <202312190757.O4M9dsln-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ceb2fe0d438644e1de06b9a6468a1fb8e2199c70
commit: ffb150737feec5fec221022cbb4ca62ca60092b5 [5497/9113] pwm: cros-ec: Drop unused member from driver private data
config: arm-randconfig-c003-20211105 (https://download.01.org/0day-ci/archive/20231219/202312190757.O4M9dsln-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312190757.O4M9dsln-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312190757.O4M9dsln-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pwm/pwm-cros-ec.c:32: warning: Excess struct member 'dev' description in 'cros_ec_pwm_device'


vim +32 drivers/pwm/pwm-cros-ec.c

3d593b6e80ad2c Fabio Baltieri   2022-04-28  17  
1f0d3bb02785f6 Brian Norris     2016-07-15  18  /**
1f0d3bb02785f6 Brian Norris     2016-07-15  19   * struct cros_ec_pwm_device - Driver data for EC PWM
1f0d3bb02785f6 Brian Norris     2016-07-15  20   *
1f0d3bb02785f6 Brian Norris     2016-07-15  21   * @dev: Device node
1f0d3bb02785f6 Brian Norris     2016-07-15  22   * @ec: Pointer to EC device
1f0d3bb02785f6 Brian Norris     2016-07-15  23   * @chip: PWM controller chip
3d593b6e80ad2c Fabio Baltieri   2022-04-28  24   * @use_pwm_type: Use PWM types instead of generic channels
82adc1b2688b02 Uwe Kleine-König 2023-07-05  25   * @channel: array with per-channel data
1f0d3bb02785f6 Brian Norris     2016-07-15  26   */
1f0d3bb02785f6 Brian Norris     2016-07-15  27  struct cros_ec_pwm_device {
1f0d3bb02785f6 Brian Norris     2016-07-15  28  	struct cros_ec_device *ec;
1f0d3bb02785f6 Brian Norris     2016-07-15  29  	struct pwm_chip chip;
3d593b6e80ad2c Fabio Baltieri   2022-04-28  30  	bool use_pwm_type;
82adc1b2688b02 Uwe Kleine-König 2023-07-05  31  	struct cros_ec_pwm *channel;
1f0d3bb02785f6 Brian Norris     2016-07-15 @32  };
1f0d3bb02785f6 Brian Norris     2016-07-15  33  

:::::: The code at line 32 was first introduced by commit
:::::: 1f0d3bb02785f698dc273b9006a473194c32f874 pwm: Add ChromeOS EC PWM driver

:::::: TO: Brian Norris <briannorris@chromium.org>
:::::: CC: Thierry Reding <thierry.reding@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
