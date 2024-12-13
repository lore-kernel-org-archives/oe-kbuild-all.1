Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E12B1990C3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Dec 2024 22:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734129499; cv=none; b=tR0SGAIWqPDBQcHwcJHvpc3EYaCGSl2IWPICIt8ZCTx37M5SY/MFxwrPfzr8n7ysAV7NhpZSA4LhihFfHBLMAKl7f877Y5afBp3YAbCJR3dlOV0yjOKiUPtn5mnV4NJFkwQ5VRT9AnGeilSfbehZYVkL81Ue7BzwKNgbv//ldGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734129499; c=relaxed/simple;
	bh=vjFrT7wSsW/QhNsBHFIjyB/OADH0cDQoo0nBIQn5QDU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t7vtTGegjkck0D9YwtSngH0qGdSNPulfSYen1XByuDpqe+0fAvG4bQVHylWTF7Vh5OILiAQ7UiKSXeTOYLFj0ssnFP7i/6z7+mbtWnGHLF1HSUsNpbPZTu1NsGGJbWoTu25KxKYvx/t58ieyxQtmvCJSM77q9ei/kxl9gfFrzEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q/Dr9gqh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q/Dr9gqh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734129497; x=1765665497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vjFrT7wSsW/QhNsBHFIjyB/OADH0cDQoo0nBIQn5QDU=;
  b=Q/Dr9gqhKDaMY/Fe28k70VNqn2fWswy0DYWPwPn4rTQMHM537ca0HJ41
   U4trJSpdHDL7rL82zYDtm+vd3KVi2uqBcaH6hUM8YSeR/9a2dWcMjJtnj
   9bRwLiidXAr+BfpqnZeft62KxmcuidZF7+0uaf54VRel0f7xadQtqGZe4
   1Bm04VaEJuWHnFf/H659HD/Xhp6/KeiUaERNsJLj8EPPfhgwG87Ykv/ej
   d0mAOKE6wtovfuNPnO130kaHx0+bp+kwhFkF0+dJLOGdnbEbiOCCfh+Sl
   cb8DXxr1QccvbJLjcUKNKegfb3YklQY8mPd/+9iyGDB1CtV947pHPrlE7
   g==;
X-CSE-ConnectionGUID: 3OSc+FdaQPaYLeeNW1UBRw==
X-CSE-MsgGUID: I7b9OM7kTP2zdLvAysfnjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="22177816"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="22177816"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 14:38:16 -0800
X-CSE-ConnectionGUID: UPgBVGL3TQehj1/xKseHZQ==
X-CSE-MsgGUID: x9v8yuO3QW6aQFtei/xBUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="101496542"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Dec 2024 14:38:15 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMEIW-000CUw-36;
	Fri, 13 Dec 2024 22:38:12 +0000
Date: Sat, 14 Dec 2024 06:37:57 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [linux-next:master 3491/3764]
 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pmic@6:
 regulators:vbuck1: Unevaluated properties are not allowed
 ('regulator-compatible' was unexpected)
Message-ID: <202412140652.jDRwWiO1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4176cf5c5651c33769de83bb61b0287f4ec7719f
commit: 08242719a8af603db54a2a79234a8fe600680105 [3491/3764] regulator: dt-bindings: mt6315: Drop regulator-compatible property
config: arm64-randconfig-051-20241213 (https://download.01.org/0day-ci/archive/20241214/202412140652.jDRwWiO1-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 2dc22615fd46ab2566d0f26d5ba234ab12dc4bf8)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412140652.jDRwWiO1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412140652.jDRwWiO1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pmic: 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pmic@6: regulators:vbuck1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pmic@6: regulators:vbuck3: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pmic@7: regulators:vbuck1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: syscon@11210000: 'mt8192-afe-pcm' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: mt8192-afe-pcm: clocks: [[59, 0], [59, 7], [59, 8], [59, 6], [59, 21], [59, 1], [59, 2], [59, 4], [59, 3], [59, 5], [59, 9], [59, 10], [59, 18], [59, 19], [59, 20], [59, 22], [59, 23], [59, 24], [59, 25], [59, 26], [23, 47], [23, 58], [22, 27], [22, 28], [22, 72], [22, 47], [22, 101], [22, 48], [22, 105], [22, 43], [22, 103], [22, 44], [22, 107], [22, 59], [22, 60], [22, 61], [22, 62], [22, 63], [22, 64], [22, 65], [22, 66], [22, 67], [22, 68], [22, 142], [22, 143], [22, 144], [22, 145], [22, 146], [22, 147], [22, 148], [22, 149], [22, 150], [22, 151], [22, 152], [22, 55], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: mt8192-afe-pcm: clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: mt8192-afe-pcm: clock-names:4: 'aud_infra_26m_clk' was expected
--
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: pmic: 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: pmic@6: regulators:vbuck1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: pmic@6: regulators:vbuck3: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: pmic@7: regulators:vbuck1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: syscon@11210000: 'mt8192-afe-pcm' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: mt8192-afe-pcm: clocks: [[56, 0], [56, 7], [56, 8], [56, 6], [56, 21], [56, 1], [56, 2], [56, 4], [56, 3], [56, 5], [56, 9], [56, 10], [56, 18], [56, 19], [56, 20], [56, 22], [56, 23], [56, 24], [56, 25], [56, 26], [23, 47], [23, 58], [22, 27], [22, 28], [22, 72], [22, 47], [22, 101], [22, 48], [22, 105], [22, 43], [22, 103], [22, 44], [22, 107], [22, 59], [22, 60], [22, 61], [22, 62], [22, 63], [22, 64], [22, 65], [22, 66], [22, 67], [22, 68], [22, 142], [22, 143], [22, 144], [22, 145], [22, 146], [22, 147], [22, 148], [22, 149], [22, 150], [22, 151], [22, 152], [22, 55], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: mt8192-afe-pcm: clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: mt8192-afe-pcm: clock-names:4: 'aud_infra_26m_clk' was expected
--
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: pmic: 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: pmic@6: regulators:vbuck1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: pmic@6: regulators:vbuck3: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: pmic@7: regulators:vbuck1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: syscon@11210000: 'mt8192-afe-pcm' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: mt8192-afe-pcm: clocks: [[56, 0], [56, 7], [56, 8], [56, 6], [56, 21], [56, 1], [56, 2], [56, 4], [56, 3], [56, 5], [56, 9], [56, 10], [56, 18], [56, 19], [56, 20], [56, 22], [56, 23], [56, 24], [56, 25], [56, 26], [23, 47], [23, 58], [22, 27], [22, 28], [22, 72], [22, 47], [22, 101], [22, 48], [22, 105], [22, 43], [22, 103], [22, 44], [22, 107], [22, 59], [22, 60], [22, 61], [22, 62], [22, 63], [22, 64], [22, 65], [22, 66], [22, 67], [22, 68], [22, 142], [22, 143], [22, 144], [22, 145], [22, 146], [22, 147], [22, 148], [22, 149], [22, 150], [22, 151], [22, 152], [22, 55], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: mt8192-afe-pcm: clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: mt8192-afe-pcm: clock-names:4: 'aud_infra_26m_clk' was expected
--
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: pmic: 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: pmic@6: regulators:vbuck1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: pmic@6: regulators:vbuck3: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: pmic@7: regulators:vbuck1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: syscon@11210000: 'mt8192-afe-pcm' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: mt8192-afe-pcm: clocks: [[56, 0], [56, 7], [56, 8], [56, 6], [56, 21], [56, 1], [56, 2], [56, 4], [56, 3], [56, 5], [56, 9], [56, 10], [56, 18], [56, 19], [56, 20], [56, 22], [56, 23], [56, 24], [56, 25], [56, 26], [23, 47], [23, 58], [22, 27], [22, 28], [22, 72], [22, 47], [22, 101], [22, 48], [22, 105], [22, 43], [22, 103], [22, 44], [22, 107], [22, 59], [22, 60], [22, 61], [22, 62], [22, 63], [22, 64], [22, 65], [22, 66], [22, 67], [22, 68], [22, 142], [22, 143], [22, 144], [22, 145], [22, 146], [22, 147], [22, 148], [22, 149], [22, 150], [22, 151], [22, 152], [22, 55], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: mt8192-afe-pcm: clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: mt8192-afe-pcm: clock-names:4: 'aud_infra_26m_clk' was expected
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic: 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: mt6315@6: regulators:vbuck1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: mt6315@7: regulators:vbuck1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic@34: #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a: Unevaluated properties are not allowed ('VBAT-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a: 'DBVDD-supply' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic: 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: mt6315@6: regulators:vbuck1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: mt6315@7: regulators:vbuck1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic@34: #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/i2c@11e02000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: edp-tx@1c500000: 'aux-bus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic: 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: mt6315@6: regulators:vbuck1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: mt6315@7: regulators:vbuck1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic@34: #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/i2c@11e02000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: edp-tx@1c500000: 'aux-bus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic: 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: mt6315@6: regulators:vbuck1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: mt6315@7: regulators:vbuck1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic@34: #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a: Unevaluated properties are not allowed ('VBAT-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a: 'DBVDD-supply' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: pmic: 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: pmic@6: regulators:vbuck1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: pmic@7: regulators:vbuck1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic: 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic@6: regulators:vbuck1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic@7: regulators:vbuck1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
