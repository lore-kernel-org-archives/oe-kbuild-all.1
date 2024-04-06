Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED91C1EB40
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 08:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712390910; cv=none; b=rlxIb+LyM6zV79TY1zt6vDaHfXk40713nCunpHF0BCnFxGCqlx9e7g1JO2PGX9MzBVCuAuactatU6G66olLIxqgsvwIOe9L5x3CC6xr/YOb/8cp+619rJCFJNA05AufOA9TY/ofzL41nm4kvzBcE2rAo7NgSp3Q6N/6i8HYLd0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712390910; c=relaxed/simple;
	bh=QdVlj0DygaOr3tcThW3K3u+lkDuMw3AH0DaD6aTw3mM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fsNHTI19Id1fG9Tc8iMl2c/vRQ/pFsbutzi80OVDG433Nvmzu0khsgHU7yFz+gazlPb2BsqID8qPbmmFF90lQV2GGKyeuYk/4WSa8x/acsXIycXl2QLw0h9cYmiQImWgeO/OL1sJOjY0TOZV1qe1VReRLnjKyhQtGdFj9xAhnHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y7vwvIw1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y7vwvIw1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712390908; x=1743926908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QdVlj0DygaOr3tcThW3K3u+lkDuMw3AH0DaD6aTw3mM=;
  b=Y7vwvIw1JyuA1VpJu4u6Z5ROYI2NJ1plLxrwqAPnKAI6AaFVTjzy7YWX
   F3K2YIBhiwoQ/juo+3/zykM7z0oxVztK/Gh2Y+HipjJ4R28Capm6a3qiS
   5x/4MQn9np7KpMeVWfVjNIKgIlptsUHg2nj1mR1eAmWvWMo//qeH77Jrd
   5iR/q6gQU3uXrlbixkD7rgdJCgYukGcmDGAA2xUDp6UZE42YyJdHVsX8y
   4B94fhPsyV97wYpbWvxfT8usTfhlPmLInCoviJxjzFvU8Ul9hk3GDa0XA
   UTAOfP/QRKr0zjqxzY6Q0qccf9bz8LRPoC++YNuxRS4yXcTXPXnVY8EFC
   Q==;
X-CSE-ConnectionGUID: gFGRG2TJT/qxqX9ui1sz5A==
X-CSE-MsgGUID: Y50wGQNVQdqClnIDLOjzAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7955395"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="7955395"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 01:08:27 -0700
X-CSE-ConnectionGUID: JLgD3cMBSK6eiCIfi3iD3w==
X-CSE-MsgGUID: zmt14TcARxmMZhgRUlSxqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="19247772"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Apr 2024 01:08:26 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rt167-0003GW-1F;
	Sat, 06 Apr 2024 08:08:23 +0000
Date: Sat, 6 Apr 2024 16:07:30 +0800
From: kernel test robot <lkp@intel.com>
To: Barry Song <v-songbaohua@oppo.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 313/322] include/linux/huge_mm.h:274:23: error:
 variably modified 'stats' at file scope
Message-ID: <202404061627.ungVloow-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   f43b3aae94511d62174c3b29239da0dd22d0eeb3
commit: d4358ee0a075e232114dfec0cd162860cfa2771b [313/322] mm: add per-order mTHP anon_alloc and anon_alloc_fallback counters
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240406/202404061627.ungVloow-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404061627.ungVloow-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404061627.ungVloow-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm.h:1115,
                    from include/linux/mman.h:5,
                    from arch/powerpc/kernel/asm-offsets.c:19:
>> include/linux/huge_mm.h:274:23: error: variably modified 'stats' at file scope
     274 |         unsigned long stats[PMD_ORDER + 1][__MTHP_STAT_COUNT];
         |                       ^~~~~
   make[3]: *** [scripts/Makefile.build:117: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1197: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/stats +274 include/linux/huge_mm.h

   272	
   273	struct mthp_stat {
 > 274		unsigned long stats[PMD_ORDER + 1][__MTHP_STAT_COUNT];
   275	};
   276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
