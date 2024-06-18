Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D0D8120A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 16:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718729472; cv=none; b=KfLMaSSpxdbnnPcixmeix1ky0ci90+4lh7u9m7ghEKZ3U9NGMpbH1lAldv0/whVwZ11kLF2HTBpa/fO6t7gpSYeNzySOwlklFW4hHSDCqm7S4kYiGmD/I5ufWdIHnrHAjUQXbwfVPWPr8qfvWrkOSEhV/KB9fNcNvtn+ef0G/P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718729472; c=relaxed/simple;
	bh=VPUi0nRbpLvHQu9Qh9WgF5nOdHGkforA8C568lD7sn8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q6tb0Jch2qZADdh89JNdrBlbfKQ+G20BDJX+noRjmeiodRfnCebRRO+HPhYBVI4UjU0VgSpnxQBtUyoBk/S/PNQQx5ZGgkbKFUcGvRNPDMaHyd9UObofq3xRdDfhQ9s0gciW3BN3QI1NQQdurZwmstfG/mp3CoLpxG2Zidw0HiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HcHZIQ0w; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HcHZIQ0w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718729470; x=1750265470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VPUi0nRbpLvHQu9Qh9WgF5nOdHGkforA8C568lD7sn8=;
  b=HcHZIQ0wP9QSsVRk4HKQQS8mkG/3QDF1nPQmWYjFxxm3VrMk5HCrtGB8
   AVqu8yPwQ+Mn4G8vqNHoVB9+mng4CQozmXUbnWojMAUKFrsU355mb75Fe
   3u7b3qMWk5S6iNOBDcotv6eXLK4sHbV4Owvecd+76oen2HWs16baJsaM8
   2KD31oRHArPwe9Z56bBo0Cd+xSB7dsKjDCtlJ4jcYXv25CNmnEONpLP3q
   3wnPMrWIahJYaDyLzbCu2L7ZrKgWIyByfTXvHi7jwhEFI70EcwexKfxNV
   T4dyWjZSFs1pcJkUZV3rr1lMhBxuETmYCcNiBa8gbasyS3Fb9vQ4MEIAy
   w==;
X-CSE-ConnectionGUID: zs0K25ljQdGLyYA4f8hxPQ==
X-CSE-MsgGUID: Q+RXliHOSteWIgj0ECRbiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15461549"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="15461549"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 09:51:10 -0700
X-CSE-ConnectionGUID: +8R0VtKlR7aQwmZdKZf6Mg==
X-CSE-MsgGUID: C3+8gFGhRfq2nhpcZcJnYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="41545800"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Jun 2024 09:51:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJc30-0005jm-0g;
	Tue, 18 Jun 2024 16:51:06 +0000
Date: Wed, 19 Jun 2024 00:50:19 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/000-devicetree 56/184]
 arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning
 (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary
 #address-cells/#size-cells without "ranges" or child "reg" property
Message-ID: <202406190018.x5JVIJm1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   1f815c7efb1b452e1f6f3aaaa42b958383f44076
commit: 02b5004bf8d470f96b4c0714b84c2de29fb41eb2 [56/184] arm64: dts: apple: t600x: Add the NVRAM bindings
config: arm64-randconfig-001-20240607 (https://download.01.org/0day-ci/archive/20240619/202406190018.x5JVIJm1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406190018.x5JVIJm1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406190018.x5JVIJm1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t600x-common.dtsi:441.28-444.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-common.dtsi:446.34-449.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-common.dtsi:451.22-454.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:391.14-414.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:416.14-425.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:230.29-235.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:137.42-140.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'

vim +12 arch/arm64/boot/dts/apple/spi1-nvram.dtsi

e7fe0a9e6aea65 Janne Grunau 2023-09-30 @12  	flash@0 {

:::::: The code at line 12 was first introduced by commit
:::::: e7fe0a9e6aea65542229272f8108330dbb75b319 arch: arm64: apple: Add spi1-nvram.dtsi

:::::: TO: Janne Grunau <j@jannau.net>
:::::: CC: Janne Grunau <j@jannau.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
