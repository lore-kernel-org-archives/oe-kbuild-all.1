Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB0A1FCFFC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Apr 2026 05:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775108662; cv=none; b=S7KmEaWLvDH3w0yPjkTds+w9+K7fecXnVTyJqewfN/wFfMJOq09xE+Uev/MmmrchKTe6zgnVU/+Cia2S5cRbELyZsuRDY+F9WAspj9kiPSrwalKSYEQEDhXjAazia28YOAVfd2djYKfL1UsBFn4g9V9pA9iMlZl6n9IVsXcysvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775108662; c=relaxed/simple;
	bh=myCfGtxX4eE+Fd+E3gm/WtG6sdS0bOBr3vrn7Yx5+fM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F8LVPGDoKK+ElmASxZuFAavALJU41O3V1xu1iyDAnnr3uPzKPtI31xlVGda5Nv+0cyPQAZxsj8EUktS8Cjy55mjWJ9rXmexHJ33zeMYGiuew6OmZo6JTkKduYt4GQQ8d54IexRFVdIUIyDASUXacSpv3dgCBwnjWyakRL/sDCvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SRdVmD20; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SRdVmD20"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775108661; x=1806644661;
  h=date:from:to:cc:subject:message-id;
  bh=myCfGtxX4eE+Fd+E3gm/WtG6sdS0bOBr3vrn7Yx5+fM=;
  b=SRdVmD20GfRjRpBxlUDVBDTA1GgoWnjy/uhFoioc5Y7LVLw7qMP+DKfu
   kvvJJ0/51a+c9/b/hVB+FMHsqaP1vWargkoW0HAbTvFJ/rGvg3fFx6xgY
   GfTiqceqzsV13HG5htTFe6mLI6DskBv6VU5j/egyb4KX6Y1Sxcfme+0dj
   vNjZrpMG+fb/TeDTZr11szjBABESUxNfOFlmlD6mVKDKdCLFDkwVGCG7R
   lh8SUNFvwW6QoFmRqBO8sUs+vQwTmpQNKbFuPSjS6uXRazayBmVDv0S75
   sjopK7fC0VGRvS70TvYdfh+GUN3bNiWadObLRDTXw5CegBXPWzHVvlbBN
   g==;
X-CSE-ConnectionGUID: NgZ5pvoCQv214wCxvmg5Ug==
X-CSE-MsgGUID: GV/UMiZ/S3S1J1nEumdutQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="63710925"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="63710925"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 22:44:20 -0700
X-CSE-ConnectionGUID: czgJdfYsRiGooHUp6ABDsg==
X-CSE-MsgGUID: xOdmXbQWSM6sWmr0+5dUDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="227143691"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 01 Apr 2026 22:44:18 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8Aql-0000000090j-3bID;
	Thu, 02 Apr 2026 05:44:15 +0000
Date: Thu, 02 Apr 2026 07:43:29 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-r3-issue 8/8]
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: syscon@10060000
 (mediatek,mt7986-sgmiisys_0): 'rx-polarity', 'tx-polarity' do not match any
 of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202604020729.pZZsxfOk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-r3-issue
head:   0b0ec76da6e93017eb37a57fee421f9e26a9d314
commit: 0b0ec76da6e93017eb37a57fee421f9e26a9d314 [8/8] try to set the tx polarity to sgmiisys0
config: arm64-randconfig-2052-20260401 (https://download.01.org/0day-ci/archive/20260402/202604020729.pZZsxfOk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2025.13.dev11+ged7697fd8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604020729.pZZsxfOk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604020729.pZZsxfOk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: syscon@10060000 (mediatek,mt7986-sgmiisys_0): 'rx-polarity', 'tx-polarity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
--
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: syscon@10060000 (mediatek,mt7986-sgmiisys_0): 'rx-polarity', 'tx-polarity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: flash@0 (spi-nand): Unevaluated properties are not allowed ('spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml
--
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nor.dtb: syscon@10060000 (mediatek,mt7986-sgmiisys_0): 'rx-polarity', 'tx-polarity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
--
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: syscon@10060000 (mediatek,mt7986-sgmiisys_0): 'rx-polarity', 'tx-polarity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: flash@0 (spi-nand): Unevaluated properties are not allowed ('spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml
--
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nor.dtb: syscon@10060000 (mediatek,mt7986-sgmiisys_0): 'rx-polarity', 'tx-polarity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
