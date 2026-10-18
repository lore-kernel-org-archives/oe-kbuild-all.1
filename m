Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1BC3AAF7D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 07:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309959; cv=none; b=lwOgn45VpOlfd66zlGqRiKyseSF/H/JJzpXtoqg5+xRJUiqtE5/+18/0rq1ovTVTvzCqi2+GkvQjp93v7PbLGTeb418i0h5zDxs6ezweqSMfdsVcgAzXws9v7KUUla6s/1z2AmivOF3LSByh108YpR6Dqsej42FqTW66ASJsrnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309959; c=relaxed/simple;
	bh=VBE1Hyy6KUhu4Mi2xRKlY6XsurwO6n40UNvdOh0obVY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HunxoVLkIiyIqB/ediXYrl7w2T2OLngKvMgd1l9uBt8YD0JPY2rd34lx/2FOGv+tE81evYkdlZ//wXkvFaXjDU45eMS8a5YCpL9dM301XdLF/P68VZEkgOdDVllKPqseE3k/1m0O0V17RkqWoPcEvneD1qwDvvvgpSQ9TqWEy0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fs9ATZmU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fs9ATZmU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309958; x=1823845958;
  h=date:from:to:cc:subject:message-id;
  bh=VBE1Hyy6KUhu4Mi2xRKlY6XsurwO6n40UNvdOh0obVY=;
  b=Fs9ATZmU9wkNymm3XmylEZSalfV8xqFxxvdsmZlEbzEW1IJiy4nPwSo1
   PzGbPxrZR6mbodkW+Xe5gHZXWePbctmOw+0Mxfk9V7T2/WKFheiwN8pcu
   CzbPPfKcfbLoB+hf9c+bQ5AS+PcZOhdDsSVKDT1+D0Me13t7qdaYNOsez
   Nuik3709wnyT4etcU/ZIDEI3ol2XUYeX+u1OT0bHPNErU/fkwhS5tDu4z
   AARZSqz8rUZ8+p006sHzm0fogyrQ+NYuvNrIBf7Peaxz0SpSPVQAJPVsG
   PrRzmkxEmAdHgJeYwWCaUgAjw83ySJVRGiniwtvuRRScTyl3fiBSCMEgM
   A==;
X-CSE-ConnectionGUID: mEvc6AS0Rj+Xs9qokAQVhA==
X-CSE-MsgGUID: wsDBM8B1Ri+8UfJXtbFcKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="916667"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="916667"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:35 -0700
X-CSE-ConnectionGUID: tGTvIP6KRg2TTOzAF6yCCg==
X-CSE-MsgGUID: NDLUGUpVQvOrvGvk89T6hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2340768"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Oct 2026 00:52:33 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh1-000000004vD-2CaI;
	Sun, 18 Oct 2026 07:52:31 +0000
Date: Sun, 18 Oct 2026 09:45:59 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c:79:27: sparse: sparse: symbol
 'sdm660_lpi_pinctrl_groups' was not declared. Should it be static?
Message-ID: <202610170505.0vOZylzC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   71bd2db0951fc7ded4efe2073ae4bad4d668c56a
commit: 5e302106099efc8a309d92ad84cb37d35d6c3775 [1/1] pinctrl: qcom: Add SDM660 LPASS LPI TLMM
config: arm-randconfig-r2306-20261017 (https://download.01.org/0day-ci/archive/20261017/202610170505.0vOZylzC-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8a679464f19c426ef76aad9f4587b703dd3e584d)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610170505.0vOZylzC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5e302106099e ("pinctrl: qcom: Add SDM660 LPASS LPI TLMM")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610170505.0vOZylzC-lkp@intel.com/

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
