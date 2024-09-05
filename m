Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560D48F54
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Sep 2024 20:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725568973; cv=none; b=Y3HNTk410OllMayUpNZmkNKPUho4kM3op7oas6Qi5gsuS+Ad7whrp2IQ/sWu+Ig0zlRKxeHBL9VCmxKwNZ+ARINN1N5G8QWu0s8xfHMK/xN4FtJsyXMLDluBUFDWYbpd+neN3qqpK8n5Kbe88IiFAtUj8k7AM+mlV1Od12UK/H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725568973; c=relaxed/simple;
	bh=cHvcImRHYzbXC8wWswLZoFRkPayK4M+smHUyyv6tABo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vs8takMy60p3qNhJszpFAjm2NotqlnGWvABxHTD8BqAvkqwBpYM6FAONAQecNR7V8/xe8stN3nNoNAI9fyOGCZjishIRXbmB4Leh0lMudLk79+UjH8hK75KFKjozIyIsmp6gKj3JZZQyL1qASslIOTrIphyELH77lGEZu7jXCQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kt7APF3B; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kt7APF3B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725568971; x=1757104971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cHvcImRHYzbXC8wWswLZoFRkPayK4M+smHUyyv6tABo=;
  b=Kt7APF3BUwuXuZLqtR5DfITehWnQkK8Op3vG7dIwxPvNi69Hpkbsi5/K
   H1TY/qBSrQZNg4P83PPApWe7/41KdeXO+xOdqQAglo8FZHY3qlZUZDNnN
   ED198BNbr5PQUB7hbFOEn007aQ7RZMk5wTsb9DzAUYHn/ceLLO47DKVli
   tVgyDWB4W3LKb5ksUY3h2lF1NzOE/cdB7q/ZHnHWv7Yc0kDzgiQq7XiJH
   oCjdPCgwA6d/ZoI8kO1QqM3/Sd0POSW9l3YGLE2Cx1scSE7dCfIAw9M3u
   5n6znAWtMH/TRNkE9+LR7GCzg0yQF+7UOTdk9NiP7gDXTYWWHy4DspOHV
   Q==;
X-CSE-ConnectionGUID: sTiERrPkTE27YK7w1Rsi8A==
X-CSE-MsgGUID: Xz6YpfwOQhCIl0LpepbQ2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="49727320"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="49727320"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 13:42:50 -0700
X-CSE-ConnectionGUID: QJSYRsW4QM29sK+1v8RhAA==
X-CSE-MsgGUID: ukKa9V6RS7ibsG7cFFwkRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="65979427"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Sep 2024 13:42:48 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smJJW-000AIX-0u;
	Thu, 05 Sep 2024 20:42:46 +0000
Date: Fri, 6 Sep 2024 04:42:34 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 9138/9692]
 arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/pcie@3400000:
 failed to match any schema with compatible: ['fsl,lx2160a-pcie']
Message-ID: <202409060413.vtS3MtfG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ad40aff1edffeccc412cde93894196dca7bc739e
commit: 1a1bf58897d20fc38b454dfecd2771e142d36966 [9138/9692] dt-bindings: PCI: layerscape-pci: Replace fsl,lx2160a-pcie with fsl,lx2160ar2-pcie
config: arm64-randconfig-052-20240905 (https://download.01.org/0day-ci/archive/20240906/202409060413.vtS3MtfG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409060413.vtS3MtfG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409060413.vtS3MtfG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: thermal-zones: 'ddr-cluster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/syscon@1f70000: failed to match any schema with compatible: ['fsl,lx2160a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: power-controller@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/power-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/power-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/pcie@3400000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/pcie@3500000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/pcie@3600000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/pcie@3700000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/pcie@3800000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/pcie@3900000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: fsl-mc@80c000000: dpmacs:ethernet@3: 'phys', 'sfp' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: fsl-mc@80c000000: dpmacs:ethernet@4: 'phys', 'sfp' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: fsl-mc@80c000000: dpmacs:ethernet@5: 'phys', 'sfp' do not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: power-controller@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc/power-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc/power-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: hub@1: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: hub@2: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc/pcie@3400000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc/pcie@3500000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc/pcie@3600000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc/pcie@3700000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc/pcie@3800000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc/pcie@3900000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: power-controller@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: /soc/power-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: /soc/power-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: hub@1: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: hub@2: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: /soc/pcie@3400000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: /soc/pcie@3500000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: /soc/pcie@3600000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: /soc/pcie@3700000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: /soc/pcie@3800000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: /soc/pcie@3900000: failed to match any schema with compatible: ['fsl,lx2160a-pcie']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
