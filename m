Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AF313957E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jan 2026 19:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769281324; cv=none; b=PWRMYFcxgtC7YdLvA1g5iJSS197oy8b53McU9c/o/Se0kKpYUiqCJDsm1vlYCnW+SJtJjWt0TEUPhQn2dLB1wfVCaA8z2uoT1OBn1DG1f0aYhaK9TUQpQNfkDbU/W8vLfHHGiIT7g9Vp3iBvLFBuG0eUkWioy1iC3m4WpuMWTk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769281324; c=relaxed/simple;
	bh=buQcjN2bwL0Kfj1ms8ZGBQthCWtTINRYC3PezyWcpuY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H5RAhj1ixlmAx4vvxB9EDYMzZOUIvcCr6NcdB6AbvhEF3ogdYREEfXaP/+JnO23vXgPTlk1QQO7wOG7BRKnMgEjaFHO1SNmjqhQzDTetzcQZr48uoy55H1rHvMC3suOt57/zyG4IRmeOX2ufSIiN6Er+6Ojz3aEFuPYMmFR5zE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EKHHCfWS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EKHHCfWS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769281321; x=1800817321;
  h=date:from:to:cc:subject:message-id;
  bh=buQcjN2bwL0Kfj1ms8ZGBQthCWtTINRYC3PezyWcpuY=;
  b=EKHHCfWSFU0JbqaKZ0JEbuTghyNVNCzC7Gk4J5il0McYQ8eAVl8a/qo9
   A1sshJiMoGOXMS9h9i1hdhL4cjn7QcdYHPhT3swenYAGo+MYtHQ6JIZGf
   bfVFK+my2mR8vhFlsNYqu3BrFbrXBzPWFGSTxdmON85umqc0uZEF+1JfM
   iEamOKdlCwPiZNcobUyyNWIQxny6cGQvYVh79m4SmOHUASJgEFtEti96V
   0PFUEpN7kC1KqHsrr5GPQuekYCGfhj862ldWvzXBt/ule364G5j+azutJ
   XzIATXBpjoBsJ5eSS2HudsDcTsa9M6vMKHnfjlihKAXuXzpgL6oL+cXja
   Q==;
X-CSE-ConnectionGUID: xHKvDnQoRCSdVhIVv+T7Gg==
X-CSE-MsgGUID: jnA+U74lRu6dr5KleOB4sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="73089446"
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="73089446"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 11:02:00 -0800
X-CSE-ConnectionGUID: HP1BM1pVTKmVALtwIrAmdA==
X-CSE-MsgGUID: oURji41yRaSWgs/xFyYBkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="207648433"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jan 2026 11:01:59 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjitQ-00000000137-2Hoe;
	Sat, 24 Jan 2026 19:01:56 +0000
Date: Sat, 24 Jan 2026 20:01:45 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 8655/9539]
 arch/powerpc/boot/dts/mgcoge.dtb: flash@5,0 (cfi-flash): Unevaluated
 properties are not allowed ('partition@app' was unexpected)
Message-ID: <202601242016.nEqJ7hEu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
commit: 1eb9fabd52933cdf9be349de5391920fac4ed30b [8655/9539] dt-bindings: mtd: Ensure partition node properties are documented
config: powerpc-randconfig-2051-20260124 (https://download.01.org/0day-ci/archive/20260124/202601242016.nEqJ7hEu-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.4.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601242016.nEqJ7hEu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601242016.nEqJ7hEu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/mgcoge.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
   arch/powerpc/boot/dts/mgcoge.dtb: /: failed to match any schema with compatible: ['keymile,km82xx']
   arch/powerpc/boot/dts/mgcoge.dtb: / (keymile,km82xx): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/mgcoge.dtb: localbus@f0010100 (fsl,mpc8247-localbus): flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/mgcoge.dtb: localbus@f0010100 (fsl,mpc8247-localbus): flash@5,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/mgcoge.dtb: /localbus@f0010100: failed to match any schema with compatible: ['fsl,mpc8247-localbus', 'fsl,pq2-localbus', 'simple-bus']
   arch/powerpc/boot/dts/mgcoge.dtb: /localbus@f0010100: failed to match any schema with compatible: ['fsl,mpc8247-localbus', 'fsl,pq2-localbus', 'simple-bus']
>> arch/powerpc/boot/dts/mgcoge.dtb: flash@5,0 (cfi-flash): Unevaluated properties are not allowed ('partition@app' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/mgcoge.dtb: flash@5,0 (cfi-flash): 'partition@app' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000: failed to match any schema with compatible: ['fsl,mpc8247-immr', 'fsl,pq2-soc', 'simple-bus']
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000: failed to match any schema with compatible: ['fsl,mpc8247-immr', 'fsl,pq2-soc', 'simple-bus']
   arch/powerpc/boot/dts/mgcoge.dtb: cpm@119c0 (fsl,mpc8247-cpm): muram:ranges: [[0, 0, 65536]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/mgcoge.dtb: cpm@119c0 (fsl,mpc8247-cpm): $nodename:0: 'cpm@119c0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/cpm@119c0: failed to match any schema with compatible: ['fsl,mpc8247-cpm', 'fsl,cpm2', 'simple-bus']
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: i2c@3100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: gpio-controller@f000 (fsl,mpc8572-gpio): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: gpio-controller@f000 (fsl,mpc8572-gpio): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: gpio-controller@f000 (fsl,mpc8572-gpio): '#gpio-cells' is a required property
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: i2c@3100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: gpio-controller@f000 (fsl,mpc8572-gpio): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: gpio-controller@f000 (fsl,mpc8572-gpio): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: gpio-controller@f000 (fsl,mpc8572-gpio): '#gpio-cells' is a required property
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /localbus@ffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /localbus@ffe05000/cpld@3,0: failed to match any schema with compatible: ['cpld']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: usb@22000 (fsl-usb2-dr-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: usb@22000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /localbus@fffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /localbus@fffe05000/cpld@3,0: failed to match any schema with compatible: ['cpld']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: usb@22000 (fsl-usb2-dr-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: usb@22000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /localbus@ffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /localbus@ffe05000/cpld@3,0: failed to match any schema with compatible: ['cpld']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: usb@22000 (fsl-usb2-dr-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: usb@22000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
--
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /localbus@ffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: usb@22000 (fsl-usb2-dr-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: usb@22000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
--
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /localbus@fffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /localbus@fffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: usb@22000 (fsl-usb2-dr-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: usb@22000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
--
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /localbus@ffe05000/pib@2,0: failed to match any schema with compatible: ['fsl,p1021mds-pib']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /localbus@ffe05000/pib@3,0: failed to match any schema with compatible: ['fsl,p1021mds-pib']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1021-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: usb@22000 (fsl-usb2-dr-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: usb@22000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
--
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1021-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /localbus@ffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1021-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: usb@22000 (fsl-usb2-dr-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: usb@22000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
--
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /localbus@fffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1021-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /localbus@fffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,p1021-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: usb@22000 (fsl-usb2-dr-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: usb@22000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
--
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1025-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1025-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1021-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: usb@22000 (fsl-usb2-dr-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: usb@22000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
--
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /localbus@fffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1025-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /localbus@fffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1025-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,p1021-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: usb@22000 (fsl-usb2-dr-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: usb@22000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
--
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@42000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@42000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@43000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@43000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: bman-portals@ff4000000 (simple-bus): $nodename:0: 'bman-portals@ff4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: qman-portals@ff4200000 (simple-bus): $nodename:0: 'qman-portals@ff4200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: soc@ffe000000 (simple-bus): soc-sram-error: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: i2c@118000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: i2c@118000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
--
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@42000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@42000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@43000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@43000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: bman-portals@ff4000000 (simple-bus): $nodename:0: 'bman-portals@ff4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: qman-portals@ff4200000 (simple-bus): $nodename:0: 'qman-portals@ff4200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: soc@ffe000000 (simple-bus): soc-sram-error: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: i2c@118100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: i2c@118100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
--
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@46000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@46000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@47000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@47000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: bman-portals@ff4000000 (simple-bus): $nodename:0: 'bman-portals@ff4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: qman-portals@ff4200000 (simple-bus): $nodename:0: 'qman-portals@ff4200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: soc@ffe000000 (simple-bus): soc-sram-error: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: i2c@118100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: i2c@118100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
--
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@40000: failed to match any schema with compatible: ['fsl,dcsr-e5500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@40000: failed to match any schema with compatible: ['fsl,dcsr-e5500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@41000: failed to match any schema with compatible: ['fsl,dcsr-e5500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@41000: failed to match any schema with compatible: ['fsl,dcsr-e5500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: bman-portals@ff4000000 (simple-bus): $nodename:0: 'bman-portals@ff4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: qman-portals@ff4200000 (simple-bus): $nodename:0: 'qman-portals@ff4200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: soc@ffe000000 (simple-bus): soc-sram-error: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: i2c@118100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: i2c@118100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
--
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@42000: failed to match any schema with compatible: ['fsl,dcsr-e5500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@42000: failed to match any schema with compatible: ['fsl,dcsr-e5500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@43000: failed to match any schema with compatible: ['fsl,dcsr-e5500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@43000: failed to match any schema with compatible: ['fsl,dcsr-e5500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: bman-portals@ff4000000 (simple-bus): $nodename:0: 'bman-portals@ff4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: qman-portals@ff4200000 (simple-bus): $nodename:0: 'qman-portals@ff4200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: soc@ffe000000 (simple-bus): soc-sram-error: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: i2c@118100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: i2c@118100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
