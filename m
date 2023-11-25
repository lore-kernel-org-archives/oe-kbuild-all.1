Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2041FA50
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 03:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BERmm4Z0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700881975; x=1732417975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eyLhG+XR7VOknjifa3/i/y7MstR4AxrMjrZGrxTSzcQ=;
  b=BERmm4Z0ssL95OCFz0MM/Tx5LQVHrwv2RxyiCLFPre8awSFp02yYYQbq
   VaRixfW8b+fCi0gFisCp/oJSGaNFrAaX0nTSmHZgdkjMrTR+3EHkEBoJd
   bLyALkZ27aFsz4L4qjXjhdvHGCivU3smbMi4Rs8xUf68Slqkt8G34JqoH
   xqBeQCoKM9OATORbTS1ScN4zykXkG3ak+IZAyGWROG24AgDI0EtIFv27P
   OXLLjKQVXMk1e/6H9Dmd4heJyZc7AB6rgqGFWVjpZ8cnLKxOIPREhZK4J
   ylLOr4Ax8dI6LBt97HpPaaWyMma0GYjy1AIBZIesv7JNilhtSn7lDmyLZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="5716330"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="5716330"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 19:12:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="744025368"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="744025368"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 24 Nov 2023 19:12:51 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6j69-0003Zi-1s;
	Sat, 25 Nov 2023 03:12:49 +0000
Date: Sat, 25 Nov 2023 11:11:49 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 2/56] ld: include/trace/events/fscache.h:344:
 undefined reference to `__tracepoint_fscache_access_volume'
Message-ID: <202311250937.bQdxY60g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   69448342f13a737a392c45f17205bc3eaf242e9d
commit: 031d235d7fa5123ed79828d620934dabe41473ea [2/56] netfs, fscache: Combine fscache with netfs
config: x86_64-randconfig-012-20231125 (https://download.01.org/0day-ci/archive/20231125/202311250937.bQdxY60g-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311250937.bQdxY60g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311250937.bQdxY60g-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `instrument_atomic_read_write':
>> include/linux/instrumented.h:96: undefined reference to `fscache_n_no_create_space'
   ld: vmlinux.o: in function `arch_atomic_inc':
>> arch/x86/include/asm/atomic.h:53: undefined reference to `fscache_n_no_create_space'
   ld: vmlinux.o: in function `instrument_atomic_read_write':
>> include/linux/instrumented.h:96: undefined reference to `fscache_n_no_write_space'
   ld: vmlinux.o: in function `arch_atomic_inc':
>> arch/x86/include/asm/atomic.h:53: undefined reference to `fscache_n_no_write_space'
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
   fs/cachefiles/interface.c:414: undefined reference to `fscache_resume_after_invalidation'
   ld: fs/cachefiles/interface.c:391: undefined reference to `fscache_resume_after_invalidation'
   ld: vmlinux.o: in function `cachefiles_shorten_object':
   fs/cachefiles/interface.c:261: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/interface.c:246: undefined reference to `fscache_io_error'
   ld: vmlinux.o: in function `cachefiles_put_object':
   fs/cachefiles/interface.c:93: undefined reference to `fscache_put_cookie'
   ld: vmlinux.o: in function `fscache_uncount_object':
   include/linux/fscache-cache.h:170: undefined reference to `fscache_clearance_waiters'
   ld: vmlinux.o: in function `cachefiles_alloc_object':
   fs/cachefiles/interface.c:40: undefined reference to `fscache_get_cookie'
   ld: vmlinux.o: in function `cachefiles_lookup_cookie':
   fs/cachefiles/interface.c:210: undefined reference to `fscache_caching_failed'
   ld: vmlinux.o: in function `cachefiles_adjust_size':
   fs/cachefiles/interface.c:161: undefined reference to `fscache_io_error'
   ld: vmlinux.o: in function `cachefiles_query_occupancy':
   fs/cachefiles/io.c:208: undefined reference to `fscache_wait_for_operation'
   ld: vmlinux.o: in function `cachefiles_end_operation':
   fs/cachefiles/io.c:627: undefined reference to `fscache_end_cookie_access'
   ld: vmlinux.o: in function `cachefiles_read':
   fs/cachefiles/io.c:87: undefined reference to `fscache_wait_for_operation'
   ld: vmlinux.o: in function `instrument_atomic_read_write':
>> include/linux/instrumented.h:96: undefined reference to `fscache_n_read'
   ld: vmlinux.o: in function `arch_atomic_inc':
>> arch/x86/include/asm/atomic.h:53: undefined reference to `fscache_n_read'
   ld: vmlinux.o: in function `cachefiles_do_prepare_read':
   fs/cachefiles/io.c:413: undefined reference to `fscache_wait_for_operation'
   ld: vmlinux.o: in function `instrument_atomic_read_write':
>> include/linux/instrumented.h:96: undefined reference to `fscache_n_write'
   ld: vmlinux.o: in function `arch_atomic_inc':
>> arch/x86/include/asm/atomic.h:53: undefined reference to `fscache_n_write'
   ld: vmlinux.o: in function `cachefiles_write':
   fs/cachefiles/io.c:366: undefined reference to `fscache_wait_for_operation'
   ld: vmlinux.o: in function `instrument_atomic_read_write':
>> include/linux/instrumented.h:96: undefined reference to `fscache_n_no_write_space'
   ld: vmlinux.o: in function `arch_atomic_inc':
>> arch/x86/include/asm/atomic.h:53: undefined reference to `fscache_n_no_write_space'
   ld: vmlinux.o: in function `__cachefiles_prepare_write':
   fs/cachefiles/io.c:582: undefined reference to `fscache_io_error'
   ld: vmlinux.o: in function `cachefiles_prepare_write':
   fs/cachefiles/io.c:604: undefined reference to `fscache_wait_for_operation'
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
>> include/linux/instrumented.h:96: undefined reference to `fscache_n_culled'
   ld: vmlinux.o: in function `arch_atomic_inc':
>> arch/x86/include/asm/atomic.h:53: undefined reference to `fscache_n_culled'
   ld: vmlinux.o: in function `trace_fscache_access_volume':
   include/trace/events/fscache.h:344: undefined reference to `__tracepoint_fscache_access_volume'
>> ld: include/trace/events/fscache.h:344: undefined reference to `__tracepoint_fscache_access_volume'
   ld: include/trace/events/fscache.h:344: undefined reference to `__SCT__tp_func_fscache_access_volume'
>> ld: include/trace/events/fscache.h:344: undefined reference to `__tracepoint_fscache_access_volume'
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
   ld: vmlinux.o: in function `fscache_unuse_cookie':
   include/linux/fscache.h:289: undefined reference to `__fscache_unuse_cookie'
   ld: vmlinux.o: in function `fscache_relinquish_cookie':
   include/linux/fscache.h:308: undefined reference to `__fscache_relinquish_cookie'
   ld: vmlinux.o: in function `fscache_acquire_cookie':
   include/linux/fscache.h:253: undefined reference to `__fscache_acquire_cookie'
   ld: vmlinux.o: in function `fscache_use_cookie':
   include/linux/fscache.h:272: undefined reference to `__fscache_use_cookie'
   ld: vmlinux.o: in function `fscache_unuse_cookie':
   include/linux/fscache.h:289: undefined reference to `__fscache_unuse_cookie'
   ld: vmlinux.o: in function `fscache_relinquish_cookie':
   include/linux/fscache.h:308: undefined reference to `__fscache_relinquish_cookie'
   ld: vmlinux.o: in function `fscache_acquire_volume':
   include/linux/fscache.h:204: undefined reference to `__fscache_acquire_volume'
   ld: vmlinux.o: in function `fscache_relinquish_volume':
   include/linux/fscache.h:224: undefined reference to `__fscache_relinquish_volume'
   ld: vmlinux.o: in function `fscache_begin_read_operation':
   include/linux/fscache.h:457: undefined reference to `__fscache_begin_read_operation'
   ld: vmlinux.o: in function `fscache_relinquish_volume':
   include/linux/fscache.h:224: undefined reference to `__fscache_relinquish_volume'
>> ld: vmlinux.o:(__jump_table+0xd3d8): undefined reference to `__tracepoint_fscache_access_volume'
   ld: vmlinux.o:(.static_call_sites+0x375c): undefined reference to `__SCK__tp_func_fscache_access_volume'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
