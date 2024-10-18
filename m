Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67144188591
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 06:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729233617; cv=none; b=sWZMRNdgs/3OGN2tCpy8nQAZoeCo+i/pNSp1XTjelY8cYsVDnCaUtYIr31oyYUgaQTln/KkM+SIOgLspPFysrXHXBkcICvzWlkHoo9D1cxBvR4SStYL722UnK2y/HRciypGP0Qg1fC8cM5Q9Q9GtJ5x/TH0RyzqazaI9/G7DELo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729233617; c=relaxed/simple;
	bh=4uXH8Simnotx1jQwlVs9sIXR/afO8nyDnEItwFz1h6s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l1c/eDBGhJXlwOKwXdWCGJM4GB4VFYm8zqJyJQEqmZdOP/foNFVwrhbv+gjjJEv8/nkYxnJYuyYuRdYxDEIuoBP/hCQWvS9a7Cfu340H/9xygHiUZNGp8Y6fzJV8uPRg8B3B6eZrQ9BU6INSCew1cXkB09yxI/uTm8Ru6z83HKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DcrMZTUI; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DcrMZTUI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729233615; x=1760769615;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4uXH8Simnotx1jQwlVs9sIXR/afO8nyDnEItwFz1h6s=;
  b=DcrMZTUIbm3wbGQiZNEbdSfUujmrKqvUt0i6CX5RO03cFcsouL4mCJ3H
   roe4QIL5+CZsekRV+HpRwGafUDF86VKcesAUZ6BpX4i+pbzuCM9sbbjgn
   7O/qJlgydPFSp66dA52u1OmHFkhLycxpt6GNKWtoV+R2kVEzjapSYxQA6
   KlPIuKrN2lBqav7kMixC4BOo5zfMmmNzvigkVDxPp6wz699WzlXD24JdE
   ezReAwfS3QgMkorQLk/Yvt3eziQh0hnsO+Uux8FWxfqp2gy3q1ezg9D+s
   pm5mSa/80ifPxuEByWmH8AbHJt8FXNtFZS75VZzXKWgqFmEvtzPqkdQUK
   Q==;
X-CSE-ConnectionGUID: 5SitXdvGQyKysnr2tsRXBg==
X-CSE-MsgGUID: nN+7oKdfTpy6pK+d2z9igw==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="40116512"
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="40116512"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 23:40:12 -0700
X-CSE-ConnectionGUID: 5/26PEy9R6+K9LUfefqrJw==
X-CSE-MsgGUID: a0KeVqB0S8a7zi7lnQrnMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="83557380"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Oct 2024 23:40:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1gee-000NND-2U;
	Fri, 18 Oct 2024 06:40:08 +0000
Date: Fri, 18 Oct 2024 14:39:22 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 4486/4954]
 arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: mcu: watchdog:
 False schema does not allow {'compatible': ['zii,rave-sp-watchdog']}
Message-ID: <202410181420.7Akgq48J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7df1e7189cecb6965ce672e820a5ec6cf499b65b
commit: f4b00ab2c29960961f9641be8f3e8ba4960fd849 [4486/4954] dt-bindings: mfd: Convert zii,rave-sp.txt to yaml format
config: arm64-randconfig-054-20241016 (https://download.01.org/0day-ci/archive/20241018/202410181420.7Akgq48J-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410181420.7Akgq48J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410181420.7Akgq48J-lkp@intel.com/

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
