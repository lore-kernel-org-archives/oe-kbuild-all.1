Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B0819DF57
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jun 2024 16:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719246620; cv=none; b=ZWNGl1MoItj8wiOOp8V8zyLUshPX4r5bRhoxKcI1c0Ji48aVMCAB7KS9yS5o/zB/9izwuLa0t/ZKyEMBbIaX5WRf1hbSWhKfJgxOXSsLUxBTvBrxIY2xo5Hd50Dz3x7cys9RIqI+AooWIUkV7N9AwRFlFXU/H8FvzpPd0JP29pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719246620; c=relaxed/simple;
	bh=oo47nAlZpbpxOrkc/IsFvegRQO7lBBRrhyHetr3aiiw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=to+viiOUQ9j730TzgNPhiuRarNSEW5zwG5NJ+LeQBj5P/5ggECXTxZcsijjJ3kSvgDPWuNQeuPiPp5pR7JSAJYRoEkYIGZpeJfU2le4sVIKLKo74Wz98wAse3/n4r9dCTF3CJFiFjeU70AmFjvk78E31h/ukCOSXj9dvzO8ulvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKLVynkl; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKLVynkl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719246619; x=1750782619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oo47nAlZpbpxOrkc/IsFvegRQO7lBBRrhyHetr3aiiw=;
  b=TKLVynkl44p6hCW1zNtfHwevnzS0WqDkSzTPHPIt4BBWGCxMwH/oTS68
   Ri6CRb5WER3KiHykSlI8CSugYcyZkoJyk/X6pY1acTJ49u00U2IKamUVH
   6Pp81AodL/osiE8GiHGuQmF0qNfgdaU+Si87M3VsVM6T7X+n5mEPVLzWW
   +QVB2GT4oM2SaRWVaSWi6qhxqIFZCZi7XEUgFya+Nf6h0XAGcqqqIuTwf
   G+sgW+EbJH9eo6rEQ5RUrkmJNPg0h0JBsct0JjHSkbsF3mkFEZZ/Lh+sc
   tObgLxw/sNFng26YPr9Kycw6HYkA9Z9nzcOnhBWIxey4nznJjeH61YYZd
   g==;
X-CSE-ConnectionGUID: dwYZHLPrSmO1NVQktrVJvA==
X-CSE-MsgGUID: MuPv1dYPTx6rQKDk7pQaFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16359305"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="16359305"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 09:30:17 -0700
X-CSE-ConnectionGUID: i4YTPJKcT32nP9lEvv/lTg==
X-CSE-MsgGUID: DAXDViJZQtOIkRES2EZsgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="74113119"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Jun 2024 09:30:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLma5-000DWq-21;
	Mon, 24 Jun 2024 16:30:13 +0000
Date: Tue, 25 Jun 2024 00:29:45 +0800
From: kernel test robot <lkp@intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>, Rahul T R <r-ravikumar@ti.com>
Subject: [ti:ti-rt-linux-6.6.y 2/4] arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb:
 /reserved-memory/edgeai_shared-memories: failed to match any schema with
 compatible: ['dma-heap-carveout']
Message-ID: <202406250024.o7KD5REH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y
head:   10e40a5ae075f5d07636fd78ec5bffe9d3faa668
commit: f4e415ebe04e8e2dd852f25610cd604b9f4a5e58 [2/4] arm64: dts: ti: k3-am62a7-sk: Reserve memory for remote cores running edge-ai firmwares
config: arm64-randconfig-051-20240624 (https://download.01.org/0day-ci/archive/20240625/202406250024.o7KD5REH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240625/202406250024.o7KD5REH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406250024.o7KD5REH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: serial@2800000: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: serial@2800000: {'compatible': ['ti,am64-uart', 'ti,am654-uart'], 'reg': [[0, 41943040, 0, 256]], 'interrupts': [[0, 178, 4]], 'power-domains': [[3, 146, 1]], 'clocks': [[2, 146, 0]], 'clock-names': ['fclk'], 'status': ['okay'], 'pinctrl-names': ['default'], 'pinctrl-0': [[27]], 'interrupts-extended': [[1, 0, 178, 4], [28, 456]], 'interrupt-names': ['irq', 'wakeup'], 'phandle': [[126]], '$nodename': ['serial@2800000']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: serial@2800000: {'compatible': ['ti,am64-uart', 'ti,am654-uart'], 'reg': [[0, 41943040, 0, 256]], 'interrupts': [[0, 178, 4]], 'power-domains': [[3, 146, 1]], 'clocks': [[2, 146, 0]], 'clock-names': ['fclk'], 'status': ['okay'], 'pinctrl-names': ['default'], 'pinctrl-0': [[27]], 'interrupts-extended': [[1, 0, 178, 4], [28, 456]], 'interrupt-names': ['irq', 'wakeup'], 'phandle': [[126]], '$nodename': ['serial@2800000']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: pinctrl@a40000: 'cpsw-cpts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: video-codec@30210000: 'sram-size' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/cnm,wave521c.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: /reserved-memory/edgeai_shared-memories: failed to match any schema with compatible: ['dma-heap-carveout']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
