Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732291A08AB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Mar 2025 07:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742024323; cv=none; b=FDVzlwfesDMt7fDZ057EA6aNxmTPPekp3FyxlnRtV6EzDUXssTXmEc1ak70Lu90a/WF0/KZh0qsmwwF+yukwBCLpakte20o/oKQGSI7/U+9QzNpBBLwtyes3fhOoVWOMH13efnYdykTRYmV2LMEwIXvUdaH52DFZSrnTE0R8FrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742024323; c=relaxed/simple;
	bh=Ag0Liw+5nFTMbpWGAUDY1iT8SxG73LaSDHU1TbuuLaw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O2hlNoidJ6fO839gOOKaWbjfjBMzKPRA7OC1eSkod5yetro994Yf967KcHbw7lcyBjKfFfD/+kLWDbQIHqO+hvoH1zJz+S2vmaCaUrZbgdJNn52gdZtEt6gs/NQyRGO3geWlpq57qTHw2t6YKTyhgnuk+68oEknkCOHP1BpdsPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bxNIPpel; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bxNIPpel"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742024320; x=1773560320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ag0Liw+5nFTMbpWGAUDY1iT8SxG73LaSDHU1TbuuLaw=;
  b=bxNIPpelm8xXII6H2rE/WVq3aMmuecpmnFUDm8PBFuNb3Q1c2ZXRDTFA
   iVsxRwS0/ILVf3jIU1CeDgimv2cJXHTh7TV//7YUdSIPWHcqygiHWDh/c
   6RmlNVEaOXzcv37qj+XUHydymBpJSatikjJAsnHH5sSQ1eVPX9fFrdkX1
   kpobMoxouUmjAv6d98pWl2k9wibsPEwt2u1jEbUk0LLRm9V2uQOI0Yls9
   HUKcaSDx96BA4RRb8fGNFwKE2CXOl9aJOT4NrUtUYDXJtQ4IiA377gNer
   8cv3t/WEUTSxddPfYyebgoW0GCKfhwX91I5K/8m6gSQ/T2BqXurn8aDQr
   w==;
X-CSE-ConnectionGUID: /UvO61zXQ4K6YamViJdNZw==
X-CSE-MsgGUID: ZLz5rN78RWGrucKJhrA5Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43284681"
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="43284681"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 00:38:40 -0700
X-CSE-ConnectionGUID: 31dOWPbrSjOY1yTI0DxqJg==
X-CSE-MsgGUID: upuQ9nfXTc2OLtYEeN9lwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="121483326"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 15 Mar 2025 00:38:39 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttM6F-000B8p-23;
	Sat, 15 Mar 2025 07:38:32 +0000
Date: Sat, 15 Mar 2025 15:37:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 10/10]
 drivers/soc/aspeed/aspeed-p2a-ctrl.c:348:14: error: implicit declaration of
 function 'of_reserved_mem_region_to_resource'
Message-ID: <202503151521.46jF9Gm0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   5b03bf12bca3de24640f5e388ef4d956cf22673e
commit: 6cc5107d1a7aa24dffaa093cfbeb387890c16970 [10/10] more driver cleanups
config: arc-randconfig-002-20250315 (https://download.01.org/0day-ci/archive/20250315/202503151521.46jF9Gm0-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151521.46jF9Gm0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151521.46jF9Gm0-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/aspeed/aspeed-p2a-ctrl.c: In function 'aspeed_p2a_ctrl_probe':
>> drivers/soc/aspeed/aspeed-p2a-ctrl.c:348:14: error: implicit declaration of function 'of_reserved_mem_region_to_resource' [-Werror=implicit-function-declaration]
     348 |         rc = of_reserved_mem_region_to_resource(dev->of_node, 0, &resm);
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/soc/aspeed/aspeed-lpc-ctrl.c: In function 'aspeed_lpc_ctrl_probe':
>> drivers/soc/aspeed/aspeed-lpc-ctrl.c:242:22: error: implicit declaration of function 'of_address_to_resource' [-Werror=implicit-function-declaration]
     242 |                 rc = of_address_to_resource(node, 1, &resm);
         |                      ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/of_reserved_mem_region_to_resource +348 drivers/soc/aspeed/aspeed-p2a-ctrl.c

   331	
   332	static int aspeed_p2a_ctrl_probe(struct platform_device *pdev)
   333	{
   334		struct aspeed_p2a_ctrl *misc_ctrl;
   335		struct device *dev;
   336		struct resource resm;
   337		int rc = 0;
   338	
   339		dev = &pdev->dev;
   340	
   341		misc_ctrl = devm_kzalloc(dev, sizeof(*misc_ctrl), GFP_KERNEL);
   342		if (!misc_ctrl)
   343			return -ENOMEM;
   344	
   345		mutex_init(&misc_ctrl->tracking);
   346	
   347		/* optional. */
 > 348		rc = of_reserved_mem_region_to_resource(dev->of_node, 0, &resm);
   349		if (!rc) {
   350			misc_ctrl->mem_size = resource_size(&resm);
   351			misc_ctrl->mem_base = resm.start;
   352		}
   353	
   354		misc_ctrl->regmap = syscon_node_to_regmap(pdev->dev.parent->of_node);
   355		if (IS_ERR(misc_ctrl->regmap)) {
   356			dev_err(dev, "Couldn't get regmap\n");
   357			return -ENODEV;
   358		}
   359	
   360		misc_ctrl->config = of_device_get_match_data(dev);
   361	
   362		dev_set_drvdata(&pdev->dev, misc_ctrl);
   363	
   364		aspeed_p2a_disable_all(misc_ctrl);
   365	
   366		misc_ctrl->miscdev.minor = MISC_DYNAMIC_MINOR;
   367		misc_ctrl->miscdev.name = DEVICE_NAME;
   368		misc_ctrl->miscdev.fops = &aspeed_p2a_ctrl_fops;
   369		misc_ctrl->miscdev.parent = dev;
   370	
   371		rc = misc_register(&misc_ctrl->miscdev);
   372		if (rc)
   373			dev_err(dev, "Unable to register device\n");
   374	
   375		return rc;
   376	}
   377	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
