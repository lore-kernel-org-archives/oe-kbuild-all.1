Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614CA7DA68
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 19:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729367640; cv=none; b=OEfqN6Wh3CKk70l0aBd2O0evfUELjcPpfkv8NURJE4ajnScV2DYTuEGBNaioZM/Q5ILnzqU2S9ZsbLl1PPm2Lg592BYa0vaphJZURqiTpjJqnb7k+mKukogRUbvZtJXRzdJ/SQrFJW6M0BZGX5BAdMc4+JEjIq9vQVGAYDtIz9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729367640; c=relaxed/simple;
	bh=Zgi4rQUR0tAviSjWDRtC9E5/ZMCpm+VeZcmuMaoX7Jo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aCzwJKHsIqNtJBp67jHG4k0yhTVikMZogyDZqwJrIoM8lpuDYE1OIKYmDD+ny4nkkgNWMV9F/MgN8tcFLJNAQvW6rPLBVDeYbUE7jwgxnnObsqXJ1T6eYFJwpRX2TFzt+oKLD866L2XZ/G7vcx43TDetBMJpQy+QUgqUKWsup6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SzWU4ADr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SzWU4ADr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729367638; x=1760903638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zgi4rQUR0tAviSjWDRtC9E5/ZMCpm+VeZcmuMaoX7Jo=;
  b=SzWU4ADrTkQptMwMnp+DKljDA02iYUxC5kp438DHQ8MH4nwUZ07tUQsg
   f69i3ynTJE4vwPxiECsoteraR+h/0vNlUp/RujwqAbyLXjlLUMKPlhHtO
   k5t/ihlwzfYcaagcKp8+Lkl5mbNt5DHmGtI2v0q7SfXR929YLEeHGTsaR
   AyZuSfRtMmAfhLW1ib//gwKL2uA8p3sIYaWC0+B9UDqcjKYfImac0blI6
   RB7n1FapCc+OCzXvGCb02Ax2mJjGD18T7yssCefYpNkCmtdR4kaMMN/E6
   0t802dDGbAesz7HLdTkD/4kl8AOQ4IZNWck80V64cwROU7wDnWketk/qe
   g==;
X-CSE-ConnectionGUID: C0VV01/0SqGZ3Td6hHhOig==
X-CSE-MsgGUID: zPh13z1KQauUZZs/sO9rVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46344375"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46344375"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 12:53:58 -0700
X-CSE-ConnectionGUID: oDPxLS2LRLKPtOp3Nsarmw==
X-CSE-MsgGUID: 8Y2RqEb9QNmo3Ar//ESlmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="78817787"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Oct 2024 12:53:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2FWM-000PUS-25;
	Sat, 19 Oct 2024 19:53:54 +0000
Date: Sun, 20 Oct 2024 03:53:43 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 4888/4954]
 arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: mcu: Unevaluated
 properties are not allowed ('pwrbutton', 'watchdog' were unexpected)
Message-ID: <202410200324.y8jHkz1w-lkp@intel.com>
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
commit: e6748d11af488576c163e9af2a6f0e867a7d0d70 [4888/4954] Merge branch 'for-backlight-next' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git
config: arm64-randconfig-054-20241016 (https://download.01.org/0day-ci/archive/20241020/202410200324.y8jHkz1w-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410200324.y8jHkz1w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410200324.y8jHkz1w-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: mcu: watchdog: False schema does not allow {'compatible': ['zii,rave-sp-watchdog']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: mcu: pwrbutton: False schema does not allow {'compatible': ['zii,rave-sp-pwrbutton']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: mcu: eeprom@a3: False schema does not allow {'compatible': ['zii,rave-sp-eeprom'], 'reg': [[163, 16384]], 'zii,eeprom-name': ['dds-eeprom']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: mcu: eeprom@a4: False schema does not allow {'compatible': ['zii,rave-sp-eeprom'], 'reg': [[164, 16384]], '#address-cells': 1, '#size-cells': 1, 'zii,eeprom-name': ['main-eeprom']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: mcu: Unevaluated properties are not allowed ('pwrbutton', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/watchdog: failed to match any schema with compatible: ['zii,rave-sp-watchdog']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/pwrbutton: failed to match any schema with compatible: ['zii,rave-sp-pwrbutton']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a3: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a4: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: mcu: watchdog: False schema does not allow {'compatible': ['zii,rave-sp-watchdog']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: mcu: pwrbutton: False schema does not allow {'compatible': ['zii,rave-sp-pwrbutton']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: mcu: eeprom@a3: False schema does not allow {'compatible': ['zii,rave-sp-eeprom'], 'reg': [[163, 16384]], 'zii,eeprom-name': ['dds-eeprom']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: mcu: eeprom@a4: False schema does not allow {'compatible': ['zii,rave-sp-eeprom'], 'reg': [[164, 16384]], '#address-cells': 1, '#size-cells': 1, 'zii,eeprom-name': ['main-eeprom']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: mcu: Unevaluated properties are not allowed ('pwrbutton', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/watchdog: failed to match any schema with compatible: ['zii,rave-sp-watchdog']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/pwrbutton: failed to match any schema with compatible: ['zii,rave-sp-pwrbutton']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a3: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a4: failed to match any schema with compatible: ['zii,rave-sp-eeprom']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
