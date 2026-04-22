Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A002D8385
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Apr 2026 17:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776878346; cv=none; b=dWvYqMXLJYsKQY0/oM1bm3D7YWJ/DONrngHVOtUXPB9YF8RVTK2lJGM/eYvqcarU2+8NVjhko70nwXEPKG4dpH6u3JgmcW/6f33EFUa9KpxWOYCiNkyHsCPTb4FqT7dwmNZo3MAcGjBvLO6KWD6QZj0mTPDTGScRGWkCEWnM1Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776878346; c=relaxed/simple;
	bh=e7nRBa/PS+AYtufa7FT0t3atUa3ukUDfqjREWY7Zfi4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qb9TS7HPvsbseaoD4J2/XV2mG/RAUXgePxwW+ACumQ667zqf5/JHLCE/wd6S7TR77/bml/6ajWauMCM6Nz6tUa/SdXxMSKFDhJ28XsnthIJSs8g3XHbtj7oN7n2+KKS3WHp3sMRLZevTSB/IthMWhHjsScfnyFi6vuvQJ1e9tNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V2K5R0r2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V2K5R0r2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776878344; x=1808414344;
  h=date:from:to:cc:subject:message-id;
  bh=e7nRBa/PS+AYtufa7FT0t3atUa3ukUDfqjREWY7Zfi4=;
  b=V2K5R0r2INc6Iu3KGnYY2jBAZqGkC/QCt4QJnseiJn7kXsy7j0LyM6UG
   6zVWb03LdpYvQzxbk78KDHwoMK/x5dmeTJU89T9xPcOM0I37YjpzCiuTQ
   WrU5YBfkynYmtm+AgiHk4EF6sKVjH6YPGFUkzrvvpW2oEOJF3CjQohXPZ
   Nns7q8YHknj33IVRpAf613MkarZWrHujRimm5vWQr+Q+s+BFyJDpX2sl6
   lRNmewL9ztezVZ71U6nKBJkdJFYeTssWqyRWmWXcqz4KDtPvKOmU+Zd0Q
   6fO/o35cZJ9shJ9/O2WD6ZjyPB3mDTYdYzsLuWpILf3hdfN+2xJpa7WGN
   A==;
X-CSE-ConnectionGUID: 1RGlQdUJRHCAdYnEZb6akw==
X-CSE-MsgGUID: XrYsD5fySnOs7Vxx40eqqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88141786"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="88141786"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 10:19:03 -0700
X-CSE-ConnectionGUID: P5v/SWOvR0ivbtjK4jg+LQ==
X-CSE-MsgGUID: 9rVshP5KQX29gNkLcg6FOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="236413291"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Apr 2026 10:19:02 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFbE3-000000000rB-2kmN;
	Wed, 22 Apr 2026 17:18:59 +0000
Date: Thu, 23 Apr 2026 01:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2024-11 8/8]
 net/unix/garbage.c:108:54: error: no member named 'vertices' in 'struct
 scm_fp_list'
Message-ID: <202604230135.2w4AfNeE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1-2024-11
head:   c0f9df9d4f8824c008c288daa0835efaac06edcf
commit: 4dbe8ccd43b979991b2ac2675f9ed486becac5ff [8/8] UPSTREAM: af_unix: Allocate struct unix_vertex for each inflight AF_UNIX fd.
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260423/202604230135.2w4AfNeE-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260423/202604230135.2w4AfNeE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604230135.2w4AfNeE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/unix/garbage.c:108:54: error: no member named 'vertices' in 'struct scm_fp_list'
     108 |         list_for_each_entry_safe(vertex, next_vertex, &fpl->vertices, entry) {
         |                                                        ~~~  ^
   include/linux/list.h:761:30: note: expanded from macro 'list_for_each_entry_safe'
     761 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                                     ^~~~
   include/linux/list.h:531:14: note: expanded from macro 'list_first_entry'
     531 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:520:15: note: expanded from macro 'list_entry'
     520 |         container_of(ptr, type, member)
         |                      ^~~
   include/linux/container_of.h:18:26: note: expanded from macro 'container_of'
      18 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
>> net/unix/garbage.c:108:54: error: no member named 'vertices' in 'struct scm_fp_list'
     108 |         list_for_each_entry_safe(vertex, next_vertex, &fpl->vertices, entry) {
         |                                                        ~~~  ^
   include/linux/list.h:761:30: note: expanded from macro 'list_for_each_entry_safe'
     761 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                                     ^~~~
   include/linux/list.h:531:14: note: expanded from macro 'list_first_entry'
     531 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:520:15: note: expanded from macro 'list_entry'
     520 |         container_of(ptr, type, member)
         |                      ^~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:316:63: note: expanded from macro '__same_type'
     316 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
>> net/unix/garbage.c:108:54: error: no member named 'vertices' in 'struct scm_fp_list'
     108 |         list_for_each_entry_safe(vertex, next_vertex, &fpl->vertices, entry) {
         |                                                        ~~~  ^
   include/linux/list.h:761:30: note: expanded from macro 'list_for_each_entry_safe'
     761 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                                     ^~~~
   include/linux/list.h:531:14: note: expanded from macro 'list_first_entry'
     531 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:520:15: note: expanded from macro 'list_entry'
     520 |         container_of(ptr, type, member)
         |                      ^~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:316:63: note: expanded from macro '__same_type'
     316 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
>> net/unix/garbage.c:108:54: error: no member named 'vertices' in 'struct scm_fp_list'
     108 |         list_for_each_entry_safe(vertex, next_vertex, &fpl->vertices, entry) {
         |                                                        ~~~  ^
   include/linux/list.h:763:32: note: expanded from macro 'list_for_each_entry_safe'
     763 |              !list_entry_is_head(pos, head, member);                    \
         |                                       ^~~~
   include/linux/list.h:665:20: note: expanded from macro 'list_entry_is_head'
     665 |         (&pos->member == (head))
         |                           ^~~~
   net/unix/garbage.c:127:34: error: no member named 'vertices' in 'struct scm_fp_list'
     127 |                 list_add(&vertex->entry, &fpl->vertices);
         |                                           ~~~  ^
   5 errors generated.


vim +108 net/unix/garbage.c

   103	
   104	static void unix_free_vertices(struct scm_fp_list *fpl)
   105	{
   106		struct unix_vertex *vertex, *next_vertex;
   107	
 > 108		list_for_each_entry_safe(vertex, next_vertex, &fpl->vertices, entry) {
   109			list_del(&vertex->entry);
   110			kfree(vertex);
   111		}
   112	}
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
