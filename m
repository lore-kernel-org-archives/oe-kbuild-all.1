Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D44288A2
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 04:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773031110; cv=none; b=TjVH/vdt3WvpnJGvk2hMrcWmAhjHjIt/fu81MLCZjKQrvnzXpnTnwVBaV5Z6honXQt+Yn50hD4Bu/+oC4I4bmtHCFpps6EOnmYzgQb2pmwEj8ZnE6+5yzJ74mXF+xzA6W3BTMbf9Q4ObxoYnuU944N2uDV4B2+O/h8eU84Y3Wg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773031110; c=relaxed/simple;
	bh=qSplbphK10y4h2ipafmbl+4zyeCjm10N4JfDLxDNE3Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RUixsdEaKvadptXPrC0u07tJ5pEO3AkylogWlwawE9c6l36BAK8LJjup1tMt44dkdz/ILv3z8S5N7jCSxnFjnb55La1/5aP//qTgJl2ZjqM+xvTqI71ttCRhFXFhjsWZUR//byhMv6TZugOq5lPz3iCrBX2oLTP3m6x4jxfztjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OiPy7IxJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OiPy7IxJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773031109; x=1804567109;
  h=date:from:to:cc:subject:message-id;
  bh=qSplbphK10y4h2ipafmbl+4zyeCjm10N4JfDLxDNE3Y=;
  b=OiPy7IxJtUN7Zh8VjBcv6n4e1aw/mvbUBrf2yyonXHsXwUiLUV0WslIk
   6X2yegUcxwQvz0pwCkIbHBZ3kCTEzb3uyPUXNbh/U80wGEAlYiibxTjdW
   EjGUbT6+mKWTwsZn2rrZwQRFCB0138nyv11pi6UkL9teeJvSqjnnb9YXU
   FIs2zVmKbVEBxc/mXx9qUCzHliu0H2w/igDf7uq5ssJqLS/GC/fRN7mO+
   5x57OmLsrGEonb7/u382fbIy4rBPabir6oI2E+wsMjrYkhdgGiw9YVfp9
   /CqWLT0qPAKPbyDrwrBXB3Hmc3YJ6X7UIwu0MGqRuwqwk0Tihn5Lekte0
   A==;
X-CSE-ConnectionGUID: Jgqab22tQyGlK+fXiQJ2Og==
X-CSE-MsgGUID: cot9PrfNSeWfI11TQCopKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="84374422"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="84374422"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 21:38:29 -0700
X-CSE-ConnectionGUID: SmuRDJxDTdGmSQR0p6LfVg==
X-CSE-MsgGUID: ZHX6HLudSFaObunbKAU4dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="217260019"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 08 Mar 2026 21:38:26 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzSNs-000000002oZ-1soi;
	Mon, 09 Mar 2026 04:38:24 +0000
Date: Mon, 09 Mar 2026 05:37:25 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-rc 45/64]
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: clock-controller@1a100800
 (mediatek,mt7622-pciesys): compatible: ['mediatek,mt7622-pciesys', 'syscon']
 is too long
Message-ID: <202603090524.h8MXK0lk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-rc
head:   027868526273f2766cd140b0fb54609225da2cf9
commit: 2955e80f442734f4debecdce4b49f1072505ae8e [45/64] arm64: dts: mt7622: fix sata
config: arm64-randconfig-2054-20260307 (https://download.01.org/0day-ci/archive/20260309/202603090524.h8MXK0lk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603090524.h8MXK0lk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603090524.h8MXK0lk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: clock-controller@11220000 (mediatek,mt7622-audsys): audio-controller:clocks: [[2, 2], [18, 80], [18, 81], [18, 107], [18, 108], [18, 89], [18, 90], [18, 91], [18, 92], [18, 95], [18, 96], [18, 97], [18, 98], [18, 103], [18, 104], [18, 105], [18, 106], [37, 8], [37, 9], [37, 10], [37, 11], [37, 4], [37, 5], [37, 6], [37, 7], [37, 14], [37, 15], [37, 39], [37, 40], [37, 0], [37, 46], [37, 17], [37, 18]] is too short
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: clock-controller@11220000 (mediatek,mt7622-audsys): audio-controller: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: audio-controller (mediatek,mt7622-audio): clock-names: ['infra_sys_audio_clk', 'top_audio_mux1_sel', 'top_audio_mux2_sel', 'top_audio_a1sys_hp', 'top_audio_a2sys_hp', 'i2s0_src_sel', 'i2s1_src_sel', 'i2s2_src_sel', 'i2s3_src_sel', 'i2s0_src_div', 'i2s1_src_div', 'i2s2_src_div', 'i2s3_src_div', 'i2s0_mclk_en', 'i2s1_mclk_en', 'i2s2_mclk_en', 'i2s3_mclk_en', 'i2so0_hop_ck', 'i2so1_hop_ck', 'i2so2_hop_ck', 'i2so3_hop_ck', 'i2si0_hop_ck', 'i2si1_hop_ck', 'i2si2_hop_ck', 'i2si3_hop_ck', 'asrc0_out_ck', 'asrc1_out_ck', 'asrc2_out_ck', 'asrc3_out_ck', 'audio_afe_pd', 'audio_afe_conn_pd', 'audio_a1sys_pd', 'audio_a2sys_pd'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: audio-controller (mediatek,mt7622-audio): clocks: [[2, 2], [18, 80], [18, 81], [18, 107], [18, 108], [18, 89], [18, 90], [18, 91], [18, 92], [18, 95], [18, 96], [18, 97], [18, 98], [18, 103], [18, 104], [18, 105], [18, 106], [37, 8], [37, 9], [37, 10], [37, 11], [37, 4], [37, 5], [37, 6], [37, 7], [37, 14], [37, 15], [37, 39], [37, 40], [37, 0], [37, 46], [37, 17], [37, 18]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: audio-controller (mediatek,mt7622-audio): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml
>> arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: clock-controller@1a100800 (mediatek,mt7622-pciesys): compatible: ['mediatek,mt7622-pciesys', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7622-pciesys.yaml
--
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: clock-controller@11220000 (mediatek,mt7622-audsys): audio-controller:clocks: [[2, 2], [18, 80], [18, 81], [18, 107], [18, 108], [18, 89], [18, 90], [18, 91], [18, 92], [18, 95], [18, 96], [18, 97], [18, 98], [18, 103], [18, 104], [18, 105], [18, 106], [38, 8], [38, 9], [38, 10], [38, 11], [38, 4], [38, 5], [38, 6], [38, 7], [38, 14], [38, 15], [38, 39], [38, 40], [38, 0], [38, 46], [38, 17], [38, 18]] is too short
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: clock-controller@11220000 (mediatek,mt7622-audsys): audio-controller: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: audio-controller (mediatek,mt7622-audio): clock-names: ['infra_sys_audio_clk', 'top_audio_mux1_sel', 'top_audio_mux2_sel', 'top_audio_a1sys_hp', 'top_audio_a2sys_hp', 'i2s0_src_sel', 'i2s1_src_sel', 'i2s2_src_sel', 'i2s3_src_sel', 'i2s0_src_div', 'i2s1_src_div', 'i2s2_src_div', 'i2s3_src_div', 'i2s0_mclk_en', 'i2s1_mclk_en', 'i2s2_mclk_en', 'i2s3_mclk_en', 'i2so0_hop_ck', 'i2so1_hop_ck', 'i2so2_hop_ck', 'i2so3_hop_ck', 'i2si0_hop_ck', 'i2si1_hop_ck', 'i2si2_hop_ck', 'i2si3_hop_ck', 'asrc0_out_ck', 'asrc1_out_ck', 'asrc2_out_ck', 'asrc3_out_ck', 'audio_afe_pd', 'audio_afe_conn_pd', 'audio_a1sys_pd', 'audio_a2sys_pd'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: audio-controller (mediatek,mt7622-audio): clocks: [[2, 2], [18, 80], [18, 81], [18, 107], [18, 108], [18, 89], [18, 90], [18, 91], [18, 92], [18, 95], [18, 96], [18, 97], [18, 98], [18, 103], [18, 104], [18, 105], [18, 106], [38, 8], [38, 9], [38, 10], [38, 11], [38, 4], [38, 5], [38, 6], [38, 7], [38, 14], [38, 15], [38, 39], [38, 40], [38, 0], [38, 46], [38, 17], [38, 18]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: audio-controller (mediatek,mt7622-audio): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml
>> arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: clock-controller@1a100800 (mediatek,mt7622-pciesys): compatible: ['mediatek,mt7622-pciesys', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7622-pciesys.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
