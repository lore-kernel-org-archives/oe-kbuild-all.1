Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059A321322F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Nov 2025 03:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763177898; cv=none; b=R4uFRMep7nr1rgNF7YgcIZBa4zvrl0oexez49lM+MSZfREG/qA4zgrcC845TffI2tSf8gQVwLbSDHeCzFrr8MX2kSpFlzERTJ5o/7SYmn3FygYHShTuleYUqQM/vhWH66CnjliLkJuJIIyk7y/bkPZQLNFjvxGbFnkqaTlV7oaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763177898; c=relaxed/simple;
	bh=D53rPtZZ2FPxgmUXdVyNZYbPI9YR1BagC18hr2AxP7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IiYDmcVX69arkkTGzh9m++SP+xpMWYYXnALsN2z9uftzHRa7YLlJ0FaAeWFqcR68rgW15YXWiMESJV6ZaYnE2nGgB6omMMlbN+fMI4XZVcuQXsg1MaQBpmcdf8KEZP/ai5eUTldcyNH2i0YggBdMYinhOo359IyVOwmAvISrto8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TvdzwlF9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TvdzwlF9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763177897; x=1794713897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D53rPtZZ2FPxgmUXdVyNZYbPI9YR1BagC18hr2AxP7k=;
  b=TvdzwlF9OuyixplCi0aIjXPvkcQk4LPk2fxY1nUhHiR6Q+JD/pyI7/Y/
   DAuJWnoIloQ8ZLWs8Z1f7kD9vYsxRHE670SonjIz3r6Pl2ZddG2PKnIf+
   scEC0qLlRqkTHTdi/cCn+ECnrZJBQrmexCqn3qUSHvfANPszwom+m+L/9
   G+NwEtrqPJOEOdnZ1PyL9uLb3PU8lf3JWJYJiOPKHirOwN/7taWbqdXQc
   KNDv9FFIT4KtxuDIkzJtOcyLYQds3nNMsm1CJq6iz9OC3AizVafVV7NNT
   nKO72Ex8Uc/oHxWeOFvTMMfMCZ3/gui5vMZWpyrj5RQa3n2F1zU0+nsUc
   g==;
X-CSE-ConnectionGUID: Q4gpKGkeRJWHyBF75Ae9BQ==
X-CSE-MsgGUID: Lf+uNZQWTgKQ2DbLXs2b0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65427400"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="65427400"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 19:38:16 -0800
X-CSE-ConnectionGUID: qP+2f093R7eucdXAt9T/zQ==
X-CSE-MsgGUID: hvYhct01SDmTwfzNASmM0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="194073469"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Nov 2025 19:38:15 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vK776-0007hL-0e;
	Sat, 15 Nov 2025 03:38:12 +0000
Date: Sat, 15 Nov 2025 11:37:11 +0800
From: kernel test robot <lkp@intel.com>
To: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v3_20251107_prajna_rajendrakumar_add_support_for_microchip_corespi_controller
 1/3] drivers/spi/spi-mpfs.c:620:10: error: 'struct platform_driver' has no
 member named 'remove_new'; did you mean 'remove'?
Message-ID: <202511151147.b6CksogV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v3_20251107_prajna_rajendrakumar_add_support_for_microchip_corespi_controller
head:   ea5be8ec5875769c21296de0acadc15966efff65
commit: c96250b80edc6a7838029f4c5b404abc1566d088 [1/3] spi: microchip: rename driver file and internal identifiers
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20251115/202511151147.b6CksogV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511151147.b6CksogV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511151147.b6CksogV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spi/spi-mpfs.c:620:10: error: 'struct platform_driver' has no member named 'remove_new'; did you mean 'remove'?
     620 |         .remove_new = mpfs_spi_remove,
         |          ^~~~~~~~~~
         |          remove
>> drivers/spi/spi-mpfs.c:620:23: error: initialization of 'const struct platform_device_id *' from incompatible pointer type 'void (*)(struct platform_device *)' [-Wincompatible-pointer-types]
     620 |         .remove_new = mpfs_spi_remove,
         |                       ^~~~~~~~~~~~~~~
   drivers/spi/spi-mpfs.c:620:23: note: (near initialization for 'mpfs_spi_driver.id_table')
   drivers/spi/spi-mpfs.c:590:13: note: 'mpfs_spi_remove' declared here
     590 | static void mpfs_spi_remove(struct platform_device *pdev)
         |             ^~~~~~~~~~~~~~~


vim +620 drivers/spi/spi-mpfs.c

   612	
   613	static struct platform_driver mpfs_spi_driver = {
   614		.probe = mpfs_spi_probe,
   615		.driver = {
   616			.name = "microchip-spi",
   617			.pm = MICROCHIP_SPI_PM_OPS,
   618			.of_match_table = of_match_ptr(mpfs_spi_dt_ids),
   619		},
 > 620		.remove_new = mpfs_spi_remove,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
