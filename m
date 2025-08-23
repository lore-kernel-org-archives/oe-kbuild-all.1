Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCBD242D9A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 20:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755982789; cv=none; b=gvIpUe16n8/yBbkv4fZpn1MX6UIMvaBHmSaQJjOv/wxFZ86LZ4PjTMozunfLUBmF5hOrVK3scMH2QeSo+yuXSDkwDoWY6t8gaYHc6A48aboBHxc0REhzR5CxQuCE3HFsdxXpVJ57nmeeR7m6f6Q/GUj1xFF+Q8EeB6CaI1YqfZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755982789; c=relaxed/simple;
	bh=UQy5DosyqGsxtVWP6AVytDRkjaHfQ4yPsIwvMBiPd6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g67laqa0bn+iKfHbK2jZj+/EDk2CXVv3TN/4OJD6baLnA3dpBCxz8H+ZsI2mKpJYQjC52dU5CkCc42WXZ9A41dtSbqylY4muLdIyeq+N8ELO63lhZw2Piq7bi7xBomnGvfkSlYE70YCccJxCy4JrtMz6jYJAARN+tmH45eDfLSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iEGnbxEn; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iEGnbxEn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755982787; x=1787518787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UQy5DosyqGsxtVWP6AVytDRkjaHfQ4yPsIwvMBiPd6Y=;
  b=iEGnbxEnGTlIG/m/PgomD8GCMJQMXXiWUsuX/5s4BxusDX5X4aIboOuh
   SA1TZEii/2pOiEDDDsgH0ayQNeQL0FtItzd5Mn0riVe1gUDgPMMtzxGDk
   qP/bOpBP1XukC6/MYiZF6hwJDQSxlSjHs2BoO9HcWKEF3QHStASd4pp5B
   j/PnEyy3h0dE+E3AGvg9tsDx2pREMPWD5ZXG7u8pMsZ444k7587BYciFv
   4Foy8lhm/LnGHAdhA6qyAJ7pHj3sx6j3fRqZEr71F0phaKdTujxL4BchN
   0AxU7AZbST37T1Uv/gpqGePEoRgybbxy78nhCy27XUaiNmE//uahwINkg
   w==;
X-CSE-ConnectionGUID: OuZOO58rRXqe9rtvvzwIFw==
X-CSE-MsgGUID: AtZfVTPxQ9epYqJ5gC70Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58312262"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58312262"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 13:59:46 -0700
X-CSE-ConnectionGUID: xt0nR7GrRdCDRKvILJGhqg==
X-CSE-MsgGUID: Ys9FATsLTLWN2cw6n6euPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173158548"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 23 Aug 2025 13:59:45 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upvKx-00029T-0V;
	Sat, 23 Aug 2025 20:59:43 +0000
Date: Sat, 23 Aug 2025 22:58:45 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 443/443]
 arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/syscon@1a04f000:
 failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawa',
 'syscon']
Message-ID: <202508232227.HejuNnRt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   12cacc6855c36b7b2ce4a8f020b4a40a6433357b
commit: a1d33501caca76b0650cb75eafcab35c80d479e5 [443/443] CHROMIUM: arm64: dts: mt8189-skywalker: Initial DTS for skywalker reference
config: arm64-randconfig-2051-20250823 (https://download.01.org/0day-ci/archive/20250823/202508232227.HejuNnRt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508232227.HejuNnRt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508232227.HejuNnRt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: iommu@19010000 (mediatek,mt8189-iommu-apu): 'mediatek,larbs' is a required property
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-main', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/larb@1a001000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/larb@1a002000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/smi@1a00c000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/smi@1a00d000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/larb@1a00f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/larb@1a010000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/syscon@1a04f000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawa', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/syscon@1a06f000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawb', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/syscon@1b000000: failed to match any schema with compatible: ['mediatek,mt8189-ipesys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/smi@1b00e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/larb@1b10f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/larb@1b00f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/syscon@1c000000: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ao-ckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/power-controller@1c001000: failed to match any schema with compatible: ['mediatek,mt8189-scpsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/syscon@1c00c000: failed to match any schema with compatible: ['mediatek,mt8189-vlpcfg-reg-bus', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/syscon@1c00f000: failed to match any schema with compatible: ['mediatek,mt8189-dvfsrc-top', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/syscon@1c012000: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/devapc@1c01c000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/mailbox@1c351000: failed to match any schema with compatible: ['mediatek,tinysys_mbox']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: scp@1c400000 (mediatek,mt8189-scp): clock-names:0: 'main' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/syscon@1c80a000: failed to match any schema with compatible: ['mediatek,mt8189-scp-i2c-clk', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/syscon@1cb21000: failed to match any schema with compatible: ['mediatek,mt8189-scp-clk', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/pwrap@1cc04000: failed to match any schema with compatible: ['mediatek,mt8189-pwrap']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/pwrap@1cc04000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/pwrap@1cc04000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt6359-auxadc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/pwrap@1cc04000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/spmi@1cc06000: failed to match any schema with compatible: ['mediatek,mt8189-spmi']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: mt6319@7 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: mt6319@8 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/devapc@1e019000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/syscon@1e800000: failed to match any schema with compatible: ['mediatek,mt8189-mm-infra', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/smi@1e801000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: iommu@1e802000 (mediatek,mt8189-iommu-mm): interrupts: [[0, 278, 4, 0], [0, 279, 4, 0], [0, 280, 4, 0], [0, 281, 4, 0], [0, 282, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/smi@1e807000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/smi@1e808000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/smi@1e809000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/smi@1e80a000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/devapc@1e826000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: gce@1e980000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: gce@1e980000 (mediatek,mt8189-gce): clock-names:0: 'gce' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: gce@1e980000 (mediatek,mt8189-gce): clock-names: ['gce0', 'gce-timer'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: gce@1e980000 (mediatek,mt8189-gce): clocks: [[165, 0], [165, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/syscon@1e9800f0: failed to match any schema with compatible: ['mediatek,mt8189-gce-d', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: gce@1e990000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: gce@1e990000 (mediatek,mt8189-gce): clock-names:0: 'gce' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: gce@1e990000 (mediatek,mt8189-gce): clock-names: ['gce1', 'gce-timer'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: gce@1e990000 (mediatek,mt8189-gce): clocks: [[165, 1], [165, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/syscon@1e9900f0: failed to match any schema with compatible: ['mediatek,mt8189-gce-m', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/syscon@1f000000: failed to match any schema with compatible: ['mediatek,mt8189-mdpsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/larb@1f002000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: thermal-zones: 'soc_max' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/emiisu: failed to match any schema with compatible: ['mediatek,common-emiisu']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
