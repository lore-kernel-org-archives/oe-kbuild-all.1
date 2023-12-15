Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A540318ED5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 23:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cM8ByoCM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702683632; x=1734219632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=44FJtxbX5C7L4WV9gh5M8a9vA4YqCTksm1Jvicb6dj4=;
  b=cM8ByoCMRYF0zWcXcOOLwM65tqfkUexSrL2inyCcjOGEGLIvs5C6iS34
   WO6wn7I1t6yR/K4DUMRiItTa/JS5OMXdotGxDXaUZADWCGcFMQTthOKjj
   nsPVTLSkPDpygmFdJ2hj3rSqUu0PNKKm1xDtvqAzT/Ig18NM9RHvdKIMp
   UwOLX22qeqhHEL52S4yEAX9o8saDIRR/g+Kde/+BuWhSaFoW9Ggxfso8a
   NpJCMBDcUA3Bqct3qr3zHCLVfgfcwG5UqevS9D/ppoqWK9DQw5JZUWtjE
   hw9FEygfljv723VeLdknwxUtNZUNAzx681lX3ZpFVIorSt6y7XX5gzhYe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="385759592"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="385759592"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 15:40:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="1106280748"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="1106280748"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Dec 2023 15:40:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEHn9-0000to-1v;
	Fri, 15 Dec 2023 23:40:27 +0000
Date: Sat, 16 Dec 2023 07:39:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: drivers/leds/leds-lm3697.c:93: warning: Excess struct member 'leds'
 description in 'lm3697'
Message-ID: <202312160738.1Uq3Ohq0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3bd7d748816927202268cb335921f7f68b3ca723
commit: bcbadbb29cb6aa6f51505514ae635fd467ebca43 leds: lm3697: Annotate struct lm3697 with __counted_by
date:   6 weeks ago
config: arm-randconfig-r081-20231214 (https://download.01.org/0day-ci/archive/20231216/202312160738.1Uq3Ohq0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231216/202312160738.1Uq3Ohq0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312160738.1Uq3Ohq0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/leds/leds-lm3697.c:93: warning: Excess struct member 'leds' description in 'lm3697'


vim +93 drivers/leds/leds-lm3697.c

5c1d824cda9f605 Dan Murphy    2019-05-06  68  
5c1d824cda9f605 Dan Murphy    2019-05-06  69  /**
5c1d824cda9f605 Dan Murphy    2019-05-06  70   * struct lm3697 -
5c1d824cda9f605 Dan Murphy    2019-05-06  71   * @enable_gpio: Hardware enable gpio
5c1d824cda9f605 Dan Murphy    2019-05-06  72   * @regulator: LED supply regulator pointer
5c1d824cda9f605 Dan Murphy    2019-05-06  73   * @client: Pointer to the I2C client
5c1d824cda9f605 Dan Murphy    2019-05-06  74   * @regmap: Devices register map
5c1d824cda9f605 Dan Murphy    2019-05-06  75   * @dev: Pointer to the devices device struct
5c1d824cda9f605 Dan Murphy    2019-05-06  76   * @lock: Lock for reading/writing the device
5c1d824cda9f605 Dan Murphy    2019-05-06  77   * @leds: Array of LED strings
6e174d3911f1580 Lee Jones     2021-05-28  78   * @bank_cfg: OUTPUT_CONFIG register values
6e174d3911f1580 Lee Jones     2021-05-28  79   * @num_banks: Number of control banks
5c1d824cda9f605 Dan Murphy    2019-05-06  80   */
5c1d824cda9f605 Dan Murphy    2019-05-06  81  struct lm3697 {
5c1d824cda9f605 Dan Murphy    2019-05-06  82  	struct gpio_desc *enable_gpio;
5c1d824cda9f605 Dan Murphy    2019-05-06  83  	struct regulator *regulator;
5c1d824cda9f605 Dan Murphy    2019-05-06  84  	struct i2c_client *client;
5c1d824cda9f605 Dan Murphy    2019-05-06  85  	struct regmap *regmap;
5c1d824cda9f605 Dan Murphy    2019-05-06  86  	struct device *dev;
5c1d824cda9f605 Dan Murphy    2019-05-06  87  	struct mutex lock;
5c1d824cda9f605 Dan Murphy    2019-05-06  88  
5c1d824cda9f605 Dan Murphy    2019-05-06  89  	int bank_cfg;
98d278ca00bd8f6 Gabriel David 2020-10-02  90  	int num_banks;
5c1d824cda9f605 Dan Murphy    2019-05-06  91  
bcbadbb29cb6aa6 Kees Cook     2023-09-15  92  	struct lm3697_led leds[] __counted_by(num_banks);
5c1d824cda9f605 Dan Murphy    2019-05-06 @93  };
5c1d824cda9f605 Dan Murphy    2019-05-06  94  

:::::: The code at line 93 was first introduced by commit
:::::: 5c1d824cda9f6059ee5fb6cc83cd4f47c85cf215 leds: lm3697: Introduce the lm3697 driver

:::::: TO: Dan Murphy <dmurphy@ti.com>
:::::: CC: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
