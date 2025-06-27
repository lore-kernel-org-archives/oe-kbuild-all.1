Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2894329B218
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 11:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751023864; cv=none; b=d6IUsShRXkNYrmHbcbzNZ3ntyi7+efSlNMoWpdXqNJbnQDl01XPUZR7r8UgAHhSAUQg075ZHYSbKkAgIniAqbNgniclTa106RHBxvJJeUOkUE/xh42Q4FZXV5Al+++2uOIPnqN7O/2h77npWv9OaCcm1z0wIQh4r6OiLpcG7gEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751023864; c=relaxed/simple;
	bh=i1WbDhB1+wY70SwMZLSulc6VyTG6n01VXfNaeicTBPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z2SwEIJsvvjE1imlG55/4hKEq1SNYDTjOzKjOL6TjZM0+CGRqytPv/W+rbzVxpRnztKWLJn2c3OJBCUgfa/pIZkBW4HR0kVCuSuGtpwuwonvv/45b3ooEmuahjtS+aTOGQe8moQPW2/raC4VT2q/6tV0MwI97DXIaRKGipWj5Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fD6gJ4Lr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fD6gJ4Lr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751023864; x=1782559864;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i1WbDhB1+wY70SwMZLSulc6VyTG6n01VXfNaeicTBPY=;
  b=fD6gJ4LrGo3DsYGG8wDGWa77Nzb3m8LCdlPt0YySW4rLc5w5nlUEjKHe
   M8eJXYDO3j2mQivOQT+1qgfo9ot6fiW3OUmteIWVV/0T7dnvgWHmxxGlO
   Tr09poKVbrKMGqmwqmhUZtuSIfDBF3spyM+RW9fY60Pusan2ZLBtbArOP
   roASk08L/uEvDEQbXtkSc3PdpeXRmrVYyivGtGKw3KpWeiGqoDDte3fx6
   k928q5XOT5xh1O/CC5sKBTfLffh9NPigULP/KwTh7yvFgmksiXHrZ2F5Y
   U8HHhhtCR73MqyUloivub7+n4/rFtmcfm9kSyJTfPuzSmERU5K90eLSNY
   A==;
X-CSE-ConnectionGUID: BmSmvgcDSp+yGGdOFzJDmQ==
X-CSE-MsgGUID: oubXMrGfQLWbg58h6xZI1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64393206"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="64393206"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 04:31:01 -0700
X-CSE-ConnectionGUID: KEnKKXs5TQOO1SoZnre3aQ==
X-CSE-MsgGUID: no3RA6baSOy1fFNI2uioOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="153309827"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jun 2025 04:30:53 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV7IA-000W7m-0O;
	Fri, 27 Jun 2025 11:30:50 +0000
Date: Fri, 27 Jun 2025 19:30:25 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v1 1/1] mfd: syscon: atmel-smc: Don't use "proxy" headers
Message-ID: <202506271909.O9FuRVos-lkp@intel.com>
References: <20250626155435.325336-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626155435.325336-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-mfd/for-mfd-fixes soc/for-next lee-leds/for-leds-next linus/master v6.16-rc3 next-20250626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/mfd-syscon-atmel-smc-Don-t-use-proxy-headers/20250626-235519
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20250626155435.325336-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/1] mfd: syscon: atmel-smc: Don't use "proxy" headers
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250627/202506271909.O9FuRVos-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271909.O9FuRVos-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271909.O9FuRVos-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/atmel-smc.c:24:1: warning: data definition has no type or storage class
      24 | EXPORT_SYMBOL_GPL(atmel_smc_cs_conf_init);
         | ^~~~~~~~~~~~~~~~~
   drivers/mfd/atmel-smc.c:24:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
   drivers/mfd/atmel-smc.c:24:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/mfd/atmel-smc.c:118:1: warning: data definition has no type or storage class
     118 | EXPORT_SYMBOL_GPL(atmel_smc_cs_conf_set_timing);
         | ^~~~~~~~~~~~~~~~~
   drivers/mfd/atmel-smc.c:118:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
   drivers/mfd/atmel-smc.c:118:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/mfd/atmel-smc.c:157:1: warning: data definition has no type or storage class
     157 | EXPORT_SYMBOL_GPL(atmel_smc_cs_conf_set_setup);
         | ^~~~~~~~~~~~~~~~~
   drivers/mfd/atmel-smc.c:157:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
   drivers/mfd/atmel-smc.c:157:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/mfd/atmel-smc.c:196:1: warning: data definition has no type or storage class
     196 | EXPORT_SYMBOL_GPL(atmel_smc_cs_conf_set_pulse);
         | ^~~~~~~~~~~~~~~~~
   drivers/mfd/atmel-smc.c:196:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
   drivers/mfd/atmel-smc.c:196:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/mfd/atmel-smc.c:234:1: warning: data definition has no type or storage class
     234 | EXPORT_SYMBOL_GPL(atmel_smc_cs_conf_set_cycle);
         | ^~~~~~~~~~~~~~~~~
   drivers/mfd/atmel-smc.c:234:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
   drivers/mfd/atmel-smc.c:234:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/mfd/atmel-smc.c: In function 'atmel_smc_cs_conf_apply':
   drivers/mfd/atmel-smc.c:248:9: error: implicit declaration of function 'regmap_write' [-Wimplicit-function-declaration]
     248 |         regmap_write(regmap, ATMEL_SMC_SETUP(cs), conf->setup);
         |         ^~~~~~~~~~~~
   drivers/mfd/atmel-smc.c: At top level:
   drivers/mfd/atmel-smc.c:253:1: warning: data definition has no type or storage class
     253 | EXPORT_SYMBOL_GPL(atmel_smc_cs_conf_apply);
         | ^~~~~~~~~~~~~~~~~
   drivers/mfd/atmel-smc.c:253:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
   drivers/mfd/atmel-smc.c:253:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/mfd/atmel-smc.c:275:1: warning: data definition has no type or storage class
     275 | EXPORT_SYMBOL_GPL(atmel_hsmc_cs_conf_apply);
         | ^~~~~~~~~~~~~~~~~
   drivers/mfd/atmel-smc.c:275:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
   drivers/mfd/atmel-smc.c:275:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/mfd/atmel-smc.c: In function 'atmel_smc_cs_conf_get':
   drivers/mfd/atmel-smc.c:289:9: error: implicit declaration of function 'regmap_read' [-Wimplicit-function-declaration]
     289 |         regmap_read(regmap, ATMEL_SMC_SETUP(cs), &conf->setup);
         |         ^~~~~~~~~~~
   drivers/mfd/atmel-smc.c: At top level:
   drivers/mfd/atmel-smc.c:294:1: warning: data definition has no type or storage class
     294 | EXPORT_SYMBOL_GPL(atmel_smc_cs_conf_get);
         | ^~~~~~~~~~~~~~~~~
   drivers/mfd/atmel-smc.c:294:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
   drivers/mfd/atmel-smc.c:294:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/mfd/atmel-smc.c:316:1: warning: data definition has no type or storage class
     316 | EXPORT_SYMBOL_GPL(atmel_hsmc_cs_conf_get);
         | ^~~~~~~~~~~~~~~~~
   drivers/mfd/atmel-smc.c:316:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
   drivers/mfd/atmel-smc.c:316:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/mfd/atmel-smc.c:326:34: error: array type has incomplete element type 'struct of_device_id'
     326 | static const struct of_device_id atmel_smc_ids[] __maybe_unused = {
         |                                  ^~~~~~~~~~~~~
   drivers/mfd/atmel-smc.c: In function 'atmel_hsmc_get_reg_layout':
   drivers/mfd/atmel-smc.c:347:17: error: implicit declaration of function 'of_match_node' [-Wimplicit-function-declaration]
     347 |         match = of_match_node(atmel_smc_ids, np);
         |                 ^~~~~~~~~~~~~
   drivers/mfd/atmel-smc.c:349:29: error: invalid use of undefined type 'const struct of_device_id'
     349 |         return match ? match->data : ERR_PTR(-EINVAL);
         |                             ^~
   drivers/mfd/atmel-smc.c: At top level:
   drivers/mfd/atmel-smc.c:351:1: warning: data definition has no type or storage class
     351 | EXPORT_SYMBOL_GPL(atmel_hsmc_get_reg_layout);
         | ^~~~~~~~~~~~~~~~~
   drivers/mfd/atmel-smc.c:351:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
   drivers/mfd/atmel-smc.c:351:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/mfd/atmel-smc.c:326:34: warning: 'atmel_smc_ids' defined but not used [-Wunused-variable]
     326 | static const struct of_device_id atmel_smc_ids[] __maybe_unused = {
         |                                  ^~~~~~~~~~~~~


vim +24 drivers/mfd/atmel-smc.c

fe9d7cb22ef3a2 Boris Brezillon 2017-03-16  13  
fe9d7cb22ef3a2 Boris Brezillon 2017-03-16  14  /**
fe9d7cb22ef3a2 Boris Brezillon 2017-03-16  15   * atmel_smc_cs_conf_init - initialize a SMC CS conf
fe9d7cb22ef3a2 Boris Brezillon 2017-03-16  16   * @conf: the SMC CS conf to initialize
fe9d7cb22ef3a2 Boris Brezillon 2017-03-16  17   *
fe9d7cb22ef3a2 Boris Brezillon 2017-03-16  18   * Set all fields to 0 so that one can start defining a new config.
fe9d7cb22ef3a2 Boris Brezillon 2017-03-16  19   */
fe9d7cb22ef3a2 Boris Brezillon 2017-03-16  20  void atmel_smc_cs_conf_init(struct atmel_smc_cs_conf *conf)
fe9d7cb22ef3a2 Boris Brezillon 2017-03-16  21  {
fe9d7cb22ef3a2 Boris Brezillon 2017-03-16  22  	memset(conf, 0, sizeof(*conf));
fe9d7cb22ef3a2 Boris Brezillon 2017-03-16  23  }
fe9d7cb22ef3a2 Boris Brezillon 2017-03-16 @24  EXPORT_SYMBOL_GPL(atmel_smc_cs_conf_init);
fe9d7cb22ef3a2 Boris Brezillon 2017-03-16  25  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
