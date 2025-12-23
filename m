Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9495F313E0B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 00:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766450629; cv=none; b=L3+9/SDErVdincYTqie8wYGA9dGFliqYpsHCcRQALKdFwtclJgBmagV4Odxs2oAQ7Xa4luLJ+n5LwX2gEENFALbhDjpXoWd59U8dn5tzMaBXMjG4pvZFoNDFKzYYFQMdiFfN3HbSRFBPpi0YknDLgleCZqGXFnFADS5gIAlDkuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766450629; c=relaxed/simple;
	bh=h/JO8pyRjBrQRYjTNCd7Jx6oYi6XC6r0rfUFveqB7RY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lgsjSRzWYwN/Zd+uq3KJ+enT1iGi0gmT5YjbzMh9VICD/+RxwPje43VkRkBVto4i7lrec7FIfSLNBErNux5BM3hZ0o9oKxioW/TJ8gCX+B/AmwUSSoj2V49OYrYdnPIcqlyf64iBOsUdsj++cgKlE8zmuvFqR/JBjQLlYdEsu90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H2sBTQz4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H2sBTQz4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766450627; x=1797986627;
  h=date:from:to:cc:subject:message-id;
  bh=h/JO8pyRjBrQRYjTNCd7Jx6oYi6XC6r0rfUFveqB7RY=;
  b=H2sBTQz4MMQhQ0838WD28dYnp3lKFWFhEsllYwqqfYdLiP316sjKVVzN
   h14zqPn1lP3mDdGAZ7vE7u4HejKo3+9Nu6IQaNsEI4wIUS4hJGmQCl/UO
   ICKDz7ppjKZEWXjc/zm/gNKPWfn39CduwlJ2bjxAl8QoVzsdAOURteheC
   2mckYzpKL3XCMrcJdFTL4fsU14vRII28IAJWUwSn1pDNaHdgfH5lHuIAI
   teYikgJpD3xMzEW6XJflgGOb+3azwwMHX2v8S5MYBh7NU2QZCtZz2apjj
   Re2c+LEJHfS92RFqxLCaSH06CLn40oQepWGrVHcJ3joRe3uESSagK1VfB
   g==;
X-CSE-ConnectionGUID: jDQ3CvQeQ3+//xekXcrpdQ==
X-CSE-MsgGUID: 8E39SLqlSo67UDADggno8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68188335"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="68188335"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 16:43:46 -0800
X-CSE-ConnectionGUID: KMkV4zqETpOJj6fMdUtlSA==
X-CSE-MsgGUID: 25nEeXznSECxxRwD9wP5YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="200143449"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 22 Dec 2025 16:43:44 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXqV4-000000001GV-1qIf;
	Tue, 23 Dec 2025 00:43:42 +0000
Date: Tue, 23 Dec 2025 08:43:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3544/3544] lib/iov_iter.c:330:38: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202512230823.urp3AnL9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c098fa18c07cc52100a52db8fd0c2900461888c9
commit: 19e163fcb526efb8bf229887f399ddf4847ceecb [3544/3544] iov_iter, x86: Be consistent about the __user tag on copy_mc_to_user()
config: x86_64-randconfig-121-20251215 (https://download.01.org/0day-ci/archive/20251223/202512230823.urp3AnL9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230823.urp3AnL9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230823.urp3AnL9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/iov_iter.c:330:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void * @@
   lib/iov_iter.c:330:38: sparse:     expected void [noderef] __user *to
   lib/iov_iter.c:330:38: sparse:     got void *
   lib/iov_iter.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   lib/iov_iter.c: note: in included file:
   include/net/checksum.h:33:39: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   include/net/checksum.h:33:39: sparse:     expected restricted __wsum [usertype] sum
   include/net/checksum.h:33:39: sparse:     got unsigned int
   include/net/checksum.h:33:39: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   include/net/checksum.h:33:39: sparse:     expected restricted __wsum [usertype] sum
   include/net/checksum.h:33:39: sparse:     got unsigned int
   include/net/checksum.h:41:45: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   include/net/checksum.h:41:45: sparse:     expected restricted __wsum [usertype] sum
   include/net/checksum.h:41:45: sparse:     got unsigned int
   include/net/checksum.h:41:45: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   include/net/checksum.h:41:45: sparse:     expected restricted __wsum [usertype] sum
   include/net/checksum.h:41:45: sparse:     got unsigned int
   lib/iov_iter.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression

vim +330 lib/iov_iter.c

c35e02480014f7 mm/iov_iter.c  Matthew Wilcox 2014-08-01  324  
ec6347bb43395c lib/iov_iter.c Dan Williams   2020-10-05  325  #ifdef CONFIG_ARCH_HAS_COPY_MC
ec6347bb43395c lib/iov_iter.c Dan Williams   2020-10-05  326  static int copyout_mc(void __user *to, const void *from, size_t n)
8780356ef630aa lib/iov_iter.c Dan Williams   2018-05-03  327  {
96d4f267e40f95 lib/iov_iter.c Linus Torvalds 2019-01-03  328  	if (access_ok(to, n)) {
d0ef4c360f7ea3 lib/iov_iter.c Marco Elver    2020-01-21  329  		instrument_copy_to_user(to, from, n);
ec6347bb43395c lib/iov_iter.c Dan Williams   2020-10-05 @330  		n = copy_mc_to_user((__force void *) to, from, n);
8780356ef630aa lib/iov_iter.c Dan Williams   2018-05-03  331  	}
8780356ef630aa lib/iov_iter.c Dan Williams   2018-05-03  332  	return n;
8780356ef630aa lib/iov_iter.c Dan Williams   2018-05-03  333  }
8780356ef630aa lib/iov_iter.c Dan Williams   2018-05-03  334  

:::::: The code at line 330 was first introduced by commit
:::::: ec6347bb43395cb92126788a1a5b25302543f815 x86, powerpc: Rename memcpy_mcsafe() to copy_mc_to_{user, kernel}()

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
