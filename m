Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BDB1CCB36
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 20:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730408217; cv=none; b=f1FskpIsHjxrv+mqumE+d2n5/ZqzTUTyGjrQ+I0NNEYRtTz3Zhmwf+JEkqAilJ5sf0FLpQlOM0YH3CBBGIqVwNFU/HGeT0hDiwzHPHCmBdUqivZYopicBAM5mkmALSnTZMUZ4yO/zaaOB1972DOEzZn2ex0HNwuIIxdUKGaWD4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730408217; c=relaxed/simple;
	bh=NovhSRV5yBpQNSUhRXgd9xarY6gAIMOmSmQk3nOBYE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nEjyFOu66ah+RnKfGG0YbIUNy7dWM2wdXi65Xy2IyiUsaHHME6pIQa2p+LmSYbpfZN7E/EJ3OKiUCzPLoCldiO/njWJBONnLWdlSj9+7qAUxqjbeyENxyI/HiAK4ct4xbimPmubRPzD3smaD7JBBKnLNOsVDtAb/3ghjub70YvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nR+n9CGi; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nR+n9CGi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730408209; x=1761944209;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NovhSRV5yBpQNSUhRXgd9xarY6gAIMOmSmQk3nOBYE0=;
  b=nR+n9CGi0wWnh8d7fsBsuSa2EDzFPC3gbPMuma+nbMjRG0TGC2d9Jop2
   bIFSwt/rVxNA21eoOfvRWye4mwEWSwndgPQZztFFtqIm8JDPhUcJUcROy
   uVGqjnlBwRg2oPYUn317a5muyF67chrGgHe7wTl5QLi7G6Zr8I1pxZSOg
   0j3EWsvKczAUe/BpSGeXeP90/Pe5abR1AJc6mhCwclaAI+s4GqKk6HQAJ
   ZXlUj/nyT/CQ4RplVHTjwpDSAKcdM4g8qSVryxNSy0IGIi597wbE019HE
   f6aMBuYPURvuoIh3wJ5DndyYmI4ZetpSg1RlqX0Cu/aZeiSNGJhRWHQJy
   A==;
X-CSE-ConnectionGUID: /7ghG9HZQPC7Aegs7rDKkA==
X-CSE-MsgGUID: nQ0gicQYRS+Q2v+1cVOeOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="55574283"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="55574283"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 13:56:48 -0700
X-CSE-ConnectionGUID: cXQlDYj/SOOua45A5HwOGw==
X-CSE-MsgGUID: MFNwFuZSSmqGe+57nmt4eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="83562896"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 Oct 2024 13:56:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6cDk-000giG-0i;
	Thu, 31 Oct 2024 20:56:44 +0000
Date: Fri, 1 Nov 2024 04:56:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 42/45]
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: sound: Unevaluated
 properties are not allowed ('mediatek,adsp', 'model' were unexpected)
Message-ID: <202411010425.SDtGLNAi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-6.1
head:   a14d4d5c9682d33d7f437002bcd93d2fbdc3533b
commit: 635428164cd0cd5e1e42dd2e0a680da4e7f71572 [42/45] CHROMIUM: arm64: d=
ts: mediatek: mt8188: Remove mediatek,dai-link property
config: arm64-randconfig-051-20241030 (https://download.01.org/0day-ci/arch=
ive/20241101/202411010425.SDtGLNAi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20241101/202411010425.SDtGLNAi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010425.SDtGLNAi-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: opp-table-gpu: compatibl=
e: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: opp-table-gpu: Unevaluat=
ed properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: /opp-table-gpu: failed t=
o match any schema with compatible: ['operating-points-v2', 'operating-poin=
ts-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: sound: False schema does=
 not allow {'mediatek,platform': [[20]], 'status': ['okay'], 'compatible': =
['mediatek,mt8188-nau8825'], 'model': ['mt8188_m98390_8825'], 'pinctrl-name=
s': ['aud_etdm_hp_on', 'aud_etdm_hp_off', 'aud_etdm_spk_on', 'aud_etdm_spk_=
off', 'aud_mtkaif_on', 'aud_mtkaif_off'], 'pinctrl-0': [[21]], 'pinctrl-1':=
 [[22]], 'pinctrl-2': [[23]], 'pinctrl-3': [[24]], 'pinctrl-4': [[25]], 'pi=
nctrl-5': [[26]], 'audio-routing': ['ETDM1_OUT', 'ETDM_SPK_PIN', 'ETDM2_OUT=
', 'ETDM_HP_PIN', 'ETDM1_IN', 'ETDM_SPK_PIN', 'ETDM2_IN', 'ETDM_HP_PIN', 'A=
DDA Capture', 'MTKAIF_PIN', 'Headphone Jack', 'HPOL', 'Headphone Jack', 'HP=
OR', 'MIC', 'Headset Mic', 'Left Spk', 'Front Left BE_OUT', 'Right Spk', 'F=
ront Right BE_OUT', 'Rear Left Spk', 'Rear Left BE_OUT', 'Rear Right Spk', =
'Rear Right BE_OUT'], 'mediatek,adsp': [[27]], 'dai-link-0': {'link-name': =
['ETDM2_OUT_BE'], 'mediatek,clk-provider': ['cpu'], 'codec': {'sound-dai': =
[[28]]}}, 'dai-link-1': {'link-name': ['ETDM2_IN_BE'], 'mediatek,clk-provid=
er': ['cpu'], 'codec': {'sound-dai': [[28]]}}, 'dai-link-2': {'link-name': =
['ETDM1_OUT_BE'], 'dai-format': ['dsp_b'], 'mediatek,clk-provider': ['cpu']=
, 'codec': {'sound-dai': [[29], [30], [31], [32]]}}, 'dai-link-3': {'link-n=
ame': ['ETDM1_IN_BE'], 'dai-format': ['dsp_b'], 'mediatek,clk-provider': ['=
cpu']}, 'dai-link-4': {'link-name': ['DPTX_BE'], 'codec': {'sound-dai': [[3=
3]]}}, '$nodename': ['sound']}
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt=
6359.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: sound: dai-link-2:codec:=
sound-dai: [[29], [30], [31], [32]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt=
6359.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: sound: Unevaluated prope=
rties are not allowed ('mediatek,adsp', 'model' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt=
6359.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: /vtemp: failed to match =
any schema with compatible: ['mediatek,virtual-temp']
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: thermal-zones: 'apu', 'c=
am1', 'cam2', 'cpu_big0', 'cpu_big1', 'cpu_little1', 'cpu_little2', 'cpu_li=
ttle3', 'cpu_little4', 'gpu1', 'gpu2', 'soc1', 'soc2', 'soc3', 'soc_max' do=
 not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'p=
inctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: soc: hcp@0: 'anyOf' cond=
itional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: soc: hcp-l15: 'ranges' i=
s a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /: failed to m=
atch any schema with compatible: ['google,ciri-sku0', 'google,ciri-sku21474=
83409', 'google,ciri', 'mediatek,mt8188']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: idle-states: '=
mcusys-off', 's2idle', 'system-bus', 'system-mem', 'system-pll' do not matc=
h any of the regexes: '^(cpu|cluster)-', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: opp-table-gpu:=
 compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: opp-table-gpu:=
 Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /opp-table-gpu=
: failed to match any schema with compatible: ['operating-points-v2', 'oper=
ating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: sound: False s=
chema does not allow {'mediatek,platform': [[20]], 'status': ['okay'], 'com=
patible': ['mediatek,mt8188-rt5682s'], 'model': ['mt8188_m98390_5682'], 'pi=
nctrl-names': ['aud_etdm_hp_on', 'aud_etdm_hp_off', 'aud_etdm_spk_on', 'aud=
_etdm_spk_off', 'aud_mtkaif_on', 'aud_mtkaif_off'], 'pinctrl-0': [[21]], 'p=
inctrl-1': [[22]], 'pinctrl-2': [[23]], 'pinctrl-3': [[24]], 'pinctrl-4': [=
[25]], 'pinctrl-5': [[26]], 'audio-routing': ['ETDM1_OUT', 'ETDM_SPK_PIN', =
'ETDM2_OUT', 'ETDM_HP_PIN', 'ETDM1_IN', 'ETDM_SPK_PIN', 'ETDM2_IN', 'ETDM_H=
P_PIN', 'ADDA Capture', 'MTKAIF_PIN', 'Headphone Jack', 'HPOL', 'Headphone =
Jack', 'HPOR', 'IN1P', 'Headset Mic', 'Left Spk', 'Front Left BE_OUT', 'Rig=
ht Spk', 'Front Right BE_OUT'], 'mediatek,adsp': [[27]], 'dai-link-0': {'li=
nk-name': ['ETDM2_OUT_BE'], 'mediatek,clk-provider': ['cpu'], 'codec': {'so=
und-dai': [[28]]}}, 'dai-link-1': {'link-name': ['ETDM2_IN_BE'], 'mediatek,=
clk-provider': ['cpu'], 'codec': {'sound-dai': [[28]]}}, 'dai-link-2': {'li=
nk-name': ['ETDM1_OUT_BE'], 'dai-format': ['i2s'], 'mediatek,clk-provider':=
 ['cpu'], 'codec': {'sound-dai': [[29], [30]]}}, 'dai-link-3': {'link-name'=
: ['ETDM1_IN_BE'], 'dai-format': ['i2s'], 'mediatek,clk-provider': ['cpu']}=
, 'dai-link-4': {'link-name': ['DPTX_BE'], 'codec': {'sound-dai': [[31]]}},=
 '$nodename': ['sound']}
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt=
6359.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: sound: Unevalu=
ated properties are not allowed ('mediatek,adsp', 'model' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt=
6359.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /vtemp: failed=
 to match any schema with compatible: ['mediatek,virtual-temp']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: thermal-zones:=
 'apu', 'cam1', 'cam2', 'cpu_big0', 'cpu_big1', 'cpu_little1', 'cpu_little2=
', 'cpu_little3', 'cpu_little4', 'gpu1', 'gpu2', 'soc1', 'soc2', 'soc3', 's=
oc_max' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-the=
rmal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: soc: hcp@0: 'a=
nyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: soc: mtk-apu-m=
em-code: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /: failed to m=
atch any schema with compatible: ['google,ciri-sku1', 'google,ciri-sku21474=
83426', 'google,ciri', 'mediatek,mt8188']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: idle-states: '=
mcusys-off', 's2idle', 'system-bus', 'system-mem', 'system-pll' do not matc=
h any of the regexes: '^(cpu|cluster)-', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: opp-table-gpu:=
 compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: opp-table-gpu:=
 Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /opp-table-gpu=
: failed to match any schema with compatible: ['operating-points-v2', 'oper=
ating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: sound: False s=
chema does not allow {'mediatek,platform': [[20]], 'status': ['okay'], 'com=
patible': ['mediatek,mt8188-es8326'], 'model': ['mt8188_m98390_8326'], 'pin=
ctrl-names': ['aud_etdm_hp_on', 'aud_etdm_hp_off', 'aud_etdm_spk_on', 'aud_=
etdm_spk_off', 'aud_mtkaif_on', 'aud_mtkaif_off'], 'pinctrl-0': [[21]], 'pi=
nctrl-1': [[22]], 'pinctrl-2': [[23]], 'pinctrl-3': [[24]], 'pinctrl-4': [[=
25]], 'pinctrl-5': [[26]], 'audio-routing': ['ETDM1_OUT', 'ETDM_SPK_PIN', '=
ETDM2_OUT', 'ETDM_HP_PIN', 'ETDM1_IN', 'ETDM_SPK_PIN', 'ETDM2_IN', 'ETDM_HP=
_PIN', 'ADDA Capture', 'MTKAIF_PIN', 'Headphone Jack', 'HPOL', 'Headphone J=
ack', 'HPOR', 'MIC1', 'Headset Mic', 'Left Spk', 'Front Left BE_OUT', 'Righ=
t Spk', 'Front Right BE_OUT'], 'mediatek,adsp': [[27]], 'dai-link-0': {'lin=
k-name': ['ETDM2_OUT_BE'], 'mediatek,clk-provider': ['cpu'], 'codec': {'sou=
nd-dai': [[28]]}}, 'dai-link-1': {'link-name': ['ETDM2_IN_BE'], 'mediatek,c=
lk-provider': ['cpu'], 'codec': {'sound-dai': [[28]]}}, 'dai-link-2': {'lin=
k-name': ['ETDM1_OUT_BE'], 'dai-format': ['i2s'], 'mediatek,clk-provider': =
['cpu'], 'codec': {'sound-dai': [[29], [30]]}}, 'dai-link-3': {'link-name':=
 ['ETDM1_IN_BE'], 'dai-format': ['i2s'], 'mediatek,clk-provider': ['cpu']},=
 'dai-link-4': {'link-name': ['DPTX_BE'], 'codec': {'sound-dai': [[31]]}}, =
'$nodename': ['sound']}
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt=
6359.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: sound: Unevalu=
ated properties are not allowed ('mediatek,adsp', 'model' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt=
6359.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /vtemp: failed=
 to match any schema with compatible: ['mediatek,virtual-temp']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: thermal-zones:=
 'apu', 'cam1', 'cam2', 'cpu_big0', 'cpu_big1', 'cpu_little1', 'cpu_little2=
', 'cpu_little3', 'cpu_little4', 'gpu1', 'gpu2', 'soc1', 'soc2', 'soc3', 's=
oc_max' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-the=
rmal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: soc: hcp@0: 'a=
nyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: soc: apusys-hw=
-logger@0x19024000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /: failed to m=
atch any schema with compatible: ['google,ciri-sku2', 'google,ciri', 'media=
tek,mt8188']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: idle-states: '=
mcusys-off', 's2idle', 'system-bus', 'system-mem', 'system-pll' do not matc=
h any of the regexes: '^(cpu|cluster)-', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: opp-table-gpu:=
 compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: opp-table-gpu:=
 Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /opp-table-gpu=
: failed to match any schema with compatible: ['operating-points-v2', 'oper=
ating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: sound: False s=
chema does not allow {'mediatek,platform': [[20]], 'status': ['okay'], 'com=
patible': ['mediatek,mt8188-es8326'], 'model': ['mt8188_m98390_8326'], 'pin=
ctrl-names': ['aud_etdm_hp_on', 'aud_etdm_hp_off', 'aud_etdm_spk_on', 'aud_=
etdm_spk_off', 'aud_mtkaif_on', 'aud_mtkaif_off'], 'pinctrl-0': [[21]], 'pi=
nctrl-1': [[22]], 'pinctrl-2': [[23]], 'pinctrl-3': [[24]], 'pinctrl-4': [[=
25]], 'pinctrl-5': [[26]], 'audio-routing': ['ETDM1_OUT', 'ETDM_SPK_PIN', '=
ETDM2_OUT', 'ETDM_HP_PIN', 'ETDM1_IN', 'ETDM_SPK_PIN', 'ETDM2_IN', 'ETDM_HP=
_PIN', 'ADDA Capture', 'MTKAIF_PIN', 'Headphone Jack', 'HPOL', 'Headphone J=
ack', 'HPOR', 'MIC1', 'Headset Mic', 'Left Spk', 'Front Left BE_OUT', 'Righ=
t Spk', 'Front Right BE_OUT'], 'mediatek,adsp': [[27]], 'dai-link-0': {'lin=
k-name': ['ETDM2_OUT_BE'], 'mediatek,clk-provider': ['cpu'], 'codec': {'sou=
nd-dai': [[28]]}}, 'dai-link-1': {'link-name': ['ETDM2_IN_BE'], 'mediatek,c=
lk-provider': ['cpu'], 'codec': {'sound-dai': [[28]]}}, 'dai-link-2': {'lin=
k-name': ['ETDM1_OUT_BE'], 'dai-format': ['i2s'], 'mediatek,clk-provider': =
['cpu'], 'codec': {'sound-dai': [[29], [30]]}}, 'dai-link-3': {'link-name':=
 ['ETDM1_IN_BE'], 'dai-format': ['i2s'], 'mediatek,clk-provider': ['cpu']},=
 'dai-link-4': {'link-name': ['DPTX_BE'], 'codec': {'sound-dai': [[31]]}}, =
'$nodename': ['sound']}
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt=
6359.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: sound: Unevalu=
ated properties are not allowed ('mediatek,adsp', 'model' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt=
6359.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /vtemp: failed=
 to match any schema with compatible: ['mediatek,virtual-temp']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: thermal-zones:=
 'apu', 'cam1', 'cam2', 'cpu_big0', 'cpu_big1', 'cpu_little1', 'cpu_little2=
', 'cpu_little3', 'cpu_little4', 'gpu1', 'gpu2', 'soc1', 'soc2', 'soc3', 's=
oc_max' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-the=
rmal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: soc: hcp@0: 'a=
nyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: soc: imgsys-l1=
0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /: failed to m=
atch any schema with compatible: ['google,ciri-sku3', 'google,ciri', 'media=
tek,mt8188']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: idle-states: '=
mcusys-off', 's2idle', 'system-bus', 'system-mem', 'system-pll' do not matc=
h any of the regexes: '^(cpu|cluster)-', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: opp-table-gpu:=
 compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: opp-table-gpu:=
 Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /opp-table-gpu=
: failed to match any schema with compatible: ['operating-points-v2', 'oper=
ating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: sound: False s=
chema does not allow {'mediatek,platform': [[20]], 'status': ['okay'], 'com=
patible': ['mediatek,mt8188-rt5682s'], 'model': ['mt8188_m98390_5682'], 'pi=
nctrl-names': ['aud_etdm_hp_on', 'aud_etdm_hp_off', 'aud_etdm_spk_on', 'aud=
_etdm_spk_off', 'aud_mtkaif_on', 'aud_mtkaif_off'], 'pinctrl-0': [[21]], 'p=
inctrl-1': [[22]], 'pinctrl-2': [[23]], 'pinctrl-3': [[24]], 'pinctrl-4': [=
[25]], 'pinctrl-5': [[26]], 'audio-routing': ['ETDM1_OUT', 'ETDM_SPK_PIN', =
'ETDM2_OUT', 'ETDM_HP_PIN', 'ETDM1_IN', 'ETDM_SPK_PIN', 'ETDM2_IN', 'ETDM_H=
P_PIN', 'ADDA Capture', 'MTKAIF_PIN', 'Headphone Jack', 'HPOL', 'Headphone =
Jack', 'HPOR', 'IN1P', 'Headset Mic', 'Left Spk', 'Front Left BE_OUT', 'Rig=
ht Spk', 'Front Right BE_OUT'], 'mediatek,adsp': [[27]], 'dai-link-0': {'li=
nk-name': ['ETDM2_OUT_BE'], 'mediatek,clk-provider': ['cpu'], 'codec': {'so=
und-dai': [[28]]}}, 'dai-link-1': {'link-name': ['ETDM2_IN_BE'], 'mediatek,=
clk-provider': ['cpu'], 'codec': {'sound-dai': [[28]]}}, 'dai-link-2': {'li=
nk-name': ['ETDM1_OUT_BE'], 'dai-format': ['i2s'], 'mediatek,clk-provider':=
 ['cpu'], 'codec': {'sound-dai': [[29], [30]]}}, 'dai-link-3': {'link-name'=
: ['ETDM1_IN_BE'], 'dai-format': ['i2s'], 'mediatek,clk-provider': ['cpu']}=
, 'dai-link-4': {'link-name': ['DPTX_BE'], 'codec': {'sound-dai': [[31]]}},=
 '$nodename': ['sound']}
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt=
6359.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: sound: Unevalu=
ated properties are not allowed ('mediatek,adsp', 'model' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt=
6359.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /vtemp: failed=
 to match any schema with compatible: ['mediatek,virtual-temp']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: thermal-zones:=
 'apu', 'cam1', 'cam2', 'cpu_big0', 'cpu_big1', 'cpu_little1', 'cpu_little2=
', 'cpu_little3', 'cpu_little4', 'gpu1', 'gpu2', 'soc1', 'soc2', 'soc3', 's=
oc_max' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-the=
rmal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: soc: hcp@0: 'a=
nyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: soc: mtk-apu-m=
em-code: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /: failed to m=
atch any schema with compatible: ['google,ciri-sku4', 'google,ciri', 'media=
tek,mt8188']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: idle-states: '=
mcusys-off', 's2idle', 'system-bus', 'system-mem', 'system-pll' do not matc=
h any of the regexes: '^(cpu|cluster)-', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: opp-table-gpu:=
 compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: opp-table-gpu:=
 Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /opp-table-gpu=
: failed to match any schema with compatible: ['operating-points-v2', 'oper=
ating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: sound: False s=
chema does not allow {'mediatek,platform': [[20]], 'status': ['okay'], 'com=
patible': ['mediatek,mt8188-rt5682s'], 'model': ['mt8188_tas2563_5682'], 'p=
inctrl-names': ['aud_etdm_hp_on', 'aud_etdm_hp_off', 'aud_etdm_spk_on', 'au=
d_etdm_spk_off', 'aud_mtkaif_on', 'aud_mtkaif_off'], 'pinctrl-0': [[21]], '=
pinctrl-1': [[22]], 'pinctrl-2': [[23]], 'pinctrl-3': [[24]], 'pinctrl-4': =
[[25]], 'pinctrl-5': [[26]], 'audio-routing': ['ETDM1_OUT', 'ETDM_SPK_PIN',=
 'ETDM2_OUT', 'ETDM_HP_PIN', 'ETDM1_IN', 'ETDM_SPK_PIN', 'ETDM2_IN', 'ETDM_=
HP_PIN', 'ADDA Capture', 'MTKAIF_PIN', 'Headphone Jack', 'HPOL', 'Headphone=
 Jack', 'HPOR', 'IN1P', 'Headset Mic'], 'mediatek,adsp': [[27]], 'dai-link-=
0': {'link-name': ['ETDM2_OUT_BE'], 'mediatek,clk-provider': ['cpu'], 'code=
c': {'sound-dai': [[28]]}}, 'dai-link-1': {'link-name': ['ETDM2_IN_BE'], 'm=
ediatek,clk-provider': ['cpu'], 'codec': {'sound-dai': [[28]]}}, 'dai-link-=
2': {'link-name': ['ETDM1_OUT_BE'], 'dai-format': ['i2s'], 'mediatek,clk-pr=
ovider': ['cpu'], 'codec': {'sound-dai': [[29]]}}, 'dai-link-3': {'link-nam=
e': ['ETDM1_IN_BE'], 'dai-format': ['i2s'], 'mediatek,clk-provider': ['cpu'=
]}, 'dai-link-4': {'link-name': ['DPTX_BE'], 'codec': {'sound-dai': [[30]]}=
}, '$nodename': ['sound']}
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt=
6359.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: sound: Unevalu=
ated properties are not allowed ('mediatek,adsp', 'model' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt=
6359.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /vtemp: failed=
 to match any schema with compatible: ['mediatek,virtual-temp']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: thermal-zones:=
 'apu', 'cam1', 'cam2', 'cpu_big0', 'cpu_big1', 'cpu_little1', 'cpu_little2=
', 'cpu_little3', 'cpu_little4', 'gpu1', 'gpu2', 'soc1', 'soc2', 'soc3', 's=
oc_max' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-the=
rmal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: soc: hcp@0: 'a=
nyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: soc: hcp-l15: =
'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /: failed to m=
atch any schema with compatible: ['google,ciri-sku5', 'google,ciri', 'media=
tek,mt8188']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: idle-states: '=
mcusys-off', 's2idle', 'system-bus', 'system-mem', 'system-pll' do not matc=
h any of the regexes: '^(cpu|cluster)-', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: opp-table-gpu:=
 compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: opp-table-gpu:=
 Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /opp-table-gpu=
: failed to match any schema with compatible: ['operating-points-v2', 'oper=
ating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: sound: False s=
chema does not allow {'mediatek,platform': [[20]], 'status': ['okay'], 'com=
patible': ['mediatek,mt8188-es8326'], 'model': ['mt8188_tas2563_8326'], 'pi=
nctrl-names': ['aud_etdm_hp_on', 'aud_etdm_hp_off', 'aud_etdm_spk_on', 'aud=
_etdm_spk_off', 'aud_mtkaif_on', 'aud_mtkaif_off'], 'pinctrl-0': [[21]], 'p=
inctrl-1': [[22]], 'pinctrl-2': [[23]], 'pinctrl-3': [[24]], 'pinctrl-4': [=
[25]], 'pinctrl-5': [[26]], 'audio-routing': ['ETDM1_OUT', 'ETDM_SPK_PIN', =
'ETDM2_OUT', 'ETDM_HP_PIN', 'ETDM1_IN', 'ETDM_SPK_PIN', 'ETDM2_IN', 'ETDM_H=
P_PIN', 'ADDA Capture', 'MTKAIF_PIN', 'Headphone Jack', 'HPOL', 'Headphone =
Jack', 'HPOR', 'MIC1', 'Headset Mic'], 'mediatek,adsp': [[27]], 'dai-link-0=
': {'link-name': ['ETDM2_OUT_BE'], 'mediatek,clk-provider': ['cpu'], 'codec=
': {'sound-dai': [[28]]}}, 'dai-link-1': {'link-name': ['ETDM2_IN_BE'], 'me=
diatek,clk-provider': ['cpu'], 'codec': {'sound-dai': [[28]]}}, 'dai-link-2=
': {'link-name': ['ETDM1_OUT_BE'], 'dai-format': ['i2s'], 'mediatek,clk-pro=
vider': ['cpu'], 'codec': {'sound-dai': [[29]]}}, 'dai-link-3': {'link-name=
': ['ETDM1_IN_BE'], 'dai-format': ['i2s'], 'mediatek,clk-provider': ['cpu']=
}, 'dai-link-4': {'link-name': ['DPTX_BE'], 'codec': {'sound-dai': [[30]]}}=
, '$nodename': ['sound']}
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt=
6359.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: sound: Unevalu=
ated properties are not allowed ('mediatek,adsp', 'model' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt=
6359.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /vtemp: failed=
 to match any schema with compatible: ['mediatek,virtual-temp']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: thermal-zones:=
 'apu', 'cam1', 'cam2', 'cpu_big0', 'cpu_big1', 'cpu_little1', 'cpu_little2=
', 'cpu_little3', 'cpu_little4', 'gpu1', 'gpu2', 'soc1', 'soc2', 'soc3', 's=
oc_max' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-the=
rmal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: soc: hcp@0: 'a=
nyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: soc: imgsys-l1=
1C: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /: failed to m=
atch any schema with compatible: ['google,ciri-sku6', 'google,ciri', 'media=
tek,mt8188']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: idle-states: '=
mcusys-off', 's2idle', 'system-bus', 'system-mem', 'system-pll' do not matc=
h any of the regexes: '^(cpu|cluster)-', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: opp-table-gpu:=
 compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: opp-table-gpu:=
 Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /opp-table-gpu=
: failed to match any schema with compatible: ['operating-points-v2', 'oper=
ating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: sound: False s=
chema does not allow {'mediatek,platform': [[20]], 'status': ['okay'], 'com=
patible': ['mediatek,mt8188-es8326'], 'model': ['mt8188_tas2563_8326'], 'pi=
nctrl-names': ['aud_etdm_hp_on', 'aud_etdm_hp_off', 'aud_etdm_spk_on', 'aud=
_etdm_spk_off', 'aud_mtkaif_on', 'aud_mtkaif_off'], 'pinctrl-0': [[21]], 'p=
inctrl-1': [[22]], 'pinctrl-2': [[23]], 'pinctrl-3': [[24]], 'pinctrl-4': [=
[25]], 'pinctrl-5': [[26]], 'audio-routing': ['ETDM1_OUT', 'ETDM_SPK_PIN', =
'ETDM2_OUT', 'ETDM_HP_PIN', 'ETDM1_IN', 'ETDM_SPK_PIN', 'ETDM2_IN', 'ETDM_H=
P_PIN', 'ADDA Capture', 'MTKAIF_PIN', 'Headphone Jack', 'HPOL', 'Headphone =
Jack', 'HPOR', 'MIC1', 'Headset Mic'], 'mediatek,adsp': [[27]], 'dai-link-0=
': {'link-name': ['ETDM2_OUT_BE'], 'mediatek,clk-provider': ['cpu'], 'codec=
': {'sound-dai': [[28]]}}, 'dai-link-1': {'link-name': ['ETDM2_IN_BE'], 'me=
diatek,clk-provider': ['cpu'], 'codec': {'sound-dai': [[28]]}}, 'dai-link-2=
': {'link-name': ['ETDM1_OUT_BE'], 'dai-format': ['i2s'], 'mediatek,clk-pro=
vider': ['cpu'], 'codec': {'sound-dai': [[29]]}}, 'dai-link-3': {'link-name=
': ['ETDM1_IN_BE'], 'dai-format': ['i2s'], 'mediatek,clk-provider': ['cpu']=
}, 'dai-link-4': {'link-name': ['DPTX_BE'], 'codec': {'sound-dai': [[30]]}}=
, '$nodename': ['sound']}
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt=
6359.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: sound: Unevalu=
ated properties are not allowed ('mediatek,adsp', 'model' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt=
6359.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /vtemp: failed=
 to match any schema with compatible: ['mediatek,virtual-temp']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: thermal-zones:=
 'apu', 'cam1', 'cam2', 'cpu_big0', 'cpu_big1', 'cpu_little1', 'cpu_little2=
', 'cpu_little3', 'cpu_little4', 'gpu1', 'gpu2', 'soc1', 'soc2', 'soc3', 's=
oc_max' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-the=
rmal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: soc: hcp@0: 'a=
nyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: soc: imgsys-l1=
1C: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /: failed to m=
atch any schema with compatible: ['google,ciri-sku7', 'google,ciri', 'media=
tek,mt8188']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: idle-states: '=
mcusys-off', 's2idle', 'system-bus', 'system-mem', 'system-pll' do not matc=
h any of the regexes: '^(cpu|cluster)-', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: opp-table-gpu:=
 compatible: ['operating-points-v2', 'operating-points-v2-mali'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: opp-table-gpu:=
 Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /opp-table-gpu=
: failed to match any schema with compatible: ['operating-points-v2', 'oper=
ating-points-v2-mali']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: sound: False s=
chema does not allow {'mediatek,platform': [[20]], 'status': ['okay'], 'com=
patible': ['mediatek,mt8188-rt5682s'], 'model': ['mt8188_tas2563_5682'], 'p=
inctrl-names': ['aud_etdm_hp_on', 'aud_etdm_hp_off', 'aud_etdm_spk_on', 'au=
d_etdm_spk_off', 'aud_mtkaif_on', 'aud_mtkaif_off'], 'pinctrl-0': [[21]], '=
pinctrl-1': [[22]], 'pinctrl-2': [[23]], 'pinctrl-3': [[24]], 'pinctrl-4': =
[[25]], 'pinctrl-5': [[26]], 'audio-routing': ['ETDM1_OUT', 'ETDM_SPK_PIN',=
 'ETDM2_OUT', 'ETDM_HP_PIN', 'ETDM1_IN', 'ETDM_SPK_PIN', 'ETDM2_IN', 'ETDM_=
HP_PIN', 'ADDA Capture', 'MTKAIF_PIN', 'Headphone Jack', 'HPOL', 'Headphone=
 Jack', 'HPOR', 'IN1P', 'Headset Mic'], 'mediatek,adsp': [[27]], 'dai-link-=
0': {'link-name': ['ETDM2_OUT_BE'], 'mediatek,clk-provider': ['cpu'], 'code=
c': {'sound-dai': [[28]]}}, 'dai-link-1': {'link-name': ['ETDM2_IN_BE'], 'm=
ediatek,clk-provider': ['cpu'], 'codec': {'sound-dai': [[28]]}}, 'dai-link-=
2': {'link-name': ['ETDM1_OUT_BE'], 'dai-format': ['i2s'], 'mediatek,clk-pr=
ovider': ['cpu'], 'codec': {'sound-dai': [[29]]}}, 'dai-link-3': {'link-nam=
e': ['ETDM1_IN_BE'], 'dai-format': ['i2s'], 'mediatek,clk-provider': ['cpu'=
]}, 'dai-link-4': {'link-name': ['DPTX_BE'], 'codec': {'sound-dai': [[30]]}=
}, '$nodename': ['sound']}
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt=
6359.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: sound: Unevalu=
ated properties are not allowed ('mediatek,adsp', 'model' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt=
6359.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /vtemp: failed=
 to match any schema with compatible: ['mediatek,virtual-temp']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: thermal-zones:=
 'apu', 'cam1', 'cam2', 'cpu_big0', 'cpu_big1', 'cpu_little1', 'cpu_little2=
', 'cpu_little3', 'cpu_little4', 'gpu1', 'gpu2', 'soc1', 'soc2', 'soc3', 's=
oc_max' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-the=
rmal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: soc: hcp@0: 'a=
nyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: soc: hcp-l15: =
'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
