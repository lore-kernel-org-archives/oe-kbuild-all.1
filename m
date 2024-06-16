Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC1F51021
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 09:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718531832; cv=none; b=Lm1AAQI47az3Z7bteeZOVyyOqNCHB4UxLasdNg5qrDU7+ZnibD21w2ReBHJIsNReyVFxyf9WfmLRRhLqIVg1v0JaS3l4mrrZbxUpsV449pVuHKVno1D0Dh72i0gZnhVtIX3NZwC2HurYXVNihsk9ETb5DgMS3EIPkqWUHrNtb7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718531832; c=relaxed/simple;
	bh=n/Au18raakBp+HsNt+AbLM6n8EKaKj3RTRxJIaUudBc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WNjtSmrSO1fbH11ZiYOrnRejMtQgXynrcE1jXUOyxwmljUe+h2Yq4VEPnSbHgfiySwh+nB6mN/Rm08+HxMEE074beb6/qB/RDJYGXKVha+G3sU121LlOaB7cTXiXMiF5Vopsi6nxubNkH6DVfJOL7qdL0XwUD1OxQUcQ7It+27s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ekQDuora; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ekQDuora"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718531830; x=1750067830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n/Au18raakBp+HsNt+AbLM6n8EKaKj3RTRxJIaUudBc=;
  b=ekQDuoraq3ZyVRRQ6d5oVQ1K6QMGXZdYQxjbxEUqEviBivqclY9m6gnk
   9ZRQba1dv26vAOw9zbQbTLO2TUCqeRVOhJUPJUZv2ijhhAWLyZscLq7nG
   FH6mw0YYfJnl0GHNFeTahq51Ccyu5ADLjS3tBPteVm38B38BBDX8rp+CB
   Kg+HqRcEXLiJc/uJBYae07tFWkK/s3CoVnhNQ9pCfYKGJ25u5evrhRtwQ
   eO5SzrwdxzD7hEOXdEyVtUX16hKUsqCqJvDzA+A4BaLEABo3tJvDQr/0K
   0bnL7BW2dyBzC4zbbufQP5PCnwrIox6zjAyFs9X5q0U42fYqa4smIxlO6
   Q==;
X-CSE-ConnectionGUID: OrI/5suMQMGvM1wUJBZKeQ==
X-CSE-MsgGUID: T3vlrV8mQkWycZQnvb2tAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="32919310"
X-IronPort-AV: E=Sophos;i="6.08,242,1712646000"; 
   d="scan'208";a="32919310"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 02:57:09 -0700
X-CSE-ConnectionGUID: 1IsY5VeWT2qBvlApalV2/Q==
X-CSE-MsgGUID: 2oqAp+tBTFWvWRyVq9KwNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,242,1712646000"; 
   d="scan'208";a="40866255"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Jun 2024 02:57:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sImdF-0002ba-2K;
	Sun, 16 Jun 2024 09:57:05 +0000
Date: Sun, 16 Jun 2024 17:56:48 +0800
From: kernel test robot <lkp@intel.com>
To: Dhruva Gole <d-gole@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 27/137]
 arch/arm64/boot/dts/ti/k3-am625-sk.dtb: serial@2800000: Unevaluated
 properties are not allowed ('interrupt-names' was unexpected)
Message-ID: <202406161722.aUdgluzY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   8086474caf5dc2570a947669acf226d319cd0651
commit: d3fb67ae1841457efd01c7b7125fdf349eb23208 [27/137] arm64: dts: ti: k3-am62x-sk-common: enable uart as wakeup source
config: arm64-randconfig-051-20240609 (https://download.01.org/0day-ci/archive/20240616/202406161722.aUdgluzY-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406161722.aUdgluzY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406161722.aUdgluzY-lkp@intel.com/

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
