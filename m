Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337BC14038F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 07:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718955416; cv=none; b=DyUxlEjxShNgvXZ4z/Le/a/BVLyZ9aW/mFnSEiEL+vvKwXiWsTeyKbcniJ8c3xyI6icN1YzPA7KMCP6aebdqCNqilz0K5WQ+epxHFpPd2/QjLalax/3DdsAoVEMFuGHvxMPxC9d/7mJ31Fm0/qjE5ksTtrpZ4xRHQy9H5xDY6jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718955416; c=relaxed/simple;
	bh=2OJnLaGsKfTh4s8nppn7L61E9+mTSXZDEC7AzhNaszE=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cr1ziTIl0rJGOeGVfkFIXNuZFTKUaqaRr84f5pD264a28QYaD8NBU5d7+oVCX5ElinagPGqMe2GeEafJiKdPFv1KKqgIvSyWpAZk9YjWGqyLbBS7FpGGjy3Qerud3ZmMcwHPnt4aYVuOMk9Pmw42N9JjDBTHxO1MvFg4bGPcoV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=njnxTnBy; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="njnxTnBy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718955414; x=1750491414;
  h=date:from:cc:subject:message-id:mime-version;
  bh=2OJnLaGsKfTh4s8nppn7L61E9+mTSXZDEC7AzhNaszE=;
  b=njnxTnBy40+M2jKr5Nay1HAy8pvmn31uy+AEQ/3TmFbPX3fxDJXnxIb0
   ludhO0vDpYlnKF7bwMWMsm6/TM7Dp2HIMmdtzFNIMajq+pTVl8rStfXey
   Y9X6L4hPHX4mGWbM8Tlr8O2gswF8n8UrNH70P+GmS+8Eh6v+7axoq18ht
   HRSOE7mPSBLPdUy4YIGLQ0E10p1iSMe+wp4zaz0HYLRgvRUM6peCDWRmW
   ipRABB7p02g+lm4VjFShsv0F4CoPZZ0ghun6z+EjQZ7bnm11Q1RCkFpqs
   LiV7mJ3TTkLPZH5vRe/RnjJn0TrpG8ayFjeYv4aRAWCo9x+8wVrXfvT55
   w==;
X-CSE-ConnectionGUID: TmUMOGf6QwmKmab27jLOAQ==
X-CSE-MsgGUID: 0vLPq2qETSaldufjUIlbNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="27383359"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="27383359"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 00:36:53 -0700
X-CSE-ConnectionGUID: rcXvHvplSxW7/+CFql1EiA==
X-CSE-MsgGUID: j5z97+vtR92fc9xPXd+qsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="47434747"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Jun 2024 00:36:51 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKYpF-0008Kw-1f;
	Fri, 21 Jun 2024 07:36:49 +0000
Date: Fri, 21 Jun 2024 15:36:17 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 49/137]
 arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: serial@0: pinctrl-names:1:
 'wakeup' was expected
Message-ID: <202406211500.dBmCLDtu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   a71ffc827394d68b5d873555d67674f0b5868430
commit: 426ed3f5b3b21fbfee391953c3e9cf3d9dc4831f [49/137] dt-bindings: serial: 8250_omap: Add wakeup pinctrl state
config: arm-randconfig-051-20240621 (https://download.01.org/0day-ci/archive/20240621/202406211500.dBmCLDtu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406211500.dBmCLDtu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406211500.dBmCLDtu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@100000/target-module@f0000/prcm@0/prm@2000: failed to match any schema with compatible: ['ti,am4-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@100000/target-module@f0000/prcm@0/prm@2000: failed to match any schema with compatible: ['ti,am4-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@100000/target-module@f0000/prcm@0/prm@4000: failed to match any schema with compatible: ['ti,am4-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@100000/target-module@f0000/prcm@0/prm@4000: failed to match any schema with compatible: ['ti,am4-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: segment@200000: $nodename:0: 'segment@200000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: segment@200000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
>> arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: serial@0: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: serial@0: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/tps65218@24: failed to match any schema with compatible: ['ti,tps65218']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: at24@50: $nodename:0: 'at24@50' does not match '^eeprom@[0-9a-f]{1,2}$'
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: at24@50: Unevaluated properties are not allowed ('$nodename' was unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/tlv320aic3111@18: failed to match any schema with compatible: ['ti,tlv320aic3111']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/ov2659@30: failed to match any schema with compatible: ['ovti,ov2659']
--
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@100000/target-module@f0000/prcm@0/prm@2000: failed to match any schema with compatible: ['ti,am4-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@100000/target-module@f0000/prcm@0/prm@2000: failed to match any schema with compatible: ['ti,am4-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@100000/target-module@f0000/prcm@0/prm@4000: failed to match any schema with compatible: ['ti,am4-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@100000/target-module@f0000/prcm@0/prm@4000: failed to match any schema with compatible: ['ti,am4-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: segment@200000: $nodename:0: 'segment@200000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: segment@200000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
>> arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: serial@0: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: serial@0: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/tps65218@24: failed to match any schema with compatible: ['ti,tps65218']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@b000/i2c@0/ov2659@30: failed to match any schema with compatible: ['ovti,ov2659']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: tsc: 'ti,wires' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,am3359-tsc.yaml#
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: tsc: 'ti,x-plate-resistance' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,am3359-tsc.yaml#
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: tsc: 'ti,coordinate-readouts' is a required property
--
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@3e000/rtc@0: failed to match any schema with compatible: ['ti,am4372-rtc', 'ti,am3352-rtc', 'ti,da830-rtc']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@86000/counter@0: failed to match any schema with compatible: ['ti,am4372-counter32k', 'ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@44c00000/segment@200000/target-module@86000/counter@0: failed to match any schema with compatible: ['ti,am4372-counter32k', 'ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@48000000: failed to match any schema with compatible: ['ti,am4-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
>> arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: serial@0: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: serial@0: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@48000000/segment@0/target-module@2a000/i2c@0/ov2659@30: failed to match any schema with compatible: ['ovti,ov2659']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: edt-ft5306@38: compatible: ['edt,edt-ft5306', 'edt,edt-ft5x06'] is too long
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml#
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@48000000/segment@0/target-module@2a000/i2c@0/edt-ft5306@38: failed to match any schema with compatible: ['edt,edt-ft5306', 'edt,edt-ft5x06']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@48000000/segment@0/target-module@2a000/i2c@0/lis331dlh@18: failed to match any schema with compatible: ['st,lis331dlh']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@48000000/segment@0/target-module@60000/mmc@0: failed to match any schema with compatible: ['ti,am437-sdhci']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: segment@100000: $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
