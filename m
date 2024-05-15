Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6259B3EA7B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 May 2024 10:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715769040; cv=none; b=MkB1sIoV8phOSPpsIVbRodZiQLcbVS/sZJGmh/rMQvY0VWx3XGd/+tyyiNsszT3JoNH9AnTQxfZwXNsINxwIXqxV6/ma14vo7dHFzMfnHm+iAnMY60CeSoTlLt0ySENv8m4Cn7fmt2N9QfMElbfrTrtz1d/72bK/e1UqRSAHAFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715769040; c=relaxed/simple;
	bh=XGiaSg2nqs+m8UQiy5dIP4DfJEFcextaNe1/oaqUY3c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RT06MZPYJ8orlOjhXB9MkeS23NYPHsYq1zkfjDLT63kQHCemCCslTWVYw0dHqp3NDerXB2CTg8sNXj6H5cYEZ7G4wuZQwX47mA+tRgMXlD0ITaCAYPSt8bt2UO27sHO2JgoOICPkFkiWEpK+2Gqg5eq3eS5P1RoTs1QvgDn76aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H0ktx/+n; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H0ktx/+n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715769040; x=1747305040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XGiaSg2nqs+m8UQiy5dIP4DfJEFcextaNe1/oaqUY3c=;
  b=H0ktx/+n/j/rzlHZ20TCBQP55FdD6o92mzAoKbQOQ9aniAE3qTJIVUvO
   NXhRj6+r8rG3iKsRxVBrPXMDJ51ryGAxLOYBbHFcxkZk1+kxWRQeILXNs
   4eE97epPqUz5GkwJ8HUvPWoNiXxyXzB1VzRHsxzAslzFaaiIw4K7lh5ta
   9DPIZNWowGvWFSF1RXPBQ/hVdW5jX3IEEkjKrFpNX/iOtjXkdsr5O6PVa
   xVffFE8T9F755g33tjzZ3azG84fEBik9gezg22DyN5zp/TkT4TnvU9RAR
   som19bFDTwIqPq/r0wD0Q+H9yuz9hVn02vFK97pS1EPPiacxV8QdwRyJ+
   A==;
X-CSE-ConnectionGUID: Sd+rlUadRzKFRmbHvu3XAA==
X-CSE-MsgGUID: w4nBxmcGT/SAcYKLOqggeA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="22950019"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="scan'208";a="22950019"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 03:30:39 -0700
X-CSE-ConnectionGUID: cBvdbTZqQCa0Q+/WoWNPCg==
X-CSE-MsgGUID: X+5IrPLlRzilGMeZRciy1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="scan'208";a="31100870"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 May 2024 03:30:37 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7Bu7-000CiZ-2A;
	Wed, 15 May 2024 10:30:35 +0000
Date: Wed, 15 May 2024 18:29:40 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 681/1143] drivers/bus/aspeed-ltpi.c:18:10:
 error: call to undeclared function 'of_match_device'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202405151848.SxeHKy62-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: a23db482cddedbb213330754033447f21a4faf8b [681/1143] bus: Add Aspeed LTPI bus controller driver
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240515/202405151848.SxeHKy62-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240515/202405151848.SxeHKy62-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405151848.SxeHKy62-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/bus/aspeed-ltpi.c:18:10: error: call to undeclared function 'of_match_device'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      18 |         match = of_match_device(dev->driver->of_match_table, dev);
         |                 ^
>> drivers/bus/aspeed-ltpi.c:18:8: error: incompatible integer to pointer conversion assigning to 'const struct of_device_id *' from 'int' [-Wint-conversion]
      18 |         match = of_match_device(dev->driver->of_match_table, dev);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/aspeed-ltpi.c:20:7: error: call to undeclared function 'of_property_match_string'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      20 |                 if (of_property_match_string(np, "compatible", match->compatible) == 0)
         |                     ^
   3 errors generated.


vim +/of_match_device +18 drivers/bus/aspeed-ltpi.c

     9	
    10	static int aspeed_ltpi_probe(struct platform_device *pdev)
    11	{
    12		const struct device *dev = &pdev->dev;
    13		const struct of_dev_auxdata *lookup = dev_get_platdata(dev);
    14		struct device_node *np = dev->of_node;
    15		const struct of_device_id *match;
    16		struct clk *ltpi_clk;
    17	
  > 18		match = of_match_device(dev->driver->of_match_table, dev);
    19		if (match && match->data) {
  > 20			if (of_property_match_string(np, "compatible", match->compatible) == 0)
    21				return 0;
    22			else
    23				return -ENODEV;
    24		}
    25	
    26		ltpi_clk = devm_clk_get(&pdev->dev, NULL);
    27		if (IS_ERR(ltpi_clk))
    28			return PTR_ERR(ltpi_clk);
    29	
    30		clk_prepare_enable(ltpi_clk);
    31	
    32		if (np)
    33			of_platform_populate(np, NULL, lookup, &pdev->dev);
    34	
    35		return 0;
    36	}
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
