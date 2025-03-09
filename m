Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835001DE2C4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 16:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741538569; cv=none; b=XNkf6oljtFwhot54gSUfVQMlEmi8ISEzqcbT1kMm2pLZZQE1qFQkaCN/2wae1u0MaVrBVTeNIaKImMIKKWPjuSIVfCp3pLYsaDeP4w75hReQQHbUg5xQovIg2D//9HieJjWSwDMXGJAg6rDbYYIOvYMbYCItwcCPj0aPINXgMww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741538569; c=relaxed/simple;
	bh=0nEmPlK6jiQWI4I84WHs2q0Kgrh3Ab6Ok2ykJPapJT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VYFUm5wnzrnckNWHeQeDFFYo6S9EnRFAL+0d+3Hv5I97lYImr/617TTcJt/cbPLVs3NKntJo15SIcAv0lAOMsZrh4qCNG9tERqVxby99YMNDEk1ebthiKL6tZ2C5OvDecvN+pQRBv893Ik+YXPXnng1VvWJTGiERgYC1m4TocmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cGJ3i/OB; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cGJ3i/OB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741538567; x=1773074567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0nEmPlK6jiQWI4I84WHs2q0Kgrh3Ab6Ok2ykJPapJT4=;
  b=cGJ3i/OBcmr+7BQgoOewI3ZYUKzK+B885jdftrv2nYWhe2LJmXlKm6+E
   JMJdi695ddrWiB+G6pvTuNseqHqHuINSGg0o7NdJ0O3/RiZSi6eubjZye
   JPHoXbzJb9lUmQZHOmX3IXt/pEf6cgCsVv0J9Ev6lXJNldN2r48Qiof/k
   FENXxYnWcpGfAToFC+vostkjLOnbSXxijECoc3+TnMwfvrC2Wszh3otIL
   vuvnMJRoGxcm54CEMVEQE3mIyBf023Rc52+pbcp/hNKeaDceqQEicBIi4
   LrM5Yz/BtWEjozO6JkytHIdz9o06ovGDHDJwPVuYX6kfV0Wo6KRL46dyt
   A==;
X-CSE-ConnectionGUID: owEpyFr7TwSMDwY//sf4mw==
X-CSE-MsgGUID: VPjhuztCSv6Qo/iwKtiOig==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="53173946"
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="53173946"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 09:42:47 -0700
X-CSE-ConnectionGUID: eMqZK7ceQ7+AwnAOJWMrBw==
X-CSE-MsgGUID: 3hqnu5u7QVaWWhZmIYMXwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="119630631"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 09 Mar 2025 09:42:46 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trJjf-0003Ie-35;
	Sun, 09 Mar 2025 16:42:43 +0000
Date: Mon, 10 Mar 2025 00:41:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:latency_debug 82/85]
 arch/arm/include/asm/cmpxchg.h:112:(.text.try_to_wake_up+0x320): undefined
 reference to `__bad_xchg'
Message-ID: <202503100001.n6Zd1zhX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs latency_debug
head:   cca62acccd9672466b5ac130434dff2445c0a082
commit: 160f8bf55396c94122b638bc2bbf4859b5e1bad8 [82/85] trace_sched_wakeup_backtrace
config: arm-randconfig-002-20250309 (https://download.01.org/0day-ci/archive/20250310/202503100001.n6Zd1zhX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503100001.n6Zd1zhX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503100001.n6Zd1zhX-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/sched/core.o: in function `__arch_xchg':
>> arch/arm/include/asm/cmpxchg.h:112:(.text.try_to_wake_up+0x320): undefined reference to `__bad_xchg'


vim +112 arch/arm/include/asm/cmpxchg.h

9f97da78bf0182 David Howells    2012-03-28   40  
c32ffce0f66e5d Will Deacon      2014-02-21   41  	prefetchw((const void *)ptr);
9f97da78bf0182 David Howells    2012-03-28   42  
9f97da78bf0182 David Howells    2012-03-28   43  	switch (size) {
9f97da78bf0182 David Howells    2012-03-28   44  #if __LINUX_ARM_ARCH__ >= 6
e8973a889e69cb Sarbojit Ganguly 2015-10-09   45  #ifndef CONFIG_CPU_V6 /* MIN ARCH >= V6K */
9f97da78bf0182 David Howells    2012-03-28   46  	case 1:
9f97da78bf0182 David Howells    2012-03-28   47  		asm volatile("@	__xchg1\n"
9f97da78bf0182 David Howells    2012-03-28   48  		"1:	ldrexb	%0, [%3]\n"
9f97da78bf0182 David Howells    2012-03-28   49  		"	strexb	%1, %2, [%3]\n"
9f97da78bf0182 David Howells    2012-03-28   50  		"	teq	%1, #0\n"
9f97da78bf0182 David Howells    2012-03-28   51  		"	bne	1b"
9f97da78bf0182 David Howells    2012-03-28   52  			: "=&r" (ret), "=&r" (tmp)
9f97da78bf0182 David Howells    2012-03-28   53  			: "r" (x), "r" (ptr)
9f97da78bf0182 David Howells    2012-03-28   54  			: "memory", "cc");
9f97da78bf0182 David Howells    2012-03-28   55  		break;
e8973a889e69cb Sarbojit Ganguly 2015-10-09   56  	case 2:
e8973a889e69cb Sarbojit Ganguly 2015-10-09   57  		asm volatile("@	__xchg2\n"
e8973a889e69cb Sarbojit Ganguly 2015-10-09   58  		"1:	ldrexh	%0, [%3]\n"
e8973a889e69cb Sarbojit Ganguly 2015-10-09   59  		"	strexh	%1, %2, [%3]\n"
e8973a889e69cb Sarbojit Ganguly 2015-10-09   60  		"	teq	%1, #0\n"
e8973a889e69cb Sarbojit Ganguly 2015-10-09   61  		"	bne	1b"
e8973a889e69cb Sarbojit Ganguly 2015-10-09   62  			: "=&r" (ret), "=&r" (tmp)
e8973a889e69cb Sarbojit Ganguly 2015-10-09   63  			: "r" (x), "r" (ptr)
e8973a889e69cb Sarbojit Ganguly 2015-10-09   64  			: "memory", "cc");
e8973a889e69cb Sarbojit Ganguly 2015-10-09   65  		break;
e8973a889e69cb Sarbojit Ganguly 2015-10-09   66  #endif
9f97da78bf0182 David Howells    2012-03-28   67  	case 4:
9f97da78bf0182 David Howells    2012-03-28   68  		asm volatile("@	__xchg4\n"
9f97da78bf0182 David Howells    2012-03-28   69  		"1:	ldrex	%0, [%3]\n"
9f97da78bf0182 David Howells    2012-03-28   70  		"	strex	%1, %2, [%3]\n"
9f97da78bf0182 David Howells    2012-03-28   71  		"	teq	%1, #0\n"
9f97da78bf0182 David Howells    2012-03-28   72  		"	bne	1b"
9f97da78bf0182 David Howells    2012-03-28   73  			: "=&r" (ret), "=&r" (tmp)
9f97da78bf0182 David Howells    2012-03-28   74  			: "r" (x), "r" (ptr)
9f97da78bf0182 David Howells    2012-03-28   75  			: "memory", "cc");
9f97da78bf0182 David Howells    2012-03-28   76  		break;
9f97da78bf0182 David Howells    2012-03-28   77  #elif defined(swp_is_buggy)
9f97da78bf0182 David Howells    2012-03-28   78  #ifdef CONFIG_SMP
9f97da78bf0182 David Howells    2012-03-28   79  #error SMP is not supported on this platform
9f97da78bf0182 David Howells    2012-03-28   80  #endif
9f97da78bf0182 David Howells    2012-03-28   81  	case 1:
9f97da78bf0182 David Howells    2012-03-28   82  		raw_local_irq_save(flags);
9f97da78bf0182 David Howells    2012-03-28   83  		ret = *(volatile unsigned char *)ptr;
9f97da78bf0182 David Howells    2012-03-28   84  		*(volatile unsigned char *)ptr = x;
9f97da78bf0182 David Howells    2012-03-28   85  		raw_local_irq_restore(flags);
9f97da78bf0182 David Howells    2012-03-28   86  		break;
9f97da78bf0182 David Howells    2012-03-28   87  
9f97da78bf0182 David Howells    2012-03-28   88  	case 4:
9f97da78bf0182 David Howells    2012-03-28   89  		raw_local_irq_save(flags);
9f97da78bf0182 David Howells    2012-03-28   90  		ret = *(volatile unsigned long *)ptr;
9f97da78bf0182 David Howells    2012-03-28   91  		*(volatile unsigned long *)ptr = x;
9f97da78bf0182 David Howells    2012-03-28   92  		raw_local_irq_restore(flags);
9f97da78bf0182 David Howells    2012-03-28   93  		break;
9f97da78bf0182 David Howells    2012-03-28   94  #else
9f97da78bf0182 David Howells    2012-03-28   95  	case 1:
9f97da78bf0182 David Howells    2012-03-28   96  		asm volatile("@	__xchg1\n"
9f97da78bf0182 David Howells    2012-03-28   97  		"	swpb	%0, %1, [%2]"
9f97da78bf0182 David Howells    2012-03-28   98  			: "=&r" (ret)
9f97da78bf0182 David Howells    2012-03-28   99  			: "r" (x), "r" (ptr)
9f97da78bf0182 David Howells    2012-03-28  100  			: "memory", "cc");
9f97da78bf0182 David Howells    2012-03-28  101  		break;
9f97da78bf0182 David Howells    2012-03-28  102  	case 4:
9f97da78bf0182 David Howells    2012-03-28  103  		asm volatile("@	__xchg4\n"
9f97da78bf0182 David Howells    2012-03-28  104  		"	swp	%0, %1, [%2]"
9f97da78bf0182 David Howells    2012-03-28  105  			: "=&r" (ret)
9f97da78bf0182 David Howells    2012-03-28  106  			: "r" (x), "r" (ptr)
9f97da78bf0182 David Howells    2012-03-28  107  			: "memory", "cc");
9f97da78bf0182 David Howells    2012-03-28  108  		break;
9f97da78bf0182 David Howells    2012-03-28  109  #endif
9f97da78bf0182 David Howells    2012-03-28  110  	default:
31cd08c3a1db4b Russell King     2015-05-19  111  		/* Cause a link-time error, the xchg() size is not supported */
9f97da78bf0182 David Howells    2012-03-28 @112  		__bad_xchg(ptr, size), ret = 0;
9f97da78bf0182 David Howells    2012-03-28  113  		break;
9f97da78bf0182 David Howells    2012-03-28  114  	}
9f97da78bf0182 David Howells    2012-03-28  115  
9f97da78bf0182 David Howells    2012-03-28  116  	return ret;
9f97da78bf0182 David Howells    2012-03-28  117  }
9f97da78bf0182 David Howells    2012-03-28  118  

:::::: The code at line 112 was first introduced by commit
:::::: 9f97da78bf018206fb623cd351d454af2f105fe0 Disintegrate asm/system.h for ARM

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
