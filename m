Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F14918B477
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 08:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739608282; cv=none; b=c9LpXoZHVcAPt4Fmu64vj7P73VVEn/rRYd44w2v8cI62TzbudYsjV+85XW8xU2BP2ZrX5EP3KggnHFS+PfLVYizjNXM8pkAkevglQK9khwryIMBpNmV79D6UGjNqWBgqtS/yjfsCUdl9yTzRWDJaDWhH5CQFrEqOX+Aw8AFrnsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739608282; c=relaxed/simple;
	bh=J4VZKuaITuDiZNP93mj5on08Py8S5Yf7Lvx6KxjqNEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J5sxk5+ShpGqg28VAWrqobr19oTKLTGR14/Hi+iFHofj3xsfOfi/rcBU75HyM1uO4b1CV1Hnzq9Wgj9CChMPT4pCcIfo12auvs2etST6HVMf0rz/7LWcq12xOBkLaw8QkJrv4iNX1hCnLM1teF1unwgbpWBP2/DY26DC5H68iVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=byIsGJnS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="byIsGJnS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739608279; x=1771144279;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J4VZKuaITuDiZNP93mj5on08Py8S5Yf7Lvx6KxjqNEQ=;
  b=byIsGJnSryCWjO3OawhmG3CSY7Hm9iQ03mVmgKR7+eWGKlaoJRhVDGo9
   6KCkgIdFRzSeizlzy0y+pbAqzAuajzskGbjVL+WcCqw/1fQEZ2bk3GuCl
   0DjRKjcACIJr/DJSmneYM/JAVU3wAr2Tn6cEeYdhIlylwagW2FLlL7ZTQ
   aHVzD8Jmw7dTx59qUXJEGGEVsGH5v3DcpypTRzA3hn0HhKjg5W62VGr/j
   lrKrAxLj+U4D6dD4j0BfEi+M/FHFAQaIhhApWQQ4A57m01SO7O84L2u1C
   9qUwWcpFNWKa76Sl8MtjC61sXTBRhSf97zoVkKS2Bh4sH6weKV5JJwEsV
   A==;
X-CSE-ConnectionGUID: ELUxUaYBS9SRPG5+4SohyQ==
X-CSE-MsgGUID: 0wDL4vFzTE2cLFSXAf/omQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="44289021"
X-IronPort-AV: E=Sophos;i="6.13,288,1732608000"; 
   d="scan'208";a="44289021"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 00:31:18 -0800
X-CSE-ConnectionGUID: lnFb70/ZTQ6LmxjV3jyjbg==
X-CSE-MsgGUID: xi8Ce5ruS8Wggg5sxUByLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136885510"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Feb 2025 00:31:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjDZz-001AdN-0Y;
	Sat, 15 Feb 2025 08:31:15 +0000
Date: Sat, 15 Feb 2025 16:31:08 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 3160/3437]
 arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dsc@1c009000: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202502151653.dVuop3ah-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0ae0fa3bf0b44c8611d114a9f69985bf451010c3
commit: e85ea9c7cd5af46047ea815df8aef2d3ef842540 [3160/3437] arm64: dts: mediatek: mt8188: Add VDO0's DSC and MERGE block nodes
config: arm64-randconfig-051-20250213 (https://download.01.org/0day-ci/archive/20250215/202502151653.dVuop3ah-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502151653.dVuop3ah-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502151653.dVuop3ah-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: jpeg-decoder@1a040000: iommus: [[102, 685], [102, 686], [102, 690], [102, 691], [102, 692], [102, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dsc@1c009000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/dsc@1c009000: failed to match any schema with compatible: ['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: jpeg-decoder@1a040000: iommus: [[131, 685], [131, 686], [131, 690], [131, 691], [131, 692], [131, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dsc@1c009000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/dsc@1c009000: failed to match any schema with compatible: ['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: jpeg-decoder@1a040000: iommus: [[130, 685], [130, 686], [130, 690], [130, 691], [130, 692], [130, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dsc@1c009000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/dsc@1c009000: failed to match any schema with compatible: ['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: jpeg-decoder@1a040000: iommus: [[130, 685], [130, 686], [130, 690], [130, 691], [130, 692], [130, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dsc@1c009000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/dsc@1c009000: failed to match any schema with compatible: ['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: jpeg-decoder@1a040000: iommus: [[131, 685], [131, 686], [131, 690], [131, 691], [131, 692], [131, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dsc@1c009000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/dsc@1c009000: failed to match any schema with compatible: ['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: amplifier@4f: reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: jpeg-decoder@1a040000: iommus: [[129, 685], [129, 686], [129, 690], [129, 691], [129, 692], [129, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dsc@1c009000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/dsc@1c009000: failed to match any schema with compatible: ['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: amplifier@4f: reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: jpeg-decoder@1a040000: iommus: [[128, 685], [128, 686], [128, 690], [128, 691], [128, 692], [128, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dsc@1c009000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/dsc@1c009000: failed to match any schema with compatible: ['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: amplifier@4f: reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: jpeg-decoder@1a040000: iommus: [[128, 685], [128, 686], [128, 690], [128, 691], [128, 692], [128, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dsc@1c009000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/dsc@1c009000: failed to match any schema with compatible: ['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: amplifier@4f: reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: jpeg-decoder@1a040000: iommus: [[129, 685], [129, 686], [129, 690], [129, 691], [129, 692], [129, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dsc@1c009000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/dsc@1c009000: failed to match any schema with compatible: ['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: jpeg-decoder@1a040000: iommus: [[123, 685], [123, 686], [123, 690], [123, 691], [123, 692], [123, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: dsc@1c009000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: /soc/dsc@1c009000: failed to match any schema with compatible: ['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: jpeg-decoder@1a040000: iommus: [[125, 685], [125, 686], [125, 690], [125, 691], [125, 692], [125, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: dsc@1c009000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/dsc@1c009000: failed to match any schema with compatible: ['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
