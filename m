Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02479198830
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jul 2024 19:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720640329; cv=none; b=PQPw4R1CDpsrpDIHLxDTmAX0m8JyYdbguekYM8wPEyizgaSY4F091qn4PEDR2gaeJQmt8xDGUv+tsnssgOLWpTxBcCdaJKEPlPjsEnZSm1cbo/0X2ua0nvm+wbTgFMJIVA8cCHedyOlyXoU76L+QHWjzaN0TcAL6YQgV05TGwN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720640329; c=relaxed/simple;
	bh=V9OZAiGyEPBILRt30yF2ImkIL4+1ekMsbL8QFBab44s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zh7rVQu2NuP0h7nR+jzefx1ZXh6Rqeoapuxbif3ZwHq+TPxdTo6Boc0Tx6tou3pQJAdAKr7u3xzJPU/GIEb10c7RgigacT9AhoeSB6YdAH2OsMcsLtpqxYc6s29DzbOpf7Vg8R268F4ZkRC/Gia6sb3UAURiHgLqXwjDLrP4bhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kTgQrwbY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kTgQrwbY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720640327; x=1752176327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V9OZAiGyEPBILRt30yF2ImkIL4+1ekMsbL8QFBab44s=;
  b=kTgQrwbYI9gEAs+hPmoaRuvUa3B6cyIFDJE8gtI3GQyjD81J9vl9kps8
   g2aU4sXgLlTXaU6mLNenTy1Fgvt98vCLUL/+AY7oB+yN+SGXh1mX2ooRr
   5EyJQyy5Anz3xa8AbDrY1GnXj8VDH9caY1IfGxRzbCV4BY53qK1sc+0aS
   dYvuVoWKebbQVIzErGlhNFU1xnGdDx97U33XuGUDmrbD/Jf4Rf1f3j98l
   UGSJkIwA9lGrd5MRxAIpM9nLFNaZ72suld7MJLbhv/ZwYF8zQCdzBA/U2
   6537wLGKNxV7zmGobeDPHFk3h9+kpjKsLgUinTZ34kFjvivfIjGxFEnWN
   Q==;
X-CSE-ConnectionGUID: baayqE2sS/GZu6yCduWKqQ==
X-CSE-MsgGUID: 73IsittuRO65WqzlVu/e8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17933994"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="17933994"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 12:38:44 -0700
X-CSE-ConnectionGUID: MB8Vq2xvQnW2aRO8A0YlRw==
X-CSE-MsgGUID: aANTQnyZTyCigWrWdlpbMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="52713154"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Jul 2024 12:38:42 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRd9E-000YDy-0z;
	Wed, 10 Jul 2024 19:38:40 +0000
Date: Thu, 11 Jul 2024 03:38:20 +0800
From: kernel test robot <lkp@intel.com>
To: Eddie James <eajames@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ninad Palsule <ninad@linux.ibm.com>
Subject: [linux-next:master 2666/12309]
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: i2c-mux: idle-state:
 [0] is not of type 'integer'
Message-ID: <202407110350.zTjARSrB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   523b23f0bee3014a7a752c9bb9f5c54f0eddae88
commit: 26e67f6ba292b41c6cf297194a3f2941688cad0f [2666/12309] ARM: dts: aspeed: Add IBM P11 Blueridge BMC system
config: arm-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407110350.zTjARSrB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407110350.zTjARSrB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407110350.zTjARSrB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/fsi2spi@1c00/spi@0: failed to match any schema with compatible: ['ibm,spi-fsi']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/fsi2spi@1c00/spi@20: failed to match any schema with compatible: ['ibm,spi-fsi']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/fsi2spi@1c00/spi@40: failed to match any schema with compatible: ['ibm,spi-fsi']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/fsi2spi@1c00/spi@60: failed to match any schema with compatible: ['ibm,spi-fsi']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/sbefifo@2400/occ: failed to match any schema with compatible: ['ibm,p10-occ']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/fsi@3400/cfam@3,0/fsi@3400: failed to match any schema with compatible: ['ibm,p9-fsi-controller']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: i2c-mux: idle-state: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-gpio.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: i2c-mux: Unevaluated properties are not allowed ('idle-state' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
