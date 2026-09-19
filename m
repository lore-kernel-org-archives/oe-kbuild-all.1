Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7B91F16B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Sep 2026 05:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789794192; cv=none; b=rmg8spG0mI88KLke0Jfahr0UQ6Nf1ud6Ruqb6G5MW3SmdmupdyNKveDlP+CDk0RoqOgZTIbo6hUZmUC/lXxmKd7fzrqJWIFuH5v9dFTTCMnWdFZowwCcw3VPudVzpOhEr2YupOiF783EJqgYLkUQGSNMe+qlc4zTJ8AfibYZeaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789794192; c=relaxed/simple;
	bh=Y621ijjor042PcHtbIgLB1AHJYW5pjyn/oKJP+kdqMo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ufKI3FOLQAhzwiWJsTlB6GOlYuB0tcJ0L1c5KkC1XuF1pnBVMMFFPkFmB+d4SeZP+9hsmR9axiSCoUqvP130fQSnioCvZtBBaiF0lpKSvvGTm9AqIYSyJo36Neb0W1soVa7JB9jh0QYUwslSxPl8Buyt0vN/w1/YOTwkNZvOUn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=izPzgzdg; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="izPzgzdg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789794191; x=1821330191;
  h=date:from:to:cc:subject:message-id;
  bh=Y621ijjor042PcHtbIgLB1AHJYW5pjyn/oKJP+kdqMo=;
  b=izPzgzdg4k3ym4LmFsTDWIEhsQ9egb+gphjVmhBIRMWdv86d9Hocak42
   xRtKQbuVxHVFvGDqiT4HSI/h/s2ZZ2tR3AbMEM/Tsw4XAFCf/613tlWH/
   6c9DL+rk5qznpFAfDAGT4YX/dwZN0UzbAEggQ6w8Q460DprXvrtQRXLbo
   ijfhvy+nJkMg1Z6ufurqtplbkRKwXJvF7ct8X2Y/Yl62byRcsZTF4WUrq
   JnBp/n5AodEbl95VltrbsG4i2X+y8t/kwj5SDIwnAv/3Wrs8VmuADkrfZ
   WfeZcQbdUqEsA0hTrsVk2UFQ+T/sv1hmJgrCvF3ZhS8r9pdU17z4a2bV0
   w==;
X-CSE-ConnectionGUID: Ewtwp7RrRQCE4HQJ3oT13g==
X-CSE-MsgGUID: J2DvVV/DQ52Lh7M5t5kOWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="830099"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="830099"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 22:03:11 -0700
X-CSE-ConnectionGUID: 47e2D2J7QLW9Ak5WUhLtQg==
X-CSE-MsgGUID: 9JU4h+dwSmiLSuTztN53DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="268418013"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 18 Sep 2026 22:03:09 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7nE3-000000001Ka-0wch;
	Sat, 19 Sep 2026 05:02:59 +0000
Date: Sat, 19 Sep 2026 07:02:09 +0200
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [linux-next:master 2650/8449]
 arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dtb: switch@0
 (brcm,bcm53125): Unevaluated properties are not allowed ('#address-cells',
 '#size-cells', 'reset-gpios' were unexpected)
Message-ID: <202609190644.88298MaG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
commit: 457ba686447aeabe7f9c636503b4a39b65ad1875 [2650/8449] ARM: dts: BCM5301X: panamera: remove reset-names
config: arm-randconfig-2052-20260907 (https://download.01.org/0day-ci/archive/20260919/202609190644.88298MaG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609190644.88298MaG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609190644.88298MaG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts:144.13-195.6: Warning (avoid_unnecessary_addr_size): /mdio-mux@18003000/mdio@200/switch@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/broadcom/bcm5301x-nand-cs0.dtsi:10.18-19.5: Warning (avoid_unnecessary_addr_size): /nand-controller@18028000/nand@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/broadcom/bcm-ns.dtsi:24.28-47.4: Warning (unique_unit_address_if_enabled): /chipcommon-a-bus@18000000: duplicate unit-address (also used in node /axi@18000000)
   arch/arm/boot/dts/broadcom/bcm-ns.dtsi:377.22-382.4: Warning (unique_unit_address_if_enabled): /mdio@18003000: duplicate unit-address (also used in node /mdio-mux@18003000)
   arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dtb: /axi@18000000: failed to match any schema with compatible: ['brcm,bus-axi']
>> arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dtb: switch@0 (brcm,bcm53125): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
