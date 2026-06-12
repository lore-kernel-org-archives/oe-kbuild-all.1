Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E12442AA6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 00:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781223248; cv=none; b=Y8/IBEm/50Qybe5K0EU1u9QtdPHiw41aKYtOFMtZwOdSDDKnEx5Faobw9wrH1lujUc3AaNP4HjwXmiqmb6yI+w6jwvTiMmblleO1A2WOpNpJSsERizj/91VneHsXvfROMQs4d/27gn0yeM3gOQ0tZOdxZf3eNG2eondCZp4Ra9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781223248; c=relaxed/simple;
	bh=TLyieyymeNIemvBM7dI5j8PJYdsnUQ38IGpUMAfjjQQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dch7Ddur7ix2DGQqy0yBw33l/mgawCLY2pXMzbyI8vnJBGb7++gH8x/NigwUbyUNfz8/88dTSGpMcYjSSZIFlVZuJnB/AY2BYaPbq62QWnPrGT/54+jS7J8JaPeCJ1rwxJ6hBBNlWuGunhJoYTT3/4pkgU9difsSJLJgAMwn6X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VSpGxc0o; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSpGxc0o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781223246; x=1812759246;
  h=date:from:to:cc:subject:message-id;
  bh=TLyieyymeNIemvBM7dI5j8PJYdsnUQ38IGpUMAfjjQQ=;
  b=VSpGxc0oQdnQIKM3ycMraCUQ0kZJ9/dbtnmib2y9zTI/yrfUPAq8tvtL
   U5im7fvde8RAOWYB1BFkSMMFOPeLInTgH1wH9oGQ56PtOSEV2vQeCQgd3
   zscqqY9TCnCPN0xoyH+miJPeN3w1uqPEmmBr0RtsG1T1jOq8lHSoLH/tc
   ySZisF8n+hkEvtL0F8IkWI5RAIeKf5fTztrcaOdJJvaNl3MFFazVcuq3D
   EF1Ma6yGAM8yF26A/YYsdd6bZ2swA2fNsPYv4PHjaWVAjN6cPjpoBZHxo
   /XljFj8Hpzt66g3e9JaYOFsL8ZhOee2oGkB3Hf0Tt+FE0cIVm/ictskYr
   A==;
X-CSE-ConnectionGUID: Tg2NtSFoQLStRf1NbcRnyw==
X-CSE-MsgGUID: C49SbzAyRiaiPNe2W4+09A==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92618825"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="92618825"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 17:14:05 -0700
X-CSE-ConnectionGUID: lbyiwkaVQMyAn6FHQUPH/g==
X-CSE-MsgGUID: m5qFvPgNT/CE/3jfjP3giQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="250588112"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Jun 2026 17:14:04 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXpX6-00000000O3y-3g3q;
	Fri, 12 Jun 2026 00:14:00 +0000
Date: Fri, 12 Jun 2026 08:13:45 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Henriques <luis@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Miklos Szeredi <mszeredi@redhat.com>
Subject: fs/fuse/dir.c:38:21: sparse: sparse: symbol
 'dentry_tree_work' was not declared. Should it be static?
Message-ID: <202606120807.45vjB81O-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: ab84ad5973869a660ca3ad0c54a2b84d975d47c4 fuse: new work queue to periodically invalidate expired dentries
date:   7 months ago
config: powerpc-randconfig-r112-20260611 (https://download.01.org/0day-ci/archive/20260612/202606120807.45vjB81O-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120807.45vjB81O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ab84ad597386 ("fuse: new work queue to periodically invalidate expired dentries")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120807.45vjB81O-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/fuse/dir.c:38:21: sparse: sparse: symbol 'dentry_tree_work' was not declared. Should it be static?

vim +/dentry_tree_work +38 fs/fuse/dir.c

    34	
    35	#define HASH_BITS	5
    36	#define HASH_SIZE	(1 << HASH_BITS)
    37	static struct dentry_bucket dentry_hash[HASH_SIZE];
  > 38	struct delayed_work dentry_tree_work;
    39	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
