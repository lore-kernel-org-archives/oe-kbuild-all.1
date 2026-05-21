Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E493737F8BA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 12:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779366684; cv=none; b=d6UukgZiG4w7gwo+CygZ/nnadoAgjwEu/Ips0JhjOWtTzSjIebaVMmxTkVF9WHY+FPB20oJFlftSxz1D75R8K1X9gu4A3zMsE0hT49FfS4S+/NOAcb2/LsxgszFijjiwHFT0yYgfM7XoWmfF8pX4GXyJ13lb2lF3PcQxYLd2zcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779366684; c=relaxed/simple;
	bh=b+304RJvoRC3Gg++pcuwSLvUwUwpAG2sYul0jOZd/r8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ou7anbLj2AxZLZ8KFE+mNUOGaKkGVcp57eH8U6f/Wzl9IdV69T/QBp7gi+HYqZtpmaUlQ2HQ1AKx6han6xKRSBMfZB5T6N8J23Kr+DVpx8/pYM4CsRym8Fnpw1Mth8ac415AwPU9qEdg7C46HsUQ5CKe0m0xtN7Jwy1srCo6Qz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ISV1O+G2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISV1O+G2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779366682; x=1810902682;
  h=date:from:to:cc:subject:message-id;
  bh=b+304RJvoRC3Gg++pcuwSLvUwUwpAG2sYul0jOZd/r8=;
  b=ISV1O+G23u/mXx2vL3Cr+bB2PaSwhV1l1zo4dueN0w3YBxOBFd7+zA2S
   H3JSP6374f1s8tl+cZFFWJAjWwWDh3adXYviwAZuhbs2x+wm5ohPY4VFF
   i1r0kxtSmrxYtQo8s2At8Y89bHOX/QjRsoSQA0eAlP4g5Gw24vspEoFfJ
   LR3qoJK7KRgAVBk9jR0Vv5fCBErZS4Rp0cO4f8Jp+YubsdDHGGeDSinDM
   nIM6hpel+IZBW7vRfz2wvO4m/+eUtxUgQ6P1/gcKuBpSp79+dBgoEzh6w
   ZCYTAJ9H6tUpjv6df9ZtyD1h7kUfJb2XJCsAJs3u27qxaTbSq4czDvezd
   Q==;
X-CSE-ConnectionGUID: VWdGTkKfTwam6uf2ypZz0g==
X-CSE-MsgGUID: 9fjkGsMwSmefSF3Gqo0e0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="83902683"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="83902683"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 05:31:21 -0700
X-CSE-ConnectionGUID: 0ZSocfp+Rgi4YdHzmbKneA==
X-CSE-MsgGUID: FG2oe3gjTTSGhVt1wAeuCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="278627543"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 May 2026 05:31:21 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ2YX-000000000Gv-2rg3;
	Thu, 21 May 2026 12:31:17 +0000
Date: Thu, 21 May 2026 20:31:09 +0800
From: kernel test robot <lkp@intel.com>
To: Martin Kaiser <martin.kaiser@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 1010/1130]
 kernel/trace/trace_syscalls.c:527:52: warning: passing argument 1 of '__c_pa'
 makes pointer from integer without a cast
Message-ID: <202605212047.8VIOY137-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: ee9b4c9535db95a122f1d56e03c2a4e23396a051 [1010/1130] trace: fix syscall address cast
config: sh-randconfig-002-20260521 (https://download.01.org/0day-ci/archive/20260521/202605212047.8VIOY137-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605212047.8VIOY137-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605212047.8VIOY137-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/trace_syscalls.c: In function 'arch_syscall_addr':
>> kernel/trace/trace_syscalls.c:527:52: warning: passing argument 1 of '__c_pa' makes pointer from integer without a cast [-Wint-conversion]
     527 |         return (unsigned long)__c_pa(sys_call_table[nr]);
         |                                      ~~~~~~~~~~~~~~^~~~
         |                                                    |
         |                                                    long unsigned int
   In file included from include/linux/user_ptr.h:5,
                    from include/linux/err.h:22,
                    from include/linux/cleanup.h:6,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/tracepoint.h:15,
                    from include/trace/syscall.h:5,
                    from kernel/trace/trace_syscalls.c:2:
   include/linux/cheri.h:241:29: note: expected 'const volatile void *' but argument is of type 'long unsigned int'
     241 | __c_pa(const volatile void *ptr)
         |        ~~~~~~~~~~~~~~~~~~~~~^~~


vim +/__c_pa +527 kernel/trace/trace_syscalls.c

   523	
   524	#ifndef ARCH_HAS_SYSCALL_ADDR
   525	unsigned long __init arch_syscall_addr(int nr)
   526	{
 > 527		return (unsigned long)__c_pa(sys_call_table[nr]);
   528	}
   529	#endif
   530	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
