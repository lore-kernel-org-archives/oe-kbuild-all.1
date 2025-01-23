Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A9E2F3B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 06:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737613685; cv=none; b=oL4uDOTjpdVHrCLYa2sjiaOT8JlN6frUfMf112SdDrzC10/WfMbISaqz1vpmQbvCR6nn8zONNzbwTseyEUuphchmCJH8M9Tz+G39b4bVQMHjA7xP4hnNQ194D8iJ+jRSrApZCPicjQ3av/fmUMEHbTcgYwkdNq07dvYR1JDXNYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737613685; c=relaxed/simple;
	bh=P6vUj7YlY7aDA67lfXOYCK3f6t2DrIPIkdKemJ48pI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eNwOxAupEAh5rh9IrJUNcVHMLU/vt3d+IrQqQyreZb2ZBlnEDFmoAQULS3gPF4ch5ZkJN3TNPxYCRBTs20aXHYxXtn4PckrUWTZ9TIltd6e6tmcwCLlNLTUWJoKkAWmIl6azAJQEhLkM14qPUGQ3GZEISuzQ81vpGPdiWJRdUB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jz150Qe2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jz150Qe2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737613684; x=1769149684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P6vUj7YlY7aDA67lfXOYCK3f6t2DrIPIkdKemJ48pI8=;
  b=Jz150Qe23Iam8M/QCWuAXB33v5gdv3NbD1cGbgLUzX6gLyzAyYmTCWkn
   5ZuDCHhlRcAzF6L/HBWcj4Y9YVmqyt5gX30GyN++dSAT7cRT+BYWY4yxT
   AzGFr/RzjNAF4krahNF5lWPBcopXEielZnRFIRGinWlTUzFySY4hdYANO
   HUQS0JpSPOLGFOvHHwYMCtsjaFk5ShTU3XYF9t4mpcJ+H/0cPtOjYwp4f
   xm3B77tt2Fa9IJNkFQtjk/N2jTYhlKwBM7GeDMtFv5G2IPsaOAtrzvHax
   SodW4E2zUZrsg/WYsgkfxmJRFXzwEqdJVOlfOdblDdQjx1jIVAtYcj8vG
   A==;
X-CSE-ConnectionGUID: rBHbVTAqTqmKutF1S1kO7g==
X-CSE-MsgGUID: yDXY2VvFSBG0m6ixfdG7eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="38014761"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="38014761"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 22:28:04 -0800
X-CSE-ConnectionGUID: ffxDZsgOSsmB48BMvDj8cg==
X-CSE-MsgGUID: s+aCTyZbS5KRnm4eF9ddrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="107185344"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Jan 2025 22:28:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taqh6-000apf-1H;
	Thu, 23 Jan 2025 06:28:00 +0000
Date: Thu, 23 Jan 2025 14:27:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 305/305]
 arch/arm/include/asm/cmpxchg.h:112:undefined reference to `__bad_xchg'
Message-ID: <202501231412.C1ohkh2n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   9f73221be57f43a312dec7cdbd8ae087006f8676
commit: 9f73221be57f43a312dec7cdbd8ae087006f8676 [305/305] sched_wakeup_backtrace debugfs
config: arm-randconfig-004-20250123 (https://download.01.org/0day-ci/archive/20250123/202501231412.C1ohkh2n-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501231412.C1ohkh2n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501231412.C1ohkh2n-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/sched/core.o: in function `try_to_wake_up':
>> arch/arm/include/asm/cmpxchg.h:112:(.text+0x1560): undefined reference to `__bad_xchg'
   arm-linux-gnueabi-ld: kernel/sched/timestats_bt.o: in function `sched_wakeup_backtrace_init':
   kernel/sched/timestats_bt.c:198:(.text+0xc0): undefined reference to `debugfs_sched'
   arm-linux-gnueabi-ld: kernel/sched/timestats_bt.o: in function `sched_wakeup_show':
   kernel/sched/timestats_bt.c:165:(.text+0x13a): undefined reference to `time_stats_to_seq_buf'
   arm-linux-gnueabi-ld: kernel/sched/timestats_bt.o: in function `sched_wakeup_backtrace':
   kernel/sched/timestats_bt.c:91:(.text+0x638): undefined reference to `__time_stats_update'


vim +112 arch/arm/include/asm/cmpxchg.h

9f97da78bf01820 David Howells    2012-03-28   40  
c32ffce0f66e5d1 Will Deacon      2014-02-21   41  	prefetchw((const void *)ptr);
9f97da78bf01820 David Howells    2012-03-28   42  
9f97da78bf01820 David Howells    2012-03-28   43  	switch (size) {
9f97da78bf01820 David Howells    2012-03-28   44  #if __LINUX_ARM_ARCH__ >= 6
e8973a889e69cb8 Sarbojit Ganguly 2015-10-09   45  #ifndef CONFIG_CPU_V6 /* MIN ARCH >= V6K */
9f97da78bf01820 David Howells    2012-03-28   46  	case 1:
9f97da78bf01820 David Howells    2012-03-28   47  		asm volatile("@	__xchg1\n"
9f97da78bf01820 David Howells    2012-03-28   48  		"1:	ldrexb	%0, [%3]\n"
9f97da78bf01820 David Howells    2012-03-28   49  		"	strexb	%1, %2, [%3]\n"
9f97da78bf01820 David Howells    2012-03-28   50  		"	teq	%1, #0\n"
9f97da78bf01820 David Howells    2012-03-28   51  		"	bne	1b"
9f97da78bf01820 David Howells    2012-03-28   52  			: "=&r" (ret), "=&r" (tmp)
9f97da78bf01820 David Howells    2012-03-28   53  			: "r" (x), "r" (ptr)
9f97da78bf01820 David Howells    2012-03-28   54  			: "memory", "cc");
9f97da78bf01820 David Howells    2012-03-28   55  		break;
e8973a889e69cb8 Sarbojit Ganguly 2015-10-09   56  	case 2:
e8973a889e69cb8 Sarbojit Ganguly 2015-10-09   57  		asm volatile("@	__xchg2\n"
e8973a889e69cb8 Sarbojit Ganguly 2015-10-09   58  		"1:	ldrexh	%0, [%3]\n"
e8973a889e69cb8 Sarbojit Ganguly 2015-10-09   59  		"	strexh	%1, %2, [%3]\n"
e8973a889e69cb8 Sarbojit Ganguly 2015-10-09   60  		"	teq	%1, #0\n"
e8973a889e69cb8 Sarbojit Ganguly 2015-10-09   61  		"	bne	1b"
e8973a889e69cb8 Sarbojit Ganguly 2015-10-09   62  			: "=&r" (ret), "=&r" (tmp)
e8973a889e69cb8 Sarbojit Ganguly 2015-10-09   63  			: "r" (x), "r" (ptr)
e8973a889e69cb8 Sarbojit Ganguly 2015-10-09   64  			: "memory", "cc");
e8973a889e69cb8 Sarbojit Ganguly 2015-10-09   65  		break;
e8973a889e69cb8 Sarbojit Ganguly 2015-10-09   66  #endif
9f97da78bf01820 David Howells    2012-03-28   67  	case 4:
9f97da78bf01820 David Howells    2012-03-28   68  		asm volatile("@	__xchg4\n"
9f97da78bf01820 David Howells    2012-03-28   69  		"1:	ldrex	%0, [%3]\n"
9f97da78bf01820 David Howells    2012-03-28   70  		"	strex	%1, %2, [%3]\n"
9f97da78bf01820 David Howells    2012-03-28   71  		"	teq	%1, #0\n"
9f97da78bf01820 David Howells    2012-03-28   72  		"	bne	1b"
9f97da78bf01820 David Howells    2012-03-28   73  			: "=&r" (ret), "=&r" (tmp)
9f97da78bf01820 David Howells    2012-03-28   74  			: "r" (x), "r" (ptr)
9f97da78bf01820 David Howells    2012-03-28   75  			: "memory", "cc");
9f97da78bf01820 David Howells    2012-03-28   76  		break;
9f97da78bf01820 David Howells    2012-03-28   77  #elif defined(swp_is_buggy)
9f97da78bf01820 David Howells    2012-03-28   78  #ifdef CONFIG_SMP
9f97da78bf01820 David Howells    2012-03-28   79  #error SMP is not supported on this platform
9f97da78bf01820 David Howells    2012-03-28   80  #endif
9f97da78bf01820 David Howells    2012-03-28   81  	case 1:
9f97da78bf01820 David Howells    2012-03-28   82  		raw_local_irq_save(flags);
9f97da78bf01820 David Howells    2012-03-28   83  		ret = *(volatile unsigned char *)ptr;
9f97da78bf01820 David Howells    2012-03-28   84  		*(volatile unsigned char *)ptr = x;
9f97da78bf01820 David Howells    2012-03-28   85  		raw_local_irq_restore(flags);
9f97da78bf01820 David Howells    2012-03-28   86  		break;
9f97da78bf01820 David Howells    2012-03-28   87  
9f97da78bf01820 David Howells    2012-03-28   88  	case 4:
9f97da78bf01820 David Howells    2012-03-28   89  		raw_local_irq_save(flags);
9f97da78bf01820 David Howells    2012-03-28   90  		ret = *(volatile unsigned long *)ptr;
9f97da78bf01820 David Howells    2012-03-28   91  		*(volatile unsigned long *)ptr = x;
9f97da78bf01820 David Howells    2012-03-28   92  		raw_local_irq_restore(flags);
9f97da78bf01820 David Howells    2012-03-28   93  		break;
9f97da78bf01820 David Howells    2012-03-28   94  #else
9f97da78bf01820 David Howells    2012-03-28   95  	case 1:
9f97da78bf01820 David Howells    2012-03-28   96  		asm volatile("@	__xchg1\n"
9f97da78bf01820 David Howells    2012-03-28   97  		"	swpb	%0, %1, [%2]"
9f97da78bf01820 David Howells    2012-03-28   98  			: "=&r" (ret)
9f97da78bf01820 David Howells    2012-03-28   99  			: "r" (x), "r" (ptr)
9f97da78bf01820 David Howells    2012-03-28  100  			: "memory", "cc");
9f97da78bf01820 David Howells    2012-03-28  101  		break;
9f97da78bf01820 David Howells    2012-03-28  102  	case 4:
9f97da78bf01820 David Howells    2012-03-28  103  		asm volatile("@	__xchg4\n"
9f97da78bf01820 David Howells    2012-03-28  104  		"	swp	%0, %1, [%2]"
9f97da78bf01820 David Howells    2012-03-28  105  			: "=&r" (ret)
9f97da78bf01820 David Howells    2012-03-28  106  			: "r" (x), "r" (ptr)
9f97da78bf01820 David Howells    2012-03-28  107  			: "memory", "cc");
9f97da78bf01820 David Howells    2012-03-28  108  		break;
9f97da78bf01820 David Howells    2012-03-28  109  #endif
9f97da78bf01820 David Howells    2012-03-28  110  	default:
31cd08c3a1db4b3 Russell King     2015-05-19  111  		/* Cause a link-time error, the xchg() size is not supported */
9f97da78bf01820 David Howells    2012-03-28 @112  		__bad_xchg(ptr, size), ret = 0;
9f97da78bf01820 David Howells    2012-03-28  113  		break;
9f97da78bf01820 David Howells    2012-03-28  114  	}
9f97da78bf01820 David Howells    2012-03-28  115  
9f97da78bf01820 David Howells    2012-03-28  116  	return ret;
9f97da78bf01820 David Howells    2012-03-28  117  }
9f97da78bf01820 David Howells    2012-03-28  118  

:::::: The code at line 112 was first introduced by commit
:::::: 9f97da78bf018206fb623cd351d454af2f105fe0 Disintegrate asm/system.h for ARM

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
