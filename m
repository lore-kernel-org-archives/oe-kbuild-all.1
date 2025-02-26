Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D341B258CC0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 08:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740558110; cv=none; b=rQ9EEPo4FVBFtMIG27eHedV9bH5TPj8Ll0RDHHyP2eSWNVFztsbbvNk22O9CMMqjG0momqwSiZzvdCPK4QvwHc/DfL43EFP0+QgqCpLASHT9NKq8bBfdpW/9Ek5e1RRvtQYk1HGGQ1LGYC343MkDTvInGEEY54VMngrMMJC6Ifo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740558110; c=relaxed/simple;
	bh=8cygKt85t9jJweD2/ETqtLexypRHTzH5d6za0zFRS/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qurlj/xs9US46/TWSkhH6XtDTAn/XAEqieaRKbHWgljTZTg4pkKWj39p02SGe7fFoWSGVzuNbuh27Yte3KrMZi0deCu31ivcbVToR6JwbuhVniejcq1qprSSCJoK38ld3LVc2BoYD81HVMnNDTx/h3ZN3XBj5jTelaFSKGEyRFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyRSY482; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyRSY482"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740558108; x=1772094108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8cygKt85t9jJweD2/ETqtLexypRHTzH5d6za0zFRS/M=;
  b=cyRSY482s1qvVnQpYbhQ5LoIrZlgAIiIJQQB0rxj1DT9JBbnzzddSwUC
   b8+BHCqTQuEjTGAyUCMbGgrOfygyADM9sA3A8kPEX9F6G2lVtWICCMQnn
   KhAM1eBlk8tz34IZadjjTiMzr0COorylRwmNYg8+aATnGiat5EDzxo+Li
   jVJgwDsZ8p85yM8lIEhwb6/Vd9qbPvleU52ZcRVFimTo7L3ywbhfNzDSu
   e1hEVPQi4n785L6PU3ZjBi0+Tf3567hBRGfdoqhbjPkrpDEK2nzaxqBT+
   aX3N3dHnO/X/MImtAJZ6uPL5w3DOBmB6KlLG4pjXVwLJI0oEOkLQyejN+
   w==;
X-CSE-ConnectionGUID: nCKrqzpbS0mezsG1KGBK/w==
X-CSE-MsgGUID: U4hYMRVEQHiv+8MXeA6lmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="52029342"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="52029342"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 00:21:47 -0800
X-CSE-ConnectionGUID: x9AAlnqPQSe/IkEddgLbng==
X-CSE-MsgGUID: m4gHsdbySwq+hWbIrfondw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147546699"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 26 Feb 2025 00:21:46 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnCfj-000BP3-10;
	Wed, 26 Feb 2025 08:21:40 +0000
Date: Wed, 26 Feb 2025 16:20:47 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 5787/6192]
 arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: rt1715@4e:
 'vbus-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202502261612.r4NoInUq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0226d0ce98a477937ed295fb7df4cc30b46fc304
commit: 5fef91c267c150cb030808e219aa14f2be3f16dc [5787/6192] arm64: dts: mediatek: mt8390-genio-700: Add USB, TypeC Controller, MUX
config: arm64-randconfig-051-20250225 (https://download.01.org/0day-ci/archive/20250226/202502261612.r4NoInUq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502261612.r4NoInUq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502261612.r4NoInUq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pinctrl@10005000: 'pcie-default' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic: '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: rt1715@4e: 'vbus-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/richtek,rt1711h.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: jpeg-decoder@1a040000: iommus: [[137, 685], [137, 686], [137, 690], [137, 691], [137, 692], [137, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: dsc@1c009000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: /soc/dsc@1c009000: failed to match any schema with compatible: ['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pinctrl@10005000: 'pcie-default' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic: '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: rt1715@4e: 'vbus-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/richtek,rt1711h.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: jpeg-decoder@1a040000: iommus: [[139, 685], [139, 686], [139, 690], [139, 691], [139, 692], [139, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: dsc@1c009000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/dsc@1c009000: failed to match any schema with compatible: ['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
