Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A76142050
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Feb 2026 03:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771125970; cv=none; b=X8pwbzn6dBCr6ZX5o7g2nPPgiuKznBEh9BJTtyILyw8jTjaPPILigRakaVsgdg6wYZEmz1bi9T1FnaG1skT1GB6b9X5WTqbYoS1O+A1xBERIxPTk9GVBNo/L0ALsCjURB/785C4NoCDfQvND+ndGM7vNmycFnpjF90FZooBTurA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771125970; c=relaxed/simple;
	bh=I2UuaWaEYI54eI4O+wWI4Obhd/t2k1E62Y7tWJFDp5g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qP8TrxuzcKBj3BsuH5be4EWXBbnTBDEyMYLrJsMyajDkYDfvZ4r/bqXC3B+nB+TOiT39D1zrmTzYeqauCh6d26lGMVC2UrLJIQejrYmEzITaiMpQ/oPDiEX+DuA24PzFwqqPj0VYQAgWtiTDKE700SIusFKR0KTNGbzJjy6GDaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SLx71RHW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SLx71RHW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771125969; x=1802661969;
  h=date:from:to:cc:subject:message-id;
  bh=I2UuaWaEYI54eI4O+wWI4Obhd/t2k1E62Y7tWJFDp5g=;
  b=SLx71RHWMlvLInC5o/pInmy/VS2WdfhxvxcauurLfXxPWPzlHFoba9c9
   h46g9IaIB9fF3hDQQUcsbfsT0NNngkB16kL05yNjwPFqNU1G/3UFQb3L1
   8h0YQrgqqrTaX2KKiNcKgUhiCkV+gSwDZDx9yKcBQGKiFif4fiv/A+8PK
   KGxmVdE1YhGWTpwlhNp4KwGO2YpQ9h9wDPeMeD6XYBHo8aVHv7ge491lb
   RaAO1Ll9mA1tip6e8LQEiUD+bn8LgYWW4GNJoCPRagfMnUZgToch6DH1M
   7yBslJ4TwVGe8oi7ne1BkdSQUOPOpvO6PnSQF0XXb7JsqAdyQqvmqTO5C
   w==;
X-CSE-ConnectionGUID: CuSlzpL3REKRK4nwcOQ9eA==
X-CSE-MsgGUID: feWYb/14Rr6FHAdDuzOyOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="89667746"
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="89667746"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 19:26:08 -0800
X-CSE-ConnectionGUID: NL43Vz8KTE2qN3ZJep6wgw==
X-CSE-MsgGUID: tYEiII6eQtisHVXhQ82cKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="213114785"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Feb 2026 19:26:07 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrSlo-00000000xFY-2FMS;
	Sun, 15 Feb 2026 03:26:04 +0000
Date: Sun, 15 Feb 2026 11:25:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:djwong-wtf 111/117]
 fs/xfs/xfs_healthmon.c:72:14: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202602151111.adtkFni9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git djwong-wtf
head:   b26d191b36748da1afef6227d8de4bd258015b48
commit: 50ea06949a53186ea95fb6f84cd1712b2eca258e [111/117] xfs: fix potential pointer access race in xfs_healthmon_get
config: mips-randconfig-r121-20260215 (https://download.01.org/0day-ci/archive/20260215/202602151111.adtkFni9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602151111.adtkFni9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602151111.adtkFni9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_healthmon.c:72:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/xfs/xfs_healthmon.c:72:14: sparse:    struct xfs_healthmon [noderef] __rcu *
   fs/xfs/xfs_healthmon.c:72:14: sparse:    struct xfs_healthmon *
   fs/xfs/xfs_healthmon.c:113:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/xfs/xfs_healthmon.c:113:13: sparse:    struct xfs_healthmon [noderef] __rcu *
   fs/xfs/xfs_healthmon.c:113:13: sparse:    struct xfs_healthmon *
   fs/xfs/xfs_healthmon.c:119:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/xfs/xfs_healthmon.c:119:9: sparse:    struct xfs_healthmon [noderef] __rcu *
   fs/xfs/xfs_healthmon.c:119:9: sparse:    struct xfs_healthmon *
   fs/xfs/xfs_healthmon.c:137:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/xfs/xfs_healthmon.c:137:9: sparse:    struct xfs_healthmon [noderef] __rcu *
   fs/xfs/xfs_healthmon.c:137:9: sparse:    struct xfs_healthmon *

vim +72 fs/xfs/xfs_healthmon.c

    63	
    64	/* Grab a reference to the healthmon object for a given mount, if any. */
    65	static struct xfs_healthmon *
    66	xfs_healthmon_get(
    67		struct xfs_mount		*mp)
    68	{
    69		struct xfs_healthmon		*hm;
    70	
    71		rcu_read_lock();
  > 72		hm = rcu_dereference(mp->m_healthmon);
    73		if (hm && !refcount_inc_not_zero(&hm->ref))
    74			hm = NULL;
    75		rcu_read_unlock();
    76	
    77		return hm;
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
