Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A1B13FD96
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Apr 2024 15:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712935155; cv=none; b=gXC33Rr0lJCc80LRNX9AFCI1mqa+JenR8ryLvuMQETc+S+QVHQPuwfXKz8cV+qbz3Xc9LI4W6k6vtk87aXgQS6dgOD0H0/UtL082vkY6AfgXxLctuggIeg6/Ax8WFwOtMVZfJhY+JYTeE2DJ0asmLa3kX50+NL6TBk0rSgieROg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712935155; c=relaxed/simple;
	bh=PrCGdu4v8NWM7Mm6pNu1a4eGz8YKpma7vFnCHRwB04E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=epe7aQYBTnMRB/wdDJK6nVWS4aHAe3ozMzyH4KILkoOwxFyitDl/1PLLwRwlGPnxFo+yl8fG3K5A5I+p9gtbwkCpse81njiITO9MNpgNAVwmGfuIm297sLqNLJXjS1A06+tH10CCaTo/+NV4/9NqBDZ9jzqwuICvYdoGRa9wnp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U/kt+kWV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U/kt+kWV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712935154; x=1744471154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PrCGdu4v8NWM7Mm6pNu1a4eGz8YKpma7vFnCHRwB04E=;
  b=U/kt+kWV+44h+EoAahE8fRTAio6Lnf14Xsc5iFULRZgLm/nVkWxm0gi4
   gBNvswALZJPHdtupZvV/IuIZ132i5G1Ny9IN8BNi7ApYI2TI+4mRv+9GI
   RQP/22RitQgusHZKn2Gl19567KXrw4U01s5Dh3bPAym+CZFSjzrbwVWdt
   prTSw1fhypDRFjNbI6ndfzhzQhaewX5Z5mfSnAlkaupSLxvZZN215xger
   r13sodDJp8WohG9CXlS0xNwuV6EhlZc8DR6MZMTRu1jZ3G++OSv+oH2QF
   UxfsjD2RrkYwsaYBPEfHZu0A/G5rrj9lsbtL9tcOacc1ssDXuCFCDi5nk
   A==;
X-CSE-ConnectionGUID: z0dFEgXBRLWirGYF7pR4Gg==
X-CSE-MsgGUID: FW98Z4nGSmWdG+IIDsWZVQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="18952297"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="18952297"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 08:19:13 -0700
X-CSE-ConnectionGUID: jQby40KDT/O/8dRVYf0kTA==
X-CSE-MsgGUID: TuahctarTgafyIlBGqIfuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="52411375"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 12 Apr 2024 08:19:11 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvIgH-0000AV-07;
	Fri, 12 Apr 2024 15:19:09 +0000
Date: Fri, 12 Apr 2024 23:18:23 +0800
From: kernel test robot <lkp@intel.com>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stephen Boyd <sboyd@kernel.org>
Subject: [clk:clk-sophgo 2/5] powerpc-linux-ld: clk-cv18xx-pll.c:undefined
 reference to `__umoddi3'
Message-ID: <202404122344.d5pb2N1I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-sophgo
head:   a12069a39b33c3b4c57929f5b42c88da681496ba
commit: 80fd61ec46124eb83b29de3647a565f69979e753 [2/5] clk: sophgo: Add clock support for CV1800 SoC
config: powerpc-randconfig-r122-20240412 (https://download.01.org/0day-ci/archive/20240412/202404122344.d5pb2N1I-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240412/202404122344.d5pb2N1I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404122344.d5pb2N1I-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/clk/sophgo/clk-cv18xx-pll.o: in function `fpll_find_rate.isra.0':
   clk-cv18xx-pll.c:(.text+0xfc0): undefined reference to `__udivdi3'
>> powerpc-linux-ld: clk-cv18xx-pll.c:(.text+0xfd8): undefined reference to `__umoddi3'
   powerpc-linux-ld: drivers/clk/sophgo/clk-cv18xx-pll.o: in function `fpll_recalc_rate':
   clk-cv18xx-pll.c:(.text+0x25f8): undefined reference to `__udivdi3'
   powerpc-linux-ld: clk-cv18xx-pll.c:(.text+0x2610): undefined reference to `__umoddi3'
   powerpc-linux-ld: sound/soc/fsl/mpc5200_psc_ac97.o: in function `psc_ac97_of_remove':
   mpc5200_psc_ac97.c:(.text+0xadc): undefined reference to `mpc5200_audio_dma_destroy'
   powerpc-linux-ld: sound/soc/fsl/mpc5200_psc_ac97.o: in function `psc_ac97_of_probe':
   mpc5200_psc_ac97.c:(.text+0x1720): undefined reference to `mpc5200_audio_dma_create'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_MPC5200_AC97
   Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_MPC52xx [=y] && PPC_BESTCOMM [=n]
   Selected by [y]:
   - SND_MPC52xx_SOC_PCM030 [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_MPC5200_SIMPLE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
