Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26572BDC0B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jun 2026 00:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781656743; cv=none; b=bArC+SENr6oZ6Vezjs+RoBObGgO6/tn4ghTofdDs4uqr8A64sGTOVIM9yWB4/HpcU458eRTqU/LjHE6+/dV750xfEl/SorPW9FgtfcKdi+ppDN3q9+fsJafhl4yBVE8nkhUTgfY4YMprzqciijlG4HVMlVaqPcSbY7Aid6l8ngg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781656743; c=relaxed/simple;
	bh=5lZ+7rXo3hv6MLqvIJsRxBMdK8tcKZBfdFs6CCThLww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SRhFQQj5u9svEDr2IoZyb/wB6jDuclnWuMRPUTnnKAZ3zoNC0jkM5guagObCCkQaxrcEdo3zi7rr0v7NSW4zGrUjzXLPJ+fdEAPAX2otIZqLS/LpbPv7Q9sJ1op7DrmfEGWYcsnemAlR1yA7/a4pGaVG77hX6uunmr6u9dVzMG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JDUcjykW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JDUcjykW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781656742; x=1813192742;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5lZ+7rXo3hv6MLqvIJsRxBMdK8tcKZBfdFs6CCThLww=;
  b=JDUcjykWlI2l5s3v95v6sdBNpa1SS/BRlOwWyO2nSagRue5Fz93kdEi3
   cACzuJdg0MWl6l3cFSfl6wi/ocbLqInz4xGvvy66xKwcn8EOWle8MSOGI
   ZeLXZWZ6QkIGPzLwWYxY8ds1aV6myg6xWQTwYkFEZObSFfdTRSPLIcPQF
   YzbBaL5gObJYk8AVfEZhGMW2XNrTNLYtwwxam3s1hM8mBgWn9FVhiV1UL
   j1V64hWR9YwwSiOnFCGzy22ddx2v3A6u0NLFUhZyXAqrHSyUcdJK5GuKj
   m7RI9f+EQVWp1gP6lB+wBrZv3vhHNj98ujUNgVJFJr1dVFtW4MykrjSLK
   g==;
X-CSE-ConnectionGUID: PWdfNasdR0Wap5fXrStl/w==
X-CSE-MsgGUID: NcMwsLooSBaLHZJepV5gNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="107893162"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="107893162"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 17:39:01 -0700
X-CSE-ConnectionGUID: LCCxa1WvQwCy46j9hnm4xw==
X-CSE-MsgGUID: tr3xYZSkTEmC7xW8JDRM/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="249827549"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Jun 2026 17:38:59 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZeIy-00000000Tx8-2aEZ;
	Wed, 17 Jun 2026 00:38:56 +0000
Date: Wed, 17 Jun 2026 08:38:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jad Keskes <inasj268@gmail.com>, Mark Brown <broonie@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jad Keskes <inasj268@gmail.com>
Subject: Re: [PATCH v3] regulator: max14577: fix set_mode clobbering enable
 on MAX77836 LDOs
Message-ID: <202606170800.s4CQUJ3m-lkp@intel.com>
References: <20260616170256.1659595-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616170256.1659595-1-inasj268@gmail.com>

Hi Jad,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-regulator/for-next]
[also build test ERROR on lee-mfd/for-mfd-next lee-leds/for-leds-next lee-mfd/for-mfd-fixes linus/master v7.1 next-20260616]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jad-Keskes/regulator-max14577-fix-set_mode-clobbering-enable-on-MAX77836-LDOs/20260617-024714
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20260616170256.1659595-1-inasj268%40gmail.com
patch subject: [PATCH v3] regulator: max14577: fix set_mode clobbering enable on MAX77836 LDOs
config: parisc-randconfig-r073-20260617 (https://download.01.org/0day-ci/archive/20260617/202606170800.s4CQUJ3m-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606170800.s4CQUJ3m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606170800.s4CQUJ3m-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/regulator/max14577-regulator.c:208:10: error: 'const struct regulator_ops' has no member named 'of_map_mode'
     208 |         .of_map_mode            = max77836_ldo_of_map_mode,
         |          ^~~~~~~~~~~
>> drivers/regulator/max14577-regulator.c:208:35: error: initialization of 'unsigned int (*)(struct regulator_dev *)' from incompatible pointer type 'unsigned int (*)(unsigned int)' [-Wincompatible-pointer-types]
     208 |         .of_map_mode            = max77836_ldo_of_map_mode,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/max14577-regulator.c:208:35: note: (near initialization for 'max77836_ldo_ops.get_mode')
   drivers/regulator/max14577-regulator.c:187:21: note: 'max77836_ldo_of_map_mode' declared here
     187 | static unsigned int max77836_ldo_of_map_mode(unsigned int mode)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/max14577-regulator.c:208:35: warning: initialized field overwritten [-Woverride-init]
     208 |         .of_map_mode            = max77836_ldo_of_map_mode,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/max14577-regulator.c:208:35: note: (near initialization for 'max77836_ldo_ops.get_mode')

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [m]:
   - PINCTRL_STMFX [=m] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]


vim +208 drivers/regulator/max14577-regulator.c

   197	
   198	static const struct regulator_ops max77836_ldo_ops = {
   199		.is_enabled		= regulator_is_enabled_regmap,
   200		.enable			= max77836_ldo_enable,
   201		.disable		= max77836_ldo_disable,
   202		.list_voltage		= regulator_list_voltage_linear,
   203		.map_voltage		= regulator_map_voltage_linear,
   204		.get_voltage_sel	= regulator_get_voltage_sel_regmap,
   205		.set_voltage_sel	= regulator_set_voltage_sel_regmap,
   206		.get_mode		= max77836_ldo_get_mode,
   207		.set_mode		= max77836_ldo_set_mode,
 > 208		.of_map_mode		= max77836_ldo_of_map_mode,
   209	};
   210	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
