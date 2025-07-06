Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A43D202983
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Jul 2025 22:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751840096; cv=none; b=mWNPX6i1rp4ly9JY39QANsrdcL02v3R82hxMfTmRc6V7rdXjErPK+Rcwn8d8RoSvHBrK0W6lxKTCImEC4wddDsK/xsA/RnZBsr9ptXeweZf4Uj+G7onaH2stzZ07nor9b4QhKxFrFkE/cQj0rqIxNqGX6rUzVbf0whudt6PAjuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751840096; c=relaxed/simple;
	bh=ho3YvsSJ0II6qgCEky9e8b+cXOvmtJdewqu3M/BYVK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MEqlTeZr1mvEy2eiWp4Is4i8gZZm+3aMl8MOFa6Xw8mHeCL0hV6LrJzQ4HIwD0JOxKyUHjRdKrFJNOVE6pfhE0TLWqcjdzRkndrsaRlk2ndnjs9tHax6RJlJ4aBjTqzdceyH0yKIfxc3irhflbRu0aTtC8LytkTgijXqN1TX5l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HrXzFvg7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HrXzFvg7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751840093; x=1783376093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ho3YvsSJ0II6qgCEky9e8b+cXOvmtJdewqu3M/BYVK4=;
  b=HrXzFvg7gajaiY0aOodStqoRbzpmcqLjrHTG4gF4rCHNMdnP7UvkF8vY
   a+InH6N0A0uoTYf5JUAtXGG/CkVyyJzqRQY+di5vRmImTGS8+iBToUTKa
   ZVOVKbBgzwrQazE0MtxyB/n7VYPs4kr53375VGnzDSjcB3HW3JLZi+nh3
   UFDcvrAVJkZMUjSz3+V8BArUtuRMhp5jvJN3JYTPheR5BZQDs4F1NSpfq
   HXZB5yodvYP4ysPRYeYX9CSbP2m3bq/3AqbN6lPLH+BTuAwO+Jqmj+5CD
   R4def2wRQTalKpFnnPzZAAneJTNI8wTYk2VQ+G7h0l2oY6IzZeopmjIE2
   g==;
X-CSE-ConnectionGUID: NSmE8+iwSuKVCUjLr9IJ5g==
X-CSE-MsgGUID: fmC2Za7sSeqCObO/IqW7Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="64750147"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="64750147"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 15:14:51 -0700
X-CSE-ConnectionGUID: RmDWoOVFTdW9PfeESsvN2Q==
X-CSE-MsgGUID: wHCq+vatSoeZvNNd67LvzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="186075691"
Received: from lkp-server01.sh.intel.com (HELO def1aeed4587) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Jul 2025 15:14:50 -0700
Received: from kbuild by def1aeed4587 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYXdH-00001C-2o;
	Sun, 06 Jul 2025 22:14:47 +0000
Date: Mon, 7 Jul 2025 06:13:53 +0800
From: kernel test robot <lkp@intel.com>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Igor Belousov <igor.b@beldev.am>
Subject: [akpm-mm:mm-new 305/305] mm/zblock.h:21:2: warning: #warning This
 PAGE_SIZE is not quite supported yet
Message-ID: <202507070438.bBff5GNo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   15faa166415229365c95213d236c96d189b0153e
commit: 380fc659823f83ca2f89aa27eca81d7a65d666f6 [305/305] mm: add zblock allocator
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20250707/202507070438.bBff5GNo-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250707/202507070438.bBff5GNo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507070438.bBff5GNo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/zblock.c:29:
>> mm/zblock.h:21:2: warning: #warning This PAGE_SIZE is not quite supported yet [-Wcpp]
      21 | #warning This PAGE_SIZE is not quite supported yet
         |  ^~~~~~~
   In file included from <command-line>:
   In function 'create_rbtree',
       inlined from 'init_zblock' at mm/zblock.c:450:12:
   include/linux/compiler_types.h:568:45: error: call to '__compiletime_assert_310' declared with attribute error: BUILD_BUG_ON failed: ARRAY_SIZE(block_desc) > MAX_TABLE_SIZE
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:549:25: note: in definition of macro '__compiletime_assert'
     549 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   mm/zblock.c:415:9: note: in expansion of macro 'BUILD_BUG_ON'
     415 |         BUILD_BUG_ON(ARRAY_SIZE(block_desc) > MAX_TABLE_SIZE);
         |         ^~~~~~~~~~~~


vim +21 mm/zblock.h

    13	
    14	#if PAGE_SIZE == 0x1000
    15	/* max 64 slots per block, max table size 64 */
    16	#define SLOT_BITS 6
    17	#elif PAGE_SIZE == 0x4000
    18	/* max 256 slots per block, max table size 64 */
    19	#define SLOT_BITS 8
    20	#else
  > 21	#warning This PAGE_SIZE is not quite supported yet
    22	#define SLOT_BITS 8
    23	#endif
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
