Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027503AD537
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 07:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785999884; cv=none; b=gVNRE++4iAMsR+6olXvMz6U/pHRxca6gE/SNWT5CsjPZn/6NKxdu7y5DceX3lYXI/+9cThMhKLCF6SvG5RhbiUfw1gKKizBnPsoed5MhGIKko8N8sUyVyMwsqyN+nr6C/AyhoxRBGU3d9PyQKnqj17QBDgdkcmJpQ09F0LhY4aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785999884; c=relaxed/simple;
	bh=uybity/yg5BRHJkXRsX+CN0NM1CIzcMLv3VoRjbiReE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q8VXqpNwqAIxU3n0oWs5xH0x6P6cTlnk7TMaKRod3S8sc1tGodoSItdOSjB2jmO7naxc+ityUrYoef+L+KxD1cZeFGmqSsaehxPwbhY3bkXyw74lkiS2qiDD9mt6AvTuMNiYTIzOZHcIYgUl0SaN9kYTuEZeVkpmnRnSNA8iu/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MHLp+Ze+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MHLp+Ze+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785999883; x=1817535883;
  h=date:from:to:cc:subject:message-id;
  bh=uybity/yg5BRHJkXRsX+CN0NM1CIzcMLv3VoRjbiReE=;
  b=MHLp+Ze+0CdAibHgx17lKdITuQ+ypLAQHrJ2tqvxy3BKbkf2yWucmGvw
   ekapyzlE/n3SErIp8RXV1qLyg+qH6+WcYFY8iRCscFHKH1NqzzNFDsFgQ
   ecdRo1tw3EJFo7T6cm14lOeVABMszYHvQLAkQp3z2l4A4LhbPGaqnEcVF
   Jfn6md1L/jmPEwbDcDXOJwOt+vYrP3OM1j9Y9yWZ2+EeVQPRFuwu9Grxz
   8VmOaTVSNREXRCcz6XYlXpN7ZEUi++LptW6PNFHZ9VXHsja6kxQWocozB
   TEwY7Sw4/M57YXFC8c8pnXbFcs7VELJaS1SczxVpIj2oPD56KKr5mKRxP
   A==;
X-CSE-ConnectionGUID: JIaxnLkuS5S08Nuy+MNhXQ==
X-CSE-MsgGUID: 9X6UdKdLTQOrpZNv8jMYKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="98097563"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="98097563"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 00:04:43 -0700
X-CSE-ConnectionGUID: uik9H88tTUaCbTMNeJ2wCQ==
X-CSE-MsgGUID: ZpUQB298S1Oa//cUibMVeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="255767880"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 06 Aug 2026 00:04:41 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrs9f-000000004a0-19RP;
	Thu, 06 Aug 2026 07:04:39 +0000
Date: Thu, 06 Aug 2026 09:03:42 +0200
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [linux-next:master 9617/13093]
 arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dtb: switch@0
 (brcm,bcm53125): Unevaluated properties are not allowed ('#address-cells',
 '#size-cells', 'reset-gpios', 'reset-names' were unexpected)
Message-ID: <202608060811.jdE2oUCq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1701fda2f58e345c050f4309971bdc07cd6146ba
commit: fca5276165993e9ca18e746f9b41af7627cbe349 [9617/13093] ARM: dts: BCM5301X: panamera: add phy-mode to switch
config: arm-randconfig-2053-20260803 (https://download.01.org/0day-ci/archive/20260806/202608060811.jdE2oUCq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608060811.jdE2oUCq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608060811.jdE2oUCq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts:144.13-196.6: Warning (avoid_unnecessary_addr_size): /mdio-mux@18003000/mdio@200/switch@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/broadcom/bcm5301x-nand-cs0.dtsi:10.18-19.5: Warning (avoid_unnecessary_addr_size): /nand-controller@18028000/nand@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/broadcom/bcm-ns.dtsi:24.28-47.4: Warning (unique_unit_address_if_enabled): /chipcommon-a-bus@18000000: duplicate unit-address (also used in node /axi@18000000)
   arch/arm/boot/dts/broadcom/bcm-ns.dtsi:377.22-382.4: Warning (unique_unit_address_if_enabled): /mdio@18003000: duplicate unit-address (also used in node /mdio-mux@18003000)
   arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dtb: /axi@18000000: failed to match any schema with compatible: ['brcm,bus-axi']
>> arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dtb: switch@0 (brcm,bcm53125): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'reset-gpios', 'reset-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dtb: switch@0 (brcm,bcm53125): 'resets' is a dependency of 'reset-names'
   	from schema $id: http://devicetree.org/schemas/reset/reset.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
