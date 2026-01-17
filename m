Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22E1257431
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 20:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768680379; cv=none; b=S4sGAj7jBI7kzeHnNNR2+jWY0evZ0ODVC230JEH3k4iHQ61xXpOBJgGFdI3y1vOga6Z7CLnMbM4V7M4Y+KDbQvV/UBihxlWFw6FnF2XuJjHVaNisE/g0rM7VIfz+x6h5Xbj+688SBRclM/PbkoE/aC+25pB1LwblU3O1mXq7eYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768680379; c=relaxed/simple;
	bh=RzbSCLzOlRdPO4rLZ8+n+8G8k/OBTNrf+fd884ULK4o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ae/5tOLikX4MOD/cqeCRMxVRSpnaL1QNOgGDYuqPEQjbgMtkf0lH71yX0H9EHgYmZpeEvegTPRNcF3kVCcgyJezboetZ5xh/kVYjwlmoTI+Wa6zYDKpq/vZjDnkOX15JzKgW23k87jfJS30ZJrXPQTdJJ0GXxw6p/gJMmIf6xBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n8uID1kU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n8uID1kU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768680377; x=1800216377;
  h=date:from:to:cc:subject:message-id;
  bh=RzbSCLzOlRdPO4rLZ8+n+8G8k/OBTNrf+fd884ULK4o=;
  b=n8uID1kUxtonmkz83WSadR2j0+dP5Oxv0E0A1gd9tv2HhV3wKODzKEoH
   ANj9c8//dUpjCc+3rOqjVGrZbtgtiqmLkg0fBkYTVyEu10ZjH/T7K9IfR
   XIPb5Dzv5K4FPHQEydBCaS1UoV6PJrWrp1+0fm+9Ysa+iIib5/+X00wUb
   4yrkJ3pcrtAvzZlLnu3gKWqrC3nF/isKo9zN9wa32kZwxDgHiGuGPiFAD
   6edl4zpcTSk3JxfqWiT86lesJ1Rpu2nbmR3GWnMtrLUTs2u7z5PnbxMW0
   j7RGN7854fS0XTf5BwCdDWMbYlRb5PnMqEf6TotsrihDzy7TqQoY8btfw
   w==;
X-CSE-ConnectionGUID: +Z5LuwD5TSWBuzpHTlP84Q==
X-CSE-MsgGUID: CVxQz7qDSEO7HqerrGCB0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="73804759"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="73804759"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 12:06:16 -0800
X-CSE-ConnectionGUID: xR1cV+b6RlCWIskyaMbBAw==
X-CSE-MsgGUID: oA5sr0muT/qgjRl4C7L2Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="243077073"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Jan 2026 12:06:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhCYm-00000000MBg-3mkY;
	Sat, 17 Jan 2026 20:06:12 +0000
Date: Sun, 18 Jan 2026 04:05:23 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:fsverity-cleanups 2/5] ERROR: modpost:
 "fsverity_lookup_info" [fs/overlayfs/overlay.ko] undefined!
Message-ID: <202601180343.zGHz2A4U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git fsverity-cleanups
head:   4fc6474efca67b36e67c3b1cfad4b7b85dec83e8
commit: 6c09b70b12dd46653f2bd37664ffcf2961cd4120 [2/5] fsverity: use a hashtable to find the fsverity_info
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260118/202601180343.zGHz2A4U-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601180343.zGHz2A4U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601180343.zGHz2A4U-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "fsverity_lookup_info" [fs/ext4/ext4.ko] undefined!
>> ERROR: modpost: "fsverity_lookup_info" [fs/overlayfs/overlay.ko] undefined!
ERROR: modpost: "fsverity_lookup_info" [fs/btrfs/btrfs.ko] undefined!
ERROR: modpost: "fsverity_lookup_info" [fs/f2fs/f2fs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
