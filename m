Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4600422DF87
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 11:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738839609; cv=none; b=crLkeOMSsQFk0ovacKYxdn26f0zIH7zSICGVweieRnKGLPF8E1M4EFeJsjjkTHHoVx7wl3ePig3KlK7X9/cDiYfDxDt1GRJ19KuhKju2jwsJ5T7e0wr8yLrpr8xNBAJsqXnxn5veCQTBIA1XTvdIigKaRsiRb2kKTL5ijSMjR2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738839609; c=relaxed/simple;
	bh=RCBLqwwO5xTzxFvTAMfg8JgH02peePijIg/bl5pyjJM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MgM0urVPSUOdcnjkIBjkFH+JPQfxOA+eDth90DuReXqXVpsS13WFvhOj4CGbOPSzyUV9n98L/w1z1CB2/TmT3/MMqMtwf+LJauLyviKTmmp7CYUEHEsxn9oqpE3qasIQ54RS9DJ0y4tXZb+pPsvHAPTSDlX23hirKS1HKcyWSJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GRU9d0J5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GRU9d0J5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738839606; x=1770375606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RCBLqwwO5xTzxFvTAMfg8JgH02peePijIg/bl5pyjJM=;
  b=GRU9d0J5JVmn5s9xRp4cexLbGkVXLSdHmc9gkpl01DmlS12saCnkQ8Yd
   fd9hvb8cGFcgeekgrGucFy4EjIEGEcRxhROA9jK8Ki5+Nhu8/FknxYZAp
   Oo2nq7QVBAt9/RdwdbRabLHtCk2YnOi6u8PimxiVTzZPTR8Y6evgoIWUD
   tX0YgKsYBESOI2UU/n1AoHx5SjxHYwVcMJneeqPVYr0+L/aGY6PJTx2U3
   b8t6BQwYlPxI1fsODsVu76SNtpBYuPg07ZvcahIdNXTjK5X3scFMHd1sI
   n0vF06j4iBzO7n+ku5Do9ot8qHd6RHgIPfIAtLsmdkBjR8NxZyUGeQm4x
   g==;
X-CSE-ConnectionGUID: zhGca5y6QY+j4P/432NVOQ==
X-CSE-MsgGUID: WLQNAvzCSWqbGBODtC9JDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42271786"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="42271786"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 03:00:06 -0800
X-CSE-ConnectionGUID: VmDwNHEFRNud2JV6iomtsw==
X-CSE-MsgGUID: iU/tKXjkQJSyf7B4aLklPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148390671"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Feb 2025 03:00:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfzc1-000wlt-2w;
	Thu, 06 Feb 2025 11:00:01 +0000
Date: Thu, 6 Feb 2025 18:59:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 170/170]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb:
 /reserved-memory/adsp-mem-region@90000000: failed to match any schema with
 compatible: ['mediatek,adsp-reserved-memory']
Message-ID: <202502061800.PsIwfgyc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1fe62fcb2a55fbf67fb3bb11d7398dfbebfa9f71
commit: 990c0028a0ae7e53185e8a333c0405bc9b5febcc [170/170] CHROMIUM: arm64: dts: mediatek: mt8196: Add DSP device node
config: arm64-randconfig-051-20250204 (https://download.01.org/0day-ci/archive/20250206/202502061800.PsIwfgyc-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502061800.PsIwfgyc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502061800.PsIwfgyc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clk-ao: #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clk-ao: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clkitg: $nodename:0: 'clkitg' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clkitg: #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clkitg: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/adsp-mem-region@90000000: failed to match any schema with compatible: ['mediatek,adsp-reserved-memory']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/vcp-reserved-memory@a0200000: failed to match any schema with compatible: ['mediatek,me-vcp-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e4000: failed to match any schema with compatible: ['mediatek,mt8196-ptppll-pll-ctrl', 'mediatek,mt8196-ptppll_pll_ctrl', 'syscon']
--
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169b0000: failed to match any schema with compatible: ['mediatek,mt8196-pextp0cfg-ao', 'mediatek,mt8196-pextp0cfg_ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169b0000: failed to match any schema with compatible: ['mediatek,mt8196-pextp0cfg-ao', 'mediatek,mt8196-pextp0cfg_ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169b0000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169e0000: failed to match any schema with compatible: ['mediatek,mt8196-pextp1cfg-ao', 'mediatek,mt8196-pextp1cfg_ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169e0000: failed to match any schema with compatible: ['mediatek,mt8196-pextp1cfg-ao', 'mediatek,mt8196-pextp1cfg_ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169e0000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@18000000: failed to match any schema with compatible: ['mediatek,mt8196-ssr-top', 'mediatek,mt8196-ssr_top', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@18000000: failed to match any schema with compatible: ['mediatek,mt8196-ssr-top', 'mediatek,mt8196-ssr_top', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@180f3000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/adsp@1a000000: failed to match any schema with compatible: ['mediatek,mt8196-dsp']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@1a019000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1a110000: failed to match any schema with compatible: ['mediatek,mt8196-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/mt8196-afe-pcm@1a110000: failed to match any schema with compatible: ['mediatek,mt8196-sound']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mailbox@1a350000: compatible:0: 'mediatek,mt8196-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mailbox@1a350000: compatible: ['mediatek,mt8196-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/mailbox@1a350000: failed to match any schema with compatible: ['mediatek,mt8196-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mailbox@1a360000: compatible:0: 'mediatek,mt8196-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mailbox@1a360000: compatible: ['mediatek,mt8196-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/mailbox@1a360000: failed to match any schema with compatible: ['mediatek,mt8196-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/power-controller@1c004000: failed to match any schema with compatible: ['mediatek,mt8196-scpsys-hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1c00d000: failed to match any schema with compatible: ['mediatek,mt8196-scpsys-bus', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: watchdog@1c010000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-wdt', 'mediatek,mt6589-wdt', 'syscon', 'simple-mfd'] is too long
   	'mediatek,mt8196-wdt' is not one of ['mediatek,mt2712-wdt', 'mediatek,mt6589-wdt', 'mediatek,mt6735-wdt', 'mediatek,mt6795-wdt', 'mediatek,mt7986-wdt', 'mediatek,mt8183-wdt', 'mediatek,mt8186-wdt', 'mediatek,mt8188-wdt', 'mediatek,mt8192-wdt', 'mediatek,mt8195-wdt']
   	'mediatek,mt8196-wdt' is not one of ['mediatek,mt2701-wdt', 'mediatek,mt6582-wdt', 'mediatek,mt6797-wdt', 'mediatek,mt7622-wdt', 'mediatek,mt7623-wdt', 'mediatek,mt7629-wdt', 'mediatek,mt8173-wdt', 'mediatek,mt8365-wdt', 'mediatek,mt8516-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/mediatek,mtk-wdt.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: watchdog@1c010000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/mediatek,mtk-wdt.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/watchdog@1c010000: failed to match any schema with compatible: ['mediatek,mt8196-wdt', 'mediatek,mt6589-wdt', 'syscon', 'simple-mfd']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
