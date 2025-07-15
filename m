Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B21C248F7E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Jul 2025 16:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752596057; cv=none; b=aHSho+TzWqJn6vMCB9YPI6zS4wSDuvnPvN5Taw7ZqM4ydMzvVEP2or5CzIUyVmK+n5l1HuXx+slvaGdy7jvQibx5Rc+N/MLhjZKMIFovE0mU8V6Bd5OAYf7AojKIlDYhOlzipfU1a39tnNdmu2qwEFwwDE5xt/SGKNNjHCX4NzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752596057; c=relaxed/simple;
	bh=f10ALIWuEXTXutkD4WHuXf6g2Nhdv9snn1B7v8y1LDU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eYNybhcjbIOJkIrPGOJlzLcJG+E4vmNrFUQXuSjPrWm9Pk8OpySfr7lkNFje+lFu2ikIsS8v1xCLALJ9NxrjDKK24dOi1v9WKWjzRySPBGvz7gpPlRs0Bu8WUnmCuHktQ3Np5ldXao5b7hEhjGAPjInc1Nv/vRnQmDqFnxI4SMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gRh7Lhx0; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gRh7Lhx0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752596055; x=1784132055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f10ALIWuEXTXutkD4WHuXf6g2Nhdv9snn1B7v8y1LDU=;
  b=gRh7Lhx0ywv8aZcv2A8MNvzG8mTVUbps60v9gmjWMPjJnHmJ+lYPvzwp
   f8Ca7Sn4ldCbynt538uTK9GEKyj9u2RHRvhm1Jnend5Zo6+stwkqnxGSw
   Fw2dwXM96aF5U98JjN8JxTfSsG8ZQQFptBPDqyBpZhVFOLf4rLQfMWEqj
   m29Gspw5G1UrCM+W7LC3DeDEGC8FNWigolnx/kUSjXFxM5abNjYxgesd5
   JqgwR6GBdTf+6B6m9X6JVGwAdN7EPcyIOKo/0QwKX1C5Nrac7YHfUehEV
   nCVzagAuNiEE66GdS3IhWCccUYYJBK2dNaQWEX7W9vQCiFIBLR2/qyL1V
   w==;
X-CSE-ConnectionGUID: irnbk1BuS5iGYkA+y/YGkg==
X-CSE-MsgGUID: tOqHIhltRR2K6tXxToWNYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54970660"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="54970660"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 09:14:15 -0700
X-CSE-ConnectionGUID: pg0opFP7Sc2RvTuqf9gU/Q==
X-CSE-MsgGUID: v4ay5Qg+Sna/VkDqFfkmsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="188275082"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Jul 2025 09:14:13 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubiIE-000BJR-2W;
	Tue, 15 Jul 2025 16:14:10 +0000
Date: Wed, 16 Jul 2025 00:13:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2024-06 9/9]
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: ethernet@e6800000
 (renesas,etheravb-r8a779a0): tx-internal-delay-ps: False schema does not
 allow [2000]
Message-ID: <202507160008.zOAN1U6t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1-2024-06
head:   233cd6b58e4f649fb1ae02fb654ee3c7b0cea9f1
commit: 231c4f0bcdb2d0fa37857bb3d4600c9ba0e1319b [9/9] dt-bindings: net: renesas,etheravb: Add r8a779g0 support
config: arm64-randconfig-051-20250709 (https://download.01.org/0day-ci/archive/20250716/202507160008.zOAN1U6t-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507160008.zOAN1U6t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507160008.zOAN1U6t-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'renesas,r8a779a0-cmt1' is not one of ['renesas,r8a774a1-cmt1', 'renesas,r8a774b1-cmt1', 'renesas,r8a774c0-cmt1', 'renesas,r8a774e1-cmt1', 'renesas,r8a7795-cmt1', 'renesas,r8a7796-cmt1', 'renesas,r8a77961-cmt1', 'renesas,r8a77965-cmt1', 'renesas,r8a77970-cmt1', 'renesas,r8a77980-cmt1', 'renesas,r8a77990-cmt1', 'renesas,r8a77995-cmt1']
   	'renesas,r8a779a0-cmt1' is not one of ['renesas,r8a779a0-cmt0', 'renesas,r8a779f0-cmt0']
   	'renesas,rcar-gen2-cmt0' was expected
   	'renesas,rcar-gen2-cmt1' was expected
   	'renesas,rcar-gen3-cmt0' was expected
   	'renesas,rcar-gen4-cmt0' was expected
   	'renesas,rcar-gen4-cmt1' was expected
   	from schema $id: http://devicetree.org/schemas/timer/renesas,cmt.yaml#
   arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: can@e6660000 (renesas,r8a779a0-canfd): Unevaluated properties are not allowed ('channel2', 'channel3', 'channel4', 'channel5', 'channel6', 'channel7' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/renesas,rcar-canfd.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: ethernet@e6800000 (renesas,etheravb-r8a779a0): tx-internal-delay-ps: False schema does not allow [2000]
   	from schema $id: http://devicetree.org/schemas/net/renesas,etheravb.yaml#
   arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: ethernet@e6800000 (renesas,etheravb-r8a779a0): compatible: 'oneOf' conditional failed, one must be fixed:
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r8a7742', 'renesas,etheravb-r8a7743', 'renesas,etheravb-r8a7744', 'renesas,etheravb-r8a7745', 'renesas,etheravb-r8a77470', 'renesas,etheravb-r8a7790', 'renesas,etheravb-r8a7791', 'renesas,etheravb-r8a7792', 'renesas,etheravb-r8a7793', 'renesas,etheravb-r8a7794']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r8a774a1', 'renesas,etheravb-r8a774b1', 'renesas,etheravb-r8a774c0', 'renesas,etheravb-r8a774e1', 'renesas,etheravb-r8a7795', 'renesas,etheravb-r8a7796', 'renesas,etheravb-r8a77961', 'renesas,etheravb-r8a77965', 'renesas,etheravb-r8a77970', 'renesas,etheravb-r8a77980', 'renesas,etheravb-r8a77990', 'renesas,etheravb-r8a77995']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r9a09g011']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,r9a07g043-gbeth', 'renesas,r9a07g044-gbeth', 'renesas,r9a07g054-gbeth']
   	'renesas,etheravb-rcar-gen2' was expected
   	'renesas,etheravb-rcar-gen4' was expected
   	'renesas,etheravb-rzv2m' was expected
   	'renesas,rzg2l-gbeth' was expected
   	from schema $id: http://devicetree.org/schemas/net/renesas,etheravb.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: ethernet@e6810000 (renesas,etheravb-r8a779a0): tx-internal-delay-ps: False schema does not allow [0]
   	from schema $id: http://devicetree.org/schemas/net/renesas,etheravb.yaml#
   arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: ethernet@e6810000 (renesas,etheravb-r8a779a0): compatible: 'oneOf' conditional failed, one must be fixed:
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r8a7742', 'renesas,etheravb-r8a7743', 'renesas,etheravb-r8a7744', 'renesas,etheravb-r8a7745', 'renesas,etheravb-r8a77470', 'renesas,etheravb-r8a7790', 'renesas,etheravb-r8a7791', 'renesas,etheravb-r8a7792', 'renesas,etheravb-r8a7793', 'renesas,etheravb-r8a7794']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r8a774a1', 'renesas,etheravb-r8a774b1', 'renesas,etheravb-r8a774c0', 'renesas,etheravb-r8a774e1', 'renesas,etheravb-r8a7795', 'renesas,etheravb-r8a7796', 'renesas,etheravb-r8a77961', 'renesas,etheravb-r8a77965', 'renesas,etheravb-r8a77970', 'renesas,etheravb-r8a77980', 'renesas,etheravb-r8a77990', 'renesas,etheravb-r8a77995']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r9a09g011']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,r9a07g043-gbeth', 'renesas,r9a07g044-gbeth', 'renesas,r9a07g054-gbeth']
   	'renesas,etheravb-rcar-gen2' was expected
   	'renesas,etheravb-rcar-gen4' was expected
   	'renesas,etheravb-rzv2m' was expected
   	'renesas,rzg2l-gbeth' was expected
   	from schema $id: http://devicetree.org/schemas/net/renesas,etheravb.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: ethernet@e6820000 (renesas,etheravb-r8a779a0): tx-internal-delay-ps: False schema does not allow [0]
   	from schema $id: http://devicetree.org/schemas/net/renesas,etheravb.yaml#
   arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: ethernet@e6820000 (renesas,etheravb-r8a779a0): compatible: 'oneOf' conditional failed, one must be fixed:
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r8a7742', 'renesas,etheravb-r8a7743', 'renesas,etheravb-r8a7744', 'renesas,etheravb-r8a7745', 'renesas,etheravb-r8a77470', 'renesas,etheravb-r8a7790', 'renesas,etheravb-r8a7791', 'renesas,etheravb-r8a7792', 'renesas,etheravb-r8a7793', 'renesas,etheravb-r8a7794']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r8a774a1', 'renesas,etheravb-r8a774b1', 'renesas,etheravb-r8a774c0', 'renesas,etheravb-r8a774e1', 'renesas,etheravb-r8a7795', 'renesas,etheravb-r8a7796', 'renesas,etheravb-r8a77961', 'renesas,etheravb-r8a77965', 'renesas,etheravb-r8a77970', 'renesas,etheravb-r8a77980', 'renesas,etheravb-r8a77990', 'renesas,etheravb-r8a77995']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r9a09g011']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,r9a07g043-gbeth', 'renesas,r9a07g044-gbeth', 'renesas,r9a07g054-gbeth']
   	'renesas,etheravb-rcar-gen2' was expected
   	'renesas,etheravb-rcar-gen4' was expected
   	'renesas,etheravb-rzv2m' was expected
   	'renesas,rzg2l-gbeth' was expected
   	from schema $id: http://devicetree.org/schemas/net/renesas,etheravb.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: ethernet@e6830000 (renesas,etheravb-r8a779a0): tx-internal-delay-ps: False schema does not allow [0]
   	from schema $id: http://devicetree.org/schemas/net/renesas,etheravb.yaml#
   arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: ethernet@e6830000 (renesas,etheravb-r8a779a0): compatible: 'oneOf' conditional failed, one must be fixed:
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r8a7742', 'renesas,etheravb-r8a7743', 'renesas,etheravb-r8a7744', 'renesas,etheravb-r8a7745', 'renesas,etheravb-r8a77470', 'renesas,etheravb-r8a7790', 'renesas,etheravb-r8a7791', 'renesas,etheravb-r8a7792', 'renesas,etheravb-r8a7793', 'renesas,etheravb-r8a7794']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r8a774a1', 'renesas,etheravb-r8a774b1', 'renesas,etheravb-r8a774c0', 'renesas,etheravb-r8a774e1', 'renesas,etheravb-r8a7795', 'renesas,etheravb-r8a7796', 'renesas,etheravb-r8a77961', 'renesas,etheravb-r8a77965', 'renesas,etheravb-r8a77970', 'renesas,etheravb-r8a77980', 'renesas,etheravb-r8a77990', 'renesas,etheravb-r8a77995']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r9a09g011']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,r9a07g043-gbeth', 'renesas,r9a07g044-gbeth', 'renesas,r9a07g054-gbeth']
   	'renesas,etheravb-rcar-gen2' was expected
   	'renesas,etheravb-rcar-gen4' was expected
   	'renesas,etheravb-rzv2m' was expected
   	'renesas,rzg2l-gbeth' was expected
   	from schema $id: http://devicetree.org/schemas/net/renesas,etheravb.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: ethernet@e6840000 (renesas,etheravb-r8a779a0): tx-internal-delay-ps: False schema does not allow [0]
   	from schema $id: http://devicetree.org/schemas/net/renesas,etheravb.yaml#
   arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: ethernet@e6840000 (renesas,etheravb-r8a779a0): compatible: 'oneOf' conditional failed, one must be fixed:
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r8a7742', 'renesas,etheravb-r8a7743', 'renesas,etheravb-r8a7744', 'renesas,etheravb-r8a7745', 'renesas,etheravb-r8a77470', 'renesas,etheravb-r8a7790', 'renesas,etheravb-r8a7791', 'renesas,etheravb-r8a7792', 'renesas,etheravb-r8a7793', 'renesas,etheravb-r8a7794']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r8a774a1', 'renesas,etheravb-r8a774b1', 'renesas,etheravb-r8a774c0', 'renesas,etheravb-r8a774e1', 'renesas,etheravb-r8a7795', 'renesas,etheravb-r8a7796', 'renesas,etheravb-r8a77961', 'renesas,etheravb-r8a77965', 'renesas,etheravb-r8a77970', 'renesas,etheravb-r8a77980', 'renesas,etheravb-r8a77990', 'renesas,etheravb-r8a77995']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r9a09g011']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,r9a07g043-gbeth', 'renesas,r9a07g044-gbeth', 'renesas,r9a07g054-gbeth']
   	'renesas,etheravb-rcar-gen2' was expected
   	'renesas,etheravb-rcar-gen4' was expected
   	'renesas,etheravb-rzv2m' was expected
   	'renesas,rzg2l-gbeth' was expected
   	from schema $id: http://devicetree.org/schemas/net/renesas,etheravb.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: ethernet@e6850000 (renesas,etheravb-r8a779a0): tx-internal-delay-ps: False schema does not allow [0]
   	from schema $id: http://devicetree.org/schemas/net/renesas,etheravb.yaml#
   arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: ethernet@e6850000 (renesas,etheravb-r8a779a0): compatible: 'oneOf' conditional failed, one must be fixed:
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r8a7742', 'renesas,etheravb-r8a7743', 'renesas,etheravb-r8a7744', 'renesas,etheravb-r8a7745', 'renesas,etheravb-r8a77470', 'renesas,etheravb-r8a7790', 'renesas,etheravb-r8a7791', 'renesas,etheravb-r8a7792', 'renesas,etheravb-r8a7793', 'renesas,etheravb-r8a7794']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r8a774a1', 'renesas,etheravb-r8a774b1', 'renesas,etheravb-r8a774c0', 'renesas,etheravb-r8a774e1', 'renesas,etheravb-r8a7795', 'renesas,etheravb-r8a7796', 'renesas,etheravb-r8a77961', 'renesas,etheravb-r8a77965', 'renesas,etheravb-r8a77970', 'renesas,etheravb-r8a77980', 'renesas,etheravb-r8a77990', 'renesas,etheravb-r8a77995']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r9a09g011']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,r9a07g043-gbeth', 'renesas,r9a07g044-gbeth', 'renesas,r9a07g054-gbeth']
   	'renesas,etheravb-rcar-gen2' was expected
   	'renesas,etheravb-rcar-gen4' was expected
   	'renesas,etheravb-rzv2m' was expected
   	'renesas,rzg2l-gbeth' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
