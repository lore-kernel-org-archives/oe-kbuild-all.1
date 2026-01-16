Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE073594F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 06:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768544324; cv=none; b=HeHbEM4t1rd0n4K8mcyZfZdTWThHgA4800XQH9TKtDRqsCP1Fc5U/nsuTkC64kapr0m/cpAai7eLgJq8Vu8XWGLa/KO0yXrsmttcYYowYgiCqwcPxOpeE2wNgPO6dmYoGIifyHr0mFjWkjpJog4ec53FTuJTAG7V/BczUBS+ylg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768544324; c=relaxed/simple;
	bh=zxAtHCA19ldxZXGrZ0Khx9HXp1ZUxe67f+2z2tV0pvw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b3OML5Nv597CPzfxLjnAzyIE7Ap0138ld0+G8C2g1YsqY0sSzzEDsJACIzWRffoZcFTQYMHu2q1Dosc3fG+Mx0r6hYnSFM2PClg+9aM9mXHpJNiYeOdLb6jQFoLYZQvnrQvDf1X/4Yp5/m9WHpojhU5qvcRUuji3HyJs6HuJPyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L0QO3kU+; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L0QO3kU+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768544323; x=1800080323;
  h=date:from:to:cc:subject:message-id;
  bh=zxAtHCA19ldxZXGrZ0Khx9HXp1ZUxe67f+2z2tV0pvw=;
  b=L0QO3kU+xZE7Z+MuV44+sgoy+XY2ar1UkOuAsVFQBqV+9gE9XFC4Qfxy
   2doWZwsl6llu6r0/Jt9Cm6iU4Ehi5TJzAs/W4fR+4th01Roa1j/rMJt2i
   99HPVgpItgujJdOEyowJXetOwKdx1THkbmQC7a1pafIS3rDCsAHTr/8Yu
   2t6dnIafaotYj4o2MPHuxHYttw0ZnehyPqOnX0Kg4vh6wL0bDfTH3VLjd
   NP6d7lznnJC8btYsOdgdgaR/2WIfLpq5LfyQwRf8LvRKfkkqsIWYLv1bI
   SgJi7eQeX+gXIyjHcabHTD4Iv0OqGqo3FQwT2+Jz11oLp5IB7+I3gQhvh
   A==;
X-CSE-ConnectionGUID: 27X5pF7mT8Od61qChaEGvA==
X-CSE-MsgGUID: ExDwM+BXRIyyiFm57svSdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="87275610"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="87275610"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 22:18:43 -0800
X-CSE-ConnectionGUID: Mtyd+d0cQ3ydRS9oEjVmHg==
X-CSE-MsgGUID: ZWjsOmrCT9i+ipOz0Ov1fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="204953865"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Jan 2026 22:18:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgdAM-00000000KT2-3j7g;
	Fri, 16 Jan 2026 06:18:38 +0000
Date: Fri, 16 Jan 2026 14:18:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/4] kernel/rcu/update.c:52:1:
 error: use of undeclared identifier '__tracepoint_rcu_stall_warning'
Message-ID: <202601161449.8bb6iPEC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   a58a97026588e9128868c7778ca1ffacbb53c931
commit: 3750795f060bc2a41c082b911955dbe87e6f678d [0/4] ANDROID: rcu: allow hooks into rcu stall warning
config: x86_64-randconfig-003-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161449.8bb6iPEC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161449.8bb6iPEC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161449.8bb6iPEC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rcu/update.c:52:1: error: use of undeclared identifier '__tracepoint_rcu_stall_warning'
      52 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^
   include/linux/tracepoint.h:344:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     344 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:235:1: note: expanded from here
     235 | __tracepoint_rcu_stall_warning
         | ^
>> kernel/rcu/update.c:52:1: error: use of undeclared identifier '__traceiter_rcu_stall_warning'
   include/linux/tracepoint.h:345:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     345 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^
   <scratch space>:242:1: note: expanded from here
     242 | __traceiter_rcu_stall_warning
         | ^
>> kernel/rcu/update.c:52:1: error: use of undeclared identifier '__SCK__tp_func_rcu_stall_warning'
   include/linux/tracepoint.h:346:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     346 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^
   include/linux/static_call.h:217:20: note: expanded from macro 'EXPORT_STATIC_CALL_GPL'
     217 |         EXPORT_SYMBOL_GPL(STATIC_CALL_KEY(name));                       \
         |                           ^
   include/linux/static_call_types.h:12:32: note: expanded from macro 'STATIC_CALL_KEY'
      12 | #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
         |                                         ^
   include/linux/compiler_types.h:75:22: note: expanded from macro '__PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:74:23: note: expanded from macro '___PASTE'
      74 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:250:1: note: expanded from here
     250 | __SCK__tp_func_rcu_stall_warning
         | ^
>> kernel/rcu/update.c:52:1: error: use of undeclared identifier '__SCT__tp_func_rcu_stall_warning'
   include/linux/tracepoint.h:346:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     346 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^
   include/linux/static_call.h:218:20: note: expanded from macro 'EXPORT_STATIC_CALL_GPL'
     218 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
         |                           ^
   include/linux/static_call_types.h:18:34: note: expanded from macro 'STATIC_CALL_TRAMP'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^
   include/linux/compiler_types.h:75:22: note: expanded from macro '__PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:74:23: note: expanded from macro '___PASTE'
      74 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:5:1: note: expanded from here
       5 | __SCT__tp_func_rcu_stall_warning
         | ^
   4 errors generated.


vim +/__tracepoint_rcu_stall_warning +52 kernel/rcu/update.c

    51	
  > 52	EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
