Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7327179972
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 11:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730546918; cv=none; b=DEJ9nSrMDdsWR+V1Kx5yRCmY1LZVg0dEmwQ9Kn75aOvbulQ0GMZLXKcQ+uNcGofSKa7hxG2UNLHsiHpzQiAychE2f5KN84/qq0noLDUhYwMLMYmdIJgfsY8G1EVlzqCJyXpuJZyas9QxCtjjHdHwaoErtOhS0Cs8GMqkrdcSicE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730546918; c=relaxed/simple;
	bh=Y6pa9fKwH7XK4vn5us+pWemSiNS+Y5SO1Fs4LwI4Ejw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eUtN9xyXqzi4y1+EZvUphH4+xDT19Qp6P1EItAwhCWkzJ2GJoZZ8UiY1aqJZTlpvjOWXIRuG7EykrV+mXKaLQsvPH5BcqLub6edDdOKXzCtL46PcEEKsYjgP87p3ILExviklx5MnPByzRIakmB0Yw1xcEfR8uUfZ33vHdbngz6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nayc4fwa; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nayc4fwa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730546915; x=1762082915;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Y6pa9fKwH7XK4vn5us+pWemSiNS+Y5SO1Fs4LwI4Ejw=;
  b=nayc4fwaHO/KijG/bFRWnlt35le05SA0bBoAkWC6b9xiXtpyEHdRdK3h
   ANvVyfQrlAnUQpZs452N4zYV9AAeJWm+bfSv7sQE46B7ZYAKWr98xyD67
   r7prFVROcO4/2DM5PwzMDh6OOrGv1rgxruR8/qMQyccHnofRY9Dkn9e3E
   hb0V3BQlLWk+zTxmn7o8lRZfa8ves4ULn6b2Jm+ZA6KBYwaR1tZlzt8FA
   fGdTHpz4Ramf1jM5WiN5VwmovLRdOAOIMuFORmafqEGXLPMy6hKHma2gE
   Gt1fhVMk/Mohmh/XHx7gULeFNKgoYUl3qaq+N5ZcwmlNdExMxhLATXUm9
   Q==;
X-CSE-ConnectionGUID: n7PCqIXLTZOO1/USGRWRhA==
X-CSE-MsgGUID: 6vnKg3rgT9y+iBiY6SPD3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="17926530"
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="17926530"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 04:28:34 -0700
X-CSE-ConnectionGUID: A6l3sCR3ROWNNf+Dc3YOwg==
X-CSE-MsgGUID: ikmcgY+IQZiAI4ZhRieryA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="87806082"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Nov 2024 04:28:32 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7CIw-000iq1-1d;
	Sat, 02 Nov 2024 11:28:30 +0000
Date: Sat, 2 Nov 2024 19:28:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 42/189]
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: sound: Unevaluated
 properties are not allowed ('mediatek,adsp', 'model' were unexpected)
Message-ID: <202411021909.3ZWRMHm8-lkp@intel.com>
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
head:   bd57356c030389bab042dec37d331a593de8cc7b
commit: 635428164cd0cd5e1e42dd2e0a680da4e7f71572 [42/189] CHROMIUM: arm64: =
dts: mediatek: mt8188: Remove mediatek,dai-link property
config: arm64-randconfig-051-20241030 (https://download.01.org/0day-ci/arch=
ive/20241102/202411021909.3ZWRMHm8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20241102/202411021909.3ZWRMHm8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411021909.3ZWRMHm8-lkp@i=
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
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: soc: regulator-dvfs-vmm:=
 'ranges' is a required property
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
em-data: 'ranges' is a required property
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
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: soc: imgsys-l1=
1A: 'ranges' is a required property
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
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: soc: mtk-apu-m=
em-code: 'ranges' is a required property
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
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: soc: imgsys-l1=
0: 'ranges' is a required property
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
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: soc: imgsys-l1=
1A: 'ranges' is a required property
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
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: soc: apusys-hw=
-logger@0x19024000: 'ranges' is a required property
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
1A: 'ranges' is a required property
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
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: soc: apusys-hw=
-logger@0x19024000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
