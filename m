Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0D44437A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 May 2025 03:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746415966; cv=none; b=k1BvVLFgCGbKQPnTM/4aBmCjCO4xY3tn7KSdvZ56L7scyKLutCjDlt0JQ4tDS6CV0CQ49Viird5PwzgS6qGi53xeFcst1hB66Gh193HkK/S6nzJ4UIc/3+ECFb0EJgtkUhMVzHcBvLNgKKT7x1GHTXK24gPRlHqNpRnVC3THaZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746415966; c=relaxed/simple;
	bh=djqiVtzUHnV4wa8Gth7KDopA+mrk1ZEcpQDToOaguBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EtWRjh/0DDAxuVGtML9GnAdX+wAi0tBve8JNgMW4y82yG59I5qkg8tW4kwBVNghhKFuXyiwLId/5JmeKuz6kBhT5bsEK9Znh6BhwsQGm6TdZ31jfPQNJTWzvTEoLGJf3vh29V0gI6p1g4hemBATB4jnm6m5RiY6bPef4EnFcGVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g4gVw/Gg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g4gVw/Gg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746415964; x=1777951964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=djqiVtzUHnV4wa8Gth7KDopA+mrk1ZEcpQDToOaguBA=;
  b=g4gVw/Ggh8nFPwqiaPiHfnrgXeej2lQ91DQCkBfZPxp/UAUU47+tO4eL
   9ba2jwXqSo+0Z7cnmzeq1EKdF+aDlrNSiXYEM8ej5I6Qc3blJmBeUZq5z
   wwG643eVtM+bRrlYCekA8VL1cy/4f4wMyBvRdfKJcPX8fxqixMjS4d6kF
   ZvPgXIiJ8PQ52rGxvt+KJOv6hbZHIwG70cmHxSO8llAxGZmeC1i5rQtNs
   0269X63pl/OE5BaIfQAS6FsdeO4g9cRsuFELwk24ldYx5KrUGexaUXcRj
   prH3+JPdmD5wx5QgXuHKDy5HC4YmPVsyGTiFTTVPCVzxp4LLHu7KhUKCY
   A==;
X-CSE-ConnectionGUID: rDYInVNiSQmhjfiHWBbw+A==
X-CSE-MsgGUID: RLFY26VZS9ivoVl3PccrdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="59402898"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="59402898"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2025 20:32:44 -0700
X-CSE-ConnectionGUID: zcjEGqBEQ+6pa2kOKwp3lQ==
X-CSE-MsgGUID: LThovuvOSFiIm2rha/Vy1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="135099495"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 May 2025 20:32:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uBmZL-0005QE-1e;
	Mon, 05 May 2025 03:32:39 +0000
Date: Mon, 5 May 2025 11:31:57 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 6047/7938]
 arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: nand@400e0000
 (fsl,vf610-nfc): $nodename:0: 'nand@400e0000' does not match
 '^nand-controller(@.*)?'
Message-ID: <202505040721.KPahmdtB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3e039dcc9c1320c0d33ddd51c372dcc91d3ea3c7
commit: 78693ff68c8c8aa8b8553351e8548386cccdd0c6 [6047/7938] dt-bindings: mtd: convert vf610-nfc to yaml format
config: arm-randconfig-051-20250430 (https://download.01.org/0day-ci/archive/20250504/202505040721.KPahmdtB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250504/202505040721.KPahmdtB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505040721.KPahmdtB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40000000/timing-controller@4003d000: failed to match any schema with compatible: ['fsl,vf610-tcon']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: ftm@400b8000 (fsl,ftm-timer): reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
>> arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: nand@400e0000 (fsl,vf610-nfc): $nodename:0: 'nand@400e0000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
>> arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: nand@400e0000 (fsl,vf610-nfc): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: pmu@40089000 (arm,cortex-a5-pmu): 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: panel (edt,et057090dhu): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/timing-controller@4003d000: failed to match any schema with compatible: ['fsl,vf610-tcon']
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: ftm@400b8000 (fsl,ftm-timer): reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: nand@400e0000 (fsl,vf610-nfc): $nodename:0: 'nand@400e0000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: nand@400e0000 (fsl,vf610-nfc): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: pmu@40089000 (arm,cortex-a5-pmu): 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /spi/gpio@0: failed to match any schema with compatible: ['pisosr-gpio']
--
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40000000/timing-controller@4003d000: failed to match any schema with compatible: ['fsl,vf610-tcon']
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: ftm@400b8000 (fsl,ftm-timer): reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: nand@400e0000 (fsl,vf610-nfc): $nodename:0: 'nand@400e0000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: nand@400e0000 (fsl,vf610-nfc): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: pmu@40089000 (arm,cortex-a5-pmu): 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: panel (edt,et057090dhu): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: /soc/bus@40000000/timing-controller@4003d000: failed to match any schema with compatible: ['fsl,vf610-tcon']
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: ftm@400b8000 (fsl,ftm-timer): reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: nand@400e0000 (fsl,vf610-nfc): $nodename:0: 'nand@400e0000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: /soc/bus@40000000/timing-controller@4003d000: failed to match any schema with compatible: ['fsl,vf610-tcon']
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: ftm@400b8000 (fsl,ftm-timer): reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: nand@400e0000 (fsl,vf610-nfc): $nodename:0: 'nand@400e0000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: pmu@40089000 (arm,cortex-a5-pmu): 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /soc/bus@40000000/timing-controller@4003d000: failed to match any schema with compatible: ['fsl,vf610-tcon']
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: ftm@400b8000 (fsl,ftm-timer): reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: nand@400e0000 (fsl,vf610-nfc): $nodename:0: 'nand@400e0000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/spi@4002c000/at26df081a@0: failed to match any schema with compatible: ['atmel,at26df081a']
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/timing-controller@4003d000: failed to match any schema with compatible: ['fsl,vf610-tcon']
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: ftm@400b8000 (fsl,ftm-timer): reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: nand@400e0000 (fsl,vf610-nfc): $nodename:0: 'nand@400e0000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: nand@400e0000 (fsl,vf610-nfc): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: pmu@40089000 (arm,cortex-a5-pmu): 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40000000/timing-controller@4003d000: failed to match any schema with compatible: ['fsl,vf610-tcon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: ftm@400b8000 (fsl,ftm-timer): reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: nand@400e0000 (fsl,vf610-nfc): $nodename:0: 'nand@400e0000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: pmu@40089000 (arm,cortex-a5-pmu): 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: sfp (sff,sff): 'los-gpio', 'tx-disable-gpio' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/sff,sfp.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: /soc/bus@40000000/timing-controller@4003d000: failed to match any schema with compatible: ['fsl,vf610-tcon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: iomuxc@40048000 (fsl,vf610-iomuxc): i2c0grp-gpio: {'fsl,pins': [[144, 0, 0, 0, 12738, 148, 0, 0, 0, 12738]], 'phandle': 19} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: ftm@400b8000 (fsl,ftm-timer): reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: nand@400e0000 (fsl,vf610-nfc): $nodename:0: 'nand@400e0000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: pmu@40089000 (arm,cortex-a5-pmu): 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: iomuxc@40048000 (fsl,vf610-iomuxc): i2c0grp-gpio: {'fsl,pins': [[144, 0, 0, 0, 12738, 148, 0, 0, 0, 12738]], 'phandle': 25} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: sx1503@20 (semtech,sx1503q): $nodename:0: 'sx1503@20' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/semtech,sx1501q.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: ftm@400b8000 (fsl,ftm-timer): reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: nand@400e0000 (fsl,vf610-nfc): $nodename:0: 'nand@400e0000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: pmu@40089000 (arm,cortex-a5-pmu): 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40000000/timing-controller@4003d000: failed to match any schema with compatible: ['fsl,vf610-tcon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40000000/i2c@40067000/adc@4a: failed to match any schema with compatible: ['adi,adt7411']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: ftm@400b8000 (fsl,ftm-timer): reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: nand@400e0000 (fsl,vf610-nfc): $nodename:0: 'nand@400e0000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: io-expander@20 (semtech,sx1503q): $nodename:0: 'io-expander@20' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/semtech,sx1501q.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40080000/i2c@400e6000/adc@4a: failed to match any schema with compatible: ['adi,adt7411']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: i2c-mux@70 (nxp,pca9548): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: i2c-mux@71 (nxp,pca9548): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: pmu@40089000 (arm,cortex-a5-pmu): 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40000000/timing-controller@4003d000: failed to match any schema with compatible: ['fsl,vf610-tcon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: ftm@400b8000 (fsl,ftm-timer): reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: nand@400e0000 (fsl,vf610-nfc): $nodename:0: 'nand@400e0000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: pmu@40089000 (arm,cortex-a5-pmu): 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40000000/timing-controller@4003d000: failed to match any schema with compatible: ['fsl,vf610-tcon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: ftm@400b8000 (fsl,ftm-timer): reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: nand@400e0000 (fsl,vf610-nfc): $nodename:0: 'nand@400e0000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: pmu@40089000 (arm,cortex-a5-pmu): 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40000000/timing-controller@4003d000: failed to match any schema with compatible: ['fsl,vf610-tcon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: ftm@400b8000 (fsl,ftm-timer): reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: nand@400e0000 (fsl,vf610-nfc): $nodename:0: 'nand@400e0000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: pmu@40089000 (arm,cortex-a5-pmu): 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
