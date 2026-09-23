Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953555326CC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 13:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171419; cv=none; b=u/p1V71ZcHFfMvDjl/D6iOADXKm3U8LlwNRky5eG0drx8uc52dFU5zFa731CHa4xJ3KSdSYsfPwUhbClHysWRw+81RlxWEyjBOurQhJS+KCVUfcpW5mqJDjVI8LfLIcoXdv/gvRyH6W+9Veq8vDl7VPHvDswjSbx0uV851NBOxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171419; c=relaxed/simple;
	bh=KVwUgJCfsLiKBDfabzzLVJWW1HoZOErIo4P9HgdKLFc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YdOHDwEgBgwoumT1i4s0GGUslLWHJNs5HR+jnIED6TjGpCikZSflRRrTn8EBxd/umGupCGYauwWeRx205Kzt+zFTR00VjQjxZjHAPqjQodyjY9okXHtumA4+F45mkdOzaHY7H0WseelPJpnv/4UNrsJ7c3uP/FeaB/N+lNuR0Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FFWmrrNJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FFWmrrNJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790171417; x=1821707417;
  h=date:from:to:cc:subject:message-id;
  bh=KVwUgJCfsLiKBDfabzzLVJWW1HoZOErIo4P9HgdKLFc=;
  b=FFWmrrNJGwXergFM18ySNajjRMqbE3PyzjHN4/qmGH4ggNdQR+NLupX+
   gwp2ZzYSBYIrTRBSm/jsm3cQ86atFu/+eDFylCKm8tVxZ8/I3iR5CDF3G
   LbMmF1BUXck4+UIMQLOopL3YHpg+dTTbRRUt234SWKINVb9R1uVJ/V03Z
   sAPny3/ZfEUGsK/RC5vv3DSK5ArfHE7Csm/ba9R2eqgukBoT95GihIm7l
   /46Tnb3hI4ept4vrIfhAn1oxx8FAd+t4IWeyVen0yBJTidzTa/AywuBhp
   igwNuW/ANB4ph4WwdoThihHDzD9oYGCjnYVnngnKR/liFDmSc0mkhaISU
   g==;
X-CSE-ConnectionGUID: NXa3UqkRTN2S6AXjBhs2wQ==
X-CSE-MsgGUID: sqSuyKGmRXux4qL+hqiMHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="89787051"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="89787051"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 06:50:17 -0700
X-CSE-ConnectionGUID: PAPQn60tQxqERjvxuL6IqA==
X-CSE-MsgGUID: 0L6SLyeBTBGw8pUIkDlxrg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 23 Sep 2026 06:50:16 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9NMT-000000000hj-2Apk;
	Wed, 23 Sep 2026 13:50:13 +0000
Date: Wed, 23 Sep 2026 15:49:18 +0200
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [linux-next:master 2545/8910]
 arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dtb: switch@0
 (brcm,bcm53125): Unevaluated properties are not allowed ('#address-cells',
 '#size-cells', 'reset-gpios' were unexpected)
Message-ID: <202609231542.k8HZXf6n-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a8c591ed6b672915e0be57843f943a2a723aff40
commit: 457ba686447aeabe7f9c636503b4a39b65ad1875 [2545/8910] ARM: dts: BCM5301X: panamera: remove reset-names
config: arm-randconfig-2052-20260907 (https://download.01.org/0day-ci/archive/20260923/202609231542.k8HZXf6n-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231542.k8HZXf6n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231542.k8HZXf6n-lkp@intel.com/

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
