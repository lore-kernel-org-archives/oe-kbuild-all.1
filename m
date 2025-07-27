Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65CF199931
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Jul 2025 22:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753655388; cv=none; b=sz/U/bnjy1aAWaF8V+HhwfKR+cQFoIKcVGlh47YhP6foVI2x4rvZbouDgdjOK6eAOmQ5xB78I0zov2oQVrqU01qudTdjmHoT4wTFy3IURFoSoJrlzX4MLNpKyz0kqS+szNigBm8PtGf3Ske5TeEU6R7d/LUoSVRZGNCjUfIg3w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753655388; c=relaxed/simple;
	bh=TfC17BbnB5iHMEtQTTsjnK1Il8+DWB4Q2MFStKJacTc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S1/o2VSToxduQ2TyWT9F3QNl/lDD5beBr0nQLGiIYkxRDlaL285wfXAZbyJ103U/gpE6Z0Z8IO8Cm6e9QYdNSSnp/XKqUJ3pMqly9c77wHlNy8cSTZzIztGWuRwbtP9UttDR2uJN/y89Hm1b8rQM8CxqMynNoShYHEN/4QtjZts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fXE9Btwh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fXE9Btwh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753655386; x=1785191386;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TfC17BbnB5iHMEtQTTsjnK1Il8+DWB4Q2MFStKJacTc=;
  b=fXE9BtwhpRRGAB0uZwo3ZnJb4eo0S3IHInZfXSLIfkZ5/wI8VPujIKWo
   g+TY3JRUmIttpJwIGsU0X+baTOeIkIfe70zBz3FejNgF1ub53m8w+MxUT
   cMrokwYQKTj7TGeSfv2Qv8NZ9v2SU2f1YBoBHTdV9axdKEOYJswhtHd9o
   nyNYYvp0ZTqqedXCGmNhkepEEiFtOPZN447rqs3Q/dPzTxlX12DM3rMgM
   p/T8cp0IQqdOwA1IlMYp9avB2lPrHA3bcDuNFeIaQUdzHcFlDKEGGc+j8
   aFkMNdHlfmHVLxMbWgmkMGWeDMR/WZHFsAC0qZFu04DGwk8XnVQAs1FC2
   A==;
X-CSE-ConnectionGUID: h0pGqG5JQfG5yds9pzw1aA==
X-CSE-MsgGUID: hWwvrUGmSBCDMbCdJhHcrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="66981657"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="66981657"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 15:29:45 -0700
X-CSE-ConnectionGUID: yP2tl4LMTUyXZ2RfJsZ2gw==
X-CSE-MsgGUID: gYqrTHlBTlyQAkbOStQ70A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162712101"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jul 2025 15:29:43 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ug9sD-00004B-0J;
	Sun, 27 Jul 2025 22:29:41 +0000
Date: Mon, 28 Jul 2025 06:28:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 427/427]
 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb:
 /soc/pwrap@10026000/pmic/rtc: failed to match any schema with compatible:
 ['mediatek,mt6358-rtc']
Message-ID: <202507280622.hcEnaEas-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   68af9937285b9223a767cb84a6436b93447b1764
commit: 2aa2c3b0d04d06b82a5c0795f007d1561df395df [427/427] arm64: dts: mt63=
59: Rename RTC node to match binding expectations
config: arm64-randconfig-053-20250726 (https://download.01.org/0day-ci/arch=
ive/20250728/202507280622.hcEnaEas-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250728/202507280622.hcEnaEas-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507280622.hcEnaEas-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: l3-cache (cac=
he): 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: l3-cache (cac=
he): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: /soc/watchdog=
@10007000: failed to match any schema with compatible: ['mediatek,mt8192-wd=
t']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: /soc/timer@10=
017000: failed to match any schema with compatible: ['mediatek,mt8192-timer=
', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: /soc/timer@10=
017000: failed to match any schema with compatible: ['mediatek,mt8192-timer=
', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: /soc/pwrap@10=
026000: failed to match any schema with compatible: ['mediatek,mt6873-pwrap=
']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: /soc/pwrap@10=
026000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: /soc/pwrap@10=
026000/pmic/regulators: failed to match any schema with compatible: ['media=
tek,mt6359-regulator']
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: /soc/pwrap@10=
026000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6=
358-rtc']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: /soc/spi@1101=
9000/cr50@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: /soc/syscon@1=
1210000: failed to match any schema with compatible: ['mediatek,mt8192-auds=
ys', 'syscon']
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
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: mt8192-afe-pc=
m (mediatek,mt8192-audio): clocks: [[51, 0], [51, 7], [51, 8], [51, 6], [51=
, 21], [51, 1], [51, 2], [51, 4], [51, 3], [51, 5], [51, 9], [51, 10], [51,=
 18], [51, 19], [51, 20], [51, 22], [51, 23], [51, 24], [51, 25], [51, 26],=
 [23, 47], [23, 58], [22, 27], [22, 28], [22, 72], [22, 47], [22, 101], [22=
, 48], [22, 105], [22, 43], [22, 103], [22, 44], [22, 107], [22, 59], [22, =
60], [22, 61], [22, 62], [22, 63], [22, 64], [22, 65], [22, 66], [22, 67], =
[22, 68], [22, 142], [22, 143], [22, 144], [22, 145], [22, 146], [22, 147],=
 [22, 148], [22, 149], [22, 150], [22, 151], [22, 152], [22, 55], [2]] is t=
oo long
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
--
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: l3-cache (c=
ache): 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: l3-cache (c=
ache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: /soc/watchd=
og@10007000: failed to match any schema with compatible: ['mediatek,mt8192-=
wdt']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: /soc/timer@=
10017000: failed to match any schema with compatible: ['mediatek,mt8192-tim=
er', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: /soc/timer@=
10017000: failed to match any schema with compatible: ['mediatek,mt8192-tim=
er', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: /soc/pwrap@=
10026000: failed to match any schema with compatible: ['mediatek,mt6873-pwr=
ap']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: /soc/pwrap@=
10026000/pmic: failed to match any schema with compatible: ['mediatek,mt635=
9']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: /soc/pwrap@=
10026000/pmic/regulators: failed to match any schema with compatible: ['med=
iatek,mt6359-regulator']
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: /soc/pwrap@=
10026000/pmic/rtc: failed to match any schema with compatible: ['mediatek,m=
t6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: /soc/spi@11=
019000/cr50@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: /soc/syscon=
@11210000: failed to match any schema with compatible: ['mediatek,mt8192-au=
dsys', 'syscon']
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
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: mt8192-afe-=
pcm (mediatek,mt8192-audio): clocks: [[51, 0], [51, 7], [51, 8], [51, 6], [=
51, 21], [51, 1], [51, 2], [51, 4], [51, 3], [51, 5], [51, 9], [51, 10], [5=
1, 18], [51, 19], [51, 20], [51, 22], [51, 23], [51, 24], [51, 25], [51, 26=
], [23, 47], [23, 58], [22, 27], [22, 28], [22, 72], [22, 47], [22, 101], [=
22, 48], [22, 105], [22, 43], [22, 103], [22, 44], [22, 107], [22, 59], [22=
, 60], [22, 61], [22, 62], [22, 63], [22, 64], [22, 65], [22, 66], [22, 67]=
, [22, 68], [22, 142], [22, 143], [22, 144], [22, 145], [22, 146], [22, 147=
], [22, 148], [22, 149], [22, 150], [22, 151], [22, 152], [22, 55], [2]] is=
 too long
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
--
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: l3-cache (cache): 'cache-le=
vel' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: l3-cache (cache): 'cache-un=
ified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: /soc/watchdog@10007000: fai=
led to match any schema with compatible: ['mediatek,mt8192-wdt']
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: /soc/timer@10017000: failed=
 to match any schema with compatible: ['mediatek,mt8192-timer', 'mediatek,m=
t6765-timer']
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: /soc/timer@10017000: failed=
 to match any schema with compatible: ['mediatek,mt8192-timer', 'mediatek,m=
t6765-timer']
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: /soc/pwrap@10026000: failed=
 to match any schema with compatible: ['mediatek,mt6873-pwrap']
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: /soc/pwrap@10026000/pmic: f=
ailed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: /soc/pwrap@10026000/pmic/re=
gulators: failed to match any schema with compatible: ['mediatek,mt6359-reg=
ulator']
>> arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: /soc/pwrap@10026000/pmic/rt=
c: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: /soc/syscon@11210000: faile=
d to match any schema with compatible: ['mediatek,mt8192-audsys', 'syscon']
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
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: mt8192-afe-pcm (mediatek,mt=
8192-audio): clocks: [[43, 0], [43, 7], [43, 8], [43, 6], [43, 21], [43, 1]=
, [43, 2], [43, 4], [43, 3], [43, 5], [43, 9], [43, 10], [43, 18], [43, 19]=
, [43, 20], [43, 22], [43, 23], [43, 24], [43, 25], [43, 26], [23, 47], [23=
, 58], [22, 27], [22, 28], [22, 72], [22, 47], [22, 101], [22, 48], [22, 10=
5], [22, 43], [22, 103], [22, 44], [22, 107], [22, 59], [22, 60], [22, 61],=
 [22, 62], [22, 63], [22, 64], [22, 65], [22, 66], [22, 67], [22, 68], [22,=
 142], [22, 143], [22, 144], [22, 145], [22, 146], [22, 147], [22, 148], [2=
2, 149], [22, 150], [22, 151], [22, 152], [22, 55], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: mmc@11f60000 (mediatek,mt81=
92-mmc): clock-names:3: 'bus_clk' was expected
--
   	[9, 10, 11, 12] is too long
   	[13, 14, 15, 16] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /dmic-codec: f=
ailed to match any schema with compatible: ['dmic-codec']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/watchdog@=
10007000: failed to match any schema with compatible: ['mediatek,mt8195-wdt=
']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/timer@100=
17000: failed to match any schema with compatible: ['mediatek,mt8195-timer'=
, 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/timer@100=
17000: failed to match any schema with compatible: ['mediatek,mt8195-timer'=
, 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/pwrap@100=
24000: failed to match any schema with compatible: ['mediatek,mt8195-pwrap'=
, 'syscon']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/pwrap@100=
24000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/pwrap@100=
24000/pmic/regulators: failed to match any schema with compatible: ['mediat=
ek,mt6359-regulator']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/pwrap@100=
24000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt63=
58-rtc']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: infra-iommu@10=
315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796,=
 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: ec@0 (google,c=
ros-ec-spi): 'keyboard-backlight' does not match any of the regexes: '^extc=
on[0-9]*$', '^i2c-tunnel[0-9]*$', '^pinctrl-[0-9]+$', '^regulator@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic@34 (media=
tek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/i2c@11e03=
000/tpm@50: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: t-phy@11e30000=
 (mediatek,mt8195-tphy): 'power-domains' does not match any of the regexes:=
 '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: clock-controll=
er@14000000 (mediatek,mt8195-vppsys0): 'mediatek,gce-client-reg' does not m=
atch any of the regexes: '^pinctrl-[0-9]+$'
--
   	[9, 10, 11, 12] is too long
   	[13, 14, 15, 16] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /dmic-codec: f=
ailed to match any schema with compatible: ['dmic-codec']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/watchdog@=
10007000: failed to match any schema with compatible: ['mediatek,mt8195-wdt=
']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/timer@100=
17000: failed to match any schema with compatible: ['mediatek,mt8195-timer'=
, 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/timer@100=
17000: failed to match any schema with compatible: ['mediatek,mt8195-timer'=
, 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/pwrap@100=
24000: failed to match any schema with compatible: ['mediatek,mt8195-pwrap'=
, 'syscon']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/pwrap@100=
24000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/pwrap@100=
24000/pmic/regulators: failed to match any schema with compatible: ['mediat=
ek,mt6359-regulator']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/pwrap@100=
24000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt63=
58-rtc']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: infra-iommu@10=
315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796,=
 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: ec@0 (google,c=
ros-ec-spi): 'keyboard-backlight' does not match any of the regexes: '^extc=
on[0-9]*$', '^i2c-tunnel[0-9]*$', '^pinctrl-[0-9]+$', '^regulator@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic@34 (media=
tek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/i2c@11e03=
000/tpm@50: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: t-phy@11e30000=
 (mediatek,mt8195-tphy): 'power-domains' does not match any of the regexes:=
 '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: clock-controll=
er@14000000 (mediatek,mt8195-vppsys0): 'mediatek,gce-client-reg' does not m=
atch any of the regexes: '^pinctrl-[0-9]+$'
--
   	[9, 10, 11, 12] is too long
   	[13, 14, 15, 16] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /dmic-codec: f=
ailed to match any schema with compatible: ['dmic-codec']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /soc/watchdog@=
10007000: failed to match any schema with compatible: ['mediatek,mt8195-wdt=
']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /soc/timer@100=
17000: failed to match any schema with compatible: ['mediatek,mt8195-timer'=
, 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /soc/timer@100=
17000: failed to match any schema with compatible: ['mediatek,mt8195-timer'=
, 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /soc/pwrap@100=
24000: failed to match any schema with compatible: ['mediatek,mt8195-pwrap'=
, 'syscon']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /soc/pwrap@100=
24000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /soc/pwrap@100=
24000/pmic/regulators: failed to match any schema with compatible: ['mediat=
ek,mt6359-regulator']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /soc/pwrap@100=
24000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt63=
58-rtc']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: infra-iommu@10=
315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796,=
 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: ec@0 (google,c=
ros-ec-spi): 'keyboard-backlight' does not match any of the regexes: '^extc=
on[0-9]*$', '^i2c-tunnel[0-9]*$', '^pinctrl-[0-9]+$', '^regulator@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic@34 (media=
tek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /soc/i2c@11e03=
000/tpm@50: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: t-phy@11e30000=
 (mediatek,mt8195-tphy): 'power-domains' does not match any of the regexes:=
 '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: clock-controll=
er@14000000 (mediatek,mt8195-vppsys0): 'mediatek,gce-client-reg' does not m=
atch any of the regexes: '^pinctrl-[0-9]+$'
--
   	[9, 10, 11, 12] is too long
   	[13, 14, 15, 16] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /dmic-codec: failed to mat=
ch any schema with compatible: ['dmic-codec']
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /soc/watchdog@10007000: fa=
iled to match any schema with compatible: ['mediatek,mt8195-wdt']
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /soc/timer@10017000: faile=
d to match any schema with compatible: ['mediatek,mt8195-timer', 'mediatek,=
mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /soc/timer@10017000: faile=
d to match any schema with compatible: ['mediatek,mt8195-timer', 'mediatek,=
mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /soc/pwrap@10024000: faile=
d to match any schema with compatible: ['mediatek,mt8195-pwrap', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /soc/pwrap@10024000/pmic: =
failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /soc/pwrap@10024000/pmic/r=
egulators: failed to match any schema with compatible: ['mediatek,mt6359-re=
gulator']
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /soc/pwrap@10024000/pmic/r=
tc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: infra-iommu@10315000 (medi=
atek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, =
797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: t-phy@11e30000 (mediatek,m=
t8195-tphy): 'power-domains' does not match any of the regexes: '^(usb|pcie=
|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: clock-controller@14000000 =
(mediatek,mt8195-vppsys0): 'mediatek,gce-client-reg' does not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt=
8195-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: clock-controller@14f00000 =
(mediatek,mt8195-vppsys1): 'mediatek,gce-client-reg' does not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt=
8195-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: syscon@1c01a000 (mediatek,=
mt8195-vdosys0): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8195-vdosys0', 'mediatek,mt8195-mmsys', 'syscon'] is too l=
ong

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
