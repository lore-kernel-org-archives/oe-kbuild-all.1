Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35313D5230
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 10:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162764; cv=none; b=XP60Hyq/eRS9p1AKIvwmaEI+6RFW19rZG4TY5aWkLKvM2vYcZMLhmuaYlhicivRs1H4SSMRA94n8t/4eUjLQx/7BeZ0lI7izkBH4g+Fi+MLwpncjhmwTYix85beTtWEth/ZBIdcG4FmwA5Mis0NpKSoBRQbBGQhdHSavWAeE2NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162764; c=relaxed/simple;
	bh=lIXOUwDe8E+b2qSVEe0kw1dqwdqFsv/whTI30Yg2TTM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qR8E12jBllnpVCz+jJbt2pD05zZAms8F9qQPZ2PBsQU/6jYcsyPhkLcHIIhJ6q5WdQLViFneNZwvnH8zFhDc2Fklkz0RURtHur3nHfuZPIPWwpufaH+DaceY8hKPH2ooTuYnXO+sy+zwML4XM5Jlqhm6UaPlBxhVBWsj7m5zR+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D8OgEb1v; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D8OgEb1v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776162760; x=1807698760;
  h=date:from:to:cc:subject:message-id;
  bh=lIXOUwDe8E+b2qSVEe0kw1dqwdqFsv/whTI30Yg2TTM=;
  b=D8OgEb1vE0+TAqYmv2rkCGixfPvuXnCB2wJpiSt8c3k9TRv+4uOu4zRt
   g/DE7aYK66qR30+4QeUBUIPdZu2QNu0STAkdEMEOxWky4cIxNQT92z3Ef
   pwc2zi+DXx6VVThks6FAbHCLl+7wWsqXJOKd0ZCdC+jUaAyqGzIVg3o3w
   +LpuDwSoAjWxPiuk8Kyb/ef/m4w4IMm6m0i7Zg3Qm306WIpJKeaVat+oj
   HM38hWOAgp574pYfpuUMURSK//b7meMEodIMUiZUnItPrnSYy+JHvRlKy
   Pf/eTIPhHNcg4fM0nAm1SIscg2EQGg7jtM08+JDGlSMHR/2TqmZw5LlIX
   g==;
X-CSE-ConnectionGUID: 8UZy94bIT+SLQF9k+0/dXg==
X-CSE-MsgGUID: ShPhEBwUTDeX4OPDSMiIJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77083921"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77083921"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 03:32:36 -0700
X-CSE-ConnectionGUID: GdtozCuSRzK+1sYmzCpwfg==
X-CSE-MsgGUID: ofDt77YdS+SleSRWAHx1hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="229933781"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Apr 2026 03:32:35 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCb4J-000000001Lx-2iWI;
	Tue, 14 Apr 2026 10:32:31 +0000
Date: Tue, 14 Apr 2026 18:32:31 +0800
From: kernel test robot <lkp@intel.com>
To: ckkim <changkon12@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-7.0.y 65/65] arm-linux-gnueabi-ld:
 drivers/clk/meson/axg-audio.o:(.data.__compound_literal.374+0x4): undefined
 reference to `meson_clk_phase_ops'
Message-ID: <202604141854.5TNxmE36-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/tobetter/linux odroid-7.0.y
head:   527f04a009428b2e35090bd8ef9858d3fcc7a017
commit: ea306b837a1aa3c3b40d02a836a33c7ed6c62a90 [65/65] ODROID-COMMON:sound/soc/meson: add audio module for g12a, g12b, sm1
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260414/202604141854.5TNxmE36-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604141854.5TNxmE36-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604141854.5TNxmE36-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.374+0x4): undefined reference to `meson_clk_phase_ops'
   arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.371+0x4): undefined reference to `meson_clk_phase_ops'
   arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.368+0x4): undefined reference to `meson_clk_phase_ops'
   arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.298+0x4): undefined reference to `meson_clk_phase_ops'
   arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.295+0x4): undefined reference to `meson_clk_phase_ops'
   arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.292+0x4): more undefined references to `meson_clk_phase_ops' follow
>> arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.207+0x4): undefined reference to `meson_clk_triphase_ops'
   arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.204+0x4): undefined reference to `meson_clk_triphase_ops'
   arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.201+0x4): undefined reference to `meson_clk_triphase_ops'
   arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.198+0x4): undefined reference to `meson_clk_triphase_ops'
   arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.195+0x4): undefined reference to `meson_clk_triphase_ops'
   arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.192+0x4): more undefined references to `meson_clk_triphase_ops' follow
>> arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.189+0x4): undefined reference to `meson_sclk_div_ops'
   arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.186+0x4): undefined reference to `meson_sclk_div_ops'
   arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.183+0x4): undefined reference to `meson_sclk_div_ops'
   arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.180+0x4): undefined reference to `meson_sclk_div_ops'
   arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.177+0x4): undefined reference to `meson_sclk_div_ops'
   arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.174+0x4): more undefined references to `meson_sclk_div_ops' follow
   arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.171+0x4): undefined reference to `meson_clk_triphase_ops'
   arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.168+0x4): undefined reference to `meson_clk_triphase_ops'
   arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.165+0x4): undefined reference to `meson_clk_triphase_ops'
   arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.162+0x4): undefined reference to `meson_clk_triphase_ops'
   arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.159+0x4): undefined reference to `meson_clk_triphase_ops'
   arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.156+0x4): more undefined references to `meson_clk_triphase_ops' follow
   arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.135+0x4): undefined reference to `meson_sclk_div_ops'
   arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.132+0x4): undefined reference to `meson_sclk_div_ops'
   arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.129+0x4): undefined reference to `meson_sclk_div_ops'
   arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.126+0x4): undefined reference to `meson_sclk_div_ops'
   arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.123+0x4): undefined reference to `meson_sclk_div_ops'
   arm-linux-gnueabi-ld: drivers/clk/meson/axg-audio.o:(.data.__compound_literal.120+0x4): more undefined references to `meson_sclk_div_ops' follow

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for COMMON_CLK_AXG_AUDIO
   Depends on [n]: COMMON_CLK [=y] && (ARCH_MESON [=y] || COMPILE_TEST [=y]) && ARM64
   Selected by [y]:
   - SND_MESON_AXG_FIFO [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (ARCH_MESON [=y] || COMPILE_TEST [=y] && COMMON_CLK [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
