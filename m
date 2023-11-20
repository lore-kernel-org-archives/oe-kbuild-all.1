Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC0F1B270
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 13:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FxwaApRQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700488212; x=1732024212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d+ijcUcWXXOld7usszp1VM7WELcAe8t9UwAklvI7pbc=;
  b=FxwaApRQEzbaxKxeKWKamwOVOYo0rSUMc+vSSErctPqfIV32/z3fP9QM
   OsZQ6a/NiI1r5dsVEhK4mKWb4+Bii1EkEWejAIjF6iVEbuNEKCbrpjXPp
   ExyNTgKuKdHeHFqB7La3mZbZniDZCN/DcCqzUSi5xriWOhOkOTqHOrO6O
   cVrVv/a9MR5/EAqBlnr0j/x1aKPFD4+QcGz8zCJXsccy4ZC6pTYglZwiU
   yIR2ONDRwd0889NfITMCOBPfpMkwOqX0eBhOL2UC5yKRFbBR7EWbPo3g3
   LrQQ9jEI2e9ahrANPEyDokKTIJv7CIT4mlB7W3+nZA8mHidSoqeLQImVj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="391404277"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="391404277"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 05:49:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="14177084"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 20 Nov 2023 05:49:50 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r54ed-0006Ut-37;
	Mon, 20 Nov 2023 13:49:39 +0000
Date: Mon, 20 Nov 2023 21:48:55 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kabel:realtek-sfp-work 3/20]
 drivers/platform/cznic/turris-omnia-mcu-gpio.c:979:16: error: 'struct
 gpio_chip' has no member named 'of_gpio_n_cells'
Message-ID: <202311202156.KqcOXu6L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kabel/linux.git realtek-sfp-work
head:   a7931b1e7b8bdade3975606bc26446fdccc6a40e
commit: bc93471c3848c36cdb399897aaf6b7b835520880 [3/20] platform: cznic: turris-omnia-mcu: Add support for MCU connected GPIOs
config: parisc-randconfig-r112-20231120 (https://download.01.org/0day-ci/archive/20231120/202311202156.KqcOXu6L-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231120/202311202156.KqcOXu6L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311202156.KqcOXu6L-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/cznic/turris-omnia-mcu-gpio.c: In function 'omnia_mcu_register_gpiochip':
>> drivers/platform/cznic/turris-omnia-mcu-gpio.c:979:16: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
     979 |         mcu->gc.of_gpio_n_cells = 3;
         |                ^
>> drivers/platform/cznic/turris-omnia-mcu-gpio.c:980:16: error: 'struct gpio_chip' has no member named 'of_xlate'
     980 |         mcu->gc.of_xlate = omnia_gpio_xlate;
         |                ^


vim +979 drivers/platform/cznic/turris-omnia-mcu-gpio.c

   956	
   957	int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu)
   958	{
   959		bool new_api = mcu->features & FEAT_NEW_INT_API;
   960		struct device *dev = &mcu->client->dev;
   961		unsigned long irqflags;
   962		int err;
   963	
   964		mutex_init(&mcu->lock);
   965		err = devm_add_action_or_reset(dev, omnia_mcu_mutex_destroy,
   966					       &mcu->lock);
   967		if (err)
   968			return err;
   969	
   970		mcu->gc.request = omnia_gpio_request;
   971		mcu->gc.get_direction = omnia_gpio_get_direction;
   972		mcu->gc.direction_input = omnia_gpio_direction_input;
   973		mcu->gc.direction_output = omnia_gpio_direction_output;
   974		mcu->gc.get = omnia_gpio_get;
   975		mcu->gc.get_multiple = omnia_gpio_get_multiple;
   976		mcu->gc.set = omnia_gpio_set;
   977		mcu->gc.set_multiple = omnia_gpio_set_multiple;
   978		mcu->gc.init_valid_mask = omnia_gpio_init_valid_mask;
 > 979		mcu->gc.of_gpio_n_cells = 3;
 > 980		mcu->gc.of_xlate = omnia_gpio_xlate;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
