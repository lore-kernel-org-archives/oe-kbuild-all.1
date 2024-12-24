Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEDA1BD9DC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Dec 2024 16:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735057247; cv=none; b=h7rpXwYlXXkizUJJIc4izBn7pD4H495wzjBVHYvKNg4nR79HlTPJO0Z2QEsyhF8KOunGSSE3VRhxF0vpwWJNQkNWws0/j8aVXEeh6i1BykHtyriMCq7+UYfEpiu5jXCpn3cv6X4ZypscAGcY3ToknHaZoKFRdguvY8eSev4ZDJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735057247; c=relaxed/simple;
	bh=SZ2QOok/hdpjvopPNVEOo7Z+4SqZg3ofd3waydElmSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ViOcHx15cRtMB4gKJOxaZa+BoScxHBzjYjqWRiNttAbMTwjAIAOAorntwrpYc0RApNjgVkeKOVKSCJ3YxsG7qk449gU0QakYs6Su9iJaryV8kkvS7Ef1jqVXFCL2egsgEo2FKteHkhbiNcmawvQWE0QI3jGl9BUiJKaQdv9zcCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CB5m87YQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CB5m87YQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735057245; x=1766593245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SZ2QOok/hdpjvopPNVEOo7Z+4SqZg3ofd3waydElmSQ=;
  b=CB5m87YQLqRdDcMiTTkseAIFvJ7Qd9ko5BuLP52+5IsRwhbri13YLetE
   zm7q3i/UNBQoGPGOnGnmVCj1yIzr5o1OFnihYIkfMb3KmZOFCtmzkqMbw
   yHbavBSPstyMlavhuiFAgBJCCeWYkISRgJhwoUmUVLQaDxMzvBtC1xEEA
   0kLkQekdBYGvgSbbaxOL9qUyNKohtsv8KremzkIJxy/1g1RwfqZX3gW/z
   JmkbKDpX70CFn6OANQNEz+wF8qRC7IVpV45zoWXQx+nIjPeC5SuhUygqF
   i6esax1bzGPNPfCOCF3Ov2X527TAqxVTddmYgHKWOTraTI/A6ysH8Cm4X
   Q==;
X-CSE-ConnectionGUID: N9k10hkJQh2j3qZIShf+Jg==
X-CSE-MsgGUID: ypmwhHZHScOVx+G36mwqBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="52931943"
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="52931943"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 08:20:44 -0800
X-CSE-ConnectionGUID: 0pPFAfbgTQOjccDQ3QF7Sw==
X-CSE-MsgGUID: C1febazXS7aogI8UyPsGhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104139460"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Dec 2024 08:20:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQ7eC-0001I3-1R;
	Tue, 24 Dec 2024 16:20:40 +0000
Date: Wed, 25 Dec 2024 00:20:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Qi Xi <xiqi2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1345/1345]
 drivers/acpi/pmic/tps68470_pmic.c:380:10: error: implicit declaration of
 function 'dev_err_probe'
Message-ID: <202412250010.Z1qbx7TD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   33267d4a7f512d371a3ea853568832174be4caba
commit: 24564bb891ae98786176f703d1addc5588dafe61 [1345/1345] ACPI: PMIC: Remove unneeded check in tps68470_pmic_opregion_probe()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241225/202412250010.Z1qbx7TD-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241225/202412250010.Z1qbx7TD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412250010.Z1qbx7TD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/acpi/pmic/tps68470_pmic.c:380:10: error: implicit declaration of function 'dev_err_probe' [-Werror,-Wimplicit-function-declaration]
     380 |                 return dev_err_probe(dev, -EINVAL, "regmap is missing\n");
         |                        ^
   drivers/acpi/pmic/tps68470_pmic.c:380:10: note: did you mean 'device_reprobe'?
   include/linux/device.h:1336:25: note: 'device_reprobe' declared here
    1336 | extern int __must_check device_reprobe(struct device *dev);
         |                         ^
   1 error generated.


vim +/dev_err_probe +380 drivers/acpi/pmic/tps68470_pmic.c

   370	
   371	static int tps68470_pmic_opregion_probe(struct platform_device *pdev)
   372	{
   373		struct regmap *tps68470_regmap = dev_get_drvdata(pdev->dev.parent);
   374		acpi_handle handle = ACPI_HANDLE(pdev->dev.parent);
   375		struct device *dev = &pdev->dev;
   376		struct tps68470_pmic_opregion *opregion;
   377		acpi_status status;
   378	
   379		if (!tps68470_regmap)
 > 380			return dev_err_probe(dev, -EINVAL, "regmap is missing\n");
   381	
   382		if (!handle) {
   383			dev_warn(dev, "acpi handle is NULL\n");
   384			return -ENODEV;
   385		}
   386	
   387		opregion = devm_kzalloc(dev, sizeof(*opregion), GFP_KERNEL);
   388		if (!opregion)
   389			return -ENOMEM;
   390	
   391		mutex_init(&opregion->lock);
   392		opregion->regmap = tps68470_regmap;
   393	
   394		status = acpi_install_address_space_handler(handle,
   395							    TI_PMIC_POWER_OPREGION_ID,
   396							    tps68470_pmic_pwr_handler,
   397							    NULL, opregion);
   398		if (ACPI_FAILURE(status))
   399			goto out_mutex_destroy;
   400	
   401		status = acpi_install_address_space_handler(handle,
   402							    TI_PMIC_VR_VAL_OPREGION_ID,
   403							    tps68470_pmic_vrval_handler,
   404							    NULL, opregion);
   405		if (ACPI_FAILURE(status))
   406			goto out_remove_power_handler;
   407	
   408		status = acpi_install_address_space_handler(handle,
   409							    TI_PMIC_CLOCK_OPREGION_ID,
   410							    tps68470_pmic_clk_handler,
   411							    NULL, opregion);
   412		if (ACPI_FAILURE(status))
   413			goto out_remove_vr_val_handler;
   414	
   415		status = acpi_install_address_space_handler(handle,
   416							    TI_PMIC_CLKFREQ_OPREGION_ID,
   417							    tps68470_pmic_cfreq_handler,
   418							    NULL, opregion);
   419		if (ACPI_FAILURE(status))
   420			goto out_remove_clk_handler;
   421	
   422		return 0;
   423	
   424	out_remove_clk_handler:
   425		acpi_remove_address_space_handler(handle, TI_PMIC_CLOCK_OPREGION_ID,
   426						  tps68470_pmic_clk_handler);
   427	out_remove_vr_val_handler:
   428		acpi_remove_address_space_handler(handle, TI_PMIC_VR_VAL_OPREGION_ID,
   429						  tps68470_pmic_vrval_handler);
   430	out_remove_power_handler:
   431		acpi_remove_address_space_handler(handle, TI_PMIC_POWER_OPREGION_ID,
   432						  tps68470_pmic_pwr_handler);
   433	out_mutex_destroy:
   434		mutex_destroy(&opregion->lock);
   435		return -ENODEV;
   436	}
   437	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
