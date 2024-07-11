Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F41B16EB5C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 18:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720721320; cv=none; b=sYtQiNNDadUyUUoy6k7mKSdFDnRL9EIniH3Hve8oCrMycL4kR10n9/QWhp4KJSMX7o/Nz4+R8r79RnnQkxsOBCaaG+ZVIVa0hpqfo1D/X/tzF25Px7dRlfpGGs/z7+iZCCsHOGqnnNWm1mlFXTlLo2Ts56BH/sp9rW872P5XD0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720721320; c=relaxed/simple;
	bh=IiptmO1GLNf2C5pAjsMhOnoReOKsYphlKLRcpZAB/po=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RTSso5n836VvCdlGPAdjEKVCslACwArmvjfcrCyJnpQsukJCowsGzr6nM81wuCdRcKbNmjtIW9CzOymus5UgoQuuXR2yaw5+GqhKJ+XqFsTYsIX1Q20GT56n+oykbjOnOm6LF8qlzi6FK87Om6O4lnyR8xiaWYBCcUZdcg1GD+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L9mQLURn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9mQLURn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720721319; x=1752257319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IiptmO1GLNf2C5pAjsMhOnoReOKsYphlKLRcpZAB/po=;
  b=L9mQLURneZ67n+KDckmoZYXM7EmuhU4JCuA0jmQWFAcrwAj+rGIYZC8h
   dbr69TTR2kPnlwg5XiasTQbCJih4rkIuqICItMmCfSaLrqGgBNNT1oK3P
   S5wzkcRiUTQlGMyizPF0Brs+UraxkMj7wZshQ1WXPj1rKNqDQs3kYiwae
   UPNV+8d5yNsJEiSxYc2NCEpWCel0D50WpFsm7L5QtQPsnVrKAOGUhqQpZ
   IHunXNa8RexJKH+amKdkpm5bUBCttve8ohjVdAfiQmpqN5PSB/sK3qAuW
   kGm7dR+s+Wa5/SvLXgk1ojdjdLS7kj8sbXRtiPVXY0ECpy/lGjyXXxqgI
   A==;
X-CSE-ConnectionGUID: LHzkSE17RjiFSGupQwejPQ==
X-CSE-MsgGUID: NUDc68rzRRizFga741YiAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="17997655"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="17997655"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 11:08:38 -0700
X-CSE-ConnectionGUID: 597wTtvqQ3yddSbdToiU2g==
X-CSE-MsgGUID: K1AaBxaIRimS3VGncJHk1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="48620203"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Jul 2024 11:08:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRyDa-000Zba-1o;
	Thu, 11 Jul 2024 18:08:34 +0000
Date: Fri, 12 Jul 2024 02:07:59 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.2 2/4] mm/page_counter.c:18:41: error: use
 of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
Message-ID: <202407120154.GNrLyP0o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git page_counters.2
head:   34c52c20ddd81cc0cbd01d6f60cdf686704c59a4
commit: d6dbe16ff3027a41da20b35609e8317a1ce3b2c1 [2/4] mm: memcg: don't call propagate_protected_usage() needlessly
config: s390-randconfig-001-20240711 (https://download.01.org/0day-ci/archive/20240712/202407120154.GNrLyP0o-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407120154.GNrLyP0o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407120154.GNrLyP0o-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/page_counter.c:8:
   include/linux/page_counter.h:71:21: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      71 |         unsigned long emin[MCT_NR_WITH_GUARANTEES];
         |                            ^
   include/linux/page_counter.h:72:26: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      72 |         atomic_long_t min_usage[MCT_NR_WITH_GUARANTEES];
         |                                 ^
   include/linux/page_counter.h:73:35: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      73 |         atomic_long_t children_min_usage[MCT_NR_WITH_GUARANTEES];
         |                                          ^
   include/linux/page_counter.h:76:21: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      76 |         unsigned long elow[MCT_NR_WITH_GUARANTEES];
         |                            ^
   include/linux/page_counter.h:77:26: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      77 |         atomic_long_t low_usage[MCT_NR_WITH_GUARANTEES];
         |                                 ^
   include/linux/page_counter.h:78:35: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      78 |         atomic_long_t children_low_usage[MCT_NR_WITH_GUARANTEES];
         |                                          ^
   include/linux/page_counter.h:87:20: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      87 |         unsigned long min[MCT_NR_WITH_GUARANTEES];
         |                           ^
   include/linux/page_counter.h:88:20: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      88 |         unsigned long low[MCT_NR_WITH_GUARANTEES];
         |                           ^
>> mm/page_counter.c:18:41: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      18 |         return c->protection_support && (idx < MCT_NR_WITH_GUARANTEES);
         |                                                ^
   mm/page_counter.c:30:14: error: invalid operands to binary expression ('unsigned long' and 'void')
      30 |         protected = min(usage, READ_ONCE(c->min[idx]));
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:85:19: note: expanded from macro 'min'
      85 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:56:43: note: expanded from macro '__careful_cmp'
      56 |         __builtin_choose_expr(__is_constexpr((x) - (y)),        \
         |                               ~~~~~~~~~~~~~~~~~~~^~~~~~
   include/linux/compiler.h:284:48: note: expanded from macro '__is_constexpr'
     284 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
         |                                                       ^
   mm/page_counter.c:30:14: error: invalid operands to binary expression ('unsigned long' and 'void')
      30 |         protected = min(usage, READ_ONCE(c->min[idx]));
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:85:19: note: expanded from macro 'min'
      85 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:57:3: note: expanded from macro '__careful_cmp'
      57 |                 __cmp(op, x, y),                                \
         |                 ^~~~~~~~~~~~~~~
   include/linux/minmax.h:46:30: note: expanded from macro '__cmp'
      46 | #define __cmp(op, x, y) ((x) __cmp_op_##op (y) ? (x) : (y))
         |                          ~~~ ^             ~~~
   <scratch space>:77:1: note: expanded from here
      77 | __cmp_op_min
         | ^
   include/linux/minmax.h:43:22: note: expanded from macro '__cmp_op_min'
      43 | #define __cmp_op_min <
         |                      ^
   mm/page_counter.c:30:14: error: variable has incomplete type 'typeof (({
       do {
           extern void __compiletime_assert_53(void);
           if (!((sizeof (<recovery-expr>(c)[idx]) == sizeof(char) || sizeof (<recovery-expr>(c)[idx]) == sizeof(short) || sizeof (<recovery-expr>(c)[idx]) == sizeof(int) || sizeof (<recovery-expr>(c)[idx]) == sizeof(long)) || sizeof (<recovery-expr>(c)[idx]) == sizeof(long long)))
               __compiletime_assert_53();
       } while (0);
   }))' (aka 'void')
   include/linux/minmax.h:85:19: note: expanded from macro 'min'
      85 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^
   include/linux/minmax.h:58:42: note: expanded from macro '__careful_cmp'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                                                        ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:83:1: note: expanded from here
      83 | __UNIQUE_ID___y55
         | ^
   mm/page_counter.c:30:14: error: invalid operands to binary expression ('typeof (({
       do {
           extern void __compiletime_assert_53(void);
           if (!((sizeof (<recovery-expr>(c)[idx]) == sizeof(char) || sizeof (<recovery-expr>(c)[idx]) == sizeof(short) || sizeof (<recovery-expr>(c)[idx]) == sizeof(int) || sizeof (<recovery-expr>(c)[idx]) == sizeof(long)) || sizeof (<recovery-expr>(c)[idx]) == sizeof(long long)))
               __compiletime_assert_53();
       } while (0);
   }))' (aka 'void') and 'typeof (({
       do {
           extern void __compiletime_assert_53(void);
           if (!((sizeof (<recovery-expr>(c)[idx]) == sizeof(char) || sizeof (<recovery-expr>(c)[idx]) == sizeof(short) || sizeof (<recovery-expr>(c)[idx]) == sizeof(int) || sizeof (<recovery-expr>(c)[idx]) == sizeof(long)) || sizeof (<recovery-expr>(c)[idx]) == sizeof(long long)))
               __compiletime_assert_53();
       } while (0);
   }))' (aka 'void'))
      30 |         protected = min(usage, READ_ONCE(c->min[idx]));
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:85:19: note: expanded from macro 'min'
      85 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:58:3: note: expanded from macro '__careful_cmp'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:51:16: note: expanded from macro '__cmp_once'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      52 |                 #op "(" #x ", " #y ") signedness error, fix types or consider u" #op "() before " #op "_t()"); \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:284:48: note: expanded from macro '__is_constexpr'
     284 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
         |                                                       ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   mm/page_counter.c:30:14: error: invalid operands to binary expression ('typeof (({
       do {
           extern void __compiletime_assert_53(void);
           if (!((sizeof (<recovery-expr>(c)[idx]) == sizeof(char) || sizeof (<recovery-expr>(c)[idx]) == sizeof(short) || sizeof (<recovery-expr>(c)[idx]) == sizeof(int) || sizeof (<recovery-expr>(c)[idx]) == sizeof(long)) || sizeof (<recovery-expr>(c)[idx]) == sizeof(long long)))
               __compiletime_assert_53();
       } while (0);
   }))' (aka 'void') and 'typeof (({


vim +/MCT_NR_WITH_GUARANTEES +18 mm/page_counter.c

    15	
    16	static bool track_protection(struct page_counter *c, unsigned long idx)
    17	{
  > 18		return c->protection_support && (idx < MCT_NR_WITH_GUARANTEES);
    19	}
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
