Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB2A258CC0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 08:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740559326; cv=none; b=rdoROzOLh70EZcrxaDCaJPIKL2RXkbr3aMBo3rf2MPKMHzKHPrnZCn7/tq+a0INWFSrNI1Bx4OgalGNEl99jHfVdQm66T4JO+uOlvus/wTIh49wGL/mSwv9eyTeH73cpGG+5YJuRQn7fRJgpD7I5nMEmHpHLHbrxP4k48b93KTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740559326; c=relaxed/simple;
	bh=el2Chi1RxV7Fdr3nSH2E5NsfD+R/cCUTfEjUkbNAreo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kFNvjdWNEJ9Pyi0RWKzgoS2ARJ102WzXl2sbUsjOfsI1xEZsVugD/WsZ1RFG/42+8+K4wBma0XPKLCuKMfLrPZl9W6m/FiSWSXVuwSkFn3DLL2zO6i7axS2DMkk19gtsJKuewkGTQiMVcnM25HYKxPUj9WpUNi4jofjaPAkGON8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L1zwcWxt; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L1zwcWxt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740559324; x=1772095324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=el2Chi1RxV7Fdr3nSH2E5NsfD+R/cCUTfEjUkbNAreo=;
  b=L1zwcWxtWWdXDqMr1ScgFhutoMmFJqnk297trysJma45fDkDEUYe1v8L
   NVEZA0zbye2H3rgb+0OfYcF70vQGcCWtBBQLswOkF5fdjxcaxIOB6L7vJ
   5ebmvvtR8KUMkrcVhsYp6EBYolObK+tXJHeCnnDdryHM6V2ADt75IIqVJ
   RGMAaeGgiDsu7MeZ5Us/x2CWOSdRr9SXiR+cPjBQGQ1ms8I8eGOnZXQyQ
   nbyxhmsnceQ5iLLvLSimc3BCbVaASjvauskVnglaM7ARnxraSM5SOS+tF
   UEjQDIA6JFvE3RSIvEBsAtMhbK5a/xR68fYunXpBfuuSrxJ2ISpJx7RFU
   Q==;
X-CSE-ConnectionGUID: T+/5WLtGRXO3tgSD0yV60A==
X-CSE-MsgGUID: 6fEaLUo/SfG8bTstmGfIsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="58815687"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="58815687"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 00:42:03 -0800
X-CSE-ConnectionGUID: zNhLdZoGThGRi9ezslsfEg==
X-CSE-MsgGUID: zMqkW0WFT+Ofl8aAKJhq4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120757290"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 26 Feb 2025 00:42:02 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnCzQ-000BPz-0T;
	Wed, 26 Feb 2025 08:42:00 +0000
Date: Wed, 26 Feb 2025 16:41:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Wanner <Ryan.Wanner@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [linux-next:master 5770/6192]
 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb:
 /soc/chipid@e0020000: failed to match any schema with compatible:
 ['microchip,sama7d65-chipid']
Message-ID: <202502261654.My9aOdzk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0226d0ce98a477937ed295fb7df4cc30b46fc304
commit: 64382432013dff7642aaab4201c8bd4ad8118753 [5770/6192] ARM: dts: microchip: sama7d65: Add chipID for sama7d65
config: arm-randconfig-052-20250225 (https://download.01.org/0day-ci/archive/20250226/202502261654.My9aOdzk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502261654.My9aOdzk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502261654.My9aOdzk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/pinctrl@e0014000: failed to match any schema with compatible: ['microchip,sama7d65-pinctrl', 'microchip,sama7g5-pinctrl']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/pinctrl@e0014000: failed to match any schema with compatible: ['microchip,sama7d65-pinctrl', 'microchip,sama7g5-pinctrl']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/chipid@e0020000: failed to match any schema with compatible: ['microchip,sama7d65-chipid']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1800000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1800000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1804000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1804000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: flexcom@e2020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-flexcom', 'atmel,sama5d2-flexcom'] is too long
   	'atmel,sama5d2-flexcom' was expected
   	'microchip,sam9x7-flexcom' was expected
   	'microchip,sama7g5-flexcom' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/atmel,sama5d2-flexcom.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
