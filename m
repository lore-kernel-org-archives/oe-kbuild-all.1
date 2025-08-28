Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35A61AAE17
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Aug 2025 03:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756350580; cv=none; b=kbTtlafW7jeY4Hi9GK0W3Q8vI8jcydaSoBMIF5dngvJ39m0rjMReDmJX2xI9GMMCc02+deJNiWrvWBJfbRLTMsS4ua7fL/IjkDH+FsJeKFm4syQSPfyHvyToy26+k+puXFR8EL/jT+HDXAMshO1NhrCfhfn1tamlpGTw0OS77D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756350580; c=relaxed/simple;
	bh=d31T4URBp55KgLbvpd0a14urG2Sf7doYcFzQiqzQqhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eDYQuvy7MoMdmStUP1yRNs1qEqcI8zgknJDvm45OFbcEkPxHI3qeNRzmEjms/5zSzEjEm11ThRrNQXcGZt6P6PZS4vg8aMHY8q+heaKpwz/LdX17X8EmR2Azys9aJq6D5S4sg/4ALxv7Sbu4ObGFqf02vvEfhCqtphW+IkNzj2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BAnRmAe3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BAnRmAe3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756350578; x=1787886578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d31T4URBp55KgLbvpd0a14urG2Sf7doYcFzQiqzQqhQ=;
  b=BAnRmAe3qO7bv9iUhp8lz9+l4/LaXnMLgswfC/nYB7VztShxY8bTXvOr
   euYesvYHN1M5BqhBTSNXFoLGizH/15QYvFapeVZ9NhZaJePRtFCsQULmH
   deuA9cVgkK3+I4GjwJ+PcbVZ11gVMf56Q7MRQmWKJZgeqteXtVHTazsDj
   gys3+BKUshzayzwguetPXn19msm6dUsfd2HsOsTSb4J43lY8tPXfN21Gl
   NcAQt5f5Pnc11Pi5pQOeNhxuI09QL0QCicu+Ag5A/p5fJd6dDQkPdFUUz
   TIZteXYVvTx6KQ/G6DW2gFk7YICpqnOB0ru2QWtA/HHxh+iVmLIGmPqk4
   w==;
X-CSE-ConnectionGUID: j6537AmHRf68sEXk31H5ew==
X-CSE-MsgGUID: BLpaf6GqRn+8+ZTWYEacFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="76061706"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="76061706"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 20:09:37 -0700
X-CSE-ConnectionGUID: 24k1yXWkR6S45023SgjTsQ==
X-CSE-MsgGUID: WkQYLBHNTtm7LSdI8lqMWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="175267089"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 27 Aug 2025 20:09:35 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urT13-0002kB-2R;
	Thu, 28 Aug 2025 03:09:33 +0000
Date: Thu, 28 Aug 2025 05:09:23 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 443/443]
 arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/syscon@1a04f000:
 failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawa',
 'syscon']
Message-ID: <202508280546.isulmtS5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   9aa69a4a326c92e706db5880070c5489ff6739c9
commit: a1d33501caca76b0650cb75eafcab35c80d479e5 [443/443] CHROMIUM: arm64: dts: mt8189-skywalker: Initial DTS for skywalker reference
config: arm64-randconfig-2051-20250823 (https://download.01.org/0day-ci/archive/20250828/202508280546.isulmtS5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250828/202508280546.isulmtS5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508280546.isulmtS5-lkp@intel.com/

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
