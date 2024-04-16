Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D255EEB7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 08:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713257046; cv=none; b=iVsjl/GUXrwpssmep9zu/XwUUm7ymkLNHw5UgR4Owp6dfEPkNZiFtv9v3xhHU0bfbIA5x4NBWshQrKWxPA8ERyKG6ydZ08dlB65319PHNSx9gs6rR82MLFPaJPnjBm/POUNv/JgmF46bBBmSlz1yYC6d2jk6ti22naEk9G3T64A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713257046; c=relaxed/simple;
	bh=eLB03PV3Ev6Di01hPrzR4iUtSGG8hI62N65YLQp33DM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G7uLNFcj16VSFi0ek6QSf+8q66MwadrpzLXA++3jJbyetTIN7PfexXc0BoYGDZQAMaXRygUDQVPAQMcTevH+x204ifsEPXlsYhdy+8SyHsNhybwOCG8UfhwVtVSN1Nszc6f4S2bMhM7gUFL2ZJbDomrXHH4q4SPQX73deJen4sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T58VQtLP; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T58VQtLP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713257045; x=1744793045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eLB03PV3Ev6Di01hPrzR4iUtSGG8hI62N65YLQp33DM=;
  b=T58VQtLPEgNtmnIPDz6/RWu/ARKAi0rsWPKV+Fj9eRx/8kfNhkE7CxvP
   QOFdkbfepDL6q9yJOjLheWvKxx8g/KjxOV22WUneD88hCwnqv6e1dZOY3
   +EnpZRZV/3mwn72JyF8EDAFHquJgBk4yCZPDZT8FhGFGq+sWWQb0/RTp0
   1sDXnG/OjdTW51UmFDXrsoVxW4NAmeQ8b1M8QVYuIHFYNKoDz4UAphoOG
   GBHfnc+nR3HH1/Lb5tQcd0ZFOP7EmFLPNVIDv7RPESRNzixhGPctgVLQI
   bixMBYCK+7kag+kZ+COSLV8uKA2rlxW3JXIaCodmKKTpG1JzmLPRoef+u
   A==;
X-CSE-ConnectionGUID: 2L6zmJt4RZG3MxAmqt2c2Q==
X-CSE-MsgGUID: Ogel+2apRX270GS/X8+7kA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8601710"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8601710"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 01:44:05 -0700
X-CSE-ConnectionGUID: SEZZ1DA8SFO2W0VFug3QSQ==
X-CSE-MsgGUID: l15q7Jo4QKG/kQdjZe7zzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="22779053"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 16 Apr 2024 01:44:04 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rweQ5-00054m-0L;
	Tue, 16 Apr 2024 08:44:01 +0000
Date: Tue, 16 Apr 2024 16:43:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 11709/30000]
 drivers/soc/qcom/rpmh-rsc.c:695:15: error: a parameter list without types is
 only allowed in a function definition
Message-ID: <202404161607.7rqyeNik-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   1d2ccd15e99ca276aa87a43300b0a81856b2f621
commit: 1ee367d36875a25c92ae7bb66d4b6f25f0d386d5 [11709/30000] ANDROID: GKI: drivers: qcom: rpmh-rsc: Add tristate support for qcom,rpmh-rsc driver
config: x86_64-buildonly-randconfig-004-20240416 (https://download.01.org/0day-ci/archive/20240416/202404161607.7rqyeNik-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404161607.7rqyeNik-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404161607.7rqyeNik-lkp@intel.com/

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
