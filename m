Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742629449
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jun 2024 13:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719062150; cv=none; b=kdtOqCYD+/ZiqZl+XqS+W9Ux27gJ1m2jJoQ3CQg998leSviIijaAfyNkjrIYgNKEKU0V1DiND+h5hLD7h9503upw9BAVF3+/c8N9Dej2FaF23brf6KY/QRGLlFjU7cdptGq/qFwvLJjVqAuwvZSBkvtZjMFRpv2jobAVkRKCpkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719062150; c=relaxed/simple;
	bh=JVUYg2p3g3r926F6pqewsWKWqNsxg++4NukR/q+jF7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KFD1/5oiSPWgUGb4s09HhT1WkNBOqb+X18TgosnJc+I03aiqPOgrum8iovGGFK5i1sD+4eU6k7w28uL/GVdYZpX6QtXJO32bYROtZ1j4Q9DibfzAQLKQFoIPHxVckvfwRXm8868zQ0X0C5nUhdGl4mXm6XmkDSgJ81VlBR5Z8jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=da8+hjBR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="da8+hjBR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719062149; x=1750598149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JVUYg2p3g3r926F6pqewsWKWqNsxg++4NukR/q+jF7s=;
  b=da8+hjBRNgbFmg9Ybd40TRSVUOHU07J6eznQSzJfpsba+DXW/4lwvSkt
   voN94I1ogaKCYDMtAh4tJz3tYYEoXUUxvLpFf5+SjZHT7gDRzhSlYaH1z
   HZ7lo0kcmg4qJOvogD5HUMNn3VS5/GqGV4ibzsyUHRh0jegDIvFCqBhGW
   3qBrcbwoOxcp8lEGkmjWs467uVevt5m6jX8hPpsOud7AOO/k4CkcY2zad
   9UTgjWLvEvJ3TfFBOxXUhAsjYi5AO6cEFDfNp4RbycVJP5QQV3c5BthGp
   mgrAO3jqVJqC/feNL3h5BiORpUBf8647cXXgF0O2/k420s9rclQHjr6Ch
   w==;
X-CSE-ConnectionGUID: gNs4C2vlT5aVSjRfkhaTrA==
X-CSE-MsgGUID: Rgkof03eSN6SiVXMxQQBeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11111"; a="16060579"
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="16060579"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 06:15:48 -0700
X-CSE-ConnectionGUID: HQuL1hhER6+gMaHD2ID4AA==
X-CSE-MsgGUID: Y4viy/3aTyWNXk1HNLDU6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="42747144"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Jun 2024 06:15:46 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sL0am-0009eM-2E;
	Sat, 22 Jun 2024 13:15:44 +0000
Date: Sat, 22 Jun 2024 21:15:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 10973/30000]
 drivers/soc/qcom/rpmh-rsc.c:695:15: error: a parameter list without types is
 only allowed in a function definition
Message-ID: <202406222153.WyGbBRib-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   4e7313f026f6692b4303506c894a436048ed4883
commit: 1ee367d36875a25c92ae7bb66d4b6f25f0d386d5 [10973/30000] ANDROID: GKI: drivers: qcom: rpmh-rsc: Add tristate support for qcom,rpmh-rsc driver
config: x86_64-buildonly-randconfig-004-20240416 (https://download.01.org/0day-ci/archive/20240622/202406222153.WyGbBRib-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406222153.WyGbBRib-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406222153.WyGbBRib-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/qcom/rpmh-rsc.c:695:1: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
     695 | arch_initcall(rpmh_driver_init);
         | ^
         | int
>> drivers/soc/qcom/rpmh-rsc.c:695:15: error: a parameter list without types is only allowed in a function definition
     695 | arch_initcall(rpmh_driver_init);
         |               ^
   drivers/soc/qcom/rpmh-rsc.c:697:16: error: expected parameter declarator
     697 | MODULE_LICENSE("GPL v2");
         |                ^
   drivers/soc/qcom/rpmh-rsc.c:697:16: error: expected ')'
   drivers/soc/qcom/rpmh-rsc.c:697:15: note: to match this '('
     697 | MODULE_LICENSE("GPL v2");
         |               ^
   drivers/soc/qcom/rpmh-rsc.c:697:1: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
     697 | MODULE_LICENSE("GPL v2");
         | ^
         | int
   drivers/soc/qcom/rpmh-rsc.c:697:15: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
     697 | MODULE_LICENSE("GPL v2");
         |               ^        
         |                        void
   drivers/soc/qcom/rpmh-rsc.c:698:20: error: expected parameter declarator
     698 | MODULE_DESCRIPTION("Qualcomm RPM-Hardened (RPMH) Communication driver");
         |                    ^
   drivers/soc/qcom/rpmh-rsc.c:698:20: error: expected ')'
   drivers/soc/qcom/rpmh-rsc.c:698:19: note: to match this '('
     698 | MODULE_DESCRIPTION("Qualcomm RPM-Hardened (RPMH) Communication driver");
         |                   ^
   drivers/soc/qcom/rpmh-rsc.c:698:1: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
     698 | MODULE_DESCRIPTION("Qualcomm RPM-Hardened (RPMH) Communication driver");
         | ^
         | int
   drivers/soc/qcom/rpmh-rsc.c:698:19: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
     698 | MODULE_DESCRIPTION("Qualcomm RPM-Hardened (RPMH) Communication driver");
         |                   ^                                                   
         |                                                                       void
   10 errors generated.


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
