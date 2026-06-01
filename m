Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E81535839E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 19:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780340720; cv=none; b=Yr1e9G1+HzXY02St3mLXw/A4S5r9plHESrkY2o8Aw2UV3HcuxobzFHbhzBGl6V5ENI5tP6uA/T9PJlPMp50L583XN5DDK9HdKzdhMeGwbuq0FbqRhf+wZayv0I5rCdJYjJYhNddYEllbhexVtvH94gwW/qvEsyG+9lDaJP6W92M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780340720; c=relaxed/simple;
	bh=CTzJK6SmRpJ3nZSsP8qrRZK0GJWLElnkWTa0pxGBne8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GQVztD0Ekh5e7qn0Z5GJEUvSug0yb+2OkSBTEsbhecSVT994tDDSzPDJxS1lT9p1OLB+vjn5wvWwopSyyCdnFcoJ8qUdKnR5tSVhQjDt9hGe4Vn+CRIt6M2N7V+ZRFvMIYkMbsrhxw6TDYsErc6YUqwfaD4Mt7d3IUnM6/vZgPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lF2fYVKx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lF2fYVKx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780340720; x=1811876720;
  h=date:from:to:cc:subject:message-id;
  bh=CTzJK6SmRpJ3nZSsP8qrRZK0GJWLElnkWTa0pxGBne8=;
  b=lF2fYVKx9eDMom1iXfCHMYNKe+MsydzzC6kAEKTplfQklDYb8uMIjBRp
   hFHYcP5uYhytARo51DTPxlZF5Ro5pvdaotzHBY+6jZyOQl2/ZaUgQg0z1
   e9jVTvMjwwXxol4Orip2TZPC2zitlNfY4Yaq2NQFkg/SxB/HcjPED63MV
   6CkxJcUXG08EoYGfDX6MxXHCv0pbxVjE7Ats9DxaBGcXH3BxmtdBL2AOy
   GCmQ3Ko/Ri3JViSzZwSoXfTncYdqZRenuSgjgVG4SZFYEG/57Veu5Sv1Y
   cPCZUggU2gw3TIqYvIKeEuO3CEX4i7WkclBrd/nDSmgG4y+PbfxufdFdu
   Q==;
X-CSE-ConnectionGUID: TxP8wZGpT5um0loeutL9Gg==
X-CSE-MsgGUID: Ngaxry18Q0qqv8z4IMdBow==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="84734125"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="84734125"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 12:05:20 -0700
X-CSE-ConnectionGUID: bajqwoTVT4qyHsOS5NNIWg==
X-CSE-MsgGUID: 4c9gTLsdSa67Rgjt6QlRcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="247933417"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 01 Jun 2026 12:05:18 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU7wp-000000001d3-1ecp;
	Mon, 01 Jun 2026 19:05:15 +0000
Date: Mon, 01 Jun 2026 21:04:22 +0200
From: kernel test robot <lkp@intel.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Warning:
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c:670 function parameter
 'repv' not described in 'r535_gsp_rpc_done'
Message-ID: <202606012030.UlYSR410-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Hongling-Zeng/nouveau-gsp-rpc-Document-RPC-function-return-value-contracts/20260601-183002
head:   31afea19a56cb8b2eab172c2ceca981660297249
commit: c866850f290d13b5e4f2f860c98d613c25b45442 nouveau/gsp/rpc: Document RPC function return value contracts
date:   8 hours ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260601/202606012030.UlYSR410-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606012030.UlYSR410-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606012030.UlYSR410-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c:670 function parameter 'repv' not described in 'r535_gsp_rpc_done'
>> Warning: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c:670 expecting prototype for r535_gsp_rpc_get(). Prototype was for r535_gsp_rpc_done() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
