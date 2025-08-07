Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DF43FE7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 21:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754601669; cv=none; b=BkFQXy4REhq154XabQOHYT64hBk9+jUNrR7Y8Ki0lJky+Nt/5S7OhReymFoVsHlmHsABpB4/QUHlEEpsYmN124SORqa+jypffRnjihidltHTbcUetFTOHMYvyyNXu5s/vsihkErEWSFCAVE9trQw8qRUwfqMfYXlPqn92SSZNSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754601669; c=relaxed/simple;
	bh=4Zt6vJ14HzhHUF8rsAmEWrdHPkLoKvqqr8cYyuauRas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OAQZ6xcYt2+BHurI7FPHpDa4oFx/IO+lcyTOTrrqhRzqBFFGVFcxmCLqTTl2xnUHbYcyPIoEvdlW1feXrlYsophD1mWPwVZ/UF/jyfyw54ittK9JG+lnwt4pts04IKLVy3yPr3A1SBbeTlrSWs/uD0imRK03ILj3DhTEX03NtXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kWiCRu6M; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kWiCRu6M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754601665; x=1786137665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Zt6vJ14HzhHUF8rsAmEWrdHPkLoKvqqr8cYyuauRas=;
  b=kWiCRu6MDDNDcbD7Pm6l84ILO0pBYLjaKi/oS7zBN/304nsCL46bhAnx
   duTMiU/gbnoavrfdpe7UEafTxW7Q7ZfIE/K/9Knt+iyeWLso0wwtb8+it
   hFGU6NKcUKlwNBtU4USDnpB1NChk88xyfH9j1kOdhb473iuJ/L2Psp0WZ
   /oFPjFONfrVYT0jmj5Ql1J/qi0mu3IlOtsPlIv3jgnkzgYCcHL7AKX7VK
   JwGst23aJostIfQqMsj7AfusySRvHmUmopAci9HxGeqb7kCe7jen5sOYq
   7SJSOILd1E8S3SjERKljAI4sMY3+ExPmPEe1rJ9ZEFUka2m60q1bCdKLH
   Q==;
X-CSE-ConnectionGUID: rXubSHJAQ8+VuX/QW5qfBQ==
X-CSE-MsgGUID: o3wxQj/dS6id+s/6uuROog==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56914373"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="56914373"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 14:21:05 -0700
X-CSE-ConnectionGUID: 3GHvSUPESkWJ7ZCwwQ8hCQ==
X-CSE-MsgGUID: mRm9KlwgSC+pFDTkHtpr3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="165959672"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 07 Aug 2025 14:21:03 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk82n-0003F8-0M;
	Thu, 07 Aug 2025 21:21:01 +0000
Date: Fri, 8 Aug 2025 05:20:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt-convert 419/801] Warning: Duplicate compatible
 "atmel,at86rf212" found in schemas matching "$id":
Message-ID: <202508080539.zbC6yGpt-lkp@intel.com>
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
commit: 4f697edf4ab749b8101bf3ca93825b08005a9e8f [419/801] dt-bindings: net: Convert ieee802154/at86rf230 to DT schema
config: arc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250808/202508080539.zbC6yGpt-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080539.zbC6yGpt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508080539.zbC6yGpt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/devicetree/bindings/iommu/nvidia,tegra30-smmu.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/dma/ti,edma3-tpcc.yaml: ti,tptcs: missing type definition
   Documentation/devicetree/bindings/dma/ti,edma3-tpcc.yaml: ti,edma-reserved-slot-ranges: missing type definition
   Documentation/devicetree/bindings/memory-controllers/atmel,ebi.yaml: atmel,smc-page-mode: missing type definition
   Documentation/devicetree/bindings/memory-controllers/marvell,mvebu-devbus.yaml: devbus,bus-width: missing type definition
   Documentation/devicetree/bindings/mmc/cavium,octeon-6130-mmc.yaml: cavium,bus-max-width: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: isel: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: fdim: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,short-detection-threshold-volt: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,current-limit-mA: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: bright-addr: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: gpio-ext: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: timers: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: mal-tx-channel: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: mal-rx-channel: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: rx-fifo-size: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: tx-fifo-size: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: fifo-entry-size: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: mal-burst-size: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: zmii-channel: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: rgmii-channel: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: phy-address: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: phy-map: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: rx-fifo-size-gige: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: tx-fifo-size-gige: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: tah-channel: missing type definition
   Documentation/devicetree/bindings/display/smi-sm501.yaml: edid: missing type definition
   Documentation/devicetree/bindings/cpufreq/operating-points-v2.yaml: opp-supported-hw: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/opp/opp-v2-base.yaml: opp-supported-hw: multiple incompatible types: uint32-matrix
   Documentation/devicetree/bindings/arm/vexpress-config.yaml: arm,vexpress-sysreg,func: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/hwmon/vexpress.yaml: arm,vexpress-sysreg,func: multiple incompatible types: phandle-array
   Warning: Duplicate compatible "operating-points-v2" found in schemas matching "$id":
   	http://devicetree.org/schemas/cpufreq/operating-points-v2.yaml#
   	http://devicetree.org/schemas/opp/opp-v2.yaml#
   Warning: Duplicate compatible "brcm,bcm7445-switch-v4.0" found in schemas matching "$id":
   	http://devicetree.org/schemas/net/dsa/brcm,sf2.yaml#
   	http://devicetree.org/schemas/brcm,bcm7445-switch-v4.0.yaml#
>> Warning: Duplicate compatible "atmel,at86rf212" found in schemas matching "$id":
   	http://devicetree.org/schemas/net/ieee802154/at86rf230.yaml#
   	http://devicetree.org/schemas/net/ieee802154/atmel,at86rf233.yaml#
>> Warning: Duplicate compatible "atmel,at86rf230" found in schemas matching "$id":
   	http://devicetree.org/schemas/net/ieee802154/at86rf230.yaml#
   	http://devicetree.org/schemas/net/ieee802154/atmel,at86rf233.yaml#
>> Warning: Duplicate compatible "atmel,at86rf231" found in schemas matching "$id":
   	http://devicetree.org/schemas/net/ieee802154/at86rf230.yaml#
   	http://devicetree.org/schemas/net/ieee802154/atmel,at86rf233.yaml#
>> Warning: Duplicate compatible "atmel,at86rf233" found in schemas matching "$id":
   	http://devicetree.org/schemas/net/ieee802154/at86rf230.yaml#
   	http://devicetree.org/schemas/net/ieee802154/atmel,at86rf233.yaml#
   Warning: Duplicate compatible "aspeed,ast2500-gfx" found in schemas matching "$id":
   	http://devicetree.org/schemas/gpu/aspeed,ast2500-gfx.yaml#
   	http://devicetree.org/schemas/aspeed,ast2500-gfx.yaml#
   Warning: Duplicate compatible "ti,lm36274" found in schemas matching "$id":
   	http://devicetree.org/schemas/leds/ti,lm36274.yaml#
   	http://devicetree.org/schemas/mfd/ti-lmu.yaml#
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
   Warning: Duplicate compatible "st" found in schemas matching "$id":
   	http://devicetree.org/schemas/mmc/st,sdhci.yaml#
   	http://devicetree.org/schemas/stericsson,nomadik,src.yaml#
   Warning: Duplicate compatible "ti,omap4-dss" found in schemas matching "$id":
   	http://devicetree.org/schemas/display/ti/ti,omap-dss.yaml#
   	http://devicetree.org/schemas/display/ti/ti,omap4-dss.yaml#
   Warning: Duplicate compatible "ti,opa362" found in schemas matching "$id":
   	http://devicetree.org/schemas/display/ti/ti,opa362.yaml#
   	http://devicetree.org/schemas/display/bridge/simple-bridge.yaml#
   Warning: Duplicate compatible "fsl,ls1021a-dcu" found in schemas matching "$id":
   	http://devicetree.org/schemas/display/fsl,ls1021a-dcu.yaml#
   	http://devicetree.org/schemas/display/fsl,dcu.yaml#
   Warning: Duplicate compatible "fsl,vf610-dcu" found in schemas matching "$id":
   	http://devicetree.org/schemas/display/fsl,ls1021a-dcu.yaml#
   	http://devicetree.org/schemas/display/fsl,dcu.yaml#
   Warning: Duplicate compatible "maxim,max77620" found in schemas matching "$id":
   	http://devicetree.org/schemas/mfd/maxim,max77620.yaml#
   	http://devicetree.org/schemas/trivial-gpio.yaml#
   Warning: Duplicate compatible "cdns,gpio-r1p02" found in schemas matching "$id":
   	http://devicetree.org/schemas/cdns,gpio-r1p02.yaml#
   	http://devicetree.org/schemas/gpio/cdns,gpio.yaml#
   Warning: Duplicate compatible "brcm,bcm6328" found in schemas matching "$id":
   	http://devicetree.org/schemas/mips/brcm/brcm,bcm3368.yaml#
   	http://devicetree.org/schemas/mips/brcm/soc.yaml#
   Warning: Duplicate compatible "brcm,bcm63268" found in schemas matching "$id":
   	http://devicetree.org/schemas/mips/brcm/brcm,bcm3368.yaml#
   	http://devicetree.org/schemas/mips/brcm/soc.yaml#
   Warning: Duplicate compatible "brcm,bcm3384" found in schemas matching "$id":
   	http://devicetree.org/schemas/mips/brcm/brcm,bcm3368.yaml#
   	http://devicetree.org/schemas/mips/brcm/soc.yaml#
   Warning: Duplicate compatible "brcm,bcm6358" found in schemas matching "$id":
   	http://devicetree.org/schemas/mips/brcm/brcm,bcm3368.yaml#
   	http://devicetree.org/schemas/mips/brcm/soc.yaml#
   Warning: Duplicate compatible "brcm,bcm33843" found in schemas matching "$id":
   	http://devicetree.org/schemas/mips/brcm/brcm,bcm3368.yaml#
   	http://devicetree.org/schemas/mips/brcm/soc.yaml#
   Warning: Duplicate compatible "brcm,bcm7125" found in schemas matching "$id":
   	http://devicetree.org/schemas/mips/brcm/brcm,bcm3368.yaml#
   	http://devicetree.org/schemas/mips/brcm/soc.yaml#
   Warning: Duplicate compatible "brcm,bcm7420" found in schemas matching "$id":
   	http://devicetree.org/schemas/mips/brcm/brcm,bcm3368.yaml#
   	http://devicetree.org/schemas/mips/brcm/soc.yaml#
   Warning: Duplicate compatible "brcm,bcm63168" found in schemas matching "$id":
   	http://devicetree.org/schemas/mips/brcm/brcm,bcm3368.yaml#
   	http://devicetree.org/schemas/mips/brcm/soc.yaml#
   Warning: Duplicate compatible "brcm,bcm7360" found in schemas matching "$id":
   	http://devicetree.org/schemas/mips/brcm/brcm,bcm3368.yaml#
   	http://devicetree.org/schemas/mips/brcm/soc.yaml#
   Warning: Duplicate compatible "brcm,bcm7346" found in schemas matching "$id":
   	http://devicetree.org/schemas/mips/brcm/brcm,bcm3368.yaml#
   	http://devicetree.org/schemas/mips/brcm/soc.yaml#
   Warning: Duplicate compatible "brcm,bcm33843-viper" found in schemas matching "$id":
   	http://devicetree.org/schemas/mips/brcm/brcm,bcm3368.yaml#
   	http://devicetree.org/schemas/mips/brcm/soc.yaml#
   Warning: Duplicate compatible "brcm,bcm6368" found in schemas matching "$id":
   	http://devicetree.org/schemas/mips/brcm/brcm,bcm3368.yaml#
   	http://devicetree.org/schemas/mips/brcm/soc.yaml#
   Warning: Duplicate compatible "brcm,bcm7425" found in schemas matching "$id":
   	http://devicetree.org/schemas/mips/brcm/brcm,bcm3368.yaml#
   	http://devicetree.org/schemas/mips/brcm/soc.yaml#
   Warning: Duplicate compatible "brcm,bcm3384-viper" found in schemas matching "$id":
   	http://devicetree.org/schemas/mips/brcm/brcm,bcm3368.yaml#
   	http://devicetree.org/schemas/mips/brcm/soc.yaml#
   Warning: Duplicate compatible "brcm,bcm6362" found in schemas matching "$id":
   	http://devicetree.org/schemas/mips/brcm/brcm,bcm3368.yaml#
   	http://devicetree.org/schemas/mips/brcm/soc.yaml#
   Warning: Duplicate compatible "brcm,bcm7362" found in schemas matching "$id":
   	http://devicetree.org/schemas/mips/brcm/brcm,bcm3368.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
