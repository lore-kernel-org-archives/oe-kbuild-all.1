Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF9F25A62E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Mar 2025 16:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741280356; cv=none; b=GWIVElRDi4P+j6tSydNKTjFgFhT6ob0l3BA5ghcjaShW2oo1QFPP/jlGjoARj5+m1yNWOb70UIhV3G2ptUdu2Ms8R5t4cutjSoVWc44gb0YU1+gQCXww3oASdLuoR1gJOm95zVUua9FyOuMfwne8jjuBj/fWB840+cyjuIlu4t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741280356; c=relaxed/simple;
	bh=WVKrEwCcNCotVhmso621QIbfYM71xT4rYxNVZZNcYwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AA0nBpE/7FiSv/vjmUNfBLsFpeT3pxoZIvv0mcoL5MUDHt5kZ9CL5juXt2YeGjK9mvMKbpd0D+4NEkjaOU5wF+r6XTVYXDgPjo9e/24jWVpCo8xWUg09MK4LYzhHOl3LYj6cW1k7h9nhO5V1cmoiY87YoO1bXVf2G77UNJC1FsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ALmfnj63; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ALmfnj63"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741280354; x=1772816354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WVKrEwCcNCotVhmso621QIbfYM71xT4rYxNVZZNcYwQ=;
  b=ALmfnj63fciLQv3HzWxnnJSKjhiO0UJ95e/2Moh3mxs7eMXRPGRsfO+x
   198a2vR7Bd/o0iC0daHlPszA0/dKXrGAIcxQi5YLKBVTYyd6L0fhbd6Xa
   nky4E3SYqRVShujmZm3M8/oMUQXYmh/eoEV9e6lYU9pJUuVTgUpF43AzS
   5IrRKXDJku5nNmg3X3Hoa5fiUlNCyRx5E2e0Nafos/6shVkhBg6D+IvvX
   MzwHPqnR3/Ohib0/eCCIXx9rcD63CYRaH4bz3m2ilaX2IusdHWNoGS7YJ
   5NRC3OaUxuW/SvbZAiZJSlQEHsXnkrSBxY9tO+S8QvcevlGttYq5SKkPx
   g==;
X-CSE-ConnectionGUID: PGigbXrWRYOkUV5v21yDqQ==
X-CSE-MsgGUID: sWW0DF/8SHCDpyOwRhSOCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="59854126"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="59854126"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 08:59:06 -0800
X-CSE-ConnectionGUID: ILpHIHkqSRm/iksKY3Dttg==
X-CSE-MsgGUID: lmBXL8oUS6ysbdpY+rid1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119998329"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 06 Mar 2025 08:59:04 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqEYo-000NKG-0O;
	Thu, 06 Mar 2025 16:59:02 +0000
Date: Fri, 7 Mar 2025 00:56:59 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: [axboe-block:for-6.15/io_uring-reg-vec 5/12]
 io_uring/rsrc.c:1305:32: warning: cast from pointer to integer of different
 size
Message-ID: <202503070002.k1CAXQJf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.15/io_uring-reg-vec
head:   dbc5b236b665e61bc206055f8a6d45766fbec974
commit: 0b9406095d9d362ec0113e645380ac15302cd43c [5/12] io_uring: add infra for importing vectored reg buffers
config: arm-randconfig-002-20250306 (https://download.01.org/0day-ci/archive/20250307/202503070002.k1CAXQJf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503070002.k1CAXQJf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503070002.k1CAXQJf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   io_uring/rsrc.c: In function 'io_vec_fill_bvec':
>> io_uring/rsrc.c:1305:32: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1305 |                 u64 buf_addr = (u64)iovec[iov_idx].iov_base;
         |                                ^
   In file included from <command-line>:
   io_uring/rsrc.c: In function 'io_vec_free':
   include/linux/compiler_types.h:542:45: error: call to '__compiletime_assert_361' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct bio_vec) > sizeof(struct iovec)
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:523:25: note: in definition of macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   io_uring/rsrc.c:1266:9: note: in expansion of macro 'BUILD_BUG_ON'
    1266 |         BUILD_BUG_ON(sizeof(struct bio_vec) > sizeof(struct iovec));
         |         ^~~~~~~~~~~~
   In function 'io_vec_free',
       inlined from 'io_vec_realloc' at io_uring/rsrc.c:1284:2:
   include/linux/compiler_types.h:542:45: error: call to '__compiletime_assert_361' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct bio_vec) > sizeof(struct iovec)
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:523:25: note: in definition of macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   io_uring/rsrc.c:1266:9: note: in expansion of macro 'BUILD_BUG_ON'
    1266 |         BUILD_BUG_ON(sizeof(struct bio_vec) > sizeof(struct iovec));
         |         ^~~~~~~~~~~~


vim +1305 io_uring/rsrc.c

  1289	
  1290	static int io_vec_fill_bvec(int ddir, struct iov_iter *iter,
  1291					struct io_mapped_ubuf *imu,
  1292					struct iovec *iovec, unsigned nr_iovs,
  1293					struct iou_vec *vec)
  1294	{
  1295		unsigned long folio_size = 1 << imu->folio_shift;
  1296		unsigned long folio_mask = folio_size - 1;
  1297		u64 folio_addr = imu->ubuf & ~folio_mask;
  1298		struct bio_vec *res_bvec = vec->bvec;
  1299		size_t total_len = 0;
  1300		unsigned bvec_idx = 0;
  1301		unsigned iov_idx;
  1302	
  1303		for (iov_idx = 0; iov_idx < nr_iovs; iov_idx++) {
  1304			size_t iov_len = iovec[iov_idx].iov_len;
> 1305			u64 buf_addr = (u64)iovec[iov_idx].iov_base;
  1306			struct bio_vec *src_bvec;
  1307			size_t offset;
  1308			u64 buf_end;
  1309	
  1310			if (unlikely(check_add_overflow(buf_addr, (u64)iov_len, &buf_end)))
  1311				return -EFAULT;
  1312			if (unlikely(buf_addr < imu->ubuf || buf_end > (imu->ubuf + imu->len)))
  1313				return -EFAULT;
  1314			if (unlikely(!iov_len))
  1315				return -EFAULT;
  1316			if (unlikely(check_add_overflow(total_len, iov_len, &total_len)))
  1317				return -EOVERFLOW;
  1318	
  1319			/* by using folio address it also accounts for bvec offset */
  1320			offset = buf_addr - folio_addr;
  1321			src_bvec = imu->bvec + (offset >> imu->folio_shift);
  1322			offset &= folio_mask;
  1323	
  1324			for (; iov_len; offset = 0, bvec_idx++, src_bvec++) {
  1325				size_t seg_size = min_t(size_t, iov_len,
  1326							folio_size - offset);
  1327	
  1328				bvec_set_page(&res_bvec[bvec_idx],
  1329					      src_bvec->bv_page, seg_size, offset);
  1330				iov_len -= seg_size;
  1331			}
  1332		}
  1333		if (total_len > MAX_RW_COUNT)
  1334			return -EINVAL;
  1335	
  1336		iov_iter_bvec(iter, ddir, res_bvec, bvec_idx, total_len);
  1337		return 0;
  1338	}
  1339	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
