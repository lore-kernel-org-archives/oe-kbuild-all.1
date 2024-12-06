Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA1D14B08C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 19:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733512754; cv=none; b=kan/ga4mounCxSNFinu3EraVNqIfJ5Asp6DKc4sPiYR2PYNjdCHMauOOMVALrgWOb66Y5QyRGKCbdeeMQwSYBgYR7o53REPbfMchYpwlUuHQdbC6k+3d41jzA588WrlfuEyYb10pwuYbdwgObjDDt2n0sbzkP53I8snQlZM96MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733512754; c=relaxed/simple;
	bh=YTR0cdHaq1fgoWNBmfun/KkPscJNkH1Q8NnuNAB1YDk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GM8zKH2dHkmwTMrbsgqDu/uQ2uDZnHo2R2pvavLGpkL4SsOoDvzY/iugd+CWEjE1XBtLQQamjpfWed05gTqtbD0fm6nAZssf++agVSPry9BbS2CyrHAYFGkfxEDbRW2OdGcUqN1Sbo2aQNlwM9OBxjDXmCOQ70vaX3D7Z5y8K6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OpeTXIMn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OpeTXIMn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733512753; x=1765048753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YTR0cdHaq1fgoWNBmfun/KkPscJNkH1Q8NnuNAB1YDk=;
  b=OpeTXIMnBdNN3+ktmLQOk3rPeUW87+uBqewtt09hifsJSMt1cFPtO+ic
   2yyHafRBUXy468FaX1v9XkW62iWaEb/cTCrxT3/2oD6t0JmU4Hd8A1XrG
   PKp769ufR5oXWII5LJJaoomYPNUC4Hswh6JoChD9YzYwpZ5psJQ31BxY+
   ISJ40j66kHxynKVuIhwPeEmmk2nfv483WrbKG/Ha3k2LKgNmcK6ib7R+V
   t3SC/BxgZ59ZlFgAP+xonUK38AOnoHbshrl/YJcZOk89ilZZ9h4JnV2qR
   qV4Omsumudtw87+sCtNYb8igpSWCGyH553uoVXQyC/ygBHXW3pK5QiiBc
   w==;
X-CSE-ConnectionGUID: u8e8PhKJS9ePxWEX7poBLw==
X-CSE-MsgGUID: dQxgpGMqSc6CDQt9Ct5cAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="44346038"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="44346038"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 11:19:12 -0800
X-CSE-ConnectionGUID: 8nsj1F6CQ+u5SwaxOS45Vg==
X-CSE-MsgGUID: 2VOKt6G7S0ec00+lIGlKTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="99430743"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Dec 2024 11:19:11 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJdr2-0002Bl-2E;
	Fri, 06 Dec 2024 19:19:08 +0000
Date: Sat, 7 Dec 2024 03:18:54 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ambarus:acpm-v3-upstream 9/10] ERROR: modpost:
 "acpm_pmic_update_reg" [drivers/firmware/samsung/exynos-acpm.ko] undefined!
Message-ID: <202412070320.rqT5CimP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day acpm-v3-upstream
head:   20f606fa2a40e27ec03a65c1a7e7d59617173b99
commit: 2c7c337e69c51f04f63d04aa2c817eda43cf97ca [9/10] firmware: add exynos ACPM protocol driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241207/202412070320.rqT5CimP-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412070320.rqT5CimP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070320.rqT5CimP-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: missing MODULE_LICENSE() in drivers/firmware/samsung/exynos-acpm-mfd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/samsung/exynos-acpm-mfd.o
ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko] undefined!
>> ERROR: modpost: "acpm_pmic_update_reg" [drivers/firmware/samsung/exynos-acpm.ko] undefined!
>> ERROR: modpost: "acpm_pmic_bulk_read" [drivers/firmware/samsung/exynos-acpm.ko] undefined!
>> ERROR: modpost: "acpm_pmic_write_reg" [drivers/firmware/samsung/exynos-acpm.ko] undefined!
>> ERROR: modpost: "acpm_pmic_bulk_write" [drivers/firmware/samsung/exynos-acpm.ko] undefined!
>> ERROR: modpost: "acpm_pmic_read_reg" [drivers/firmware/samsung/exynos-acpm.ko] undefined!
>> ERROR: modpost: "__udivdi3" [drivers/firmware/samsung/exynos-acpm-mfd.ko] undefined!
WARNING: modpost: suppressed 7 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
