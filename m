Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634201109
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 02:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SD8jkr+3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700878650; x=1732414650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xqeadwd8NwUuRS5C7JnEJ1Pef7VbTRIEqkqFaUmIuhA=;
  b=SD8jkr+3Mz2w0M7TnUtg9l8bmOoTB6ksZR155HH6dvgl6HQ0DNXZ6VQ5
   DOmMmdyPd69UBr3IeyCCkKa9Hn0/gGvfCXNgG+hpaAn6eFjtdbfTbPEgw
   VXLJ+jtytcW0DWbJN9hQr6NGm7J+NTi/Ut4IvB8z2wcWV74g/2/DNTgSg
   0QX8G66tdMUEGtbsnn3Sbt4/sLEj5/aK7t0kt+6WCckvPL7JYsjRql7KX
   JfFmvtH6mkmcCfQSGk0qCbfKFXjU4dqSXuNIYl0oaNXG15/ls7/HPlm6W
   WMkkp/O3q2CxNTvTnHz4bFXMNfvPjtwNQNexmks3SE+W+d9fBnjwxwnW2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="478693296"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="478693296"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 18:17:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="16094863"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Nov 2023 18:17:22 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6iES-0003Xg-0L;
	Sat, 25 Nov 2023 02:17:20 +0000
Date: Sat, 25 Nov 2023 10:16:19 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 2/56] include/linux/fscache.h:289: undefined
 reference to `__fscache_unuse_cookie'
Message-ID: <202311250748.ET6Wl8Kj-lkp@intel.com>
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
config: i386-randconfig-003-20231125 (https://download.01.org/0day-ci/archive/20231125/202311250748.ET6Wl8Kj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311250748.ET6Wl8Kj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311250748.ET6Wl8Kj-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   fs/cachefiles/interface.c:414: undefined reference to `fscache_resume_after_invalidation'
   ld: fs/cachefiles/interface.c:391: undefined reference to `fscache_resume_after_invalidation'
   ld: fs/cachefiles/interface.o: in function `cachefiles_adjust_size':
   fs/cachefiles/interface.c:161: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/interface.o: in function `cachefiles_shorten_object':
   fs/cachefiles/interface.c:261: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/interface.o: in function `cachefiles_put_object':
   fs/cachefiles/interface.c:93: undefined reference to `fscache_put_cookie'
   ld: fs/cachefiles/interface.o: in function `fscache_uncount_object':
   include/linux/fscache-cache.h:170: undefined reference to `fscache_clearance_waiters'
   ld: fs/cachefiles/interface.o: in function `cachefiles_alloc_object':
   fs/cachefiles/interface.c:40: undefined reference to `fscache_get_cookie'
   ld: fs/cachefiles/interface.o: in function `cachefiles_lookup_cookie':
   fs/cachefiles/interface.c:210: undefined reference to `fscache_caching_failed'
   ld: fs/cachefiles/io.o: in function `cachefiles_query_occupancy':
   fs/cachefiles/io.c:208: undefined reference to `fscache_wait_for_operation'
   ld: fs/cachefiles/io.o: in function `cachefiles_end_operation':
   fs/cachefiles/io.c:627: undefined reference to `fscache_end_cookie_access'
   ld: fs/cachefiles/io.o: in function `cachefiles_read':
   fs/cachefiles/io.c:87: undefined reference to `fscache_wait_for_operation'
   ld: fs/cachefiles/io.o: in function `cachefiles_do_prepare_read':
   fs/cachefiles/io.c:413: undefined reference to `fscache_wait_for_operation'
   ld: fs/cachefiles/io.o: in function `cachefiles_write':
   fs/cachefiles/io.c:366: undefined reference to `fscache_wait_for_operation'
   ld: fs/cachefiles/io.o: in function `__cachefiles_prepare_write':
   fs/cachefiles/io.c:582: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/io.o: in function `cachefiles_prepare_write':
   fs/cachefiles/io.c:604: undefined reference to `fscache_wait_for_operation'
   ld: fs/cachefiles/namei.o: in function `cachefiles_lookup_for_cull':
   fs/cachefiles/namei.c:779: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/namei.o: in function `cachefiles_unlink':
   fs/cachefiles/namei.c:242: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/namei.c:250: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/namei.o: in function `cachefiles_bury_object':
   fs/cachefiles/namei.c:348: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/namei.c:320: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/namei.o:fs/cachefiles/namei.c:326: more undefined references to `fscache_io_error' follow
   ld: fs/cachefiles/namei.o: in function `cachefiles_open_file':
   fs/cachefiles/namei.c:601: undefined reference to `fscache_cookie_lookup_negative'
   ld: fs/cachefiles/namei.o: in function `cachefiles_look_up_object':
   fs/cachefiles/namei.c:663: undefined reference to `fscache_cookie_lookup_negative'
   ld: fs/cachefiles/namei.c:641: undefined reference to `fscache_io_error'
   ld: fs/cachefiles/volume.o: in function `arch_atomic_read':
   arch/x86/include/asm/atomic.h:23: undefined reference to `__tracepoint_fscache_access_volume'
   ld: fs/cachefiles/volume.o: in function `trace_fscache_access_volume':
   include/trace/events/fscache.h:344: undefined reference to `__tracepoint_fscache_access_volume'
   ld: include/trace/events/fscache.h:344: undefined reference to `__SCT__tp_func_fscache_access_volume'
   ld: fs/cachefiles/volume.o: in function `cachefiles_withdraw_volume':
   fs/cachefiles/volume.c:136: undefined reference to `fscache_withdraw_volume'
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
   ld: fs/erofs/fscache.o: in function `fscache_unuse_cookie':
>> include/linux/fscache.h:289: undefined reference to `__fscache_unuse_cookie'
   ld: fs/erofs/fscache.o: in function `fscache_relinquish_cookie':
>> include/linux/fscache.h:308: undefined reference to `__fscache_relinquish_cookie'
   ld: fs/erofs/fscache.o: in function `fscache_acquire_volume':
>> include/linux/fscache.h:204: undefined reference to `__fscache_acquire_volume'
   ld: fs/erofs/fscache.o: in function `fscache_acquire_cookie':
>> include/linux/fscache.h:253: undefined reference to `__fscache_acquire_cookie'
   ld: fs/erofs/fscache.o: in function `fscache_use_cookie':
>> include/linux/fscache.h:272: undefined reference to `__fscache_use_cookie'
   ld: fs/erofs/fscache.o: in function `fscache_unuse_cookie':
>> include/linux/fscache.h:289: undefined reference to `__fscache_unuse_cookie'
   ld: fs/erofs/fscache.o: in function `fscache_relinquish_cookie':
>> include/linux/fscache.h:308: undefined reference to `__fscache_relinquish_cookie'
   ld: fs/erofs/fscache.o: in function `fscache_relinquish_volume':
>> include/linux/fscache.h:224: undefined reference to `__fscache_relinquish_volume'
   ld: fs/erofs/fscache.o: in function `fscache_begin_read_operation':
>> include/linux/fscache.h:457: undefined reference to `__fscache_begin_read_operation'
   ld: fs/erofs/fscache.o: in function `fscache_relinquish_volume':
>> include/linux/fscache.h:224: undefined reference to `__fscache_relinquish_volume'


vim +289 include/linux/fscache.h

b6e16652d6c0e4 David Howells         2021-10-20  179  
62ab63352350e8 David Howells         2021-10-20  180  /**
62ab63352350e8 David Howells         2021-10-20  181   * fscache_acquire_volume - Register a volume as desiring caching services
62ab63352350e8 David Howells         2021-10-20  182   * @volume_key: An identification string for the volume
62ab63352350e8 David Howells         2021-10-20  183   * @cache_name: The name of the cache to use (or NULL for the default)
62ab63352350e8 David Howells         2021-10-20  184   * @coherency_data: Piece of arbitrary coherency data to check (or NULL)
62ab63352350e8 David Howells         2021-10-20  185   * @coherency_len: The size of the coherency data
62ab63352350e8 David Howells         2021-10-20  186   *
62ab63352350e8 David Howells         2021-10-20  187   * Register a volume as desiring caching services if they're available.  The
62ab63352350e8 David Howells         2021-10-20  188   * caller must provide an identifier for the volume and may also indicate which
62ab63352350e8 David Howells         2021-10-20  189   * cache it should be in.  If a preexisting volume entry is found in the cache,
62ab63352350e8 David Howells         2021-10-20  190   * the coherency data must match otherwise the entry will be invalidated.
62ab63352350e8 David Howells         2021-10-20  191   *
62ab63352350e8 David Howells         2021-10-20  192   * Returns a cookie pointer on success, -ENOMEM if out of memory or -EBUSY if a
62ab63352350e8 David Howells         2021-10-20  193   * cache volume of that name is already acquired.  Note that "NULL" is a valid
62ab63352350e8 David Howells         2021-10-20  194   * cookie pointer and can be returned if caching is refused.
62ab63352350e8 David Howells         2021-10-20  195   */
62ab63352350e8 David Howells         2021-10-20  196  static inline
62ab63352350e8 David Howells         2021-10-20  197  struct fscache_volume *fscache_acquire_volume(const char *volume_key,
62ab63352350e8 David Howells         2021-10-20  198  					      const char *cache_name,
62ab63352350e8 David Howells         2021-10-20  199  					      const void *coherency_data,
62ab63352350e8 David Howells         2021-10-20  200  					      size_t coherency_len)
62ab63352350e8 David Howells         2021-10-20  201  {
62ab63352350e8 David Howells         2021-10-20  202  	if (!fscache_available())
62ab63352350e8 David Howells         2021-10-20  203  		return NULL;
62ab63352350e8 David Howells         2021-10-20 @204  	return __fscache_acquire_volume(volume_key, cache_name,
62ab63352350e8 David Howells         2021-10-20  205  					coherency_data, coherency_len);
62ab63352350e8 David Howells         2021-10-20  206  }
62ab63352350e8 David Howells         2021-10-20  207  
62ab63352350e8 David Howells         2021-10-20  208  /**
62ab63352350e8 David Howells         2021-10-20  209   * fscache_relinquish_volume - Cease caching a volume
62ab63352350e8 David Howells         2021-10-20  210   * @volume: The volume cookie
62ab63352350e8 David Howells         2021-10-20  211   * @coherency_data: Piece of arbitrary coherency data to set (or NULL)
62ab63352350e8 David Howells         2021-10-20  212   * @invalidate: True if the volume should be invalidated
62ab63352350e8 David Howells         2021-10-20  213   *
62ab63352350e8 David Howells         2021-10-20  214   * Indicate that a filesystem no longer desires caching services for a volume.
62ab63352350e8 David Howells         2021-10-20  215   * The caller must have relinquished all file cookies prior to calling this.
62ab63352350e8 David Howells         2021-10-20  216   * The stored coherency data is updated.
62ab63352350e8 David Howells         2021-10-20  217   */
62ab63352350e8 David Howells         2021-10-20  218  static inline
62ab63352350e8 David Howells         2021-10-20  219  void fscache_relinquish_volume(struct fscache_volume *volume,
62ab63352350e8 David Howells         2021-10-20  220  			       const void *coherency_data,
62ab63352350e8 David Howells         2021-10-20  221  			       bool invalidate)
62ab63352350e8 David Howells         2021-10-20  222  {
62ab63352350e8 David Howells         2021-10-20  223  	if (fscache_volume_valid(volume))
62ab63352350e8 David Howells         2021-10-20 @224  		__fscache_relinquish_volume(volume, coherency_data, invalidate);
62ab63352350e8 David Howells         2021-10-20  225  }
62ab63352350e8 David Howells         2021-10-20  226  
7f3283aba39a0f David Howells         2021-10-20  227  /**
7f3283aba39a0f David Howells         2021-10-20  228   * fscache_acquire_cookie - Acquire a cookie to represent a cache object
7f3283aba39a0f David Howells         2021-10-20  229   * @volume: The volume in which to locate/create this cookie
7f3283aba39a0f David Howells         2021-10-20  230   * @advice: Advice flags (FSCACHE_COOKIE_ADV_*)
7f3283aba39a0f David Howells         2021-10-20  231   * @index_key: The index key for this cookie
7f3283aba39a0f David Howells         2021-10-20  232   * @index_key_len: Size of the index key
7f3283aba39a0f David Howells         2021-10-20  233   * @aux_data: The auxiliary data for the cookie (may be NULL)
7f3283aba39a0f David Howells         2021-10-20  234   * @aux_data_len: Size of the auxiliary data buffer
7f3283aba39a0f David Howells         2021-10-20  235   * @object_size: The initial size of object
7f3283aba39a0f David Howells         2021-10-20  236   *
7f3283aba39a0f David Howells         2021-10-20  237   * Acquire a cookie to represent a data file within the given cache volume.
7f3283aba39a0f David Howells         2021-10-20  238   *
7f3283aba39a0f David Howells         2021-10-20  239   * See Documentation/filesystems/caching/netfs-api.rst for a complete
7f3283aba39a0f David Howells         2021-10-20  240   * description.
7f3283aba39a0f David Howells         2021-10-20  241   */
7f3283aba39a0f David Howells         2021-10-20  242  static inline
7f3283aba39a0f David Howells         2021-10-20  243  struct fscache_cookie *fscache_acquire_cookie(struct fscache_volume *volume,
7f3283aba39a0f David Howells         2021-10-20  244  					      u8 advice,
7f3283aba39a0f David Howells         2021-10-20  245  					      const void *index_key,
7f3283aba39a0f David Howells         2021-10-20  246  					      size_t index_key_len,
7f3283aba39a0f David Howells         2021-10-20  247  					      const void *aux_data,
7f3283aba39a0f David Howells         2021-10-20  248  					      size_t aux_data_len,
7f3283aba39a0f David Howells         2021-10-20  249  					      loff_t object_size)
7f3283aba39a0f David Howells         2021-10-20  250  {
7f3283aba39a0f David Howells         2021-10-20  251  	if (!fscache_volume_valid(volume))
7f3283aba39a0f David Howells         2021-10-20  252  		return NULL;
7f3283aba39a0f David Howells         2021-10-20 @253  	return __fscache_acquire_cookie(volume, advice,
7f3283aba39a0f David Howells         2021-10-20  254  					index_key, index_key_len,
7f3283aba39a0f David Howells         2021-10-20  255  					aux_data, aux_data_len,
7f3283aba39a0f David Howells         2021-10-20  256  					object_size);
7f3283aba39a0f David Howells         2021-10-20  257  }
7f3283aba39a0f David Howells         2021-10-20  258  
12bb21a29c19aa David Howells         2021-10-20  259  /**
12bb21a29c19aa David Howells         2021-10-20  260   * fscache_use_cookie - Request usage of cookie attached to an object
ec1bd37123c607 Khalid Masum          2022-08-18  261   * @cookie: The cookie representing the cache object
12bb21a29c19aa David Howells         2021-10-20  262   * @will_modify: If cache is expected to be modified locally
12bb21a29c19aa David Howells         2021-10-20  263   *
12bb21a29c19aa David Howells         2021-10-20  264   * Request usage of the cookie attached to an object.  The caller should tell
12bb21a29c19aa David Howells         2021-10-20  265   * the cache if the object's contents are about to be modified locally and then
12bb21a29c19aa David Howells         2021-10-20  266   * the cache can apply the policy that has been set to handle this case.
12bb21a29c19aa David Howells         2021-10-20  267   */
12bb21a29c19aa David Howells         2021-10-20  268  static inline void fscache_use_cookie(struct fscache_cookie *cookie,
12bb21a29c19aa David Howells         2021-10-20  269  				      bool will_modify)
12bb21a29c19aa David Howells         2021-10-20  270  {
12bb21a29c19aa David Howells         2021-10-20  271  	if (fscache_cookie_valid(cookie))
12bb21a29c19aa David Howells         2021-10-20 @272  		__fscache_use_cookie(cookie, will_modify);
12bb21a29c19aa David Howells         2021-10-20  273  }
12bb21a29c19aa David Howells         2021-10-20  274  
12bb21a29c19aa David Howells         2021-10-20  275  /**
12bb21a29c19aa David Howells         2021-10-20  276   * fscache_unuse_cookie - Cease usage of cookie attached to an object
ec1bd37123c607 Khalid Masum          2022-08-18  277   * @cookie: The cookie representing the cache object
12bb21a29c19aa David Howells         2021-10-20  278   * @aux_data: Updated auxiliary data (or NULL)
12bb21a29c19aa David Howells         2021-10-20  279   * @object_size: Revised size of the object (or NULL)
12bb21a29c19aa David Howells         2021-10-20  280   *
12bb21a29c19aa David Howells         2021-10-20  281   * Cease usage of the cookie attached to an object.  When the users count
12bb21a29c19aa David Howells         2021-10-20  282   * reaches zero then the cookie relinquishment will be permitted to proceed.
12bb21a29c19aa David Howells         2021-10-20  283   */
12bb21a29c19aa David Howells         2021-10-20  284  static inline void fscache_unuse_cookie(struct fscache_cookie *cookie,
12bb21a29c19aa David Howells         2021-10-20  285  					const void *aux_data,
12bb21a29c19aa David Howells         2021-10-20  286  					const loff_t *object_size)
12bb21a29c19aa David Howells         2021-10-20  287  {
12bb21a29c19aa David Howells         2021-10-20  288  	if (fscache_cookie_valid(cookie))
12bb21a29c19aa David Howells         2021-10-20 @289  		__fscache_unuse_cookie(cookie, aux_data, object_size);
12bb21a29c19aa David Howells         2021-10-20  290  }
12bb21a29c19aa David Howells         2021-10-20  291  
7f3283aba39a0f David Howells         2021-10-20  292  /**
7f3283aba39a0f David Howells         2021-10-20  293   * fscache_relinquish_cookie - Return the cookie to the cache, maybe discarding
7f3283aba39a0f David Howells         2021-10-20  294   * it
7f3283aba39a0f David Howells         2021-10-20  295   * @cookie: The cookie being returned
7f3283aba39a0f David Howells         2021-10-20  296   * @retire: True if the cache object the cookie represents is to be discarded
7f3283aba39a0f David Howells         2021-10-20  297   *
7f3283aba39a0f David Howells         2021-10-20  298   * This function returns a cookie to the cache, forcibly discarding the
7f3283aba39a0f David Howells         2021-10-20  299   * associated cache object if retire is set to true.
7f3283aba39a0f David Howells         2021-10-20  300   *
7f3283aba39a0f David Howells         2021-10-20  301   * See Documentation/filesystems/caching/netfs-api.rst for a complete
7f3283aba39a0f David Howells         2021-10-20  302   * description.
7f3283aba39a0f David Howells         2021-10-20  303   */
7f3283aba39a0f David Howells         2021-10-20  304  static inline
7f3283aba39a0f David Howells         2021-10-20  305  void fscache_relinquish_cookie(struct fscache_cookie *cookie, bool retire)
7f3283aba39a0f David Howells         2021-10-20  306  {
7f3283aba39a0f David Howells         2021-10-20  307  	if (fscache_cookie_valid(cookie))
7f3283aba39a0f David Howells         2021-10-20 @308  		__fscache_relinquish_cookie(cookie, retire);
7f3283aba39a0f David Howells         2021-10-20  309  }
7f3283aba39a0f David Howells         2021-10-20  310  
12bb21a29c19aa David Howells         2021-10-20  311  /*
12bb21a29c19aa David Howells         2021-10-20  312   * Find the auxiliary data on a cookie.
12bb21a29c19aa David Howells         2021-10-20  313   */
12bb21a29c19aa David Howells         2021-10-20  314  static inline void *fscache_get_aux(struct fscache_cookie *cookie)
12bb21a29c19aa David Howells         2021-10-20  315  {
12bb21a29c19aa David Howells         2021-10-20  316  	if (cookie->aux_len <= sizeof(cookie->inline_aux))
12bb21a29c19aa David Howells         2021-10-20  317  		return cookie->inline_aux;
12bb21a29c19aa David Howells         2021-10-20  318  	else
12bb21a29c19aa David Howells         2021-10-20  319  		return cookie->aux;
12bb21a29c19aa David Howells         2021-10-20  320  }
12bb21a29c19aa David Howells         2021-10-20  321  
12bb21a29c19aa David Howells         2021-10-20  322  /*
12bb21a29c19aa David Howells         2021-10-20  323   * Update the auxiliary data on a cookie.
12bb21a29c19aa David Howells         2021-10-20  324   */
12bb21a29c19aa David Howells         2021-10-20  325  static inline
12bb21a29c19aa David Howells         2021-10-20  326  void fscache_update_aux(struct fscache_cookie *cookie,
12bb21a29c19aa David Howells         2021-10-20  327  			const void *aux_data, const loff_t *object_size)
12bb21a29c19aa David Howells         2021-10-20  328  {
12bb21a29c19aa David Howells         2021-10-20  329  	void *p = fscache_get_aux(cookie);
12bb21a29c19aa David Howells         2021-10-20  330  
12bb21a29c19aa David Howells         2021-10-20  331  	if (aux_data && p)
12bb21a29c19aa David Howells         2021-10-20  332  		memcpy(p, aux_data, cookie->aux_len);
12bb21a29c19aa David Howells         2021-10-20  333  	if (object_size)
12bb21a29c19aa David Howells         2021-10-20  334  		cookie->object_size = *object_size;
12bb21a29c19aa David Howells         2021-10-20  335  }
12bb21a29c19aa David Howells         2021-10-20  336  
12bb21a29c19aa David Howells         2021-10-20  337  #ifdef CONFIG_FSCACHE_STATS
12bb21a29c19aa David Howells         2021-10-20  338  extern atomic_t fscache_n_updates;
12bb21a29c19aa David Howells         2021-10-20  339  #endif
12bb21a29c19aa David Howells         2021-10-20  340  
12bb21a29c19aa David Howells         2021-10-20  341  static inline
12bb21a29c19aa David Howells         2021-10-20  342  void __fscache_update_cookie(struct fscache_cookie *cookie, const void *aux_data,
12bb21a29c19aa David Howells         2021-10-20  343  			     const loff_t *object_size)
12bb21a29c19aa David Howells         2021-10-20  344  {
12bb21a29c19aa David Howells         2021-10-20  345  #ifdef CONFIG_FSCACHE_STATS
12bb21a29c19aa David Howells         2021-10-20  346  	atomic_inc(&fscache_n_updates);
12bb21a29c19aa David Howells         2021-10-20  347  #endif
12bb21a29c19aa David Howells         2021-10-20  348  	fscache_update_aux(cookie, aux_data, object_size);
12bb21a29c19aa David Howells         2021-10-20  349  	smp_wmb();
12bb21a29c19aa David Howells         2021-10-20  350  	set_bit(FSCACHE_COOKIE_NEEDS_UPDATE, &cookie->flags);
12bb21a29c19aa David Howells         2021-10-20  351  }
12bb21a29c19aa David Howells         2021-10-20  352  
ed1235eb78a742 David Howells         2021-10-20  353  /**
ed1235eb78a742 David Howells         2021-10-20  354   * fscache_update_cookie - Request that a cache object be updated
ed1235eb78a742 David Howells         2021-10-20  355   * @cookie: The cookie representing the cache object
ed1235eb78a742 David Howells         2021-10-20  356   * @aux_data: The updated auxiliary data for the cookie (may be NULL)
ed1235eb78a742 David Howells         2021-10-20  357   * @object_size: The current size of the object (may be NULL)
ed1235eb78a742 David Howells         2021-10-20  358   *
ed1235eb78a742 David Howells         2021-10-20  359   * Request an update of the index data for the cache object associated with the
ed1235eb78a742 David Howells         2021-10-20  360   * cookie.  The auxiliary data on the cookie will be updated first if @aux_data
ed1235eb78a742 David Howells         2021-10-20  361   * is set and the object size will be updated and the object possibly trimmed
ed1235eb78a742 David Howells         2021-10-20  362   * if @object_size is set.
ed1235eb78a742 David Howells         2021-10-20  363   *
ed1235eb78a742 David Howells         2021-10-20  364   * See Documentation/filesystems/caching/netfs-api.rst for a complete
ed1235eb78a742 David Howells         2021-10-20  365   * description.
ed1235eb78a742 David Howells         2021-10-20  366   */
ed1235eb78a742 David Howells         2021-10-20  367  static inline
ed1235eb78a742 David Howells         2021-10-20  368  void fscache_update_cookie(struct fscache_cookie *cookie, const void *aux_data,
ed1235eb78a742 David Howells         2021-10-20  369  			   const loff_t *object_size)
ed1235eb78a742 David Howells         2021-10-20  370  {
ed1235eb78a742 David Howells         2021-10-20  371  	if (fscache_cookie_enabled(cookie))
ed1235eb78a742 David Howells         2021-10-20  372  		__fscache_update_cookie(cookie, aux_data, object_size);
ed1235eb78a742 David Howells         2021-10-20  373  }
ed1235eb78a742 David Howells         2021-10-20  374  
16a96bdf92d5af David Howells         2021-10-20  375  /**
16a96bdf92d5af David Howells         2021-10-20  376   * fscache_resize_cookie - Request that a cache object be resized
16a96bdf92d5af David Howells         2021-10-20  377   * @cookie: The cookie representing the cache object
16a96bdf92d5af David Howells         2021-10-20  378   * @new_size: The new size of the object (may be NULL)
16a96bdf92d5af David Howells         2021-10-20  379   *
16a96bdf92d5af David Howells         2021-10-20  380   * Request that the size of an object be changed.
16a96bdf92d5af David Howells         2021-10-20  381   *
752f596371289c Mauro Carvalho Chehab 2022-06-26  382   * See Documentation/filesystems/caching/netfs-api.rst for a complete
16a96bdf92d5af David Howells         2021-10-20  383   * description.
16a96bdf92d5af David Howells         2021-10-20  384   */
16a96bdf92d5af David Howells         2021-10-20  385  static inline
16a96bdf92d5af David Howells         2021-10-20  386  void fscache_resize_cookie(struct fscache_cookie *cookie, loff_t new_size)
16a96bdf92d5af David Howells         2021-10-20  387  {
16a96bdf92d5af David Howells         2021-10-20  388  	if (fscache_cookie_enabled(cookie))
16a96bdf92d5af David Howells         2021-10-20  389  		__fscache_resize_cookie(cookie, new_size);
16a96bdf92d5af David Howells         2021-10-20  390  }
16a96bdf92d5af David Howells         2021-10-20  391  
d24af13e2e2358 David Howells         2021-10-20  392  /**
d24af13e2e2358 David Howells         2021-10-20  393   * fscache_invalidate - Notify cache that an object needs invalidation
d24af13e2e2358 David Howells         2021-10-20  394   * @cookie: The cookie representing the cache object
d24af13e2e2358 David Howells         2021-10-20  395   * @aux_data: The updated auxiliary data for the cookie (may be NULL)
d24af13e2e2358 David Howells         2021-10-20  396   * @size: The revised size of the object.
d24af13e2e2358 David Howells         2021-10-20  397   * @flags: Invalidation flags (FSCACHE_INVAL_*)
d24af13e2e2358 David Howells         2021-10-20  398   *
d24af13e2e2358 David Howells         2021-10-20  399   * Notify the cache that an object is needs to be invalidated and that it
d24af13e2e2358 David Howells         2021-10-20  400   * should abort any retrievals or stores it is doing on the cache.  This
d24af13e2e2358 David Howells         2021-10-20  401   * increments inval_counter on the cookie which can be used by the caller to
d24af13e2e2358 David Howells         2021-10-20  402   * reconsider I/O requests as they complete.
d24af13e2e2358 David Howells         2021-10-20  403   *
d24af13e2e2358 David Howells         2021-10-20  404   * If @flags has FSCACHE_INVAL_DIO_WRITE set, this indicates that this is due
d24af13e2e2358 David Howells         2021-10-20  405   * to a direct I/O write and will cause caching to be disabled on this cookie
d24af13e2e2358 David Howells         2021-10-20  406   * until it is completely unused.
d24af13e2e2358 David Howells         2021-10-20  407   *
d24af13e2e2358 David Howells         2021-10-20  408   * See Documentation/filesystems/caching/netfs-api.rst for a complete
d24af13e2e2358 David Howells         2021-10-20  409   * description.
d24af13e2e2358 David Howells         2021-10-20  410   */
d24af13e2e2358 David Howells         2021-10-20  411  static inline
d24af13e2e2358 David Howells         2021-10-20  412  void fscache_invalidate(struct fscache_cookie *cookie,
d24af13e2e2358 David Howells         2021-10-20  413  			const void *aux_data, loff_t size, unsigned int flags)
d24af13e2e2358 David Howells         2021-10-20  414  {
d24af13e2e2358 David Howells         2021-10-20  415  	if (fscache_cookie_enabled(cookie))
d24af13e2e2358 David Howells         2021-10-20  416  		__fscache_invalidate(cookie, aux_data, size, flags);
d24af13e2e2358 David Howells         2021-10-20  417  }
d24af13e2e2358 David Howells         2021-10-20  418  
d64f4554dd177c David Howells         2021-10-20  419  /**
d64f4554dd177c David Howells         2021-10-20  420   * fscache_operation_valid - Return true if operations resources are usable
d64f4554dd177c David Howells         2021-10-20  421   * @cres: The resources to check.
d64f4554dd177c David Howells         2021-10-20  422   *
d64f4554dd177c David Howells         2021-10-20  423   * Returns a pointer to the operations table if usable or NULL if not.
d64f4554dd177c David Howells         2021-10-20  424   */
d64f4554dd177c David Howells         2021-10-20  425  static inline
d64f4554dd177c David Howells         2021-10-20  426  const struct netfs_cache_ops *fscache_operation_valid(const struct netfs_cache_resources *cres)
d64f4554dd177c David Howells         2021-10-20  427  {
d64f4554dd177c David Howells         2021-10-20  428  	return fscache_resources_valid(cres) ? cres->ops : NULL;
d64f4554dd177c David Howells         2021-10-20  429  }
d64f4554dd177c David Howells         2021-10-20  430  
d64f4554dd177c David Howells         2021-10-20  431  /**
d64f4554dd177c David Howells         2021-10-20  432   * fscache_begin_read_operation - Begin a read operation for the netfs lib
d64f4554dd177c David Howells         2021-10-20  433   * @cres: The cache resources for the read being performed
d64f4554dd177c David Howells         2021-10-20  434   * @cookie: The cookie representing the cache object
d64f4554dd177c David Howells         2021-10-20  435   *
d64f4554dd177c David Howells         2021-10-20  436   * Begin a read operation on behalf of the netfs helper library.  @cres
d64f4554dd177c David Howells         2021-10-20  437   * indicates the cache resources to which the operation state should be
d64f4554dd177c David Howells         2021-10-20  438   * attached; @cookie indicates the cache object that will be accessed.
d64f4554dd177c David Howells         2021-10-20  439   *
d64f4554dd177c David Howells         2021-10-20  440   * This is intended to be called from the ->begin_cache_operation() netfs lib
d64f4554dd177c David Howells         2021-10-20  441   * operation as implemented by the network filesystem.
d64f4554dd177c David Howells         2021-10-20  442   *
d64f4554dd177c David Howells         2021-10-20  443   * @cres->inval_counter is set from @cookie->inval_counter for comparison at
d64f4554dd177c David Howells         2021-10-20  444   * the end of the operation.  This allows invalidation during the operation to
d64f4554dd177c David Howells         2021-10-20  445   * be detected by the caller.
d64f4554dd177c David Howells         2021-10-20  446   *
d64f4554dd177c David Howells         2021-10-20  447   * Returns:
d64f4554dd177c David Howells         2021-10-20  448   * * 0		- Success
d64f4554dd177c David Howells         2021-10-20  449   * * -ENOBUFS	- No caching available
d64f4554dd177c David Howells         2021-10-20  450   * * Other error code from the cache, such as -ENOMEM.
d64f4554dd177c David Howells         2021-10-20  451   */
d64f4554dd177c David Howells         2021-10-20  452  static inline
d64f4554dd177c David Howells         2021-10-20  453  int fscache_begin_read_operation(struct netfs_cache_resources *cres,
d64f4554dd177c David Howells         2021-10-20  454  				 struct fscache_cookie *cookie)
d64f4554dd177c David Howells         2021-10-20  455  {
d64f4554dd177c David Howells         2021-10-20  456  	if (fscache_cookie_enabled(cookie))
d64f4554dd177c David Howells         2021-10-20 @457  		return __fscache_begin_read_operation(cres, cookie);
d64f4554dd177c David Howells         2021-10-20  458  	return -ENOBUFS;
d64f4554dd177c David Howells         2021-10-20  459  }
d64f4554dd177c David Howells         2021-10-20  460  

:::::: The code at line 289 was first introduced by commit
:::::: 12bb21a29c19aae50cfad4e2bb5c943108f34a7d fscache: Implement cookie user counting and resource pinning

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
