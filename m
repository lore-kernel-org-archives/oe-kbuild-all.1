Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6127D536
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 09:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJ+R/oT1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702547194; x=1734083194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+QV8IAbgteXvTyXSuwn0rViyqeIiJ2FuiUW90+D0qAg=;
  b=XJ+R/oT1++xpu/9dHvo9HOh3gVVoA8PQaTNGdzgAju/BeZ0Z4Ig7yQfd
   YGeNnZ4ob02GGESadJhXi44U3osHHyU11wiTNzIZ7rsEQEm6LfbfumoOJ
   EWDroKHsrel/oHD2dYOY9GE8QjjU6zKh5jibU07t4LDuQwOdsojomXbmS
   BRhghaP3VTIFi/o6FtMf2GSeE5s86NZ6RetksoYnIqBq//0mp7zl4rQSU
   MLMFmr2G/9n6Gwu6wDRmEy9ICoZmrF4rLHR/3g4E2xAuYEAenAcLg0aAb
   FmqheYO/z4FLfXtsVABzCHt5O1KCRq+uydPNEAkPFhwq142XFnTJtsq/w
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="375250306"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="375250306"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 01:46:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="844645121"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="844645121"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 14 Dec 2023 01:46:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDiIY-000Ls3-1v;
	Thu, 14 Dec 2023 09:46:30 +0000
Date: Thu, 14 Dec 2023 17:45:52 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 2/39] fs/cachefiles/ondemand.c:287: undefined
 reference to `fscache_wq'
Message-ID: <202312141736.cEStoMPM-lkp@intel.com>
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
config: x86_64-randconfig-015-20231214 (https://download.01.org/0day-ci/archive/20231214/202312141736.cEStoMPM-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312141736.cEStoMPM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312141736.cEStoMPM-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/linux/instrumented.h:96: undefined reference to `fscache_n_no_write_space'
   ld: fs/cachefiles/cache.o: in function `arch_atomic_inc':
   arch/x86/include/asm/atomic.h:53: undefined reference to `fscache_n_no_write_space'
   ld: fs/cachefiles/cache.o: in function `cachefiles_has_space':
   fs/cachefiles/cache.c:212: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/cache.o: in function `cachefiles_add_cache':
   fs/cachefiles/cache.c:27: undefined reference to `fscache_acquire_cache'
   ld: fs/cachefiles/cache.c:144: undefined reference to `fscache_add_cache'
   ld: fs/cachefiles/cache.c:172: undefined reference to `fscache_relinquish_cache'
   ld: fs/cachefiles/cache.o: in function `cachefiles_withdraw_cache':
   fs/cachefiles/cache.c:371: undefined reference to `fscache_withdraw_cache'
   ld: fs/cachefiles/cache.o: in function `cachefiles_withdraw_objects':
   fs/cachefiles/cache.c:299: undefined reference to `fscache_withdraw_cookie'
   ld: fs/cachefiles/cache.o: in function `cachefiles_withdraw_cache':
   fs/cachefiles/cache.c:382: undefined reference to `fscache_relinquish_cache'
   ld: fs/cachefiles/cache.o: in function `fscache_wait_for_objects':
   include/linux/fscache-cache.h:182: undefined reference to `fscache_clearance_waiters'
   ld: include/linux/fscache-cache.h:182: undefined reference to `fscache_clearance_waiters'
   ld: fs/cachefiles/cache.o: in function `cachefiles_sync_cache':
   fs/cachefiles/cache.c:357: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/interface.o: in function `cachefiles_invalidate_cookie':
   fs/cachefiles/interface.c:419: undefined reference to `fscache_resume_after_invalidation'
   ld: fs/cachefiles/interface.c:396: undefined reference to `fscache_resume_after_invalidation'
   ld: fs/cachefiles/interface.o: in function `cachefiles_shorten_object':
   fs/cachefiles/interface.c:266: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/interface.c:251: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/interface.o: in function `cachefiles_put_object':
   fs/cachefiles/interface.c:98: undefined reference to `fscache_put_cookie'
   ld: fs/cachefiles/interface.o: in function `fscache_uncount_object':
   include/linux/fscache-cache.h:170: undefined reference to `fscache_clearance_waiters'
   ld: fs/cachefiles/interface.o: in function `cachefiles_alloc_object':
   fs/cachefiles/interface.c:45: undefined reference to `fscache_get_cookie'
   ld: fs/cachefiles/interface.o: in function `cachefiles_lookup_cookie':
   fs/cachefiles/interface.c:215: undefined reference to `fscache_caching_failed'
   ld: fs/cachefiles/interface.o: in function `cachefiles_adjust_size':
   fs/cachefiles/interface.c:166: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/io.o: in function `cachefiles_query_occupancy':
   fs/cachefiles/io.c:208: undefined reference to `fscache_wait_for_operation'
   ld: fs/cachefiles/io.o: in function `cachefiles_read':
   fs/cachefiles/io.c:87: undefined reference to `fscache_wait_for_operation'
   ld: fs/cachefiles/io.o: in function `instrument_atomic_read_write':
   include/linux/instrumented.h:96: undefined reference to `fscache_n_read'
   ld: fs/cachefiles/io.o: in function `arch_atomic_inc':
   arch/x86/include/asm/atomic.h:53: undefined reference to `fscache_n_read'
   ld: fs/cachefiles/io.o: in function `cachefiles_do_prepare_read':
   fs/cachefiles/io.c:412: undefined reference to `fscache_wait_for_operation'
   ld: fs/cachefiles/io.o: in function `instrument_atomic_read_write':
   include/linux/instrumented.h:96: undefined reference to `fscache_n_write'
   ld: fs/cachefiles/io.o: in function `arch_atomic_inc':
   arch/x86/include/asm/atomic.h:53: undefined reference to `fscache_n_write'
   ld: fs/cachefiles/io.o: in function `cachefiles_write':
   fs/cachefiles/io.c:365: undefined reference to `fscache_wait_for_operation'
   ld: fs/cachefiles/io.o: in function `instrument_atomic_read_write':
   include/linux/instrumented.h:96: undefined reference to `fscache_n_no_write_space'
   ld: fs/cachefiles/io.o: in function `arch_atomic_inc':
   arch/x86/include/asm/atomic.h:53: undefined reference to `fscache_n_no_write_space'
   ld: fs/cachefiles/io.o: in function `__cachefiles_prepare_write':
   fs/cachefiles/io.c:581: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/io.o: in function `cachefiles_prepare_write':
   fs/cachefiles/io.c:603: undefined reference to `fscache_wait_for_operation'
   ld: fs/cachefiles/io.o: in function `cachefiles_end_operation':
   fs/cachefiles/io.c:626: undefined reference to `fscache_end_cookie_access'
   ld: fs/cachefiles/namei.o: in function `cachefiles_lookup_for_cull':
   fs/cachefiles/namei.c:779: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/namei.o: in function `cachefiles_unlink':
   fs/cachefiles/namei.c:250: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/namei.o: in function `cachefiles_bury_object':
   fs/cachefiles/namei.c:371: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/namei.c:400: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/namei.o: in function `cachefiles_create_tmpfile':
   fs/cachefiles/namei.c:464: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/namei.o: in function `cachefiles_look_up_object':
   fs/cachefiles/namei.c:663: undefined reference to `fscache_cookie_lookup_negative'
   ld: fs/cachefiles/namei.c:641: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/namei.o: in function `cachefiles_open_file':
   fs/cachefiles/namei.c:601: undefined reference to `fscache_cookie_lookup_negative'
   ld: fs/cachefiles/namei.o: in function `instrument_atomic_read_write':
   include/linux/instrumented.h:96: undefined reference to `fscache_n_culled'
   ld: fs/cachefiles/namei.o: in function `arch_atomic_inc':
   arch/x86/include/asm/atomic.h:53: undefined reference to `fscache_n_culled'
   ld: fs/cachefiles/volume.o: in function `trace_fscache_access_volume':
   include/trace/events/fscache.h:344: undefined reference to `__tracepoint_fscache_access_volume'
   ld: include/trace/events/fscache.h:344: undefined reference to `__tracepoint_fscache_access_volume'
   ld: include/trace/events/fscache.h:344: undefined reference to `__SCT__tp_func_fscache_access_volume'
   ld: include/trace/events/fscache.h:344: undefined reference to `__tracepoint_fscache_access_volume'
   ld: fs/cachefiles/volume.o: in function `cachefiles_withdraw_volume':
   fs/cachefiles/volume.c:136: undefined reference to `fscache_withdraw_volume'
   ld: fs/cachefiles/volume.o:(__jump_table+0x8): undefined reference to `__tracepoint_fscache_access_volume'
   ld: fs/cachefiles/volume.o:(.static_call_sites+0x4): undefined reference to `__SCK__tp_func_fscache_access_volume'
   ld: fs/cachefiles/xattr.o: in function `cachefiles_set_object_xattr':
   fs/cachefiles/xattr.c:77: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/xattr.o: in function `cachefiles_check_auxdata':
   fs/cachefiles/xattr.c:117: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/xattr.o: in function `cachefiles_remove_object_xattr':
   fs/cachefiles/xattr.c:160: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/xattr.o: in function `cachefiles_set_volume_xattr':
   fs/cachefiles/xattr.c:218: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/xattr.o: in function `cachefiles_check_volume_xattr':
   fs/cachefiles/xattr.c:258: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/ondemand.o: in function `cachefiles_ondemand_select_req':
>> fs/cachefiles/ondemand.c:287: undefined reference to `fscache_wq'
   ld: fs/cachefiles/ondemand.o: in function `queue_work':
>> include/linux/workqueue.h:562: undefined reference to `fscache_wq'
   ld: fs/cachefiles/ondemand.o: in function `cachefiles_ondemand_select_req':
>> fs/cachefiles/ondemand.c:287: undefined reference to `fscache_wq'


vim +287 fs/cachefiles/ondemand.c

0a7e54c1959c0f Jia Zhu 2023-11-20  267  
0a7e54c1959c0f Jia Zhu 2023-11-20  268  /*
0a7e54c1959c0f Jia Zhu 2023-11-20  269   * If there are any inflight or subsequent READ requests on the
0a7e54c1959c0f Jia Zhu 2023-11-20  270   * closed object, reopen it.
0a7e54c1959c0f Jia Zhu 2023-11-20  271   * Skip read requests whose related object is reopening.
0a7e54c1959c0f Jia Zhu 2023-11-20  272   */
0a7e54c1959c0f Jia Zhu 2023-11-20  273  static struct cachefiles_req *cachefiles_ondemand_select_req(struct xa_state *xas,
0a7e54c1959c0f Jia Zhu 2023-11-20  274  							      unsigned long xa_max)
0a7e54c1959c0f Jia Zhu 2023-11-20  275  {
0a7e54c1959c0f Jia Zhu 2023-11-20  276  	struct cachefiles_req *req;
0a7e54c1959c0f Jia Zhu 2023-11-20  277  	struct cachefiles_object *object;
0a7e54c1959c0f Jia Zhu 2023-11-20  278  	struct cachefiles_ondemand_info *info;
0a7e54c1959c0f Jia Zhu 2023-11-20  279  
0a7e54c1959c0f Jia Zhu 2023-11-20  280  	xas_for_each_marked(xas, req, xa_max, CACHEFILES_REQ_NEW) {
0a7e54c1959c0f Jia Zhu 2023-11-20  281  		if (req->msg.opcode != CACHEFILES_OP_READ)
0a7e54c1959c0f Jia Zhu 2023-11-20  282  			return req;
0a7e54c1959c0f Jia Zhu 2023-11-20  283  		object = req->object;
0a7e54c1959c0f Jia Zhu 2023-11-20  284  		info = object->ondemand;
0a7e54c1959c0f Jia Zhu 2023-11-20  285  		if (cachefiles_ondemand_object_is_close(object)) {
0a7e54c1959c0f Jia Zhu 2023-11-20  286  			cachefiles_ondemand_set_object_reopening(object);
0a7e54c1959c0f Jia Zhu 2023-11-20 @287  			queue_work(fscache_wq, &info->ondemand_work);
0a7e54c1959c0f Jia Zhu 2023-11-20  288  			continue;
0a7e54c1959c0f Jia Zhu 2023-11-20  289  		}
0a7e54c1959c0f Jia Zhu 2023-11-20  290  		if (cachefiles_ondemand_object_is_reopening(object))
0a7e54c1959c0f Jia Zhu 2023-11-20  291  			continue;
0a7e54c1959c0f Jia Zhu 2023-11-20  292  		return req;
0a7e54c1959c0f Jia Zhu 2023-11-20  293  	}
0a7e54c1959c0f Jia Zhu 2023-11-20  294  	return NULL;
0a7e54c1959c0f Jia Zhu 2023-11-20  295  }
0a7e54c1959c0f Jia Zhu 2023-11-20  296  

:::::: The code at line 287 was first introduced by commit
:::::: 0a7e54c1959c0feb2de23397ec09c7692364313e cachefiles: resend an open request if the read request's object is closed

:::::: TO: Jia Zhu <zhujia.zj@bytedance.com>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
