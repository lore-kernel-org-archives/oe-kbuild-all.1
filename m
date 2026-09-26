Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CC629B78D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 02:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790389375; cv=none; b=VDVvOJG2sGcVrT3ttx8lDxU5QQ640pa+PyXzJOGBbJg0QzyDWqcb86BKjIuZGfaxbFXR0N+ghfgQYRnkQJEKMKBW1gN5xtpabovsVOGSCjEpaGEFIvvVR4IGTNRytqFMPiy8geew8+Y6UOtHxwIES4Y+PyTcrFlTLL5urvL4IvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790389375; c=relaxed/simple;
	bh=IkHTHw8P10sFU53gtLPxS/zVR8WVCydc+lbxTdI+mpo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KmXQ8MdSp9cpii6Ks4TuFyw4HcRzNWdgCdqDKXrU5RzYY8OUyCDtFODcwU6pAMb3sPaVECizkUCO9gfER5IUP1eS40P7H0XlywgRtJu1ifjx+Qw11ppKHdiBkTObWL5/yw0Tw5hAVYqq+F14qc9F/F4RJkbrPrU4FRO8BCiEnoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bNDwfV/b; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bNDwfV/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790389374; x=1821925374;
  h=date:from:to:cc:subject:message-id;
  bh=IkHTHw8P10sFU53gtLPxS/zVR8WVCydc+lbxTdI+mpo=;
  b=bNDwfV/bN/JiPomGafIB9WTZa22R6HEV3XWeoJG58eP46XB8Zf1zea4w
   mtZ1EWM2I2sfAxO7ZSrtDLFD34/Jk1C0w3cVCbaaEPn1U3+B04db6QydW
   +18j8XF5R0h+5kgW7FvdgDDDcQLJUQ0MCDfwaQ4/7ViOsWSpkjUw/34I/
   khQB1wgC6oud+oITnZGz0Echp/CPdIM0U6pZqxnGx5/NnjZe6Qo7c9mQ8
   xTGhRek+Ay3jXbfoSZBPELmrJOsw0jP9LzzKgvGuFZ0Kzu/+W1scwX7k9
   p76c/GSGpXtD/CCBflfe9J4zPWF9I39lottEGvS99RWQEzMk/+5hjuPCa
   g==;
X-CSE-ConnectionGUID: Utt0MGizTi28yLYNBYdo6w==
X-CSE-MsgGUID: p2pDkkTbTFmWXqg3HQLqww==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="101750080"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="101750080"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 19:22:53 -0700
X-CSE-ConnectionGUID: 8MM+66BfSYGCL2NhfYTzdA==
X-CSE-MsgGUID: /wN5PkfvRvmmNGGG0n6WgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="278285065"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 25 Sep 2026 19:22:53 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAI3t-000000000An-4A7x;
	Sat, 26 Sep 2026 02:22:49 +0000
Date: Sat, 26 Sep 2026 04:22:36 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-06 2/2]
 arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb:
 ele-reserved@a4120000 (shared-dma-pool): Unevaluated properties are not
 allowed ('no-map', 'reg' were unexpected)
Message-ID: <202609260424.sK6II7Km-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-06
head:   51961f334da24f5cfbbc50030779d37e98f2ec5d
commit: e71db39f0c7c0157177be12de7ae2d2495184da1 [2/2] arm64: dts: freescale: add initial device tree for TQMa91xx/MBa91xxCA
config: arm64-randconfig-2401-20260923 (https://download.01.org/0day-ci/archive/20260926/202609260424.sK6II7Km-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609260424.sK6II7Km-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e71db39f0c7c ("arm64: dts: freescale: add initial device tree for TQMa91xx/MBa91xxCA")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260424.sK6II7Km-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: /: failed to match any schema with compatible: ['tq,imx91-tqma9131-mba91xxca', 'tq,imx91-tqma9131', 'fsl,imx91']
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: /: failed to match any schema with compatible: ['tq,imx91-tqma9131-mba91xxca', 'tq,imx91-tqma9131', 'fsl,imx91']
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: /: failed to match any schema with compatible: ['tq,imx91-tqma9131-mba91xxca', 'tq,imx91-tqma9131', 'fsl,imx91']
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: /soc@0/system-controller@4ac10000: failed to match any schema with compatible: ['fsl,imx91-media-blk-ctrl', 'syscon']
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: linux,cma (shared-dma-pool): Unevaluated properties are not allowed ('alloc-ranges', 'reusable', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: ele-reserved@a4120000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
