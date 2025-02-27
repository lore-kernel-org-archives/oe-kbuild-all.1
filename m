Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E777553E23
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 06:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740636540; cv=none; b=bBzHEHiFNtXfNZLqRfgMNbSga8SOtV68s6S9CIViPMQFNNhT2C/+Nd3WcCkcmLFpmmGoQ7ugaxRkIb9o+M9xx4xlOrk6Fw4xjg6/Z5kT2g2el1SEjKB07uFO+h21de5yoOa0y3fQtJir9mOB6HQVcm4seD4mzC5khPyMkpVZcw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740636540; c=relaxed/simple;
	bh=vtJcdHM4Iinw9jLNqOwGstEdMualCaN0fS0NiU9TBiw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oo4vLN17vJSQBjm/4hLWZWRBWaQjO4ESAkR56ToVD2rmVp3TOlgxy5ED7jUC+kfxIb7KAgfrqz0qNkZL9O8Ra3szi9j5CPvMvS4x+VHBBudgy9mYYcOeWSITeJzKf8EEbvbuU7AqEasXD7MOjOJSSXsIgouAkoGCUib1veLHgaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D8tdNJ2F; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D8tdNJ2F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740636539; x=1772172539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vtJcdHM4Iinw9jLNqOwGstEdMualCaN0fS0NiU9TBiw=;
  b=D8tdNJ2FQmxz/FKdoVwQWTPg6lQffZEH+GQf2TBCe4SxL7BQWMOtieqH
   KT8AbySwhWZwcMnbM83UFKpNLUk8BiPWJh0Km5sEH+wKAeZO9c3w3rS+X
   8V3yWeAyxLhU2MP7SQjyCHTIapqXjRKaOVoQMR8P6jelfXDaL+lIFCitg
   FB80Ply2vJ8eUxwNshiBLPPx0PNkBc93onsNxk/YRfn80f5zEwovLso+7
   V5ev14e4dgCf/YbMcuaiw2fjt6XJKpkfeB/5oOeFuC7hwtN4s/R4O70ZH
   aBUsUds1vk7TzdbslJwzmixYSpIhO3Ssvk9Wwsin6J/Nx50WQn23Zto5u
   g==;
X-CSE-ConnectionGUID: Xa7tY6nnRW6NwZ0YsXGQVg==
X-CSE-MsgGUID: T33GVxmYSiSPE0ZOTxQIvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="29114770"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="29114770"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 22:08:58 -0800
X-CSE-ConnectionGUID: 07N9TEHfS3G34K1C1fdYPQ==
X-CSE-MsgGUID: 5FSftxhOSuCAaXIWitC6qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="154115275"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 26 Feb 2025 22:08:57 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnX4g-000Cwj-34;
	Thu, 27 Feb 2025 06:08:51 +0000
Date: Thu, 27 Feb 2025 14:08:00 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 5789/6192]
 arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb:
 /soc/dsi@1c008000/panel@0: failed to match any schema with compatible:
 ['startek,kd070fhfid078', 'himax,hx8279']
Message-ID: <202502271411.d0T7YRcQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad
commit: be06e25e3cf6056efb53a8c8cfd1aa1a1cc8fdc7 [5789/6192] arm64: dts: mediatek: mt8390-genio-common: Add Display on DSI0
config: arm64-randconfig-051-20250225 (https://download.01.org/0day-ci/archive/20250227/202502271411.d0T7YRcQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502271411.d0T7YRcQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502271411.d0T7YRcQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic: '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: rt1715@4e: 'vbus-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/richtek,rt1711h.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: jpeg-decoder@1a040000: iommus: [[138, 685], [138, 686], [138, 690], [138, 691], [138, 692], [138, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: /soc/dsi@1c008000/panel@0: failed to match any schema with compatible: ['startek,kd070fhfid078', 'himax,hx8279']
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: /soc/dsi@1c008000/panel@0: failed to match any schema with compatible: ['startek,kd070fhfid078', 'himax,hx8279']
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: dsc@1c009000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: /soc/dsc@1c009000: failed to match any schema with compatible: ['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc']
--
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic: '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: rt1715@4e: 'vbus-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/richtek,rt1711h.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: jpeg-decoder@1a040000: iommus: [[140, 685], [140, 686], [140, 690], [140, 691], [140, 692], [140, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/dsi@1c008000/panel@0: failed to match any schema with compatible: ['startek,kd070fhfid078', 'himax,hx8279']
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/dsi@1c008000/panel@0: failed to match any schema with compatible: ['startek,kd070fhfid078', 'himax,hx8279']
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: dsc@1c009000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc'] is too long
   	'mediatek,mt8188-disp-dsc' is not one of ['mediatek,mt8195-disp-dsc']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsc.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/dsc@1c009000: failed to match any schema with compatible: ['mediatek,mt8188-disp-dsc', 'mediatek,mt8195-disp-dsc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
