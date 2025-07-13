Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A4F15B0EF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Jul 2025 18:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752430569; cv=none; b=XA0TiiddNtWYNoVYklmMxtSChOthvLStRUKtE9Ckys6txWcChh1gyYzyzAvhQ8v/OZewoew3CE76kN7JPFT6LxYXHLmDlMEwcs1EJlW7YLP4o0/AVTOVeuWpT1C4e69RmnLzeebi58uTcOWI6FbSDhTkY7PLECV4m8I6aLOKo3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752430569; c=relaxed/simple;
	bh=KCAkuWhH9UG9k7zUZsI/YbONDdjRElxY51s+5s9NO24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PGdCXNfOOQvOtDoGCwyDp3Pw4lKZntZbtouGm2aVodK0H4LEH7k4120wB63CeYMpqXiJ9grJmhl8E8lo+YWH32fw8Ur8Pvbl/mYMpK7eXCQKFg5b9D81fDYK5PTM6eiWc1bJeQxjTkKbuXUY92AEnC+zUcNcciaHqQTzRzm07jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R9B1v+RE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R9B1v+RE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752430567; x=1783966567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KCAkuWhH9UG9k7zUZsI/YbONDdjRElxY51s+5s9NO24=;
  b=R9B1v+RE540VuPFvXZFYV/GMjX+yj8CUlJwHtjZXTev+Q5mZcMMK3RAD
   NvbaKWcUcIgzeK/URJyKTkqc3Z5O4uYex/EWVi6LAGyJ2IpaTDGbKgLAV
   QHtUcOUyxSARrPhN7XFdERXmmhod19dmWENClxPkBgjnty4z6Z42DgMv0
   bgJ/oSkuqwGsI+7Ztf48I5EbVt+78DcLr9pLDNyOQHbzdmRPkA+HzOZDc
   Uy/tF325LFPcCjrOBNDnj1c2Xtl6Np7Mk5OJKhg6OPoVq7sJqhspum8Vu
   gc62nRSC9x5TBNEOhYc4vCyeoVX1x6sEf6h3I35oYS/AemSV2WpNUE83b
   A==;
X-CSE-ConnectionGUID: pwsOG3sHQKeGJhoJ5gYnPA==
X-CSE-MsgGUID: k8MtbcaBSSK/SOcczjd3yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65991972"
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="65991972"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 11:16:07 -0700
X-CSE-ConnectionGUID: 3sFdkhtbTRifcCJ+YiRdAA==
X-CSE-MsgGUID: OTFudCw5QnKjm8KGf/7q0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="162320601"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Jul 2025 11:16:06 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ub1F6-0008F5-0d;
	Sun, 13 Jul 2025 18:16:04 +0000
Date: Mon, 14 Jul 2025 02:15:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2024-07 5/5]
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: ethernet@1b100000
 (mediatek,mt7622-eth): mediatek,wed: False schema does not allow [[57],
 [58]]
Message-ID: <202507140213.uh88i4Dx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1-2024-07
head:   923188d534f2cba1fabe5b4d1e5d1e2ca134cdb1
commit: 22ecfce11034e74504b3657c668db0d64d93c05e [5/5] dt-bindings: net: mediatek: add WED binding for MT7986 eth driver
config: arm64-randconfig-051-20250708 (https://download.01.org/0day-ci/archive/20250714/202507140213.uh88i4Dx-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250714/202507140213.uh88i4Dx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507140213.uh88i4Dx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: /syscon@1b000000: failed to match any schema with compatible: ['mediatek,mt7622-ethsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: /dma-controller@1b007000: failed to match any schema with compatible: ['mediatek,mt7622-hsdma']
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: ethernet@1b100000 (mediatek,mt7622-eth): clock-names:2: 'gp1' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: ethernet@1b100000 (mediatek,mt7622-eth): clock-names:3: 'gp2' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: ethernet@1b100000 (mediatek,mt7622-eth): clock-names: ['ethif', 'esw', 'gp0', 'gp1', 'gp2', 'sgmii_tx250m', 'sgmii_rx250m', 'sgmii_cdr_ref', 'sgmii_cdr_fb', 'sgmii_ck', 'eth2pll'] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: ethernet@1b100000 (mediatek,mt7622-eth): clocks: [[18, 59], [55, 1], [55, 4], [55, 3], [55, 2], [56, 0], [56, 1], [56, 2], [56, 3], [18, 47], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: ethernet@1b100000 (mediatek,mt7622-eth): mediatek,wed: False schema does not allow [[57], [58]]
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: ethernet@1b100000 (mediatek,mt7622-eth): mediatek,pcie-mirror:0: 59 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: ethernet@1b100000 (mediatek,mt7622-eth): mac@0: 'fixed-link' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: ethernet@1b100000 (mediatek,mt7622-eth): mac@0: 'phy-handle' is a required property
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: ethernet@1b100000 (mediatek,mt7622-eth): compatible: ['mediatek,mt7622-eth', 'mediatek,mt2701-eth', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: ethernet@1b100000 (mediatek,mt7622-eth): Unevaluated properties are not allowed ('compatible', 'mediatek,pcie-mirror' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: /sgmiisys@1b128000: failed to match any schema with compatible: ['mediatek,mt7622-sgmiisys', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: /syscon@1b000000: failed to match any schema with compatible: ['mediatek,mt7622-ethsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: /dma-controller@1b007000: failed to match any schema with compatible: ['mediatek,mt7622-hsdma']
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: ethernet@1b100000 (mediatek,mt7622-eth): clock-names:2: 'gp1' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: ethernet@1b100000 (mediatek,mt7622-eth): clock-names:3: 'gp2' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: ethernet@1b100000 (mediatek,mt7622-eth): clock-names: ['ethif', 'esw', 'gp0', 'gp1', 'gp2', 'sgmii_tx250m', 'sgmii_rx250m', 'sgmii_cdr_ref', 'sgmii_cdr_fb', 'sgmii_ck', 'eth2pll'] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: ethernet@1b100000 (mediatek,mt7622-eth): clocks: [[18, 59], [55, 1], [55, 4], [55, 3], [55, 2], [56, 0], [56, 1], [56, 2], [56, 3], [18, 47], [3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: ethernet@1b100000 (mediatek,mt7622-eth): mediatek,wed: False schema does not allow [[57], [58]]
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: ethernet@1b100000 (mediatek,mt7622-eth): mediatek,pcie-mirror:0: 59 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: ethernet@1b100000 (mediatek,mt7622-eth): mac@0: 'fixed-link' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: ethernet@1b100000 (mediatek,mt7622-eth): mac@0: 'phy-handle' is a required property
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: ethernet@1b100000 (mediatek,mt7622-eth): mac@1: 'fixed-link' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: ethernet@1b100000 (mediatek,mt7622-eth): mac@1: 'phy-handle' is a required property
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: ethernet@1b100000 (mediatek,mt7622-eth): compatible: ['mediatek,mt7622-eth', 'mediatek,mt2701-eth', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: ethernet@1b100000 (mediatek,mt7622-eth): Unevaluated properties are not allowed ('compatible', 'mediatek,pcie-mirror' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: /sgmiisys@1b128000: failed to match any schema with compatible: ['mediatek,mt7622-sgmiisys', 'syscon']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
