Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC5135F0A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 09:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HA1KkHWo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702547801; x=1734083801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RqJZp62Ztj1vHsYr9yGB9aYLvwWDNYtgJt7JK3oUqz0=;
  b=HA1KkHWoRKF/Iy9yWD8u9rem5iiKWvStXBWB82/77mhwPWpeWA+VnywA
   QD4LbaVVHrH34GHzO3b24ZbXOcBov6udzCMD+Lef0t3/O9N7GodMA3p7U
   OwQ0xhC0nEy05UhLPjrKVyknC1lK6mNMA33PgwP4BaxaIb+0XCZwnCNb8
   azMMFSZHx2BdjQxTvHBxbmZKZJa0m5I2aXHVgKKOfJ+PwGA0HByCqV8vN
   56dBi5I2YX2TdDkMzKCahryBUetvB32ny08suRQEnD9MhxMxO7EX3d1be
   sLdDjjG9zWH4KHsddsqxOV9pud74/OyAhnlKI4yDnSTH7as5G8G5z0Gyj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="398933032"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="398933032"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 01:56:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="864967905"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="864967905"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Dec 2023 01:56:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDiSF-000LsR-05;
	Thu, 14 Dec 2023 09:56:31 +0000
Date: Thu, 14 Dec 2023 17:56:14 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 2/39] ld: arch/x86/include/asm/atomic.h:23:
 undefined reference to `__tracepoint_fscache_access_volume'
Message-ID: <202312141717.487gMDH6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   0e2ac5291cc1c3c45e5ee784357b3f51b611195f
commit: f226a193dad5bb11b03dec94d3d2d1daff3db91f [2/39] netfs, fscache: Combine fscache with netfs
config: x86_64-randconfig-073-20231214 (https://download.01.org/0day-ci/archive/20231214/202312141717.487gMDH6-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312141717.487gMDH6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312141717.487gMDH6-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `instrument_atomic_read_write':
   include/linux/instrumented.h:96: undefined reference to `fscache_n_no_create_space'
   ld: vmlinux.o: in function `arch_atomic_inc':
   arch/x86/include/asm/atomic.h:53: undefined reference to `fscache_n_no_create_space'
   ld: vmlinux.o: in function `instrument_atomic_read_write':
   include/linux/instrumented.h:96: undefined reference to `fscache_n_no_write_space'
   ld: vmlinux.o: in function `arch_atomic_inc':
   arch/x86/include/asm/atomic.h:53: undefined reference to `fscache_n_no_write_space'
   ld: vmlinux.o: in function `cachefiles_has_space':
   fs/cachefiles/cache.c:212: undefined reference to `fscache_io_error'
   ld: vmlinux.o: in function `cachefiles_add_cache':
   fs/cachefiles/cache.c:27: undefined reference to `fscache_acquire_cache'
   ld: fs/cachefiles/cache.c:144: undefined reference to `fscache_add_cache'
   ld: fs/cachefiles/cache.c:172: undefined reference to `fscache_relinquish_cache'
   ld: vmlinux.o: in function `cachefiles_withdraw_cache':
   fs/cachefiles/cache.c:371: undefined reference to `fscache_withdraw_cache'
   ld: vmlinux.o: in function `cachefiles_withdraw_objects':
   fs/cachefiles/cache.c:299: undefined reference to `fscache_withdraw_cookie'
   ld: vmlinux.o: in function `cachefiles_withdraw_cache':
   fs/cachefiles/cache.c:382: undefined reference to `fscache_relinquish_cache'
   ld: vmlinux.o: in function `fscache_wait_for_objects':
   include/linux/fscache-cache.h:182: undefined reference to `fscache_clearance_waiters'
   ld: include/linux/fscache-cache.h:182: undefined reference to `fscache_clearance_waiters'
   ld: vmlinux.o: in function `cachefiles_sync_cache':
   fs/cachefiles/cache.c:357: undefined reference to `fscache_io_error'
   ld: vmlinux.o: in function `cachefiles_invalidate_cookie':
   fs/cachefiles/interface.c:419: undefined reference to `fscache_resume_after_invalidation'
   ld: fs/cachefiles/interface.c:396: undefined reference to `fscache_resume_after_invalidation'
   ld: vmlinux.o: in function `cachefiles_shorten_object':
   fs/cachefiles/interface.c:266: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/interface.c:251: undefined reference to `fscache_io_error'
   ld: vmlinux.o: in function `cachefiles_put_object':
   fs/cachefiles/interface.c:98: undefined reference to `fscache_put_cookie'
   ld: vmlinux.o: in function `fscache_uncount_object':
   include/linux/fscache-cache.h:170: undefined reference to `fscache_clearance_waiters'
   ld: vmlinux.o: in function `cachefiles_alloc_object':
   fs/cachefiles/interface.c:45: undefined reference to `fscache_get_cookie'
   ld: vmlinux.o: in function `cachefiles_lookup_cookie':
   fs/cachefiles/interface.c:215: undefined reference to `fscache_caching_failed'
   ld: vmlinux.o: in function `cachefiles_adjust_size':
   fs/cachefiles/interface.c:166: undefined reference to `fscache_io_error'
   ld: vmlinux.o: in function `cachefiles_query_occupancy':
   fs/cachefiles/io.c:208: undefined reference to `fscache_wait_for_operation'
   ld: vmlinux.o: in function `cachefiles_end_operation':
   fs/cachefiles/io.c:626: undefined reference to `fscache_end_cookie_access'
   ld: vmlinux.o: in function `cachefiles_read':
   fs/cachefiles/io.c:87: undefined reference to `fscache_wait_for_operation'
   ld: vmlinux.o: in function `instrument_atomic_read_write':
   include/linux/instrumented.h:96: undefined reference to `fscache_n_read'
   ld: vmlinux.o: in function `arch_atomic_inc':
   arch/x86/include/asm/atomic.h:53: undefined reference to `fscache_n_read'
   ld: vmlinux.o: in function `cachefiles_do_prepare_read':
   fs/cachefiles/io.c:412: undefined reference to `fscache_wait_for_operation'
   ld: fs/cachefiles/io.c:412: undefined reference to `fscache_wait_for_operation'
   ld: vmlinux.o: in function `instrument_atomic_read_write':
   include/linux/instrumented.h:96: undefined reference to `fscache_n_write'
   ld: vmlinux.o: in function `arch_atomic_inc':
   arch/x86/include/asm/atomic.h:53: undefined reference to `fscache_n_write'
   ld: vmlinux.o: in function `cachefiles_write':
   fs/cachefiles/io.c:365: undefined reference to `fscache_wait_for_operation'
   ld: vmlinux.o: in function `instrument_atomic_read_write':
   include/linux/instrumented.h:96: undefined reference to `fscache_n_no_write_space'
   ld: vmlinux.o: in function `arch_atomic_inc':
   arch/x86/include/asm/atomic.h:53: undefined reference to `fscache_n_no_write_space'
   ld: vmlinux.o: in function `__cachefiles_prepare_write':
   fs/cachefiles/io.c:581: undefined reference to `fscache_io_error'
   ld: vmlinux.o: in function `cachefiles_prepare_write':
   fs/cachefiles/io.c:603: undefined reference to `fscache_wait_for_operation'
   ld: vmlinux.o: in function `cachefiles_lookup_for_cull':
   fs/cachefiles/namei.c:779: undefined reference to `fscache_io_error'
   ld: vmlinux.o: in function `cachefiles_unlink':
   fs/cachefiles/namei.c:250: undefined reference to `fscache_io_error'
   ld: vmlinux.o: in function `cachefiles_bury_object':
   fs/cachefiles/namei.c:371: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/namei.c:400: undefined reference to `fscache_io_error'
   ld: vmlinux.o: in function `cachefiles_create_tmpfile':
   fs/cachefiles/namei.c:464: undefined reference to `fscache_io_error'
   ld: vmlinux.o: in function `cachefiles_look_up_object':
   fs/cachefiles/namei.c:663: undefined reference to `fscache_cookie_lookup_negative'
   ld: fs/cachefiles/namei.c:641: undefined reference to `fscache_io_error'
   ld: vmlinux.o: in function `cachefiles_open_file':
   fs/cachefiles/namei.c:601: undefined reference to `fscache_cookie_lookup_negative'
   ld: vmlinux.o: in function `instrument_atomic_read_write':
   include/linux/instrumented.h:96: undefined reference to `fscache_n_culled'
   ld: vmlinux.o: in function `arch_atomic_inc':
   arch/x86/include/asm/atomic.h:53: undefined reference to `fscache_n_culled'
   ld: vmlinux.o: in function `arch_atomic_read':
   arch/x86/include/asm/atomic.h:23: undefined reference to `__tracepoint_fscache_access_volume'
>> ld: arch/x86/include/asm/atomic.h:23: undefined reference to `__tracepoint_fscache_access_volume'
   ld: vmlinux.o: in function `trace_fscache_access_volume':
   include/trace/events/fscache.h:344: undefined reference to `__tracepoint_fscache_access_volume'
   ld: include/trace/events/fscache.h:344: undefined reference to `__tracepoint_fscache_access_volume'
   ld: include/trace/events/fscache.h:344: undefined reference to `__SCT__tp_func_fscache_access_volume'
   ld: include/trace/events/fscache.h:344: undefined reference to `__tracepoint_fscache_access_volume'
   ld: vmlinux.o: in function `arch_atomic_read':
   arch/x86/include/asm/atomic.h:23: undefined reference to `__tracepoint_fscache_access_volume'
   ld: vmlinux.o: in function `cachefiles_withdraw_volume':
   fs/cachefiles/volume.c:136: undefined reference to `fscache_withdraw_volume'
   ld: vmlinux.o: in function `cachefiles_set_object_xattr':
   fs/cachefiles/xattr.c:77: undefined reference to `fscache_io_error'
   ld: vmlinux.o: in function `cachefiles_check_auxdata':
   fs/cachefiles/xattr.c:117: undefined reference to `fscache_io_error'
   ld: vmlinux.o: in function `cachefiles_remove_object_xattr':
   fs/cachefiles/xattr.c:160: undefined reference to `fscache_io_error'
   ld: vmlinux.o: in function `cachefiles_set_volume_xattr':
   fs/cachefiles/xattr.c:218: undefined reference to `fscache_io_error'
   ld: vmlinux.o: in function `cachefiles_check_volume_xattr':
   fs/cachefiles/xattr.c:258: undefined reference to `fscache_io_error'
   ld: vmlinux.o:(.static_call_sites+0x5554): undefined reference to `__SCK__tp_func_fscache_access_volume'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
