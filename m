Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793137072;
	b=ojwXn/H5E2gmVT8fJTcXnIz6ZRolpSS6ZLKf4bEmPN8djrYzGXzUKxGzyJs6l87r1T/A
	 TmdnzS55hmZPRr26GO1Cu128ys5JSlj1vd9QxeEQHWPY2i9oLrtb+GjJL8sS4Vx1rFK+J
	 cZzPbyw32LFSE1UdmwjXtnUp1ETuZYCdU4ckZU1KC5U+FUensLiH/8Wl9Ta5/4pGot/yJ
	 6EOZz28QnWWK/wwFl/2GI4kVOxUribomD807N1FP6hi9gF2NytkjMMvHH41Fp5UZU1gNx
	 0xrcwpu8z1Y70KduRcRCWDd3FvLgVx91Ksl2drniQm7CD4YZxAvocz77VB4Bg2/MGyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793137072;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=3Xds2nHaYhhe4etnoCO6TrlnGUBZBJZcD+WxhtDuZHc=;
	b=AwBlnB91HXhRss0y2Us2P+aEz2pL40Wbn3or0PO2v2L51AiOPqHMyc+weyGjsHzICaER
	 FgL6+MbMV482BForDhwFWffN9Cv7ovS4BaxBT2UB8BCieZUpnZacLL+rX9slD8iVQL7rq
	 pF+r+O0xgK30m9/nAFtVBINcLoh7hSpmkD59jt1aKw/31AR0+N056sqiYLOzG4LXmbNMT
	 8naI/TzjHpsmZy2SinvvgP9nJyzd/Rbz6tAP8x4TRZWfUF6PqHoLa6HtLk8N6P+zdneA/
	 MtkwSXvROOmSDP3a1J4TuxwXoct/zcLCjlY0oMSBcEbW9ZgpQoW4AJKWRe5q5c/iPUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P9WZ9eT3;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D01606A31A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 21:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70D01606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P9WZ9eT3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793137071; x=1824673071;
  h=date:from:to:cc:subject:message-id;
  bh=tWfrKZuySA1/lU16D2cFma7T8+vN5Iof8A5DSPvSwnM=;
  b=P9WZ9eT37R4J8oa9CUu1XK4+FCpvvM5sCjtk51brtdi2QjGShWIGcHxG
   K3tNNxNrTgU1eeYz9Y2wbi0kdty7w798ROcbIK5aGgWaTvhZTygEJ4Nwr
   QFl0El3a3hxG2Mqb4DkFlXCXS/8Tr66w0KIEZMzY6qJzVU6Jzno4VHd2l
   1VsktmjBqO5z49T3FbX8QBj3KhbC8SqbaMNpLmjR1d41Hf9sumxjXDnjo
   vMIobCo4aKDbTDLv594lgDUZ2QEUIxhmz6sIEcpG6gOpH2mIzab7CWyiI
   mxeEJnR/BzF6+QP5pQ9nAL+Ea9oQEDP/YMyJyNwiUqnDCObgzNa37t8SR
   A==;
X-CSE-ConnectionGUID: hg+p0KWyTRitNBVoNPw0XA==
X-CSE-MsgGUID: JrsO0venSNKCDY+UU4snJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1850916"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1850916"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 14:37:50 -0700
X-CSE-ConnectionGUID: saCWolBrQ1Sn6JUFcmqAgw==
X-CSE-MsgGUID: 7ouH9qEVRQ2VGThDn4G2Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4712571"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 27 Oct 2026 14:37:49 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLora-000000004d9-2Zcy;
	Tue, 27 Oct 2026 21:37:46 +0000
Date: Tue, 27 Oct 2026 22:37:08 +0100
From: kernel test robot <lkp@intel.com>
To: Eileen Yoon <eyn@gmx.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 1/94] ld.lld: error: undefined
 symbol: drm_mm_remove_node
Message-ID: <202610272258.zGSRYDV6-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   2e6ef8294919b4bd7b23756d836b447b0b4ffb5f
commit: a4f0cf2bc24733efc65eda7596f80788878666f5 [1/94] media: apple: Add Apple ISP driver
config: loongarch-randconfig-r2305-20261027 (https://download.01.org/0day-ci/archive/20261027/202610272258.zGSRYDV6-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610272258.zGSRYDV6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610272258.zGSRYDV6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: drm_mm_insert_node_in_range
   >>> referenced by drm_mm.h:439 (include/drm/drm_mm.h:439)
   >>>               drivers/media/platform/apple/isp/isp-iommu.o:(isp_surf_reserve_iova) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_mm_remove_node
   >>> referenced by isp-iommu.c:78 (drivers/media/platform/apple/isp/isp-iommu.c:78)
   >>>               drivers/media/platform/apple/isp/isp-iommu.o:(isp_surf_unreserve_iova) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_mm_takedown
   >>> referenced by isp-drv.c:131 (drivers/media/platform/apple/isp/isp-drv.c:131)
   >>>               drivers/media/platform/apple/isp/isp-drv.o:(apple_isp_remove) in archive vmlinux.a
   >>> referenced by isp-drv.c:118 (drivers/media/platform/apple/isp/isp-drv.c:118)
   >>>               drivers/media/platform/apple/isp/isp-drv.o:(apple_isp_init_iommu) in archive vmlinux.a
   >>> referenced by isp-drv.c:131 (drivers/media/platform/apple/isp/isp-drv.c:131)
   >>>               drivers/media/platform/apple/isp/isp-drv.o:(apple_isp_free_iommu) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_mm_init
   >>> referenced by isp-drv.c:113 (drivers/media/platform/apple/isp/isp-drv.c:113)
   >>>               drivers/media/platform/apple/isp/isp-drv.o:(apple_isp_init_iommu) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
