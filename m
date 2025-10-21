Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682F8283FCF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 07:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761032823; cv=none; b=tFphKXntPxKNKvWIggprmPIATZ88d3XeCD+WO5f37k7pDpK2r4Ix/O0OgRug8qKLyviccIHzq2ZnmpyIv9pd3ubuKL2uvNpXuHcSC8Ux7UeSBzksQvNpGtzfa/ZasslX0kJBMg4O7li8m2Qsg0Vj51ElJ3+Zan7Ba2QmFkCxq+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761032823; c=relaxed/simple;
	bh=Z89NVfyoRrYuNsgomey+AmuitkU1HX6Y2hc802A94cA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Im9aGYnB8qeZKVmr1rR7IdJTlw7ELE9DL63vHQ8Vg6RzqKlyFnUWS1RpjI3Eik8a4oOzdi9WkV+vRrWPYYEwGPe5dkdf/CLkNpoPJ0wUhWVooau0RupCAIWU/ELgjHiGey/fjaaMiKtznT/T5FAYQQpKJmCzvmq7P4pR0QhB7T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDkq/mxL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDkq/mxL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761032822; x=1792568822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z89NVfyoRrYuNsgomey+AmuitkU1HX6Y2hc802A94cA=;
  b=fDkq/mxLQMZK+vsHQo2qcU1TUh5aCvI2CTbedICfIFHeFJLM3DCKGxm+
   lllyCq5w5KNprhOSCLCwZISWWpZUEYXAY5xiY0tJDninPEC169AQAoFzl
   i+AQHArNs2AZam+Kh2Q9odgQbSk00BQgmIIMjwYGfpXJoGfEs/3y7mzNV
   /J8NC5irf2DqscFtfB33wXqayNqYWMmlrYT/+nQJ02oen0bRldGXCnQuQ
   kSl5rnJ47iI3kzcdSPGYiJrtmrUp9g561b3nLgPDQzJIquRKSR2T6q6qw
   ba3W/OQ6Gtd/ICA7bi0UYP7i5ZDpr+KzKljYhW/S7h+yAkBSBzulksAE3
   g==;
X-CSE-ConnectionGUID: lJ6zZ53cTYCSPPNZmPHuRw==
X-CSE-MsgGUID: lGPZ3yzRR0WoNsaDzLJPdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88621310"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="88621310"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 00:47:02 -0700
X-CSE-ConnectionGUID: SU7Le6OhRiS0ZryXDtsJGg==
X-CSE-MsgGUID: Ql76nVVSQv6QpUMHHvmtZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="187939444"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 21 Oct 2025 00:47:00 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vB755-000Ad9-2i;
	Tue, 21 Oct 2025 07:46:56 +0000
Date: Tue, 21 Oct 2025 15:46:48 +0800
From: kernel test robot <lkp@intel.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: oe-kbuild-all@lists.linux.dev, Andi Shyti <andi.shyti@kernel.org>,
	Yixun Lan <dlan@gentoo.org>
Subject: [linux-next:master 2494/3056] i2c-k1.c:undefined reference to
 `devm_clk_register'
Message-ID: <202510211523.sSEVqPUQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
commit: 743aa55942a532a848a584437d2b8b4c9ffe8934 [2494/3056] i2c: spacemit: configure ILCR for accurate SCL frequency
config: um-randconfig-001-20251021 (https://download.01.org/0day-ci/archive/20251021/202510211523.sSEVqPUQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510211523.sSEVqPUQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510211523.sSEVqPUQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/i2c/busses/i2c-k1.o: in function `spacemit_i2c_register_scl_clk.constprop.0':
>> i2c-k1.c:(.text.unlikely+0xe3): undefined reference to `devm_clk_register'
   collect2: error: ld returned 1 exit status

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
   Selected by [y]:
   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n] && COMMON_CLK [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
