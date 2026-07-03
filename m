Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70221A6807
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 02:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783045592; cv=none; b=C3EsRHclUylf00jbP0dDDhFPNKpWP/W5sax8ZCCCK0TDeEik5ythmOIx6rHxa1fRXpnwzfEFIG0m2wvo+Ms4DUT5f9sxigBhsH/9ns5KrSeY2EdNvLGeHGClNLvNTtcTI6qKkRJGwWi2jfHp1ifdw5lc93FYqsx3eGRFGWo4/iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783045592; c=relaxed/simple;
	bh=McpkGByiU/qpobOPMpnjdrusZ7/ckuiTZdkwkrlOVO4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h+jZltB4hYu8eCXsLvRNL78NZTYxAmTC3F+rv8s1pQQqeleCvQVlnTY6cIIJHkVpvhbjHTPGHhuCWpHV30IvGVrL6vYyxeRjPYFWNlW4MVKWETiBACrJIslW7fPvn/HhfkJU+5PbFFCNyDRtkcdt+niM4PcNcv907M+QCNK6jrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MRjOmw3Y; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MRjOmw3Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783045589; x=1814581589;
  h=date:from:to:cc:subject:message-id;
  bh=McpkGByiU/qpobOPMpnjdrusZ7/ckuiTZdkwkrlOVO4=;
  b=MRjOmw3YMsi1O9WDC/Lypy5+w/V+FXxelC8Uwzm7ymT/CTcm7ch/n1HI
   5gfunfJIT5arq3ul9WEAlbg97kB4ET+1kTzTzrk4TDM/hEus/eQL46IEo
   KRcQ87U2Mj6aKFJ6X2euaGW4pOF/0XlXENmGvZ2PQrlx/hhkXaudIGpeD
   ld6W93rb8JLzhmhpvuG3EQg9wDMbAItfhhG41tpXmZeKU5LVs1v45IVyi
   s9KA/bf4qYlPSPqdVjbKKcccNwH95CtYVEgaRouFZo2ew/5i3EVlY3Wey
   yWlvJcMbacUgroKnn1QNs08ZPbCwxSAMdjz6bd8XcDJwaqW7mG8mv5BjJ
   Q==;
X-CSE-ConnectionGUID: 9aVEqjU2RB6pbjGux8Rwwg==
X-CSE-MsgGUID: mhMkz+jiRnytM/eatQkNrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="82906250"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="82906250"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 19:26:29 -0700
X-CSE-ConnectionGUID: jyhCMjrXRPSAoVNMfj7kcQ==
X-CSE-MsgGUID: xvXpoCnVQ16X0943WCl5QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="251931414"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 02 Jul 2026 19:26:28 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfTbk-000000001PJ-3iwE;
	Fri, 03 Jul 2026 02:26:24 +0000
Date: Fri, 03 Jul 2026 04:25:53 +0200
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>
Subject: arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: leds
 (gpio-leds): led-0:linux,default-trigger: 'oneOf' conditional failed, one
 must be fixed:
Message-ID: <202607030407.1DT5VDLb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   87320be9f0d24fce67631b7eef919f0b79c3e45c
commit: 6b0cb7b34ba68425abb6b3174cca4a7ee031da6d ARM: dts: BCM5301X: EA9200: add LEDs
date:   3 months ago
config: arm-randconfig-2055 (https://download.01.org/0day-ci/archive/20260703/202607030407.1DT5VDLb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607030407.1DT5VDLb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6b0cb7b34ba6 ("ARM: dts: BCM5301X: EA9200: add LEDs")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607030407.1DT5VDLb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/broadcom/bcm5301x-nand-cs0.dtsi:10.18-19.5: Warning (avoid_unnecessary_addr_size): /nand-controller@18028000/nand@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/broadcom/bcm-ns.dtsi:24.28-47.4: Warning (unique_unit_address_if_enabled): /chipcommon-a-bus@18000000: duplicate unit-address (also used in node /axi@18000000)
   arch/arm/boot/dts/broadcom/bcm-ns.dtsi:377.22-382.4: Warning (unique_unit_address_if_enabled): /mdio@18003000: duplicate unit-address (also used in node /mdio-mux@18003000)
   arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: /axi@18000000: failed to match any schema with compatible: ['brcm,bus-axi']
   arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@8: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb: leds (gpio-leds): led-0:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'rfkill-none' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'netdev', 'none', 'rc-feedback', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'rfkill-none' does not match '^cpu[0-9]*$'
   	'rfkill-none' does not match '^hci[0-9]+-power$'
   	'rfkill-none' does not match '^mmc[0-9]+$'
   	'rfkill-none' does not match '^phy[0-9]+tx$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
