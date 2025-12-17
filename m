Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE60B192590
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 21:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766008202; cv=none; b=BVxkWqRgcWs9C0hzJ8DBtiDG4RO5kT4DwKrlXcY5fC44I1EVWVKxeW6JDPg+OnHXXpcYscVXwWTTl17YeZDRJOeLxI77t0Ias9OLqeMgLqp978ZnDDtv9wR8NNGU3KU6GPKVBizMpuBTKzQX3feGkaWmezEzNovTwmntDn27H90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766008202; c=relaxed/simple;
	bh=g8hvTIiYFKLGQU8/X2Uku2zYcOWYcJ+fRFMTWSwetrE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bG0mFgYIQL1EdDu2z7ZEcRAXSMppDuLQ6WRAROd5sT1e9NFS9abUJTyka17TAB0hkhL6FPMLiKA7F/NLNzhp69GmypnHVosyX5UnRle0vJlcz9rFPyS8YZlH+KQwYyJ2AeXjubrCquIWg0JBiJSYrZHvnr3XmXINeZzsbiravFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n0H328uz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0H328uz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766008200; x=1797544200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g8hvTIiYFKLGQU8/X2Uku2zYcOWYcJ+fRFMTWSwetrE=;
  b=n0H328uzjmnv0u/nTLcCINW5tbzRzthVF/xSnEgYv/qfe7ppYzFRjJxk
   qOEBQbSrcSjjpbwFCShNueHsQKnQWgdSg/eC6yzD45UfGPuRO0rdG8/o2
   1fuSVq3DfBIcrn6IjMEqCIfl7s/f7ttjkS87aWnLRsg3PQlFIBMrGKoET
   WprfAM0uwsgTc6VGZrFgNYhT3AWsNgXLBqCiVWvhsKnd4CUPnaVrVsVH8
   A4Smz9zaVN4ZPZHLMQa1bLqXvYL4dcnhp+kpjiO35pCnsKNRyUvTKOL9M
   xdywFBaEkbWWETianinCIlN65D6Dlh3IJveDT2xiuq/f3lWlLQhRZKMIo
   w==;
X-CSE-ConnectionGUID: GANcKsK2TCyq1avT6VjZpg==
X-CSE-MsgGUID: WLxf1MCRQtiM49FT7XpTyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79327399"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="79327399"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 13:49:59 -0800
X-CSE-ConnectionGUID: h7tQGMfTTvG01hVrEErcaw==
X-CSE-MsgGUID: mHEmQQqyQza0isugsXHcVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="198890016"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 17 Dec 2025 13:49:58 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVzP9-000000003gS-2zm6;
	Wed, 17 Dec 2025 21:49:55 +0000
Date: Wed, 17 Dec 2025 22:49:48 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-netnext-rss2 21/37]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10060000
 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202512172219.iVKca7NF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-netnext-rss2
head:   9f65663bfdad717c57c939e8289964fd6739884b
commit: 04a41b74aec0455f1b66569502a746f364a9db5f [21/37] arm64: dts: mt7988: re-add sgmiisys
config: arm64-randconfig-2052-20251214 (https://download.01.org/0day-ci/archive/20251217/202512172219.iVKca7NF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ecaf673850beb241957352bd61e95ed34256635f)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512172219.iVKca7NF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512172219.iVKca7NF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:667.24-688.5: Warning (unit_address_vs_reg): /soc/t-phy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:697.26-719.5: Warning (unit_address_vs_reg): /soc/xs-phy@11e10000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:667.24-688.5: Warning (simple_bus_reg): /soc/t-phy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:697.26-719.5: Warning (simple_bus_reg): /soc/xs-phy@11e10000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
--
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:667.24-688.5: Warning (unit_address_vs_reg): /soc/t-phy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:697.26-719.5: Warning (unit_address_vs_reg): /soc/xs-phy@11e10000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:667.24-688.5: Warning (simple_bus_reg): /soc/t-phy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:697.26-719.5: Warning (simple_bus_reg): /soc/xs-phy@11e10000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
