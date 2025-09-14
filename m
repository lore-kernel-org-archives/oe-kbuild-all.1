Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484242475CF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Sep 2025 11:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757849273; cv=none; b=OS7CEES7wHLt6scP22V3Izukmafx1trJYTv67nqpdVeUVJm5MguZvgbxWU4Uu9tSBWxg2SVfpcquEi8dTKgTAmA6fHeTMxDF5lRh1qaZsIGqZjbIQ1b0nnJMdZ+0+ckm4jzQq7VlStF8Bw+WzAF1t71i9AMPZ0u6l3fWFatkAqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757849273; c=relaxed/simple;
	bh=PXfTRY9RJkQx3ZxizTnsn/mRFPJ96l2AyeLMZifqmJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rhy0DflbHEq+lU+ERPar+k5FXWytBciU12vSi2ylIoP4Cs95L3dWk5oIKSlGTueZK6P+UA5zlrthVqH1bpNDEInmjojj6z4f0j2vimxtRB5yuFvkTGTBaxVWJfmSHaV7dlZ79WDTi/9N3EZg218wIIYR5x5Jjnj7IwDsIhB82ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g/edQqI8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g/edQqI8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757849271; x=1789385271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PXfTRY9RJkQx3ZxizTnsn/mRFPJ96l2AyeLMZifqmJA=;
  b=g/edQqI8WF9wCucJg5w6NBrBh0y2rAKG3KFFqWTDgdqfAoPlgpTOSXZD
   21uzvPZ6svuAEvhiDRqCKETqjY8nGOVKSops6JKFUnM4RRJomJG7mt7rG
   /PppdvK2GRoRUZhKh76m1tJeNZ5D9QjdlxRAsmFNdFbr781UibB/I6d44
   wxIo+jxnrxH5y0ep9cwWc//tJEJPi1mqpYStNLPMb3PKT4+yhhe+CaL2d
   N2LqkcJLJ0SL9kCAre30cKt0yxvfkx826ES6EokJSSqu1GU190A/N4gD3
   1f1w7jhjpNdA/enmByzC1J37TeG/DP6w88m4gKRSfoMK936qbndSzViWU
   g==;
X-CSE-ConnectionGUID: I0DOzASpR9eDXJY+5EW1FA==
X-CSE-MsgGUID: JfVQWT33RHeBiK/ZZHtbzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11552"; a="71550839"
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="71550839"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 04:27:51 -0700
X-CSE-ConnectionGUID: ejaDQrRjQYyd2K9OofVxFg==
X-CSE-MsgGUID: gJ1LdCIGTWq3VLPPV4e8Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="174458951"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 14 Sep 2025 04:27:49 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxktX-0002LY-0q;
	Sun, 14 Sep 2025 11:27:47 +0000
Date: Sun, 14 Sep 2025 19:27:07 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.17-r4lite 101/104]
 arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pcie@11290000
 (mediatek,mt7988-pcie): Unevaluated properties are not allowed ('compatible'
 was unexpected)
Message-ID: <202509141938.tDvbRpXk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.17-r4lite
head:   d845dce6a3e1a5a8793a804f1307b71499b1e27e
commit: 6bb765fe24ef67aa5d7934e9f18bea1259ad3d89 [101/104] arm64: dts: mt7987-bpi-r4lite: change to 2 pcie per default and change 1pcie2L overlay
config: arm64-randconfig-051-20250914 (https://download.01.org/0day-ci/archive/20250914/202509141938.tDvbRpXk-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250914/202509141938.tDvbRpXk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509141938.tDvbRpXk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pcie@11290000 (mediatek,mt7988-pcie): clock-names: ['pl_250m', 'tl_26m', 'peri_26m', 'top_133m', 'pextp_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pcie@11290000 (mediatek,mt7988-pcie): clocks: [[22, 66], [22, 64], [22, 70], [22, 68], [4, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pcie@11290000 (mediatek,mt7988-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7988-pcie', 'mediatek,mt7988-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7988-pcie' is not one of ['mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pcie@11290000 (mediatek,mt7988-pcie): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/pcie@11290000: failed to match any schema with compatible: ['mediatek,mt7988-pcie', 'mediatek,mt7988-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/pcie@11290000: failed to match any schema with compatible: ['mediatek,mt7988-pcie', 'mediatek,mt7988-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pcie@11290000 (mediatek,mt7988-pcie): compatible: ['mediatek,mt7988-pcie', 'mediatek,mt7988-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8192-pcie'] has non-unique elements
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pcie@0,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pcie@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pcie@0,0: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pcie@0,0: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/topmisc@10021000: failed to match any schema with compatible: ['mediatek,mt7987-topmisc', 'syscon', 'mediatek,mt7987-power-controller']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/topmisc@10021000: failed to match any schema with compatible: ['mediatek,mt7987-topmisc', 'syscon', 'mediatek,mt7987-power-controller']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: efuse@11d30000 (mediatek,efuse): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,efuse'] is too short
   	'mediatek,mt8188-efuse' was expected
   	'mediatek,mt8186-efuse' was expected
   	'mediatek,efuse' is not one of ['mediatek,mt8186-efuse', 'mediatek,mt8188-efuse']
   	'mediatek,efuse' is not one of ['mediatek,mt7622-efuse', 'mediatek,mt7623-efuse', 'mediatek,mt7981-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt7988-efuse', 'mediatek,mt8173-efuse', 'mediatek,mt8183-efuse', 'mediatek,mt8192-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt8516-efuse']
   	'mediatek,mt8173-efuse' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
