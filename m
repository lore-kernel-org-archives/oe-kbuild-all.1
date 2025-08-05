Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA24C4086A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Aug 2025 01:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754355957; cv=none; b=fQyIjqvwnre67tQOO+VzDrqmRtguRZl+l9qSYTjAI8TGCpYSScxbKCPGtXYPXLiCAIvXZkCDTAyipluxQjblTRCsTXZoWGH6t8B3Ein/AK5AtHfYQTORVMM69XQqJOm0xnMf5iVz41wTjZ76gaL7n3jMynh22U6IZ7CKrNpGojs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754355957; c=relaxed/simple;
	bh=rwjtiZjUbFHwn56Zx5fIHPxucElBlTkCuEBXbHC/8HA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VXU9K1b7nAc+wUG6/RvBIE3wRxBB6oJTKq5N7FoZO2AmUdLUcxqAsQQjWJGQgL8ISQPcXObMlXw+4mwh4QmRD+fbbHZiyA/BxAhrrzxEE/SxCmfVV4ZBd9Ojxx29bnXBab0vIzAKPHhyfAIIWV0gG78PTr7yvj7Ktd1kyo2Xtto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LpfVcvjQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LpfVcvjQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754355955; x=1785891955;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rwjtiZjUbFHwn56Zx5fIHPxucElBlTkCuEBXbHC/8HA=;
  b=LpfVcvjQjnbOPuERSgrLcq+qS7Pb/9VQ5RzQpWIj9Mckeuju3qaeQB8V
   d1VKT5sNb5pmvEAh8ZKitbRQHSZdABHIp1OBS2L/fX1RZHpl6CvuFeBqS
   VU/Ff+V6CPoOYzAYL3l+93rszISVDNBlYaT4ytNNmoGYkELjedkSYKDN3
   NRXnKKjoIgV2YU5G2nTjyp6NgeLtj1SocKDVVUD1vyfyPtfRVi78sSgp+
   CIFY4O8fm11guokPs9X/9EFF6VTsUNcN9nQf7sYBP/xUJsd10W6d3vMMS
   Jrg16suzic+V0+k+5JX9D5l5G4V9IlhF8vhHQutEKwXhXAOgqWgcO4ZK+
   w==;
X-CSE-ConnectionGUID: ijlmMFs7R1qXlmb9upZhpg==
X-CSE-MsgGUID: MA60c1qBT2K51mA/n8+1BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56552045"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="56552045"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 18:05:54 -0700
X-CSE-ConnectionGUID: PiamGvkCT/yhiuazsHgLkQ==
X-CSE-MsgGUID: IKaRxKlzRUaOEIhCzk/epQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="164748991"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 04 Aug 2025 18:05:52 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uj67h-0001tT-2f;
	Tue, 05 Aug 2025 01:05:49 +0000
Date: Tue, 5 Aug 2025 03:04:52 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb:
 /soc/pwrap@10026000/pmic/regulators: failed to match any schema with
 compatible: ['mediatek,mt6359-regulator']
Message-ID: <202508050337.Y5n3CzM4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   c1a4113af4ffd59599729ba53e1fdc4b44429bc7
commit: 6145c491d649f93d7f01996c57ad56b10492e0ca [1/1] arm64: dts: mt6359: =
Add missing 'compatible' property to regulators node
config: arm64-randconfig-2051-20250803 (https://download.01.org/0day-ci/arc=
hive/20250805/202508050337.Y5n3CzM4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250805/202508050337.Y5n3CzM4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508050337.Y5n3CzM4-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: /soc/timer@10=
017000: failed to match any schema with compatible: ['mediatek,mt8192-timer=
', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: /soc/timer@10=
017000: failed to match any schema with compatible: ['mediatek,mt8192-timer=
', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: /soc/pwrap@10=
026000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: /soc/pwrap@10=
026000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt6=
359-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: /soc/pwrap@10=
026000/pmic/regulators: failed to match any schema with compatible: ['media=
tek,mt6359-regulator']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: /soc/pwrap@10=
026000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediat=
ek,mt6358-rtc']
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
m (mediatek,mt8192-audio): clocks: [[57, 0], [57, 7], [57, 8], [57, 6], [57=
, 21], [57, 1], [57, 2], [57, 4], [57, 3], [57, 5], [57, 9], [57, 10], [57,=
 18], [57, 19], [57, 20], [57, 22], [57, 23], [57, 24], [57, 25], [57, 26],=
 [23, 47], [23, 58], [22, 27], [22, 28], [22, 72], [22, 47], [22, 101], [22=
, 48], [22, 105], [22, 43], [22, 103], [22, 44], [22, 107], [22, 59], [22, =
60], [22, 61], [22, 62], [22, 63], [22, 64], [22, 65], [22, 66], [22, 67], =
[22, 68], [22, 142], [22, 143], [22, 144], [22, 145], [22, 146], [22, 147],=
 [22, 148], [22, 149], [22, 150], [22, 151], [22, 152], [22, 55], [2]] is t=
oo long
--
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: /soc/timer@=
10017000: failed to match any schema with compatible: ['mediatek,mt8192-tim=
er', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: /soc/timer@=
10017000: failed to match any schema with compatible: ['mediatek,mt8192-tim=
er', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: /soc/pwrap@=
10026000/pmic: failed to match any schema with compatible: ['mediatek,mt635=
9']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: /soc/pwrap@=
10026000/pmic/adc: failed to match any schema with compatible: ['mediatek,m=
t6359-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: /soc/pwrap@=
10026000/pmic/regulators: failed to match any schema with compatible: ['med=
iatek,mt6359-regulator']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: /soc/pwrap@=
10026000/pmic/mt6359rtc: failed to match any schema with compatible: ['medi=
atek,mt6358-rtc']
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
pcm (mediatek,mt8192-audio): clocks: [[54, 0], [54, 7], [54, 8], [54, 6], [=
54, 21], [54, 1], [54, 2], [54, 4], [54, 3], [54, 5], [54, 9], [54, 10], [5=
4, 18], [54, 19], [54, 20], [54, 22], [54, 23], [54, 24], [54, 25], [54, 26=
], [23, 47], [23, 58], [22, 27], [22, 28], [22, 72], [22, 47], [22, 101], [=
22, 48], [22, 105], [22, 43], [22, 103], [22, 44], [22, 107], [22, 59], [22=
, 60], [22, 61], [22, 62], [22, 63], [22, 64], [22, 65], [22, 66], [22, 67]=
, [22, 68], [22, 142], [22, 143], [22, 144], [22, 145], [22, 146], [22, 147=
], [22, 148], [22, 149], [22, 150], [22, 151], [22, 152], [22, 55], [2]] is=
 too long
--
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: /soc/timer@10017000: failed=
 to match any schema with compatible: ['mediatek,mt8192-timer', 'mediatek,m=
t6765-timer']
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: /soc/timer@10017000: failed=
 to match any schema with compatible: ['mediatek,mt8192-timer', 'mediatek,m=
t6765-timer']
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: /soc/pwrap@10026000/pmic: f=
ailed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: /soc/pwrap@10026000/pmic/ad=
c: failed to match any schema with compatible: ['mediatek,mt6359-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: /soc/pwrap@10026000/pmic/re=
gulators: failed to match any schema with compatible: ['mediatek,mt6359-reg=
ulator']
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: /soc/pwrap@10026000/pmic/mt=
6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
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
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:2559.17-2616.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:2633.17-2669.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/timer@100=
17000: failed to match any schema with compatible: ['mediatek,mt8195-timer'=
, 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/timer@100=
17000: failed to match any schema with compatible: ['mediatek,mt8195-timer'=
, 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/pwrap@100=
24000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/pwrap@100=
24000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt63=
59-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/pwrap@100=
24000/pmic/regulators: failed to match any schema with compatible: ['mediat=
ek,mt6359-regulator']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/pwrap@100=
24000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediate=
k,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: infra-iommu@10=
315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796,=
 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: ec@0 (google,c=
ros-ec-spi): 'keyboard-backlight' does not match any of the regexes: '^extc=
on[0-9]*$', '^i2c-tunnel[0-9]*$', '^pinctrl-[0-9]+$', '^regulator@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pwm@1100e000 (=
mediatek,mt8195-disp-pwm): 'power-domains' does not match any of the regexe=
s: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: ethernet@11021=
000 (mediatek,mt8195-gmac): tx-queues-config:queue0:snps,priority: [0] is n=
ot of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: ethernet@11021=
000 (mediatek,mt8195-gmac): tx-queues-config:queue1:snps,priority: [1] is n=
ot of type 'integer'
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:2559.17-2616.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:2633.17-2669.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/timer@100=
17000: failed to match any schema with compatible: ['mediatek,mt8195-timer'=
, 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/timer@100=
17000: failed to match any schema with compatible: ['mediatek,mt8195-timer'=
, 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/pwrap@100=
24000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/pwrap@100=
24000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt63=
59-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/pwrap@100=
24000/pmic/regulators: failed to match any schema with compatible: ['mediat=
ek,mt6359-regulator']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/pwrap@100=
24000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediate=
k,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: infra-iommu@10=
315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796,=
 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: ec@0 (google,c=
ros-ec-spi): 'keyboard-backlight' does not match any of the regexes: '^extc=
on[0-9]*$', '^i2c-tunnel[0-9]*$', '^pinctrl-[0-9]+$', '^regulator@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pwm@1100e000 (=
mediatek,mt8195-disp-pwm): 'power-domains' does not match any of the regexe=
s: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: ethernet@11021=
000 (mediatek,mt8195-gmac): tx-queues-config:queue0:snps,priority: [0] is n=
ot of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: ethernet@11021=
000 (mediatek,mt8195-gmac): tx-queues-config:queue1:snps,priority: [1] is n=
ot of type 'integer'
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:2559.17-2616.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:2633.17-2669.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /soc/timer@100=
17000: failed to match any schema with compatible: ['mediatek,mt8195-timer'=
, 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /soc/timer@100=
17000: failed to match any schema with compatible: ['mediatek,mt8195-timer'=
, 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /soc/pwrap@100=
24000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /soc/pwrap@100=
24000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt63=
59-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /soc/pwrap@100=
24000/pmic/regulators: failed to match any schema with compatible: ['mediat=
ek,mt6359-regulator']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: /soc/pwrap@100=
24000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediate=
k,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: infra-iommu@10=
315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796,=
 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: ec@0 (google,c=
ros-ec-spi): 'keyboard-backlight' does not match any of the regexes: '^extc=
on[0-9]*$', '^i2c-tunnel[0-9]*$', '^pinctrl-[0-9]+$', '^regulator@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pwm@1100e000 (=
mediatek,mt8195-disp-pwm): 'power-domains' does not match any of the regexe=
s: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: ethernet@11021=
000 (mediatek,mt8195-gmac): tx-queues-config:queue0:snps,priority: [0] is n=
ot of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: ethernet@11021=
000 (mediatek,mt8195-gmac): tx-queues-config:queue1:snps,priority: [1] is n=
ot of type 'integer'
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:2559.17-2616.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:2633.17-2669.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /soc/timer@10017000: faile=
d to match any schema with compatible: ['mediatek,mt8195-timer', 'mediatek,=
mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /soc/timer@10017000: faile=
d to match any schema with compatible: ['mediatek,mt8195-timer', 'mediatek,=
mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /soc/pwrap@10024000/pmic: =
failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /soc/pwrap@10024000/pmic/a=
dc: failed to match any schema with compatible: ['mediatek,mt6359-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /soc/pwrap@10024000/pmic/r=
egulators: failed to match any schema with compatible: ['mediatek,mt6359-re=
gulator']
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: /soc/pwrap@10024000/pmic/m=
t6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc=
']
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: infra-iommu@10315000 (medi=
atek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, =
797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: pwm@1100e000 (mediatek,mt8=
195-disp-pwm): 'power-domains' does not match any of the regexes: '^pinctrl=
-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: ethernet@11021000 (mediate=
k,mt8195-gmac): tx-queues-config:queue0:snps,priority: [0] is not of type '=
integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: ethernet@11021000 (mediate=
k,mt8195-gmac): tx-queues-config:queue1:snps,priority: [1] is not of type '=
integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: ethernet@11021000 (mediate=
k,mt8195-gmac): tx-queues-config:queue2:snps,priority: [2] is not of type '=
integer'

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
