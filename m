Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A91413D242
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 12:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718798586; cv=none; b=QJNrMbuEblh9pOZvTH6XZVpjDVeC71I6kcA03mFBuryy1TuNNgT4PV3XRVonibdb4eqeqbc1ANXo0PjUw6705VlAR6FhMGpEeppDhCspnwwGi/5hEJUoi+cAoCpBthE8X1YpfDNhwEv8JAvQbWMBXrSVZSfYdYUX3zv9Jd7K1JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718798586; c=relaxed/simple;
	bh=T3snwveZb2f7shKiyii9KVjcFXc7agCbf+tocq+zYt8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=beb3+XTVULoZXWoTed4G+pdaWcLy4Y9hQgy3EV7Pecyp3ALvsoOCaibW/A0IkMFJJp/aWstv6zhTbytQzE0GmXpZnRkA4kEekdw61wnotb0hTLN5fBa7ey8sb0E5n9Ex8ZatuKOdR3bmxputDdbEGSqjthcJbLU7k6Q2D45KrvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IDQmfji3; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IDQmfji3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718798584; x=1750334584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T3snwveZb2f7shKiyii9KVjcFXc7agCbf+tocq+zYt8=;
  b=IDQmfji3G5/PBEVf3z5MOiAR+SpOb36dapc3rv+i1bYEuiYlUw19inCX
   DZoJquhe9P/yfzlrh9Q2JStNkpRKSSGTmMU2kIgRew7gLYmC4ji36rxlk
   27bETePqW212oXx3yVXgCcvk7/0fpkKPbkCi/LZC7DOqZLVE8i4NMPvr4
   GOY18a0UBAZYBWCEfu163IHWXIGZhtk1wl2BMzL5hUSs1IGxjgjBjDx92
   aSM2MiL7jaeTuiJLstId0h/dhk2q56abOIn+0PgC5oNcvG7OtQRub7UxP
   5LPnxwZ3lnhuQ1KOtgROwkAV01ESiLlnJbL2Yjbt11jCaOLFyWYBTfj0z
   w==;
X-CSE-ConnectionGUID: v342i9ewTYWIWROlIVg8ng==
X-CSE-MsgGUID: IeeYsFnJRPyFMXtTLbZ99Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15862899"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="15862899"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 05:03:03 -0700
X-CSE-ConnectionGUID: ag768HuJTpGs71s/t4nXkg==
X-CSE-MsgGUID: U7CrTyIHTsmO8lkmmWsnhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="65136591"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jun 2024 05:03:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJu1k-0006ZN-04;
	Wed, 19 Jun 2024 12:03:00 +0000
Date: Wed, 19 Jun 2024 20:02:45 +0800
From: kernel test robot <lkp@intel.com>
To: Dhruva Gole <d-gole@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 27/137]
 arch/arm64/boot/dts/ti/k3-am625-sk.dtb: serial@2800000: Unevaluated
 properties are not allowed ('interrupt-names' was unexpected)
Message-ID: <202406191901.RIwC9jG1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   5fb17acf5d5b8e35414ae85c8950641c9249ec5a
commit: d3fb67ae1841457efd01c7b7125fdf349eb23208 [27/137] arm64: dts: ti: k3-am62x-sk-common: enable uart as wakeup source
config: arm64-randconfig-051-20240609 (https://download.01.org/0day-ci/archive/20240619/202406191901.RIwC9jG1-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406191901.RIwC9jG1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406191901.RIwC9jG1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am625-sk.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am625-sk.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am625-sk.dtb: pinctrl@f4000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am654-padconf'] is too short
   	'ti,am654-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk.dtb: pinctrl@f4000: 'interrupts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk.dtb: serial@2800000: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk.dtb: serial@2800000: {'compatible': ['ti,am64-uart', 'ti,am654-uart'], 'reg': [[0, 41943040, 0, 256]], 'interrupts': [[0, 178, 4]], 'power-domains': [[3, 146, 1]], 'clocks': [[2, 146, 0]], 'clock-names': ['fclk'], 'status': ['okay'], 'bootph-all': True, 'pinctrl-names': ['default'], 'pinctrl-0': [[12]], 'interrupts-extended': [[1, 0, 178, 4], [13, 456]], 'interrupt-names': ['irq', 'wakeup'], 'phandle': [[111]], '$nodename': ['serial@2800000']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk.dtb: serial@2800000: {'compatible': ['ti,am64-uart', 'ti,am654-uart'], 'reg': [[0, 41943040, 0, 256]], 'interrupts': [[0, 178, 4]], 'power-domains': [[3, 146, 1]], 'clocks': [[2, 146, 0]], 'clock-names': ['fclk'], 'status': ['okay'], 'bootph-all': True, 'pinctrl-names': ['default'], 'pinctrl-0': [[12]], 'interrupts-extended': [[1, 0, 178, 4], [13, 456]], 'interrupt-names': ['irq', 'wakeup'], 'phandle': [[111]], '$nodename': ['serial@2800000']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml#
--
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: pinctrl@f4000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am654-padconf'] is too short
   	'ti,am654-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: pinctrl@f4000: 'interrupts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: serial@2800000: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: serial@2800000: {'compatible': ['ti,am64-uart', 'ti,am654-uart'], 'reg': [[0, 41943040, 0, 256]], 'interrupts': [[0, 178, 4]], 'power-domains': [[3, 146, 1]], 'clocks': [[2, 146, 0]], 'clock-names': ['fclk'], 'status': ['okay'], 'bootph-all': True, 'pinctrl-names': ['default'], 'pinctrl-0': [[12]], 'interrupts-extended': [[1, 0, 178, 4], [13, 456]], 'interrupt-names': ['irq', 'wakeup'], 'phandle': [[109]], '$nodename': ['serial@2800000']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: serial@2800000: {'compatible': ['ti,am64-uart', 'ti,am654-uart'], 'reg': [[0, 41943040, 0, 256]], 'interrupts': [[0, 178, 4]], 'power-domains': [[3, 146, 1]], 'clocks': [[2, 146, 0]], 'clock-names': ['fclk'], 'status': ['okay'], 'bootph-all': True, 'pinctrl-names': ['default'], 'pinctrl-0': [[12]], 'interrupts-extended': [[1, 0, 178, 4], [13, 456]], 'interrupt-names': ['irq', 'wakeup'], 'phandle': [[109]], '$nodename': ['serial@2800000']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
