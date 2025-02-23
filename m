Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39A729A9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Feb 2025 03:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740281567; cv=none; b=roC1u8cihOF6ULGXWqrro0AcPRwHeknpq7rI6hUTcaRr3xzpD1WEBvCYEV9NQdXsB53BGSTU6c0mlBeXbbbUqr3Q7afBPx+yHGckqW9K/0EKuKqYixhWmyhZFBIFEITLX4I/GmcaaD181/4ILs05KrweNKoBnGXE9zchsU34ZAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740281567; c=relaxed/simple;
	bh=q8S0NoFZKytCsVOiEnv2SuUGs3qbs0l4gW+QE72zuQg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WkNZ5JFTGHUJXyHj9TQ97qpOw3LaP8UV7Zn55GF0R9f594SYxFK1qCBoj5Eb6oL6bsML43aH+h4l0V5W7ObyJabL/tu1EbWB76CFNOU8bRiFvHIsJd3R4XasOiirak0ndAjpcsTmwQwX7JHW5iX2t2pS7CAoBNch2zAaKvBQd8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZpeXZjD2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZpeXZjD2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740281566; x=1771817566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q8S0NoFZKytCsVOiEnv2SuUGs3qbs0l4gW+QE72zuQg=;
  b=ZpeXZjD2OR+9QopGKS6zCYxhoS1Z2jZyvGaaVRpgDzWJCGjJj8qayO4s
   XjhhF7fxwr50JOsFKhTkBGxxnb8nnNhqizlPDMB4ze7iCZObq7gQgtYeY
   3Krx0V42d+q5TJlupAs5RBDWsDHSr3ttl7JNHqmjYTIiVHW7V2aFTf2ZM
   YtcSPWy7mFYpzPipYxS6cwk2XJ3sgehR75GhSrGOUXWtzT0v3jh7VXRmr
   WbYkAdUHL1c0UBc39ZoSFAey/w+laAln/kMVmqvDafAiqO9zCY81FJLnq
   0x6YX8dx95cfU1R5RzqZQ1WLTG/wbRMqlsDVUmSDrqJznILH53jpv7e5o
   A==;
X-CSE-ConnectionGUID: zdPvImHdT/+ZZO0d6WYyAA==
X-CSE-MsgGUID: qjOxsUk7RA6dPqnLZ8ATMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="52051509"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="52051509"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 19:32:45 -0800
X-CSE-ConnectionGUID: wS8urUFUTEKvxfX3pXBUnA==
X-CSE-MsgGUID: RmlP/U0EQaufMA5dybK3/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="115923908"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 Feb 2025 19:32:44 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tm2jR-00076d-31;
	Sun, 23 Feb 2025 03:32:41 +0000
Date: Sun, 23 Feb 2025 11:32:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-lts 1/1]
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb:
 /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@0/pwm@20: failed to match
 any schema with compatible: ['maxim,max31790']
Message-ID: <202502231148.BXLtT73B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-lts
head:   100e5d54ced2ed22d23bb58d456bdf23c2f57ba7
commit: c62ceade98a0f453f3a1a542c5702a069bdc778d [1/1] ARM: dts: aspeed: yosemite4: correct the compatible string for max31790
config: arm-randconfig-051-20250220 (https://download.01.org/0day-ci/archive/20250223/202502231148.BXLtT73B-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502231148.BXLtT73B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502231148.BXLtT73B-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/adc@1d: failed to match any schema with compatible: ['ti,adc128d818']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: adc@35: ti,mode: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/adc@35: failed to match any schema with compatible: ['ti,adc128d818']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: adc@37: ti,mode: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/adc@37: failed to match any schema with compatible: ['ti,adc128d818']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: adc@1f: ti,mode: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@0/adc@1f: failed to match any schema with compatible: ['ti,adc128d818']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@0/pwm@20: failed to match any schema with compatible: ['maxim,max31790']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@0/pwm@23: failed to match any schema with compatible: ['maxim,max31790']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@0/gpio@61: failed to match any schema with compatible: ['nxp,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: adc@1f: ti,mode: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@1/adc@1f: failed to match any schema with compatible: ['ti,adc128d818']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@1/pwm@20: failed to match any schema with compatible: ['maxim,max31790']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@1/pwm@23: failed to match any schema with compatible: ['maxim,max31790']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@1/gpio@61: failed to match any schema with compatible: ['nxp,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
