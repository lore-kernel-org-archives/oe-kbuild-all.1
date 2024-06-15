Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A385623
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 00:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718410833; cv=none; b=NxQqx0cwC+N+akJtnyhUdPkWq2kg2X1YIpEl3KhFkryh7J5YKnBPpg5vAP9/5PLSb5jJ4ktLUAKi9aXMlUPAsnuqbP80Nb63Iwj3B9GGXCQHbPjSesmnoGFqAIu4Xc7zrzCThSooFk1ebwN45G37R15SdeSiXMBRTZmJbtnGDB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718410833; c=relaxed/simple;
	bh=y/S2EabIiKWVdZ78wxM6q42ejiqP7gtQxxMCS3/2Fwc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V2oD57DlTXFKoY79uAMmrASI/1792HnjyXCBna/5z5ncGKWJkn+LtmDvu5d5eh1DiSCwvz/r8oAsO7vYsVwHIeLcHX6ANFBQwUH6Kn5PeWxShrys1nWG4Wvwd/OOys6FK4ZkEPa6MDAOPB7+7dTvnFoMK8C5K7Zqtg2fnkNsmWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kt+vJOuV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kt+vJOuV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718410832; x=1749946832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y/S2EabIiKWVdZ78wxM6q42ejiqP7gtQxxMCS3/2Fwc=;
  b=Kt+vJOuVa3wjiIK8tFUTAqbsYVVYttLCDrsVXF7wclEtNPKva2Yh/NH7
   gciDCBLF0YA6CPOjxTQ0rnquM7wC+e3i1SHHYPw9J3mVIbWPMRR9WCre6
   nynO0dKq62kdmrq4PtGM+uVt1cnDjwHyS+VBFjPlIw9rX1CJf/fwZbnny
   BPpUsCLvM6XHI1BH/Njgu79Q4ziIo4O+P2rhSeckSwe9TQivH0p8CxzlA
   U8XH5A/8YjT06EwCKqO2Bbv5AO83maQmVWVhVKNEeDV6ADe5v7oiQdUSc
   xJzqMy2FbpNSaPe7uCvninOs0PRTnZe1OZ/s3mpDg/Pkbu5MFRPPrcj8a
   w==;
X-CSE-ConnectionGUID: 1Ci/I19STDOqmkR1LrQ5aA==
X-CSE-MsgGUID: PFYIwwtyQuG9xaM1RP428w==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="37844569"
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="37844569"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 17:20:31 -0700
X-CSE-ConnectionGUID: BHKGPbl+QH25d1+J3iQqrQ==
X-CSE-MsgGUID: RKxH+t3cRO+p+1p+iq608Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="63869013"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Jun 2024 17:20:29 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIH9f-0001wP-1r;
	Sat, 15 Jun 2024 00:20:27 +0000
Date: Sat, 15 Jun 2024 08:19:59 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.1.y 82/91]
 arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dts:725.27-736.4: Warning
 (i2c_bus_reg): /i2c@fe5b0000/touchscreen: missing or empty reg property
Message-ID: <202406150815.kchf10jd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   a50c6922e2b4c1d7c895bde521d13096ba16a863
commit: 007dbe14687c282c025b3753059f23044c073043 [82/91] ODROID-M1S: arm64/dts: add support MIPI interface with touch screen
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240615/202406150815.kchf10jd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406150815.kchf10jd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150815.kchf10jd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dts:725.27-736.4: Warning (i2c_bus_reg): /i2c@fe5b0000/touchscreen: missing or empty reg property
>> arch/arm64/boot/dts/rockchip/rk356x.dtsi:1182.21-1193.4: Warning (avoid_unnecessary_addr_size): /i2c@fe5b0000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +725 arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dts

   716	
   717	&i2c2 {
   718		status = "disabled";
   719	
   720		pinctrl-names = "default";
   721		pinctrl-0 = <&i2c2m1_xfer>;
   722	
   723		clock-frequency = <400000>;
   724	
 > 725		touchscreen: touchscreen {
   726			status = "disabled";
   727	
   728			pinctrl-names = "default";
   729			pinctrl-0 = <&touch_gpios>;
   730	
   731			interrupt-parent = <&gpio0>;
   732			interrupts = <RK_PC4 IRQ_TYPE_LEVEL_LOW>;
   733	
   734			irq-gpios = <&gpio0 RK_PC4 IRQ_TYPE_LEVEL_LOW>;
   735			reset-gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
   736		};
   737	};
   738	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
