Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B08333738
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 17:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762278934; cv=none; b=iUr2myzglaEKPMk6pwKxv8c1O3D3j1utlOgKWIGDPi4ezEGFIazrxEhrdjKEOGU9PVbdv4GUifP8BDEp7jvXuAuU8tOWSdeQaPfDSxSkPO32eWv5L37vSaKgChUif/rxrsf5z18bWUIDl/9r0dHSBb2EoYchumM+bF1k9sZ/8t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762278934; c=relaxed/simple;
	bh=Je3p5b7bDeLXTwhkcqfQVSEoBW30QGBFKJAOejgdiXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SN2tv96JZ5Qkyo0Zi6KpnFCzJ7Mw+B6OSNxrURVnf1+UxNPvOQ/Jz2VUTblvEioo2K3yetsrUl0K+ouRflpGw7ckzG+PQY0lL+BVjfqVm8RkI/Elq6xcdJN5TAvkNpsx/J5lRsyt347/qyk35SmQm0MrGFQcodqIn+YjbKbrQcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SQRXuXAs; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SQRXuXAs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762278932; x=1793814932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Je3p5b7bDeLXTwhkcqfQVSEoBW30QGBFKJAOejgdiXE=;
  b=SQRXuXAsgKOoPRGTWCtBpv0BBc5JrU8JR4zKsXNJan6tB85XtdBPO48p
   5DsrzslGC7ARdGG7jBULSPdqAd6Xmi8pID4dOH7UEeHSgKXgCFoIt27Oo
   v5GiDOe5VusFhrpC4Kh6ouX4GqI6SusQETIL20sjdf1rL5r2z5Mt+mO2j
   wtfnPezpH+pePJSQsgjVNyvWM54OJ+whhqy9KSTe5gPTlFJ+bt/EYBGU8
   f58PIBwhhEcWxGHHjg8wH9mqsfKh3+7TD1nXxWjE3fcsu/HtJD9MpGClw
   vLsIgwUmOQTLYaXizCAZZfsiGX/ZUU0GB6gaP9n3K54h1dXnkiQ5M3NhF
   g==;
X-CSE-ConnectionGUID: FHNNozLNQJStt4BqBWiBsA==
X-CSE-MsgGUID: 1CgtsoN3Q3Gnq752GyME+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="63587438"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="63587438"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 09:55:31 -0800
X-CSE-ConnectionGUID: RVS+ZbuSQsKNgMH/3+f/rg==
X-CSE-MsgGUID: 3N2BteLFS8C0dvapkqMn5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="217874914"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 04 Nov 2025 09:55:30 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vGLFg-000000002Ga-2CNr;
	Tue, 04 Nov 2025 17:55:28 +0000
Date: Tue, 4 Nov 2025 18:54:57 +0100
From: kernel test robot <lkp@intel.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [linux-next:master 774/5926]
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: pmic
 (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202511041835.qOJxLgWo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   17490bd0527f59d841168457b245581f314b5fa0
commit: e6bd92bb204757a7b1f4b4dc263a82b3985fadd3 [774/5926] arm64: dts: mediatek: add device-tree for Genio 1200 EVK UFS board
config: arm64-randconfig-2051-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041835.qOJxLgWo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.9.dev13+gc72762e0c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041835.qOJxLgWo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041835.qOJxLgWo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi:1172.7-1180.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
