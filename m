Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178E744B672
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 16:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772208397; cv=none; b=h2Sttm7i+uJEqA8Fih2IKEVcav3392i4XIgu7bh8gTYfxRJAflH61DJ5FI+iZqwLPTJVX4KxWs4qvHLWC7qlKqoJyA761+MXYaRquWssSsc/p3ZTcFuaKf+5GSTwvk2FD2tl3bR4zt1oWi2PcPeZ74EBRykXMox42KdgQ4VsSpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772208397; c=relaxed/simple;
	bh=ao2QqQ9uHTdL0UdL14Bqyi5/CIKahUZBfq4kYP60jEY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=umIxp8ATo7Gse5e64H75wEXnIhlCrxTH55PXT5at/yU3LbkAvfvJLCbLJVLsS2Hd1NGx5ClkhcyGReksOS4TzuoypTW1Tof4UTq4+nZsFsp604McB517tX86/PR33V8dq5DEfQtN0gLedWtgfhlmKC/p/wZpEUFVpfjCIa7LKKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ceGiahtV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ceGiahtV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772208395; x=1803744395;
  h=date:from:to:cc:subject:message-id;
  bh=ao2QqQ9uHTdL0UdL14Bqyi5/CIKahUZBfq4kYP60jEY=;
  b=ceGiahtVKz9NJc6Rtpksq76fF1d1Hfje2+TwZjnx600Y+xBMlBhdmM7z
   V5NZ/Oi/dpMoEeFaMcaTDptSRflrddEFrDmkY2nqO1CFdG6fsCUdgw+Jo
   9N1R7I0amGCIpofJ86ay05amgBkcjg/67LWZVog4hzlYv8FVOl00OMwcq
   fDQy0ktiv4sSfc8OBfshqGouA5U+Y+wVBCwzkzpPtRJTh2zipRCLwHgBB
   2naXqtv2tTyaGKM7ey8QEP49OW4rwZd0xihKa9mvcLcIrKzWX9Pp51i37
   vdVuYFlmU+RHpwsLVbUpx/n12W017JbjDBWlTJqvqEQc40qi/vLk9HR+F
   g==;
X-CSE-ConnectionGUID: CJCKINTgTRuF7QwmeGkZIA==
X-CSE-MsgGUID: Px29u+xBRseMfA+FYG/awg==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73199178"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="73199178"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 08:06:34 -0800
X-CSE-ConnectionGUID: eH34VsOYSyuAiFGBaBUPeA==
X-CSE-MsgGUID: LCu3THxzQO+vfXbbkKqBpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="247448164"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 27 Feb 2026 08:06:33 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vw0MI-00000000Akx-2aRJ;
	Fri, 27 Feb 2026 16:06:30 +0000
Date: Sat, 28 Feb 2026 00:06:23 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:zap_details 13/15] Warning:
 mm/memory.c:2225 expecting prototype for zap_vma_range_batched(). Prototype
 was for zap_vma_range() instead
Message-ID: <202602272311.MrRjCPPH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux zap_details
head:   5bbeea4d45ee529f54f2facad67ce9539a52a0c5
commit: 50ba7bfa7b0d7e7d74fb1b35904cd5f189f19b38 [13/15] mm: rename zap_page_range_single() to zap_vma_range()
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20260227/202602272311.MrRjCPPH-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602272311.MrRjCPPH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602272311.MrRjCPPH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/memory.c:2225 expecting prototype for zap_vma_range_batched(). Prototype was for zap_vma_range() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
