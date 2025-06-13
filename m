Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF44F2236FB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jun 2025 17:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749835684; cv=none; b=u4YKQj2Wf2E+UaZz6DByrZL+1awkDL1MyBVjYoTy9Mywq9xIi6Acn799hARk3wfVCBj5pMZGVvQN0PBVzbIkjVmnr0XvH0j0pu08ZJAYNCWExZl8RKQMNs875OjCZJk9jshwGdvfobmiLincSckiNrZdea9z3r7cIqP4FmLl8h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749835684; c=relaxed/simple;
	bh=bqp3HEzNIq9VvoOQLKLP+ASTiObmDgXRTq/OTPhg3Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LL+gw7FsoC6Gu0JuekiGeocXKidtECP379jdq3fLdQq7yiWUbtCBS+a6U5FJLhQQCD20n7FRO9UoJBObbmxEMppOtfmb9FSuLvgDYh6rwxMRN7RWipIN4WGPoAIimFF5c7SQatSYApBj9aHMuisMA6iUJEW7FJq2C6/clUKPJQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XghT12zb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XghT12zb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749835683; x=1781371683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bqp3HEzNIq9VvoOQLKLP+ASTiObmDgXRTq/OTPhg3Gg=;
  b=XghT12zbugqruSLmIP9G64NLidvQ5eiyktulPzqGYUUWORaKtluju/z+
   8y6epeslqXmXrjU8JY/AaEE9CPPC7KqlByMc3Vri2dO4MKGBbrN2/JzZw
   45h7111Kh+CuVtE0OTMtpV+iJw00EmKKUPycCW8z9qHGLDoiDPOkcEQ3S
   bghIy9vQfhPDjoxuxJu4osQM+RM35Bu00kCYn4V6XOpVoh3C0y87Aa9SW
   z9A8TpEqGQtB2GqS4CWhGH5G6Exia+S3b9TQ/NpL0yhg2R6q/pwL1dwOU
   4Irbfng6zmA7+tANT7Ejwj7zhce07JQeccmZXh8O3FpNZxtMLZSAVhhqt
   Q==;
X-CSE-ConnectionGUID: BkxpACXiR3u7YallDzBGXg==
X-CSE-MsgGUID: b8G81mv4TaWj5LHSIEEuYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="63094383"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="63094383"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 10:28:01 -0700
X-CSE-ConnectionGUID: TIrBppvORAerClXxEXhcjA==
X-CSE-MsgGUID: Fa+uwmBLSOaB/JIKON2orQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="185124460"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Jun 2025 10:28:00 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQ8C5-000CrE-0e;
	Fri, 13 Jun 2025 17:27:57 +0000
Date: Sat, 14 Jun 2025 01:27:27 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Charkov <alchark@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 2236/2468]
 arch/arm/boot/dts/vt8500/vt8500-bv07.dtb: /soc/lcd-controller@d800e400:
 failed to match any schema with compatible: ['via,vt8500-fb']
Message-ID: <202506140157.52eLZFNo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc6e0ba6c9bafa6241b05524b9829808056ac4ad
commit: 1918e51321c0c34341397644512568ac3451e416 [2236/2468] ARM: dts: vt8500: Fix the unit address of the VT8500 LCD controller
config: arm-randconfig-052-20250613 (https://download.01.org/0day-ci/archive/20250614/202506140157.52eLZFNo-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506140157.52eLZFNo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506140157.52eLZFNo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/vt8500/vt8500.dtsi:63.11-104.6: Warning (avoid_unnecessary_addr_size): /soc/pmc@d8130000/clocks: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/vt8500/vt8500-bv07.dtb: /soc/pinctrl@d8110000: failed to match any schema with compatible: ['via,vt8500-pinctrl']
   arch/arm/boot/dts/vt8500/vt8500-bv07.dtb: /soc/pmc@d8130000: failed to match any schema with compatible: ['via,vt8500-pmc']
   arch/arm/boot/dts/vt8500/vt8500-bv07.dtb: /soc/pmc@d8130000/clocks/uart0: failed to match any schema with compatible: ['via,vt8500-device-clock']
   arch/arm/boot/dts/vt8500/vt8500-bv07.dtb: /soc/pmc@d8130000/clocks/uart1: failed to match any schema with compatible: ['via,vt8500-device-clock']
   arch/arm/boot/dts/vt8500/vt8500-bv07.dtb: /soc/pmc@d8130000/clocks/uart2: failed to match any schema with compatible: ['via,vt8500-device-clock']
   arch/arm/boot/dts/vt8500/vt8500-bv07.dtb: /soc/pmc@d8130000/clocks/uart3: failed to match any schema with compatible: ['via,vt8500-device-clock']
   arch/arm/boot/dts/vt8500/vt8500-bv07.dtb: /soc/timer@d8130100: failed to match any schema with compatible: ['via,vt8500-timer']
>> arch/arm/boot/dts/vt8500/vt8500-bv07.dtb: /soc/lcd-controller@d800e400: failed to match any schema with compatible: ['via,vt8500-fb']
   arch/arm/boot/dts/vt8500/vt8500-bv07.dtb: /soc/ge_rops@d8050400: failed to match any schema with compatible: ['wm,prizm-ge-rops']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
