Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA9D1CA89
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 07:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695801383; x=1727337383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3yJddtYVKBs670Va7yxwTb9ApizceSfLSFXkCX5sqUQ=;
  b=QxeAWW3gd1c/IbYAb72ga0xD8EISr920V8Vq9ZFZE4Bcm+V+2t1ub9LV
   4BdkHYyjbt11uQdbsa6j1C5ysfjgAkN3bn5YOO39/nPcyXgyg4EkicNU8
   1zgeLwVLJnRjMwL+KQLPm0XbzgMBdCsHklUSR1cXQttbIbZgTOBSd+V0y
   LkHWaobtkUJ6xukiQuDjFa1fEVtZ5WA0HzpIReHiOzntjmDBuAKplQJWd
   ZAkSCOmnsrE2N8Fkwyk370Pb5tNuzvery9ghTFEE4bUSgCh/38ahIyuEg
   6pQxRo1oN4tHfVcWmeRPb+bPlt2QQ1TUYJfWGJYhfVOerBifEayvdYTrK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="448251408"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="448251408"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 00:56:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="441816"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 27 Sep 2023 00:56:20 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlPP8-0003sw-09;
	Wed, 27 Sep 2023 07:56:18 +0000
Date: Wed, 27 Sep 2023 15:55:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 13155/30000]
 drivers/soc/qcom/rpmh-rsc.c:695:1: error: type defaults to 'int' in
 declaration of 'arch_initcall'
Message-ID: <202309271514.lkssAKag-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   8daba3e055d00086f153f5562449f11065001703
commit: 1ee367d36875a25c92ae7bb66d4b6f25f0d386d5 [13155/30000] ANDROID: GKI: drivers: qcom: rpmh-rsc: Add tristate support for qcom,rpmh-rsc driver
config: arm64-randconfig-003-20230926 (https://download.01.org/0day-ci/archive/20230927/202309271514.lkssAKag-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309271514.lkssAKag-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309271514.lkssAKag-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/soc/qcom/rpmh-rsc.c:695:1: warning: data definition has no type or storage class
     695 | arch_initcall(rpmh_driver_init);
         | ^~~~~~~~~~~~~
>> drivers/soc/qcom/rpmh-rsc.c:695:1: error: type defaults to 'int' in declaration of 'arch_initcall' [-Werror=implicit-int]
>> drivers/soc/qcom/rpmh-rsc.c:695:1: warning: parameter names (without types) in function declaration
>> drivers/soc/qcom/rpmh-rsc.c:697:16: error: expected declaration specifiers or '...' before string constant
     697 | MODULE_LICENSE("GPL v2");
         |                ^~~~~~~~
   drivers/soc/qcom/rpmh-rsc.c:698:20: error: expected declaration specifiers or '...' before string constant
     698 | MODULE_DESCRIPTION("Qualcomm RPM-Hardened (RPMH) Communication driver");
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soc/qcom/rpmh-rsc.c:691:19: warning: 'rpmh_driver_init' defined but not used [-Wunused-function]
     691 | static int __init rpmh_driver_init(void)
         |                   ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +695 drivers/soc/qcom/rpmh-rsc.c

658628e7ef78e8 Lina Iyer     2018-06-20  690  
658628e7ef78e8 Lina Iyer     2018-06-20 @691  static int __init rpmh_driver_init(void)
658628e7ef78e8 Lina Iyer     2018-06-20  692  {
658628e7ef78e8 Lina Iyer     2018-06-20  693  	return platform_driver_register(&rpmh_driver);
658628e7ef78e8 Lina Iyer     2018-06-20  694  }
658628e7ef78e8 Lina Iyer     2018-06-20 @695  arch_initcall(rpmh_driver_init);
1ee367d36875a2 Will McVicker 2020-02-10  696  
1ee367d36875a2 Will McVicker 2020-02-10 @697  MODULE_LICENSE("GPL v2");

:::::: The code at line 695 was first introduced by commit
:::::: 658628e7ef78e875cfe13064387c1a7a287d6338 drivers: qcom: rpmh-rsc: add RPMH controller for QCOM SoCs

:::::: TO: Lina Iyer <ilina@codeaurora.org>
:::::: CC: Andy Gross <andy.gross@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
