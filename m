Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF4820328
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 14:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739024947; cv=none; b=W4Ec4f1w58D/TkR2AKKFFFalwsRUHBEcb5khn2PRzxNiSHSyyoIou/ToiEDMnpi8d8bbBC8y+kCPGDPlJvul08RS6aROW+505N3NaYJIuCAZ5r89d6plmnU4Qxz/vvMK1dl1dHsxOJ0p8LPN2BLJqgwRLmKa7GXmKd+VnHoeSI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739024947; c=relaxed/simple;
	bh=bCsBq7OLFzNRKKc8aQO+w5SuYDZ8q275ScDKlIz60jE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ygh/m9WaQwjN3/goXh1NXc1vSFwPilfXfxZTR2lgGIxg7unPC2CjD7Lutu0RxV1ReMrU/FO/M7GT33Owd7Tj0F4Xf9VymDmsDYVQLLSz8ZwISuV9/1UWWh98XrkR/WkBs6lrtdxQjY8zSwkpbCrHtPf0Y/1JtGS+hRh6jwH30Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LLMmmpBS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LLMmmpBS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739024946; x=1770560946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bCsBq7OLFzNRKKc8aQO+w5SuYDZ8q275ScDKlIz60jE=;
  b=LLMmmpBSVVL8E4jiTJNOVR3j5QdEdZ6bHVNAwQ4RHI5kU6X2wsX+VKLj
   KspOc6cFUtbgW5gRFJRhxeuz72+XkirVpBJSvHM4na4ByF+1b/SANVmaN
   j1C+zy8ySpZQ4L6Lo69wHY1RKPUFvmXPh150j4YI/creBR/beg7vDxp5t
   18bmK+OL4BOu/Fif9qniDSX6u3QOu/xbcPjI1oI93YcYk2aCQTf0G6/4L
   6Bn+/f8zlJIFFG0NFa+54S4OHI6mihPkxXllfv87itvnqmVtjp3tdf9ZS
   WEyA84e3He/g7CgHVGgPflsOOi7JiQ8I9pNgvRcpIRN7iRObVFfDs3fZA
   A==;
X-CSE-ConnectionGUID: +8NkQq6JSTOigFqSXASZaA==
X-CSE-MsgGUID: ZO0a04lNSgCRAk9w4wM6tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="43419545"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="43419545"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 06:29:05 -0800
X-CSE-ConnectionGUID: kasfZqTaTXGt5AVeNC9heA==
X-CSE-MsgGUID: HFviub4cTUmLQXwQ5U8wOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148979924"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Feb 2025 06:29:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tglpN-00104R-2o;
	Sat, 08 Feb 2025 14:29:01 +0000
Date: Sat, 8 Feb 2025 22:28:24 +0800
From: kernel test robot <lkp@intel.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [linux-next:master 1921/2219]
 arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb:
 jpeg-decoder@1a040000: iommus: [[123, 685], [123, 686], [123, 690], [123,
 691], [123, 692], [123, 693]] is too long
Message-ID: <202502082233.ZOd8nse1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ed58d103e6da15a442ff87567898768dc3a66987
commit: 3ac908716b8297d3ba6c6010104065517ec341a8 [1921/2219] arm64: dts: mediatek: add device-tree for Genio 510 EVK board
config: arm64-randconfig-051-20250207 (https://download.01.org/0day-ci/archive/20250208/202502082233.ZOd8nse1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082233.ZOd8nse1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082233.ZOd8nse1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pinctrl@10005000: 'pcie-default' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic: regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: jpeg-decoder@1a040000: iommus: [[123, 685], [123, 686], [123, 690], [123, 691], [123, 692], [123, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
