Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFD321B185
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Apr 2026 14:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775312280; cv=none; b=cMyo/5xcIAW3XSOQSdo1DMixWbyBm9W8KpZ7I4YEBovN4RqZxclA2eKmi7SEFYiClVE6jN28jE6jpJP3Zpv9ZJfst7NTdhs+UMuJTXmGzcgR4Dnm50Cmh0dvHV7ItBoftz1HCWzg/6OoxiLBhrHytE0eYrVAp4xIzms14QLh/Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775312280; c=relaxed/simple;
	bh=tlGJCqhrNPqSFNVok5JqsfPL/sD5+5NpsjsoDkooNiw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NTizz848YBN+Y7mH0hmGQRBySviTrSYUKQa09sB6g7FhsX9qUXIEWBt0E0syaXCq1im3TeTsaW8KwFr76sHi2sGPq+GFXXk5mVq5JC0Hsa3Hx4zJUfNp2SgMZjNhMl6713JQsVNz2z4dAdpYUHq+ABcdjTrjfBjvGHybs/Sa61U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xy264R/Z; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xy264R/Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775312277; x=1806848277;
  h=date:from:to:cc:subject:message-id;
  bh=tlGJCqhrNPqSFNVok5JqsfPL/sD5+5NpsjsoDkooNiw=;
  b=Xy264R/Zcqj46vYr6JlSe/whBa1X0/3ez4flFmDWmD1YXt8aXSRqbCgV
   txnkyEyxi4GwL0vPRppHlSePQP6nm3PPotkx1iN1koUDocvm2rj3nupfQ
   ehwL7oIJ6SCW4Mps42z+PcvWXPzXwW/eEeuhlThhOnNPNFL8Qq+lGVGAB
   YJqIjO4+8hcSxnopwD2KtzQDQ52LCb0yzOg6AhZ3pM6uVbvG4umWPd1Rl
   qNZoJD5dT93MNikkcIkDd+F4XZ1P6mMxQsoBN+WENEQn8YYhCZhIDM7am
   qJGnBVsxGYr5gPzWwxglqJYFZe+yJhggKchCK1vUcEeZGApWejca3Ihgr
   w==;
X-CSE-ConnectionGUID: U874wB0ETt25PqA/k7epQg==
X-CSE-MsgGUID: Mda/1jtdQn+zvs2NJkwD/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="80227178"
X-IronPort-AV: E=Sophos;i="6.23,159,1770624000"; 
   d="scan'208";a="80227178"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 07:17:56 -0700
X-CSE-ConnectionGUID: kTPekeloTc+U8OczlibN4g==
X-CSE-MsgGUID: 35shUpVASjyke9BrpZhKZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,159,1770624000"; 
   d="scan'208";a="231520923"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 04 Apr 2026 07:17:55 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w91ou-000000009av-2HH8;
	Sat, 04 Apr 2026 14:17:52 +0000
Date: Sat, 04 Apr 2026 16:17:10 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-r3-issue 9/12]
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: switch@31
 (mediatek,mt7531): ports:port@5: Unevaluated properties are not allowed
 ('pcs' was unexpected)
Message-ID: <202604041631.kksSRvH5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-r3-issue
head:   78482df7f7d0a4b2651140befdb1af1fd480a493
commit: 4f7bce943dda614d24431d63adad65f1117a7f6d [9/12] arm64: dts: add pcs subnode for switch-cpu-ports to handle serdes polarity
config: arm64-randconfig-2051-20260404 (https://download.01.org/0day-ci/archive/20260404/202604041631.kksSRvH5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604041631.kksSRvH5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604041631.kksSRvH5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: switch@31 (mediatek,mt7531): ports:port@5: Unevaluated properties are not allowed ('pcs' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: switch@31 (mediatek,mt7531): ports:port@6: Unevaluated properties are not allowed ('pcs' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
--
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: flash@0 (spi-nand): Unevaluated properties are not allowed ('spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: switch@31 (mediatek,mt7531): ports:port@5: Unevaluated properties are not allowed ('pcs' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: switch@31 (mediatek,mt7531): ports:port@6: Unevaluated properties are not allowed ('pcs' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
--
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nor.dtb: switch@31 (mediatek,mt7531): ports:port@5: Unevaluated properties are not allowed ('pcs' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nor.dtb: switch@31 (mediatek,mt7531): ports:port@6: Unevaluated properties are not allowed ('pcs' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
--
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: flash@0 (spi-nand): Unevaluated properties are not allowed ('spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: switch@31 (mediatek,mt7531): ports:port@5: Unevaluated properties are not allowed ('pcs' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: switch@31 (mediatek,mt7531): ports:port@6: Unevaluated properties are not allowed ('pcs' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
--
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nor.dtb: switch@31 (mediatek,mt7531): ports:port@5: Unevaluated properties are not allowed ('pcs' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nor.dtb: switch@31 (mediatek,mt7531): ports:port@6: Unevaluated properties are not allowed ('pcs' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
