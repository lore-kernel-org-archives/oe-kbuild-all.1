Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3443C136351
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Jun 2025 19:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748805623; cv=none; b=BYJnQR4pz0FZZnGdu8AWfZsD0u0MbOa2WeXwtf1aIz3VQ2CoSH4w6USYH4LeSXeLI12ZSO2EatixSIpoDHiDn6OLiYapouiwbSXUaHDae97Cdvm4JEdK/DsLY1rPgJFOLV2ep99nbGY8RilPVq6RDpkS++4jCRXGBN/P37lvaxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748805623; c=relaxed/simple;
	bh=Jtbndi3AepSFDnGmRK+CLSQBJkyrn15hfpvWys2phF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nli9OoWPiZyduNuLFZfBNU5yAKkSC6vajGM1glvRFWPtmicwmRE8Lxvz7QrH3N3SFrhQBwCYHdf4eyx0+c9CV2lUkJmuiMCwWbUYggKdXD90J1hgxd9gnxyfpfAWgtN/i4nyYE/P0u4be+6z5FZwLs1CbUNmV8/h+5DLaODBpNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=asBnPXqz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="asBnPXqz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748805622; x=1780341622;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Jtbndi3AepSFDnGmRK+CLSQBJkyrn15hfpvWys2phF8=;
  b=asBnPXqzfSmJ9rKSCeH68TsMHlEJNvOmCP1DJZLi/1PtEOdQueu/ugwR
   I+r+rjXZwphcCfmF54JARIPdVwWKCsNd3ff5MIVr4r1MRqJ+2WAu+NLPu
   dV5v6GPBG2h4bXRA2ECxAmje/I9TmK3bTGjCBpOxko8J7hBqvI1YyPLVj
   ZoxWXC3Q8r4QZBOoUKyrgS+KU8/KHq5IfE1x+fCsMd+aSHfnQyz2RfdNg
   2Labh5xQ+ruMFIrpj0j4aE+RuVxErsB0AIfsP6rpDJWFAe6J1yMDLDlw4
   rOokySVxAZyDv+fhPaVNk0TfHdefkeGQOGYFwBP3RfxVBxo96aNH20y5T
   Q==;
X-CSE-ConnectionGUID: XERinwDOTBOrwIC2n0az/Q==
X-CSE-MsgGUID: 0s/JU8WSR5KngtHUJnwY8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="54493778"
X-IronPort-AV: E=Sophos;i="6.16,201,1744095600"; 
   d="scan'208";a="54493778"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2025 12:20:21 -0700
X-CSE-ConnectionGUID: orRvRBQzSwKNV9mwvkemWg==
X-CSE-MsgGUID: VnVq5MDZRliQweDch4GRcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,201,1744095600"; 
   d="scan'208";a="145329108"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Jun 2025 12:20:20 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLoEC-000Z3M-3B;
	Sun, 01 Jun 2025 19:20:16 +0000
Date: Mon, 2 Jun 2025 03:20:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-rust 2/2]
 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pmic
 (mediatek,mt6359): 'mt6359codec', 'mt6359rtc' do not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202506020300.NrvKARxy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://android.googlesource.com/kernel/common android-mainline-rust
head:   e8191d4b0877b5e3025a126ac1d08756a322d055
commit: 5bcecfcaa6d1d4ea1b29082ed1fd077ba4cccb55 [2/2] dt-bindings: mfd: me=
diatek: mt6397: Add ADC, CODEC and Regulators for MT6359
config: arm64-randconfig-052-20250529 (https://download.01.org/0day-ci/arch=
ive/20250602/202506020300.NrvKARxy-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f81=
9f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250602/202506020300.NrvKARxy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506020300.NrvKARxy-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pmic (mediate=
k,mt6359): 'mt6359codec', 'mt6359rtc' do not match any of the regexes: '^pi=
nctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pmic (mediate=
k,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: syscon@112100=
00 (mediatek,mt8192-audsys): 'mt8192-afe-pcm' does not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,au=
dsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: mt8192-afe-pc=
m (mediatek,mt8192-audio): clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: mt8192-afe-pc=
m (mediatek,mt8192-audio): clock-names:4: 'aud_infra_26m_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: mt8192-afe-pc=
m (mediatek,mt8192-audio): clock-names: ['aud_afe_clk', 'aud_dac_clk', 'aud=
_dac_predis_clk', 'aud_adc_clk', 'aud_adda6_adc_clk', 'aud_apll22m_clk', 'a=
ud_apll24m_clk', 'aud_apll1_tuner_clk', 'aud_apll2_tuner_clk', 'aud_tdm_clk=
', 'aud_tml_clk', 'aud_nle', 'aud_dac_hires_clk', 'aud_adc_hires_clk', 'aud=
_adc_hires_tml', 'aud_adda6_adc_hires_clk', 'aud_3rd_dac_clk', 'aud_3rd_dac=
_predis_clk', 'aud_3rd_dac_tml', 'aud_3rd_dac_hires_clk', 'aud_infra_clk', =
'aud_infra_26m_clk', 'top_mux_audio', 'top_mux_audio_int', 'top_mainpll_d4_=
d4', 'top_mux_aud_1', 'top_apll1_ck', 'top_mux_aud_2', 'top_apll2_ck', 'top=
_mux_aud_eng1', 'top_apll1_d4', 'top_mux_aud_eng2', 'top_apll2_d4', 'top_i2=
s0_m_sel', 'top_i2s1_m_sel', 'top_i2s2_m_sel', 'top_i2s3_m_sel', 'top_i2s4_=
m_sel', 'top_i2s5_m_sel', 'top_i2s6_m_sel', 'top_i2s7_m_sel', 'top_i2s8_m_s=
el', 'top_i2s9_m_sel', 'top_apll12_div0', 'top_apll12_div1', 'top_apll12_di=
v2', 'top_apll12_div3', 'top_apll12_div4', 'top_apll12_divb', 'top_apll12_d=
iv5', 'top_apll12_div6', 'top_apll12_div7', 'top_apll12_div8', 'top_apll12_=
div9', 'top_mux_audio_h', 'top_clk26m_clk'] is too long
--
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: pmic (me=
diatek,mt6359): 'mt6359codec', 'mt6359rtc' do not match any of the regexes:=
 '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: pmic (me=
diatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: syscon@1=
1210000 (mediatek,mt8192-audsys): 'mt8192-afe-pcm' does not match any of th=
e regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,au=
dsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: mt8192-a=
fe-pcm (mediatek,mt8192-audio): clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: mt8192-a=
fe-pcm (mediatek,mt8192-audio): clock-names:4: 'aud_infra_26m_clk' was expe=
cted
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: mt8192-a=
fe-pcm (mediatek,mt8192-audio): clock-names: ['aud_afe_clk', 'aud_dac_clk',=
 'aud_dac_predis_clk', 'aud_adc_clk', 'aud_adda6_adc_clk', 'aud_apll22m_clk=
', 'aud_apll24m_clk', 'aud_apll1_tuner_clk', 'aud_apll2_tuner_clk', 'aud_td=
m_clk', 'aud_tml_clk', 'aud_nle', 'aud_dac_hires_clk', 'aud_adc_hires_clk',=
 'aud_adc_hires_tml', 'aud_adda6_adc_hires_clk', 'aud_3rd_dac_clk', 'aud_3r=
d_dac_predis_clk', 'aud_3rd_dac_tml', 'aud_3rd_dac_hires_clk', 'aud_infra_c=
lk', 'aud_infra_26m_clk', 'top_mux_audio', 'top_mux_audio_int', 'top_mainpl=
l_d4_d4', 'top_mux_aud_1', 'top_apll1_ck', 'top_mux_aud_2', 'top_apll2_ck',=
 'top_mux_aud_eng1', 'top_apll1_d4', 'top_mux_aud_eng2', 'top_apll2_d4', 't=
op_i2s0_m_sel', 'top_i2s1_m_sel', 'top_i2s2_m_sel', 'top_i2s3_m_sel', 'top_=
i2s4_m_sel', 'top_i2s5_m_sel', 'top_i2s6_m_sel', 'top_i2s7_m_sel', 'top_i2s=
8_m_sel', 'top_i2s9_m_sel', 'top_apll12_div0', 'top_apll12_div1', 'top_apll=
12_div2', 'top_apll12_div3', 'top_apll12_div4', 'top_apll12_divb', 'top_apl=
l12_div5', 'top_apll12_div6', 'top_apll12_div7', 'top_apll12_div8', 'top_ap=
ll12_div9', 'top_mux_audio_h', 'top_clk26m_clk'] is too long
--
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: pmic (media=
tek,mt6359): 'mt6359codec', 'mt6359rtc' do not match any of the regexes: '^=
pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: pmic (media=
tek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: syscon@1121=
0000 (mediatek,mt8192-audsys): 'mt8192-afe-pcm' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,au=
dsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: mt8192-afe-=
pcm (mediatek,mt8192-audio): clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: mt8192-afe-=
pcm (mediatek,mt8192-audio): clock-names:4: 'aud_infra_26m_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: mt8192-afe-=
pcm (mediatek,mt8192-audio): clock-names: ['aud_afe_clk', 'aud_dac_clk', 'a=
ud_dac_predis_clk', 'aud_adc_clk', 'aud_adda6_adc_clk', 'aud_apll22m_clk', =
'aud_apll24m_clk', 'aud_apll1_tuner_clk', 'aud_apll2_tuner_clk', 'aud_tdm_c=
lk', 'aud_tml_clk', 'aud_nle', 'aud_dac_hires_clk', 'aud_adc_hires_clk', 'a=
ud_adc_hires_tml', 'aud_adda6_adc_hires_clk', 'aud_3rd_dac_clk', 'aud_3rd_d=
ac_predis_clk', 'aud_3rd_dac_tml', 'aud_3rd_dac_hires_clk', 'aud_infra_clk'=
, 'aud_infra_26m_clk', 'top_mux_audio', 'top_mux_audio_int', 'top_mainpll_d=
4_d4', 'top_mux_aud_1', 'top_apll1_ck', 'top_mux_aud_2', 'top_apll2_ck', 't=
op_mux_aud_eng1', 'top_apll1_d4', 'top_mux_aud_eng2', 'top_apll2_d4', 'top_=
i2s0_m_sel', 'top_i2s1_m_sel', 'top_i2s2_m_sel', 'top_i2s3_m_sel', 'top_i2s=
4_m_sel', 'top_i2s5_m_sel', 'top_i2s6_m_sel', 'top_i2s7_m_sel', 'top_i2s8_m=
_sel', 'top_i2s9_m_sel', 'top_apll12_div0', 'top_apll12_div1', 'top_apll12_=
div2', 'top_apll12_div3', 'top_apll12_div4', 'top_apll12_divb', 'top_apll12=
_div5', 'top_apll12_div6', 'top_apll12_div7', 'top_apll12_div8', 'top_apll1=
2_div9', 'top_mux_audio_h', 'top_clk26m_clk'] is too long
--
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: pmic (media=
tek,mt6359): 'mt6359codec', 'mt6359rtc' do not match any of the regexes: '^=
pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: pmic (media=
tek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: syscon@1121=
0000 (mediatek,mt8192-audsys): 'mt8192-afe-pcm' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,au=
dsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: mt8192-afe-=
pcm (mediatek,mt8192-audio): clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: mt8192-afe-=
pcm (mediatek,mt8192-audio): clock-names:4: 'aud_infra_26m_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: mt8192-afe-=
pcm (mediatek,mt8192-audio): clock-names: ['aud_afe_clk', 'aud_dac_clk', 'a=
ud_dac_predis_clk', 'aud_adc_clk', 'aud_adda6_adc_clk', 'aud_apll22m_clk', =
'aud_apll24m_clk', 'aud_apll1_tuner_clk', 'aud_apll2_tuner_clk', 'aud_tdm_c=
lk', 'aud_tml_clk', 'aud_nle', 'aud_dac_hires_clk', 'aud_adc_hires_clk', 'a=
ud_adc_hires_tml', 'aud_adda6_adc_hires_clk', 'aud_3rd_dac_clk', 'aud_3rd_d=
ac_predis_clk', 'aud_3rd_dac_tml', 'aud_3rd_dac_hires_clk', 'aud_infra_clk'=
, 'aud_infra_26m_clk', 'top_mux_audio', 'top_mux_audio_int', 'top_mainpll_d=
4_d4', 'top_mux_aud_1', 'top_apll1_ck', 'top_mux_aud_2', 'top_apll2_ck', 't=
op_mux_aud_eng1', 'top_apll1_d4', 'top_mux_aud_eng2', 'top_apll2_d4', 'top_=
i2s0_m_sel', 'top_i2s1_m_sel', 'top_i2s2_m_sel', 'top_i2s3_m_sel', 'top_i2s=
4_m_sel', 'top_i2s5_m_sel', 'top_i2s6_m_sel', 'top_i2s7_m_sel', 'top_i2s8_m=
_sel', 'top_i2s9_m_sel', 'top_apll12_div0', 'top_apll12_div1', 'top_apll12_=
div2', 'top_apll12_div3', 'top_apll12_div4', 'top_apll12_divb', 'top_apll12=
_div5', 'top_apll12_div6', 'top_apll12_div7', 'top_apll12_div8', 'top_apll1=
2_div9', 'top_mux_audio_h', 'top_clk26m_clk'] is too long
--
>> arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: pmic (mediatek,mt6359): 'mt=
6359codec', 'mt6359rtc' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: pmic (mediatek,mt6359): reg=
ulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: syscon@11210000 (mediatek,m=
t8192-audsys): 'mt8192-afe-pcm' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,au=
dsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: mt8192-afe-pcm (mediatek,mt=
8192-audio): clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: mt8192-afe-pcm (mediatek,mt=
8192-audio): clock-names:4: 'aud_infra_26m_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: mt8192-afe-pcm (mediatek,mt=
8192-audio): clock-names: ['aud_afe_clk', 'aud_dac_clk', 'aud_dac_predis_cl=
k', 'aud_adc_clk', 'aud_adda6_adc_clk', 'aud_apll22m_clk', 'aud_apll24m_clk=
', 'aud_apll1_tuner_clk', 'aud_apll2_tuner_clk', 'aud_tdm_clk', 'aud_tml_cl=
k', 'aud_nle', 'aud_dac_hires_clk', 'aud_adc_hires_clk', 'aud_adc_hires_tml=
', 'aud_adda6_adc_hires_clk', 'aud_3rd_dac_clk', 'aud_3rd_dac_predis_clk', =
'aud_3rd_dac_tml', 'aud_3rd_dac_hires_clk', 'aud_infra_clk', 'aud_infra_26m=
_clk', 'top_mux_audio', 'top_mux_audio_int', 'top_mainpll_d4_d4', 'top_mux_=
aud_1', 'top_apll1_ck', 'top_mux_aud_2', 'top_apll2_ck', 'top_mux_aud_eng1'=
, 'top_apll1_d4', 'top_mux_aud_eng2', 'top_apll2_d4', 'top_i2s0_m_sel', 'to=
p_i2s1_m_sel', 'top_i2s2_m_sel', 'top_i2s3_m_sel', 'top_i2s4_m_sel', 'top_i=
2s5_m_sel', 'top_i2s6_m_sel', 'top_i2s7_m_sel', 'top_i2s8_m_sel', 'top_i2s9=
_m_sel', 'top_apll12_div0', 'top_apll12_div1', 'top_apll12_div2', 'top_apll=
12_div3', 'top_apll12_div4', 'top_apll12_divb', 'top_apll12_div5', 'top_apl=
l12_div6', 'top_apll12_div7', 'top_apll12_div8', 'top_apll12_div9', 'top_mu=
x_audio_h', 'top_clk26m_clk'] is too long
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: syscon@1000100=
0 (mediatek,mt8195-infracfg_ao): compatible: ['mediatek,mt8195-infracfg_ao'=
, 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sy=
s-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic (mediatek=
,mt6359): 'mt6359codec', 'mt6359rtc' do not match any of the regexes: '^pin=
ctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic (mediatek=
,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: infra-iommu@10=
315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796,=
 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic@34 (media=
tek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/i2c@11e02=
000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i=
']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: t-phy@11e30000=
 (mediatek,mt8195-tphy): 'power-domains' does not match any of the regexes:=
 '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: syscon@1000100=
0 (mediatek,mt8195-infracfg_ao): compatible: ['mediatek,mt8195-infracfg_ao'=
, 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sy=
s-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic (mediatek=
,mt6359): 'mt6359codec', 'mt6359rtc' do not match any of the regexes: '^pin=
ctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic (mediatek=
,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: infra-iommu@10=
315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796,=
 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic@34 (media=
tek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/i2c@11e02=
000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i=
']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: t-phy@11e30000=
 (mediatek,mt8195-tphy): 'power-domains' does not match any of the regexes:=
 '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: syscon@10006000 (=
mediatek,mt8188-scpsys): power-controller:power-domain@15:power-domain@16:p=
ower-domain@29:power-domain@30: Unevaluated properties are not allowed ('po=
wer-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scps=
ys.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: power-controller =
(mediatek,mt8188-power-controller): power-domain@15:power-domain@16:power-d=
omain@29:power-domain@30: Unevaluated properties are not allowed ('power-do=
main@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-con=
troller.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic (mediatek,mt=
6359): 'mt6359codec', 'mt6359rtc' do not match any of the regexes: '^pinctr=
l-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic (mediatek,mt=
6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10320000 =
(mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10330000 =
(mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@=
14000000 (mediatek,mt8188-vppsys0): $nodename:0: 'clock-controller@14000000=
' does not match '^syscon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mm=
sys.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@=
14000000 (mediatek,mt8188-vppsys0): compatible: 'oneOf' conditional failed,=
 one must be fixed:
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: syscon@10=
001000 (mediatek,mt8195-infracfg_ao): compatible: ['mediatek,mt8195-infracf=
g_ao', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sy=
s-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: pmic (med=
iatek,mt6359): 'mt6359codec', 'mt6359rtc' do not match any of the regexes: =
'^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: pmic (med=
iatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: infra-iom=
mu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0,=
 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: regulator=
 (mediatek,mt6360-regulator): 'BUCK1', 'BUCK2', 'LDO1', 'LDO2', 'LDO3', 'LD=
O5', 'LDO6', 'LDO7' do not match any of the regexes: '^buck[12]$', '^ldo[12=
3567]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6360-regulat=
or.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: t-phy@11e=
30000 (mediatek,mt8195-tphy): 'power-domains' does not match any of the reg=
exes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: display@1=
4f06000 (mediatek,mt8195-mdp3-split): clocks: [[30, 14], [30, 43], [30, 44]=
] is too long
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: syscon@10001000 (=
mediatek,mt8195-infracfg_ao): compatible: ['mediatek,mt8195-infracfg_ao', '=
syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sy=
s-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic (mediatek,mt=
6359): 'mt6359codec', 'mt6359rtc' do not match any of the regexes: '^pinctr=
l-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic (mediatek,mt=
6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: infra-iommu@10315=
000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4,=
 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: t-phy@11e30000 (m=
ediatek,mt8195-tphy): 'power-domains' does not match any of the regexes: '^=
(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: display@14f06000 =
(mediatek,mt8195-mdp3-split): clocks: [[34, 14], [34, 43], [34, 44]] is too=
 long
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,split.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: mutex@1c101000 (m=
ediatek,mt8195-disp-mutex): 'clock-names', 'reg-names' do not match any of =
the regexes: '^pinctrl-[0-9]+$'

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
