Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEE95258
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 01:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712279421; cv=none; b=cFeS4nTHNkIJ8pBE2NowLJdr97iqv4lTx+VrFxQ1cPQDd9PX1e7y2QWql+/zXkeV5RYDHyW6+PpxAu71kio7trc2ZuW6ViBcz3NZUuyCxzIM1CHgeCckA7SAr2tlke+IDFqtWlLh6/QPQ1nfnUcB8KJuxweH2IpwnSwQDRQMeYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712279421; c=relaxed/simple;
	bh=juGRkljdrSdiiiubUuIabKpspBEBBqly3voQwCdcleU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X/wF6GltdF7sAZ91qwT06DEhTZ42nhMwiCcrC2zL3ZgwmMLN86B7dYtDCoHXB9o8OUKOXFsf/I8t9VKm9TjK21ngQIvPo4OIuXRrRTTDbZm89vVyHhwnQ/MrFsZF44qgxqsNxAXkMw9uldcE43p3n+31pmHJ8lGiYXhlUDpYbgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UF8lGzPp; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UF8lGzPp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712279419; x=1743815419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=juGRkljdrSdiiiubUuIabKpspBEBBqly3voQwCdcleU=;
  b=UF8lGzPpJxwj9AM+6gllqbboKnA4aaDnArwjfVoeSpWnSc3s9C5pWJ93
   HLl5mCNvFtqsxNhsu9q4Sd25myuclw7HxYq75lgM1Ut+ccj2MH0uFzp/u
   eP8B9wjmqLqmkS5whTLOzOrojAmjjFZFnLOCSIsqERAXJeYzhEuttZ6i6
   7nYoS+kJ0foJTHX97pqsmvBPxPaCL9p5XRnQY4zSd6Jm+7XJaVHiOxGR9
   SKAYA8KKS+Hj02bWlhESrsdnEHZ+LdWPwsR+yO0/QdtTikKVd+3hzID2N
   UgTclxIH9GrWbZTm6k088OWysmRec7I2uK6DJVhh270odk516+Sl7VNZs
   Q==;
X-CSE-ConnectionGUID: kMIRuBd8QJapNH+8R7XB1A==
X-CSE-MsgGUID: zzyhJDfLQLyDEbSEsILjKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7440820"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7440820"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 18:10:19 -0700
X-CSE-ConnectionGUID: 1MxeTYV8QW+C01J9AwI0Eg==
X-CSE-MsgGUID: i77tz9IwR8Si5b3xVlHi+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="19090240"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Apr 2024 18:10:18 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsY5v-0001hW-1r;
	Fri, 05 Apr 2024 01:10:15 +0000
Date: Fri, 5 Apr 2024 09:09:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 17/29] include/linux/uio.h:201:6: error:
 conflicting types for 'copy_to_iter_full'; have 'bool(const void *, size_t,
  struct iov_iter *)' {aka '_Bool(const void *, long unsigned int,  struct
 iov_iter *)'}
Message-ID: <202404050851.iLiYlte2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   34a49de340a534b0cb222309e73d1ef215ff4db6
commit: 05f15eff60a663c24903bdfdb5ccb3faa4712ad9 [17/29] sound: convert drivers to read/write iterators
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240405/202404050851.iLiYlte2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404050851.iLiYlte2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050851.iLiYlte2-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/core/control.c: In function 'snd_ctl_read':
   sound/core/control.c:1990:24: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
    1990 |         size_t count = iov_iter_count(to);
         |                        ^~~~~~~~~~~~~~
   sound/core/control.c:2032:22: error: implicit declaration of function 'copy_to_iter_full'; did you mean 'copy_to_user_nofault'? [-Werror=implicit-function-declaration]
    2032 |                 if (!copy_to_iter_full(&ev, sizeof(struct snd_ctl_event), to)) {
         |                      ^~~~~~~~~~~~~~~~~
         |                      copy_to_user_nofault
   In file included from include/linux/socket.h:8,
                    from include/linux/compat.h:15,
                    from sound/core/control_compat.c:10,
                    from sound/core/control.c:2190:
   include/linux/uio.h: At top level:
>> include/linux/uio.h:201:6: error: conflicting types for 'copy_to_iter_full'; have 'bool(const void *, size_t,  struct iov_iter *)' {aka '_Bool(const void *, long unsigned int,  struct iov_iter *)'}
     201 | bool copy_to_iter_full(const void *addr, size_t bytes, struct iov_iter *i)
         |      ^~~~~~~~~~~~~~~~~
   sound/core/control.c:2032:22: note: previous implicit declaration of 'copy_to_iter_full' with type 'int()'
    2032 |                 if (!copy_to_iter_full(&ev, sizeof(struct snd_ctl_event), to)) {
         |                      ^~~~~~~~~~~~~~~~~
>> include/linux/uio.h:287:22: error: conflicting types for 'iov_iter_count'; have 'size_t(const struct iov_iter *)' {aka 'long unsigned int(const struct iov_iter *)'}
     287 | static inline size_t iov_iter_count(const struct iov_iter *i)
         |                      ^~~~~~~~~~~~~~
   sound/core/control.c:1990:24: note: previous implicit declaration of 'iov_iter_count' with type 'int()'
    1990 |         size_t count = iov_iter_count(to);
         |                        ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   sound/core/timer.c: In function 'snd_timer_user_read':
   sound/core/timer.c:2071:24: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
    2071 |         size_t count = iov_iter_count(to);
         |                        ^~~~~~~~~~~~~~
   sound/core/timer.c:2138:30: error: implicit declaration of function 'copy_to_iter_full'; did you mean 'copy_to_user_nofault'? [-Werror=implicit-function-declaration]
    2138 |                         if (!copy_to_iter_full(tread,
         |                              ^~~~~~~~~~~~~~~~~
         |                              copy_to_user_nofault
   In file included from include/linux/socket.h:8,
                    from include/linux/compat.h:15,
                    from sound/core/timer_compat.c:9,
                    from sound/core/timer.c:2196:
   include/linux/uio.h: At top level:
>> include/linux/uio.h:201:6: error: conflicting types for 'copy_to_iter_full'; have 'bool(const void *, size_t,  struct iov_iter *)' {aka '_Bool(const void *, long unsigned int,  struct iov_iter *)'}
     201 | bool copy_to_iter_full(const void *addr, size_t bytes, struct iov_iter *i)
         |      ^~~~~~~~~~~~~~~~~
   sound/core/timer.c:2138:30: note: previous implicit declaration of 'copy_to_iter_full' with type 'int()'
    2138 |                         if (!copy_to_iter_full(tread,
         |                              ^~~~~~~~~~~~~~~~~
>> include/linux/uio.h:287:22: error: conflicting types for 'iov_iter_count'; have 'size_t(const struct iov_iter *)' {aka 'long unsigned int(const struct iov_iter *)'}
     287 | static inline size_t iov_iter_count(const struct iov_iter *i)
         |                      ^~~~~~~~~~~~~~
   sound/core/timer.c:2071:24: note: previous implicit declaration of 'iov_iter_count' with type 'int()'
    2071 |         size_t count = iov_iter_count(to);
         |                        ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +201 include/linux/uio.h

aa28de275a2488 Al Viro           2017-06-29  199  
0c5bd15c4819ab Jens Axboe        2024-04-04  200  static __always_inline __must_check
0c5bd15c4819ab Jens Axboe        2024-04-04 @201  bool copy_to_iter_full(const void *addr, size_t bytes, struct iov_iter *i)
0c5bd15c4819ab Jens Axboe        2024-04-04  202  {
0c5bd15c4819ab Jens Axboe        2024-04-04  203  	size_t copied = copy_to_iter(addr, bytes, i);
0c5bd15c4819ab Jens Axboe        2024-04-04  204  	if (likely(copied == bytes))
0c5bd15c4819ab Jens Axboe        2024-04-04  205  		return true;
0c5bd15c4819ab Jens Axboe        2024-04-04  206  	iov_iter_revert(i, copied);
0c5bd15c4819ab Jens Axboe        2024-04-04  207  	return false;
0c5bd15c4819ab Jens Axboe        2024-04-04  208  }
0c5bd15c4819ab Jens Axboe        2024-04-04  209  
aa28de275a2488 Al Viro           2017-06-29  210  static __always_inline __must_check
aa28de275a2488 Al Viro           2017-06-29  211  size_t copy_from_iter(void *addr, size_t bytes, struct iov_iter *i)
aa28de275a2488 Al Viro           2017-06-29  212  {
0e3c3b901c0036 Al Viro           2022-06-06  213  	if (check_copy_size(addr, bytes, false))
aa28de275a2488 Al Viro           2017-06-29  214  		return _copy_from_iter(addr, bytes, i);
0e3c3b901c0036 Al Viro           2022-06-06  215  	return 0;
aa28de275a2488 Al Viro           2017-06-29  216  }
aa28de275a2488 Al Viro           2017-06-29  217  
aa28de275a2488 Al Viro           2017-06-29  218  static __always_inline __must_check
aa28de275a2488 Al Viro           2017-06-29  219  bool copy_from_iter_full(void *addr, size_t bytes, struct iov_iter *i)
aa28de275a2488 Al Viro           2017-06-29  220  {
4b6c132b7da643 Al Viro           2021-04-29  221  	size_t copied = copy_from_iter(addr, bytes, i);
4b6c132b7da643 Al Viro           2021-04-29  222  	if (likely(copied == bytes))
4b6c132b7da643 Al Viro           2021-04-29  223  		return true;
4b6c132b7da643 Al Viro           2021-04-29  224  	iov_iter_revert(i, copied);
aa28de275a2488 Al Viro           2017-06-29  225  	return false;
aa28de275a2488 Al Viro           2017-06-29  226  }
aa28de275a2488 Al Viro           2017-06-29  227  
aa28de275a2488 Al Viro           2017-06-29  228  static __always_inline __must_check
aa28de275a2488 Al Viro           2017-06-29  229  size_t copy_from_iter_nocache(void *addr, size_t bytes, struct iov_iter *i)
aa28de275a2488 Al Viro           2017-06-29  230  {
0e3c3b901c0036 Al Viro           2022-06-06  231  	if (check_copy_size(addr, bytes, false))
aa28de275a2488 Al Viro           2017-06-29  232  		return _copy_from_iter_nocache(addr, bytes, i);
0e3c3b901c0036 Al Viro           2022-06-06  233  	return 0;
aa28de275a2488 Al Viro           2017-06-29  234  }
aa28de275a2488 Al Viro           2017-06-29  235  
aa28de275a2488 Al Viro           2017-06-29  236  static __always_inline __must_check
aa28de275a2488 Al Viro           2017-06-29  237  bool copy_from_iter_full_nocache(void *addr, size_t bytes, struct iov_iter *i)
aa28de275a2488 Al Viro           2017-06-29  238  {
4b6c132b7da643 Al Viro           2021-04-29  239  	size_t copied = copy_from_iter_nocache(addr, bytes, i);
4b6c132b7da643 Al Viro           2021-04-29  240  	if (likely(copied == bytes))
4b6c132b7da643 Al Viro           2021-04-29  241  		return true;
4b6c132b7da643 Al Viro           2021-04-29  242  	iov_iter_revert(i, copied);
aa28de275a2488 Al Viro           2017-06-29  243  	return false;
aa28de275a2488 Al Viro           2017-06-29  244  }
aa28de275a2488 Al Viro           2017-06-29  245  
0aed55af88345b Dan Williams      2017-05-29  246  #ifdef CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE
0aed55af88345b Dan Williams      2017-05-29  247  /*
0aed55af88345b Dan Williams      2017-05-29  248   * Note, users like pmem that depend on the stricter semantics of
e17f7a0bc4daa4 Christoph Hellwig 2021-12-15  249   * _copy_from_iter_flushcache() than _copy_from_iter_nocache() must check for
0aed55af88345b Dan Williams      2017-05-29  250   * IS_ENABLED(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) before assuming that the
0aed55af88345b Dan Williams      2017-05-29  251   * destination is flushed from the cache on return.
0aed55af88345b Dan Williams      2017-05-29  252   */
6a37e94009b1a7 Linus Torvalds    2017-07-07  253  size_t _copy_from_iter_flushcache(void *addr, size_t bytes, struct iov_iter *i);
0aed55af88345b Dan Williams      2017-05-29  254  #else
6a37e94009b1a7 Linus Torvalds    2017-07-07  255  #define _copy_from_iter_flushcache _copy_from_iter_nocache
6a37e94009b1a7 Linus Torvalds    2017-07-07  256  #endif
6a37e94009b1a7 Linus Torvalds    2017-07-07  257  
ec6347bb43395c Dan Williams      2020-10-05  258  #ifdef CONFIG_ARCH_HAS_COPY_MC
ec6347bb43395c Dan Williams      2020-10-05  259  size_t _copy_mc_to_iter(const void *addr, size_t bytes, struct iov_iter *i);
8780356ef630aa Dan Williams      2018-05-03  260  #else
ec6347bb43395c Dan Williams      2020-10-05  261  #define _copy_mc_to_iter _copy_to_iter
8780356ef630aa Dan Williams      2018-05-03  262  #endif
8780356ef630aa Dan Williams      2018-05-03  263  
c35e02480014f7 Matthew Wilcox    2014-08-01  264  size_t iov_iter_zero(size_t bytes, struct iov_iter *);
cfa320f72882f0 Keith Busch       2022-06-10  265  bool iov_iter_is_aligned(const struct iov_iter *i, unsigned addr_mask,
cfa320f72882f0 Keith Busch       2022-06-10  266  			unsigned len_mask);
886a39115005ce Al Viro           2014-03-05  267  unsigned long iov_iter_alignment(const struct iov_iter *i);
357f435d8a0d32 Al Viro           2016-04-08  268  unsigned long iov_iter_gap_alignment(const struct iov_iter *i);
aa563d7bca6e88 David Howells     2018-10-20  269  void iov_iter_init(struct iov_iter *i, unsigned int direction, const struct iovec *iov,
71d8e532b1549a Al Viro           2014-03-05  270  			unsigned long nr_segs, size_t count);
aa563d7bca6e88 David Howells     2018-10-20  271  void iov_iter_kvec(struct iov_iter *i, unsigned int direction, const struct kvec *kvec,
05afcb77eb4713 Al Viro           2015-01-23  272  			unsigned long nr_segs, size_t count);
aa563d7bca6e88 David Howells     2018-10-20  273  void iov_iter_bvec(struct iov_iter *i, unsigned int direction, const struct bio_vec *bvec,
abb78f875f3fce Al Viro           2014-11-24  274  			unsigned long nr_segs, size_t count);
9ea9ce0427aab0 David Howells     2018-10-20  275  void iov_iter_discard(struct iov_iter *i, unsigned int direction, size_t count);
7ff5062079ef5c David Howells     2020-02-10  276  void iov_iter_xarray(struct iov_iter *i, unsigned int direction, struct xarray *xarray,
7ff5062079ef5c David Howells     2020-02-10  277  		     loff_t start, size_t count);
eba2d3d798295d Al Viro           2022-06-10  278  ssize_t iov_iter_get_pages2(struct iov_iter *i, struct page **pages,
2c80929c4c4d54 Miklos Szeredi    2014-09-24  279  			size_t maxsize, unsigned maxpages, size_t *start);
eba2d3d798295d Al Viro           2022-06-10  280  ssize_t iov_iter_get_pages_alloc2(struct iov_iter *i, struct page ***pages,
91f79c43d1b54d Al Viro           2014-03-21  281  			size_t maxsize, size_t *start);
f67da30c1d5fc9 Al Viro           2014-03-19  282  int iov_iter_npages(const struct iov_iter *i, int maxpages);
8fb0f47a9d7acf Jens Axboe        2021-09-10  283  void iov_iter_restore(struct iov_iter *i, struct iov_iter_state *state);
9223687863ffa6 Kent Overstreet   2013-11-27  284  
4b8164b91d9fdf Al Viro           2015-01-31  285  const void *dup_iter(struct iov_iter *new, struct iov_iter *old, gfp_t flags);
4b8164b91d9fdf Al Viro           2015-01-31  286  
b57332b4105abf Al Viro           2016-10-10 @287  static inline size_t iov_iter_count(const struct iov_iter *i)
9223687863ffa6 Kent Overstreet   2013-11-27  288  {
9223687863ffa6 Kent Overstreet   2013-11-27  289  	return i->count;
9223687863ffa6 Kent Overstreet   2013-11-27  290  }
9223687863ffa6 Kent Overstreet   2013-11-27  291  

:::::: The code at line 201 was first introduced by commit
:::::: 0c5bd15c4819ab7e5ab586760fd9362973b7a3f0 iov_iter: add copy_to_iter_full()

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
