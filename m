Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053B781736
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jun 2024 23:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717458838; cv=none; b=b1eKe0gTBji7SibSLkY9e1LzAHASt+07canEfalncUVRwGCqbASycTdneAVhUoZAuWUuIHJLSuG97nU/QUFeAnqFqjtyDHzJMBxZdHFB7dW3l2INjVNaCYTIyl06rw8l1sMaPCTIrDITUOZdVYrUfTjwPn7/0FKSq2ANJB+yqZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717458838; c=relaxed/simple;
	bh=umasxBYQ9N/UPcmclGy8L4X1QfgyT2YH7gw/sNs3ymI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dGHBaXesZeGXZ4d0FfquvC4FxLbUH8qjeJPVuQRh9Qhhk0o875PdW5yJ3ZmiEyYGyCHk75XTgmNw5aAhL3tMvw9lTdduarIUjAFXrQJxzMx1B14u3dn+PGZDwj9OPxO5SkGx1WDhN1xPOGEybnijtN+pKVnxC2kA28sGLO4rFAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARaXfn7l; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARaXfn7l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717458837; x=1748994837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=umasxBYQ9N/UPcmclGy8L4X1QfgyT2YH7gw/sNs3ymI=;
  b=ARaXfn7l1UCvOdnbqMJTrVP6CH4prP0Vllimu4WLfxqZC0uzWiXWxUY7
   Aoj0Bmh5AkJp5mti35sOVoDxtMCGsM2N5xS0Q7WyiHMvvbFUnyUYJ4FUK
   pR39OBMun3lWP/cAffSLvk8frOVCBF1YXJR7B9Ibr3EYwMMcyHAKtO1rV
   ZAxrDh3IY05rUrlvoOPnZk7EMklSxg7slNL+UeA3leZ5zZ+5daCHXBGYW
   YRrRcMUb1fXupS787mn+mSSWu/v1gzva3Rp4Gf4aVVr5cKEn7lt0MreFz
   JZVDGeye1h5LL0ctUqKrVzL13xGBIQhAYGkj6neNuRyGDyJGg/r07fGN6
   w==;
X-CSE-ConnectionGUID: UmXfzQzAS9mfQfg52VX+Ag==
X-CSE-MsgGUID: xHvUDoQWQcKRmil2cZxJwQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="31479441"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="31479441"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 16:53:56 -0700
X-CSE-ConnectionGUID: qwvPSHSwRE2OELaLOzDcnA==
X-CSE-MsgGUID: Kc4TLhSaS4y3ZUahWMKLlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="42107685"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 03 Jun 2024 16:53:55 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEHUv-000MLH-0i;
	Mon, 03 Jun 2024 23:53:53 +0000
Date: Tue, 4 Jun 2024 07:53:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 11184/30000]
 drivers/soc/qcom/rpmh-rsc.c:695:1: sparse: sparse: 'arch_initcall()' has
 implicit return type
Message-ID: <202406040745.RPeM4IZV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   079d4f3ff06b21f99aed51d8b22534bdfda5a134
commit: 1ee367d36875a25c92ae7bb66d4b6f25f0d386d5 [11184/30000] ANDROID: GKI: drivers: qcom: rpmh-rsc: Add tristate support for qcom,rpmh-rsc driver
config: arm64-randconfig-r123-20240603 (https://download.01.org/0day-ci/archive/20240604/202406040745.RPeM4IZV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240604/202406040745.RPeM4IZV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406040745.RPeM4IZV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/qcom/rpmh-rsc.c:695:1: sparse: sparse: 'arch_initcall()' has implicit return type
   drivers/soc/qcom/rpmh-rsc.c:697:16: sparse: sparse: Expected ) in function declarator
   drivers/soc/qcom/rpmh-rsc.c:697:16: sparse: sparse: got "GPL v2"
   drivers/soc/qcom/rpmh-rsc.c:698:20: sparse: sparse: Expected ) in function declarator
   drivers/soc/qcom/rpmh-rsc.c:698:20: sparse: sparse: got "Qualcomm RPM-Hardened (RPMH) Communication driver"
   drivers/soc/qcom/rpmh-rsc.c:695:1: warning: data definition has no type or storage class
     695 | arch_initcall(rpmh_driver_init);
         | ^~~~~~~~~~~~~
   drivers/soc/qcom/rpmh-rsc.c:695:1: error: type defaults to 'int' in declaration of 'arch_initcall' [-Werror=implicit-int]
   drivers/soc/qcom/rpmh-rsc.c:695:1: warning: parameter names (without types) in function declaration
   drivers/soc/qcom/rpmh-rsc.c:697:16: error: expected declaration specifiers or '...' before string constant
     697 | MODULE_LICENSE("GPL v2");
         |                ^~~~~~~~
   drivers/soc/qcom/rpmh-rsc.c:698:20: error: expected declaration specifiers or '...' before string constant
     698 | MODULE_DESCRIPTION("Qualcomm RPM-Hardened (RPMH) Communication driver");
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/rpmh-rsc.c:691:19: warning: 'rpmh_driver_init' defined but not used [-Wunused-function]
     691 | static int __init rpmh_driver_init(void)
         |                   ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +695 drivers/soc/qcom/rpmh-rsc.c

658628e7ef78e8 Lina Iyer     2018-06-20  690  
658628e7ef78e8 Lina Iyer     2018-06-20  691  static int __init rpmh_driver_init(void)
658628e7ef78e8 Lina Iyer     2018-06-20  692  {
658628e7ef78e8 Lina Iyer     2018-06-20  693  	return platform_driver_register(&rpmh_driver);
658628e7ef78e8 Lina Iyer     2018-06-20  694  }
658628e7ef78e8 Lina Iyer     2018-06-20 @695  arch_initcall(rpmh_driver_init);
1ee367d36875a2 Will McVicker 2020-02-10  696  

:::::: The code at line 695 was first introduced by commit
:::::: 658628e7ef78e875cfe13064387c1a7a287d6338 drivers: qcom: rpmh-rsc: add RPMH controller for QCOM SoCs

:::::: TO: Lina Iyer <ilina@codeaurora.org>
:::::: CC: Andy Gross <andy.gross@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
