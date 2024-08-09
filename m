Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C5812B71
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Aug 2024 01:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723168378; cv=none; b=nmhcbXVvZs3aEcLvGlq6wr0T7VEgoZd3ExM/dMc+PdhfRVLucmTTM9eoBGsAk2vejv3SfkZ/FU1HvCOJxlgNZb7zD7MigA50oUJ8S2itz2KHPIfCGwCYIiHHxaDpM3ldL2xT4hNEyHR82A70RgjrACJsqXxu9AuYkWAZhhm5n6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723168378; c=relaxed/simple;
	bh=dENwsmHiRPgUY2Up6eDgfyy4UFpurg+K7RaOsOlNlqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IXJIzJR6fU9AjXw+DLGiPJJ4Aa5NryAoG767dBk4p0F9eWxPb0cn7Tc7jjKWO0gLEfMFTiX6lsdEd/RogeRZHjaNuMr/kuvWDYIg+AMPi1gbHhwqMy80mlxgq1p2+E8JsHSQKJd/n6FK/0oAsXSTZ5+a/8pA2p1/NGyKh3RvaO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cGeDUXPc; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cGeDUXPc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723168375; x=1754704375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dENwsmHiRPgUY2Up6eDgfyy4UFpurg+K7RaOsOlNlqY=;
  b=cGeDUXPcUWzCcy9S/7mxpHQF5vFGDsCNFpZcUh+7e46qA7aPyBziRjeB
   XjVPsES5LyaBQdO/zDfKTUa720twzwxk3JBkOGczlNelU7UHxlFQN8Us5
   VhlvsZB1VewF/9Q7Y2X35bg5R1FkP9pY9fTFgChnQn3SLvHNmGIsnvV/c
   kViuDA+o7bcTeS4aY7L8kNNIxmwq/H9KD/xv5BJ3IRQxkFaRiNXonISf4
   yVTADS/xsTYchOvalTCjpdlIbxVCu6Bt1LclKyVTt61sZkp8uAHFvaQs4
   1ajqIIwOb3Co1w032ghioPm12MCtHcykN1r3Fxi5mKUEYVnE/JfnQWeKg
   g==;
X-CSE-ConnectionGUID: 362vHGKVRfOq8Nre+maVQw==
X-CSE-MsgGUID: rnJYh1pMR+Koxehzwy8TIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="43843360"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="43843360"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 18:52:53 -0700
X-CSE-ConnectionGUID: HIoE4wSRQg2KtZeA9PZwyQ==
X-CSE-MsgGUID: ogvVY7d0Q0OTuU6/rvNiIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="57289856"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 08 Aug 2024 18:52:52 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scEoD-0006l4-1Z;
	Fri, 09 Aug 2024 01:52:49 +0000
Date: Fri, 9 Aug 2024 09:52:02 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 3357/3555]
 arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: power-controller@1ee2140:
 '#power-domain-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202408090928.6ONCyq4v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   eec5d86d5bac6b3e972eb9c1898af3c08303c52d
commit: ad21e3840a88bc781572a82cb54473b54726d185 [3357/3555] dt-bindings: soc: fsl: Convert rcpm to yaml format
config: arm-randconfig-051-20240807 (https://download.01.org/0day-ci/archive/20240809/202408090928.6ONCyq4v-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090928.6ONCyq4v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408090928.6ONCyq4v-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/mdio@2d64000: failed to match any schema with compatible: ['gianfar']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/ethernet@2d10000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/ethernet@2d50000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/ethernet@2d90000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: usb@3100000: Unevaluated properties are not allowed ('snps,host-vbus-glitches' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: pcie@3400000: fsl,pcie-scfg:0: [16, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: pcie@3500000: fsl,pcie-scfg:0: [16, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: power-controller@1ee2140: '#power-domain-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: timer0@29d0000: $nodename:0: 'timer0@29d0000' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/fsl,ls-ftm-alarm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: timer0@29d0000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/rtc/fsl,ls-ftm-alarm.yaml#
--
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: /soc/mdio@2d64000: failed to match any schema with compatible: ['gianfar']
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: /soc/ethernet@2d10000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: /soc/ethernet@2d50000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: /soc/ethernet@2d90000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: usb@3100000: Unevaluated properties are not allowed ('snps,host-vbus-glitches' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: pcie@3400000: fsl,pcie-scfg:0: [11, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: pcie@3500000: fsl,pcie-scfg:0: [11, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: power-controller@1ee2140: '#power-domain-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: timer0@29d0000: $nodename:0: 'timer0@29d0000' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/fsl,ls-ftm-alarm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: timer0@29d0000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/rtc/fsl,ls-ftm-alarm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: leds: 'beeper', 'cel-pwr', 'cel-reset', 'cpu-diag-green', 'cpu-diag-red', 'cpu-diag-yellow', 'sw-ready', 'wifi-signal0', 'wifi-signal1', 'wifi-signal2' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: gpio-keys: pushbtn-key: Unevaluated properties are not allowed ('default-state' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
--
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/mdio@2d64000: failed to match any schema with compatible: ['gianfar']
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/ethernet@2d10000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/ethernet@2d50000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/ethernet@2d90000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: usb@3100000: Unevaluated properties are not allowed ('snps,host-vbus-glitches' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: pcie@3400000: fsl,pcie-scfg:0: [15, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: pcie@3500000: fsl,pcie-scfg:0: [15, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: power-controller@1ee2140: '#power-domain-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: timer0@29d0000: $nodename:0: 'timer0@29d0000' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/fsl,ls-ftm-alarm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: timer0@29d0000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/rtc/fsl,ls-ftm-alarm.yaml#
--
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: /soc/mdio@2d64000: failed to match any schema with compatible: ['gianfar']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: /soc/ethernet@2d10000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: /soc/ethernet@2d50000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: /soc/ethernet@2d90000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: usb@3100000: Unevaluated properties are not allowed ('snps,host-vbus-glitches' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: pcie@3400000: fsl,pcie-scfg:0: [19, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: pcie@3500000: fsl,pcie-scfg:0: [19, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: power-controller@1ee2140: '#power-domain-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: timer0@29d0000: $nodename:0: 'timer0@29d0000' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/fsl,ls-ftm-alarm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: timer0@29d0000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/rtc/fsl,ls-ftm-alarm.yaml#
--
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: /soc/mdio@2d64000: failed to match any schema with compatible: ['gianfar']
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: /soc/ethernet@2d10000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: /soc/ethernet@2d50000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: /soc/ethernet@2d90000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: usb@3100000: Unevaluated properties are not allowed ('snps,host-vbus-glitches' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: pcie@3400000: fsl,pcie-scfg:0: [21, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: pcie@3500000: fsl,pcie-scfg:0: [21, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: power-controller@1ee2140: '#power-domain-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: timer0@29d0000: $nodename:0: 'timer0@29d0000' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/fsl,ls-ftm-alarm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: timer0@29d0000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/rtc/fsl,ls-ftm-alarm.yaml#
--
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: /soc/mdio@2d64000: failed to match any schema with compatible: ['gianfar']
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: /soc/ethernet@2d10000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: /soc/ethernet@2d50000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: /soc/ethernet@2d90000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: usb@3100000: Unevaluated properties are not allowed ('snps,host-vbus-glitches' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: pcie@3400000: fsl,pcie-scfg:0: [16, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: pcie@3500000: fsl,pcie-scfg:0: [16, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: power-controller@1ee2140: '#power-domain-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: timer0@29d0000: $nodename:0: 'timer0@29d0000' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/fsl,ls-ftm-alarm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: timer0@29d0000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/rtc/fsl,ls-ftm-alarm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: panel: 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
