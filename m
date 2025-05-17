Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FDC1C6B4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 03:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747450860; cv=none; b=UIYeCUZnI0v/4walsYdymKB9E+4ovtwjK+0uNh5Xo3iWgeGenRcsnk0fQtB/gYF3ndk64cxdltTeNfYdHdOoUaxddrd2CRK2jodS+DIEsxmQTPtVOJOof9QcnzTra2PsMGV+FPYgERg1Hk2nnd3kT6G7ONpUNvRdBhistbm+cvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747450860; c=relaxed/simple;
	bh=mkDMQP1h66YWwYVWg6g963Rp0WAClba8r3hoNjgPiTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SZuFzztZ96uYaT9Bn+RPvdyLG1yQqeviBlmmB98+x9XBAlTqjVLiN7BgI4sKNyNh3rmpx7GM7AQeByi5wyDOQGOudJZJ7U1mgDUWTWb3MlkMqler2l5/GUzVPT5byrTsPUb5RMMch/mFNNtMiZwsCxVa3FnzG+gRn7h4F8lhyps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UruHTAWh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UruHTAWh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747450859; x=1778986859;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mkDMQP1h66YWwYVWg6g963Rp0WAClba8r3hoNjgPiTk=;
  b=UruHTAWhWqiqEBUusVZaBE/1srK26UoXzcuJmJjUIJ5HvigXL0dcgYOE
   vYcLotNoa7Wr6PvozephHWp9SaNaStOi/MGTN8lC7qClwTJ7KBM7X3pEV
   FDbC+XQhCSBm0EzyK5RoX9lg6gi8mKaO/+ivcVRcE+dJxQ8l6hvmBTMrb
   4dQSdR/rg3SBH0X+/UBxYqQ6httDdjqYwpulZVRKxFzS2JvomhFzUdkV2
   hgoUj7lZeJQQaiXWFIdvVi05KX2K8ppvCtS6RTnPrVslUOmZY8dk07zRS
   G0FagMzwHFbr80PlOEdJpCW9jH+j3c1CuWHguIUY9txoe54wHwxkwOfIH
   Q==;
X-CSE-ConnectionGUID: 1PtUR618Q3CHcUc06NPUgA==
X-CSE-MsgGUID: jJuc3EnGRAykz/D9UGfjGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="60458133"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="60458133"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 20:00:57 -0700
X-CSE-ConnectionGUID: 4413dEC+QvSMBRBRr+g7Gw==
X-CSE-MsgGUID: xgQtwdeEQ5u4BNuW4QA5mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="143841197"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 May 2025 20:00:55 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG7nA-000Jtb-3C;
	Sat, 17 May 2025 03:00:53 +0000
Date: Sat, 17 May 2025 11:00:26 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Raghav <p.raghav@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 3/3] iomap: use LARGE_ZERO_PAGE in iomap_dio_zero()
Message-ID: <202505171027.aoHmoQqv-lkp@intel.com>
References: <20250516101054.676046-4-p.raghav@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516101054.676046-4-p.raghav@samsung.com>

Hi Pankaj,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 9e619cd4fefd19cdce16e169d5827bc64ae01aa1]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Raghav/mm-add-large-zero-page-for-efficient-zeroing-of-larger-segments/20250516-181327
base:   9e619cd4fefd19cdce16e169d5827bc64ae01aa1
patch link:    https://lore.kernel.org/r/20250516101054.676046-4-p.raghav%40samsung.com
patch subject: [RFC 3/3] iomap: use LARGE_ZERO_PAGE in iomap_dio_zero()
config: arm-randconfig-003-20250517 (https://download.01.org/0day-ci/archive/20250517/202505171027.aoHmoQqv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505171027.aoHmoQqv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505171027.aoHmoQqv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/minmax.h:98:2: note: in expansion of macro '__careful_cmp_once'
     __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
     ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
    #define __PASTE(a,b) ___PASTE(a,b)
                         ^~~~~~~~
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
    #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                                ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
    #define __PASTE(a,b) ___PASTE(a,b)
                         ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
    #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                                        ^~~~~~~
   include/linux/minmax.h:98:48: note: in expansion of macro '__UNIQUE_ID'
     __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
                                                   ^~~~~~~~~~~
   include/linux/minmax.h:112:19: note: in expansion of macro '__careful_cmp'
    #define max(x, y) __careful_cmp(max, x, y)
                      ^~~~~~~~~~~~~
   fs/iomap/direct-io.c:286:16: note: in expansion of macro 'max'
     int nr_vecs = max(1, i_blocksize(inode) / ZERO_LARGE_PAGE_SIZE);
                   ^~~
   include/linux/minmax.h:71:10: error: first argument to '__builtin_choose_expr' not a constant
     (typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL, 1L)))(ux) >= 0)
             ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:537:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:557:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(!__types_ok(ux, uy),  \
     ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:70:25: note: in expansion of macro 'statically_true'
    #define __is_nonneg(ux) statically_true( \
                            ^~~~~~~~~~~~~~~
   include/linux/minmax.h:50:7: note: in expansion of macro '__is_nonneg'
     (2 + __is_nonneg(ux)) : (1 + 2 * (sizeof(ux) < 4)))
          ^~~~~~~~~~~
   include/linux/minmax.h:75:20: note: in expansion of macro '__sign_use'
     (__sign_use(ux) & __sign_use(uy))
                       ^~~~~~~~~~
   include/linux/minmax.h:93:20: note: in expansion of macro '__types_ok'
     BUILD_BUG_ON_MSG(!__types_ok(ux, uy),  \
                       ^~~~~~~~~~
   include/linux/minmax.h:98:2: note: in expansion of macro '__careful_cmp_once'
     __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:112:19: note: in expansion of macro '__careful_cmp'
    #define max(x, y) __careful_cmp(max, x, y)
                      ^~~~~~~~~~~~~
   fs/iomap/direct-io.c:286:16: note: in expansion of macro 'max'
     int nr_vecs = max(1, i_blocksize(inode) / ZERO_LARGE_PAGE_SIZE);
                   ^~~
   include/linux/minmax.h:71:10: error: first argument to '__builtin_choose_expr' not a constant
     (typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL, 1L)))(ux) >= 0)
             ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:537:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:557:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(!__types_ok(ux, uy),  \
     ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:70:25: note: in expansion of macro 'statically_true'
    #define __is_nonneg(ux) statically_true( \
                            ^~~~~~~~~~~~~~~
   include/linux/minmax.h:50:7: note: in expansion of macro '__is_nonneg'
     (2 + __is_nonneg(ux)) : (1 + 2 * (sizeof(ux) < 4)))
          ^~~~~~~~~~~
   include/linux/minmax.h:75:20: note: in expansion of macro '__sign_use'
     (__sign_use(ux) & __sign_use(uy))
                       ^~~~~~~~~~
   include/linux/minmax.h:93:20: note: in expansion of macro '__types_ok'
     BUILD_BUG_ON_MSG(!__types_ok(ux, uy),  \
                       ^~~~~~~~~~
   include/linux/minmax.h:98:2: note: in expansion of macro '__careful_cmp_once'
     __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:112:19: note: in expansion of macro '__careful_cmp'
    #define max(x, y) __careful_cmp(max, x, y)
                      ^~~~~~~~~~~~~
   fs/iomap/direct-io.c:286:16: note: in expansion of macro 'max'
     int nr_vecs = max(1, i_blocksize(inode) / ZERO_LARGE_PAGE_SIZE);
                   ^~~
   fs/iomap/direct-io.c:306:23: error: implicit declaration of function 'ZERO_LARGE_PAGE'; did you mean 'ZERO_PAGE'? [-Werror=implicit-function-declaration]
      __bio_add_page(bio, ZERO_LARGE_PAGE(0), len, 0);
                          ^~~~~~~~~~~~~~~
                          ZERO_PAGE
>> fs/iomap/direct-io.c:306:23: warning: passing argument 2 of '__bio_add_page' makes pointer from integer without a cast [-Wint-conversion]
      __bio_add_page(bio, ZERO_LARGE_PAGE(0), len, 0);
                          ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/blkdev.h:17,
                    from include/linux/iomap.h:11,
                    from fs/iomap/direct-io.c:11:
   include/linux/bio.h:416:51: note: expected 'struct page *' but argument is of type 'int'
    void __bio_add_page(struct bio *bio, struct page *page,
                                         ~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/__bio_add_page +306 fs/iomap/direct-io.c

   280	
   281	static int iomap_dio_zero(const struct iomap_iter *iter, struct iomap_dio *dio,
   282			loff_t pos, unsigned len)
   283	{
   284		struct inode *inode = file_inode(dio->iocb->ki_filp);
   285		struct bio *bio;
   286		int nr_vecs = max(1, i_blocksize(inode) / ZERO_LARGE_PAGE_SIZE);
   287	
   288		if (!len)
   289			return 0;
   290		/*
   291		 * Max block size supported is 64k
   292		 */
   293		if (WARN_ON_ONCE(len > SZ_64K))
   294			return -EINVAL;
   295	
   296		bio = iomap_dio_alloc_bio(iter, dio, nr_vecs, REQ_OP_WRITE | REQ_SYNC | REQ_IDLE);
   297		fscrypt_set_bio_crypt_ctx(bio, inode, pos >> inode->i_blkbits,
   298					  GFP_KERNEL);
   299		bio->bi_iter.bi_sector = iomap_sector(&iter->iomap, pos);
   300		bio->bi_private = dio;
   301		bio->bi_end_io = iomap_dio_bio_end_io;
   302	
   303		while (len) {
   304			unsigned int io_len = min_t(unsigned int, len, ZERO_LARGE_PAGE_SIZE);
   305	
 > 306			__bio_add_page(bio, ZERO_LARGE_PAGE(0), len, 0);
   307			len -= io_len;
   308		}
   309		iomap_dio_submit_bio(iter, dio, bio, pos);
   310		return 0;
   311	}
   312	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
