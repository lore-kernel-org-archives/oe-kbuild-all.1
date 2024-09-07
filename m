Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6EC28F0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 17:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725730686; cv=none; b=ZjqaqFaf9UO0X9r3HnhMHjz7tHWOc1QWu7Oaah+a5nmuAdwOXefjSk9S9BdZyAYHZUpZa7BkrOp8HR4aMv0DDrXvCQzGhYMGfouOjiSmm1D9ChPdOVP0tOMAuZOU+PQMGGE0x2Vyvmz2DvyfeEsaF4BfiOl5LkgSxyWY76z4Xq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725730686; c=relaxed/simple;
	bh=u9xympQ6zHrr+CkSPu3FIPSn24l8aZ5MVboh7eDlPY8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FhRWDM8v3E9wBN0tQqKZXRdSPwj3XHIRuoJZ65xeGGKZ2oAttZyGa1LTndvtfeIaUm60cuMuHTAbD+PwrByAb+PnqrWOQPXqY575yR70JNpwEl8W9TkQMF2eaevK5TnkFJd8NClztv082/SWq3rKpDLqli1fFIsfQc4yx9l5LL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YIrzPLXk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YIrzPLXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725730685; x=1757266685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u9xympQ6zHrr+CkSPu3FIPSn24l8aZ5MVboh7eDlPY8=;
  b=YIrzPLXkytbgKJx9KJLnHZsgQagb94PeglwAwQZjbJApqOYFTQjr0db8
   ZPQTJUOTwLHbm6bc2VfBvjv664BsN2cHn4s336w3cuhwxWIRAhI4ucdLP
   wnohNxFesdx93skRyd+loXD/38vdpuL2Tiy3iLPlNfAYPX16/oMZEioe8
   3cNwtBDvFUNLN1tqX1llWIfo2k1pEYw5DK98IC4rOvP+aSqc59wBhctPB
   PqI7PfjXUD2TMuyKdt3h4++3LChH+jx8+k5POgwx9uiWG4PYxKbzO7tOK
   cT5pZ/W2Nom7EdPY+or0WLds8GQcp68oFhkAAovQIagVsj1wvMiA6h8wt
   w==;
X-CSE-ConnectionGUID: ZJ/wOGGHT0SX9iDzeOivBw==
X-CSE-MsgGUID: 27PsnZcSR6qGmRFuuD+vNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="24613418"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="24613418"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 10:38:05 -0700
X-CSE-ConnectionGUID: d2mM6T9dQWeWmbulvFiEkg==
X-CSE-MsgGUID: pkmP5QwIQFK0LscpOrV0Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="89513001"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Sep 2024 10:38:04 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smzNp-000Cn9-28;
	Sat, 07 Sep 2024 17:38:01 +0000
Date: Sun, 8 Sep 2024 01:37:11 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.6.y 29/82]
 arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:154.23-158.5: Warning
 (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@0: node
 has a unit name, but no reg or ranges property
Message-ID: <202409080149.8vBBpa3Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   c970a63609188f53cf758a3dcd395e777150a29a
commit: c3d8c1ec682c52028a7764474f78b754fd7a07af [29/82] ODROID-N2: arm64/dts: add 'meson64_odroidn2.dts' for compability
config: arm64-randconfig-001-20240907 (https://download.01.org/0day-ci/archive/20240908/202409080149.8vBBpa3Z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080149.8vBBpa3Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080149.8vBBpa3Z-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:154.23-158.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:159.23-163.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property

vim +154 arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi

   151	
   152	&cpu_thermal {
   153		trips {
 > 154			fan_0: trip-point@0 {
   155				temperature = <65000>;
   156				hysteresis = <5000>;
   157				type = "active";
   158			};
   159			fan_1: trip-point@1 {
   160				temperature = <75000>;
   161				hysteresis = <5000>;
   162				type = "active";
   163			};
   164		};
   165		cooling-maps {
   166			fan_cooling_map0 {
   167				trip = <&fan_0>;
   168				cooling-device = <&pwmfan THERMAL_NO_LIMIT 2>;
   169			};
   170			fan_cooling_map1 {
   171				trip = <&fan_1>;
   172				cooling-device = <&pwmfan 2 THERMAL_NO_LIMIT>;
   173			};
   174		};
   175	};
   176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
