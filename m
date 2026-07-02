Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED1F4A3413
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 13:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783000438; cv=none; b=Ku4CZ3LvpCKrVpok4MPlxHJct9zSEwcyhnf4FyRPrg17ymmZ0jriDz3FqD4NCTqQV0OyXPnLXKL0tHZV8loslcvqDZUWYVgU4/Bj4RDPiBJ2lb7Jtb7naIl88LwcUeQE1mDSJdURK2SplcJ1JQ2M6A/y+hrSlIszvGQ1aGNqAIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783000438; c=relaxed/simple;
	bh=KinMUA8Xeb4i7oyg5i48lGgb5numAPrP3s7keIiUzLg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CXlSMxAqXcmHwjkaoNqtEGjq7n62jft/3jlbifWhWARJjUdqWktWiL5m1qo9/V7gBpwpkxAuATP6fcZ2S0+k6NFep8K5idvZW3MLqCZPMNAqn05z5b9NAYEsT0gZR/7HJ2qWCEcUbtLqGK6rbH9/Y6uAMOTsOsK1HwlqQPCbtgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DjKMOlFE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DjKMOlFE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783000436; x=1814536436;
  h=date:from:to:cc:subject:message-id;
  bh=KinMUA8Xeb4i7oyg5i48lGgb5numAPrP3s7keIiUzLg=;
  b=DjKMOlFEHv94UCs+Ynj+i6w7uTYzvBcgOi8rBat+orzsuxR7S9q9/9jO
   0vilMkvkvtGoPaGloPRfJZkL/oMYehRhLRbJ4a8SxODiWOKW3IZQXG+Tl
   QqSLdwX9tAO/7KtbQ8n5aGaAUarHGwNxJJyvjzUuOfbsTRzPBvS5sqWok
   jUftSpQ7oa2lKTGsdqPvah2I2zFqwxBfzUjz/WWRdT6oNfjU/aSh6++5X
   NBG5coLjvQcHMdfqdBdaEj2pwtRyP3aDW7UY+Tzbe31hMLfsClAkUJMrG
   h5AP5blXqOHNSYNMWCKZkew6ODXD/0QaJbTq6f2SNLc+ClSK/6VRvc8R5
   g==;
X-CSE-ConnectionGUID: ReQadzuVTNae3bOW6t5w9g==
X-CSE-MsgGUID: JmCcZlLDS8a3CfzPRv/4tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="71277158"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="71277158"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 06:53:55 -0700
X-CSE-ConnectionGUID: RnMnmXH+SlGhq/pScGt+Wg==
X-CSE-MsgGUID: bbS1CVnSR8qLn68YxbWSCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="276075724"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 02 Jul 2026 06:53:53 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfHrQ-00000000Apb-3GFY;
	Thu, 02 Jul 2026 13:53:49 +0000
Date: Thu, 02 Jul 2026 21:53:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-kminext 1/1]
 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c:79:27: sparse: sparse: symbol
 'sdm660_lpi_pinctrl_groups' was not declared. Should it be static?
Message-ID: <202607022108.ZBqvJCFy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-kminext
head:   005764abb0daff6b6c529f8e94989d90d8106a08
commit: 5e302106099efc8a309d92ad84cb37d35d6c3775 [1/1] pinctrl: qcom: Add SDM660 LPASS LPI TLMM
config: arm64-randconfig-r113-20260702 (https://download.01.org/0day-ci/archive/20260702/202607022108.ZBqvJCFy-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607022108.ZBqvJCFy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5e302106099e ("pinctrl: qcom: Add SDM660 LPASS LPI TLMM")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607022108.ZBqvJCFy-lkp@intel.com/

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
