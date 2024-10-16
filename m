Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5AC1F80DC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 08:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729068244; cv=none; b=gfxG2JhbadwnX5/5STs2mE9Pphnp+GueLOvas+miQPr1iTbzBg443W71xu5MhgBPdyQaBIY4TsSs/vxRzwyADKHFlT7ofPfIU53rZ7uJZeOaRiJzElYb1wSNb8bTub/p+wJ17JlBLU54hWC33tmQObv+UAjTw7vCJpAmB0krVs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729068244; c=relaxed/simple;
	bh=ovYCMszWIER1qjHzBkN1V5VewHqdYpVmLLQ5uBnj0OY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tLm1htJ9O5v4sWZP2poCUUtShRU7Cv8K7WrHtWoaDEtsAuZZdIzHS961qQFK2xuYLvlmwSMB8isK3Ki22ef9m5ONxqKhFkCg1lCBgUZqf2TIhmyTsEgU/Gm6AKpe+Hz5UO86LvOW+sbCWJ8MUBlQ6GCmEomz+yRVXyxSdHQGzmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f4u+O4H8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f4u+O4H8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729068242; x=1760604242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ovYCMszWIER1qjHzBkN1V5VewHqdYpVmLLQ5uBnj0OY=;
  b=f4u+O4H8XpxTdqxdjbUtIJfRcbPSPd+9Rq6x73A/mT1tZ+YsMfBDmnv9
   FyKZw+B/jnKR9GjGs3BXTAh6QJA+ExSurd7Isz4RmRVKaNCrML1M4/qNE
   NuQGtl9JDCXXTyT1iW9U7otiVJdoIcRvglGuJayMItC9y19m5QFxwvImp
   /+FYmhDU588UqMYhPUNEQ/GLHudJGDpfpvPQSCjnkc6aim7LVtGkHABgG
   7yYT79MLn/lePt+PUy67NA0q7260b9HCUmvz+rk2EdRJ7ogp2c0vDNNBX
   KeMPV0FWPfIQp4yw9QljrFRAf4Wc3OXqp/ITHL4ETuifm9S7NU871zlBd
   Q==;
X-CSE-ConnectionGUID: DAJrgd4tQ9yH3VOcU5CKxw==
X-CSE-MsgGUID: SwX1ews8S8m40JE6yKZbDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39050739"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39050739"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 01:44:02 -0700
X-CSE-ConnectionGUID: RmLDbaXjShOgktylLEyUNA==
X-CSE-MsgGUID: Vx/F1DeGSEOOAA4wO8alzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="115602747"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Oct 2024 01:44:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0zdO-000Kda-1u;
	Wed, 16 Oct 2024 08:43:58 +0000
Date: Wed, 16 Oct 2024 16:43:35 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 4486/4954]
 arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: mcu: watchdog: False schema
 does not allow {'compatible': ['zii,rave-sp-watchdog']}
Message-ID: <202410161641.VhDGkeCC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   15e7d45e786a62a211dd0098fee7c57f84f8c681
commit: f4b00ab2c29960961f9641be8f3e8ba4960fd849 [4486/4954] dt-bindings: mfd: Convert zii,rave-sp.txt to yaml format
config: arm-randconfig-052-20241016 (https://download.01.org/0day-ci/archive/20241016/202410161641.VhDGkeCC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410161641.VhDGkeCC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410161641.VhDGkeCC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
>> arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: mcu: watchdog: False schema does not allow {'compatible': ['zii,rave-sp-watchdog']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: mcu: eeprom@a3: False schema does not allow {'compatible': ['zii,rave-sp-eeprom'], 'reg': [[163, 16384]], '#address-cells': 1, '#size-cells': 1, 'zii,eeprom-name': ['main-eeprom']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: mcu: Unevaluated properties are not allowed ('watchdog' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40000000/serial@40029000/mcu/watchdog: failed to match any schema with compatible: ['zii,rave-sp-watchdog']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40000000/serial@40029000/mcu/eeprom@a3: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: spi@4002c000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: spi@4002c000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: spi@4002d000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: spi@4002d000: dma-names:1: 'rx' was expected
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
>> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: mcu: watchdog: False schema does not allow {'compatible': ['zii,rave-sp-watchdog']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: mcu: eeprom@a3: False schema does not allow {'compatible': ['zii,rave-sp-eeprom'], 'reg': [[163, 16384]], '#address-cells': 1, '#size-cells': 1, 'zii,eeprom-name': ['main-eeprom']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: mcu: Unevaluated properties are not allowed ('watchdog' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40000000/serial@40028000/mcu/watchdog: failed to match any schema with compatible: ['zii,rave-sp-watchdog']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40000000/serial@40028000/mcu/eeprom@a3: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: spi@4002c000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: spi@4002c000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: spi@4002d000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: spi@4002d000: dma-names:1: 'rx' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
