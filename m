Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12C9A929
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 May 2024 22:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716244236; cv=none; b=j1/vMmE+WaaWCTXe20a7TWxqmwR4uonXUl9+qkoBaQsYlnfvg2YGg/LrXKKujM1c4mVPb60EJHN42z2VcT18LDjEonhAMqvLK5Chv5QmxOyBjMB61E+k6jibeq0DqCx8u5WHsRcGPfdO6Q7GyecmRTc7co9grUxNLxttu/sALaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716244236; c=relaxed/simple;
	bh=G+N4wexytpM8PSgHOk2zrupjTVk+evzUx0eux/YAWJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fif5PEucMXlW5yyb4R7d+qn/hGANrGI+wk0ujpLYCmgXDF/Yu4Kw2Uw4IXpatO5ZXTdaAn1lrB01pGeOOdaZdOhiBce06xBRHZZT50XIEIPhummB2piZvCsJqVjMoPnduozwF9wvbaNbs/I3jsEwUBvZFACbyQF+TcYALtqjNGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IzsjFHhj; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IzsjFHhj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716244234; x=1747780234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G+N4wexytpM8PSgHOk2zrupjTVk+evzUx0eux/YAWJ0=;
  b=IzsjFHhjrS9m32CtjdjtoNLlComCHkwA3qs3R4F4CFt99oPRoA69p4Pg
   fMjFafGIGaCocf1oeE6u+KNuCQM51/ZoGUgfrl6CNzy+ZlJJat2J61vTk
   OS+7Kbxm+Ois7cjs5KTDkmfiQpYy4Oorafrx09PoETg1Ne2Y2oTK0aazK
   r0IO5YD7k6Bwr9PkHE6+zGSYiPpwRzNFTPSEDKKm6be/Q12aBGgknOgyt
   MwxdPHQKNfQQUdaDMR/53kxHLhiIpRALS1n36CPSz37cnLvrbmlOqDo8/
   Tq+WWbvCHgk/RaXHvHATh5f5yZ/cHksJDs56yW38XHqzYJKb+mmZrHRCE
   g==;
X-CSE-ConnectionGUID: cl0hDDJkSkqr0df0cow4Kw==
X-CSE-MsgGUID: 7gTeVbjoTjalBdCO5Dok9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23006690"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="23006690"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 15:30:33 -0700
X-CSE-ConnectionGUID: JI7qz92LSA+XZMkAAIB1fQ==
X-CSE-MsgGUID: MTf21s0NQSumNwpKNL8CuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="33255803"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 20 May 2024 15:30:32 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9BVw-0005Cs-1k;
	Mon, 20 May 2024 22:30:04 +0000
Date: Tue, 21 May 2024 06:26:26 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rcu:boqun-dev/hazptr 1/1] include/linux/hazptr.h:14:9: error:
 expected specifier-qualifier-list before '____cacheline_aligned'
Message-ID: <202405210640.wlCvyKXo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git boqun-dev/hazptr
head:   ca2ab86d71c6d322c87127363aa4b665012a0ac2
commit: ca2ab86d71c6d322c87127363aa4b665012a0ac2 [1/1] WIP
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240521/202405210640.wlCvyKXo-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405210640.wlCvyKXo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405210640.wlCvyKXo-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/rcu/hazptr.c:5:
>> include/linux/hazptr.h:14:9: error: expected specifier-qualifier-list before '____cacheline_aligned'
      14 |         ____cacheline_aligned unsigned long slots[HAZPTR_SLOT_PER_CTX];
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/hazptr.c: In function 'init_hazptr_context':
>> kernel/rcu/hazptr.c:21:21: error: 'struct hazptr_context' has no member named 'slots'
      21 |                 hzcp->slots[i] = HAZPTR_UNUSED;
         |                     ^~
   In file included from <command-line>:
   kernel/rcu/hazptr.c: In function 'hazptr_alloc':
   kernel/rcu/hazptr.c:41:35: error: 'struct hazptr_context' has no member named 'slots'
      41 |                 if (READ_ONCE(hzcp->slots[i]) == HAZPTR_UNUSED) {
         |                                   ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/hazptr.c:41:21: note: in expansion of macro 'READ_ONCE'
      41 |                 if (READ_ONCE(hzcp->slots[i]) == HAZPTR_UNUSED) {
         |                     ^~~~~~~~~
   kernel/rcu/hazptr.c:41:35: error: 'struct hazptr_context' has no member named 'slots'
      41 |                 if (READ_ONCE(hzcp->slots[i]) == HAZPTR_UNUSED) {
         |                                   ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/hazptr.c:41:21: note: in expansion of macro 'READ_ONCE'
      41 |                 if (READ_ONCE(hzcp->slots[i]) == HAZPTR_UNUSED) {
         |                     ^~~~~~~~~
   kernel/rcu/hazptr.c:41:35: error: 'struct hazptr_context' has no member named 'slots'
      41 |                 if (READ_ONCE(hzcp->slots[i]) == HAZPTR_UNUSED) {
         |                                   ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/hazptr.c:41:21: note: in expansion of macro 'READ_ONCE'
      41 |                 if (READ_ONCE(hzcp->slots[i]) == HAZPTR_UNUSED) {
         |                     ^~~~~~~~~
   kernel/rcu/hazptr.c:41:35: error: 'struct hazptr_context' has no member named 'slots'
      41 |                 if (READ_ONCE(hzcp->slots[i]) == HAZPTR_UNUSED) {
         |                                   ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/hazptr.c:41:21: note: in expansion of macro 'READ_ONCE'
      41 |                 if (READ_ONCE(hzcp->slots[i]) == HAZPTR_UNUSED) {
         |                     ^~~~~~~~~
   kernel/rcu/hazptr.c:41:35: error: 'struct hazptr_context' has no member named 'slots'
      41 |                 if (READ_ONCE(hzcp->slots[i]) == HAZPTR_UNUSED) {
         |                                   ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
--
   kernel/rcu/hazptr_test.c: In function 'simple_func':
>> kernel/rcu/hazptr_test.c:8:9: error: implicit declaration of function 'kfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
       8 |         kfree(head);
         |         ^~~~~
         |         kvfree
   kernel/rcu/hazptr_test.c: In function 'simple':
>> kernel/rcu/hazptr_test.c:18:17: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
      18 |         dummy = kzalloc(sizeof(*dummy), GFP_KERNEL);
         |                 ^~~~~~~
>> kernel/rcu/hazptr_test.c:18:15: warning: assignment to 'struct callback_head *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      18 |         dummy = kzalloc(sizeof(*dummy), GFP_KERNEL);
         |               ^
   kernel/rcu/hazptr_test.c:19:15: warning: assignment to 'struct callback_head *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      19 |         other = kzalloc(sizeof(*dummy), GFP_KERNEL);
         |               ^
   cc1: some warnings being treated as errors


vim +/____cacheline_aligned +14 include/linux/hazptr.h

     8	
     9	struct hazptr_context {
    10		// The lock of the percpu context lists.
    11		spinlock_t *lock;
    12	
    13		struct list_head list;
  > 14		____cacheline_aligned unsigned long slots[HAZPTR_SLOT_PER_CTX];
    15	};
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
