Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE0A303C91
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Oct 2025 21:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761341247; cv=none; b=SYBwD+M1Nh0nUyEhmLc+4ndd9iWLNpkvq+pgGmrYJoN31TB/8UsJff5jKeuYk0YEJeALk3MwDsqo7gVfUMzjUIU9XnMfIeOZE+0nyM0ytej4t+7omRy4u0MDpctxqwjKqIaR7mt84Li7APL4XQ28lSetv6TM8FxiMNFWyHMUV3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761341247; c=relaxed/simple;
	bh=NBEsh1+sq658DFNWON4wTTQrf3XpamoyQq/ewRn1LC4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jkQN9ykkvNBiWctkFYovOn8deVbmA9E8m1trTIx4Ft/6+9B84knLSEkWVQhAYhtZXTeoLWzPnkVB8SBqXio9gCu5rth7NAyz3kYaS0m+KqeWje1We4B+GBhUFWUB7w8jSGga+bpfIBDhWt0W9A9HAvKN47l2w+PYfIB/0tNVedg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gnShpWoC; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gnShpWoC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761341247; x=1792877247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NBEsh1+sq658DFNWON4wTTQrf3XpamoyQq/ewRn1LC4=;
  b=gnShpWoCHr1JXM8BEWXd0GSoYOyPggSlKPDdAEDH71tNAADGs4xPMfJY
   LGzUqghoUHcx56gJ/Rfrpyx6AP2cr2pe+lr2da9+Y95ERmZAVyY1MsWiM
   uaXKZv47khexfT47q1J3Mx+Nwgcpykon8zAWIqh7TzTF93zCLF6fKQD5F
   toTwjQbU1y1TMniUHq6t83EGn5hiHn49nTaBCuqXRL/YEOIG7GHwm3lek
   vqbSKoANfegeocFW7YK3/nv82EWZbWS7/t7PoOxbDaOUDIvN23qDNUZyr
   Jntt3EQC4pNrZ83pSDhQ9sg7LqqOd6uOIUv7RMvGM1ZDGHHvdY+oseu8r
   g==;
X-CSE-ConnectionGUID: l7a2YtAFS0Wx/h9rtMIB7w==
X-CSE-MsgGUID: o4LxUpKVTemAyXkAOpeYIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74645382"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="74645382"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 14:27:26 -0700
X-CSE-ConnectionGUID: 6172tcTfTcm+IQDESOUtnw==
X-CSE-MsgGUID: OFpnCF7PTlG4/tlBLFuX+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="188914921"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 24 Oct 2025 14:27:24 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vCPJi-0000000004j-2D6L;
	Fri, 24 Oct 2025 21:27:22 +0000
Date: Fri, 24 Oct 2025 23:26:51 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: watchdog@2ad0000
 (fsl,ls1046a-wdt): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202510242334.ptryW5Xy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   e0f7aae0a0b74ad2fbf50d5e8eef38fd3dc0c841
commit: a86ea423dc1343a5244ef395f1deab75043f8321 [1/1] arm64: dts: add big-endian property back into watchdog node
config: arm64-randconfig-2051-20251016 (https://download.01.org/0day-ci/archive/20251024/202510242334.ptryW5Xy-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project de9013fa18a12f982a223ea30819b523e86667d4)
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510242334.ptryW5Xy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510242334.ptryW5Xy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/memory-controller@1530000/nand@0,0: failed to match any schema with compatible: ['fsl,ifc-nand']
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1046a-wdt', 'fsl,imx21-wdt'] is too long
   	'fsl,imx21-wdt' was expected
   	'fsl,ls1046a-wdt' is not one of ['fsl,imx25-wdt', 'fsl,imx27-wdt', 'fsl,imx31-wdt', 'fsl,imx35-wdt', 'fsl,imx50-wdt', 'fsl,imx51-wdt', 'fsl,imx53-wdt', 'fsl,imx6q-wdt', 'fsl,imx6sl-wdt', 'fsl,imx6sll-wdt', 'fsl,imx6sx-wdt', 'fsl,imx6ul-wdt', 'fsl,imx7d-wdt', 'fsl,imx8mm-wdt', 'fsl,imx8mn-wdt', 'fsl,imx8mp-wdt', 'fsl,imx8mq-wdt', 'fsl,ls1012a-wdt', 'fsl,ls1043a-wdt', 'fsl,vf610-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): Unevaluated properties are not allowed ('big-endian', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/watchdog@2ad0000: failed to match any schema with compatible: ['fsl,ls1046a-wdt', 'fsl,imx21-wdt']
--
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/memory-controller@1530000/nand@1,0: failed to match any schema with compatible: ['fsl,ifc-nand']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: flash@2 (en25s64): compatible: 'oneOf' conditional failed, one must be fixed:
   	['en25s64', 'jedec,spi-nor'] is too long
   	'en25s64' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at25df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'en25s64' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: flash@2 (en25s64): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/spi@2100000/flash@2: failed to match any schema with compatible: ['en25s64', 'jedec,spi-nor']
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1046a-wdt', 'fsl,imx21-wdt'] is too long
   	'fsl,imx21-wdt' was expected
   	'fsl,ls1046a-wdt' is not one of ['fsl,imx25-wdt', 'fsl,imx27-wdt', 'fsl,imx31-wdt', 'fsl,imx35-wdt', 'fsl,imx50-wdt', 'fsl,imx51-wdt', 'fsl,imx53-wdt', 'fsl,imx6q-wdt', 'fsl,imx6sl-wdt', 'fsl,imx6sll-wdt', 'fsl,imx6sx-wdt', 'fsl,imx6ul-wdt', 'fsl,imx7d-wdt', 'fsl,imx8mm-wdt', 'fsl,imx8mn-wdt', 'fsl,imx8mp-wdt', 'fsl,imx8mq-wdt', 'fsl,ls1012a-wdt', 'fsl,ls1043a-wdt', 'fsl,vf610-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): Unevaluated properties are not allowed ('big-endian', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/watchdog@2ad0000: failed to match any schema with compatible: ['fsl,ls1046a-wdt', 'fsl,imx21-wdt']
--
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/memory-controller@1530000/nand@0,0: failed to match any schema with compatible: ['fsl,ifc-nand']
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1046a-wdt', 'fsl,imx21-wdt'] is too long
   	'fsl,imx21-wdt' was expected
   	'fsl,ls1046a-wdt' is not one of ['fsl,imx25-wdt', 'fsl,imx27-wdt', 'fsl,imx31-wdt', 'fsl,imx35-wdt', 'fsl,imx50-wdt', 'fsl,imx51-wdt', 'fsl,imx53-wdt', 'fsl,imx6q-wdt', 'fsl,imx6sl-wdt', 'fsl,imx6sll-wdt', 'fsl,imx6sx-wdt', 'fsl,imx6ul-wdt', 'fsl,imx7d-wdt', 'fsl,imx8mm-wdt', 'fsl,imx8mn-wdt', 'fsl,imx8mp-wdt', 'fsl,imx8mq-wdt', 'fsl,ls1012a-wdt', 'fsl,ls1043a-wdt', 'fsl,vf610-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): Unevaluated properties are not allowed ('big-endian', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/watchdog@2ad0000: failed to match any schema with compatible: ['fsl,ls1046a-wdt', 'fsl,imx21-wdt']
--
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi:17.19-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@1550000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1046a-wdt', 'fsl,imx21-wdt'] is too long
   	'fsl,imx21-wdt' was expected
   	'fsl,ls1046a-wdt' is not one of ['fsl,imx25-wdt', 'fsl,imx27-wdt', 'fsl,imx31-wdt', 'fsl,imx35-wdt', 'fsl,imx50-wdt', 'fsl,imx51-wdt', 'fsl,imx53-wdt', 'fsl,imx6q-wdt', 'fsl,imx6sl-wdt', 'fsl,imx6sll-wdt', 'fsl,imx6sx-wdt', 'fsl,imx6ul-wdt', 'fsl,imx7d-wdt', 'fsl,imx8mm-wdt', 'fsl,imx8mn-wdt', 'fsl,imx8mp-wdt', 'fsl,imx8mq-wdt', 'fsl,ls1012a-wdt', 'fsl,ls1043a-wdt', 'fsl,vf610-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: watchdog@2ad0000 (fsl,ls1046a-wdt): Unevaluated properties are not allowed ('big-endian', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/watchdog@2ad0000: failed to match any schema with compatible: ['fsl,ls1046a-wdt', 'fsl,imx21-wdt']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
