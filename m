Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7D118CBFC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 19:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739041731; cv=none; b=cpBe5dUpdkIrQc2f+RHDzPs8BWGdBH487SfNPm4LCapRnN0zoQVFfOqzsqmklIh8h6BUjNH3JOhkzdSUeDd7Rs2mVpbaAWoLO49WaI/XSg9hsIFK9zSMFX0drx8ZVEi/IcUTWYg0rnjzonHWg93ySiPuoSjcGbEJhwvBXA4fpO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739041731; c=relaxed/simple;
	bh=e0x5g0BuvVu5PPvzZx2s1QyRyQhxPtBHpnp973bpmlM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RLybpAt3P1LEvUONpDKL1p4suRcqjtNVeoJ8of4/gU1D8TmY5IHIwe5lqjycfngtOIlSWVm3vTZZ7dVOhDLakdKv2l3k3gN1LEIWuj+syI3iLFY0KRvO0XZN+7I7bD/8yQxsth168lctipTQqx3vtpAT7npJy5YjEEDi9Q5bZWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+t1Fwsy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+t1Fwsy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739041729; x=1770577729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e0x5g0BuvVu5PPvzZx2s1QyRyQhxPtBHpnp973bpmlM=;
  b=R+t1FwsyY+upq9Zv8tQQhPXiURmm3n5ioYbTozDTDn7bHdCfZ0NNz7QY
   EOEztWtqHn4+J1F+8oLOfIK14vhMOrTVrnDk+9y0AUPSIoODA+ADMYnIh
   CqENUgsIqDNzPU/BgmVSP6/UcYD9q00S/ULn5Rg+Yg1PopQIaZwCEuahS
   ed7SOjAvkDG7GhPnMgM6xFp23uoKNhiHqdG/j6lvVRvWgGCwK6LBp61qe
   FCJZ9KGJ3tF38qXob0krA/hluYszgma903YG2tIVVbrnekL4/vdjkpekX
   iewLxasNDrkj9qprhVpMCoqVR0oq8XlEFTHITHopLOn8aLhaB6PHNmaer
   g==;
X-CSE-ConnectionGUID: gIrO3NZuTm2+dl4gbKbxzQ==
X-CSE-MsgGUID: 76JvSNqHQRuPmi1O+AL49A==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39926876"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="39926876"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 11:08:48 -0800
X-CSE-ConnectionGUID: 0ScIdChxRhOZ0WMgKKkD6w==
X-CSE-MsgGUID: Rxj/UroDQbuhyX1REEvH/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="111767376"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Feb 2025 11:08:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgqC4-0010Wz-2G;
	Sat, 08 Feb 2025 19:08:44 +0000
Date: Sun, 9 Feb 2025 03:08:34 +0800
From: kernel test robot <lkp@intel.com>
To: Cong Wang <cong.wang@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [congwang:xdp_tso 2/2] xdp_hw_metadata.c:399:24: error:
 'XDP_TXMD_FLAGS_GSO' undeclared; did you mean 'XDP_TXMD_FLAGS_CHECKSUM'?
Message-ID: <202502090302.qGYgS1lO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/congwang/linux.git xdp_tso
head:   af192238f025efad3209ee89f781077db0f66247
commit: af192238f025efad3209ee89f781077db0f66247 [2/2] selftests/bpf: Add tests for XDP_TXMD_FLAGS_GSO
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090302.qGYgS1lO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090302.qGYgS1lO-lkp@intel.com/

All errors (new ones prefixed by >>):

   xdp_hw_metadata.c: In function 'ping_pong':
>> xdp_hw_metadata.c:399:24: error: 'XDP_TXMD_FLAGS_GSO' undeclared (first use in this function); did you mean 'XDP_TXMD_FLAGS_CHECKSUM'?
     399 |         meta->flags |= XDP_TXMD_FLAGS_GSO;
         |                        ^~~~~~~~~~~~~~~~~~
         |                        XDP_TXMD_FLAGS_CHECKSUM
   xdp_hw_metadata.c:399:24: note: each undeclared identifier is reported only once for each function it appears in
>> xdp_hw_metadata.c:400:13: error: 'struct xsk_tx_metadata' has no member named 'gso'
     400 |         meta->gso.gso_size = 512;  /* Each segment will be 512 bytes */
         |             ^~
   xdp_hw_metadata.c:401:13: error: 'struct xsk_tx_metadata' has no member named 'gso'
     401 |         meta->gso.gso_segs = 2;    /* Split into 2 segments */
         |             ^~
   xdp_hw_metadata.c:402:13: error: 'struct xsk_tx_metadata' has no member named 'gso'
     402 |         meta->gso.gso_type = SKB_GSO_UDP_L4;  /* UDP segmentation */
         |             ^~
>> xdp_hw_metadata.c:402:30: error: 'SKB_GSO_UDP_L4' undeclared (first use in this function)
     402 |         meta->gso.gso_type = SKB_GSO_UDP_L4;  /* UDP segmentation */
         |                              ^~~~~~~~~~~~~~
   xdp_hw_metadata.c:405:25: error: 'struct xsk_tx_metadata' has no member named 'gso'
     405 |                xsk, meta->gso.gso_size, meta->gso.gso_segs,
         |                         ^~
   xdp_hw_metadata.c:405:45: error: 'struct xsk_tx_metadata' has no member named 'gso'
     405 |                xsk, meta->gso.gso_size, meta->gso.gso_segs,
         |                                             ^~
   xdp_hw_metadata.c:406:20: error: 'struct xsk_tx_metadata' has no member named 'gso'
     406 |                meta->gso.gso_type, len);
         |                    ^~
   xdp_hw_metadata.c:409:17: error: 'struct xsk_tx_metadata' has no member named 'gso'
     409 |         if (meta->gso.gso_size * meta->gso.gso_segs > len) {
         |                 ^~
   xdp_hw_metadata.c:409:38: error: 'struct xsk_tx_metadata' has no member named 'gso'
     409 |         if (meta->gso.gso_size * meta->gso.gso_segs > len) {
         |                                      ^~
   xdp_hw_metadata.c:411:33: error: 'struct xsk_tx_metadata' has no member named 'gso'
     411 |                        xsk, meta->gso.gso_size, meta->gso.gso_segs,
         |                                 ^~
   xdp_hw_metadata.c:411:53: error: 'struct xsk_tx_metadata' has no member named 'gso'
     411 |                        xsk, meta->gso.gso_size, meta->gso.gso_segs,
         |                                                     ^~
   xdp_hw_metadata.c:412:28: error: 'struct xsk_tx_metadata' has no member named 'gso'
     412 |                        meta->gso.gso_size * meta->gso.gso_segs, len);
         |                            ^~
   xdp_hw_metadata.c:412:49: error: 'struct xsk_tx_metadata' has no member named 'gso'
     412 |                        meta->gso.gso_size * meta->gso.gso_segs, len);
         |                                                 ^~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
