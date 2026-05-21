Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ACD355F35
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 17:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779384971; cv=none; b=fxUNfkZCkVNLSxsK0FWXjJW4mKBeSMvdBtoER8nCGo+IoIeXFIpePvI38WDa/eCIhcAWJQKwKIP4vKf1LQAFFuYPe1e+lBy2Ymgm+KN9+ta6wEp/0C7jYbe2LXKT8D0uB6eoKXhdDE4Lj3Fg0dJ0LcXy1sfqR+UMVwbZTSlNX1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779384971; c=relaxed/simple;
	bh=HkhuGIwViYQFNUgLUWL7p7655VoOWsgKCdwanOE7HPk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZXpJijCWk+hHc2D5AskfxQzXC2Udsqh1KY/giijfkT7zF0NgAyYFBgDLsB+cWj9qK5OoF+jthY7VWDCBu7XQXl/ICp+zxnKIapRLylCVvizkd74DepLXaS1ZQjlLVXdKpJR5HEHz1CCdHh/td70JJ5JzK/MphlhKs4HxhTy1aR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZN+UfSij; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZN+UfSij"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779384970; x=1810920970;
  h=date:from:to:cc:subject:message-id;
  bh=HkhuGIwViYQFNUgLUWL7p7655VoOWsgKCdwanOE7HPk=;
  b=ZN+UfSijDEOwVR1G+kjZE4PKlE940pBOLbVRJ1dX87LMgmokBIgqhQGX
   ltfgv3XF0rxDfIiKuDLhcRBGYxZDxGBf7l+V9o4O8M8AblBK2CAnq29Cn
   L6Mhywl+8/6X4THj4ukPRCSVdvGwcOkNGXXafOydGDa3n02c9qEtU1yc6
   pYaKZjuFvm72N9yMqNEn2ciH9maQ8PjHeZ55x83OOXFTdChleU+bAWC2I
   OSuAn6ZtU3E07cHHeRBz9zv9cJNTc1RHRxPrhURwKy4iP1Vlzoc0w2PrU
   4pfGgzPiX2tn0wDbvyKxC9vjFtQNQQuaRoEqtulv5T9Y5v2iTiCmeYToS
   w==;
X-CSE-ConnectionGUID: DbKy8pycSym/NJTEsMtp9g==
X-CSE-MsgGUID: Yl6tetYyT9WD3s9LENe5IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80367226"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="80367226"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 10:36:09 -0700
X-CSE-ConnectionGUID: GgBmn+nATxakfaVdYbTJzw==
X-CSE-MsgGUID: OsV5JhxISQmTs2BS1NRhbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="278693580"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 May 2026 10:36:08 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ7JV-000000000uH-28yB;
	Thu, 21 May 2026 17:36:05 +0000
Date: Fri, 22 May 2026 01:35:53 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 126/1130]
 fs/select.c:783:44: error: passing argument 1 of '__get_user_ptr_fn' from
 incompatible pointer type
Message-ID: <202605220144.KSF3718G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 1ab05c9b1f5b7d7f615c289b441e2bf963123a0e [126/1130] [CHERRY-PICK] fs/select: Use get_user_ptr for PCuABI support
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260522/202605220144.KSF3718G-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605220144.KSF3718G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605220144.KSF3718G-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:34,
                    from include/linux/compat.h:17,
                    from fs/select.c:18:
   include/linux/uaccess.h:726:9: warning: 'get_user_ptr' redefined
     726 | #define get_user_ptr(x,y) __get_user(x,y)
         |         ^~~~~~~~~~~~
   In file included from arch/csky/include/asm/uaccess.h:201,
                    from include/linux/uaccess.h:12:
   include/asm-generic/uaccess.h:259:9: note: this is the location of the previous definition
     259 | #define get_user_ptr(x, ptr)                                    \
         |         ^~~~~~~~~~~~
   include/linux/uaccess.h:727:9: warning: 'put_user_ptr' redefined
     727 | #define put_user_ptr(x,y) __put_user(x,y)
         |         ^~~~~~~~~~~~
   include/asm-generic/uaccess.h:218:9: note: this is the location of the previous definition
     218 | #define put_user_ptr(x, ptr)                                    \
         |         ^~~~~~~~~~~~
   In file included from include/asm-generic/div64.h:27,
                    from ./arch/csky/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/compat.h:10:
   fs/select.c: In function 'get_sigset_argpack':
>> fs/select.c:783:44: error: passing argument 1 of '__get_user_ptr_fn' from incompatible pointer type [-Wincompatible-pointer-types]
     783 |                 unsafe_get_user_ptr(to->p, &from->p, Efault);
         |                                            ^~~~~~~~
         |                                            |
         |                                            sigset_t **
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/uaccess.h:703:36: note: in expansion of macro 'unsafe_op_wrap'
     703 | #define unsafe_get_user_ptr(x,p,e) unsafe_op_wrap(__get_user_ptr(x,p),e)
         |                                    ^~~~~~~~~~~~~~
   include/asm-generic/uaccess.h:254:20: note: in expansion of macro '__get_user_ptr_fn'
     254 |         __gu_err = __get_user_ptr_fn(ptr, &__x);                \
         |                    ^~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:703:51: note: in expansion of macro '__get_user_ptr'
     703 | #define unsafe_get_user_ptr(x,p,e) unsafe_op_wrap(__get_user_ptr(x,p),e)
         |                                                   ^~~~~~~~~~~~~~
   fs/select.c:783:17: note: in expansion of macro 'unsafe_get_user_ptr'
     783 |                 unsafe_get_user_ptr(to->p, &from->p, Efault);
         |                 ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/uaccess.h:279:47: note: expected 'const void **' but argument is of type 'sigset_t **'
     279 | __get_user_ptr_fn(const void __user * __user *ptr,
         |                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~


vim +/__get_user_ptr_fn +783 fs/select.c

   773	
   774	static inline int get_sigset_argpack(struct sigset_argpack *to,
   775					     struct sigset_argpack __user *from)
   776	{
   777		// the path is hot enough for overhead of copy_from_user() to matter
   778		if (from) {
   779			if (can_do_masked_user_access())
   780				from = masked_user_access_begin(from);
   781			else if (!user_read_access_begin(from, sizeof(*from)))
   782				return -EFAULT;
 > 783			unsafe_get_user_ptr(to->p, &from->p, Efault);
   784			unsafe_get_user(to->size, &from->size, Efault);
   785			user_read_access_end();
   786		}
   787		return 0;
   788	Efault:
   789		user_read_access_end();
   790		return -EFAULT;
   791	}
   792	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
