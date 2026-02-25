Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890263859C8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 23:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772063456; cv=none; b=L6bXaszsXyP1W5TnNufpg6/deXAs++PfasvMG+WoHGkiu169jC9TJGteUEWvucaTmLUkMN4SnVeTPQlxvzab63/yskl19GtAYnqns6ABM4XAfyJi8RIj1eBptyZxvk5G+6P7EktV8fH4fe++GiEgLyx2pcYbUzgnL89fyczzjJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772063456; c=relaxed/simple;
	bh=Kmrmr/w0DW94NSNwO8lR+Qt9k5CiwqCoLvdiDGWbDQU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gHEw+mRBu7CjCe2Lm91Fj7Sr5FMyRAnvRine4Mg9F/mWZC1K1s+mjZFPkWzfRMnyRTHoH1PM8afKLWfuHu4lP4BVHQ1QkWYArpILfw/mWw6ZckKKW7CM8mwl1Eg+Wv+/2LoMMu4ZACPmASTjoS3wyVPCQEkq7okqTGwhqR1Qc00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GhGtLxL2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GhGtLxL2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772063456; x=1803599456;
  h=date:from:to:cc:subject:message-id;
  bh=Kmrmr/w0DW94NSNwO8lR+Qt9k5CiwqCoLvdiDGWbDQU=;
  b=GhGtLxL2KKkZSyyn+XDlY9GIwQnKksjQmVNwVAoFsqtMjKRVNjBRe5qT
   wvRzUZFZiwfxOGFR+lWc6aW/MFXD1Skkr8SY9kxd6zm3Ki8WIz/LOTqsX
   /KAq5UO607yUe/6HcHoQqlxI/Zy8ak1HApsllatEQQcrB2VzbU6RuuvFD
   dt2NGYcA9oePqYCV4tzSAtI6mCZoqx+4kiJIy31I4TpG2ZIA2tpUhIE1a
   ZzkvUJbG34mZ/78FAtimFdsqycM76/nvx9vGaMe0fxfvjDrwnT5HWGbht
   TF+NN6UQ9yUpPfh7dyxdekFB/dMGtsxqfBH9xrJXQEgbFGZ8vtfH8NDw1
   A==;
X-CSE-ConnectionGUID: 9GZEWhyJQsSwNSofJz8pCA==
X-CSE-MsgGUID: QRmw7N/TSIimXadopf+F7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="90697494"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="90697494"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 15:50:52 -0800
X-CSE-ConnectionGUID: O/FhWl/QQ8+099q1/sWCMA==
X-CSE-MsgGUID: cRVsSfg6QaaE8HobvzxDkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="221010328"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Feb 2026 15:50:50 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvOeW-000000007g9-1QoB;
	Wed, 25 Feb 2026 23:50:48 +0000
Date: Thu, 26 Feb 2026 07:50:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-laj 1/1]
 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c:79:27: sparse: sparse: symbol
 'sdm660_lpi_pinctrl_groups' was not declared. Should it be static?
Message-ID: <202602260746.mZqLL1Y6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-laj
head:   43e1836e89aeef0247fa0ff6ae336dd6c7774421
commit: 5e302106099efc8a309d92ad84cb37d35d6c3775 [1/1] pinctrl: qcom: Add SDM660 LPASS LPI TLMM
config: arm64-randconfig-r123-20260225 (https://download.01.org/0day-ci/archive/20260226/202602260746.mZqLL1Y6-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602260746.mZqLL1Y6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602260746.mZqLL1Y6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c:79:27: sparse: sparse: symbol 'sdm660_lpi_pinctrl_groups' was not declared. Should it be static?
   drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c:116:27: sparse: sparse: symbol 'sdm660_lpi_pinctrl_functions' was not declared. Should it be static?

vim +/sdm660_lpi_pinctrl_groups +79 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
