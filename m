Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5D82E172D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Dec 2025 21:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767216895; cv=none; b=tmLWtPMpmc9SnPmBoZBRrWJNkPz2KWQH/P0ygQRYu+Uwc+KLN1UwM0HWBX8Llo1SriiiGSuImrWXMpUk1N44NEM1YORVD65bOpAak5BlCI+/MuapXT76ANnkvxu3HaXpQMQDmFgvrWCwl7C4d5opbxnQLOOuMKjgr0koJ3xldmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767216895; c=relaxed/simple;
	bh=ESpqi0yolK7W3p3bH+Am9IVW2ENPUxfyfqLcUiJXk0g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z8zW3W9g8jgj6PynYQpr7ink232GxluNYcF9TjoDHtiHF0RVCLnvNWqdynfkG3Xy4TguwTqATA7mMf/rytz9U7VKBHvsXw/sFzxeZz9L2fnsN9vNykpIbk7EviJQqOLoXBWHgAgZDpGSdTX6JU9WibLVr1j4FpTbOcAWPumKSYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KzK4lFqb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KzK4lFqb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767216894; x=1798752894;
  h=date:from:to:cc:subject:message-id;
  bh=ESpqi0yolK7W3p3bH+Am9IVW2ENPUxfyfqLcUiJXk0g=;
  b=KzK4lFqbEk/M6+imGBL3rtQxpEjOXSUmzmqyUnPvMhXrTpZfqRoeOun0
   r9V9LZYwwcjgSjC/nRxvsxWbx9hfpJ0nRACSPaYtdpcpzX+/o7ovPX/s6
   +zd47vGlz6hSAKVEOORdJkQAGFfZkn13AySuCCfl48kfcYjPT0glIdDPe
   cYFaHhXK2FVsJr4mBcm8JqZGH3qUG5oOGPJ33elgBkDwPslUkNdgln65u
   sfuN4PrXPNbrcFv95vGPuLpHBbgJHfVUhFoQs7HgDpfCTBsgibd6n27EO
   45JssCigEsLtCuN4NLn+SWLI8nRO7k7h7OhEsMaH2BOtLO6jedF/5X4MB
   g==;
X-CSE-ConnectionGUID: RrbtBgymSB6v6LHwxyHAwQ==
X-CSE-MsgGUID: 8gVdVSVMRlWck8q1SzRPoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="72638249"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="72638249"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 13:34:53 -0800
X-CSE-ConnectionGUID: ClVTklO7RbqbEr7FuKy1vA==
X-CSE-MsgGUID: Y96vLyx+TVG2EEQCLtdwZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="232202955"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 31 Dec 2025 13:34:52 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vb3qD-0000000007D-1t6O;
	Wed, 31 Dec 2025 21:34:49 +0000
Date: Wed, 31 Dec 2025 22:34:14 +0100
From: kernel test robot <lkp@intel.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb:
 jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0',
 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes:
 '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
Message-ID: <202512312242.zEwTEjC9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9528d5c091c59b408a754a1823cf0942069867cc
commit: e6bd92bb204757a7b1f4b4dc263a82b3985fadd3 arm64: dts: mediatek: add device-tree for Genio 1200 EVK UFS board
date:   3 months ago
config: arm64-randconfig-2055-20251230 (https://download.01.org/0day-ci/archive/20251231/202512312242.zEwTEjC9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251231/202512312242.zEwTEjC9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512312242.zEwTEjC9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi:1172.7-1180.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
