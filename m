Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B441242D97
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 09:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754299190; cv=none; b=EDfM/6c6hlR9boVPKqzIzHJ/Y/d00lnOPxNAZrB5gO7ZF58mOSudqbpbN0K0ebKI70tkwC1wHPxLgTBpgbYX6f03JDl9qD5vtisiRCKi194+1/3UQkaGM3LhMYmwOEFBUOP3xBpR/pmWfy3sOxBBs4gU2N2LwkGYDvEAU7bKlLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754299190; c=relaxed/simple;
	bh=V6ybioRO1EN1BefObLKBZwE4akmUV2W9K0azxJ9b3pg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z/8pKaSqJT7RtpEvr+kftL+S/KwSbanP1zIy59zkPzBmG/UWInglh8pIjFN6hs9uDM4iXMdCHw9xMpZLUG8nSqHTkeOPC4Me7k7coIcELh4+y0FdDOslzuWGbuvsEu+NaoS/V6AfbDZSW6CRzy34FEtwVKZPY6+FmtJslpy2c/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Seo+I1ZR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Seo+I1ZR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754299189; x=1785835189;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=V6ybioRO1EN1BefObLKBZwE4akmUV2W9K0azxJ9b3pg=;
  b=Seo+I1ZRfmna+upVPFRFSf66YPMywKv4TVDS9KABKTVe6ewZXJQ5ukSH
   Vj4ofS6doD7mRJi9mIcOOJBcbNH9XLaq5ylcgdgMrzrLymU3GZqMAXPFP
   ETT02HJXuOfoVT6CyiIBt0ZeU8giGlIyUc+t2oBUmPNf5I7IHZ6pN/OMk
   Gm/K7ZInrIaeaEeQkdfM8rEWAC1sOOhZlG6K3jN4X8iwCgIWQic7HYRN8
   rOJAdUWnXxQV0BMK5YlBaC/cxZ1uNXy3JNVmruquchlizFeRJkFlX5oVx
   0xHJZL3raWXh3G0GABw7hZvqCZ4UcNwCHxLImkmGw+6s4JEC/jQ6hgFtU
   g==;
X-CSE-ConnectionGUID: R5F4iKLMR5uvLgs5TXl60Q==
X-CSE-MsgGUID: 5jokiNIEQhufuULotP2Whg==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="59172904"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="59172904"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 02:19:48 -0700
X-CSE-ConnectionGUID: fl/gq1RdRuanaZ6YB4zFRQ==
X-CSE-MsgGUID: qHlX7+MgSxGCDzZA0FSFZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168296664"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Aug 2025 02:19:46 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uirM7-0006vE-3A;
	Mon, 04 Aug 2025 09:19:43 +0000
Date: Mon, 4 Aug 2025 17:18:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/boot/dts/mediatek/mt8188-evb.dtb:
 /soc/pwrap@10024000/pmic/regulators: failed to match any schema with
 compatible: ['mediatek,mt6359-regulator']
Message-ID: <202508041749.rJkpGhRC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   bf0fb8bb181b86adf67dcc60b8269d60814de5a1
commit: 3c8f511a658dc067543286f1e4a56eaa3cffa956 [1/1] arm64: dts: mt6359: =
Add missing 'compatible' property to regulators node
config: arm64-randconfig-051-20250726 (https://download.01.org/0day-ci/arch=
ive/20250804/202508041749.rJkpGhRC-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853=
c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250804/202508041749.rJkpGhRC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508041749.rJkpGhRC-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: syscon@10006000 (mediatek,m=
t8188-scpsys): power-controller:power-domain@15:power-domain@16:power-domai=
n@29:power-domain@30: Unevaluated properties are not allowed ('power-domain=
@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scps=
ys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: power-controller (mediatek,=
mt8188-power-controller): power-domain@15:power-domain@16:power-domain@29:p=
ower-domain@30: Unevaluated properties are not allowed ('power-domain@31', =
'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-con=
troller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/pwrap@10024000/pmic: f=
ailed to match any schema with compatible: ['mediatek,mt6359']
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/pwrap@10024000/pmic/re=
gulators: failed to match any schema with compatible: ['mediatek,mt6359-reg=
ulator']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/pwrap@10024000/pmic/mt=
6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10320000 (mediatek,=
mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10330000 (mediatek,=
mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@14000000 (=
mediatek,mt8188-vppsys0): $nodename:0: 'clock-controller@14000000' does not=
 match '^syscon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mm=
sys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@14000000 (=
mediatek,mt8188-vppsys0): compatible: 'oneOf' conditional failed, one must =
be fixed:
   	['mediatek,mt8188-vppsys0'] is too short
   	'mediatek,mt8195-mmsys' was expected
--
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: /soc/pwr=
ap@10026000/pmic: failed to match any schema with compatible: ['mediatek,mt=
6359']
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: /soc/pwr=
ap@10026000/pmic/regulators: failed to match any schema with compatible: ['=
mediatek,mt6359-regulator']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: /soc/pwr=
ap@10026000/pmic/mt6359rtc: failed to match any schema with compatible: ['m=
ediatek,mt6358-rtc']
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
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: mt8192-a=
fe-pcm (mediatek,mt8192-audio): clocks: [[56, 0], [56, 7], [56, 8], [56, 6]=
, [56, 21], [56, 1], [56, 2], [56, 4], [56, 3], [56, 5], [56, 9], [56, 10],=
 [56, 18], [56, 19], [56, 20], [56, 22], [56, 23], [56, 24], [56, 25], [56,=
 26], [23, 47], [23, 58], [22, 27], [22, 28], [22, 72], [22, 47], [22, 101]=
, [22, 48], [22, 105], [22, 43], [22, 103], [22, 44], [22, 107], [22, 59], =
[22, 60], [22, 61], [22, 62], [22, 63], [22, 64], [22, 65], [22, 66], [22, =
67], [22, 68], [22, 142], [22, 143], [22, 144], [22, 145], [22, 146], [22, =
147], [22, 148], [22, 149], [22, 150], [22, 151], [22, 152], [22, 55], [2]]=
 is too long
--
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: /soc/pwrap@=
10026000/pmic: failed to match any schema with compatible: ['mediatek,mt635=
9']
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: /soc/pwrap@=
10026000/pmic/regulators: failed to match any schema with compatible: ['med=
iatek,mt6359-regulator']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: /soc/pwrap@=
10026000/pmic/mt6359rtc: failed to match any schema with compatible: ['medi=
atek,mt6358-rtc']
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
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: mt8192-afe-=
pcm (mediatek,mt8192-audio): clocks: [[56, 0], [56, 7], [56, 8], [56, 6], [=
56, 21], [56, 1], [56, 2], [56, 4], [56, 3], [56, 5], [56, 9], [56, 10], [5=
6, 18], [56, 19], [56, 20], [56, 22], [56, 23], [56, 24], [56, 25], [56, 26=
], [23, 47], [23, 58], [22, 27], [22, 28], [22, 72], [22, 47], [22, 101], [=
22, 48], [22, 105], [22, 43], [22, 103], [22, 44], [22, 107], [22, 59], [22=
, 60], [22, 61], [22, 62], [22, 63], [22, 64], [22, 65], [22, 66], [22, 67]=
, [22, 68], [22, 142], [22, 143], [22, 144], [22, 145], [22, 146], [22, 147=
], [22, 148], [22, 149], [22, 150], [22, 151], [22, 152], [22, 55], [2]] is=
 too long
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3017.17-3074.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3091.17-3127.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/pwrap@10024=
000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/pwrap@10024=
000/pmic/regulators: failed to match any schema with compatible: ['mediatek=
,mt6359-regulator']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/pwrap@10024=
000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,=
mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: infra-iommu@1031=
5000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4=
, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic@34 (mediate=
k,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a (realte=
k,rt5682s): 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a (realte=
k,rt5682s): 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a (realte=
k,rt5682s): Unevaluated properties are not allowed ('VBAT-supply' was unexp=
ected)
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3017.17-3074.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3091.17-3127.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: /soc/pwrap@10024=
000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: /soc/pwrap@10024=
000/pmic/regulators: failed to match any schema with compatible: ['mediatek=
,mt6359-regulator']
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: /soc/pwrap@10024=
000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,=
mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: infra-iommu@1031=
5000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4=
, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: t-phy@11e30000 (=
mediatek,mt8195-tphy): 'power-domains' does not match any of the regexes: '=
^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: ovl@1c000000 (me=
diatek,mt8195-disp-ovl): compatible: 'oneOf' conditional failed, one must b=
e fixed:
   	['mediatek,mt8195-disp-ovl'] is too short
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt2701-disp-ovl', '=
mediatek,mt8173-disp-ovl', 'mediatek,mt8183-disp-ovl', 'mediatek,mt8192-dis=
p-ovl', 'mediatek,mt8195-mdp3-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt7623-disp-ovl', '=
mediatek,mt2712-disp-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt6795-disp-ovl']
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
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/pwrap@100240=
00/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/pwrap@100240=
00/pmic/regulators: failed to match any schema with compatible: ['mediatek,=
mt6359-regulator']
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/pwrap@100240=
00/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,m=
t6358-rtc']
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
   	['mediatek,mt8188-vppsys0'] is too short
   	'mediatek,mt8195-mmsys' was expected
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3017.17-3074.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3091.17-3127.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: /soc/pwra=
p@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6=
359']
>> arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: /soc/pwra=
p@10024000/pmic/regulators: failed to match any schema with compatible: ['m=
ediatek,mt6359-regulator']
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: /soc/pwra=
p@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['me=
diatek,mt6358-rtc']
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
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: ovl@1c000=
000 (mediatek,mt8195-disp-ovl): compatible: 'oneOf' conditional failed, one=
 must be fixed:
   	['mediatek,mt8195-disp-ovl'] is too short
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt2701-disp-ovl', '=
mediatek,mt8173-disp-ovl', 'mediatek,mt8183-disp-ovl', 'mediatek,mt8192-dis=
p-ovl', 'mediatek,mt8195-mdp3-ovl']
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3017.17-3074.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3091.17-3127.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: /soc/pwrap@100240=
00/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: /soc/pwrap@100240=
00/pmic/regulators: failed to match any schema with compatible: ['mediatek,=
mt6359-regulator']
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: /soc/pwrap@100240=
00/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,m=
t6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: infra-iommu@10315=
000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4,=
 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: t-phy@11e30000 (m=
ediatek,mt8195-tphy): 'power-domains' does not match any of the regexes: '^=
(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: ovl@1c000000 (med=
iatek,mt8195-disp-ovl): compatible: 'oneOf' conditional failed, one must be=
 fixed:
   	['mediatek,mt8195-disp-ovl'] is too short
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt2701-disp-ovl', '=
mediatek,mt8173-disp-ovl', 'mediatek,mt8183-disp-ovl', 'mediatek,mt8192-dis=
p-ovl', 'mediatek,mt8195-mdp3-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt7623-disp-ovl', '=
mediatek,mt2712-disp-ovl']
   	'mediatek,mt8195-disp-ovl' is not one of ['mediatek,mt6795-disp-ovl']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
