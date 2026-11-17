Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794887558;
	b=y3sSDLSwEWaDs2r139wYMAbistOZJ1j7D4jyVkCAa6bbGK9wAaBKgoJLg5/4NnYJ+IIE
	 mptig/cLvqftNl9Q8gjpwF8neVz87OSg+N3KlFeft3Kv3Ju3HK571u/+hCFFsdeu2XgRH
	 BH/a4mGjQDtEgI6LKVNReKPZYZ1WzDKEb4r974WMkO0rArf9u8JEWf0w/GGrkX0grFaTE
	 Oix+7jWE86iXqkQUXFZ/AIE8R105cRMTuaUciE9jVOVJfYDOn8BJilbu+zqCeyrGRCm5e
	 lFJOCztwPoiPHCOSjfXSMX9UaYIBkCSUU4ewZuDTozmyBJ/lmF3jKkmpDMS+dJLilDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794887558;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=nzy7jUdQcz1G8gedQc8K7D/Ws34zUajqk1fn5JLgCvQ=;
	b=p0ZYx0ZmVIw4Qb5Asd09xtKFGm0BR3O1kMixatBUmCMpXjrVELrS8HiykPFZ2/aq6W8k
	 qFsZv08BzUCmjNkXxmeInRUFHwImT13ScauvxHc7Zd7D9XtdUsu4cV06ya4YcnXyJ1Jnb
	 /BvYw1WK5xf3ZEEbT2tH8EPZK7+oM5EDnYNnmJm8iUBeU/oseCGunTh5d6MRGGCvE46j0
	 pe0ywOPcyayUN/c9eDxAZ5qV1XaOeAnCK5t4FVjXHkaabAYiepogwQIZx1YiNYm2Q8beS
	 vvXn2/XlcWJxvyYiiPYgVcW96SSfwtQy6/GPb413oZFj1OUyhZeYVJ3mAIPXMNSvsBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jEqHX+UI;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1818606A31C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 03:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1818606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jEqHX+UI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794887556; x=1826423556;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WkvMRrgMpMj+SiT3FwfVX914bjN/iMjsetWYAPtf62Y=;
  b=jEqHX+UIHTUVd5UkDPUURz8H4jAxOJNZ4tW14tEH7CKwfEdNfVs6BqY2
   JkMOFFsCHPZcwTlFpJVGdUWGyLHYZnZNvy8oZ6Np8DVuCB6U7igwAfmdZ
   hvUb1qtILDr7QtLABZfvalXqnDpscDXZ/QD/34clLDKHuz88Dd9X5P9p7
   rvlXGI37fIJgUJ4lxfLM8dZ2jjcrbqxc+JdFbDL+pTXzGG6sBTv0ZcsL9
   Kc1LB81HYpeuuCXBIeBvP2hIh3Qu6lFDNx+mKRgq9uRZTlOBHGVP7nFof
   WrrF4PwxTa2JFKgo4SOV4GkxeeXgGUKt0SnULWag8jddH/xRcbxsFXBZu
   w==;
X-CSE-ConnectionGUID: lTTGXyEKSkKXI+PgNylmWw==
X-CSE-MsgGUID: 31KUE9JyRDihnZDSxEi8Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3681144"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3681144"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 19:52:36 -0800
X-CSE-ConnectionGUID: mCv3OCwOThmr0hAt6GMscw==
X-CSE-MsgGUID: PC+YZFEwQnappF3gkJvhJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9644545"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 16 Nov 2026 19:52:32 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTAFB-000000002xO-1NMD;
	Tue, 17 Nov 2026 03:52:29 +0000
Date: Tue, 17 Nov 2026 04:52:18 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 152/152]
 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: pcie@11230000
 (mediatek,mt8192-pcie): Unevaluated properties are not allowed
 ('memory-region' was unexpected)
Message-ID: <202611170435.QvNzKymD-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   c5e3d3a3d3b60eb95c36e3c49dbfe7a34c220c5a
commit: 886ab6a1f52c0b37d44550eeb207fd1aaddfbb22 [152/152] arm64: dts: medi=
atek: mt8192-asurada: Move PCIe DMA bounce buffer to host
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261117=
/202611170435.QvNzKymD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev6+ged91b647c
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261117/202611170435.QvNzKymD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170435.QvNzKymD-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: syscon@1=
1210000 (mediatek,mt8192-audsys): 'mt8192-afe-pcm' does not match any of th=
e regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,au=
dsys.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: mt8192-a=
fe-pcm (mediatek,mt8192-audio): clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: mt8192-a=
fe-pcm (mediatek,mt8192-audio): clock-names:4: 'aud_infra_26m_clk' was expe=
cted
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml
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
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml
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
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: pcie@112=
30000 (mediatek,mt8192-pcie): Unevaluated properties are not allowed ('memo=
ry-region' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: pcie@0,0=
: wifi@0,0:reg:0:4: 0 was expected
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: pcie@0,0=
: wifi@0,0:reg: [[65536, 0, 0, 0, 1048576], [65536, 0, 1048576, 0, 1048576]=
] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: flash@0 =
(winbond,w25q64jwm): compatible: 'oneOf' conditional failed, one must be fi=
xed:
   	['winbond,w25q64jwm', 'jedec,spi-nor'] is too long
   	'winbond,w25q64jwm' does not match '^((((micron|spansion|st),)?(m25p(40=
|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at25df=
(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|=
1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion=
,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|=
040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winb=
ond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'winbond,w25q64jwm' is not one of ['issi,is25lp016d', 'micron,mt25qu02g=
', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s2=
5sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
--
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: syscon@1121=
0000 (mediatek,mt8192-audsys): 'mt8192-afe-pcm' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,au=
dsys.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: mt8192-afe-=
pcm (mediatek,mt8192-audio): clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: mt8192-afe-=
pcm (mediatek,mt8192-audio): clock-names:4: 'aud_infra_26m_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml
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
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml
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
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: pcie@112300=
00 (mediatek,mt8192-pcie): Unevaluated properties are not allowed ('memory-=
region' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: pcie@0,0: w=
ifi@0,0:reg:0:4: 0 was expected
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: pcie@0,0: w=
ifi@0,0:reg: [[65536, 0, 0, 0, 1048576], [65536, 0, 1048576, 0, 1048576]] i=
s too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: flash@0 (wi=
nbond,w25q64jwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['winbond,w25q64jwm', 'jedec,spi-nor'] is too long
   	'winbond,w25q64jwm' does not match '^((((micron|spansion|st),)?(m25p(40=
|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at25df=
(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|=
1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion=
,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|=
040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winb=
ond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'winbond,w25q64jwm' is not one of ['issi,is25lp016d', 'micron,mt25qu02g=
', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s2=
5sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
