Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EC2846C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Jul 2025 01:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752112617; cv=none; b=kOt8dTkh2h7JJzSv4OBJOF+024yIgEBuqgBqwAdvUnJHqpkkbR5pXGsvqXBAFLlL0waFdMzpofpaxLDY+DFJSShVaWFs+8HQyEB3hvEmrLp48+0HFsodU+rttNrUqwixgiFpVr09B+RzQaZeGCkIXdDAjnqjUILFiVwmUAa335A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752112617; c=relaxed/simple;
	bh=IyaeqBJeL76Fu4ZQR4FJdP8079Wb7ZLumBLzcyhBk7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lScw6tJvflJvd4C9EcB3gHyyiZaCqND0/PckVZnkGXPSAvUTswzbuRZMLkGamUkXV1snWU9Zs5Z2yO/RQf5A3ils3gKdqz8KtrdlyrXzgX8Vx/GVqnf2b7MEJA0ElrSL/Oyao3sFpp2tnlB54qU5pP9kHGDiaNwG80jxf4vo09c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FA+RQhJQ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FA+RQhJQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752112616; x=1783648616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IyaeqBJeL76Fu4ZQR4FJdP8079Wb7ZLumBLzcyhBk7M=;
  b=FA+RQhJQ0A8K/RBAvIUaTHA0+8e6qBQ98h8H7g9D0iv+Z1w0HmDd4slv
   V3dPPLzuU0vMa401sGJTTRLa2xbrUsEu0iYmU9cthx8qic5kOpd+ZEZXs
   iTtzcf4/iXMp989mMcARYtnHxBKqZvJkgn1wUPAAhzv4sd7GZ4Zgcvds8
   nG1lFGW2hZSyq66zmu3htFsHR8EJVUnzFbgdzHAzQBMzk0FE5MBTIZI+2
   paKl9v00PhPvE0SF5B9Slvp47lK2qkdUtDm4Ij4wIfrvFHtfYZl6IVG/r
   UaW0PYocfkfF3P8t+mFId+r1z8nHHO3kbeKGPjxYzoaLBmLqDLSDx+YFt
   w==;
X-CSE-ConnectionGUID: SoBMqvXoSa+83bMgG1Xjeg==
X-CSE-MsgGUID: 1pQTUhQBSWyco7jZdG3bpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="65736177"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="65736177"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 18:56:55 -0700
X-CSE-ConnectionGUID: QdSO+hBuRM2Bb7uha5F4dg==
X-CSE-MsgGUID: ZS2spSBvSwOp0UfrLynLUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="186939817"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Jul 2025 18:56:52 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZgWn-0004Kp-2u;
	Thu, 10 Jul 2025 01:56:49 +0000
Date: Thu, 10 Jul 2025 09:56:29 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:fnb 26/37] arch/x86/kernel/cpu/topology.c:211:31: warning:
 unused variable 'cnt'
Message-ID: <202507100940.I1QdEUeg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux fnb
head:   870b9f6edf53871a5cc4aaf858054d8362c49989
commit: 7d76a9d1f1fd2047ddb095a1c698bd6b557d63b6 [26/37] x86: topology: use bitmap_weight_from()
config: i386-buildonly-randconfig-004-20250710 (https://download.01.org/0day-ci/archive/20250710/202507100940.I1QdEUeg-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507100940.I1QdEUeg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507100940.I1QdEUeg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/topology.c: In function 'topo_unit_count':
>> arch/x86/kernel/cpu/topology.c:211:31: warning: unused variable 'cnt' [-Wunused-variable]
     211 |         unsigned int id, end, cnt = 0;
         |                               ^~~
>> arch/x86/kernel/cpu/topology.c:211:22: warning: unused variable 'id' [-Wunused-variable]
     211 |         unsigned int id, end, cnt = 0;
         |                      ^~


vim +/cnt +211 arch/x86/kernel/cpu/topology.c

5c5682b9f87a3b Thomas Gleixner 2024-02-13  207  
f0551af021308a Thomas Gleixner 2024-03-06  208  static unsigned int topo_unit_count(u32 lvlid, enum x86_topology_domains at_level,
f0551af021308a Thomas Gleixner 2024-03-06  209  				    unsigned long *map)
f0551af021308a Thomas Gleixner 2024-03-06  210  {
f0551af021308a Thomas Gleixner 2024-03-06 @211  	unsigned int id, end, cnt = 0;
f0551af021308a Thomas Gleixner 2024-03-06  212  
f0551af021308a Thomas Gleixner 2024-03-06  213  	/* Calculate the exclusive end */
f0551af021308a Thomas Gleixner 2024-03-06  214  	end = lvlid + (1U << x86_topo_system.dom_shifts[at_level]);
f0551af021308a Thomas Gleixner 2024-03-06  215  
7d76a9d1f1fd20 Yury Norov      2025-07-07  216  	return bitmap_weight_from(map, lvlid, end);
f0551af021308a Thomas Gleixner 2024-03-06  217  }
f0551af021308a Thomas Gleixner 2024-03-06  218  

:::::: The code at line 211 was first introduced by commit
:::::: f0551af021308a2a1163dc63d1f1bba3594208bd x86/topology: Ignore non-present APIC IDs in a present package

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
