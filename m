Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405C2F9C0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Feb 2026 03:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771732535; cv=none; b=I38bXD9JJECuTh+bTaahwq1Dl8g7tAMuHOdxdX+tjf0Jp0wYI3QtzybPayjGVPc9gfCrxf/Jytqxr4e6HuQLuqxeewqD2JokO+ibJ8gs0bA2xDB8srgpDR8H7CCI+IDnQg6PGGsfqEpgnb+wd4QY1IrRI7d3Q+HRiv3UMMIH074=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771732535; c=relaxed/simple;
	bh=EGarlXrZwz8stnFDl/Tf7twenPX5x5przLBFZZRir9M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LkHA9dxHTGOwHzKD3jBEjjgH0KEUyV511bn+daZZVLAU3R3Nu7J56HUkRqkVLK6y4RglmWhFtPTjNE4xmt29RDwS9eHW+fN+FzkbktlZz7HLgszA9bp0Tbq20nSDxoqxTTFbHupjGrrJl2ej+jbp8OX5BuGnWtE755eDI/oliOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EOqU/Kic; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EOqU/Kic"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771732533; x=1803268533;
  h=date:from:to:cc:subject:message-id;
  bh=EGarlXrZwz8stnFDl/Tf7twenPX5x5przLBFZZRir9M=;
  b=EOqU/KicWcV9/jz0gacRwQY0qrOdDNOyeGxc09fDm5cs4uHgf3RaYyFc
   atRO2E+5Z+ofLF6yi7B59KMV+vRBWTtLAR/aFrFktkxvbaV3RpMHU4c4A
   oISYXDHVezUHsoMlJFoBszIpunrnnwC+5v9uQSiFqIBul/y1Ei6us/t3z
   UIAyTn9JkrRMwCRfeI8R2j+0MP1BK6FFCcakgimwYXrScfWnlQuM1AKYU
   FpXcEzbMbS5T/xLiQN6OAqdGXiwS1VLZtD/UnfgM9ANr6VOnLTiL93exx
   DRbLWYdvBQPCrtwyA6+23tG2hIP1Vn/xF2uTtxuhOkq1IVrkBg2k7EbuV
   A==;
X-CSE-ConnectionGUID: xjRI3je8Szi9d1AtYe3wbA==
X-CSE-MsgGUID: Kp8z0v4tTgWdLf6UJVfdnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="72472513"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="72472513"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 19:55:32 -0800
X-CSE-ConnectionGUID: ETFBgXJ7RtCaviqPj1yDwA==
X-CSE-MsgGUID: YvRX/lMXS1uTjF7O9rXaBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="213689074"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Feb 2026 19:55:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vu0Z5-000000015K0-2ywb;
	Sun, 22 Feb 2026 03:55:27 +0000
Date: Sun, 22 Feb 2026 11:55:01 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 50/176] ERROR: modpost:
 "rproc_find_carveout_by_name" [drivers/remoteproc/xlnx_r5_remoteproc.ko]
 undefined!
Message-ID: <202602221121.DseLvdqA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   865e73109750d465f06dee019396406a354eb9d2
commit: a0752d3761ddbce79684a2555d8d0ee86580a702 [50/176] remoteproc: xlnx: Add support for R52 DDR boot
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260222/202602221121.DseLvdqA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260222/202602221121.DseLvdqA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602221121.DseLvdqA-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "rproc_find_carveout_by_name" [drivers/remoteproc/xlnx_r5_remoteproc.ko] undefined!
>> ERROR: modpost: "zynqmp_pm_invoke_fn" [drivers/remoteproc/xlnx_r5_remoteproc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
