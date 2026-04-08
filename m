Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0412A325707
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Apr 2026 01:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775610529; cv=none; b=myB34IMdc8qNUcwfizbvKuBtFpsG7TUkvYlr0iLAfboYgt+skGJlXGOG9XNYMl7I7qeVx4UaHZ5MxLu4Q40K76bQc2ssyIWVXIhiCQUWRAk2/49ycVaBIT5zumJzmoa8uDUmbgNnppl4z3fBwdxeqCTeU9fAzmT9DRkk/kEC8FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775610529; c=relaxed/simple;
	bh=dRioC/WG6ULxNF7cuDlsOffKei5b+aBG8NhQnydDVEI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t90Lm8WDrqI0wBvbFLhRj1xyWOMalOzxx3+2yDj1nxiHY4YtrnjL6OPGE5GT7WWVSgexK9qQ+AjRNYeF3WNbQX6aydGyuc5XsaCQL8TIgPmgeso6b4arE0Es+SkEmbeeN0gVIFAJ0HNwnH3Jh2yw/jhDwzogc9Ty27fJe6Ywwfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PlRTzQop; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PlRTzQop"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775610527; x=1807146527;
  h=date:from:to:cc:subject:message-id;
  bh=dRioC/WG6ULxNF7cuDlsOffKei5b+aBG8NhQnydDVEI=;
  b=PlRTzQop0V/8lDQOKr0pv9dP51bPQHDW/BDQO6wKAsL52sq0ceFIbhRp
   jZ24yrT4Ahfj1X2V3aGTZrceG66I2Eb7giqdHznPIAPlUeFJLt8z9tQY6
   AkICGWRW7tID67F8Z11Qb+QfPBMO7O0xR4IjrQVPcOKHU6sED/mw3kfih
   jEuNc0MnlWnqWwDi7GbgWeBnIagdq6hC9hXj9Ctf7tQFvke8fU+ZzEq+1
   i33hovndu/mUfJxrtA9dHga+dDFCxz95J5HBZ4Arr5O6VvxHFTMwLAGza
   ewQBhdfv/C0lNNDgxjlIP1kNJxNx2mpseW49QaylhF/tC7rybvaxG9YuS
   Q==;
X-CSE-ConnectionGUID: Kg3Uyyo/T+WTwgi0xDIRtg==
X-CSE-MsgGUID: 4EgifZnERI+Zhf8vn8Eb9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="75622890"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="75622890"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 18:08:44 -0700
X-CSE-ConnectionGUID: PRwhmEeySNi2YazTyzHwyQ==
X-CSE-MsgGUID: Z8/FZ0JzQv2Nm2OEe3zyug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="232698547"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Apr 2026 18:08:40 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAHPG-000000001GZ-3ycj;
	Wed, 08 Apr 2026 01:08:34 +0000
Date: Wed, 08 Apr 2026 09:08:31 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linusw@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: [linux-next:master 12114/12445]
 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c:83:27: sparse: sparse: symbol
 'sdm670_lpi_pinctrl_groups' was not declared. Should it be static?
Message-ID: <202604080950.Mvm8aN0a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f3e6330d7fe42b204af05a2dbc68b379e0ad179e
commit: 9826035a75da609ac2424c97915d6fe5b836ee65 [12114/12445] pinctrl: qcom: add sdm670 lpi tlmm
config: hexagon-randconfig-r132-20260408 (https://download.01.org/0day-ci/archive/20260408/202604080950.Mvm8aN0a-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260408/202604080950.Mvm8aN0a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604080950.Mvm8aN0a-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c:83:27: sparse: sparse: symbol 'sdm670_lpi_pinctrl_groups' was not declared. Should it be static?
>> drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c:118:27: sparse: sparse: symbol 'sdm670_lpi_pinctrl_functions' was not declared. Should it be static?

vim +/sdm670_lpi_pinctrl_groups +83 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c

    82	
  > 83	const struct lpi_pingroup sdm670_lpi_pinctrl_groups[] = {
    84		LPI_PINGROUP(0, LPI_NO_SLEW, _, _, _, _),
    85		LPI_PINGROUP(1, LPI_NO_SLEW, _, _, _, _),
    86		LPI_PINGROUP(2, LPI_NO_SLEW, _, _, _, _),
    87		LPI_PINGROUP(3, LPI_NO_SLEW, _, _, _, _),
    88		LPI_PINGROUP(4, LPI_NO_SLEW, _, _, _, _),
    89		LPI_PINGROUP(5, LPI_NO_SLEW, _, _, _, _),
    90		LPI_PINGROUP(6, LPI_NO_SLEW, _, _, _, _),
    91		LPI_PINGROUP(7, LPI_NO_SLEW, _, _, _, _),
    92		LPI_PINGROUP(8, LPI_NO_SLEW, _, _, i2s1_clk, _),
    93		LPI_PINGROUP(9, LPI_NO_SLEW, _, _, i2s1_ws, _),
    94		LPI_PINGROUP(10, LPI_NO_SLEW, _, _, _, i2s1_data),
    95		LPI_PINGROUP(11, LPI_NO_SLEW, _, i2s1_data, _, _),
    96		LPI_PINGROUP(12, LPI_NO_SLEW, _, _, _, _),
    97		LPI_PINGROUP(13, LPI_NO_SLEW, _, _, _, _),
    98		LPI_PINGROUP(14, LPI_NO_SLEW, _, _, _, _),
    99		LPI_PINGROUP(15, LPI_NO_SLEW, _, _, _, _),
   100		LPI_PINGROUP(16, LPI_NO_SLEW, _, _, _, _),
   101		LPI_PINGROUP(17, LPI_NO_SLEW, _, _, _, _),
   102		LPI_PINGROUP(18, LPI_NO_SLEW, _, slimbus_clk, _, _),
   103		LPI_PINGROUP(19, LPI_NO_SLEW, mclk0, _, pdm_sync, _),
   104		LPI_PINGROUP(20, LPI_NO_SLEW, _, pdm_tx, _, _),
   105		LPI_PINGROUP(21, LPI_NO_SLEW, _, pdm_rx, _, _),
   106		LPI_PINGROUP(22, LPI_NO_SLEW, _, comp_rx, _, _),
   107		LPI_PINGROUP(23, LPI_NO_SLEW, pdm_rx, _, _, _),
   108		LPI_PINGROUP(24, LPI_NO_SLEW, comp_rx, _, _, _),
   109		LPI_PINGROUP(25, LPI_NO_SLEW, pdm_rx, _, _, _),
   110		LPI_PINGROUP(26, LPI_NO_SLEW, dmic1_clk, _, _, _),
   111		LPI_PINGROUP(27, LPI_NO_SLEW, dmic1_data, _, _, _),
   112		LPI_PINGROUP(28, LPI_NO_SLEW, dmic2_clk, _, _, _),
   113		LPI_PINGROUP(29, LPI_NO_SLEW, dmic2_data, lpi_cdc_rst, _, _),
   114		LPI_PINGROUP(30, LPI_NO_SLEW, _, _, _, _),
   115		LPI_PINGROUP(31, LPI_NO_SLEW, _, _, _, _),
   116	};
   117	
 > 118	const struct lpi_function sdm670_lpi_pinctrl_functions[] = {
   119		LPI_FUNCTION(comp_rx),
   120		LPI_FUNCTION(dmic1_clk),
   121		LPI_FUNCTION(dmic1_data),
   122		LPI_FUNCTION(dmic2_clk),
   123		LPI_FUNCTION(dmic2_data),
   124		LPI_FUNCTION(i2s1_clk),
   125		LPI_FUNCTION(i2s1_data),
   126		LPI_FUNCTION(i2s1_ws),
   127		LPI_FUNCTION(lpi_cdc_rst),
   128		LPI_FUNCTION(mclk0),
   129		LPI_FUNCTION(pdm_tx),
   130		LPI_FUNCTION(pdm_rx),
   131		LPI_FUNCTION(pdm_sync),
   132		LPI_FUNCTION(slimbus_clk),
   133	};
   134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
