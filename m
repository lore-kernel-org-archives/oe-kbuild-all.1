Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793848882;
	b=BxdBSVOabJ3BiXOxLOx3ymvxDLEM4uROURzx11ITfFzxNlFyRd5G58FmWlfLbnRKtAC6
	 ga7fedlZb4qciErkqYfp6AlcOQPrtm4k1bbVLULHn2Z2xjFEXxrKw/QLitDKeFeRllzqW
	 QVC9+/MnIfx28GUrvXidzCFl1cOPUzLYlOXZSBkdGPV5q8uWLbuFylL1hkXXNWsg/yY22
	 aDu2FKoscxj4DIfAOw4d4m+YreX8cTETtO/r0XjxD56dpJq7q6uAe+88Y0PcevVWwlzxe
	 CzNC6wAy2+KlzACaL7ZTUtdvoi6Fl9Aktom9NpIUtCPIHCb9Mk4HVD6377mlsUv1yiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793848882;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=iIX7GzaAgWUJp+IVqUduB6pnGdrSTHVPsaI42s+Tr3I=;
	b=gUzZVkI6fFXKeFB0fA0U+YP2XfAusDbhrV02la++uvVV9rWW3mAYLg3BgrUyshG3+yP1
	 a66dHW5+3QAgw6W6C/MzruAQqWheag3VFTvlq5RTpYGrI3WRs8tna65NenqBDAorFUcof
	 YHGEvefKBznBXQHFvUJUNjG8h5/twKWdyMKUpSF8v/cgI6A5yKZRR8cmZ4ZaPBVO7z7bN
	 V1Yq8fKBvMe2cZpwxj/iDlAv8zRQuoV0cvJ8YCNn0XYK2qbw9PUKxpTwOflw1YSrjGXlG
	 a8beMiYwuBZgtWQYwbfphHHEydeJ71M/fq4bgNWUk26FYtM7hpiHAkbNEOXFuZ/LV1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lqnKs8W2;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3D1606A328
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 03:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E3D1606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lqnKs8W2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793848881; x=1825384881;
  h=date:from:to:cc:subject:message-id;
  bh=N4dgJiUlrv72T78fqN5+yHJUMS/obMM+eLRL9fqnv4I=;
  b=lqnKs8W2E/2ndKQCcO5W5cqQNOUkrpOxHa7/5sHnUo1WLkdIqUmQkFLc
   gaDcYoSYeEjozOsu3rYwC3MaGHN6lN81LFLoXpqF0JftW93aTFVKUNlrv
   +LiyXh++XCv3em1FFN+/18adGc1cdrUMjbnEbBv0/JOai8/JQggo83aDm
   cVxsvk38ugekrMUVkU5xOgNwiZbZ2RNvzf/YoEHJeIUowTNp2TWBTm6Zj
   TYjJUCc0mg2m/KGrWKUrpWelB/AF9acc2/4v08c6chKNFb6FMWQMU8jhj
   Hc+a1HtRhIV89QO/NVccjqpoRajtZbNLi2WYGIInk1mW3l6c8/1v+paeq
   w==;
X-CSE-ConnectionGUID: OQi/F9VZQgeTWr6lVW8baA==
X-CSE-MsgGUID: xmmiMjuuTMO5HTRRRdb64Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2617924"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2617924"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 19:21:18 -0800
X-CSE-ConnectionGUID: V8tcOBAMTKyFS61hHO9o8w==
X-CSE-MsgGUID: TJNngSxGThOc5GPYhcwE0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7236304"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 04 Nov 2026 19:21:16 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOo2L-000000009Tf-49bP;
	Thu, 05 Nov 2026 03:21:14 +0000
Date: Thu, 05 Nov 2026 04:20:54 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c:116:27: sparse: sparse:
 symbol 'sdm660_lpi_pinctrl_functions' was not declared. Should it be static?
Message-ID: <202611050459.vhOTZoAs-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   e1b556eb2d11c07ede833cd0a20d9b02914dec3c
commit: 5e302106099efc8a309d92ad84cb37d35d6c3775 [1/1] pinctrl: qcom: Add SDM660 LPASS LPI TLMM
config: arm-randconfig-r2307-20261104 (https://download.01.org/0day-ci/archive/20261105/202611050459.vhOTZoAs-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project e2e3d6c39cfebec9eace23629a5a103df2c79ba6)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050459.vhOTZoAs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5e302106099e ("pinctrl: qcom: Add SDM660 LPASS LPI TLMM")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611050459.vhOTZoAs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c:79:27: sparse: sparse: symbol 'sdm660_lpi_pinctrl_groups' was not declared. Should it be static?
>> drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c:116:27: sparse: sparse: symbol 'sdm660_lpi_pinctrl_functions' was not declared. Should it be static?

vim +/sdm660_lpi_pinctrl_functions +116 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c

    78	
  > 79	const struct lpi_pingroup sdm660_lpi_pinctrl_groups[] = {
    80		LPI_PINGROUP_OFFSET(0, LPI_NO_SLEW, _, _, _, _, 0x0000),
    81		LPI_PINGROUP_OFFSET(1, LPI_NO_SLEW, _, _, _, _, 0x1000),
    82		LPI_PINGROUP_OFFSET(2, LPI_NO_SLEW, _, _, _, _, 0x2000),
    83		LPI_PINGROUP_OFFSET(3, LPI_NO_SLEW, _, _, _, _, 0x2010),
    84		LPI_PINGROUP_OFFSET(4, LPI_NO_SLEW, _, _, _, _, 0x3000),
    85		LPI_PINGROUP_OFFSET(5, LPI_NO_SLEW, _, _, _, _, 0x3010),
    86		LPI_PINGROUP_OFFSET(6, LPI_NO_SLEW, _, _, _, _, 0x4000),
    87		LPI_PINGROUP_OFFSET(7, LPI_NO_SLEW, _, _, _, _, 0x4010),
    88		LPI_PINGROUP_OFFSET(8, LPI_NO_SLEW, _, _, _, _, 0x5000),
    89		LPI_PINGROUP_OFFSET(9, LPI_NO_SLEW, _, _, _, _, 0x5010),
    90		LPI_PINGROUP_OFFSET(10, LPI_NO_SLEW, _, _, _, _, 0x5020),
    91		LPI_PINGROUP_OFFSET(11, LPI_NO_SLEW, _, _, _, _, 0x5030),
    92		LPI_PINGROUP_OFFSET(12, LPI_NO_SLEW, _, _, _, _, 0x6000),
    93		LPI_PINGROUP_OFFSET(13, LPI_NO_SLEW, _, _, _, _, 0x6010),
    94		LPI_PINGROUP_OFFSET(14, LPI_NO_SLEW, _, _, _, _, 0x7000),
    95		LPI_PINGROUP_OFFSET(15, LPI_NO_SLEW, _, _, _, _, 0x7010),
    96		LPI_PINGROUP_OFFSET(16, LPI_NO_SLEW, _, _, _, _, 0x5040),
    97		LPI_PINGROUP_OFFSET(17, LPI_NO_SLEW, _, _, _, _, 0x5050),
    98	
    99		LPI_PINGROUP_OFFSET(18, LPI_NO_SLEW, pdm_clk, mclk0, _, _, 0x8000),
   100		LPI_PINGROUP_OFFSET(19, LPI_NO_SLEW, pdm_sync, _, _, _, 0x8010),
   101		LPI_PINGROUP_OFFSET(20, LPI_NO_SLEW, pdm_tx, _, _, _, 0x8020),
   102		LPI_PINGROUP_OFFSET(21, LPI_NO_SLEW, pdm_rx, _, _, _, 0x8030),
   103		LPI_PINGROUP_OFFSET(22, LPI_NO_SLEW, comp_rx, _, _, _, 0x8040),
   104		LPI_PINGROUP_OFFSET(23, LPI_NO_SLEW, pdm_rx, _, _, _, 0x8050),
   105		LPI_PINGROUP_OFFSET(24, LPI_NO_SLEW, comp_rx, _, _, _, 0x8060),
   106		LPI_PINGROUP_OFFSET(25, LPI_NO_SLEW, pdm_rx, _, _, _, 0x8070),
   107		LPI_PINGROUP_OFFSET(26, LPI_NO_SLEW, dmic1_clk, _, _, _, 0x9000),
   108		LPI_PINGROUP_OFFSET(27, LPI_NO_SLEW, dmic1_data, _, _, _, 0x9010),
   109		LPI_PINGROUP_OFFSET(28, LPI_NO_SLEW, dmic2_clk, _, _, _, 0xa000),
   110		LPI_PINGROUP_OFFSET(29, LPI_NO_SLEW, dmic2_data, _, _, _, 0xa010),
   111	
   112		LPI_PINGROUP_OFFSET(30, LPI_NO_SLEW, _, _, _, _, 0xb000),
   113		LPI_PINGROUP_OFFSET(31, LPI_NO_SLEW, _, _, _, _, 0xb010),
   114	};
   115	
 > 116	const struct lpi_function sdm660_lpi_pinctrl_functions[] = {
   117		LPI_FUNCTION(comp_rx),
   118		LPI_FUNCTION(dmic1_clk),
   119		LPI_FUNCTION(dmic1_data),
   120		LPI_FUNCTION(dmic2_clk),
   121		LPI_FUNCTION(dmic2_data),
   122		LPI_FUNCTION(mclk0),
   123		LPI_FUNCTION(pdm_tx),
   124		LPI_FUNCTION(pdm_clk),
   125		LPI_FUNCTION(pdm_rx),
   126		LPI_FUNCTION(pdm_sync),
   127	};
   128	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
