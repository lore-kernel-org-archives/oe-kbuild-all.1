Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E35E1CCB21
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733059282; cv=none; b=DLKicjiwv/ThEoFluq/RJ/myoNYpQ7aovsM1F5jfa1OeNCL9TfOFQDcqOonSRt8B91pkr6XGyQnmlz1yL3Wj4FnOWG2q4/GEyU6V8ESJ9jBzwXKYJk1nM3tatw5yjz7+U5rqxCW66qDeQmnsYxSQm9vNQCRT9o424qJYsOv3nAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733059282; c=relaxed/simple;
	bh=4HzVG2APNFbZzIhrPrEoGQJFfN4YL1f9XxGrNipvgBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SOoibN34Njvf+ZSkICzqYMuJSjF5azG0JWiBt4vcLU7vbXsfslxpnPoAyXE1FiIzqT8F4jGJOK/gHGA7h1YXt/hrI5EGKIAwqgxZr0YPZVCn83bvL+dHnmcAriE1SZaN/lXd5SzJ7bxhgWXItvWhRg+9T4gOzw1k/yCiTi0dBVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lqSIq/+G; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lqSIq/+G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733059281; x=1764595281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4HzVG2APNFbZzIhrPrEoGQJFfN4YL1f9XxGrNipvgBw=;
  b=lqSIq/+G0oXn/7B6kIBBHXah/d8VXI0m+txSO8uSZLY7A5ePHAYCCFc4
   LuOa+eoJJSZJINWiZTS+PiyWCHeVrC+Zo7yjDtxU36uJrO1mf+WoCkwPJ
   wH71kW1fs1zF3KZnXffdIN5T6DJZ8+nZKRbG5+vXt3c7cYO6n7SiB2YqM
   thRCehcxR8QTC58wklehAW7G4bB9C6I4CGD/A1+bT79WcxLaddX01TSao
   PJLpgTKT09SOLBIpz+8NQs4XbEfneBLotEi0mgFtCVyE0G1XP38TK7PD4
   3xxmxGYHJSSa1K+WJZ6QCA0WrVBfL9V6scCtNyHymraEoJd1jupdI602z
   A==;
X-CSE-ConnectionGUID: iVLY9KanRV+8HNks9skn5g==
X-CSE-MsgGUID: KFh7g2ZXSii+29dF79nmBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="58624345"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="58624345"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 05:21:20 -0800
X-CSE-ConnectionGUID: t0qFw5FPSe+hGG7FbPYpdw==
X-CSE-MsgGUID: R6a2D0DZQ6mHlDQTetWrWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="97895468"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 01 Dec 2024 05:21:18 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHjsy-0001YH-0g;
	Sun, 01 Dec 2024 13:21:16 +0000
Date: Sun, 1 Dec 2024 21:20:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 9928/30000]
 drivers/soc/qcom/rpmh-rsc.c:695:15: error: a parameter list without types is
 only allowed in a function definition
Message-ID: <202412012138.D1eZECA8-lkp@intel.com>
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
head:   4f94b88d7d8730cd7b1adbb86d4ceef639a7c1f9
commit: 1ee367d36875a25c92ae7bb66d4b6f25f0d386d5 [9928/30000] ANDROID: GKI: drivers: qcom: rpmh-rsc: Add tristate support for qcom,rpmh-rsc driver
config: x86_64-buildonly-randconfig-004-20240416 (https://download.01.org/0day-ci/archive/20241201/202412012138.D1eZECA8-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412012138.D1eZECA8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412012138.D1eZECA8-lkp@intel.com/

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
