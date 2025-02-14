Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837CE20DD66
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 10:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739529900; cv=none; b=VATvTY+/KKPqo+oSB4Iz4P0shE9OcwrpgDX3j5MplWl+GpF1fJmiFIVkpabq3qYM5BRAzJoxyMdxt/b1bfFOumYIzXuSEeqWlQwcr55UqEH/LRaDHL+Ad1bJyJFCzwoSU0ZjtJ75J01N8ZRUrGfnJQi0r2UATxN61aEItb31UsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739529900; c=relaxed/simple;
	bh=vLzusztKRmuxJJmPLKzZfaHO5vBk6sI1IXQuim24t8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k6YCK8njF4jmtteFGOyGUCUXNvEtYU8jTOx8cL0QXex2t+42HSIH5SvvELVBn72hK1t2yPFjuIUSIdvYS7oA3Rnpl4Dg+3BTibXQylvi+WRQCKsDLAFmx5H1LUX/oiHC44aYIHlBUhrdrkNZbkHmrGd+OnCldgTLXH1nVqJ6bJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i533Zm1N; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i533Zm1N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739529898; x=1771065898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vLzusztKRmuxJJmPLKzZfaHO5vBk6sI1IXQuim24t8E=;
  b=i533Zm1NrSDoxI0v5N/5IQNUSzKx7G10h72ha0dSGNeGMcFbDcDm87G5
   gZ+KD9IWNKHLXzFy3TpEM4YJHMY3i8eWNkhrER4JvuitetdoRGqofNH5w
   LT2bnZSTIvBPB7WKac2aaG1xHWSEDNcGhH1tn5RoIfdJBWsiQGtqlH9kW
   MSEnwJuclgfJmjsb2OE0mps9Nk4HwhKimXTVWtAOqyCQ9f+/wATb+0Pxq
   VJ9AxmSuwg/dfrp+0tPaw5SChQUem+Fm6ZuaU71/XvD6+BOKZ9m7Qn5l7
   Z9YFpEd8PW5CnLJjXvQIVvPyqVByLq4sE51Lu4NKAtGW8BDn5wXicWPjK
   Q==;
X-CSE-ConnectionGUID: xlAMjHidQySifMLqsVx1Jg==
X-CSE-MsgGUID: ENc0OK2PTreLGXy/TAB5/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="44201840"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="44201840"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 02:44:57 -0800
X-CSE-ConnectionGUID: pIvaDuEmSCaUMQZkDMgvgg==
X-CSE-MsgGUID: kt6vjokeTFe6YTyI5TvN+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="113165598"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Feb 2025 02:44:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1titBm-0019PL-1n;
	Fri, 14 Feb 2025 10:44:54 +0000
Date: Fri, 14 Feb 2025 18:44:46 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 18/26] include/linux/local_lock.h:59:7:
 error: call to undeclared function 'local_irq_enable'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202502141825.qOMUii3A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   9c8d14ce8aff2d38bf494f5d5436a302e3236842
commit: 895e91e6a76fc478ef13428a02587e5a424fc0be [18/26] locking/local_lock: Support Clang's capability analysis
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250214/202502141825.qOMUii3A-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502141825.qOMUii3A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502141825.qOMUii3A-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/test_capability-analysis.c:9:
>> include/linux/local_lock.h:59:7: error: call to undeclared function 'local_irq_enable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      59 |                     local_unlock_irq(_T->lock))
         |                     ^
   include/linux/local_lock.h:43:33: note: expanded from macro 'local_unlock_irq'
      43 | #define local_unlock_irq(lock)          __local_unlock_irq(lock)
         |                                         ^
   include/linux/local_lock_internal.h:111:3: note: expanded from macro '__local_unlock_irq'
     111 |                 local_irq_enable();                             \
         |                 ^
   In file included from lib/test_capability-analysis.c:9:
>> include/linux/local_lock.h:58:7: error: call to undeclared function 'local_irq_disable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      58 |                     local_lock_irq(_T->lock),
         |                     ^
   include/linux/local_lock.h:22:31: note: expanded from macro 'local_lock_irq'
      22 | #define local_lock_irq(lock)            __local_lock_irq(lock)
         |                                         ^
   include/linux/local_lock_internal.h:88:3: note: expanded from macro '__local_lock_irq'
      88 |                 local_irq_disable();                            \
         |                 ^
   In file included from lib/test_capability-analysis.c:9:
>> include/linux/local_lock.h:62:7: error: call to undeclared function 'local_irq_restore'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      62 |                     local_unlock_irqrestore(_T->lock, _T->flags),
         |                     ^
   include/linux/local_lock.h:52:2: note: expanded from macro 'local_unlock_irqrestore'
      52 |         __local_unlock_irqrestore(lock, flags)
         |         ^
   include/linux/local_lock_internal.h:118:3: note: expanded from macro '__local_unlock_irqrestore'
     118 |                 local_irq_restore(flags);                       \
         |                 ^
   In file included from lib/test_capability-analysis.c:9:
>> include/linux/local_lock.h:61:7: error: call to undeclared function 'local_irq_save'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      61 |                     local_lock_irqsave(_T->lock, _T->flags),
         |                     ^
   include/linux/local_lock.h:31:2: note: expanded from macro 'local_lock_irqsave'
      31 |         __local_lock_irqsave(lock, flags)
         |         ^
   include/linux/local_lock_internal.h:95:3: note: expanded from macro '__local_lock_irqsave'
      95 |                 local_irq_save(flags);                          \
         |                 ^
   4 errors generated.


vim +/local_irq_enable +59 include/linux/local_lock.h

    44	
    45	/**
    46	 * local_unlock_irqrestore - Release a per CPU local lock and restore
    47	 *			      interrupt flags
    48	 * @lock:	The lock variable
    49	 * @flags:      Interrupt flags to restore
    50	 */
    51	#define local_unlock_irqrestore(lock, flags)			\
    52		__local_unlock_irqrestore(lock, flags)
    53	
    54	DEFINE_LOCK_GUARD_1(local_lock, local_lock_t __percpu,
    55			    local_lock(_T->lock),
    56			    local_unlock(_T->lock))
    57	DEFINE_LOCK_GUARD_1(local_lock_irq, local_lock_t __percpu,
  > 58			    local_lock_irq(_T->lock),
  > 59			    local_unlock_irq(_T->lock))
    60	DEFINE_LOCK_GUARD_1(local_lock_irqsave, local_lock_t __percpu,
  > 61			    local_lock_irqsave(_T->lock, _T->flags),
  > 62			    local_unlock_irqrestore(_T->lock, _T->flags),
    63			    unsigned long flags)
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
