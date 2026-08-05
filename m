Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B32346A08
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 07:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785914577; cv=none; b=TdUTb5Ej3wNIRrl0flxqs8bi79WiBrbKGGL/yF8q+wjvXClZcIr8nIpjV992a/UZVos6xicscGkAU08J43JSQSgzwW7jLFW9x/1iK08GVvcBemh/CA5g/IHMSJdnRYES5aepaTlYa55gZHx5Zcm8y756Ot97kIBdeQCDB0T8JaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785914577; c=relaxed/simple;
	bh=zkVOWBIVn3Hy11H4kDkcM4RgjXdBVNbnYBFB5xjD0U8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H4ssRo125pfTsZ9xbIA14QQyYUe5GIbqPRI7k7ebnvZM2Ln/R6BzvASv7Tf0fCEvJmNE1y9yT24389Vy9On/O4983leise2N+bTRex1W4mMEsddaRUB6OKIv8j7n9K0nbwTH4kixUxkEvwi/79qryOjAf5j8a+6yj/YQcjVFCiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CRXIJ6YL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CRXIJ6YL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785914575; x=1817450575;
  h=date:from:to:cc:subject:message-id;
  bh=zkVOWBIVn3Hy11H4kDkcM4RgjXdBVNbnYBFB5xjD0U8=;
  b=CRXIJ6YLxL424CTMo2AvF8GuPplrS0jWHKiaCQYrCMvmsNJJAJzbdqJe
   1PJqAqGxXSd5G4ra8FTtnYAjcJiCjr++GgSw8jKzWAZB/8hGY92koqgwQ
   sxGDF754IqRcp+IGNfQnxYStBtS8bneR/4TaNOR1C6PoDayhfi2bwfmUH
   YGdd8tOfCFRgb+qmD/DFAEBuC5NVZRymFcB7c+jjchLUYg/P2lydjbEGv
   OzOdRQnoVFpBHTHjEoTUj0Sy2JdWuh2IrHusFknRtJQue38aHxwOKh66k
   FsBb9iSOxApkAP1ffDdODASpe62DdjKkgLyafLAssktgeNFu9wumgHvJh
   Q==;
X-CSE-ConnectionGUID: 3wNWyo6KSB2zOHMtb0zhpw==
X-CSE-MsgGUID: P03wD3aPRgK2dtxDSzypMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90366297"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="90366297"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 00:22:54 -0700
X-CSE-ConnectionGUID: wBNp5sS6TyyU6fTY6XJtBg==
X-CSE-MsgGUID: Pq4zdcqOQKmdxVp4fz8ANg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="266855821"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 05 Aug 2026 00:22:53 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrVxj-000000004MQ-05z9;
	Wed, 05 Aug 2026 07:22:51 +0000
Date: Wed, 05 Aug 2026 09:22:30 +0200
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [linux-next:master 9614/12727]
 arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: pcie@1,0:
 wifi@0,0:compatible: ['brcm,bcm4366-fmac', 'brcm,bcm4329-fmac'] does not
 contain items matching the given schema
Message-ID: <202608050949.kt8WmMoy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f6da28aab51b16762ed82e8fdeaa5042da45b08
commit: c62bbf2a690b55965d22e414e5adbfd5dc76d701 [9614/12727] ARM: dts: BCM5301X: EA9200: add Wi-Fi definitions
config: arm-randconfig-2053-20260803 (https://download.01.org/0day-ci/archive/20260805/202608050949.kt8WmMoy-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608050949.kt8WmMoy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608050949.kt8WmMoy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/broadcom/bcm5301x-nand-cs0.dtsi:10.18-19.5: Warning (avoid_unnecessary_addr_size): /nand-controller@18028000/nand@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/broadcom/bcm-ns.dtsi:24.28-47.4: Warning (unique_unit_address_if_enabled): /chipcommon-a-bus@18000000: duplicate unit-address (also used in node /axi@18000000)
   arch/arm/boot/dts/broadcom/bcm-ns.dtsi:377.22-382.4: Warning (unique_unit_address_if_enabled): /mdio@18003000: duplicate unit-address (also used in node /mdio-mux@18003000)
   arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: /axi@18000000: failed to match any schema with compatible: ['brcm,bus-axi']
>> arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: pcie@1,0: wifi@0,0:compatible: ['brcm,bcm4366-fmac', 'brcm,bcm4329-fmac'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: wifi@0,0 (brcm,bcm4366-fmac): Unevaluated properties are not allowed ('nvmem-cell-names', 'nvmem-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml
   arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: pcie@2,0: wifi@0,0:compatible: ['brcm,bcm4366-fmac', 'brcm,bcm4329-fmac'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: wifi@0,0 (brcm,bcm4366-fmac): Unevaluated properties are not allowed ('nvmem-cell-names', 'nvmem-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml
   arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: pcie@0: wifi@0,0:compatible: ['brcm,bcm4366-fmac', 'brcm,bcm4329-fmac'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: wifi@0,0 (brcm,bcm4366-fmac): Unevaluated properties are not allowed ('nvmem-cell-names', 'nvmem-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml
   arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: leds (gpio-leds): led-0:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'rfkill-none' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'netdev', 'none', 'rc-feedback', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'rfkill-none' does not match '^cpu[0-9]*$'
   	'rfkill-none' does not match '^hci[0-9]+-power$'
   	'rfkill-none' does not match '^mmc[0-9]+$'
   	'rfkill-none' does not match '^phy[0-9]+tx$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
