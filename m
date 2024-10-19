Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAACB36D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 00:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729296376; cv=none; b=dRNj25TbW+s5MAOKgUKS278JhaM1q/rh0rIO1KW0bscaenzbSpJ7s6yeOFvlOt2cN6Y0Dv5W+B7LDVXHRSnXIDZzbU6kugjkY1JuH8xD4Lfve0oqbQ/n6n34XbQ9yzXFyRiNhL/hP1UThk45PutaSEMvlC73lblA3h9apSKR8EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729296376; c=relaxed/simple;
	bh=KfjJnaoMSHLTUqXJpdjFwk26wqEqu26LXiv8RtKiA/4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gF1fm6To/SOci4vbJy/KF/ZxYYs6RmHe2pKC9Mh+hQp9paRmVT6+WCPlcpsh/rfIjN5cBn9vxyUQpnFLpjfBiETI/BskHlHnuDZSSndpOPDeO3zZ8bOxIs7kKHaLrDbd46d89KOoQ1LhFhStu/PRis4Pnn01IHijLrKoa/3qw8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BpRh0YyD; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BpRh0YyD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729296374; x=1760832374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KfjJnaoMSHLTUqXJpdjFwk26wqEqu26LXiv8RtKiA/4=;
  b=BpRh0YyD5lg+KtUbrNkMD9TfzA2lUOBv/G2aBbMpz0tSbWiQxs37Z1j1
   coFHpazmnukpScmXehFPMgJh7goIIOIMqJveX1IRZslt20ZKQe9fRg7eS
   NeF1knYqpsoVoCAfuDXPvgA4Eg/ui6EMcwtk4XfCKaBb312HCr61Skbph
   l/+aqt3ww/DMhSWy7G7VrgVl8RLM30ZThowq1MTor57LiuePmeSfrjG1e
   Wkd2UE+GINCJJD/2A1zVF+OOXQaKQtZjutfhv6EuiA4Xw9sfr7Mq4uptw
   BFRBluLlEc9XYsUs7iXnb4kaFpfdiSSsXCNPbqc5Kjkmdm2CvoXfjR+OV
   g==;
X-CSE-ConnectionGUID: ttVFq1FGRkuNNhtFPiF/kw==
X-CSE-MsgGUID: XCqeNQFSQXmPzf/snpZWlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="46340741"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="46340741"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 17:06:11 -0700
X-CSE-ConnectionGUID: 0BJgrwo8TayCbMGe8jIF1A==
X-CSE-MsgGUID: P3GqJhv7TBuZ2K2WvAqj0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="79419581"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Oct 2024 17:06:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1wyt-000ORp-1N;
	Sat, 19 Oct 2024 00:06:07 +0000
Date: Sat, 19 Oct 2024 08:05:25 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 4486/4954]
 arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: mcu: watchdog:
 False schema does not allow {'compatible': ['zii,rave-sp-watchdog']}
Message-ID: <202410190813.Zdiw8Gr8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f2493655d2d3d5c6958ed996b043c821c23ae8d3
commit: f4b00ab2c29960961f9641be8f3e8ba4960fd849 [4486/4954] dt-bindings: mfd: Convert zii,rave-sp.txt to yaml format
config: arm64-randconfig-054-20241016 (https://download.01.org/0day-ci/archive/20241019/202410190813.Zdiw8Gr8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190813.Zdiw8Gr8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410190813.Zdiw8Gr8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: mcu: watchdog: False schema does not allow {'compatible': ['zii,rave-sp-watchdog']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: mcu: backlight: False schema does not allow {'compatible': ['zii,rave-sp-backlight']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: mcu: pwrbutton: False schema does not allow {'compatible': ['zii,rave-sp-pwrbutton']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: mcu: eeprom@a3: False schema does not allow {'compatible': ['zii,rave-sp-eeprom'], 'reg': [[163, 16384]], 'zii,eeprom-name': ['dds-eeprom']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: mcu: eeprom@a4: False schema does not allow {'compatible': ['zii,rave-sp-eeprom'], 'reg': [[164, 16384]], '#address-cells': 1, '#size-cells': 1, 'zii,eeprom-name': ['main-eeprom']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: mcu: Unevaluated properties are not allowed ('backlight', 'pwrbutton', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/watchdog: failed to match any schema with compatible: ['zii,rave-sp-watchdog']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/backlight: failed to match any schema with compatible: ['zii,rave-sp-backlight']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/pwrbutton: failed to match any schema with compatible: ['zii,rave-sp-pwrbutton']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a3: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a4: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: pcie-ep@33c00000: reg: [[868220928, 4194304], [536870912, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: mcu: watchdog: False schema does not allow {'compatible': ['zii,rave-sp-watchdog']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: mcu: backlight: False schema does not allow {'compatible': ['zii,rave-sp-backlight']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: mcu: pwrbutton: False schema does not allow {'compatible': ['zii,rave-sp-pwrbutton']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: mcu: eeprom@a3: False schema does not allow {'compatible': ['zii,rave-sp-eeprom'], 'reg': [[163, 16384]], 'zii,eeprom-name': ['dds-eeprom']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: mcu: eeprom@a4: False schema does not allow {'compatible': ['zii,rave-sp-eeprom'], 'reg': [[164, 16384]], '#address-cells': 1, '#size-cells': 1, 'zii,eeprom-name': ['main-eeprom']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: mcu: Unevaluated properties are not allowed ('backlight', 'pwrbutton', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/watchdog: failed to match any schema with compatible: ['zii,rave-sp-watchdog']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/backlight: failed to match any schema with compatible: ['zii,rave-sp-backlight']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/pwrbutton: failed to match any schema with compatible: ['zii,rave-sp-pwrbutton']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a3: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a4: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: pcie-ep@33c00000: reg: [[868220928, 4194304], [536870912, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
