Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83550224AF7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 23:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764459340; cv=none; b=GsTd2+FQayA3kA0zdXLqfDL3EGD5oxeDSQTQnBPOx86L6PjXqpNIGo4GoJSq33mZtEryJMfBt6lrhHZJudc1uts16ynQuacVfo6nEzVHTE4uQspc4nPDWD2RcWUJ+ysYJnQMTxbCCMyVSVZt18552gW73QGv9ezDPq3MqljRKeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764459340; c=relaxed/simple;
	bh=p9sHDk7+7GmM4EdNSN1k/QSYDWP2ipLEld/Jgzmom7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OaZcJCSIg/pay8bv16EDbq0tz0Ho/Id8cbNFej8ig0FtQ3Qpxn9quxa2Sk1o2fOkvpvlA/TzVaSu25GlRDZAzPv5Y2CFMO8OsCVhQvolMb8PbR/GENlVAuf8KzDMf4Xw+o5cYC8CL7p08NnBM1LIjZ5bzrxLlYe2rPgWjjtnFbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YQG88xmm; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YQG88xmm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764459339; x=1795995339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p9sHDk7+7GmM4EdNSN1k/QSYDWP2ipLEld/Jgzmom7k=;
  b=YQG88xmmQ0dBOAQpsUDFX1l5jHEO50pa7U94tmGhfYIxzeCQtzJTi3wv
   SfDe94wEqfKI+TTbEeYtdjnuU8jThc0UzQskHLhKzbmOFVBE3hMGBqttl
   iLqWjN2nIikfS0t4ZNke3YfghkhluEDs0azOSh9sRSy8/kIfqE0pUhCP0
   pCsU/L95NeuSMcrT1yTej12ffKPwdrMrEzbjWJH507fTbI00OWz/0h6eV
   Y8sR/SYllK6TEgM3XcxxRf/jZWYCCGTLM5HS06v/itQNkIMxM1RO2KgWG
   OkgcPEaFS4vpOdqG/Q6WKWO/bcrgIw+7jcfjIzK12xHfTXApsP+aiZdoa
   g==;
X-CSE-ConnectionGUID: IFgUrXz6SrCBDZD3wq1Blg==
X-CSE-MsgGUID: AKvEugYvTXyiVQKUIIMdaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="66601030"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="66601030"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 15:35:38 -0800
X-CSE-ConnectionGUID: 1E40CCnNSNWk+LKW010sfQ==
X-CSE-MsgGUID: RE9DlHqFQMm2KaPoH0ynJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="194522589"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Nov 2025 15:35:37 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPUTW-000000007fl-3D2i;
	Sat, 29 Nov 2025 23:35:34 +0000
Date: Sun, 30 Nov 2025 07:35:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:rqspinlock/freeze 1/1] kernel/bpf/rqspinlock.c:214:43:
 error: invalid use of undefined type 'struct mcs_spinlock'
Message-ID: <202511300707.d7T08mYO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux rqspinlock/freeze
head:   ecbeea85f52f8ff53a69932204c687c4de11f1c9
commit: ecbeea85f52f8ff53a69932204c687c4de11f1c9 [1/1] rqspinlock: Back propagate deadlock signals from successors
config: parisc-randconfig-001-20251130 (https://download.01.org/0day-ci/archive/20251130/202511300707.d7T08mYO-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251130/202511300707.d7T08mYO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511300707.d7T08mYO-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/bpf/rqspinlock.c:202:42: warning: 'struct mcs_spinlock' declared inside parameter list will not be visible outside of this definition or declaration
     202 |                                   struct mcs_spinlock *node)
         |                                          ^~~~~~~~~~~~
   In file included from <command-line>:
   kernel/bpf/rqspinlock.c: In function 'check_timeout':
>> kernel/bpf/rqspinlock.c:214:43: error: invalid use of undefined type 'struct mcs_spinlock'
     214 |                 if (node && READ_ONCE(node->next)) {
         |                                           ^~
   include/linux/compiler_types.h:582:23: note: in definition of macro '__compiletime_assert'
     582 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:602:9: note: in expansion of macro '_compiletime_assert'
     602 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/bpf/rqspinlock.c:214:29: note: in expansion of macro 'READ_ONCE'
     214 |                 if (node && READ_ONCE(node->next)) {
         |                             ^~~~~~~~~
>> kernel/bpf/rqspinlock.c:214:43: error: invalid use of undefined type 'struct mcs_spinlock'
     214 |                 if (node && READ_ONCE(node->next)) {
         |                                           ^~
   include/linux/compiler_types.h:582:23: note: in definition of macro '__compiletime_assert'
     582 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:602:9: note: in expansion of macro '_compiletime_assert'
     602 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/bpf/rqspinlock.c:214:29: note: in expansion of macro 'READ_ONCE'
     214 |                 if (node && READ_ONCE(node->next)) {
         |                             ^~~~~~~~~
>> kernel/bpf/rqspinlock.c:214:43: error: invalid use of undefined type 'struct mcs_spinlock'
     214 |                 if (node && READ_ONCE(node->next)) {
         |                                           ^~
   include/linux/compiler_types.h:582:23: note: in definition of macro '__compiletime_assert'
     582 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:602:9: note: in expansion of macro '_compiletime_assert'
     602 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/bpf/rqspinlock.c:214:29: note: in expansion of macro 'READ_ONCE'
     214 |                 if (node && READ_ONCE(node->next)) {
         |                             ^~~~~~~~~
>> kernel/bpf/rqspinlock.c:214:43: error: invalid use of undefined type 'struct mcs_spinlock'
     214 |                 if (node && READ_ONCE(node->next)) {
         |                                           ^~
   include/linux/compiler_types.h:582:23: note: in definition of macro '__compiletime_assert'
     582 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:602:9: note: in expansion of macro '_compiletime_assert'
     602 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/bpf/rqspinlock.c:214:29: note: in expansion of macro 'READ_ONCE'
     214 |                 if (node && READ_ONCE(node->next)) {
         |                             ^~~~~~~~~
>> kernel/bpf/rqspinlock.c:214:43: error: invalid use of undefined type 'struct mcs_spinlock'
     214 |                 if (node && READ_ONCE(node->next)) {
         |                                           ^~
   include/linux/compiler_types.h:582:23: note: in definition of macro '__compiletime_assert'
     582 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:602:9: note: in expansion of macro '_compiletime_assert'
     602 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/rqspinlock.c:214:29: note: in expansion of macro 'READ_ONCE'
     214 |                 if (node && READ_ONCE(node->next)) {
         |                             ^~~~~~~~~
>> kernel/bpf/rqspinlock.c:214:43: error: invalid use of undefined type 'struct mcs_spinlock'
     214 |                 if (node && READ_ONCE(node->next)) {
         |                                           ^~
   include/linux/compiler_types.h:552:27: note: in definition of macro '__unqual_scalar_typeof'
     552 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   kernel/bpf/rqspinlock.c:214:29: note: in expansion of macro 'READ_ONCE'
     214 |                 if (node && READ_ONCE(node->next)) {
         |                             ^~~~~~~~~
   In file included from ./arch/parisc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:382,
                    from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/smp.h:12,
                    from kernel/bpf/rqspinlock.c:16:
>> kernel/bpf/rqspinlock.c:214:43: error: invalid use of undefined type 'struct mcs_spinlock'
     214 |                 if (node && READ_ONCE(node->next)) {
         |                                           ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   kernel/bpf/rqspinlock.c:214:29: note: in expansion of macro 'READ_ONCE'
     214 |                 if (node && READ_ONCE(node->next)) {
         |                             ^~~~~~~~~
   kernel/bpf/rqspinlock.c:215:33: error: invalid use of undefined type 'struct mcs_spinlock'
     215 |                         if (node->next->locked != RES_HUNG_VAL)
         |                                 ^~
   kernel/bpf/rqspinlock.c:240:43: error: invalid use of undefined type 'struct mcs_spinlock'
     240 |                 if (node && READ_ONCE(node->next)) {
         |                                           ^~
   include/linux/compiler_types.h:582:23: note: in definition of macro '__compiletime_assert'
     582 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:602:9: note: in expansion of macro '_compiletime_assert'
     602 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/bpf/rqspinlock.c:240:29: note: in expansion of macro 'READ_ONCE'
     240 |                 if (node && READ_ONCE(node->next)) {
         |                             ^~~~~~~~~
   kernel/bpf/rqspinlock.c:240:43: error: invalid use of undefined type 'struct mcs_spinlock'
     240 |                 if (node && READ_ONCE(node->next)) {
         |                                           ^~
   include/linux/compiler_types.h:582:23: note: in definition of macro '__compiletime_assert'
     582 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:602:9: note: in expansion of macro '_compiletime_assert'
     602 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/bpf/rqspinlock.c:240:29: note: in expansion of macro 'READ_ONCE'
     240 |                 if (node && READ_ONCE(node->next)) {
         |                             ^~~~~~~~~
   kernel/bpf/rqspinlock.c:240:43: error: invalid use of undefined type 'struct mcs_spinlock'
     240 |                 if (node && READ_ONCE(node->next)) {
         |                                           ^~
   include/linux/compiler_types.h:582:23: note: in definition of macro '__compiletime_assert'
     582 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:602:9: note: in expansion of macro '_compiletime_assert'
     602 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/bpf/rqspinlock.c:240:29: note: in expansion of macro 'READ_ONCE'
     240 |                 if (node && READ_ONCE(node->next)) {
         |                             ^~~~~~~~~
   kernel/bpf/rqspinlock.c:240:43: error: invalid use of undefined type 'struct mcs_spinlock'
     240 |                 if (node && READ_ONCE(node->next)) {
         |                                           ^~
   include/linux/compiler_types.h:582:23: note: in definition of macro '__compiletime_assert'
     582 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:602:9: note: in expansion of macro '_compiletime_assert'
     602 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/bpf/rqspinlock.c:240:29: note: in expansion of macro 'READ_ONCE'
     240 |                 if (node && READ_ONCE(node->next)) {
         |                             ^~~~~~~~~
   kernel/bpf/rqspinlock.c:240:43: error: invalid use of undefined type 'struct mcs_spinlock'
     240 |                 if (node && READ_ONCE(node->next)) {
         |                                           ^~
   include/linux/compiler_types.h:582:23: note: in definition of macro '__compiletime_assert'
     582 |                 if (!(condition))                                       \


vim +214 kernel/bpf/rqspinlock.c

   199	
   200	static noinline int check_timeout(rqspinlock_t *lock, u32 mask,
   201					  struct rqspinlock_timeout *ts,
 > 202					  struct mcs_spinlock *node)
   203	{
   204		u64 prev = ts->cur;
   205		u64 time;
   206		int ret;
   207	
   208		if (!ts->timeout_end) {
   209			if (check_deadlock_AA(lock))
   210				return -EDEADLK;
   211			/*
   212			 * Is the successor indicating to us that they have a deadlock?
   213			 */
 > 214			if (node && READ_ONCE(node->next)) {
   215				if (node->next->locked != RES_HUNG_VAL)
   216					return 0;
   217				return -ETIMEDOUT;
   218			}
   219			ts->cur = ktime_get_mono_fast_ns();
   220			ts->timeout_end = ts->cur + ts->duration;
   221			return 0;
   222		}
   223	
   224		time = ktime_get_mono_fast_ns();
   225		if (time > ts->timeout_end)
   226			return -ETIMEDOUT;
   227	
   228		/*
   229		 * A millisecond interval passed from last time? Trigger deadlock
   230		 * checks.
   231		 */
   232		if (prev + NSEC_PER_MSEC < time) {
   233			ts->cur = time;
   234			ret = check_deadlock_ABBA(lock, mask);
   235			if (ret)
   236				return ret;
   237			/*
   238			 * Is the successor indicating to us that they have a deadlock?
   239			 */
   240			if (node && READ_ONCE(node->next)) {
   241				if (node->next->locked != RES_HUNG_VAL)
   242					return 0;
   243				return -ETIMEDOUT;
   244			}
   245		}
   246	
   247		return 0;
   248	}
   249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
