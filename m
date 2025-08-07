Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9FB1F4162
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 16:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754585185; cv=none; b=lXC8by9mr5Wl7lnJYImTdYt0azKV1OKGyQDK0FzzSbOERj5R4V/aNqEr1XpAUzJRXQMW7CqT3QnBhXFARnuRHnncJP14gn2miqNC49/r9CfpITxTdGuUqdPPuORTJJX6EqJ1yoGFc/8HMAwIGIFx9QG4AYF/NNr58NAiTqQxLkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754585185; c=relaxed/simple;
	bh=RpV5kid0YRdSM2qV2oXMoExiJ6n5nGtRWp4ps61x1DM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YYkZSFrq3DZbhYIG3AZUg5JlbVVQS8PmGpbUPot+WJDDiseYEDVWb6XJZbhc9JErT+Ks4++Y0w4YAEb8hRhkeVUyGfBYXlvTcIwlvdpgXygBxllkoy3/UpOeZ/Yb/MMJrzZ78+UnwtuBfYM5oxuUyJy8EDw4hfJdCYwOKIFxf3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FKdVGhWO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKdVGhWO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754585184; x=1786121184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RpV5kid0YRdSM2qV2oXMoExiJ6n5nGtRWp4ps61x1DM=;
  b=FKdVGhWO03sZ6+66Derl1lmIDlKHnqfAKl8dtylItnIyQcHgHWv05qjV
   U9tpOxxt9d/BRJ+y9gSykb+416S4hcWA/CF2B0Y/Xt+QH8oY5nWSCXDcU
   Fl4isTJLqcHB1dwd1mj6HwU8OfOuuCzoujfNv1R5bfBBDmNe7nRIYQQfQ
   pabvLxmtF8DDE6L5bJfUo4JxVt8LerzlHCVGpzFDQ1ODmEynPsAUKcI3P
   nD414asyslunnWX9SYxuiE109S4Qszi3KgZZLUWHqy5I5SwKd0Zoeiul/
   mTyhFMqs6xWuR0PIwhpssJsACtVkPYdFn0XhaW/wQQTHSAwFxZahM9gN1
   w==;
X-CSE-ConnectionGUID: CVVJlhdZQpurB2/f5YuL1Q==
X-CSE-MsgGUID: pPNTUVXXSGWTqamrIRn/OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="82372988"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="82372988"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 09:46:23 -0700
X-CSE-ConnectionGUID: ZsWP06n3TpCb8t5n25wlVQ==
X-CSE-MsgGUID: 9J6YKGgjSMiuO9XKQNzRpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165489280"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 07 Aug 2025 09:46:22 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk3ky-00030S-0k;
	Thu, 07 Aug 2025 16:46:20 +0000
Date: Fri, 8 Aug 2025 00:46:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt-convert 310/801] Warning: Duplicate compatible
 "maxim,max77620" found in schemas matching "$id":
Message-ID: <202508080047.tMd2Ckgo-lkp@intel.com>
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
commit: 3fdf4bac0c64c98927221cd414ca06f99cb3adf9 [310/801] dt-bindings: mfd: Convert maxim,max77620 to DT schema
config: arc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250808/202508080047.tMd2Ckgo-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080047.tMd2Ckgo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508080047.tMd2Ckgo-lkp@intel.com/

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
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: bright-addr: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: gpio-ext: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: timers: missing type definition
   Documentation/devicetree/bindings/display/smi-sm501.yaml: edid: missing type definition
   Documentation/devicetree/bindings/cpufreq/operating-points-v2.yaml: opp-supported-hw: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/opp/opp-v2-base.yaml: opp-supported-hw: multiple incompatible types: uint32-matrix
   Documentation/devicetree/bindings/arm/vexpress-config.yaml: arm,vexpress-sysreg,func: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/hwmon/vexpress.yaml: arm,vexpress-sysreg,func: multiple incompatible types: phandle-array
   Warning: Duplicate compatible "operating-points-v2" found in schemas matching "$id":
   	http://devicetree.org/schemas/cpufreq/operating-points-v2.yaml#
   	http://devicetree.org/schemas/opp/opp-v2.yaml#
   Warning: Duplicate compatible "aspeed,ast2500-gfx" found in schemas matching "$id":
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
   Warning: Duplicate compatible "marvell,armada-3700-periph-clock-sb" found in schemas matching "$id":
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock-sb.yaml#
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock.yaml#
   Warning: Duplicate compatible "marvell,armada-3700-periph-clock-nb" found in schemas matching "$id":
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock-nb.yaml#
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
>> Warning: Duplicate compatible "maxim,max77620" found in schemas matching "$id":
   	http://devicetree.org/schemas/mfd/maxim,max77620.yaml#
   	http://devicetree.org/schemas/trivial-gpio.yaml#
   Warning: Duplicate compatible "cdns,gpio-r1p02" found in schemas matching "$id":
   	http://devicetree.org/schemas/cdns,gpio-r1p02.yaml#
   	http://devicetree.org/schemas/gpio/cdns,gpio.yaml#
   Warning: Duplicate compatible "st" found in schemas matching "$id":
   	http://devicetree.org/schemas/stericsson,nomadik,src.yaml#
   	http://devicetree.org/schemas/st,comms-irb.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
