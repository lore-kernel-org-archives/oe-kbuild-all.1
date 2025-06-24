Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FBC4400
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jun 2025 00:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750724573; cv=none; b=LgVGvIwyRygdtLIejA1v0JHgxBXODGCXHPNfe2l9J6Cfowby/+kU/llBkwfUyoy129bYV9Lq0ivg4zrE/FztD5cOOwwMhu7HHlt9d41t/uS7BfUBqOsBIgg26/LEWShLwQ+0bN4z/GIZYYNK0Rta/5ZblWxhPHDIFNp1tLH2bQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750724573; c=relaxed/simple;
	bh=QlqPG5wpXmbhnlznz5MHC3joNEHJursGu2nUOiiGwJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GWcb6kC5M1axx5EFGuc9nLqSusAEvMUqWySCuMZCmP9bv44Xhttf/ZGiaDRhwbGSPTDorseeymAHe/9vf3yM6l5RMtDY4tL35CgEMnY127U58tAGju6AGwkizmdhwI/4j+jfhtQD3MymbvZJ6+zBbF0EU0CepTctplcY6P+2teg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CqQhYjcW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CqQhYjcW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750724572; x=1782260572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QlqPG5wpXmbhnlznz5MHC3joNEHJursGu2nUOiiGwJQ=;
  b=CqQhYjcWOtPkMY0oEfYiVd4GQZR89Et/f15WdW3P1qa9LRvPsCMvdwoE
   uCTJLJeqPtyHsB+fn2ro51+m0MPHfjU7wnolaw1BrjoLhrGS6N53D66MW
   7gq6xS0kqOSW0HU+3F236DI424JdkyKFRABViYsWQDANVN7lED8QoZBQZ
   eJFbGRTkUSb4uUR3Z0H8GubmftzAQ0aQsGYx59689Cp945VcO84tYGYu6
   drcc/woDbk7x8PTo+96oynm0FHaoxesQfyWzbv/WfmimFDkv/3mMhEjMo
   a769stNH7Yw2HBV1p8G5hkKQUpAaBRfKu6DhRJsIR97BcEFaxVUfKnxUp
   g==;
X-CSE-ConnectionGUID: JR6854a0QzmyJfIq9eIcKQ==
X-CSE-MsgGUID: t8b570vGSxKS1+TnKq3OYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53089586"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="53089586"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 17:22:51 -0700
X-CSE-ConnectionGUID: q5k7jc8HS1as7ppVF1qCMA==
X-CSE-MsgGUID: 9dVDZW02RTuqyfxnSrNw8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="188959378"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Jun 2025 17:22:51 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTrR1-000RXm-2e;
	Tue, 24 Jun 2025 00:22:47 +0000
Date: Tue, 24 Jun 2025 08:21:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1] include/linux/compiler.h:166:45:
 error: '__UNIQUE_ID_y_515' undeclared; did you mean '__UNIQUE_ID_x_514'?
Message-ID: <202506240829.3jynciUH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   986d344a4766b98e5aca8a690a37f226c952cd8b
commit: c1a3f22e0669cc6bdbd3344d9e953c8eacfeed70 [1/1] ANDROID: CRC / ABI fixups for sched_dl_entity bitfield addition
config: arm-randconfig-002-20250621 (https://download.01.org/0day-ci/archive/20250624/202506240829.3jynciUH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240829.3jynciUH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240829.3jynciUH-lkp@intel.com/

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
>> include/linux/compiler.h:166:45: error: '__UNIQUE_ID_y_515' undeclared (first use in this function); did you mean '__UNIQUE_ID_x_514'?
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

fe8c8a126806fe Cesar Eduardo Barros 2013-11-25  165  
a8306f2d4dcea0 Nick Desaulniers     2023-08-31 @166  #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
6f33d58794ef4c Rusty Russell        2012-11-22  167  

:::::: The code at line 166 was first introduced by commit
:::::: a8306f2d4dcea03538c70c26d2948483f70254ff compiler.h: unify __UNIQUE_ID

:::::: TO: Nick Desaulniers <ndesaulniers@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
