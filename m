Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24141126F3B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 May 2026 03:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777866873; cv=none; b=NXivu4GVXBPfK3ni7PQssMuAExgoL0DQRzeDoq/gaHw78aozodmiSv5lH/wFi5Jy/yqWMG7mBKJyqyZeaUDXa61SXXXIdAWerKV28JcSNZm6AzZ7YBDgUDYJAOjdJMX5DHgiBmnuamcPxZGDCmklW5W8BIR+CatIFH8aLGvijkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777866873; c=relaxed/simple;
	bh=ycq8Swh+FJL6MNEUgm9suj3kxi4v+YJtszd/g6l61uA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gbJHfjsfHYTrVdXGZYmWdsAuUFw+6VK9rTjOGOTpvgR8N2Tgg3UGbDGQoZ2vP3saL06jRbO47V7tRNuwHXQcrta/o5qlRZCPWjWUzefTBaKYNadePxuXl1bDfQGpi5+/A3yvv0m3kYYVaSW7jD4/q8+Rgx/X1E56bN5x4gdi5PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YBKfcEOh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YBKfcEOh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777866872; x=1809402872;
  h=date:from:to:cc:subject:message-id;
  bh=ycq8Swh+FJL6MNEUgm9suj3kxi4v+YJtszd/g6l61uA=;
  b=YBKfcEOh9SELZXdaWwV6fDCzH1j36sNFhWMSFcXD29PZjabYKZrh7KUb
   p5DWfyzSOl1tDaY4ErujDhfBBzndqDKr0Wy0AbtPWpD4ufK5tFoe98dA2
   GOeeIDuNAQs694y4CQMkmluBcVv8Cwy/s/9LTO/7TDXuVqy1U/cCjylUE
   UvvMvJeGPXPYSsKdO5NmgS/Ag7W7G3H8GECWvzko85h421/Cvi3KCUHv9
   EqitShH5pfuVrzaKOuILmKp/jbRv5kMk9GNzkdXEW/X3k+QbOl2f2aTya
   n6BaiEYBYbwfLaDwHeLH+SYHXDjiXq45eId94cwlWU+hwKxtlJar4lHR6
   w==;
X-CSE-ConnectionGUID: fvKR8U8cQUWtF+vufLwPjg==
X-CSE-MsgGUID: HNqlqmDLTCytuNMfrzMc5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="89030633"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="89030633"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 20:54:31 -0700
X-CSE-ConnectionGUID: ZHZJKQkUTIe9Ra2j40aK/Q==
X-CSE-MsgGUID: VgyZQFk5Qw6nN1Y9KnAvhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="234549799"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 03 May 2026 20:54:29 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJkO3-000000005jZ-0mn5;
	Mon, 04 May 2026 03:54:27 +0000
Date: Mon, 04 May 2026 05:53:54 +0200
From: kernel test robot <lkp@intel.com>
To: Zhen Ni <zhen.ni@easystack.cn>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: include/linux/compiler_types.h:699:45: error: call to
 '__compiletime_assert_604' declared with attribute error: Unsupported access
 size for {READ,WRITE}_ONCE().
Message-ID: <202605040539.QyR4QouS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Zhen-Ni/mm-page_owner-add-filter-infrastructure/20260422-043150
head:   ad34917082fa5506fe7690172354dac3b83ec91d
commit: ad34917082fa5506fe7690172354dac3b83ec91d mm/page_owner: add NUMA node filter with nodelist support
date:   12 days ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260504/202605040539.QyR4QouS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605040539.QyR4QouS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605040539.QyR4QouS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   mm/page_owner.c: In function 'nid_filter_show':
>> include/linux/compiler_types.h:699:45: error: call to '__compiletime_assert_604' declared with attribute error: Unsupported access size for {READ,WRITE}_ONCE().
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:680:25: note: in definition of macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_owner.c:1062:27: note: in expansion of macro 'READ_ONCE'
    1062 |         nodemask_t mask = READ_ONCE(owner_filter.nid_mask);
         |                           ^~~~~~~~~
   mm/page_owner.c: In function 'nid_filter_write':
   include/linux/compiler_types.h:699:45: error: call to '__compiletime_assert_603' declared with attribute error: Unsupported access size for {READ,WRITE}_ONCE().
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:680:25: note: in definition of macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_owner.c:1052:9: note: in expansion of macro 'WRITE_ONCE'
    1052 |         WRITE_ONCE(owner_filter.nid_mask, mask);
         |         ^~~~~~~~~~
   mm/page_owner.c: In function 'read_page_owner':
   include/linux/compiler_types.h:699:45: error: call to '__compiletime_assert_591' declared with attribute error: Unsupported access size for {READ,WRITE}_ONCE().
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:680:25: note: in definition of macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_owner.c:735:24: note: in expansion of macro 'READ_ONCE'
     735 |                 mask = READ_ONCE(owner_filter.nid_mask);
         |                        ^~~~~~~~~


vim +/__compiletime_assert_604 +699 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  685  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  686  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  687  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  689  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  690   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  691   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  692   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  693   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  694   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  695   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  696   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  697   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  698  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @699  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  700  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
