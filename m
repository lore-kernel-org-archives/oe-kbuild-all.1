Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BC417A2E0
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Jun 2025 05:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748757328; cv=none; b=o5fJJ0Gk74HRtveBZx1papiZgyzs5p6bPcZi0UYZSAwmvV+es+XPs6AMWmygEZXh8FAP6BIHgWHSkz+DwIe3XqfwtAric/j9NNzzvJ1KY5jKdMpLBEdoBUS+KmBN43pcm9wV8AkfW26OlS430U/ln+duu5eAeGI9lKBA2rC5W0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748757328; c=relaxed/simple;
	bh=koKONsiQym17nXDXYMpzkd5ttZP9GhAvQ6kqZX9N9aU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PpfQMLx5P3jJAUnaiccPyhZEQbxWWWFSoVEdrOGja3CEIWhFNZRELK1Q1hLZndJB8EgTkdEfI6KUCbZOO73r5FebzSOPhBL95t+lezoV5AVhoDub76qzka+xo9tzQVkKWApgtNUwg5fbmAGuuwj/0xSX8RIVOwLADrhiYjQkcuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=et3nqQf3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="et3nqQf3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748757327; x=1780293327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=koKONsiQym17nXDXYMpzkd5ttZP9GhAvQ6kqZX9N9aU=;
  b=et3nqQf3d8Im1Kq7uIUPszIl4zwTuImmwTx/7o9UfdBm3DHfsCMEMQdh
   afeod/IMo36PtfNkVxdQ6JhJnECMFhrg54gFIKtMhphJetW8PnTYDbpEI
   lar0y0/hkYu14nqh3KZ9eD2SBXzGj2/XmlYZ3mUdY3cREgS/XJl+7YUXH
   evxlEKHdUTCTaScurGvL0R94Pw+fUiNbxSc89hQy1krVe55tFgfJ2zrbZ
   +w7uj5O5lVzeTBDifK33NcpwCjexeNF2WW7HhWbcGuIXYcajtDE9VLe2q
   RTF3bFE41w4rrN9nMv0oYbxzR95LhOQY4KlsWObo5/RDx3IaTmBhmMPBN
   w==;
X-CSE-ConnectionGUID: LOwm80dCQOuY6tqbe+/vrQ==
X-CSE-MsgGUID: gLM2K4fTTPeY+uXfRRS2PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="61058938"
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="61058938"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 22:55:26 -0700
X-CSE-ConnectionGUID: 4ow33yuvSyCBaYOk7LhMOw==
X-CSE-MsgGUID: chX8lyW9Tkif9a/BYpqPtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="149023604"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 May 2025 22:55:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLbfG-000YpO-2B;
	Sun, 01 Jun 2025 05:55:22 +0000
Date: Sun, 1 Jun 2025 13:55:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-rust 2/2]
 arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: dsi@14014000
 (mediatek,mt8183-dsi): 'oneOf' conditional failed, one must be fixed:
Message-ID: <202506011335.eVvej0yT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-rust
head:   e8191d4b0877b5e3025a126ac1d08756a322d055
commit: 2b6433f30b870c7fbd172f5e1969e1df5e03cad7 [2/2] dt-bindings: display: mediatek: Add OF graph support for board path
config: arm64-randconfig-052-20250529 (https://download.01.org/0day-ci/archive/20250601/202506011335.eVvej0yT-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250601/202506011335.eVvej0yT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506011335.eVvej0yT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'pwm1', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: syscon@13000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: dsi@14014000 (mediatek,mt8183-dsi): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: dpi@14015000 (mediatek,mt8183-dpi): power-domains: False schema does not allow [[69, 7]]
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: dpi@14015000 (mediatek,mt8183-dpi): 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: thermal-sensor (murata,ncp03wf104): $nodename:0: 'thermal-sensor' does not match '^thermistor(.*)?$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
