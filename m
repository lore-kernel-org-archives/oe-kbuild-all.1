Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A0018C008
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 19:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766258204; cv=none; b=nPD3dkMBHoxltunWqHNExDV2BR7yxf90K13r3vhy8ZBvHvRVJ7Rr6OvavWsCRsB103SmY92zYbb5tlWVJVgsph2sEUIdhhGDiYdBlakx07CHDkAaqO7lKP+WtOrIaVUDztdhVyfPAqfmYyhy4F5vEPnhxNk9iCEWIrc4FZBz8aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766258204; c=relaxed/simple;
	bh=y853BNcHJBbjLmY+tQ42Yd2ZLO0F2OSKZjBvGCVhkvg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cW6TAt+SP3/F1F4Sh2LE4kMeE2hPuYCZ1dvzI5skhqd6TSneuhBeDvlepx3dXMgeWQGJ6XKjlATLFHODDO1YwXaj/95fqrjp3TYa2GGGQ/T6p+0bsyVDToM8O4DRcaNEOKe5B7W55MPAR2Nc1crCyHa6WUkaWc2qEBkS3euIKZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O1XB504R; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O1XB504R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766258203; x=1797794203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y853BNcHJBbjLmY+tQ42Yd2ZLO0F2OSKZjBvGCVhkvg=;
  b=O1XB504RW9WZJDwgHrDSM3FVbHHbzl9B6KMk7wIWZYbzl6A14Kobrx6b
   ycB5UwLQEqCTEWGYAMkJwKkkyMF9Ksx694JxQWj8uW3fterhS06QFy2lV
   /xHwmdVwEapSSaXJ1py8qvCNDw0bB/LVZdJWPbPKr4K/D9qmS0Z3Qf+G4
   vRDCyCIb3Ut5VoMQ8cgEGbaerDhlIicPxd2NSdqFl3m3L6AEQfG9E72xj
   RbvXx1zgexJJAT2EwYO+gITy0NYwFmRxKFMwYg4RZTQrwtaLqDfCph+zW
   4BvILP/WwapiDePfm5E/Bx+0jnH4JnjZ4px00E8maDJ1L3slyS2oxkQ8b
   Q==;
X-CSE-ConnectionGUID: /w21g+U5Q4GEtUp9RW48ug==
X-CSE-MsgGUID: ASIir9XnQDSsTfRgOSSN3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="72043512"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="72043512"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 11:16:42 -0800
X-CSE-ConnectionGUID: iEzZkl86RI6ZhpY9vdOyug==
X-CSE-MsgGUID: hgDb9crESBOf6BGcxj7NiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="203287264"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Dec 2025 11:16:41 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX2RT-00000000546-0FbT;
	Sat, 20 Dec 2025 19:16:39 +0000
Date: Sun, 21 Dec 2025 03:16:14 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal:spec 130/131] Warning: kernel/sys.c:3490 expecting prototype
 for sys_setfsgid(). Prototype was for __sys_setfsgid() instead
Message-ID: <202512210359.Cd1tTzeM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git spec
head:   d34c22a9d280338fc8a0f12fd5577e62f345503e
commit: ef6d3b3d9d43de47dc3cfaa386f7b1cb285e162a [130/131] kernel/api: add API specification for sys_setfsgid
config: m68k-stmark2_defconfig (https://download.01.org/0day-ci/archive/20251221/202512210359.Cd1tTzeM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210359.Cd1tTzeM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210359.Cd1tTzeM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: kernel/sys.c:1998 expecting prototype for sys_setuid(). Prototype was for __sys_setuid() instead
   Warning: kernel/sys.c:3251 expecting prototype for sys_setfsuid(). Prototype was for __sys_setfsuid() instead
>> Warning: kernel/sys.c:3490 expecting prototype for sys_setfsgid(). Prototype was for __sys_setfsgid() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
