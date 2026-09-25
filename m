Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2167C4AB1CD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 14:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790346757; cv=none; b=sVmDbUkSSfAdCMZsy2s0fiSp4El1Zw8NL9twc0tcu9KAXRmAOJxqmfmTN90j7Tl6ePRxmMIpttpF8PBpTBf7k/weLZ/F7G9McfngYqiZWN9yLvY+kPRK9eCLhkSHugyv/9KreMdcTNVRlLaRCNDBYAam3XCIW10qV2xRtG/hQDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790346757; c=relaxed/simple;
	bh=KM/R+iLp3cW4R/VJXiddMItya1bSiiejP2+LNixUXjU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LLOOfCPa46tF70pvtY2M8emy88JOeSy9xGyf/+yfTx30SjMgDt3grj2DtmCDRfNrs+aozyfTQ8FHodxaJwm/Qxt4LapsyxPsDXXTI1GGsBaP2mCluIA/NypkkYqyBSujg4LIe1yLQn1wj6hNcciN2gxRZ9GUpGtihjBC8OvxDCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BHqHhwn9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BHqHhwn9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790346749; x=1821882749;
  h=date:from:to:cc:subject:message-id;
  bh=KM/R+iLp3cW4R/VJXiddMItya1bSiiejP2+LNixUXjU=;
  b=BHqHhwn9zu/eFp0Ds3n+dSBKAbDXBx13SEZGSzoYGrC108puooTx7n95
   RuPWyHxocLc2tqy8VrzojdaO1tfhL7UXjMPFGzvhDKS0eLus2b+IRVwXz
   XGnFTvZoJi7Z+94ePMnZ6hzF7+d6vzx/L4TmWVp83c6oz+qLk8Bo/Wlb/
   2twewh+8BXOtLRjYOxAjptE6GStd90KNblPJa5imUbpj1luK+htYm5Q2+
   ZdGABEzFe8+bURJhmcjmB1F8jDHavMRycz09SGPn9+Ex2LoGPPbUrFwoa
   WWkrJjHMr7Y1yGclQrV/cCeSbUb7cEkNEbiOiwLxPzAiCK5Q7tYuyP4fh
   Q==;
X-CSE-ConnectionGUID: fz7kWgH3RzmD2taJi/LeQw==
X-CSE-MsgGUID: Ag+WX2hcRaeuNaZAXCvZTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="93850654"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="93850654"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 07:32:26 -0700
X-CSE-ConnectionGUID: n88IMel7QUeJaYiiTKAZNg==
X-CSE-MsgGUID: 1FAUY7kQROuwk/yDfjEnTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="300624217"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Sep 2026 07:32:25 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA6yM-00000000Kl5-3Bj3;
	Fri, 25 Sep 2026 14:32:22 +0000
Date: Fri, 25 Sep 2026 22:31:31 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>
Subject: [qcom:drivers-for-7.4 34/34]
 drivers/soc/qcom/socinfo.c:25:27: error: 'QCOM_ID_SM8975' undeclared here
 (not in a function); did you mean 'QCOM_ID_SM8475'?
Message-ID: <202609252200.DF4SMiIa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux drivers-for-7.4
head:   f255e2055701285d6b5f11d2a6facc6614c51ed7
commit: f255e2055701285d6b5f11d2a6facc6614c51ed7 [34/34] soc: qcom: socinfo: Add SM8975 SoC ID
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260925/202609252200.DF4SMiIa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609252200.DF4SMiIa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609252200.DF4SMiIa-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/qcom/socinfo.c:25:27: error: 'QCOM_ID_SM7250' undeclared here (not in a function); did you mean 'QCOM_ID_SM7750'?
      25 | #define qcom_board_id(id) QCOM_ID_ ## id, __stringify(id)
         |                           ^~~~~~~~
   drivers/soc/qcom/socinfo.c:453:11: note: in expansion of macro 'qcom_board_id'
     453 |         { qcom_board_id(SM7250) },
         |           ^~~~~~~~~~~~~
>> drivers/soc/qcom/socinfo.c:25:27: error: 'QCOM_ID_SM8975' undeclared here (not in a function); did you mean 'QCOM_ID_SM8475'?
      25 | #define qcom_board_id(id) QCOM_ID_ ## id, __stringify(id)
         |                           ^~~~~~~~
   drivers/soc/qcom/socinfo.c:545:11: note: in expansion of macro 'qcom_board_id'
     545 |         { qcom_board_id(SM8975) },
         |           ^~~~~~~~~~~~~


vim +25 drivers/soc/qcom/socinfo.c

34ec89e68db2682 Krzysztof Kozlowski 2022-08-30  23  
34ec89e68db2682 Krzysztof Kozlowski 2022-08-30  24  /* Helper macros to create soc_id table */
34ec89e68db2682 Krzysztof Kozlowski 2022-08-30 @25  #define qcom_board_id(id) QCOM_ID_ ## id, __stringify(id)
34ec89e68db2682 Krzysztof Kozlowski 2022-08-30  26  #define qcom_board_id_named(id, name) QCOM_ID_ ## id, (name)
34ec89e68db2682 Krzysztof Kozlowski 2022-08-30  27  

:::::: The code at line 25 was first introduced by commit
:::::: 34ec89e68db2682469a9a51d9ed4022ee3992389 soc: qcom: socinfo: create soc_id table from bindings

:::::: TO: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
:::::: CC: Bjorn Andersson <andersson@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
