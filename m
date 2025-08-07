Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984A02676F4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 16:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754583661; cv=none; b=bWJ3QxBiyhHEZ0xWV9TR5B3lR9O5Rz1ACGPchdWpKQDfyaBApErqAaVn0rYRMVAOR7BLbGiOCJGawgpQkDtbwvCS9fwu2AkLp2trGjABVp+qRdLDykZUPQcxI/Vyqs989r0HNgW31JbuUyO4CgqK8PwcXCMt7c5fp4+01ru/7b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754583661; c=relaxed/simple;
	bh=weMwDimtguvWHiWTZ7BcuyGoC3NhbfTq/qj5JpLad8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RTue3EzQzgy8iFavwsnDdrxQ81GxVrz7IwTR9wWR/1L9/ZLIEHDY5+soyhpkuUn8wZp7qFxu/Zkr2k34Mr69E09vDkM59BilKxvMluE8WVll3nKe8RSd1zU24y/hwnPYNQvKZaPnFxa6Xr3zClH1YKy0un541KXeh74cpha/CmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aoxo2439; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aoxo2439"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754583660; x=1786119660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=weMwDimtguvWHiWTZ7BcuyGoC3NhbfTq/qj5JpLad8Y=;
  b=Aoxo2439VD9FAHT/82H5DtK9H6AsTgziM1iKlRqbHQYY7QdYzzUNS5uB
   u2ZTJ29iZKP3TEdJkuJttF6TP2ACuvUqxdNJdxFKhDJnmmBUlSZczdff0
   Qe4yJcvqu7kpcRtSwgzoaqfMXbu73qSayUSHGih6GzPqKZ4H2UCriJNwZ
   bN/VK8vPAbcdJ0Ah0xiNmNAna77G4uUZPmndPwOFS3n22ef+iWMtImlPo
   mRU9H/mkq+c0V34dlkVdq7hbNNGIrjd2kN3OW17OhOuEJWV5+TKq2hBAC
   IPOPKN4AeYhTti+zjH8P0XSKLbZJ7jOeDNOE+k7o7S7wmQZx5jbtgmEcr
   w==;
X-CSE-ConnectionGUID: 0MpT9CgkSNS7CYjvJ60/lA==
X-CSE-MsgGUID: uBv/tBEkQNaNWWClEJpl5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="59540852"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="59540852"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 09:20:52 -0700
X-CSE-ConnectionGUID: Agpu0Ev1TpyrGE1O1NnIMQ==
X-CSE-MsgGUID: LW5WHVwAQWGji08NRwBQ2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169342827"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 07 Aug 2025 09:20:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk3Lp-0002yM-0g;
	Thu, 07 Aug 2025 16:20:35 +0000
Date: Fri, 8 Aug 2025 00:20:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt-convert 301/801] Warning: Duplicate compatible
 "aspeed,ast2500-gfx" found in schemas matching "$id":
Message-ID: <202508080024.nEoyF08H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: dceec6dced5c063c42f6415c9c777a57b29b97a5 [301/801] dt-bindings: mfd: Convert aspeed,ast2500-gfx to DT schema
config: arc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250808/202508080024.nEoyF08H-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080024.nEoyF08H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508080024.nEoyF08H-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/devicetree/bindings/iommu/nvidia,tegra30-smmu.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/dma/ti,edma3-tpcc.yaml: ti,tptcs: missing type definition
   Documentation/devicetree/bindings/dma/ti,edma3-tpcc.yaml: ti,edma-reserved-slot-ranges: missing type definition
   Documentation/devicetree/bindings/memory-controllers/atmel,ebi.yaml: atmel,smc-page-mode: missing type definition
   Documentation/devicetree/bindings/memory-controllers/marvell,mvebu-devbus.yaml: devbus,bus-width: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: isel: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: fdim: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,short-detection-threshold-volt: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,current-limit-mA: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: gpio-ext: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: timers: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: bright-addr: missing type definition
   Documentation/devicetree/bindings/display/smi-sm501.yaml: edid: missing type definition
   Documentation/devicetree/bindings/cpufreq/operating-points-v2.yaml: opp-supported-hw: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/opp/opp-v2-base.yaml: opp-supported-hw: multiple incompatible types: uint32-matrix
   Documentation/devicetree/bindings/arm/vexpress-config.yaml: arm,vexpress-sysreg,func: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/hwmon/vexpress.yaml: arm,vexpress-sysreg,func: multiple incompatible types: phandle-array
   Warning: Duplicate compatible "operating-points-v2" found in schemas matching "$id":
   	http://devicetree.org/schemas/cpufreq/operating-points-v2.yaml#
   	http://devicetree.org/schemas/opp/opp-v2.yaml#
>> Warning: Duplicate compatible "aspeed,ast2500-gfx" found in schemas matching "$id":
   	http://devicetree.org/schemas/gpu/aspeed,ast2500-gfx.yaml#
   	http://devicetree.org/schemas/aspeed,ast2500-gfx.yaml#
   Warning: Duplicate compatible "active-semi,act8945a" found in schemas matching "$id":
   	http://devicetree.org/schemas/regulator/active-semi,act8945a.yaml#
   	http://devicetree.org/schemas/mfd/active-semi,act8945a.yaml#
   Warning: Duplicate compatible "fsi-master" found in schemas matching "$id":
   	http://devicetree.org/schemas/aspeed,ast2400-cf-fsi-master.yaml#
   	http://devicetree.org/schemas/fsi-master.yaml#
   Warning: Duplicate compatible "fsi-master" found in schemas matching "$id":
   	http://devicetree.org/schemas/fsi-master.yaml#
   	http://devicetree.org/schemas/fsi-master-gpio.yaml#
   Warning: Duplicate compatible "marvell,armada-3700-periph-clock-nb" found in schemas matching "$id":
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock-nb.yaml#
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock.yaml#
   Warning: Duplicate compatible "marvell,armada-3700-periph-clock-sb" found in schemas matching "$id":
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock-sb.yaml#
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock.yaml#
   Warning: Duplicate compatible "st,lis302dl-spi" found in schemas matching "$id":
   	http://devicetree.org/schemas/iio/accel/st,lis3lv02d.yaml#
   	http://devicetree.org/schemas/iio/st,st-sensors.yaml#
   Warning: Duplicate compatible "st,lis3lv02d" found in schemas matching "$id":
   	http://devicetree.org/schemas/iio/accel/st,lis3lv02d.yaml#
   	http://devicetree.org/schemas/iio/st,st-sensors.yaml#
   Warning: Duplicate compatible "fsl,vf610-mscm-ir" found in schemas matching "$id":
   	http://devicetree.org/schemas/interrupt-controller/fsl,vf610-mscm-ir.yaml#
   	http://devicetree.org/schemas/arm/freescale/fsl,vf610-mscm-ir.yaml#
   Warning: Duplicate compatible "ti,omap4-dss" found in schemas matching "$id":
   	http://devicetree.org/schemas/display/ti/ti,omap-dss.yaml#
   	http://devicetree.org/schemas/display/ti/ti,omap4-dss.yaml#
   Warning: Duplicate compatible "ti,opa362" found in schemas matching "$id":
   	http://devicetree.org/schemas/display/ti/ti,opa362.yaml#
   	http://devicetree.org/schemas/display/bridge/simple-bridge.yaml#
   Warning: Duplicate compatible "fsl,vf610-dcu" found in schemas matching "$id":
   	http://devicetree.org/schemas/display/fsl,ls1021a-dcu.yaml#
   	http://devicetree.org/schemas/display/fsl,dcu.yaml#
   Warning: Duplicate compatible "fsl,ls1021a-dcu" found in schemas matching "$id":
   	http://devicetree.org/schemas/display/fsl,ls1021a-dcu.yaml#
   	http://devicetree.org/schemas/display/fsl,dcu.yaml#
   Warning: Duplicate compatible "cdns,gpio-r1p02" found in schemas matching "$id":
   	http://devicetree.org/schemas/cdns,gpio-r1p02.yaml#
   	http://devicetree.org/schemas/gpio/cdns,gpio.yaml#
   Warning: Duplicate compatible "st" found in schemas matching "$id":
   	http://devicetree.org/schemas/stericsson,nomadik,src.yaml#
   	http://devicetree.org/schemas/st,comms-irb.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
