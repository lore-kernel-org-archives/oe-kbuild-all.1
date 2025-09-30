Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5530B79F2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Sep 2025 05:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759209362; cv=none; b=J3B0dVORJ4cx0jl7zeZanyn3HUXHA5iAihguuKwS/v5Nj6uphIMGSAj0AkYfLJfIE3IRBTsf662vqt0EKYL+DWViMqYccTevGUgd7I2bmSkJG4yd5Zk/37UMB4NcgOX1Pu3offBmi0lvUKL/ZuvlmrCQDF1lrVoxgIDnLhq9puQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759209362; c=relaxed/simple;
	bh=g2zlxhZcMlSNi/oBHERe1+0gY765BRP5szTJ+h5YXmE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T68pxECAXtizRmp7GmKAF+QsvXAUz6uoctlmF4gmdiBsd0FpzjIOprUlxJbxF/S9lsObNEfLNakZ6YwfOcKoY83l2byuJAsVuc3EZrVEEpcU37HBc4huirfQuir3aTlwt9GXUNKvj03e5tO+J5bSWtb2iLht8ZAQa82fVOu1Y1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ewkrxMBW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ewkrxMBW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759209360; x=1790745360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g2zlxhZcMlSNi/oBHERe1+0gY765BRP5szTJ+h5YXmE=;
  b=ewkrxMBW9QE4HGXI/QPKJvPFkiR1AFvxqYsGmLPkX3+qnnCfGPjlb/hZ
   PsIsSmMHh5vz7eytyXBGGTEKvDmMVwuXjLUc0UyV89Wey+xZ/C7GuVmmX
   C11W+opejPBqT58WxdfSQkKN/pAa1YygjN3Xqyt3XMdRIWVPA/Bw06irL
   zVKC7r0JFr1iA+1fhfDoBS66wtXk1eZ13ydnLYiDStre1BxC32DerFyft
   /o5H9/7SwPq/DfUiIxflWwGO+Grnb4J5hCmYZqdO7QGoaLdIOe2BCs0hm
   B9tXOPWC8/iVqDeUwx1sEXl0xQWfkbjtgXkSpnLzWp5oq690l6MqdsD2b
   w==;
X-CSE-ConnectionGUID: zDARQBHrQhWMpMiBg3quRg==
X-CSE-MsgGUID: YYVHh8O9TjupTIgARzA+8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="64079540"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="64079540"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 22:15:59 -0700
X-CSE-ConnectionGUID: eDYFZvpXQDCThga6Wk5XuA==
X-CSE-MsgGUID: 6Us6H1hwQlqaIjl0WovVcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="183607276"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Sep 2025 22:15:58 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3SiS-0000vP-05;
	Tue, 30 Sep 2025 05:15:56 +0000
Date: Tue, 30 Sep 2025 13:15:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-05 4/4]
 include/linux/compiler_types.h:316:27: error: expression in static assertion
 is not an integer
Message-ID: <202509301304.Jke4FMLR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-05
head:   8467da20fd06f8d73f52ec5289cb41f0496ead78
commit: 24f186b6215a84672d5bb05746085098c32c4995 [4/4] UPSTREAM: af_unix: Allocate struct unix_vertex for each inflight AF_UNIX fd.
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250930/202509301304.Jke4FMLR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250930/202509301304.Jke4FMLR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509301304.Jke4FMLR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:21,
                    from net/unix/garbage.c:66:
   net/unix/garbage.c: In function 'unix_free_vertices':
   net/unix/garbage.c:108:59: error: 'struct scm_fp_list' has no member named 'vertices'
     108 |         list_for_each_entry_safe(vertex, next_vertex, &fpl->vertices, entry) {
         |                                                           ^~
   include/linux/container_of.h:18:33: note: in definition of macro 'container_of'
      18 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:531:9: note: in expansion of macro 'list_entry'
     531 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:761:20: note: in expansion of macro 'list_first_entry'
     761 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   net/unix/garbage.c:108:9: note: in expansion of macro 'list_for_each_entry_safe'
     108 |         list_for_each_entry_safe(vertex, next_vertex, &fpl->vertices, entry) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/container_of.h:5:
   net/unix/garbage.c:108:59: error: 'struct scm_fp_list' has no member named 'vertices'
     108 |         list_for_each_entry_safe(vertex, next_vertex, &fpl->vertices, entry) {
         |                                                           ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:19:9: note: in expansion of macro 'static_assert'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:19:23: note: in expansion of macro '__same_type'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:531:9: note: in expansion of macro 'list_entry'
     531 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:761:20: note: in expansion of macro 'list_first_entry'
     761 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   net/unix/garbage.c:108:9: note: in expansion of macro 'list_for_each_entry_safe'
     108 |         list_for_each_entry_safe(vertex, next_vertex, &fpl->vertices, entry) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   net/unix/garbage.c:108:59: error: 'struct scm_fp_list' has no member named 'vertices'
     108 |         list_for_each_entry_safe(vertex, next_vertex, &fpl->vertices, entry) {
         |                                                           ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:19:9: note: in expansion of macro 'static_assert'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:531:9: note: in expansion of macro 'list_entry'
     531 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:761:20: note: in expansion of macro 'list_first_entry'
     761 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   net/unix/garbage.c:108:9: note: in expansion of macro 'list_for_each_entry_safe'
     108 |         list_for_each_entry_safe(vertex, next_vertex, &fpl->vertices, entry) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/compiler_types.h:316:27: error: expression in static assertion is not an integer
     316 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:19:9: note: in expansion of macro 'static_assert'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:19:23: note: in expansion of macro '__same_type'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:531:9: note: in expansion of macro 'list_entry'
     531 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:761:20: note: in expansion of macro 'list_first_entry'
     761 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   net/unix/garbage.c:108:9: note: in expansion of macro 'list_for_each_entry_safe'
     108 |         list_for_each_entry_safe(vertex, next_vertex, &fpl->vertices, entry) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/preempt.h:12,
                    from include/linux/spinlock.h:56,
                    from include/linux/kref.h:16,
                    from include/linux/mm_types.h:8,
                    from include/linux/uio.h:10,
                    from include/linux/socket.h:8,
                    from net/unix/garbage.c:68:
   net/unix/garbage.c:108:59: error: 'struct scm_fp_list' has no member named 'vertices'
     108 |         list_for_each_entry_safe(vertex, next_vertex, &fpl->vertices, entry) {
         |                                                           ^~
   include/linux/list.h:665:27: note: in definition of macro 'list_entry_is_head'
     665 |         (&pos->member == (head))
         |                           ^~~~
   net/unix/garbage.c:108:9: note: in expansion of macro 'list_for_each_entry_safe'
     108 |         list_for_each_entry_safe(vertex, next_vertex, &fpl->vertices, entry) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   net/unix/garbage.c: In function 'unix_prepare_fpl':
   net/unix/garbage.c:127:46: error: 'struct scm_fp_list' has no member named 'vertices'
     127 |                 list_add(&vertex->entry, &fpl->vertices);
         |                                              ^~


vim +316 include/linux/compiler_types.h

eb111869301e15 Rasmus Villemoes 2019-09-13  314  
d15155824c5014 Will Deacon      2017-10-24  315  /* Are two types/vars the same type (ignoring qualifiers)? */
d15155824c5014 Will Deacon      2017-10-24 @316  #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
d15155824c5014 Will Deacon      2017-10-24  317  

:::::: The code at line 316 was first introduced by commit
:::::: d15155824c5014803d91b829736d249c500bdda6 linux/compiler.h: Split into compiler.h and compiler_types.h

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
