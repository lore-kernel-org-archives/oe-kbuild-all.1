Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E8E14A4FB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Nov 2024 17:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731346114; cv=none; b=h8wXmkrmJTf6dONBHV2yAP8qE5X6i/wwY4cTPkRNswMOG9hFLZV7h5D1Pq6x8eG9JGu7XwA1bWGjhSyWtcv+wzVJTJxVvxLXE1DvSVaDALhGHQEb94hk/1tlkJcx1YNtkTU9Bu/F+mYPmbfdRy4kwlwGLkUAHFjAsdxcMxJKIFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731346114; c=relaxed/simple;
	bh=rzCNnHmwFdPow+Of3VeBSW84Td3r3FIrx+eFW/L77K0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c9MXK6Ty4BgorW+JgxDvQsgpIuiaNRPOXVoUVTTBv7hGLVFsH42RzcreJMnDTgAuyktN+GD34IRC1is3TZuMjEf0S0h1YFc+gyLlk67a00bgMMctDqwFKRaFT4Q/ddgKMllC7v/65JOM4Fz1dX5tCxQrC2EQI+OhI912zn/qwBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ONC3O2S3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ONC3O2S3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731346112; x=1762882112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rzCNnHmwFdPow+Of3VeBSW84Td3r3FIrx+eFW/L77K0=;
  b=ONC3O2S3CU6Zt8n4Si+ykMB6jY4FYIRbys3IPrmMetOKbbaX0C4a8H69
   0Dgf7HURhgsU8a9BLc0JVix+17rrg3YiWjiMaZCjRobmR45VByWMtVToJ
   UN1TCABTrAHcntI9W6i/PhuKyRcrDOxh83yHzqFLeWuDanot6hfApGID7
   txThFb6p+3A9f8jzZggSOcttdx8mlK5ojltHUH3Z5xyq764EMApJyebCK
   wbuw9V/lubnSS1xgG8iol2F6ADlUHTl2XRtudTBty1lVXVVhofi1Fm4RV
   oQ2C3rH/j7363BX+MqLfL7jTGMjjuzEL+2GJLP5/mdB3+eZSe16kXe5VV
   A==;
X-CSE-ConnectionGUID: iZd6QDkKSYm+Gog4v6pQlA==
X-CSE-MsgGUID: E88iu+QZSLueGJhRjmjwpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30926439"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30926439"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 09:28:32 -0800
X-CSE-ConnectionGUID: B5pbK1DqRfyA+Wem8qW81A==
X-CSE-MsgGUID: q8NyhpPrTOKI3SmsKsRVYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; 
   d="scan'208";a="91539335"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Nov 2024 09:28:31 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAYDE-00005D-34;
	Mon, 11 Nov 2024 17:28:28 +0000
Date: Tue, 12 Nov 2024 01:28:13 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 57/64] include/linux/lockdep.h:252:61: error:
 invalid type argument of '->' (have 'struct rw_semaphore')
Message-ID: <202411120126.V3QPmlP2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   f9bf4d561e545fe8e988fb807cc47d879f0a00f8
commit: 2f5de4ae28a5883ab65a767f5b0f1c7cc85bc0eb [57/64] xfs: add a separate data structure for open zones
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20241112/202411120126.V3QPmlP2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411120126.V3QPmlP2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411120126.V3QPmlP2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:99,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:6,
                    from include/linux/string.h:390,
                    from include/linux/uuid.h:11,
                    from fs/xfs/xfs_linux.h:10,
                    from fs/xfs/xfs.h:26,
                    from fs/xfs/xfs_zone_alloc.c:5:
   fs/xfs/xfs_zone_alloc.c: In function 'xfs_zone_rgbno_is_valid':
>> include/linux/lockdep.h:252:61: error: invalid type argument of '->' (have 'struct rw_semaphore')
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                             ^~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/lockdep.h:285:9: note: in expansion of macro 'lockdep_assert'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^~~~~~~~~~~~~~
   include/linux/lockdep.h:285:24: note: in expansion of macro 'lockdep_is_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |                        ^~~~~~~~~~~~~~~
   fs/xfs/xfs_zone_alloc.c:616:9: note: in expansion of macro 'lockdep_assert_held'
     616 |         lockdep_assert_held(rtg_rmap(rtg)->i_lock);
         |         ^~~~~~~~~~~~~~~~~~~


vim +252 include/linux/lockdep.h

f607c668577481 Peter Zijlstra 2009-07-20  251  
f8319483f57f1c Peter Zijlstra 2016-11-30 @252  #define lockdep_is_held(lock)		lock_is_held(&(lock)->dep_map)
f8319483f57f1c Peter Zijlstra 2016-11-30  253  #define lockdep_is_held_type(lock, r)	lock_is_held_type(&(lock)->dep_map, (r))
f607c668577481 Peter Zijlstra 2009-07-20  254  

:::::: The code at line 252 was first introduced by commit
:::::: f8319483f57f1ca22370f4150bb990aca7728a67 locking/lockdep: Provide a type check for lock_is_held

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Dave Chinner <david@fromorbit.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
