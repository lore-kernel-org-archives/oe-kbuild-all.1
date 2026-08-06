Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A60D3DDAE3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 07:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786002347; cv=none; b=rqBq2P4+bTdIBcEwga0MQ6ifi8U7XSWNzIy3hbYUWOi8yX1AAMBwjKLTiOQoVlcFxQ/mfvHl3BCwMiX9ReF1fy0xxL8xOJIU4Ln8n5X3TDfOTmvlRUOnAme7/lBddfUN0EWWCrP8mpECerhSAkyhacQC4UIjUB8cFfrI+42BVeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786002347; c=relaxed/simple;
	bh=lScMgkT/zk+QAyjfPsvkI+wIK9pMxnVgdwYof8cchqM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mnvKtN9eNMs0DhZ3g6OJfwiAr7QtY9r/JVx4KUOn8XH44baXmUBfGM1QwStJxu7ZpAk1lhtcKuJHyMP8qmtzxnuyWYUJcdju48pQFNl6psDJUr7TNjhkZEW6QGvTxuVVcZFNYb/tp5jmCzsbfVaT1p5pCUwCzcICB3UQMtinROs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JoWpIqqr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JoWpIqqr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786002346; x=1817538346;
  h=date:from:to:cc:subject:message-id;
  bh=lScMgkT/zk+QAyjfPsvkI+wIK9pMxnVgdwYof8cchqM=;
  b=JoWpIqqrDbs5kr6FjngUjy7IvKypGp5D+llPsVD2gVTZHkIHX3g1M21x
   z4021xWIhzKhvQYBL+9SRnoO9snscVhzyOGAgRP9k6mPzzfH9FZCZFUJz
   aubxAZA7yDgd2xPmZmmwAa+TMYk01qbg6S598q4tJuewi5ZFlbdsEmojV
   msXxztGlRz8Ldp9GpHAEPQHjUzWq75Qrf7DklAC0iNYYQ57gl1zvDmcim
   gdkzGhTjwyL5Frk0rouwZCAL+cJAmgjNqKOE3aEE8kHDg6WFu5iEr6WH3
   VGAGYvxRpAZZ4wVCQbiX77T4GikOycirpaAoMJZP+gJmBhuBNfhg2Nssc
   g==;
X-CSE-ConnectionGUID: BxmUeahORfqGLNQbZYx24g==
X-CSE-MsgGUID: bc24KW2qRwKBOt+2kP2T8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86441570"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="86441570"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 00:45:43 -0700
X-CSE-ConnectionGUID: 9csXUdycTKmax1DgaSGKOg==
X-CSE-MsgGUID: Q4C9r2wpQIKC7Te5GtPkVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="260776082"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 06 Aug 2026 00:45:41 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrsnL-000000004aW-35Y1;
	Thu, 06 Aug 2026 07:45:39 +0000
Date: Thu, 06 Aug 2026 09:45:18 +0200
From: kernel test robot <lkp@intel.com>
To: xiane <sangch.go@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-7.2.y 25/58]
 arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: lcd: lcd-rst-gpio:
 {'rockchip,pins': [[2, 22, 0, 187]], 'phandle': 89} is not of type 'array'
Message-ID: <202608060903.s0UoCkmx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/tobetter/linux odroid-7.2.y
head:   d2521cc718fa5ae45bdc48f40517b76d2753a185
commit: 85ab58ef62b152322d8a7b6a7b078660f6145024 [25/58] ODROID-M1S: arm64/dts: updte mipi-dsi configures.
config: arm64-randconfig-2054-20260803 (https://download.01.org/0day-ci/archive/20260806/202608060903.s0UoCkmx-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ade128740327db281859708ddcb3b072903b3414)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608060903.s0UoCkmx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608060903.s0UoCkmx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dts:675.27-689.4: Warning (i2c_bus_reg): /i2c@fe5b0000/touchscreen: missing or empty reg property
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:1325.21-1336.4: Warning (avoid_unnecessary_addr_size): /i2c@fe5b0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: lcd: lcd-rst-gpio: {'rockchip,pins': [[2, 22, 0, 187]], 'phandle': 89} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: lcd: touch-gpios: {'rockchip,pins': [[4, 10, 0, 189], [0, 20, 0, 189]], 'phandle': 134} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
