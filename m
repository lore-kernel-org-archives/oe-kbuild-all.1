Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2A12147E8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 18:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739988558; cv=none; b=bFktTnLb8nF9Cst7W9LHUmrUF5L1ROAC7DZXq4GAQc+kEgnU3T3b99QbPEEFFv2YWsh5PrrQDt6dzZsWUHY7/gKEaS1Vv0+l+LbhWNUixuJMISJ01sTPZ2GV9Kq8u68W+8fkzSgXJ+HWXQH2ypFd2D3zIDu1VAU1/NwFjdYnhKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739988558; c=relaxed/simple;
	bh=VMhW7e1BKPK2grpLVsjGjGkABx164fYb1LI9+eGKPrU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rFkdTm1O2bC7d61LLH+5kCND3nNMW6DIdhGpJX6HcQQm17y06IvEM5djtSt1X42v9c65RphqSBvLi/g4cOnhviPQ87Wj4rD+Xc1Phkh6+RmWkT/vUhhDBXAqxFWKIQJoG53QDFnH7Pj7uNzara3hXDUmcvtAmxcmOf6fYFH8F6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PjGLPsrs; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PjGLPsrs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739988555; x=1771524555;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VMhW7e1BKPK2grpLVsjGjGkABx164fYb1LI9+eGKPrU=;
  b=PjGLPsrsi1sHY7OXYOF0eH4tsTGPmDkMQXoXPRmSzyEEo4+2GYrIxwcq
   6xdFPD7udWHivOTwxAV1b4ICWHnQiUiu4HcV7n+F+YrpAvJu2PGli14rS
   tnA2ZGOJcMq//ppK/HYY7IVAF87ciDvGoHtbo8hIa81SoOD4S7/SZ/u3l
   vHR/jK1EFsFH1nnGQHpbttdH9HoR5//wiymqad5lhwaADVUYaiUy6NQ5n
   40rgOPnPpczSYME/ULWMwXC/r/P1JQyEZFDnjnwI/G8dviBWClNjAG6x8
   mf6Nj7EjYAP/FR+OLYF2NJJaNsffMdkXuAB4FY0juRs69x5boWGoa1xGI
   g==;
X-CSE-ConnectionGUID: hwz/pTjZRK+gnpb4l2hhYA==
X-CSE-MsgGUID: bJIyoUj5QdmgM2W0t6vg7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44509692"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="44509692"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 10:09:15 -0800
X-CSE-ConnectionGUID: PLttjjamSt6SMNS5+edUGQ==
X-CSE-MsgGUID: 37BFqCkHRt2FTNpi/HWvIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114642673"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 19 Feb 2025 10:09:13 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkoVT-0003HT-10;
	Wed, 19 Feb 2025 18:09:11 +0000
Date: Thu, 20 Feb 2025 02:09:08 +0800
From: kernel test robot <lkp@intel.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [linux-next:master 4085/4901]
 arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pmic: '#sound-dai-cells',
 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202502200221.heHbuwgU-lkp@intel.com>
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
head:   8936cec5cb6e27649b86fabf383d7ce4113bba49
commit: 76b35f59bbe66d3eda8a98021bc01f9200131f09 [4085/4901] arm64: dts: me=
diatek: mt6359: fix dtbs_check error for audio-codec
config: arm64-randconfig-051-20250219 (https://download.01.org/0day-ci/arch=
ive/20250220/202502200221.heHbuwgU-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910=
be4ff90d7d07bd4518ea03b85c0974672bf9c)
dtschema version: 2025.2
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250220/202502200221.heHbuwgU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502200221.heHbuwgU-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pmic: regulators: 'compatib=
le' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pmic: '#sound-dai-cells', '=
mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
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
us: [[102, 685], [102, 686], [102, 690], [102, 691], [102, 692], [102, 693]=
] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-deco=
der.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dsc@1c009000: compatible: '=
oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pmic: regulato=
rs: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pmic: '#sound-=
dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
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
a040000: iommus: [[131, 685], [131, 686], [131, 690], [131, 691], [131, 692=
], [131, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-deco=
der.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dsc@1c009000: =
compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pmic: regulato=
rs: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pmic: '#sound-=
dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
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
a040000: iommus: [[130, 685], [130, 686], [130, 690], [130, 691], [130, 692=
], [130, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-deco=
der.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dsc@1c009000: =
compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pmic: regulato=
rs: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pmic: '#sound-=
dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
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
a040000: iommus: [[130, 685], [130, 686], [130, 690], [130, 691], [130, 692=
], [130, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-deco=
der.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dsc@1c009000: =
compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pmic: regulato=
rs: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pmic: '#sound-=
dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
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
a040000: iommus: [[131, 685], [131, 686], [131, 690], [131, 691], [131, 692=
], [131, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-deco=
der.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dsc@1c009000: =
compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pmic: regulato=
rs: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pmic: '#sound-=
dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
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
a040000: iommus: [[129, 685], [129, 686], [129, 690], [129, 691], [129, 692=
], [129, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-deco=
der.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dsc@1c009000: =
compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pmic: regulato=
rs: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pmic: '#sound-=
dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
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
a040000: iommus: [[128, 685], [128, 686], [128, 690], [128, 691], [128, 692=
], [128, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-deco=
der.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dsc@1c009000: =
compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pmic: regulato=
rs: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pmic: '#sound-=
dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
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
a040000: iommus: [[128, 685], [128, 686], [128, 690], [128, 691], [128, 692=
], [128, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-deco=
der.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dsc@1c009000: =
compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pmic: regulato=
rs: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pmic: '#sound-=
dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
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
a040000: iommus: [[129, 685], [129, 686], [129, 690], [129, 691], [129, 692=
], [129, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-deco=
der.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dsc@1c009000: =
compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pmic: regulat=
ors: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pmic: '#sound=
-dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
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
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: pmic: regul=
ators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: pmic: '#sou=
nd-dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
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
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: pmic: regulators: 'compatib=
le' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: pmic: '#sound-dai-cells', '=
mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
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
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3013.17-3070.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3087.17-3123.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic: regulators=
: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic: '#sound-da=
i-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
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
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3013.17-3070.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3087.17-3123.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic: regulato=
rs: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic: '#sound-=
dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: infra-iommu@10=
315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 79=
8, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic@34: #inte=
rrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: codec@1a: 'DBV=
DD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: codec@1a: 'LDO=
1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: edp-tx@1c50000=
0: Unevaluated properties are not allowed ('aux-bus' was unexpected)
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3013.17-3070.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3087.17-3123.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic: regulato=
rs: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic: '#sound-=
dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: infra-iommu@10=
315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 79=
8, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic@34: #inte=
rrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: codec@1a: 'DBV=
DD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: codec@1a: 'LDO=
1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: edp-tx@1c50000=
0: Unevaluated properties are not allowed ('aux-bus' was unexpected)
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3013.17-3070.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3087.17-3123.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic: regulato=
rs: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic: '#sound-=
dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
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
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3013.17-3070.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3087.17-3123.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: pmic: regulators: 'compati=
ble' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: pmic: '#sound-dai-cells', =
'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: infra-iommu@10315000: inte=
rrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0=
, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
--
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pinctrl@10005000:=
 'pcie-default' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]=
+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic: regulators:=
 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic: '#sound-dai=
-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10320000:=
 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10330000:=
 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: jpeg-decoder@1a04=
0000: iommus: [[123, 685], [123, 686], [123, 690], [123, 691], [123, 692], =
[123, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-deco=
der.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: dsc@1c009000: com=
patible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3013.17-3070.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3087.17-3123.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: pmic: regulators=
: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: pmic: '#sound-da=
i-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
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
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic: regulators:=
 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic: '#sound-dai=
-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
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
0000: iommus: [[125, 685], [125, 686], [125, 690], [125, 691], [125, 692], =
[125, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-deco=
der.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: dsc@1c009000: com=
patible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3013.17-3070.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3087.17-3123.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: pmic: reg=
ulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: pmic: '#s=
ound-dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9=
]+'
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
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3013.17-3070.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3087.17-3123.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic: regulators:=
 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic: '#sound-dai=
-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: infra-iommu@10315=
000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, =
4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
