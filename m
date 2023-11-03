Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4B717D0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 05:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a4SQ6ZGM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698990459; x=1730526459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MKfnBiSPKBD9/IF9uOK0p2RwDRATySgwhmkr2BQB1Ss=;
  b=a4SQ6ZGML9UhivHzgm/tBwF1jL2ZmkW6C7PQCj0MSC/PvbMj/QHBnbUp
   0TDzUC9Df24UMumI9OWbpPoyjZ6A0f+s3Kc/GY8rg5EDdRAzKtThXsVb+
   hR1WBlP8EmnGN3WV9sOnVEswFFXosHrVEzo0lY4DlWtZJ2GzIYZetQmXS
   Va0pXHLYl1RFHoXTnkL0VO47RcNk44zdNVoAuifBmut4olJepDLu3LkZ1
   17zGdL6g3E4+h8KhVjtrWszXBG89EMw7/AnffcoRN5x2rB/VKHpe2/rZk
   o9hD7uXlhtAi63X3brm2ugvPkm/B9j54COjfD8ItuRkNW3ddkIG+pWIbO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="455373313"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="455373313"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 22:47:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="905237570"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="905237570"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 02 Nov 2023 22:47:37 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyn1r-0002GI-1x;
	Fri, 03 Nov 2023 05:47:35 +0000
Date: Fri, 3 Nov 2023 13:46:32 +0800
From: kernel test robot <lkp@intel.com>
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: drivers/pinctrl/pinctrl-cy8c95x0.c:168: warning: Function parameter
 or member 'gpio_reset' not described in 'cy8c95x0_pinctrl'
Message-ID: <202311031342.r4To3GaD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Patrick,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bc3012f4e3a9765de81f454cb8f9bb16aafc6ff5
commit: 99084881de88ffcd156b03aaeb7d4eb740005e3e pinctrl: cy8c95x0: Add reset support
date:   4 months ago
config: parisc-randconfig-001-20231102 (https://download.01.org/0day-ci/archive/20231103/202311031342.r4To3GaD-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311031342.r4To3GaD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311031342.r4To3GaD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-cy8c95x0.c:168: warning: Function parameter or member 'gpio_reset' not described in 'cy8c95x0_pinctrl'


vim +168 drivers/pinctrl/pinctrl-cy8c95x0.c

e6cbbe42944de9 Patrick Rudolph 2022-08-16  124  
e6cbbe42944de9 Patrick Rudolph 2022-08-16  125  /**
e6cbbe42944de9 Patrick Rudolph 2022-08-16  126   * struct cy8c95x0_pinctrl - driver data
e6cbbe42944de9 Patrick Rudolph 2022-08-16  127   * @regmap:         Device's regmap
e6cbbe42944de9 Patrick Rudolph 2022-08-16  128   * @irq_lock:       IRQ bus lock
e6cbbe42944de9 Patrick Rudolph 2022-08-16  129   * @i2c_lock:       Mutex for the device internal mux register
e6cbbe42944de9 Patrick Rudolph 2022-08-16  130   * @irq_mask:       I/O bits affected by interrupts
e6cbbe42944de9 Patrick Rudolph 2022-08-16  131   * @irq_trig_raise: I/O bits affected by raising voltage level
e6cbbe42944de9 Patrick Rudolph 2022-08-16  132   * @irq_trig_fall:  I/O bits affected by falling voltage level
e6cbbe42944de9 Patrick Rudolph 2022-08-16  133   * @irq_trig_low:   I/O bits affected by a low voltage level
e6cbbe42944de9 Patrick Rudolph 2022-08-16  134   * @irq_trig_high:  I/O bits affected by a high voltage level
e6cbbe42944de9 Patrick Rudolph 2022-08-16  135   * @push_pull:      I/O bits configured as push pull driver
e6cbbe42944de9 Patrick Rudolph 2022-08-16  136   * @shiftmask:      Mask used to compensate for Gport2 width
e6cbbe42944de9 Patrick Rudolph 2022-08-16  137   * @nport:          Number of Gports in this chip
e6cbbe42944de9 Patrick Rudolph 2022-08-16  138   * @gpio_chip:      gpiolib chip
e6cbbe42944de9 Patrick Rudolph 2022-08-16  139   * @driver_data:    private driver data
e6cbbe42944de9 Patrick Rudolph 2022-08-16  140   * @regulator:      Pointer to the regulator for the IC
e6cbbe42944de9 Patrick Rudolph 2022-08-16  141   * @dev:            struct device
e6cbbe42944de9 Patrick Rudolph 2022-08-16  142   * @pctldev:        pin controller device
e6cbbe42944de9 Patrick Rudolph 2022-08-16  143   * @pinctrl_desc:   pin controller description
e6cbbe42944de9 Patrick Rudolph 2022-08-16  144   * @name:           Chip controller name
e6cbbe42944de9 Patrick Rudolph 2022-08-16  145   * @tpin:           Total number of pins
e6cbbe42944de9 Patrick Rudolph 2022-08-16  146   */
e6cbbe42944de9 Patrick Rudolph 2022-08-16  147  struct cy8c95x0_pinctrl {
e6cbbe42944de9 Patrick Rudolph 2022-08-16  148  	struct regmap *regmap;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  149  	struct mutex irq_lock;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  150  	struct mutex i2c_lock;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  151  	DECLARE_BITMAP(irq_mask, MAX_LINE);
e6cbbe42944de9 Patrick Rudolph 2022-08-16  152  	DECLARE_BITMAP(irq_trig_raise, MAX_LINE);
e6cbbe42944de9 Patrick Rudolph 2022-08-16  153  	DECLARE_BITMAP(irq_trig_fall, MAX_LINE);
e6cbbe42944de9 Patrick Rudolph 2022-08-16  154  	DECLARE_BITMAP(irq_trig_low, MAX_LINE);
e6cbbe42944de9 Patrick Rudolph 2022-08-16  155  	DECLARE_BITMAP(irq_trig_high, MAX_LINE);
e6cbbe42944de9 Patrick Rudolph 2022-08-16  156  	DECLARE_BITMAP(push_pull, MAX_LINE);
e6cbbe42944de9 Patrick Rudolph 2022-08-16  157  	DECLARE_BITMAP(shiftmask, MAX_LINE);
e6cbbe42944de9 Patrick Rudolph 2022-08-16  158  	int nport;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  159  	struct gpio_chip gpio_chip;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  160  	unsigned long driver_data;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  161  	struct regulator *regulator;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  162  	struct device *dev;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  163  	struct pinctrl_dev *pctldev;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  164  	struct pinctrl_desc pinctrl_desc;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  165  	char name[32];
e6cbbe42944de9 Patrick Rudolph 2022-08-16  166  	unsigned int tpin;
99084881de88ff Patrick Rudolph 2023-07-14  167  	struct gpio_desc *gpio_reset;
e6cbbe42944de9 Patrick Rudolph 2022-08-16 @168  };
e6cbbe42944de9 Patrick Rudolph 2022-08-16  169  

:::::: The code at line 168 was first introduced by commit
:::::: e6cbbe42944de93ba4e0785b4f90d284b1d7cdf6 pinctrl: Add Cypress cy8c95x0 support

:::::: TO: Patrick Rudolph <patrick.rudolph@9elements.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
