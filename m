Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A4D1D89F1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 21:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737755078; cv=none; b=sforDdlu2/wHbSCG7bjXrTljMQYchMj7U7vM2lHOmXz4c7gaT43IyLQ7vNbax4SQb5rV6GJObHv58CsJ51p+lIURkhVQoNnzJf5TUoXX4OS+JHizKrO6Z8KscrK+jgKFg2ZqimaUGc0/F/Uz8T3jws7LdlOyEE6k8LlOzSMWQrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737755078; c=relaxed/simple;
	bh=15xfeRVz0Q6IpXu/pFgNU6YynHxODvublrTYrJmf0Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RYD2aiZCG0G82wIKLlDsTrxpW0nCKBUnxysmgvDiWeLJFYUOC7f4xIb5VakPuHXwp/pWJnMX5ok8MJGlZqc3QRa3WgeAJYKEADIxmbXdF1qvkN2fEyc6UGiDCfpiv46UKwNxS6Z8c3oHxB0AdZyCZ5PPgY9+8X0KDG0L22iv/Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CnfG2cg+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CnfG2cg+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737755076; x=1769291076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=15xfeRVz0Q6IpXu/pFgNU6YynHxODvublrTYrJmf0Qk=;
  b=CnfG2cg+Fc3OLYeZ+h4VkdcYIfJMr/2oNCnilMf8HOO392xziM/rSnJ6
   8+mD/Q3lUkKkUBQyuGGced94VIv6Hdb41Cxxlrh3LrmYBzC9iFF5S/1tw
   z+LWorglbupX5abaBsUMejXOZxpRmuoxa93D5KOudU6CnrX8uLyr6Rd9B
   N5N4yAwD5nVs0lyIvx8QQbodmqd1qhQnK20wvB3lF/L12UfIffOO00dUn
   OPx5lNnsAWk+r3ffB2WglpZUORkbsZZt2LIQxXEljaQWWyO7buoW8VDXy
   rvot+zh+Jgsz7zqu6R/bYWIHAuXXly7Olc5Wp3dxkp+eltgS0G5r4k6dU
   Q==;
X-CSE-ConnectionGUID: O+fMOdyeRzWiV42/mIQOIQ==
X-CSE-MsgGUID: SEDCgVDRQ6aAvjF31oDCmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38556784"
X-IronPort-AV: E=Sophos;i="6.13,232,1732608000"; 
   d="scan'208";a="38556784"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 13:44:36 -0800
X-CSE-ConnectionGUID: eIKf7J3lQX+TO9e3KrDlpA==
X-CSE-MsgGUID: Il4q/AigQy2Rxeg5Exz5fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,232,1732608000"; 
   d="scan'208";a="107687098"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Jan 2025 13:44:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbRTc-000dAM-2q;
	Fri, 24 Jan 2025 21:44:32 +0000
Date: Sat, 25 Jan 2025 05:43:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 13/13]
 drivers/remoteproc/mediatek_apusys/mtk_apu_hw_logger.c:310:10: error:
 incompatible integer to pointer conversion returning 'int' from a function
 with result type 'struct mtk_apu_hw_logger *'
Message-ID: <202501250531.TO9uLA61-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Karl,

First bad commit (maybe != root cause):

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   14b504efbd4bac0923b4a92db4d354c889ad618c
commit: 5fd4ae454d3ca9c494223bd40baae0603d17047e [13/13] CHROMIUM: remoteproc: mediatek: Enable APU rproc building
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250125/202501250531.TO9uLA61-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501250531.TO9uLA61-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501250531.TO9uLA61-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/remoteproc/mediatek_apusys/mtk_apu_config.c:120:19: error: incompatible pointer to integer conversion assigning to 'uint64_t' (aka 'unsigned long long') from 'void *' [-Wint-conversion]
     120 |         mdla_rv_mem->buf = mdla_buf;
         |                          ^ ~~~~~~~~
   1 error generated.
--
>> drivers/remoteproc/mediatek_apusys/mtk_apu_rproc.c:526:5: warning: no previous prototype for function 'mtk_apu_rproc_init' [-Wmissing-prototypes]
     526 | int mtk_apu_rproc_init(void)
         |     ^
   drivers/remoteproc/mediatek_apusys/mtk_apu_rproc.c:526:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     526 | int mtk_apu_rproc_init(void)
         | ^
         | static 
   1 warning generated.
--
>> drivers/remoteproc/mediatek_apusys/mtk_apu_hw_logger.c:310:10: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct mtk_apu_hw_logger *' [-Wint-conversion]
     310 |                 return -EPROBE_DEFER;
         |                        ^~~~~~~~~~~~~
   drivers/remoteproc/mediatek_apusys/mtk_apu_hw_logger.c:313:10: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct mtk_apu_hw_logger *' [-Wint-conversion]
     313 |                 return -EINVAL;
         |                        ^~~~~~~
   2 errors generated.
--
>> drivers/remoteproc/mediatek_apusys/plat/mt8196_plat.c:105:5: warning: no previous prototype for function 'apu_infra_lock' [-Wmissing-prototypes]
     105 | int apu_infra_lock(struct mtk_apu *apu, uint32_t op, enum apu_infra_bit_id id)
         |     ^
   drivers/remoteproc/mediatek_apusys/plat/mt8196_plat.c:105:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     105 | int apu_infra_lock(struct mtk_apu *apu, uint32_t op, enum apu_infra_bit_id id)
         | ^
         | static 
   1 warning generated.


vim +310 drivers/remoteproc/mediatek_apusys/mtk_apu_hw_logger.c

4b17ad382a2a52d Karl Li 2025-01-02  295  
4b17ad382a2a52d Karl Li 2025-01-02  296  static struct platform_driver hw_logger_driver;
4b17ad382a2a52d Karl Li 2025-01-02  297  struct mtk_apu_hw_logger *get_mtk_apu_hw_logger_device(struct device_node *hw_logger_np)
4b17ad382a2a52d Karl Li 2025-01-02  298  {
4b17ad382a2a52d Karl Li 2025-01-02  299  	struct platform_device *pdev;
4b17ad382a2a52d Karl Li 2025-01-02  300  	struct device *dev;
4b17ad382a2a52d Karl Li 2025-01-02  301  	struct mtk_apu_hw_logger *hw_logger_data;
4b17ad382a2a52d Karl Li 2025-01-02  302  
4b17ad382a2a52d Karl Li 2025-01-02  303  	pdev = of_find_device_by_node(hw_logger_np);
4b17ad382a2a52d Karl Li 2025-01-02  304  	if (!pdev)
4b17ad382a2a52d Karl Li 2025-01-02  305  		return ERR_PTR(-ENODEV);
4b17ad382a2a52d Karl Li 2025-01-02  306  
4b17ad382a2a52d Karl Li 2025-01-02  307  	dev = &pdev->dev;
4b17ad382a2a52d Karl Li 2025-01-02  308  
4b17ad382a2a52d Karl Li 2025-01-02  309  	if (!dev->driver)
4b17ad382a2a52d Karl Li 2025-01-02 @310  		return -EPROBE_DEFER;
4b17ad382a2a52d Karl Li 2025-01-02  311  
4b17ad382a2a52d Karl Li 2025-01-02  312  	if (dev->driver != &hw_logger_driver.driver)
4b17ad382a2a52d Karl Li 2025-01-02  313  		return -EINVAL;
4b17ad382a2a52d Karl Li 2025-01-02  314  
4b17ad382a2a52d Karl Li 2025-01-02  315  	hw_logger_data = dev_get_drvdata(dev);
4b17ad382a2a52d Karl Li 2025-01-02  316  	put_device(dev);
4b17ad382a2a52d Karl Li 2025-01-02  317  
4b17ad382a2a52d Karl Li 2025-01-02  318  	return hw_logger_data;
4b17ad382a2a52d Karl Li 2025-01-02  319  }
4b17ad382a2a52d Karl Li 2025-01-02  320  

:::::: The code at line 310 was first introduced by commit
:::::: 4b17ad382a2a52d9c67892b55fedff14b390bea3 CHROMIUM: remoteproc: mediatek: Add APU hw_logger

:::::: TO: Karl Li <karl.li@mediatek.corp-partner.google.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
