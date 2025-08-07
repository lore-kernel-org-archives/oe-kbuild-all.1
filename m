Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B193D3208
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 03:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754538354; cv=none; b=Byh3eh9e0eor4a8LfnX2ZwG2c2UhK7EyMH7QLZilfmYjD5DjcYOrrNOxiYp9CPXky4eSdAMg7BYyqksoPBOUHj/I89qi80dChGcfm2SIsnM2nfnLsL3oPuIAWZXYK9qu2C2jxqKN0e5aag7OVHM9CxzPwdiWcsetZuyd9H3H6nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754538354; c=relaxed/simple;
	bh=7MLv1exqpJZSSkfxjZgW/7w8fhqOJuAz8FmkSpyHDuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cQlvmVepA+7i6pwufKYVrwHLxfPtzZy8fn/QGnDSIQwc4YHaJq3eWq97msqhJg2A5pv6CynRGNJYzO8LnRopsowLhkfP1vvP9MtjjtiyngyvWoHDfdt+Sd7C94ce+2yHHkbxMFAz82Xfl6ERnZ5yS4U+ajnJmFrhAa4UrtKHpdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ak7mxlpU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ak7mxlpU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754538352; x=1786074352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7MLv1exqpJZSSkfxjZgW/7w8fhqOJuAz8FmkSpyHDuI=;
  b=Ak7mxlpUtaNDFxPUrEDEsuS1dDtZ3iBc91AMe3P76M5LvEgcW2NJDPc2
   xR5FvXn9aWnt4wX0qtXmSLwgai2qJIZAQwgKIMO8ernJ0mMAtC6qfambK
   5Zmp9+AAqSTssYj1LXa1zIGAUfBFgMPsD9S/iiQ1IF2cdAM2Fvjo2qI89
   vQURrsESKtn6Zq81qilrtK8m+sOeMNO2N1XvWWeR/ys3cB8Y1xf9qhFFA
   Sa5gmbM/sd+MT1BjWpfksdDWw+HUakrVQLT57qRUcSZgHV1lz7rEyJ3L+
   fJkw7ZudFIlSG3wQG7lAbJYUe1wxkbU05sP6Dux0lecdeYbryiTuyEbOB
   Q==;
X-CSE-ConnectionGUID: yhUhq0lCRMKp4rjoQK3k0Q==
X-CSE-MsgGUID: Y0LLi9fFRlyyJlBpNbAocw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="55900836"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="55900836"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 20:45:51 -0700
X-CSE-ConnectionGUID: ehUZ/G9dSWuHMAkHQDLjpg==
X-CSE-MsgGUID: Ht8LT2UFQ52/ufa/lwup1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165740938"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 06 Aug 2025 20:45:50 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujrZb-0002Jl-1y;
	Thu, 07 Aug 2025 03:45:47 +0000
Date: Thu, 7 Aug 2025 05:45:40 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [linux-next:master 13067/13293]
 arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /gpio-fsi: failed
 to match any schema with compatible: ['aspeed,ast2500-cf-fsi-master']
Message-ID: <202508070520.Mog1cQUi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   afec768a6a8fe7fb02a08ffce5f2f556f51d4b52
commit: 7f640cf1001b0b61008ad25b2e37444602265a47 [13067/13293] ARM: dts: aspeed: Drop "fsi-master" compatibles
config: arm-randconfig-2052-20250805 (https://download.01.org/0day-ci/archive/20250807/202508070520.Mog1cQUi-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508070520.Mog1cQUi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508070520.Mog1cQUi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: pca9555@21 (nxp,pca9555): '#address-cells', '#size-cells', 'gpio@0', 'gpio@1', 'gpio@2', 'gpio@3', 'gpio@4', 'gpio@5', 'gpio@6', 'gpio@7' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: pca9555@22 (nxp,pca9555): '#address-cells', '#size-cells', 'gpio@0', 'gpio@1', 'gpio@2', 'gpio@3', 'gpio@4', 'gpio@5', 'gpio@6', 'gpio@7' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: pca9555@23 (nxp,pca9555): '#address-cells', '#size-cells', 'gpio@0', 'gpio@1', 'gpio@2', 'gpio@3', 'gpio@4', 'gpio@5', 'gpio@6', 'gpio@7' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: pca9555@24 (nxp,pca9555): '#address-cells', '#size-cells', 'gpio@0', 'gpio@1', 'gpio@2', 'gpio@3', 'gpio@4', 'gpio@5', 'gpio@6', 'gpio@7' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: pca9555@25 (nxp,pca9555): '#address-cells', '#size-cells', 'gpio@0', 'gpio@1', 'gpio@2', 'gpio@3', 'gpio@4', 'gpio@5', 'gpio@6', 'gpio@7' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /gpio-fsi: failed to match any schema with compatible: ['aspeed,ast2500-cf-fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /gpio-fsi/cfam@0,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-i2c-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: sbefifo@2400 (ibm,p9-sbefifo): '#address-cells', '#size-cells', 'occ@1' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: occ@1 (ibm,p9-occ): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-occ.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /gpio-fsi/cfam@0,0/hub@3400: failed to match any schema with compatible: ['fsi-master-hub']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /gpio-fsi/cfam@0,0/hub@3400/cfam@1,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-i2c-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: sbefifo@2400 (ibm,p9-sbefifo): '#address-cells', '#size-cells', 'occ@2' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: occ@2 (ibm,p9-occ): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: kcs@28 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: kcs@2c (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: kcs@114 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2500-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2500-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: leds (gpio-leds): 'attention', 'bmc_err', 'hdd_fault', 'plt_fault', 'sys_boot_status', 'sys_err' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /gpio-fsi: failed to match any schema with compatible: ['fsi-master-gpio']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /gpio-fsi/cfam@0,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-i2c-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: sbefifo@2400 (ibm,p9-sbefifo): '#address-cells', '#size-cells', 'occ@1' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: occ@1 (ibm,p9-occ): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-occ.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /gpio-fsi/cfam@0,0/hub@3400: failed to match any schema with compatible: ['fsi-master-hub']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /gpio-fsi/cfam@0,0/hub@3400/cfam@1,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-i2c-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: sbefifo@2400 (ibm,p9-sbefifo): '#address-cells', '#size-cells', 'occ@2' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: occ@2 (ibm,p9-occ): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2500-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2500-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: pca9552@60 (nxp,pca9552): 'gpio@0', 'gpio@1', 'gpio@10', 'gpio@11', 'gpio@12', 'gpio@13', 'gpio@14', 'gpio@15', 'gpio@2', 'gpio@3', 'gpio@4', 'gpio@5', 'gpio@6', 'gpio@7', 'gpio@8', 'gpio@9' do not match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/bus@1e78a000/i2c@140/ir35221@28: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/bus@1e78a000/i2c@140/ir35221@29: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/bus@1e78a000/i2c@140/ir35221@2d: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: leds (gpio-leds): 'fan0', 'fan1', 'fan2', 'fan3', 'fan4', 'front-fault', 'front-id', 'power-button' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /gpio-fsi: failed to match any schema with compatible: ['fsi-master-gpio']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /gpio-fsi/cfam@0,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-i2c-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: sbefifo@2400 (ibm,p9-sbefifo): '#address-cells', '#size-cells', 'occ@1' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: occ@1 (ibm,p9-occ): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-occ.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /gpio-fsi/cfam@0,0/hub@3400: failed to match any schema with compatible: ['fsi-master-hub']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /gpio-fsi/cfam@0,0/hub@3400/cfam@1,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-i2c-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: sbefifo@2400 (ibm,p9-sbefifo): '#address-cells', '#size-cells', 'occ@2' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: occ@2 (ibm,p9-occ): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: kcs@28 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: kcs@2c (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: kcs@114 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2500-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2500-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: leds (gpio-leds): 'attention', 'fault', 'identify', 'power' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /gpio-fsi: failed to match any schema with compatible: ['aspeed,ast2500-cf-fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /gpio-fsi/cfam@0,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-i2c-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: sbefifo@2400 (ibm,p9-sbefifo): '#address-cells', '#size-cells', 'occ@1' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: occ@1 (ibm,p9-occ): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-occ.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /gpio-fsi/cfam@0,0/hub@3400: failed to match any schema with compatible: ['fsi-master-hub']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /gpio-fsi/cfam@0,0/hub@3400/cfam@1,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-i2c-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: sbefifo@2400 (ibm,p9-sbefifo): '#address-cells', '#size-cells', 'occ@2' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: occ@2 (ibm,p9-occ): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: /ahb/apb/pwm-tacho-controller@1e786000: failed to match any schema with compatible: ['aspeed,ast2400-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: lpc@1e789000 (aspeed,ast2400-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: lpc@1e789000 (aspeed,ast2400-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2400-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2400-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: /ahb/apb/bus@1e78a000/i2c@40/rtc@68: failed to match any schema with compatible: ['dallas,ds3231']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: leds (gpio-leds): 'heartbeat', 'identify', 'power' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: /gpio-fsi: failed to match any schema with compatible: ['aspeed,ast2400-cf-fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: /gpio-fsi/cfam@0,0/hub@3400: failed to match any schema with compatible: ['ibm,fsi-master-hub']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: kcs@28 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: kcs@2c (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: kcs@114 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2500-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2500-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: leds (gpio-leds): 'fault', 'identify', 'power' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /gpio-fsi: failed to match any schema with compatible: ['aspeed,ast2500-cf-fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /gpio-fsi/cfam@0,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-i2c-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: sbefifo@2400 (ibm,p9-sbefifo): '#address-cells', '#size-cells', 'occ@1' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: occ@1 (ibm,p9-occ): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-occ.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /gpio-fsi/cfam@0,0/hub@3400: failed to match any schema with compatible: ['fsi-master-hub']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /gpio-fsi/cfam@0,0/hub@3400/cfam@1,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-i2c-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: sbefifo@2400 (ibm,p9-sbefifo): '#address-cells', '#size-cells', 'occ@2' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: occ@2 (ibm,p9-occ): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/bus@1e78a000/i2c@140/ir35221@70: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/bus@1e78a000/i2c@140/ir35221@71: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/bus@1e78a000/i2c@180/ir35221@70: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/bus@1e78a000/i2c@180/ir35221@71: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: pca9552@60 (nxp,pca9552): 'gpio@0', 'gpio@1', 'gpio@10', 'gpio@11', 'gpio@12', 'gpio@13', 'gpio@14', 'gpio@15', 'gpio@2', 'gpio@3', 'gpio@4', 'gpio@5', 'gpio@6', 'gpio@7', 'gpio@8', 'gpio@9' do not match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/bus@1e78a000/i2c@400/ucd90160@64: failed to match any schema with compatible: ['ti,ucd90160']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: leds (gpio-leds): 'fan0', 'fan1', 'fan2', 'fan3', 'front-fault', 'front-id', 'front-power', 'power-button', 'rear-fault', 'rear-id', 'rear-power' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /gpio-fsi: failed to match any schema with compatible: ['fsi-master-gpio']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /gpio-fsi/cfam@0,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-i2c-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: sbefifo@2400 (ibm,p9-sbefifo): '#address-cells', '#size-cells', 'occ@1' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: occ@1 (ibm,p9-occ): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-occ.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /gpio-fsi/cfam@0,0/hub@3400: failed to match any schema with compatible: ['fsi-master-hub']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /gpio-fsi/cfam@0,0/hub@3400/cfam@1,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-i2c-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: sbefifo@2400 (ibm,p9-sbefifo): '#address-cells', '#size-cells', 'occ@2' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: occ@2 (ibm,p9-occ): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: kcs@114 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2500-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2500-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb/bus@1e78a000/i2c@40/ucd90160@64: failed to match any schema with compatible: ['ti,ucd90160']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb/bus@1e78a000/i2c@300/power-brick@6a: failed to match any schema with compatible: ['delta,dps800']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb/bus@1e78a000/i2c@300/power-brick@30: failed to match any schema with compatible: ['delta,dps800']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: leds (gpio-leds): 'attention', 'hdd_fault', 'plt_fault', 'sys_boot_status' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /gpio-fsi: failed to match any schema with compatible: ['fsi-master-gpio']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /gpio-fsi/cfam@0,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-i2c-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: sbefifo@2400 (ibm,p9-sbefifo): '#address-cells', '#size-cells', 'occ@1' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: occ@1 (ibm,p9-occ): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-occ.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /gpio-fsi/cfam@0,0/hub@3400: failed to match any schema with compatible: ['fsi-master-hub']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /gpio-fsi/cfam@0,0/hub@3400/cfam@1,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-i2c-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: sbefifo@2400 (ibm,p9-sbefifo): '#address-cells', '#size-cells', 'occ@2' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: occ@2 (ibm,p9-occ): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
