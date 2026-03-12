Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DC22ECE93
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 00:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773276692; cv=none; b=LiE4hUadgYmKstmu65lvJlt2FHqwnt/GBr0dWiZDqgV0korqn5a+628+ZuIbay9sqYhWIJV61IQK0lXs3tCwKDXBcYGhww55VjRAVHCDTAxEfV/XxZ8vbL/Ok8Z0E16xklBStmeH4H0pQwMOGpUyqK0TbkqL/EdS716k8G6RKPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773276692; c=relaxed/simple;
	bh=InxlGKkOh/Zs/YCaIRxQ+a8eyPe/62KQQ9912YNW4B8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ce6bEZOGkc5QQUrbku+uCLciilMe7c8CkYH+RTscDNaeRrJCbcQmJfHl9hUGKlPlMjeMnGLIhXxCKyztRpokgmCpW/aq+F6UlaqoABxtBh6zUQijidImt+G37G2Pjn7GcWGD4QVBzLXTY2Jp1rIrLoejrDrM8O6ZuWUxPEL24Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dGjItN/G; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dGjItN/G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773276690; x=1804812690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=InxlGKkOh/Zs/YCaIRxQ+a8eyPe/62KQQ9912YNW4B8=;
  b=dGjItN/GGAxjBya/yNrMQRCB0fRbZA8PVbKdcSUGO5uZ3GnkpMQRYVOT
   4V0iwgkhzspYFzIcfbTq0YScsHXKop0RpVsAU5DuTxTVNROi8XYJrU4ds
   0nalSIksEmWynXRKuQMUn2K72lgThoVxZlB1VyXDQzM5jPTa0Dx5cLd/l
   yh5tsu3rQLTEsPkeXSU2UqlouGOc2OyFwqfIKUUF4eMZZE9UWKWtNRRCU
   mAdjdAZgYdRC111qq1+XnE6SMHOaY8cBiIu4Cbd1+MtkqP8ilpi3OK+km
   /B5FixMxcpvupiJr7aazfRf9kAUg7bW4FHYzfYqlXP/sgQImrcMbgJORd
   A==;
X-CSE-ConnectionGUID: vZFi4AR2RGeYKP3xzj3yPA==
X-CSE-MsgGUID: C7Wn58/STOKW6Yj0mS7kuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="76970259"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="76970259"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 17:51:29 -0700
X-CSE-ConnectionGUID: 3YAK2u5URlimodJnwTj7Gw==
X-CSE-MsgGUID: X1sZP5PwQg++82HJB1aZBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="224786134"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Mar 2026 17:51:28 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0UGr-000000001rz-2WkK;
	Thu, 12 Mar 2026 00:51:25 +0000
Date: Thu, 12 Mar 2026 08:50:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jihan LIN via B4 Relay <devnull+linjh22s.gmail.com@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 5/5] zram: Add lz4 PoC for zcomp-managed streams
Message-ID: <202603120814.rJ0HCHXj-lkp@intel.com>
References: <20260309-b4_zcomp_stream-v2-5-7148622326eb@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-b4_zcomp_stream-v2-5-7148622326eb@gmail.com>

Hi Jihan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 11439c4635edd669ae435eec308f4ab8a0804808]

url:    https://github.com/intel-lab-lkp/linux/commits/Jihan-LIN-via-B4-Relay/zram-Rename-zcomp_strm_-init-free/20260309-205805
base:   11439c4635edd669ae435eec308f4ab8a0804808
patch link:    https://lore.kernel.org/r/20260309-b4_zcomp_stream-v2-5-7148622326eb%40gmail.com
patch subject: [PATCH RFC v2 5/5] zram: Add lz4 PoC for zcomp-managed streams
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260312/202603120814.rJ0HCHXj-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603120814.rJ0HCHXj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603120814.rJ0HCHXj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'lz4_compress_managed',
       inlined from 'lz4_compress' at drivers/block/zram/backend_lz4.c:455:9:
>> include/linux/compiler_types.h:706:45: error: call to '__compiletime_assert_155' declared with attribute error: BUILD_BUG_ON failed: IS_ENABLED(CONFIG_HIGHMEM)
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:687:25: note: in definition of macro '__compiletime_assert'
     687 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/block/zram/backend_lz4.c:436:17: note: in expansion of macro 'BUILD_BUG_ON'
     436 |                 BUILD_BUG_ON(IS_ENABLED(CONFIG_HIGHMEM));
         |                 ^~~~~~~~~~~~
--
   In file included from <command-line>:
   In function 'lz4_compress_managed',
       inlined from 'lz4_compress' at backend_lz4.c:455:9:
>> include/linux/compiler_types.h:706:45: error: call to '__compiletime_assert_155' declared with attribute error: BUILD_BUG_ON failed: IS_ENABLED(CONFIG_HIGHMEM)
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:687:25: note: in definition of macro '__compiletime_assert'
     687 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   backend_lz4.c:436:17: note: in expansion of macro 'BUILD_BUG_ON'
     436 |                 BUILD_BUG_ON(IS_ENABLED(CONFIG_HIGHMEM));
         |                 ^~~~~~~~~~~~


vim +/__compiletime_assert_155 +706 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  692  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  693  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  694  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  695  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  696  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  697   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  698   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  699   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  700   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  701   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  702   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  703   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  704   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  705  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @706  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  707  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
