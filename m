Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAE71482E8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 08:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769329318; cv=none; b=f+Qe6APPe2QGlXhUp1zNrcEuPG+Wlomo9kEa7BvFC3bp4XKjfNfi4f5pB+My4VOYiQRsZvlB3n4DxmeELxj849iGkB+37Q9a36Xb3IHRIb1NRHZbi+RrbInF0t1TH91zIpj70PNZLQacPQtEsBnKxiXdVWrcExu7A5i04rhSfpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769329318; c=relaxed/simple;
	bh=3pgxRovF2Rm1yS9p2f947ABdy9wp+rHvQNUKwPTeVa4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l7sAATqGzmdjL86NPPWlNmQl1Ljkl/mBa9L70vIHhCCvhNoaiumaKnHwSqAUxiPsUo+hGfqTR2r0eOJUN50jRI6leNwKDS/saCDyZm8M/Yu909C29cY0T5bgmXO2Tclsy9RIDdDRZ1DPp7aReWW3GHo5vxfyJcUydwy9ybpIQZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RfU5rYSY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RfU5rYSY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769329316; x=1800865316;
  h=date:from:to:cc:subject:message-id;
  bh=3pgxRovF2Rm1yS9p2f947ABdy9wp+rHvQNUKwPTeVa4=;
  b=RfU5rYSYZrnRwvc0Spv3f5IqVmB37Olc6uOj/iz8QqSpMKQT77djDK/x
   ky+L7UiNl+uICsVNu+6+P2gabbGf9F6yrzUBm+oROwqcFcC+jitgXQOfl
   pVQDHtpcT04C/ZybCjdgfvHnk4jNORnjObgUTQMmYotKQgdZvLAZ7NUg4
   kB/vavhoJzIhL8apEV45pY98fPprcB5HxtNyBJWYEEufd0NnQmIuynIwP
   N1q+DBXTj5pjRe3ugfOFqV9Je3mXg5WaLZPrUuOhEqXsgDw2DYP7OitgY
   bX3G6KyrrKXJkZO65ucfN37KYe4dd2MUsMaOkoE5hpTmIL6g5ytxl1c24
   Q==;
X-CSE-ConnectionGUID: MM41wqKUT8+QlPj1NNQ0ag==
X-CSE-MsgGUID: 65byuwvxSpmUIzZiSqXJMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="69550553"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="69550553"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 00:21:56 -0800
X-CSE-ConnectionGUID: D/o74vKrRv+4kWiNXRzAAA==
X-CSE-MsgGUID: 6FqxjNBaSTmeWtXVyc2dAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="245023732"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Jan 2026 00:21:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjvNX-00000000Vs2-1Rhc;
	Sun, 25 Jan 2026 08:21:51 +0000
Date: Sun, 25 Jan 2026 16:20:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>
Subject: [cel:nfsd-testing 50/56] ERROR: modpost:
 "nfsd_delegts_enabled" [fs/nfsd/nfsd.ko] undefined!
Message-ID: <202601251641.3PanjsSV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   776a28fa300f6a84c6df16e0448263454f6be26d
commit: bf18662aa8520b408479ac0e99d8168b5ac18106 [50/56] nfsd: add a runtime switch for disabling delegated timestamps
config: parisc64-defconfig (https://download.01.org/0day-ci/archive/20260125/202601251641.3PanjsSV-lkp@intel.com/config)
compiler: hppa64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601251641.3PanjsSV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601251641.3PanjsSV-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "nfsd_delegts_enabled" [fs/nfsd/nfsd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
