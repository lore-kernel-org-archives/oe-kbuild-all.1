Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84BF25B098
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 01:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786670433; cv=none; b=XkJ9eYUGKd2B9dkwyykwJFWfl6P0HAEjTD9jYyq/hg4m0JqyhCDw6Ykp+6tm2e7On4h9LXfCKu2rry1Ng25lCS9W+fty+tp2z13uyDfrr7AScomHpfEy1qcvq/e9IUnFL74e4rqCBIH3WVBOCXPv2C4sGVgnmPpCiu2+WIay398=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786670433; c=relaxed/simple;
	bh=Tl+AnQRW5LRiI4iUg8zKIrqP4HlkoSyp5bW+/mEJq4U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FFyFThpSoRGJKc1cKiEJykxsQWaIc/NZuf+T1MdCgqVvJA2V0F436lSVvLed8TU/lj6euA84tFLSvPoZX4MlfzNqc5BpP3/FBuawfISrIX6yPie/QnsmJIdFGMsDx15r2dFQHje3JZSlL3+rhexqr6xHU5KUOxr0ZA87g4DZrkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UfaHM7SE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UfaHM7SE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786670431; x=1818206431;
  h=date:from:to:cc:subject:message-id;
  bh=Tl+AnQRW5LRiI4iUg8zKIrqP4HlkoSyp5bW+/mEJq4U=;
  b=UfaHM7SE+KjXIpjMt+PgxJBi1LipFq3yCGsK+GqyiUDUZjWwyqGOUJKH
   kw3m/VrvFmpCpQNLQqe7bbjZfHxLd5ruNX1DO+HBl/ROP6lYERwzpp6Tt
   yiIvzEyTy4GrI0AT9i2Ii9wr0UMkI96tvsOtuhCoYqt4S3LNh8nyq+e58
   8qNJRdyWn3GntcY3USXhFBjCe1xbjqqZOnTyRZax2qVnNtZ0nUCrZx+rG
   /9nLCLyPRu5HGWy5h3AgZUky3/DWsLBhDk3kuA4jBQQHCv1f32h/AuyYE
   XtxVOn0tNhhQUECMGWzJvYwYd3t+udj85cqlkXUsGLNaS4YPuF2mksgqz
   Q==;
X-CSE-ConnectionGUID: bywy4eNOSjKNDkUSCuXIPQ==
X-CSE-MsgGUID: jyOKhbW0R32eHJArA4H0/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="98610201"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="98610201"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 18:20:30 -0700
X-CSE-ConnectionGUID: ErwB0Z2YThuGAaj6BDnpMg==
X-CSE-MsgGUID: zVdmRnUxTg+zVUb84yABOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="268361158"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 13 Aug 2026 18:20:28 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wugav-0000000069i-1s9I;
	Fri, 14 Aug 2026 01:20:25 +0000
Date: Fri, 14 Aug 2026 03:20:06 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Tanmay Shah <tanmay.shah@amd.com>
Subject: arch/powerpc/boot/dts/ebony.dtb: plb (ibm,plb-440gp): sram:
 {'compatible': ['ibm,sram-440gp'], 'dcr-reg': b'\x00\x00\x00
 \x00\x00\x00\x08\x00\x00\x00\n\x00\x00\x00\x01'} is not of type 'array'
Message-ID: <202608140337.5zt5FzMv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3d6d817622b0a9721e3cc404df3469171582be13
commit: 98e2a77b5d2c19f7a1bf2924ed2701035f214411 dt-bindings: Consolidate "sram" property definition
date:   3 months ago
config: powerpc-randconfig-2051-20260813 (https://download.01.org/0day-ci/archive/20260814/202608140337.5zt5FzMv-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5ca6f7e1bb9eeef5ce8d474569274822b319cf4f)
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608140337.5zt5FzMv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 98e2a77b5d2c ("dt-bindings: Consolidate "sram" property definition")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608140337.5zt5FzMv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/ebony.dtb: /interrupt-controller1: failed to match any schema with compatible: ['ibm,uic-440gp', 'ibm,uic']
   arch/powerpc/boot/dts/ebony.dtb: /interrupt-controller1: failed to match any schema with compatible: ['ibm,uic-440gp', 'ibm,uic']
   arch/powerpc/boot/dts/ebony.dtb: interrupt-controller1 (ibm,uic-440gp): dcr-reg: b'\x00\x00\x00\xd0\x00\x00\x00\t' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/ebony.dtb: /cpc: failed to match any schema with compatible: ['ibm,cpc-440gp']
   arch/powerpc/boot/dts/ebony.dtb: cpc (ibm,cpc-440gp): dcr-reg: b'\x00\x00\x00\xb0\x00\x00\x00\x03\x00\x00\x00\xe0\x00\x00\x00\x10' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/ebony.dtb: /plb: failed to match any schema with compatible: ['ibm,plb-440gp', 'ibm,plb4']
   arch/powerpc/boot/dts/ebony.dtb: /plb: failed to match any schema with compatible: ['ibm,plb-440gp', 'ibm,plb4']
>> arch/powerpc/boot/dts/ebony.dtb: plb (ibm,plb-440gp): sram: {'compatible': ['ibm,sram-440gp'], 'dcr-reg': b'\x00\x00\x00 \x00\x00\x00\x08\x00\x00\x00\n\x00\x00\x00\x01'} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/sram/sram-consumer.yaml
>> arch/powerpc/boot/dts/ebony.dtb: plb (ibm,plb-440gp): sram: {'compatible': ['ibm,sram-440gp'], 'dcr-reg': b'\x00\x00\x00 \x00\x00\x00\x08\x00\x00\x00\n\x00\x00\x00\x01'} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/sram/sram-consumer.yaml
   arch/powerpc/boot/dts/ebony.dtb: /plb/memory-controller: failed to match any schema with compatible: ['ibm,sdram-440gp']
   arch/powerpc/boot/dts/ebony.dtb: memory-controller (ibm,sdram-440gp): dcr-reg: b'\x00\x00\x00\x10\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/ebony.dtb: /plb/sram: failed to match any schema with compatible: ['ibm,sram-440gp']
   arch/powerpc/boot/dts/ebony.dtb: sram (ibm,sram-440gp): dcr-reg: b'\x00\x00\x00 \x00\x00\x00\x08\x00\x00\x00\n\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/ebony.dtb: /plb/dma: failed to match any schema with compatible: ['ibm,dma-440gp']
   arch/powerpc/boot/dts/ebony.dtb: dma (ibm,dma-440gp): dcr-reg: b"\x00\x00\x01\x00\x00\x00\x00'" is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/taishan.dtb: /cpc: failed to match any schema with compatible: ['ibm,cpc-440gp']
   arch/powerpc/boot/dts/taishan.dtb: cpc (ibm,cpc-440gp): dcr-reg: b'\x00\x00\x00\xb0\x00\x00\x00\x03\x00\x00\x00\xe0\x00\x00\x00\x10' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/taishan.dtb: /l2c: failed to match any schema with compatible: ['ibm,l2-cache-440gx', 'ibm,l2-cache']
   arch/powerpc/boot/dts/taishan.dtb: /l2c: failed to match any schema with compatible: ['ibm,l2-cache-440gx', 'ibm,l2-cache']
   arch/powerpc/boot/dts/taishan.dtb: l2c (ibm,l2-cache-440gx): dcr-reg: b'\x00\x00\x00 \x00\x00\x00\x08\x00\x00\x000\x00\x00\x00\x08' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/taishan.dtb: /plb: failed to match any schema with compatible: ['ibm,plb-440gx', 'ibm,plb4']
   arch/powerpc/boot/dts/taishan.dtb: /plb: failed to match any schema with compatible: ['ibm,plb-440gx', 'ibm,plb4']
>> arch/powerpc/boot/dts/taishan.dtb: plb (ibm,plb-440gx): sram: {'compatible': ['ibm,sram-440gp'], 'dcr-reg': b'\x00\x00\x00 \x00\x00\x00\x08\x00\x00\x00\n\x00\x00\x00\x01'} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/sram/sram-consumer.yaml
>> arch/powerpc/boot/dts/taishan.dtb: plb (ibm,plb-440gx): sram: {'compatible': ['ibm,sram-440gp'], 'dcr-reg': b'\x00\x00\x00 \x00\x00\x00\x08\x00\x00\x00\n\x00\x00\x00\x01'} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/sram/sram-consumer.yaml
   arch/powerpc/boot/dts/taishan.dtb: /plb/memory-controller: failed to match any schema with compatible: ['ibm,sdram-440gp']
   arch/powerpc/boot/dts/taishan.dtb: memory-controller (ibm,sdram-440gp): dcr-reg: b'\x00\x00\x00\x10\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/taishan.dtb: /plb/sram: failed to match any schema with compatible: ['ibm,sram-440gp']
   arch/powerpc/boot/dts/taishan.dtb: sram (ibm,sram-440gp): dcr-reg: b'\x00\x00\x00 \x00\x00\x00\x08\x00\x00\x00\n\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/taishan.dtb: /plb/dma: failed to match any schema with compatible: ['ibm,dma-440gp']
   arch/powerpc/boot/dts/taishan.dtb: dma (ibm,dma-440gp): dcr-reg: b"\x00\x00\x01\x00\x00\x00\x00'" is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
