Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E316379F0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 02:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721786823; cv=none; b=GBcaxPHPd/BB661UKYNKf8t5g5TsrHSntmql6oLzi5SWooN0nBEPTS4FRr7obYsrKf9hfh3e2f2tlUB9w3oVGylkDeFmJ7lG4Vevyi/mcOXwhmQnUln4ZGsVva8alUJEb1oi3Awjz6lIokFs8FYJfStV7KOgkH6U2pHwuNPmnYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721786823; c=relaxed/simple;
	bh=7P2YYakzNmYl07RbcXyHONWMehAdSoxbLU/DidgAlts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NtDvkbeU0eGEYZih+CBbkbpbZn+XnIhv/6CuEE+oLhYb1tWtsKxbCjHEQHLr987aFbOrjK2jp2Kovt1B5LmquWdsHYo17cxoUP8gLR0gdiXbIlCNUa+lGFjSntPZ6N/LOTQA9j1LhhAv53HiiAgrAN5XwGBy8XQlTVQhZk1PHZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S8MGJfWg; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8MGJfWg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721786822; x=1753322822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7P2YYakzNmYl07RbcXyHONWMehAdSoxbLU/DidgAlts=;
  b=S8MGJfWgys4RcJDQJDtJ11qi+1pHhC5ugcOkBKx4xILcySFJ2IyYyPaH
   dV7vwvTwc2YYgpkoyC0OVOt7U8fD+hC3SV11nbett8cC5wCY0Wr6eIyNb
   0uxeipVuBM2j8zontfPupp83Z4UoggG0r/1TXEo7Mv9eVG+y6mXLE3A4n
   smkYuLZxufhqYbgLaBTxQHjZnVctxrkhebE6pwTuzd24PhE/ahFSfv21a
   UMWFPnDHXyHgUGLU9YGllVy+xfqCIquZMRhCbQc0+F79xvLu1BNRWC3CH
   LPstF0LnJ8VplIok/MEiLeF73/XHfXhsmntbLH+ez93Uf07ggFsL+E8Lt
   A==;
X-CSE-ConnectionGUID: Akj/9CLnReSQhUBzMNlO3g==
X-CSE-MsgGUID: Gfjy8VyvRC6z9wsQTBxezQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="30103983"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="30103983"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 19:07:01 -0700
X-CSE-ConnectionGUID: rIGGE1RmSd2pTVDTJcQayQ==
X-CSE-MsgGUID: 0/Et58+kSOe2OszI5QSl8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="56956750"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Jul 2024 19:07:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWRP8-000mYI-1X;
	Wed, 24 Jul 2024 02:06:58 +0000
Date: Wed, 24 Jul 2024 10:06:51 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cel:nfsd-5.15.y 1/1] include/linux/compiler_types.h:334:45: error:
 call to '__compiletime_assert_276' declared with attribute error:
 BUILD_BUG_ON failed: HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 21
Message-ID: <202407241217.nxlVnBfh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-5.15.y
head:   fd359f5ae54ff9668906addd2f298283aa058c16
commit: f4ffbb86cf1a1436b410766e83c93a1e4d34ea04 [1/1] Revert "fanotify: Allow users to request FAN_FS_ERROR events"
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240724/202407241217.nxlVnBfh-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407241217.nxlVnBfh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407241217.nxlVnBfh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   fs/notify/fanotify/fanotify.c: In function 'fanotify_handle_event':
>> include/linux/compiler_types.h:334:45: error: call to '__compiletime_assert_276' declared with attribute error: BUILD_BUG_ON failed: HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 21
     334 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:315:25: note: in definition of macro '__compiletime_assert'
     315 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:334:9: note: in expansion of macro '_compiletime_assert'
     334 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify.c:922:9: note: in expansion of macro 'BUILD_BUG_ON'
     922 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 21);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_276 +334 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  320  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  321  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  322  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  323  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  324  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  325   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  326   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  327   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  328   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  329   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  330   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  331   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  332   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  333  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @334  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  335  

:::::: The code at line 334 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
