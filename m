Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B611233D6D6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 23:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790205414; cv=none; b=u68gROPE/zlMqfMyr15dizFF0HzqrhDWOlTdmYEk8iDEVCfV/tRhWJ1JqfUkxPdsgYdZEhx98rZgo4vmfkXsdg3HmjCmqHg6axDy/NVqGwrb5SErlBImq4/RIY/C08/YxceS5kXQWVG+OOl4hLJVqYSH7yxAHvb1BIXHBSUFRvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790205414; c=relaxed/simple;
	bh=KV+rMDaF2fP0KmaoMOGig6kBWKI44EGJ42EmjXN27pE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y5HVq8k60hvI9RtrHQEOW7OGjvg0HZmUzbQij2J3UqatLqyx9bWf/Kckzj2HZyOtKLjQoPw44znTg8A/Xx3jjh7FjWB+ApF3YP3lnPQv/pKOp9V3v1YaWkMmnEvULsmE9ubXUdNvqbEi6grVRXx6ILaDMgiXmb+jDCA1Jdy9/H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bnJRAEH8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bnJRAEH8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790205413; x=1821741413;
  h=date:from:to:cc:subject:message-id;
  bh=KV+rMDaF2fP0KmaoMOGig6kBWKI44EGJ42EmjXN27pE=;
  b=bnJRAEH8hrsCXK5ZMA6YE4wadavXP9naj1eRVfaTYAauafFr0CKn8i/X
   hPxdHA11Zntz4bAvyCQDcWlOJx15fvNlSvhLg0NaMkWTMDEEBJgwnIr6O
   DsEeRpiS6YudZAQ249T6p5EflMaT8QMbgI6FW1Oc0hwyyxVkxKVRnKWi9
   AYpRNmrVrlmBIBYSqrP442RjqnLCSmVdC5Da5lmR1bWBL9FtJfUR4XruO
   wBPVDNpkdmiAzIj5PNoya9Z3PNyfZ5ED3wYIzNiOEmE2beoyh+pNXdJer
   P2MsCiJ7ks/PrLrLKO/H5PF5NueBPUMA14pucsRxbXMwbgbjLLxa2jCmv
   w==;
X-CSE-ConnectionGUID: FPzYRHYRRZO9z0oFi87sGw==
X-CSE-MsgGUID: t2sZ/DeJSr+IK8rFXWh7qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="116476148"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="116476148"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 16:16:52 -0700
X-CSE-ConnectionGUID: ZKNCErnaRxurgdlALmeYQA==
X-CSE-MsgGUID: qQQUmG8oTSmJj1jPcHniqw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Sep 2026 16:16:50 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9WCl-00000000Hwe-40pC;
	Wed, 23 Sep 2026 23:16:47 +0000
Date: Thu, 24 Sep 2026 07:16:43 +0800
From: kernel test robot <lkp@intel.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [linux-next:master 1663/8910]
 drivers/soc/qcom/socinfo.c:25:27: error: 'QCOM_ID_SM7250' undeclared here
 (not in a function); did you mean 'QCOM_ID_SM7750'?
Message-ID: <202609240715.gpsuNHCe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a8c591ed6b672915e0be57843f943a2a723aff40
commit: aa186658b79e993365b4b2153813474d8b928da1 [1663/8910] soc: qcom: socinfo: Add SM7250 SoC ID
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260924/202609240715.gpsuNHCe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609240715.gpsuNHCe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609240715.gpsuNHCe-lkp@intel.com/

Note: the linux-next/master HEAD a8c591ed6b672915e0be57843f943a2a723aff40 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/soc/qcom/socinfo.c:25:27: error: 'QCOM_ID_SM7250' undeclared here (not in a function); did you mean 'QCOM_ID_SM7750'?
      25 | #define qcom_board_id(id) QCOM_ID_ ## id, __stringify(id)
         |                           ^~~~~~~~
   drivers/soc/qcom/socinfo.c:453:11: note: in expansion of macro 'qcom_board_id'
     453 |         { qcom_board_id(SM7250) },
         |           ^~~~~~~~~~~~~


vim +25 drivers/soc/qcom/socinfo.c

34ec89e68db268 Krzysztof Kozlowski 2022-08-30  23  
34ec89e68db268 Krzysztof Kozlowski 2022-08-30  24  /* Helper macros to create soc_id table */
34ec89e68db268 Krzysztof Kozlowski 2022-08-30 @25  #define qcom_board_id(id) QCOM_ID_ ## id, __stringify(id)
34ec89e68db268 Krzysztof Kozlowski 2022-08-30  26  #define qcom_board_id_named(id, name) QCOM_ID_ ## id, (name)
34ec89e68db268 Krzysztof Kozlowski 2022-08-30  27  

:::::: The code at line 25 was first introduced by commit
:::::: 34ec89e68db2682469a9a51d9ed4022ee3992389 soc: qcom: socinfo: create soc_id table from bindings

:::::: TO: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
:::::: CC: Bjorn Andersson <andersson@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
