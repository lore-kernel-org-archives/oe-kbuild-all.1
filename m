Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9707E14884B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 13:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718370845; cv=none; b=Mj7vNhGXB686df4Wk3+fWm+wKOolbkA80TwMlQZR7wEpgPjdRDjHyZGaEdctr7+17PRcA+C93c05w7/DpVmkvBIUwjvgwRmZgvgA8GH5sslvejPGlzYDthus0UB8T55ytNLkOvZhVtmaekQt/IaG/QS4issXDAQ03P3qBmi+FSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718370845; c=relaxed/simple;
	bh=A7c2JEjG8PNqzbxRlK64B39iU9PgD5kVIG4lsH0yf6I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TePyGSbvawElI7QwFYcoBQCUPkaG0EADNzN/W6EONX6pfsQqHfpa+2tJfmcxA1Bda/TxsQTVgVKnyYQivldxWwFG3AYHt4pEzNsf+egN1gzu6Is2WDI/Nm06a5Ka/NIVIo2EGi8puqTMsygzO/zTPzydMkzteu7tjB3qC0nDJXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RohgTAVL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RohgTAVL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718370843; x=1749906843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A7c2JEjG8PNqzbxRlK64B39iU9PgD5kVIG4lsH0yf6I=;
  b=RohgTAVLcBEske5ZEB6/6y0q/lfPePfTvIX/2AzXnxwk3MBWvJPZVn58
   Zjor9saV/87ul9u0ZC7r+7xEesA5wyQp3WOoRQC8QdfFQ7a6qrKIiY1Oe
   5WVXl8RJnkSNix4xi4sH7Cc7cTYbG8EcbkKklnT9YRdeNhYaA1Fljpups
   1FHvb8omWL2i+3H4RPIFoypYoI86JRlG8BNV41owYtizFd+TZVpBUjvso
   n7l+iv8fgpvoMEgreCzwyiwLltD96a5AtxWBEO1F5Cfoh21yB314uSUA5
   RhXeDB60dxrRyOWl9z+DviwdM9q3rntjh7ZxDnqzj0lQ2Jj76PcF8S/04
   A==;
X-CSE-ConnectionGUID: LEiAESXgRSSkDREGATkObw==
X-CSE-MsgGUID: O06BT9VxTBylVkfmmpxgFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19105351"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="19105351"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 06:14:03 -0700
X-CSE-ConnectionGUID: AW2vd1dcQQmxnjsy/J9DrQ==
X-CSE-MsgGUID: eYI7skpuQ8uMa6O1sIzKQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="40631896"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Jun 2024 06:14:02 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI6kh-0001L5-2z;
	Fri, 14 Jun 2024 13:13:59 +0000
Date: Fri, 14 Jun 2024 21:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.1.y 28/91]
 arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:154.23-158.5: Warning
 (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@0: node
 has a unit name, but no reg or ranges property
Message-ID: <202406142116.6i7IfdnM-lkp@intel.com>
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
commit: 53e390e1de685ddefa4ec9a40a60b0a1d1795b9c [28/91] ODROID-N2: arm64/dts: update device tree after v5.13
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240614/202406142116.6i7IfdnM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406142116.6i7IfdnM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406142116.6i7IfdnM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:265.33-1539.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1731.28-2003.7: Warning (unit_address_vs_reg): /soc/bus@ff800000/sys-ctrl@0/pinctrl@14: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:154.23-158.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:159.23-163.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:265.33-1539.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property

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
