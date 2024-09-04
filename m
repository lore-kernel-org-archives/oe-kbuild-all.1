Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D1D1372
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Sep 2024 23:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725490853; cv=none; b=coDqlrDA0eK3c9Q9d9SvohxOQR8AwNTw3BXTy8AKsZ8o8UelH+lxC+hnahvMc383MhNoW0qqwjF8bxmyGmXVT9Q9AQrIgSyBdQTFHHcf8Bu6wNk/9bl1f3Itb3zYtSyRkr2dQv7o6r3SdGtfHfHAGDWsY9SVpZeuOW3f6ycX8H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725490853; c=relaxed/simple;
	bh=DcRWwHmwc2jLjP0jYGgQiMaqTeAXQB/wLPJkrwNab+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rzcIn6034r8zsQh42QzXb/0oGfrErFn4zipE8w54Jzp5Mm+LRmRWdvf6Kyo9JoEbFUvRRCbaOtP57SOuqYILgEIAjIooVgcIeT4OvGFMqzc54T9MBpzLqAKr8GdwxeXlALHY+G9PTFu0q1t8Ugz26r55+ViDZ7Mfl4kxq8cUI9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gatUVUCG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gatUVUCG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725490849; x=1757026849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DcRWwHmwc2jLjP0jYGgQiMaqTeAXQB/wLPJkrwNab+k=;
  b=gatUVUCG2y5+BbDCXM+2871imvoH3tVbD3NTktM/ElqR7TYC0Y0Gp77w
   2uHDjYQr9RfMLAawrZyz7ffnUVIlq9rpnJPtgSO13tRWYkPQBLNFykjzt
   /5NuVRwYjlxud/iudlMwP3fKpVUkqV9WPdgdysq7E8Aa5jxPSlKvuRBl0
   ztySycwx88rBJNSLE5xtATXBoXlRZRzzukad9/jk8hEW/XT59uO1ZsIni
   ONtWBV73bjQuWvAj4LPNHZ68lwPBhZiv1f/Z0lv4NGHmlKmEBiD/M8b+C
   1Yi7EFQ51L7HO0v8O3kj2+U8ll3AVHPoYnpTr7hXucN4Z9JPG0pI/9YGf
   g==;
X-CSE-ConnectionGUID: 11xoUj+eS5+TaIID6dqs/Q==
X-CSE-MsgGUID: V3E7lawrTZahskxKXxyrVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24042293"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="24042293"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 16:00:49 -0700
X-CSE-ConnectionGUID: g0WCqxnEQ32UrIDy6sWyjA==
X-CSE-MsgGUID: k1RYvwGaTH+1aLPIh6XY1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="65741540"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Sep 2024 16:00:46 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slyzU-0008fX-0j;
	Wed, 04 Sep 2024 23:00:44 +0000
Date: Thu, 5 Sep 2024 07:00:15 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [linux-next:master 8381/9291]
 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: video@e6ef0000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202409050640.w9ZofQpJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Niklas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fdadd93817f124fd0ea6ef251d4a1068b7feceba
commit: 8c07e11916ffcfa29c300cf45ebd868ee15f18fc [8381/9291] arm64: dts: renesas: r8a779g0: Add family fallback for VIN IP
config: arm64-randconfig-051-20240904 (https://download.01.org/0day-ci/archive/20240905/202409050640.w9ZofQpJ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409050640.w9ZofQpJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409050640.w9ZofQpJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1352.12-1362.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1381.12-1391.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1410.12-1420.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1439.12-1449.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1468.12-1478.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1497.12-1507.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1526.12-1536.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1555.12-1565.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2238.12-2248.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: video@e6ef0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: video@e6ef1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: video@e6ef2000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: video@e6ef3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: video@e6ef4000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: video@e6ef5000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: video@e6ef6000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: video@e6ef7000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: video@e6ef8000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: video@e6ef9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: video@e6efa000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: video@e6efb000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: video@e6efc000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: video@e6efd000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: video@e6efe000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: video@e6eff000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
--
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1352.12-1362.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1381.12-1391.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1410.12-1420.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1439.12-1449.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1468.12-1478.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1497.12-1507.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1526.12-1536.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1555.12-1565.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2238.12-2248.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: video@e6ef0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: video@e6ef1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: video@e6ef2000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: video@e6ef3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: video@e6ef4000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: video@e6ef5000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: video@e6ef6000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: video@e6ef7000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: video@e6ef8000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: video@e6ef9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: video@e6efa000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: video@e6efb000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: video@e6efc000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: video@e6efd000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: video@e6efe000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: video@e6eff000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
--
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1352.12-1362.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1381.12-1391.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1410.12-1420.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1439.12-1449.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1468.12-1478.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1497.12-1507.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1526.12-1536.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1555.12-1565.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2238.12-2248.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: video@e6ef0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: video@e6ef1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: video@e6ef2000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: video@e6ef3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: video@e6ef4000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: video@e6ef5000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: video@e6ef6000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: video@e6ef7000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: video@e6ef8000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: video@e6ef9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: video@e6efa000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: video@e6efb000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: video@e6efc000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: video@e6efd000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: video@e6efe000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: video@e6eff000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
--
   arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: /soc/i2c@e6500000/codec@1a: failed to match any schema with compatible: ['dlg,da7212']
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: video@e6ef0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: video@e6ef1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: video@e6ef2000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: video@e6ef3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: video@e6ef4000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: video@e6ef5000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: video@e6ef6000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: video@e6ef7000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: video@e6ef8000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: video@e6ef9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: video@e6efa000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: video@e6efb000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: video@e6efc000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: video@e6efd000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: video@e6efe000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: video@e6eff000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779g0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779g0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
