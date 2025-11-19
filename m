Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2D5285CAA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 21:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763586403; cv=none; b=JhHFDLFWKYNQa1V2+grbW2b0L70Rs312pQ8lXSFB2omYWic6oMJNei+/AmAjpv0L0+NXK4uSscZQvr4yy/z0JNYsekKzz2olAZXchrmv06x1w2ETIRhhKBEJnZ6A07TDH21eRb9IsBNGtHqGeMY/PSocOnxz182IhzUfnWuij18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763586403; c=relaxed/simple;
	bh=hSfzncU+gTsHR6JJTI6p8itzQwM9rjDO10wErCgkzaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f9HrZH0gNk8xsuUIx0MB7R81j1hNvXrUiFgQY2jjkynaagdNgIBlhLgaCh2HXkmO6X+ps2978FckneODUxEDJ86fdJ1v7DwtJC6MlDfSBsiW5NeYYTBt/Zd4LafrS7HUjGxqINLSJ79eK+VOFDlrYeDyUoFuXuqwaRBwlFkIoqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ggsb6U2l; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ggsb6U2l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763586401; x=1795122401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hSfzncU+gTsHR6JJTI6p8itzQwM9rjDO10wErCgkzaQ=;
  b=Ggsb6U2lD0xPt+QcF0lJmPpdXRxmkq+EtFFZm8vkhrargFjp/kKGya/Z
   N8y8Vu0UkMkGTxHjieJwP5vnDcHjw6JgLXUxwaLSPW1Z7ai3i3P+7buBU
   4gwZ2zY7idf43RfrCjlykQ16t5fZ5yxEv70PKw45LBG5xJEWJBN3hcDVV
   ah9qRvLMni50Mp2WyPQ3JCEqC6+vVThQ5sQa8u31L05fRatZ1WDqbuy8v
   DA1YaavFCp12CDPQkl0r/nebd/LCnS5xIBmXIk/oyCmtdPhmCrfv1iAx6
   0iaJk9KouZGktVSYj6QiVbl1EdZeSblNRivywkUrMunw8rXnPyrhn25vP
   g==;
X-CSE-ConnectionGUID: w/GNo/XqS4qki76gndDLAw==
X-CSE-MsgGUID: 4AXF0DcGSBu1ysV6VZWUbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65522703"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="65522703"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 13:06:41 -0800
X-CSE-ConnectionGUID: jWPrH63YQseAVvROipW8MQ==
X-CSE-MsgGUID: dB5FoM3USq2Vw4voiqi1eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="196121226"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Nov 2025 13:06:39 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLpNt-0003KR-28;
	Wed, 19 Nov 2025 21:06:37 +0000
Date: Thu, 20 Nov 2025 05:05:54 +0800
From: kernel test robot <lkp@intel.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: [linux-next:master 3418/10183] sdca_interrupts.c:undefined reference
 to `sdca_fdl_process'
Message-ID: <202511200419.SbU6YvjE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fe4d0dea039f2befb93f27569593ec209843b0f5
commit: aeaf27ec6571527e750eed84bb3865a0664ae316 [3418/10183] ASoC: SDCA: Add FDL-specific IRQ processing
config: loongarch-randconfig-r131-20251119 (https://download.01.org/0day-ci/archive/20251120/202511200419.SbU6YvjE-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511200419.SbU6YvjE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511200419.SbU6YvjE-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: sound/soc/sdca/sdca_interrupts.o: in function `.LVL35':
>> sdca_interrupts.c:(.text+0x1cc): undefined reference to `sdca_fdl_process'
   loongarch64-linux-ld: sound/soc/sdca/sdca_interrupts.o: in function `.LVL213':
>> sdca_interrupts.c:(.text+0xb38): undefined reference to `sdca_fdl_alloc_state'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PINCTRL_CS42L43
   Depends on [n]: PINCTRL [=n] && MFD_CS42L43 [=y]
   Selected by [y]:
   - SND_SOC_INTEL_SOUNDWIRE_SOF_MACH [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_INTEL_MACH [=y] && (SND_SOC_SOF_INTEL_COMMON [=y] || !SND_SOC_SOF_INTEL_COMMON [=y]) && SND_SOC_SOF_INTEL_SOUNDWIRE [=y] && I2C [=y] && SPI_MASTER [=y] && ACPI [=y] && (MFD_INTEL_LPSS [=n] || COMPILE_TEST [=y]) && (SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES [=y] || COMPILE_TEST [=y]) && SOUNDWIRE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
