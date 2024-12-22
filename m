Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F7114A088
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 06:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734849339; cv=none; b=rbtczrzrpyd/yvhFxlevGDpspQ1yDsCWE3LW/46sX4dsOGo5urdapo9n2S2TKWAv6WwiLyb9UuVp0i6v6aEfRmfwjJuRy3Xy16NG907OQIcQu5iq4joK+Z66LdtvNiIGWiiAVL+Cv0OMfcjApLHMOCbVTj2di+WeypgYPnObp2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734849339; c=relaxed/simple;
	bh=/HKf+2Q1Bkt9Kgmm/VTcdADLOGQXhGAlLaHNIPRGxy8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WsMoOvIKD5RB+VyhEX02KUI0lHMW2zAIZ9Z4Jw+EInhezk/hKH6hta24P+DP6FnZ9qAw8rm9ZUxWCkrmiA24UK8LScU9xwxi5d1cf1lYq5qy6jNVgXsix3zJHFs/33XfgX2VoE7n6VrctPCa6uAl5R5Agbk2pBSm6Qyn57gKjfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0UxsBBC; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0UxsBBC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734849336; x=1766385336;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/HKf+2Q1Bkt9Kgmm/VTcdADLOGQXhGAlLaHNIPRGxy8=;
  b=G0UxsBBCGyPziEHDlnjFOL0ti1ryiA4x310WYcpy9AbqEXvxlxGaKjjb
   Z2pT+t3xe3dbBBS0Z6NOdXUdjhL21BOaltO7mzjRl36UE8zNrtfUCTcqh
   At7lbhk6YNp+NDOONcpcq9JQvH70imKgwPlwQyKqcl0mQap9op4HIsMCZ
   JZNE/8mIXs5kZDQDHww/5wj5jMsqrlC1ZJaXQf4IMAZd+3xIlmxO6Y9Vu
   PnMSYLAQKTmyjbeSVfK73ef4wFyfH9wyj3doRBVDQ3OPhK5/IdR0WPWcA
   Ot678C16Z97A58rpeG/vhv8coa29MQ4Mhg/5xfNeBZwqIBOgtl8HoXFsW
   Q==;
X-CSE-ConnectionGUID: 2awTUgwXQeqYkBxXzTOrcA==
X-CSE-MsgGUID: stkP8Ub+TP6YpS1VAiEimg==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="34624581"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="34624581"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 22:35:33 -0800
X-CSE-ConnectionGUID: Z4Q+xjimQuGGLi8Ml56usQ==
X-CSE-MsgGUID: FnhjQ+bzRfWbAEHTGjCTug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="99298821"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Dec 2024 22:35:32 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPFYn-0002lt-2u;
	Sun, 22 Dec 2024 06:35:29 +0000
Date: Sun, 22 Dec 2024 14:35:06 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [linux-next:master 2793/5236]
 arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pmic: '#sound-dai-cells',
 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202412221438.JqS1vr5C-lkp@intel.com>
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
head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
commit: 9bc8353be720ca1f9cb6e03825929bc172e1157d [2793/5236] arm64: dts: mt=
6359: Add #sound-dai-cells property
config: arm64-randconfig-051-20241220 (https://download.01.org/0day-ci/arch=
ive/20241222/202412221438.JqS1vr5C-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20241222/202412221438.JqS1vr5C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221438.JqS1vr5C-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
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
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pmic: '#sound-dai-cells', '=
mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10320000: 'clock-na=
mes' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10330000: 'clock-na=
mes' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: jpeg-decoder@1a040000: iomm=
us: [[101, 685], [101, 686], [101, 690], [101, 691], [101, 692], [101, 693]=
] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-deco=
der.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: syscon@1000600=
0: power-controller:power-domain@15:power-domain@16:power-domain@29:power-d=
omain@30: Unevaluated properties are not allowed ('power-domain@31', 'power=
-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scps=
ys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: power-controll=
er: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Uneval=
uated properties are not allowed ('power-domain@31', 'power-domain@32' were=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-con=
troller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pmic: regulato=
rs: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pmic: '#sound-=
dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pi=
nctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@103200=
00: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@103300=
00: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: jpeg-decoder@1=
a040000: iommus: [[130, 685], [130, 686], [130, 690], [130, 691], [130, 692=
], [130, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-deco=
der.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dp-tx@1c600000=
: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dp.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: syscon@1000600=
0: power-controller:power-domain@15:power-domain@16:power-domain@29:power-d=
omain@30: Unevaluated properties are not allowed ('power-domain@31', 'power=
-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scps=
ys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: power-controll=
er: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Uneval=
uated properties are not allowed ('power-domain@31', 'power-domain@32' were=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-con=
troller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pmic: regulato=
rs: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pmic: '#sound-=
dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pi=
nctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@103200=
00: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@103300=
00: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: jpeg-decoder@1=
a040000: iommus: [[129, 685], [129, 686], [129, 690], [129, 691], [129, 692=
], [129, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-deco=
der.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dp-tx@1c600000=
: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dp.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: syscon@1000600=
0: power-controller:power-domain@15:power-domain@16:power-domain@29:power-d=
omain@30: Unevaluated properties are not allowed ('power-domain@31', 'power=
-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scps=
ys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: power-controll=
er: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Uneval=
uated properties are not allowed ('power-domain@31', 'power-domain@32' were=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-con=
troller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pmic: regulato=
rs: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pmic: '#sound-=
dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pi=
nctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@103200=
00: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@103300=
00: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: jpeg-decoder@1=
a040000: iommus: [[129, 685], [129, 686], [129, 690], [129, 691], [129, 692=
], [129, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-deco=
der.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dp-tx@1c600000=
: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dp.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: syscon@1000600=
0: power-controller:power-domain@15:power-domain@16:power-domain@29:power-d=
omain@30: Unevaluated properties are not allowed ('power-domain@31', 'power=
-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scps=
ys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: power-controll=
er: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Uneval=
uated properties are not allowed ('power-domain@31', 'power-domain@32' were=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-con=
troller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pmic: regulato=
rs: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pmic: '#sound-=
dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pi=
nctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@103200=
00: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@103300=
00: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: jpeg-decoder@1=
a040000: iommus: [[130, 685], [130, 686], [130, 690], [130, 691], [130, 692=
], [130, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-deco=
der.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dp-tx@1c600000=
: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dp.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: syscon@1000600=
0: power-controller:power-domain@15:power-domain@16:power-domain@29:power-d=
omain@30: Unevaluated properties are not allowed ('power-domain@31', 'power=
-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scps=
ys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: power-controll=
er: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Uneval=
uated properties are not allowed ('power-domain@31', 'power-domain@32' were=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-con=
troller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pmic: regulato=
rs: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pmic: '#sound-=
dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pi=
nctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@103200=
00: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@103300=
00: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: amplifier@4f: =
reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: jpeg-decoder@1=
a040000: iommus: [[128, 685], [128, 686], [128, 690], [128, 691], [128, 692=
], [128, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-deco=
der.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dp-tx@1c600000=
: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: syscon@1000600=
0: power-controller:power-domain@15:power-domain@16:power-domain@29:power-d=
omain@30: Unevaluated properties are not allowed ('power-domain@31', 'power=
-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scps=
ys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: power-controll=
er: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Uneval=
uated properties are not allowed ('power-domain@31', 'power-domain@32' were=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-con=
troller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pmic: regulato=
rs: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pmic: '#sound-=
dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pi=
nctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@103200=
00: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@103300=
00: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: amplifier@4f: =
reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: jpeg-decoder@1=
a040000: iommus: [[127, 685], [127, 686], [127, 690], [127, 691], [127, 692=
], [127, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-deco=
der.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dp-tx@1c600000=
: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: syscon@1000600=
0: power-controller:power-domain@15:power-domain@16:power-domain@29:power-d=
omain@30: Unevaluated properties are not allowed ('power-domain@31', 'power=
-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scps=
ys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: power-controll=
er: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Uneval=
uated properties are not allowed ('power-domain@31', 'power-domain@32' were=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-con=
troller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pmic: regulato=
rs: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pmic: '#sound-=
dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pi=
nctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@103200=
00: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@103300=
00: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: amplifier@4f: =
reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: jpeg-decoder@1=
a040000: iommus: [[127, 685], [127, 686], [127, 690], [127, 691], [127, 692=
], [127, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-deco=
der.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dp-tx@1c600000=
: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: syscon@1000600=
0: power-controller:power-domain@15:power-domain@16:power-domain@29:power-d=
omain@30: Unevaluated properties are not allowed ('power-domain@31', 'power=
-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scps=
ys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: power-controll=
er: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Uneval=
uated properties are not allowed ('power-domain@31', 'power-domain@32' were=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-con=
troller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pmic: regulato=
rs: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pmic: '#sound-=
dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pi=
nctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@103200=
00: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@103300=
00: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: amplifier@4f: =
reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: jpeg-decoder@1=
a040000: iommus: [[128, 685], [128, 686], [128, 690], [128, 691], [128, 692=
], [128, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-deco=
der.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dp-tx@1c600000=
: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pmic: regulat=
ors: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pmic: '#sound=
-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'p=
inctrl-[0-9]+'
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
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: pmic: '#=
sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexe=
s: 'pinctrl-[0-9]+'
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
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: pmic: '#sou=
nd-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: =
'pinctrl-[0-9]+'
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
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: pmic: '#sou=
nd-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: =
'pinctrl-[0-9]+'
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
>> arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: pmic: '#sound-dai-cells', '=
mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
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
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic: regulators=
: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic: '#sound-da=
i-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinc=
trl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: infra-iommu@1031=
5000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798,=
 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic@34: #interr=
upt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a: Uneval=
uated properties are not allowed ('VBAT-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a: 'DBVDD=
-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a: 'LDO1-=
IN-supply' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic: regulato=
rs: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic: '#sound-=
dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pi=
nctrl-[0-9]+'
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
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: edp-tx@1c50000=
0: 'aux-bus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: dp-tx@1c600000=
: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dp.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic: regulato=
rs: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic: '#sound-=
dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pi=
nctrl-[0-9]+'
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
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: edp-tx@1c50000=
0: 'aux-bus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: dp-tx@1c600000=
: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediate=
k,dp.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic: regulato=
rs: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic: '#sound-=
dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pi=
nctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: infra-iommu@10=
315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 79=
8, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic@34: #inte=
rrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a: Unev=
aluated properties are not allowed ('VBAT-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a: 'DBV=
DD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a: 'LDO=
1-IN-supply' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: pmic: regulators: 'compati=
ble' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: pmic: '#sound-dai-cells', =
'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: infra-iommu@10315000: inte=
rrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0=
, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: pmic: regulators=
: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: pmic: '#sound-da=
i-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinc=
trl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: infra-iommu@1031=
5000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798,=
 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
--
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pinctrl@10005000:=
 'pcie-default' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]=
+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-=
pinctrl.yaml#
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
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic: '#sound-dai=
-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinct=
rl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10320000:=
 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10330000:=
 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: jpeg-decoder@1a04=
0000: iommus: [[118, 685], [118, 686], [118, 690], [118, 691], [118, 692], =
[118, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-deco=
der.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: pmic: reg=
ulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: pmic: '#s=
ound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes=
: 'pinctrl-[0-9]+'
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
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3016.17-3073.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3090.17-3126.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic: regulators:=
 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic: '#sound-dai=
-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinct=
rl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: infra-iommu@10315=
000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, =
4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
