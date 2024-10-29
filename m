Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1331418858E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 04:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730176375; cv=none; b=IEQ9zDDgnqIHIjcS0bz9YNWPQx3exQ1k+pLYXuzcAxKXsUKjmgZOrJU89dzFYt2tO+fXwpaWAaKpbqBQlEqdtpKTAg/OuJACG89PXyk34vlTkiINccom7gjBHukXchThP1AmFZKK4hTUm24RVTQDKlSTyHLNiSmDUozlOrllWvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730176375; c=relaxed/simple;
	bh=+GDVrEq3Bc0zamKjgoRP7nfcYNTymZ39zxYIEMsQLRg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pC2/ppXdDmrFtJafXmkWYMP7oJa+rPlfUFCFGaTQvcurwQ4GVjLKMtR2KEWXqugtfW87v8dJ3Aihz6pvhM+A25PVZwgNN5iW6o7CPWf7BmsokPKIGy4ziR3+iBcoroUBL90jYhv+WnMJIzwIbXgM1JUsDvWXOmR+wz35M0iPNSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZlNqiZn1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZlNqiZn1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730176364; x=1761712364;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+GDVrEq3Bc0zamKjgoRP7nfcYNTymZ39zxYIEMsQLRg=;
  b=ZlNqiZn1tKyqS3YOjleCRoAvfo6MaO+5Fwf7i2than2acw99spVjQbLj
   L8QS0BwBSEiJ6yXHuE7kLEI+EXlahzqW86fzNo8Jan51DpWiffu70QQvP
   pF7J1wejWfyKhBk6OOBoae5uRPQ9J+1JoXeh/+VZ966JijgS4sfVAgzSv
   VcjWFTYyUE/ZT3J2h/HEXud6fqrOHLkK6mrfIBp5ZopO2AX1fRg4QW4MZ
   752EMEf78OQdJt8644D+ggAA4lBs31+ZotMAVJhdVZvvTnWWsojvtb32Q
   0uYCS24c4MqwaWcPye30ilJ4/6S1QBNMEWK5UgRUCa095d5F/RT9zKn+L
   A==;
X-CSE-ConnectionGUID: o1s28usWSEiwW4IY8Sd7wg==
X-CSE-MsgGUID: JnWk0qDSRxKCEqYSuLd6MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33493809"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="33493809"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 21:32:44 -0700
X-CSE-ConnectionGUID: uwVnse3aQSugzSJOAzuhPA==
X-CSE-MsgGUID: pCP7gfxJSYWKQiAXPjYQXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="105173043"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Oct 2024 21:32:41 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5duJ-000dFS-0Y;
	Tue, 29 Oct 2024 04:32:39 +0000
Date: Tue, 29 Oct 2024 12:32:21 +0800
From: kernel test robot <lkp@intel.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 4168/7765]
 arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: pmic: 'mt6358codec',
 'mt6358regulator' do not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202410291228.ds4ha67Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   dec9255a128e19c5fcc3bdb18175d78094cc624d
commit: 5bcecfcaa6d1d4ea1b29082ed1fd077ba4cccb55 [4168/7765] dt-bindings: m=
fd: mediatek: mt6397: Add ADC, CODEC and Regulators for MT6359
config: arm64-randconfig-052-20241028 (https://download.01.org/0day-ci/arch=
ive/20241029/202410291228.ds4ha67Y-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 588=
6454669c3c9026f7f27eab13509dd0241f2d6)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20241029/202410291228.ds4ha67Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291228.ds4ha67Y-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: pinctrl@10005000: 'i2c0', '=
i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'mmc0', 'mmc0default', 'mmc1', 'mmc1=
default', 'pwm1', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5' do not mat=
ch any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: pmic: 'regulators' is a req=
uired property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: pmic: 'mt6358codec', 'mt635=
8regulator' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/audio-controller@11220=
000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys=
', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/audio-controller@11220=
000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,=
mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: syscon@13000000: 'power-dom=
ains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: dsi@14014000: 'port' is a r=
equired property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: dpi@14015000: 'port' is a r=
equired property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: dpi@14015000: power-domains=
: False schema does not allow [[69, 7]]
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10=
005000: touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not match any o=
f the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10=
005000: trackpad-pins: 'trackpad-int' does not match any of the regexes: '^=
pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10=
005000: volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not match a=
ny of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10=
005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'g=
pio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2=
c5', 'i2c6', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvar=
p-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4=
', 'spi5', 'ts3a227e_pins', 'vddio-mipibrdg-en' do not match any of the reg=
exes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pmic: 'reg=
ulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pmic: 'mt6=
358codec', 'mt6358regulator' do not match any of the regexes: 'pinctrl-[0-9=
]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/audio=
-controller@11220000: failed to match any schema with compatible: ['mediate=
k,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/audio=
-controller@11220000/mt8183-afe-pcm: failed to match any schema with compat=
ible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: syscon@130=
00000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: dsi@140140=
00: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: dsi@140140=
00: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: dpi@140150=
00: 'port' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pinctrl@100=
05000: touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not match any of=
 the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pinctrl@100=
05000: trackpad-pins: 'trackpad-int' does not match any of the regexes: '^p=
ins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pinctrl@100=
05000: volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not match an=
y of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pinctrl@100=
05000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'gp=
io-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c=
5', 'i2c6', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp=
-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4'=
, 'spi5', 'ts3a227e_pins', 'vddio-mipibrdg-en' do not match any of the rege=
xes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pmic: 'regu=
lators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pmic: 'mt63=
58codec', 'mt6358regulator' do not match any of the regexes: 'pinctrl-[0-9]=
+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/audio-=
controller@11220000: failed to match any schema with compatible: ['mediatek=
,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/audio-=
controller@11220000/mt8183-afe-pcm: failed to match any schema with compati=
ble: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: syscon@1300=
0000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: dsi@1401400=
0: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: dsi@1401400=
0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: dpi@1401500=
0: 'port' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: pinctrl@1000=
5000: touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not match any of =
the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: pinctrl@1000=
5000: trackpad-pins: 'trackpad-int' does not match any of the regexes: '^pi=
ns', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: pinctrl@1000=
5000: volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not match any=
 of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: pinctrl@1000=
5000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'da7219_pins', 'ec-ap=
-int-odl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3'=
, 'i2c4', 'i2c5', 'i2c6', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lc=
d-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', =
'spi3', 'spi4', 'spi5', 'vddio-mipibrdg-en' do not match any of the regexes=
: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: pmic: 'regul=
ators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: pmic: 'mt635=
8codec', 'mt6358regulator' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: touchscreen@=
10: 'reset-gpios' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/audio-c=
ontroller@11220000: failed to match any schema with compatible: ['mediatek,=
mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/audio-c=
ontroller@11220000/mt8183-afe-pcm: failed to match any schema with compatib=
le: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: syscon@13000=
000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: dsi@14014000=
: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: dsi@14014000=
: Unevaluated properties are not allowed ('ports' was unexpected)
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pinct=
rl@10005000: touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not match =
any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pinct=
rl@10005000: trackpad-pins: 'trackpad-int' does not match any of the regexe=
s: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pinct=
rl@10005000: volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not ma=
tch any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pinct=
rl@10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'da7219_pins',=
 'ec-ap-int-odl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2',=
 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'pp=
varn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', '=
spi2', 'spi3', 'spi4', 'spi5', 'vddio-mipibrdg-en' do not match any of the =
regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pmic:=
 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pmic:=
 'mt6358codec', 'mt6358regulator' do not match any of the regexes: 'pinctrl=
-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: touch=
screen@10: 'reset-gpios' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/=
audio-controller@11220000: failed to match any schema with compatible: ['me=
diatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/=
audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with c=
ompatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: sysco=
n@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-=
9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: dsi@1=
4014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: dsi@1=
4014000: Unevaluated properties are not allowed ('ports' was unexpected)
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pinct=
rl@10005000: touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not match =
any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pinct=
rl@10005000: trackpad-pins: 'trackpad-int' does not match any of the regexe=
s: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pinct=
rl@10005000: volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not ma=
tch any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pinct=
rl@10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'da7219_pins',=
 'ec-ap-int-odl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2',=
 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'pp=
varn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', '=
spi2', 'spi3', 'spi4', 'spi5', 'vddio-mipibrdg-en' do not match any of the =
regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pmic:=
 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pmic:=
 'mt6358codec', 'mt6358regulator' do not match any of the regexes: 'pinctrl=
-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: touch=
screen@10: 'reset-gpios' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/=
audio-controller@11220000: failed to match any schema with compatible: ['me=
diatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/=
audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with c=
ompatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: sysco=
n@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-=
9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: dsi@1=
4014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: dsi@1=
4014000: Unevaluated properties are not allowed ('ports' was unexpected)
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: pinct=
rl@10005000: touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not match =
any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: pinct=
rl@10005000: trackpad-pins: 'trackpad-int' does not match any of the regexe=
s: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: pinct=
rl@10005000: volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not ma=
tch any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: pinct=
rl@10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl=
', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4'=
, 'i2c5', 'i2c6', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en', '=
ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', =
'spi4', 'spi5', 'ts3a227e_pins', 'vddio-mipibrdg-en' do not match any of th=
e regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: pmic:=
 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: pmic:=
 'mt6358codec', 'mt6358regulator' do not match any of the regexes: 'pinctrl=
-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: touch=
screen@10: 'reset-gpios' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/=
audio-controller@11220000: failed to match any schema with compatible: ['me=
diatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/=
audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with c=
ompatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: sysco=
n@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-=
9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: dsi@1=
4014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: dsi@1=
4014000: Unevaluated properties are not allowed ('ports' was unexpected)
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: pinctrl@=
10005000: touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not match any=
 of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: pinctrl@=
10005000: trackpad-pins: 'trackpad-int' does not match any of the regexes: =
'^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: pinctrl@=
10005000: volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not match=
 any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: pinctrl@=
10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'da7219_pins', 'e=
c-ap-int-odl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i=
2c3', 'i2c4', 'i2c5', 'i2c6', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvar=
n-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi=
2', 'spi3', 'spi4', 'spi5', 'vddio-mipibrdg-en' do not match any of the reg=
exes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: pmic: 'r=
egulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: pmic: 'm=
t6358codec', 'mt6358regulator' do not match any of the regexes: 'pinctrl-[0=
-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/aud=
io-controller@11220000: failed to match any schema with compatible: ['media=
tek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/aud=
io-controller@11220000/mt8183-afe-pcm: failed to match any schema with comp=
atible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: syscon@1=
3000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: dsi@1401=
4000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: dsi@1401=
4000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: dpi@1401=
5000: 'port' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pin=
ctrl@10005000: touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not matc=
h any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pin=
ctrl@10005000: trackpad-pins: 'trackpad-int' does not match any of the rege=
xes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pin=
ctrl@10005000: volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not =
match any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pin=
ctrl@10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-o=
dl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c=
4', 'i2c5', 'i2c6', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en',=
 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3'=
, 'spi4', 'spi5', 'ts3a227e_pins', 'vddio-mipibrdg-en' do not match any of =
the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pmi=
c: 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pmi=
c: 'mt6358codec', 'mt6358regulator' do not match any of the regexes: 'pinct=
rl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /so=
c/audio-controller@11220000: failed to match any schema with compatible: ['=
mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /so=
c/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with=
 compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: sys=
con@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[=
0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: dsi=
@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: dsi=
@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: dpi=
@14015000: 'port' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pin=
ctrl@10005000: touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not matc=
h any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pin=
ctrl@10005000: trackpad-pins: 'trackpad-int' does not match any of the rege=
xes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pin=
ctrl@10005000: volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not =
match any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pin=
ctrl@10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-o=
dl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c=
4', 'i2c5', 'i2c6', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en',=
 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3'=
, 'spi4', 'spi5', 'ts3a227e_pins', 'vddio-mipibrdg-en' do not match any of =
the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pmi=
c: 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pmi=
c: 'mt6358codec', 'mt6358regulator' do not match any of the regexes: 'pinct=
rl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /so=
c/audio-controller@11220000: failed to match any schema with compatible: ['=
mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /so=
c/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with=
 compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: sys=
con@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[=
0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: dsi=
@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: dsi=
@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: dpi=
@14015000: 'port' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: pinctrl@100=
05000: touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not match any of=
 the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: pinctrl@100=
05000: trackpad-pins: 'trackpad-int' does not match any of the regexes: '^p=
ins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: pinctrl@100=
05000: volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not match an=
y of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: pinctrl@100=
05000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'gp=
io-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c=
5', 'i2c6', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp=
-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4'=
, 'spi5', 'ts3a227e_pins', 'vddio-mipibrdg-en' do not match any of the rege=
xes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: pmic: 'regu=
lators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: pmic: 'mt63=
58codec', 'mt6358regulator' do not match any of the regexes: 'pinctrl-[0-9]=
+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/audio-=
controller@11220000: failed to match any schema with compatible: ['mediatek=
,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/audio-=
controller@11220000/mt8183-afe-pcm: failed to match any schema with compati=
ble: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: syscon@1300=
0000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: dsi@1401400=
0: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: dsi@1401400=
0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: dpi@1401500=
0: 'port' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pinctrl@100=
05000: touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not match any of=
 the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pinctrl@100=
05000: trackpad-pins: 'trackpad-int' does not match any of the regexes: '^p=
ins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pinctrl@100=
05000: volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not match an=
y of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pinctrl@100=
05000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'gp=
io-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c=
5', 'i2c6', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp=
-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4'=
, 'spi5', 'ts3a227e_pins', 'vddio-mipibrdg-en' do not match any of the rege=
xes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pmic: 'regu=
lators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pmic: 'mt63=
58codec', 'mt6358regulator' do not match any of the regexes: 'pinctrl-[0-9]=
+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/audio-=
controller@11220000: failed to match any schema with compatible: ['mediatek=
,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/audio-=
controller@11220000/mt8183-afe-pcm: failed to match any schema with compati=
ble: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: syscon@1300=
0000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: dsi@1401400=
0: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: dsi@1401400=
0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: dpi@1401500=
0: 'port' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinct=
rl@10005000: touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not match =
any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinct=
rl@10005000: trackpad-pins: 'trackpad-int' does not match any of the regexe=
s: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinct=
rl@10005000: volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not ma=
tch any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinct=
rl@10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'da7219_pins',=
 'ec-ap-int-odl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2',=
 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'pp=
varn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', '=
spi2', 'spi3', 'spi4', 'spi5', 'vddio-mipibrdg-en' do not match any of the =
regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pmic:=
 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pmic:=
 'mt6358codec', 'mt6358regulator' do not match any of the regexes: 'pinctrl=
-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/=
audio-controller@11220000: failed to match any schema with compatible: ['me=
diatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/=
audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with c=
ompatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: sysco=
n@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-=
9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: dsi@1=
4014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: dsi@1=
4014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: dpi@1=
4015000: 'port' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinct=
rl@10005000: touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not match =
any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinct=
rl@10005000: trackpad-pins: 'trackpad-int' does not match any of the regexe=
s: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinct=
rl@10005000: volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not ma=
tch any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinct=
rl@10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl=
', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4'=
, 'i2c5', 'i2c6', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en', '=
ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', =
'spi4', 'spi5', 'ts3a227e_pins', 'vddio-mipibrdg-en' do not match any of th=
e regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pmic:=
 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pmic:=
 'mt6358codec', 'mt6358regulator' do not match any of the regexes: 'pinctrl=
-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/=
audio-controller@11220000: failed to match any schema with compatible: ['me=
diatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/=
audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with c=
ompatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: sysco=
n@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-=
9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: dsi@1=
4014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: dsi@1=
4014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: dpi@1=
4015000: 'port' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@1000=
5000: touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not match any of =
the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@1000=
5000: trackpad-pins: 'trackpad-int' does not match any of the regexes: '^pi=
ns', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@1000=
5000: volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not match any=
 of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@1000=
5000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'gpi=
o-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5=
', 'i2c6', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-=
lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4',=
 'spi5', 'ts3a227e_pins', 'vddio-mipibrdg-en' do not match any of the regex=
es: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pmic: 'regul=
ators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pmic: 'mt635=
8codec', 'mt6358regulator' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/audio-c=
ontroller@11220000: failed to match any schema with compatible: ['mediatek,=
mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/audio-c=
ontroller@11220000/mt8183-afe-pcm: failed to match any schema with compatib=
le: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: syscon@13000=
000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: dsi@14014000=
: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: dsi@14014000=
: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: dpi@14015000=
: 'port' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: pinctrl@100=
05000: trackpad-pins: 'trackpad-int' does not match any of the regexes: '^p=
ins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: pinctrl@100=
05000: volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not match an=
y of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: pinctrl@100=
05000: bt-pins-wakeup: 'piins-bt-wakeup' does not match any of the regexes:=
 '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: pinctrl@100=
05000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'gp=
io-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c=
5', 'i2c6', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp=
-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4'=
, 'spi5', 'ts3a227e_pins', 'vddio-mipibrdg-en' do not match any of the rege=
xes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: pmic: 'regu=
lators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: pmic: 'mt63=
58codec', 'mt6358regulator' do not match any of the regexes: 'pinctrl-[0-9]=
+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /soc/audio-=
controller@11220000: failed to match any schema with compatible: ['mediatek=
,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /soc/audio-=
controller@11220000/mt8183-afe-pcm: failed to match any schema with compati=
ble: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: syscon@1300=
0000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: dsi@1401400=
0: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: dsi@1401400=
0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: dpi@1401500=
0: 'port' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pinct=
rl@10005000: touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not match =
any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pinct=
rl@10005000: trackpad-pins: 'trackpad-int' does not match any of the regexe=
s: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pinct=
rl@10005000: volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not ma=
tch any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pinct=
rl@10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'da7219_pins',=
 'ec-ap-int-odl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2',=
 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'pp=
varn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', '=
spi2', 'spi3', 'spi4', 'spi5', 'vddio-mipibrdg-en' do not match any of the =
regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pmic:=
 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pmic:=
 'mt6358codec', 'mt6358regulator' do not match any of the regexes: 'pinctrl=
-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/=
audio-controller@11220000: failed to match any schema with compatible: ['me=
diatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/=
audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with c=
ompatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: sysco=
n@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-=
9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: dsi@1=
4014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: dsi@1=
4014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: dpi@1=
4015000: 'port' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: pinct=
rl@10005000: touchscreen-pins: 'touch-int-odl', 'touch-rst-l' do not match =
any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: pinct=
rl@10005000: trackpad-pins: 'trackpad-int' does not match any of the regexe=
s: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: pinct=
rl@10005000: volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not ma=
tch any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: pinct=
rl@10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl=
', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4'=
, 'i2c5', 'i2c6', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en', '=
ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', =
'spi4', 'spi5', 'ts3a227e_pins', 'vddio-mipibrdg-en' do not match any of th=
e regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: pmic:=
 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: pmic:=
 'mt6358codec', 'mt6358regulator' do not match any of the regexes: 'pinctrl=
-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/=
audio-controller@11220000: failed to match any schema with compatible: ['me=
diatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/=
audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with c=
ompatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: sysco=
n@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-=
9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: dsi@1=
4014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: dsi@1=
4014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: dpi@1=
4015000: 'port' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pinctrl@10005000: =
mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2,=
 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pinctrl@10005000: =
mmc1-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pinctrl@10005000: =
panel-pins-default: 'panel-reset' does not match any of the regexes: '^pins=
', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pinctrl@10005000: =
'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'da7219_pins', 'ec-ap-int-o=
dl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c=
4', 'i2c5', 'i2c6', 'open_touch', 'peneject', 'pp1800-lcd-en', 'ppvarn-lcd-=
en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 's=
pi3', 'spi4', 'spi5' do not match any of the regexes: '-pins(-[a-z]+)?$', '=
pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pmic: 'regulators'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pmic: 'mt6358codec=
', 'mt6358regulator' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /soc/audio-control=
ler@11220000: failed to match any schema with compatible: ['mediatek,mt8183=
-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /soc/audio-control=
ler@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['=
mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: syscon@13000000: '=
power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: dsi@14014000: 'por=
t' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: dsi@14014000: Unev=
aluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: dpi@14015000: 'por=
t' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: pinctrl@1000=
5000: mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0,=
 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: pinctrl@1000=
5000: mmc1-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1=
, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: pinctrl@1000=
5000: panel-pins-default: 'panel-reset' does not match any of the regexes: =
'^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: pinctrl@1000=
5000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'gpi=
o-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5=
', 'i2c6', 'open_touch', 'peneject', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppv=
arp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'sp=
i4', 'spi5' do not match any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[=
0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: pmic: 'regul=
ators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: pmic: 'mt635=
8codec', 'mt6358regulator' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/audio-c=
ontroller@11220000: failed to match any schema with compatible: ['mediatek,=
mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/audio-c=
ontroller@11220000/mt8183-afe-pcm: failed to match any schema with compatib=
le: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: syscon@13000=
000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: dsi@14014000=
: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: dsi@14014000=
: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: dpi@14015000=
: 'port' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pinctrl@10005=
000: mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, =
1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pinctrl@10005=
000: mmc1-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1,=
 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pinctrl@10005=
000: panel-pins-default: 'panel-reset' does not match any of the regexes: '=
^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pinctrl@10005=
000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'da7219_pins', 'ec-ap-=
int-odl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3',=
 'i2c4', 'i2c5', 'i2c6', 'open_touch', 'peneject', 'pp1800-lcd-en', 'ppvarn=
-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2=
', 'spi3', 'spi4', 'spi5' do not match any of the regexes: '-pins(-[a-z]+)?=
$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pmic: 'regula=
tors' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pmic: 'mt6358=
codec', 'mt6358regulator' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /soc/audio-co=
ntroller@11220000: failed to match any schema with compatible: ['mediatek,m=
t8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /soc/audio-co=
ntroller@11220000/mt8183-afe-pcm: failed to match any schema with compatibl=
e: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: syscon@130000=
00: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: dsi@14014000:=
 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: dsi@14014000:=
 Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: dpi@14015000:=
 'port' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pinctrl@10005=
000: mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, =
1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pinctrl@10005=
000: mmc1-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1,=
 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pinctrl@10005=
000: panel-pins-default: 'panel-reset' does not match any of the regexes: '=
^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pinctrl@10005=
000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'gpio=
-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5'=
, 'i2c6', 'open_touch', 'peneject', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppva=
rp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi=
4', 'spi5' do not match any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0=
-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pmic: 'regula=
tors' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pmic: 'mt6358=
codec', 'mt6358regulator' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/audio-co=
ntroller@11220000: failed to match any schema with compatible: ['mediatek,m=
t8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/audio-co=
ntroller@11220000/mt8183-afe-pcm: failed to match any schema with compatibl=
e: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: syscon@130000=
00: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: dsi@14014000:=
 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: dsi@14014000:=
 Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: dpi@14015000:=
 'port' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pinctrl@1000=
5000: mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0,=
 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pinctrl@1000=
5000: mmc1-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1=
, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pinctrl@1000=
5000: panel-pins-default: 'panel-reset' does not match any of the regexes: =
'^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pinctrl@1000=
5000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'gpi=
o-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5=
', 'i2c6', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-def=
ault', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'touchdefault=
', 'ts3a227e_pins' do not match any of the regexes: '-pins(-[a-z]+)?$', 'pi=
nctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pmic: 'regul=
ators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pmic: 'mt635=
8codec', 'mt6358regulator' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/audio-c=
ontroller@11220000: failed to match any schema with compatible: ['mediatek,=
mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/audio-c=
ontroller@11220000/mt8183-afe-pcm: failed to match any schema with compatib=
le: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: syscon@13000=
000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: dsi@14014000=
: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: dsi@14014000=
: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: dpi@14015000=
: 'port' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pinctrl@100=
05000: mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0=
, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pinctrl@100=
05000: mmc1-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, =
1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pinctrl@100=
05000: panel-pins-default: 'panel-reset' does not match any of the regexes:=
 '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pinctrl@100=
05000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'gp=
io-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c=
5', 'i2c6', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-de=
fault', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'touchdefaul=
t', 'ts3a227e_pins' do not match any of the regexes: '-pins(-[a-z]+)?$', 'p=
inctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pmic: 'regu=
lators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pmic: 'mt63=
58codec', 'mt6358regulator' do not match any of the regexes: 'pinctrl-[0-9]=
+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/audio-=
controller@11220000: failed to match any schema with compatible: ['mediatek=
,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/audio-=
controller@11220000/mt8183-afe-pcm: failed to match any schema with compati=
ble: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: syscon@1300=
0000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: dsi@1401400=
0: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: dsi@1401400=
0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: dpi@1401500=
0: 'port' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pinctrl@100=
05000: mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0=
, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pinctrl@100=
05000: mmc1-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, =
1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pinctrl@100=
05000: panel-pins-default: 'panel-reset' does not match any of the regexes:=
 '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pinctrl@100=
05000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'gp=
io-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c=
5', 'i2c6', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-de=
fault', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'touchdefaul=
t', 'ts3a227e_pins' do not match any of the regexes: '-pins(-[a-z]+)?$', 'p=
inctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pmic: 'regu=
lators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pmic: 'mt63=
58codec', 'mt6358regulator' do not match any of the regexes: 'pinctrl-[0-9]=
+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/audio-=
controller@11220000: failed to match any schema with compatible: ['mediatek=
,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/audio-=
controller@11220000/mt8183-afe-pcm: failed to match any schema with compati=
ble: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: syscon@1300=
0000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: dsi@1401400=
0: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: dsi@1401400=
0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: dpi@1401500=
0: 'port' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: pinctrl@1000=
5000: mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0,=
 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: pinctrl@1000=
5000: mmc1-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1=
, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: pinctrl@1000=
5000: panel-pins-default: 'panel-reset' does not match any of the regexes: =
'^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: pinctrl@1000=
5000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'gpi=
o-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5=
', 'i2c6', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-def=
ault', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'touchdefault=
', 'ts3a227e_pins' do not match any of the regexes: '-pins(-[a-z]+)?$', 'pi=
nctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: pmic: 'regul=
ators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: pmic: 'mt635=
8codec', 'mt6358regulator' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/audio-c=
ontroller@11220000: failed to match any schema with compatible: ['mediatek,=
mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/audio-c=
ontroller@11220000/mt8183-afe-pcm: failed to match any schema with compatib=
le: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: syscon@13000=
000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: dsi@14014000=
: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: dsi@14014000=
: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: dpi@14015000=
: 'port' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pinctrl@100050=
00: mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1=
, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pinctrl@100050=
00: mmc1-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, =
2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pinctrl@100050=
00: panel-pins-default: 'panel-reset' does not match any of the regexes: '^=
pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pinctrl@100050=
00: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'gpio-=
line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5',=
 'i2c6', 'open_touch', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', '=
pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5' do=
 not match any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pmic: 'regulat=
ors' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pmic: 'mt6358c=
odec', 'mt6358regulator' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/audio-con=
troller@11220000: failed to match any schema with compatible: ['mediatek,mt=
8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/audio-con=
troller@11220000/mt8183-afe-pcm: failed to match any schema with compatible=
: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: syscon@1300000=
0: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: dsi@14014000: =
'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: dsi@14014000: =
Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: dpi@14015000: =
'port' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pinctrl@1000=
5000: mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0,=
 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pinctrl@1000=
5000: mmc1-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1=
, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pinctrl@1000=
5000: panel-pins-default: 'panel-reset' does not match any of the regexes: =
'^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pinctrl@1000=
5000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'ec-ap-int-odl', 'gpi=
o-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5=
', 'i2c6', 'open_touch', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en',=
 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5' =
do not match any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pmic: 'regul=
ators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pmic: 'mt635=
8codec', 'mt6358regulator' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/audio-c=
ontroller@11220000: failed to match any schema with compatible: ['mediatek,=
mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/audio-c=
ontroller@11220000/mt8183-afe-pcm: failed to match any schema with compatib=
le: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: syscon@13000=
000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: dsi@14014000=
: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: dsi@14014000=
: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: dpi@14015000=
: 'port' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: pinctrl@10005000: mmc1-=
pins-default:pins_clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: pinctrl@10005000: mmc1-=
pins-uhs:pins_cmd_dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: pinctrl@10005000: mmc1-=
pins-uhs:pins_clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: pinctrl@10005000: 'i2c0=
', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'keyboard' do not match =
any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: pmic: 'regulators' is a=
 required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: pmic: 'mt6358codec', 'm=
t6358regulator' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/audio-controller@1=
1220000: failed to match any schema with compatible: ['mediatek,mt8183-audi=
osys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/audio-controller@1=
1220000/mt8183-afe-pcm: failed to match any schema with compatible: ['media=
tek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: syscon@13000000: 'power=
-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: dpi@14015000: 'port' is=
 a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: dpi@14015000: power-dom=
ains: False schema does not allow [[70, 7]]
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dpi.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: syscon@10006000: power-cont=
roller:power-domain@15:power-domain@16:power-domain@29:power-domain@30: Une=
valuated properties are not allowed ('power-domain@31', 'power-domain@32' w=
ere unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scps=
ys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: power-controller: power-dom=
ain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated propert=
ies are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-con=
troller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pmic: regulators: 'compatib=
le' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pmic: 'mt6359codec', 'mt635=
9rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10320000: 'clock-na=
mes' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10330000: 'clock-na=
mes' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@14000000: =
$nodename:0: 'clock-controller@14000000' does not match '^syscon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mm=
sys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@14000000: =
compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-vppsys0'] is too short
   	'mediatek,mt8195-mmsys' was expected
--
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pmic: regulat=
ors: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pmic: 'mt6359=
codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: syscon@112100=
00: 'mt8192-afe-pcm' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,au=
dsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: mt8192-afe-pc=
m: clocks: [[59, 0], [59, 7], [59, 8], [59, 6], [59, 21], [59, 1], [59, 2],=
 [59, 4], [59, 3], [59, 5], [59, 9], [59, 10], [59, 18], [59, 19], [59, 20]=
, [59, 22], [59, 23], [59, 24], [59, 25], [59, 26], [23, 47], [23, 58], [22=
, 27], [22, 28], [22, 72], [22, 47], [22, 101], [22, 48], [22, 105], [22, 4=
3], [22, 103], [22, 44], [22, 107], [22, 59], [22, 60], [22, 61], [22, 62],=
 [22, 63], [22, 64], [22, 65], [22, 66], [22, 67], [22, 68], [22, 142], [22=
, 143], [22, 144], [22, 145], [22, 146], [22, 147], [22, 148], [22, 149], [=
22, 150], [22, 151], [22, 152], [22, 55], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: mt8192-afe-pc=
m: clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: mt8192-afe-pc=
m: clock-names:4: 'aud_infra_26m_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: mt8192-afe-pc=
m: clock-names: ['aud_afe_clk', 'aud_dac_clk', 'aud_dac_predis_clk', 'aud_a=
dc_clk', 'aud_adda6_adc_clk', 'aud_apll22m_clk', 'aud_apll24m_clk', 'aud_ap=
ll1_tuner_clk', 'aud_apll2_tuner_clk', 'aud_tdm_clk', 'aud_tml_clk', 'aud_n=
le', 'aud_dac_hires_clk', 'aud_adc_hires_clk', 'aud_adc_hires_tml', 'aud_ad=
da6_adc_hires_clk', 'aud_3rd_dac_clk', 'aud_3rd_dac_predis_clk', 'aud_3rd_d=
ac_tml', 'aud_3rd_dac_hires_clk', 'aud_infra_clk', 'aud_infra_26m_clk', 'to=
p_mux_audio', 'top_mux_audio_int', 'top_mainpll_d4_d4', 'top_mux_aud_1', 't=
op_apll1_ck', 'top_mux_aud_2', 'top_apll2_ck', 'top_mux_aud_eng1', 'top_apl=
l1_d4', 'top_mux_aud_eng2', 'top_apll2_d4', 'top_i2s0_m_sel', 'top_i2s1_m_s=
el', 'top_i2s2_m_sel', 'top_i2s3_m_sel', 'top_i2s4_m_sel', 'top_i2s5_m_sel'=
, 'top_i2s6_m_sel', 'top_i2s7_m_sel', 'top_i2s8_m_sel', 'top_i2s9_m_sel', '=
top_apll12_div0', 'top_apll12_div1', 'top_apll12_div2', 'top_apll12_div3', =
'top_apll12_div4', 'top_apll12_divb', 'top_apll12_div5', 'top_apll12_div6',=
 'top_apll12_div7', 'top_apll12_div8', 'top_apll12_div9', 'top_mux_audio_h'=
, 'top_clk26m_clk'] is too long
--
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: pmic: re=
gulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: pmic: 'm=
t6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: syscon@1=
1210000: 'mt8192-afe-pcm' does not match any of the regexes: 'pinctrl-[0-9]=
+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,au=
dsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: mt8192-a=
fe-pcm: clocks: [[56, 0], [56, 7], [56, 8], [56, 6], [56, 21], [56, 1], [56=
, 2], [56, 4], [56, 3], [56, 5], [56, 9], [56, 10], [56, 18], [56, 19], [56=
, 20], [56, 22], [56, 23], [56, 24], [56, 25], [56, 26], [23, 47], [23, 58]=
, [22, 27], [22, 28], [22, 72], [22, 47], [22, 101], [22, 48], [22, 105], [=
22, 43], [22, 103], [22, 44], [22, 107], [22, 59], [22, 60], [22, 61], [22,=
 62], [22, 63], [22, 64], [22, 65], [22, 66], [22, 67], [22, 68], [22, 142]=
, [22, 143], [22, 144], [22, 145], [22, 146], [22, 147], [22, 148], [22, 14=
9], [22, 150], [22, 151], [22, 152], [22, 55], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: mt8192-a=
fe-pcm: clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: mt8192-a=
fe-pcm: clock-names:4: 'aud_infra_26m_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: mt8192-a=
fe-pcm: clock-names: ['aud_afe_clk', 'aud_dac_clk', 'aud_dac_predis_clk', '=
aud_adc_clk', 'aud_adda6_adc_clk', 'aud_apll22m_clk', 'aud_apll24m_clk', 'a=
ud_apll1_tuner_clk', 'aud_apll2_tuner_clk', 'aud_tdm_clk', 'aud_tml_clk', '=
aud_nle', 'aud_dac_hires_clk', 'aud_adc_hires_clk', 'aud_adc_hires_tml', 'a=
ud_adda6_adc_hires_clk', 'aud_3rd_dac_clk', 'aud_3rd_dac_predis_clk', 'aud_=
3rd_dac_tml', 'aud_3rd_dac_hires_clk', 'aud_infra_clk', 'aud_infra_26m_clk'=
, 'top_mux_audio', 'top_mux_audio_int', 'top_mainpll_d4_d4', 'top_mux_aud_1=
', 'top_apll1_ck', 'top_mux_aud_2', 'top_apll2_ck', 'top_mux_aud_eng1', 'to=
p_apll1_d4', 'top_mux_aud_eng2', 'top_apll2_d4', 'top_i2s0_m_sel', 'top_i2s=
1_m_sel', 'top_i2s2_m_sel', 'top_i2s3_m_sel', 'top_i2s4_m_sel', 'top_i2s5_m=
_sel', 'top_i2s6_m_sel', 'top_i2s7_m_sel', 'top_i2s8_m_sel', 'top_i2s9_m_se=
l', 'top_apll12_div0', 'top_apll12_div1', 'top_apll12_div2', 'top_apll12_di=
v3', 'top_apll12_div4', 'top_apll12_divb', 'top_apll12_div5', 'top_apll12_d=
iv6', 'top_apll12_div7', 'top_apll12_div8', 'top_apll12_div9', 'top_mux_aud=
io_h', 'top_clk26m_clk'] is too long
--
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: pmic: regul=
ators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: pmic: 'mt63=
59codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: syscon@1121=
0000: 'mt8192-afe-pcm' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,au=
dsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: mt8192-afe-=
pcm: clocks: [[56, 0], [56, 7], [56, 8], [56, 6], [56, 21], [56, 1], [56, 2=
], [56, 4], [56, 3], [56, 5], [56, 9], [56, 10], [56, 18], [56, 19], [56, 2=
0], [56, 22], [56, 23], [56, 24], [56, 25], [56, 26], [23, 47], [23, 58], [=
22, 27], [22, 28], [22, 72], [22, 47], [22, 101], [22, 48], [22, 105], [22,=
 43], [22, 103], [22, 44], [22, 107], [22, 59], [22, 60], [22, 61], [22, 62=
], [22, 63], [22, 64], [22, 65], [22, 66], [22, 67], [22, 68], [22, 142], [=
22, 143], [22, 144], [22, 145], [22, 146], [22, 147], [22, 148], [22, 149],=
 [22, 150], [22, 151], [22, 152], [22, 55], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: mt8192-afe-=
pcm: clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: mt8192-afe-=
pcm: clock-names:4: 'aud_infra_26m_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: mt8192-afe-=
pcm: clock-names: ['aud_afe_clk', 'aud_dac_clk', 'aud_dac_predis_clk', 'aud=
_adc_clk', 'aud_adda6_adc_clk', 'aud_apll22m_clk', 'aud_apll24m_clk', 'aud_=
apll1_tuner_clk', 'aud_apll2_tuner_clk', 'aud_tdm_clk', 'aud_tml_clk', 'aud=
_nle', 'aud_dac_hires_clk', 'aud_adc_hires_clk', 'aud_adc_hires_tml', 'aud_=
adda6_adc_hires_clk', 'aud_3rd_dac_clk', 'aud_3rd_dac_predis_clk', 'aud_3rd=
_dac_tml', 'aud_3rd_dac_hires_clk', 'aud_infra_clk', 'aud_infra_26m_clk', '=
top_mux_audio', 'top_mux_audio_int', 'top_mainpll_d4_d4', 'top_mux_aud_1', =
'top_apll1_ck', 'top_mux_aud_2', 'top_apll2_ck', 'top_mux_aud_eng1', 'top_a=
pll1_d4', 'top_mux_aud_eng2', 'top_apll2_d4', 'top_i2s0_m_sel', 'top_i2s1_m=
_sel', 'top_i2s2_m_sel', 'top_i2s3_m_sel', 'top_i2s4_m_sel', 'top_i2s5_m_se=
l', 'top_i2s6_m_sel', 'top_i2s7_m_sel', 'top_i2s8_m_sel', 'top_i2s9_m_sel',=
 'top_apll12_div0', 'top_apll12_div1', 'top_apll12_div2', 'top_apll12_div3'=
, 'top_apll12_div4', 'top_apll12_divb', 'top_apll12_div5', 'top_apll12_div6=
', 'top_apll12_div7', 'top_apll12_div8', 'top_apll12_div9', 'top_mux_audio_=
h', 'top_clk26m_clk'] is too long
--
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: pmic: regul=
ators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: pmic: 'mt63=
59codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: syscon@1121=
0000: 'mt8192-afe-pcm' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,au=
dsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: mt8192-afe-=
pcm: clocks: [[56, 0], [56, 7], [56, 8], [56, 6], [56, 21], [56, 1], [56, 2=
], [56, 4], [56, 3], [56, 5], [56, 9], [56, 10], [56, 18], [56, 19], [56, 2=
0], [56, 22], [56, 23], [56, 24], [56, 25], [56, 26], [23, 47], [23, 58], [=
22, 27], [22, 28], [22, 72], [22, 47], [22, 101], [22, 48], [22, 105], [22,=
 43], [22, 103], [22, 44], [22, 107], [22, 59], [22, 60], [22, 61], [22, 62=
], [22, 63], [22, 64], [22, 65], [22, 66], [22, 67], [22, 68], [22, 142], [=
22, 143], [22, 144], [22, 145], [22, 146], [22, 147], [22, 148], [22, 149],=
 [22, 150], [22, 151], [22, 152], [22, 55], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: mt8192-afe-=
pcm: clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: mt8192-afe-=
pcm: clock-names:4: 'aud_infra_26m_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: mt8192-afe-=
pcm: clock-names: ['aud_afe_clk', 'aud_dac_clk', 'aud_dac_predis_clk', 'aud=
_adc_clk', 'aud_adda6_adc_clk', 'aud_apll22m_clk', 'aud_apll24m_clk', 'aud_=
apll1_tuner_clk', 'aud_apll2_tuner_clk', 'aud_tdm_clk', 'aud_tml_clk', 'aud=
_nle', 'aud_dac_hires_clk', 'aud_adc_hires_clk', 'aud_adc_hires_tml', 'aud_=
adda6_adc_hires_clk', 'aud_3rd_dac_clk', 'aud_3rd_dac_predis_clk', 'aud_3rd=
_dac_tml', 'aud_3rd_dac_hires_clk', 'aud_infra_clk', 'aud_infra_26m_clk', '=
top_mux_audio', 'top_mux_audio_int', 'top_mainpll_d4_d4', 'top_mux_aud_1', =
'top_apll1_ck', 'top_mux_aud_2', 'top_apll2_ck', 'top_mux_aud_eng1', 'top_a=
pll1_d4', 'top_mux_aud_eng2', 'top_apll2_d4', 'top_i2s0_m_sel', 'top_i2s1_m=
_sel', 'top_i2s2_m_sel', 'top_i2s3_m_sel', 'top_i2s4_m_sel', 'top_i2s5_m_se=
l', 'top_i2s6_m_sel', 'top_i2s7_m_sel', 'top_i2s8_m_sel', 'top_i2s9_m_sel',=
 'top_apll12_div0', 'top_apll12_div1', 'top_apll12_div2', 'top_apll12_div3'=
, 'top_apll12_div4', 'top_apll12_divb', 'top_apll12_div5', 'top_apll12_div6=
', 'top_apll12_div7', 'top_apll12_div8', 'top_apll12_div9', 'top_mux_audio_=
h', 'top_clk26m_clk'] is too long
--
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: pmic: regulators: 'compatib=
le' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: pmic: 'mt6359codec', 'mt635=
9rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: syscon@11210000: 'mt8192-af=
e-pcm' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,au=
dsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: mt8192-afe-pcm: clocks: [[4=
5, 0], [45, 7], [45, 8], [45, 6], [45, 21], [45, 1], [45, 2], [45, 4], [45,=
 3], [45, 5], [45, 9], [45, 10], [45, 18], [45, 19], [45, 20], [45, 22], [4=
5, 23], [45, 24], [45, 25], [45, 26], [23, 47], [23, 58], [22, 27], [22, 28=
], [22, 72], [22, 47], [22, 101], [22, 48], [22, 105], [22, 43], [22, 103],=
 [22, 44], [22, 107], [22, 59], [22, 60], [22, 61], [22, 62], [22, 63], [22=
, 64], [22, 65], [22, 66], [22, 67], [22, 68], [22, 142], [22, 143], [22, 1=
44], [22, 145], [22, 146], [22, 147], [22, 148], [22, 149], [22, 150], [22,=
 151], [22, 152], [22, 55], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: mt8192-afe-pcm: clock-names=
:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: mt8192-afe-pcm: clock-names=
:4: 'aud_infra_26m_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: mt8192-afe-pcm: clock-names=
: ['aud_afe_clk', 'aud_dac_clk', 'aud_dac_predis_clk', 'aud_adc_clk', 'aud_=
adda6_adc_clk', 'aud_apll22m_clk', 'aud_apll24m_clk', 'aud_apll1_tuner_clk'=
, 'aud_apll2_tuner_clk', 'aud_tdm_clk', 'aud_tml_clk', 'aud_nle', 'aud_dac_=
hires_clk', 'aud_adc_hires_clk', 'aud_adc_hires_tml', 'aud_adda6_adc_hires_=
clk', 'aud_3rd_dac_clk', 'aud_3rd_dac_predis_clk', 'aud_3rd_dac_tml', 'aud_=
3rd_dac_hires_clk', 'aud_infra_clk', 'aud_infra_26m_clk', 'top_mux_audio', =
'top_mux_audio_int', 'top_mainpll_d4_d4', 'top_mux_aud_1', 'top_apll1_ck', =
'top_mux_aud_2', 'top_apll2_ck', 'top_mux_aud_eng1', 'top_apll1_d4', 'top_m=
ux_aud_eng2', 'top_apll2_d4', 'top_i2s0_m_sel', 'top_i2s1_m_sel', 'top_i2s2=
_m_sel', 'top_i2s3_m_sel', 'top_i2s4_m_sel', 'top_i2s5_m_sel', 'top_i2s6_m_=
sel', 'top_i2s7_m_sel', 'top_i2s8_m_sel', 'top_i2s9_m_sel', 'top_apll12_div=
0', 'top_apll12_div1', 'top_apll12_div2', 'top_apll12_div3', 'top_apll12_di=
v4', 'top_apll12_divb', 'top_apll12_div5', 'top_apll12_div6', 'top_apll12_d=
iv7', 'top_apll12_div8', 'top_apll12_div9', 'top_mux_audio_h', 'top_clk26m_=
clk'] is too long
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: syscon@10001000:=
 compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too=
 long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sy=
s-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic: regulators=
: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic: 'mt6359cod=
ec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: infra-iommu@1031=
5000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798,=
 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic@34: #interr=
upt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a: #sound=
-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a: Uneval=
uated properties are not allowed ('VBAT-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a: 'DBVDD=
-supply' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: syscon@1000100=
0: compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is t=
oo long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sy=
s-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic: regulato=
rs: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic: 'mt6359c=
odec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: infra-iommu@10=
315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 79=
8, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic@34: #inte=
rrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: /soc/i2c@11e02=
000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i=
']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: t-phy@11e30000=
: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@=
[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: display@14f060=
00: clocks: [[40, 14], [40, 43], [40, 44]] is too long
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,split.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: syscon@1000100=
0: compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is t=
oo long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sy=
s-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic: regulato=
rs: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic: 'mt6359c=
odec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: infra-iommu@10=
315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 79=
8, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic@34: #inte=
rrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: /soc/i2c@11e02=
000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i=
']
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: t-phy@11e30000=
: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@=
[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: display@14f060=
00: clocks: [[40, 14], [40, 43], [40, 44]] is too long
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,split.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: syscon@1000100=
0: compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is t=
oo long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sy=
s-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic: regulato=
rs: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic: 'mt6359c=
odec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: infra-iommu@10=
315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 79=
8, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic@34: #inte=
rrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a: #sou=
nd-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a: Unev=
aluated properties are not allowed ('VBAT-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a: 'DBV=
DD-supply' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: syscon@10001000: compatibl=
e: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sy=
s-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: pmic: regulators: 'compati=
ble' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: pmic: 'mt6359codec', 'mt63=
59rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: infra-iommu@10315000: inte=
rrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0=
, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: pmic@34: charger:usb-otg-v=
bus-regulator: Unevaluated properties are not allowed ('regulator-compatibl=
e' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: charger: usb-otg-vbus-regu=
lator: Unevaluated properties are not allowed ('regulator-compatible' was u=
nexpected)
   	from schema $id: http://devicetree.org/schemas/power/supply/mt6360_char=
ger.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: regulator: buck1: Unevalua=
ted properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mt6360-regulat=
or.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: regulator: buck2: Unevalua=
ted properties are not allowed ('regulator-compatible' was unexpected)
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: syscon@10001000:=
 compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too=
 long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sy=
s-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: pmic: regulators=
: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: pmic: 'mt6359cod=
ec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: infra-iommu@1031=
5000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798,=
 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: eth-phy0@1: Unev=
aluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: eth-phy0@1: $nod=
ename:0: 'eth-phy0@1' does not match '^ethernet-phy(@[a-f0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: t-phy@11e30000: =
'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0=
-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: display@14f06000=
: clocks: [[31, 14], [31, 43], [31, 44]] is too long
--
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: syscon@10006000: =
power-controller:power-domain@15:power-domain@16:power-domain@29:power-doma=
in@30: Unevaluated properties are not allowed ('power-domain@31', 'power-do=
main@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scps=
ys.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: power-controller:=
 power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluat=
ed properties are not allowed ('power-domain@31', 'power-domain@32' were un=
expected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-con=
troller.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic: regulators:=
 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic: 'mt6359code=
c', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10320000:=
 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10330000:=
 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@=
14000000: $nodename:0: 'clock-controller@14000000' does not match '^syscon@=
[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mm=
sys.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@=
14000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-vppsys0'] is too short
   	'mediatek,mt8195-mmsys' was expected
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: syscon@10=
001000: compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd']=
 is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sy=
s-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: pmic: reg=
ulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: pmic: 'mt=
6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: infra-iom=
mu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [=
0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: regulator=
: 'BUCK1', 'BUCK2', 'LDO1', 'LDO2', 'LDO3', 'LDO5', 'LDO6', 'LDO7' do not m=
atch any of the regexes: '^buck[12]$', '^ldo[123567]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6360-regulat=
or.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: t-phy@11e=
30000: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)=
-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: display@1=
4f06000: clocks: [[30, 14], [30, 43], [30, 44]] is too long
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,split.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: mutex@1c1=
01000: 'clock-names', 'reg-names' do not match any of the regexes: 'pinctrl=
-[0-9]+'
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: syscon@10001000: =
compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too =
long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sy=
s-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic: regulators:=
 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic: 'mt6359code=
c', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: infra-iommu@10315=
000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, =
4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: t-phy@11e30000: '=
power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-=
9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: display@14f06000:=
 clocks: [[34, 14], [34, 43], [34, 44]] is too long
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,split.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: mutex@1c101000: '=
clock-names', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mu=
tex.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: dp-intf@1c113000:=
 power-domains: False schema does not allow [[47, 18]]

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
