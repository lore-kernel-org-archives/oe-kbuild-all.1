Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2C51EB3F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 07:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712389081; cv=none; b=NHKkGxpklFsE1Rq1DMgRRtIjHFWw4xmkpyi8mh79zvST0WhuWqMIb+7w1YSBHXuj64tXrwL49Dy2lo5QksCu9dLFfwWqiXjigOk3nGPBGYcp3/7aH+kgOW1tPGtjLny5M+6aXblfOvTl2JvD84OECIY3w49JW8syKm3XwhL8NOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712389081; c=relaxed/simple;
	bh=W8CZSyVnucMnQ5RRuw2i5s1/lxWAXBkdeV0Ma4q65+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ltGrB0JnOxS7j9gcGWV+136ZZ05Lqgic1dmu1hNAbZmbG46DNj90pHjDeOohfBEuLxBP9JXqroVFmVSiCFY+oAQ7CEZGmhrUnVma5cKIxVJ5eTcPin9tOeZeKNj5wfuJfF+FAzCkKOJlhByR1p72NxqMX/KtHThD8Rsg4UTXLwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIATv66c; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIATv66c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712389078; x=1743925078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W8CZSyVnucMnQ5RRuw2i5s1/lxWAXBkdeV0Ma4q65+Y=;
  b=iIATv66csAP7xwXuTZmnb7KEd0TnrRTsCEwhwgo9sWS69AUx9nWykgoP
   8JdebOoafP+wNBlt9+J8NSK2Cyj6yeDlbAUHciJ++aabUCld8RuPhLVQP
   e4qziVvX9RFZlsP/AO/HNd6nFfXgbjy0316V5wtdpt/nQSqGxE01QQzRq
   MxEgUkWWawN8kgCncUbHRPgxDqoBoRPauD0Z/bpZV2EOGPkF5Qsyh9yR7
   AcGhVOrNYuSwFDWyCEhAP3tEfvOZ+XLPNgNdMpta39wCmWLYh+5OZpW3M
   iaTnT5nlwhKJ1msGPVhGoIlH9dSa+pNyKMoNj4yhBh/bTkdG2d2CBuR5n
   A==;
X-CSE-ConnectionGUID: K5P8qYq8RG+IoMdfSt1FIQ==
X-CSE-MsgGUID: EEU1ovUCS0uk7S77cLNl4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7954729"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="7954729"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 00:37:57 -0700
X-CSE-ConnectionGUID: xCoze8MgQBuKe3BmBdpJfg==
X-CSE-MsgGUID: XunvrNQaSSyKYRvjDlLr7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="19464083"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Apr 2024 00:36:24 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rt0b8-0003Ey-0z;
	Sat, 06 Apr 2024 07:36:22 +0000
Date: Sat, 6 Apr 2024 15:35:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 98/100]
 drivers/net/wireless/ath/ath5k/debug.c:325:9: error: 'count' undeclared; did
 you mean 'ucounts'?
Message-ID: <202404061520.cooZsGSB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   bb4803260393a54d3b254c2abfe121ab89cce776
commit: 6b38c794e367abc0ecc7340ed2ac9618e527aac1 [98/100] drivers/net/wireless/ath: convert to read/write iterators
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240406/202404061520.cooZsGSB-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404061520.cooZsGSB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404061520.cooZsGSB-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/wireless/ath/ath5k/debug.c: In function 'write_file_debug':
>> drivers/net/wireless/ath/ath5k/debug.c:325:9: error: 'count' undeclared (first use in this function); did you mean 'ucounts'?
     325 |         count = min_t(size_t, count, sizeof(buf) - 1);
         |         ^~~~~
         |         ucounts
   drivers/net/wireless/ath/ath5k/debug.c:325:9: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/init.h:5,
                    from include/linux/moduleparam.h:5,
                    from drivers/net/wireless/ath/ath5k/debug.c:64:
   include/linux/minmax.h:31:9: error: first argument to '__builtin_choose_expr' not a constant
      31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:39:10: note: in expansion of macro '__is_signed'
      39 |         (__is_signed(x) == __is_signed(y) ||                    \
         |          ^~~~~~~~~~~
   include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
      51 |         static_assert(__types_ok(x, y),                 \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:161:33: note: in expansion of macro '__careful_cmp'
     161 | #define min_t(type, x, y)       __careful_cmp(min, (type)(x), (type)(y))
         |                                 ^~~~~~~~~~~~~
   drivers/net/wireless/ath/ath5k/debug.c:325:17: note: in expansion of macro 'min_t'
     325 |         count = min_t(size_t, count, sizeof(buf) - 1);
         |                 ^~~~~
   include/linux/minmax.h:31:9: error: first argument to '__builtin_choose_expr' not a constant
      31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:40:17: note: in expansion of macro '__is_signed'
      40 |                 __is_signed((x) + 0) == __is_signed((y) + 0) || \
         |                 ^~~~~~~~~~~
   include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
      51 |         static_assert(__types_ok(x, y),                 \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:161:33: note: in expansion of macro '__careful_cmp'
     161 | #define min_t(type, x, y)       __careful_cmp(min, (type)(x), (type)(y))
         |                                 ^~~~~~~~~~~~~
   drivers/net/wireless/ath/ath5k/debug.c:325:17: note: in expansion of macro 'min_t'
     325 |         count = min_t(size_t, count, sizeof(buf) - 1);
         |                 ^~~~~
   include/linux/minmax.h:31:9: error: first argument to '__builtin_choose_expr' not a constant
      31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:36:53: note: in expansion of macro '__is_signed'
      36 |         (__builtin_choose_expr(__is_constexpr(x) && __is_signed(x), x, -1) >= 0)
         |                                                     ^~~~~~~~~~~
   include/linux/minmax.h:41:17: note: in expansion of macro '__is_noneg_int'
      41 |                 __is_noneg_int(x) || __is_noneg_int(y))
         |                 ^~~~~~~~~~~~~~
   include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
      51 |         static_assert(__types_ok(x, y),                 \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:161:33: note: in expansion of macro '__careful_cmp'
     161 | #define min_t(type, x, y)       __careful_cmp(min, (type)(x), (type)(y))
         |                                 ^~~~~~~~~~~~~
   drivers/net/wireless/ath/ath5k/debug.c:325:17: note: in expansion of macro 'min_t'
     325 |         count = min_t(size_t, count, sizeof(buf) - 1);
         |                 ^~~~~
   include/linux/minmax.h:36:10: error: first argument to '__builtin_choose_expr' not a constant
      36 |         (__builtin_choose_expr(__is_constexpr(x) && __is_signed(x), x, -1) >= 0)
         |          ^~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:41:17: note: in expansion of macro '__is_noneg_int'
      41 |                 __is_noneg_int(x) || __is_noneg_int(y))
         |                 ^~~~~~~~~~~~~~
   include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
      51 |         static_assert(__types_ok(x, y),                 \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:161:33: note: in expansion of macro '__careful_cmp'
     161 | #define min_t(type, x, y)       __careful_cmp(min, (type)(x), (type)(y))
         |                                 ^~~~~~~~~~~~~
   drivers/net/wireless/ath/ath5k/debug.c:325:17: note: in expansion of macro 'min_t'
     325 |         count = min_t(size_t, count, sizeof(buf) - 1);
         |                 ^~~~~
   include/linux/minmax.h:39:9: error: expression in static assertion is not an integer
      39 |         (__is_signed(x) == __is_signed(y) ||                    \
         |         ^
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
      51 |         static_assert(__types_ok(x, y),                 \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:161:33: note: in expansion of macro '__careful_cmp'
     161 | #define min_t(type, x, y)       __careful_cmp(min, (type)(x), (type)(y))
         |                                 ^~~~~~~~~~~~~
   drivers/net/wireless/ath/ath5k/debug.c:325:17: note: in expansion of macro 'min_t'
     325 |         count = min_t(size_t, count, sizeof(buf) - 1);
         |                 ^~~~~
   In file included from include/linux/kernel.h:28,
                    from include/linux/moduleparam.h:7:
   include/linux/minmax.h:56:9: error: first argument to '__builtin_choose_expr' not a constant
      56 |         __builtin_choose_expr(__is_constexpr((x) - (y)),        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:161:33: note: in expansion of macro '__careful_cmp'
     161 | #define min_t(type, x, y)       __careful_cmp(min, (type)(x), (type)(y))
         |                                 ^~~~~~~~~~~~~
   drivers/net/wireless/ath/ath5k/debug.c:325:17: note: in expansion of macro 'min_t'
     325 |         count = min_t(size_t, count, sizeof(buf) - 1);
         |                 ^~~~~
>> drivers/net/wireless/ath/ath5k/debug.c:338:1: warning: control reaches end of non-void function [-Wreturn-type]
     338 | }
         | ^


vim +325 drivers/net/wireless/ath/ath5k/debug.c

be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  318  
6b38c794e367ab drivers/net/wireless/ath/ath5k/debug.c Jens Axboe     2024-04-05  319  static ssize_t write_file_debug(struct kiocb *iocb, struct iov_iter *from)
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  320  {
6b38c794e367ab drivers/net/wireless/ath/ath5k/debug.c Jens Axboe     2024-04-05  321  	struct ath5k_hw *ah = iocb->ki_filp->private_data;
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  322  	unsigned int i;
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  323  	char buf[20];
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  324  
8aada63cc40887 drivers/net/wireless/ath/ath5k/debug.c Djalal Harouni 2013-08-25 @325  	count = min_t(size_t, count, sizeof(buf) - 1);
6b38c794e367ab drivers/net/wireless/ath/ath5k/debug.c Jens Axboe     2024-04-05  326  	if (!copy_from_iter_full(buf, count, from))
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  327  		return -EFAULT;
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  328  
8aada63cc40887 drivers/net/wireless/ath/ath5k/debug.c Djalal Harouni 2013-08-25  329  	buf[count] = '\0';
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  330  	for (i = 0; i < ARRAY_SIZE(dbg_info); i++) {
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  331  		if (strncmp(buf, dbg_info[i].name,
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  332  					strlen(dbg_info[i].name)) == 0) {
e0d687bd9df218 drivers/net/wireless/ath/ath5k/debug.c Pavel Roskin   2011-07-14  333  			ah->debug.level ^= dbg_info[i].level; /* toggle bit */
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  334  			break;
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  335  		}
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  336  	}
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  337  	return count;
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23 @338  }
be9b72590c05da drivers/net/wireless/ath5k/debug.c     Bruno Randolf  2008-01-23  339  

:::::: The code at line 325 was first introduced by commit
:::::: 8aada63cc408874916a19341ba514f941096e424 ath5k: debugfs: NULL-terminate strings

:::::: TO: Djalal Harouni <tixxdz@opendz.org>
:::::: CC: John W. Linville <linville@tuxdriver.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
