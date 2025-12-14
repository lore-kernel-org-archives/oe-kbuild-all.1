Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722478F48
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 11:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765710130; cv=none; b=Z8P5a81he/O2509znSoU61f7N37n2Ri6QA6tf9IAbYTeR/zV6ejfTE+Zuwtn2SDPZ9cLVmT5iZUx8WsEXQfz1i/vSBcUmia0Lv7Iql2dALp+oI1Zr5DvtJ91i0Mn5ymZ/HQTNyYiU5wXkl7fcpiugaFBXhjIeLh9OZukl8P5u/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765710130; c=relaxed/simple;
	bh=/I0egi0MSNJPav7c2GVq/D0RhFl7XRFSQUPMF5QqX9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mEGCqHJCKwIhdX4UQaM88PxC9aVzT5CPvEKHY+KrlTAVSYqy+Qxg+fd/4BrhYHFHfXld2GmT8j+A5lyiyJQbjaAi322MaMNuc2fDz1+3kMJ2Y7XSrWBMKnQXEDrCiZOOe52m8uvwcW//Wc533FWcAoahRZWLhViAI/CS1UHmMdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XCPO643O; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XCPO643O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765710129; x=1797246129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/I0egi0MSNJPav7c2GVq/D0RhFl7XRFSQUPMF5QqX9M=;
  b=XCPO643OOmrKIhaw0dl/zc15yE0sP7ZUaGzpw7EttUqirgXmT1MKsnjE
   4QNvk6fnJB6BvbkqKGN3QdwjQiFnYzYHg9Hh+834sEPdEcxoeLaW5EjDU
   iQNWP2Yv5JnNiZ+nMf2K1jQSCdZK148Md4UhZ63ar19JMuaSQatYu7bgs
   d8a3QGKAYzT2uYmJcXneddyqH7iWLfwY6FibOaFIBoWPkZZ1KmXeHQtPB
   FbZmBIOgSPxqMvdGq3lRW8xS4Sg5oI+xsVasL5H7wAPkzTQeABNEpCD7g
   kUW0QqwzOklf8TM7QE2Q0AcvIcnql+NZQ0DGg9Nc8oNWFrAR3vnku0tQK
   g==;
X-CSE-ConnectionGUID: qY+SS9qcRoGMNipcO0JA7A==
X-CSE-MsgGUID: tbdoLucfQUm68dBFPnMjuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="71492055"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="71492055"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 03:02:08 -0800
X-CSE-ConnectionGUID: 2wUToX+fQwuw7LDFdWhceA==
X-CSE-MsgGUID: l6Eb4W84QRCeaMuEAviZKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="201904356"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Dec 2025 03:02:06 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUjrY-000000008yr-2qZw;
	Sun, 14 Dec 2025 11:02:04 +0000
Date: Sun, 14 Dec 2025 19:01:08 +0800
From: kernel test robot <lkp@intel.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Ingo Molnar <mingo@kernel.org>
Subject: [mingo-tip:WIP.x86/cpu 15/15] arch/x86/include/asm/percpu.h:365:17:
 error: expected ':' or ')' before 'CC_SET'
Message-ID: <202512141817.HJMA5b5K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/cpu
head:   ff1735ccc470808033db2520554f2ca090a12393
commit: ff1735ccc470808033db2520554f2ca090a12393 [15/15] x86/percpu: Remove !CONFIG_X86_CX8 methods
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20251214/202512141817.HJMA5b5K-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141817.HJMA5b5K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141817.HJMA5b5K-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/slub.c:13:
   mm/slub.c: In function '__update_cpu_freelist_fast':
>> arch/x86/include/asm/percpu.h:365:17: error: expected ':' or ')' before 'CC_SET'
     365 |                 CC_SET(z)                                               \
         |                 ^~~~~~
   arch/x86/include/asm/percpu.h:378:57: note: in expansion of macro 'percpu_try_cmpxchg64_op'
     378 | #define this_cpu_try_cmpxchg64(pcp, ovalp, nval)        percpu_try_cmpxchg64_op(8, volatile, pcp, ovalp, nval)
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~
   mm/slab.h:31:41: note: in expansion of macro 'this_cpu_try_cmpxchg64'
      31 | #define this_cpu_try_cmpxchg_freelist   this_cpu_try_cmpxchg64
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c:4385:16: note: in expansion of macro 'this_cpu_try_cmpxchg_freelist'
    4385 |         return this_cpu_try_cmpxchg_freelist(s->cpu_slab->freelist_tid,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/percpu.h:359:18: warning: variable 'new__' set but not used [-Wunused-but-set-variable]
     359 |         } old__, new__;                                                 \
         |                  ^~~~~
   arch/x86/include/asm/percpu.h:378:57: note: in expansion of macro 'percpu_try_cmpxchg64_op'
     378 | #define this_cpu_try_cmpxchg64(pcp, ovalp, nval)        percpu_try_cmpxchg64_op(8, volatile, pcp, ovalp, nval)
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~
   mm/slab.h:31:41: note: in expansion of macro 'this_cpu_try_cmpxchg64'
      31 | #define this_cpu_try_cmpxchg_freelist   this_cpu_try_cmpxchg64
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c:4385:16: note: in expansion of macro 'this_cpu_try_cmpxchg_freelist'
    4385 |         return this_cpu_try_cmpxchg_freelist(s->cpu_slab->freelist_tid,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +365 arch/x86/include/asm/percpu.h

   349	
   350	#define percpu_try_cmpxchg64_op(size, qual, _var, _ovalp, _nval)	\
   351	({									\
   352		bool success;							\
   353		u64 *_oval = (u64 *)(_ovalp);					\
   354		union {								\
   355			u64 var;						\
   356			struct {						\
   357				u32 low, high;					\
   358			};							\
 > 359		} old__, new__;							\
   360										\
   361		old__.var = *_oval;						\
   362		new__.var = _nval;						\
   363										\
   364		asm qual ("cmpxchg8b " __percpu_arg([var])			\
 > 365			CC_SET(z)						\
   366			: CC_OUT(z) (success),					\
   367			  [var] "+m" (__my_cpu_var(_var)),			\
   368			  "+a" (old__.low), "+d" (old__.high)			\
   369			: "b" (new__.low), "c" (new__.high)			\
   370			: "memory");						\
   371		if (unlikely(!success))						\
   372			*_oval = old__.var;					\
   373										\
   374		likely(success);						\
   375	})
   376	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
