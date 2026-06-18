Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2441E47C5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jun 2026 01:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781746234; cv=none; b=oKHqNq2E3vyYG2/vmjwR6Rz3TlLyarQCM7eHFOLcosRlFGaR76K/Il3WgU4wgmwgFOb3pl5WSd3LY+k3a66x+FbjMm+qIasCj5lLO7VMJCLtUV0R9+AfsiYp5vETv8MFQTfqmbGdB8OpUgY15++VEzetI8HcAwI0dioG03mIaI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781746234; c=relaxed/simple;
	bh=wXXh+ZdFbKxqtYYBfblVUY5NvKakMlDfu9KKjN/z1Fw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bg/BRQE03khdq7AXKY0J7YPOHFbUskastOXcboH+U7u6LlW0jZ7PaZWBvr/L1Bd7MDdA7oXkDJ+QDviFXkHYgT7Z3z84dav3NE0cux2gWbXFHEMUa8FhXnvnYjZIIFipZQWY4tNpO39gjWgenBMISzhk8QbKe8vU+lZZrDWjVxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XPqQ5GcN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XPqQ5GcN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781746231; x=1813282231;
  h=date:from:to:cc:subject:message-id;
  bh=wXXh+ZdFbKxqtYYBfblVUY5NvKakMlDfu9KKjN/z1Fw=;
  b=XPqQ5GcNcvOPwAVCT0i6vT8W446G3GobH/ioO0CPbrALZ5E+L5xfk1ZI
   7/wnMYxIEF3U3ojhKBwVBucwDcX66rgMG7uRpIUSc4n7VNGDd9FB49dbd
   jkTvawHKbbLPLvZ8woI+CBRK9EthirCD4tKhbbOtdtpnvXZfi2BbGRGGI
   EXTFjFc0W0X+u0AQ2QCdltC2kIiRu/IqI0ynk87rZzlAcUNK5PdkLkQHV
   MMXAixOlLChoiHXEVXfne7sBOsw4qvt/S55WRClUsn8h6XWwfuO2k9AyV
   yE1WdkJ2hLAy6mLW3j4yhNEkMVct+2udNHBqwrbNi7UowdBpgWsDY/mVP
   w==;
X-CSE-ConnectionGUID: dyGZQiklSVWOHURn62Avsw==
X-CSE-MsgGUID: heQpHFOBRgiug+bF+fglow==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="93223812"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="93223812"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 18:30:30 -0700
X-CSE-ConnectionGUID: n6GBMQMqQByqzPtsKDf/RA==
X-CSE-MsgGUID: faa7bQ/ETPqsoTKunLSlmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="272307892"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jun 2026 18:30:29 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wa1aM-00000000V9u-3TAn;
	Thu, 18 Jun 2026 01:30:26 +0000
Date: Thu, 18 Jun 2026 09:30:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-06 3/3]
 include/linux/compiler.h:166:45: error: '__UNIQUE_ID_y_513' undeclared; did
 you mean '__UNIQUE_ID_x_512'?
Message-ID: <202606180841.c1GwNAAe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-06
head:   c990cea68f8a738ee75de848e7d395633d8c6fc1
commit: 8d0690eed76a66fd3b5d3ad2447e82a4d2f3921e [3/3] ANDROID: CRC / ABI fixups for sched_dl_entity bitfield addition
config: arm-randconfig-004-20260618 (https://download.01.org/0day-ci/archive/20260618/202606180841.c1GwNAAe-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260618/202606180841.c1GwNAAe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606180841.c1GwNAAe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/blk-crypto.h:127,
                    from include/linux/blk-crypto-profile.h:10,
                    from include/linux/mmc/host.h:19,
                    from drivers/mmc/host/mmci.c:23:
   include/linux/blkdev.h:1721:24: error: field 'req_list' has incomplete type
    1721 |         struct rq_list req_list;
         |                        ^~~~~~~~
   In file included from <command-line>:
   drivers/mmc/host/mmci.c: In function 'mmci_probe':
>> include/linux/compiler.h:166:45: error: '__UNIQUE_ID_y_513' undeclared (first use in this function); did you mean '__UNIQUE_ID_x_512'?
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:516:23: note: in definition of macro '__compiletime_assert'
     516 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:536:9: note: in expansion of macro '_compiletime_assert'
     536 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:56:27: note: in expansion of macro 'is_signed_type'
      56 | #define __sign_use(x,ux) (is_signed_type(typeof(ux))? \
         |                           ^~~~~~~~~~~~~~
   include/linux/minmax.h:82:29: note: in expansion of macro '__sign_use'
      82 |         (__sign_use(x,ux) & __sign_use(y,uy))
         |                             ^~~~~~~~~~
   include/linux/minmax.h:100:27: note: in expansion of macro '__types_ok'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/minmax.h:105:55: note: in expansion of macro '__UNIQUE_ID'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                                       ^~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/mmc/host/mmci.c:2333:40: note: in expansion of macro 'min'
    2333 |                                 fmax : min(host->mclk, fmax);
         |                                        ^~~
   include/linux/compiler.h:166:45: note: each undeclared identifier is reported only once for each function it appears in
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:516:23: note: in definition of macro '__compiletime_assert'
     516 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:536:9: note: in expansion of macro '_compiletime_assert'
     536 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:56:27: note: in expansion of macro 'is_signed_type'
      56 | #define __sign_use(x,ux) (is_signed_type(typeof(ux))? \
         |                           ^~~~~~~~~~~~~~
   include/linux/minmax.h:82:29: note: in expansion of macro '__sign_use'
      82 |         (__sign_use(x,ux) & __sign_use(y,uy))
         |                             ^~~~~~~~~~
   include/linux/minmax.h:100:27: note: in expansion of macro '__types_ok'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/minmax.h:105:55: note: in expansion of macro '__UNIQUE_ID'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                                       ^~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/mmc/host/mmci.c:2333:40: note: in expansion of macro 'min'
    2333 |                                 fmax : min(host->mclk, fmax);
         |                                        ^~~
   include/linux/minmax.h:77:36: error: first argument to '__builtin_choose_expr' not a constant
      77 |   #define __signed_type(ux) typeof(__builtin_choose_expr(sizeof(ux)>4,1LL,1L))
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:516:23: note: in definition of macro '__compiletime_assert'
     516 |                 if (!(condition))                                       \


vim +166 include/linux/compiler.h

fe8c8a126806fea Cesar Eduardo Barros 2013-11-25  165  
a8306f2d4dcea03 Nick Desaulniers     2023-08-31 @166  #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
6f33d58794ef4ce Rusty Russell        2012-11-22  167  

:::::: The code at line 166 was first introduced by commit
:::::: a8306f2d4dcea03538c70c26d2948483f70254ff compiler.h: unify __UNIQUE_ID

:::::: TO: Nick Desaulniers <ndesaulniers@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
