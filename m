Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755951B4257
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 07:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766301664; cv=none; b=IQwk4lnQI0RmITcidIWxYzYhAn4pn48p85qmQ3d7P8e9w/7vLh3rnnOOV2zs+zFqtSWpyx5La9wRI3Sbl1zuZvLk2jvVUWeDotH26QqiNPlCwXKnIyRSfZ3NDhgIGoZUh7M2jw8a9saBSUXNpGEeVi+i0VldeyUN8Z4j6D5+7bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766301664; c=relaxed/simple;
	bh=gReSOliRnoIq/Zl+EvxaaAy69/7jwWMOsREgJzbWWds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kJQ4TYkdE/ZT92JFXJScFcBpMlhVb4n2PAcb8PtdWjm+9H0O5aa5h2Q9CuofrDRrtwiF6F2LE+QUlnOqmZ8aQpl7YWH11U4uaXdaagR7kRbEIW2DhBwspGf4eAqHs3QEKn9CSiM9S8q7peZvdd8UBhFJZkGPLZ8Ws2fzRe+RgHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQ6b5d7u; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQ6b5d7u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766301662; x=1797837662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gReSOliRnoIq/Zl+EvxaaAy69/7jwWMOsREgJzbWWds=;
  b=kQ6b5d7ux0hzZEEp1GuddmoBV3okiEYQsePDI4BbRmD2OH7FIHQyEp4r
   8IzCUY9A1G9+XzvOcr75sYSDOsH5FIb0tuoWI1eXxfGB+nK9kjWFZiDan
   /g3HO9xcsEJzzaZZgUWxxYFQjug/R0Aw3Ruwip+7gMPcPSUJJP4VUJpMU
   xskhhaDzpl523Y/ZL7+C7d3T5MzDnwtpWFK8P8FniopbRHYcd3ARnbrbj
   r5zu8V3CTKB4FftSqdDjDl8bZlZ99rvXUchRPui0J2w/qfOqaqHOnj+CG
   WlrzwsVPjIjUjzrsxCCDzYWuoNuvRC/T8Hc0+/YpFQFVMihEOIpZBtuHu
   g==;
X-CSE-ConnectionGUID: 81Hi9W8XRI2b5Kil01qjmQ==
X-CSE-MsgGUID: R7PELTGERHCUiQ3Fyh2B8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="67394032"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="67394032"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 23:21:01 -0800
X-CSE-ConnectionGUID: 8t/SIXgIS1qTFfDpFVlD3g==
X-CSE-MsgGUID: gbp3BqSiStK4pwWBi5bIQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199282290"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Dec 2025 23:20:59 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXDkP-000000005Ob-0nHT;
	Sun, 21 Dec 2025 07:20:57 +0000
Date: Sun, 21 Dec 2025 15:20:28 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:kerne-unload 6/6] arch/s390/include/asm/processor.h:398:13:
 error: use of undeclared identifier '_THIS_IP_'
Message-ID: <202512211540.3vfGajn8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux kerne-unload
head:   db5f16753bdda297b43e6c2e04f591ea173438e2
commit: db5f16753bdda297b43e6c2e04f591ea173438e2 [6/6] drop trace_printk.h
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20251221/202512211540.3vfGajn8-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b324c9f4fa112d61a553bf489b5f4f7ceea05ea8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512211540.3vfGajn8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211540.3vfGajn8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/asm-offsets.c:10:
   In file included from include/linux/sched.h:13:
>> arch/s390/include/asm/processor.h:398:13: error: use of undeclared identifier '_THIS_IP_'
     398 |         psw.addr = _THIS_IP_;
         |                    ^~~~~~~~~
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:5: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     116 |                         (set1->sig[1] == set2->sig[1]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:21: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     116 |                         (set1->sig[1] == set2->sig[1]) &&
         |                                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here


vim +/_THIS_IP_ +398 arch/s390/include/asm/processor.h

ccf45cafb08059 arch/s390/include/asm/processor.h Martin Schwidefsky 2011-10-30  389  
^1da177e4c3f41 include/asm-s390/processor.h      Linus Torvalds     2005-04-16  390  /*
^1da177e4c3f41 include/asm-s390/processor.h      Linus Torvalds     2005-04-16  391   * Function to drop a processor into disabled wait state
^1da177e4c3f41 include/asm-s390/processor.h      Linus Torvalds     2005-04-16  392   */
c2e06e15ad92ba arch/s390/include/asm/processor.h Vasily Gorbik      2019-11-22  393  static __always_inline void __noreturn disabled_wait(void)
^1da177e4c3f41 include/asm-s390/processor.h      Linus Torvalds     2005-04-16  394  {
f9e6edfb9cf780 arch/s390/include/asm/processor.h Heiko Carstens     2015-10-12  395  	psw_t psw;
^1da177e4c3f41 include/asm-s390/processor.h      Linus Torvalds     2005-04-16  396  
f9e6edfb9cf780 arch/s390/include/asm/processor.h Heiko Carstens     2015-10-12  397  	psw.mask = PSW_MASK_BASE | PSW_MASK_WAIT | PSW_MASK_BA | PSW_MASK_EA;
98587c2d894c34 arch/s390/include/asm/processor.h Martin Schwidefsky 2019-04-30 @398  	psw.addr = _THIS_IP_;
f9e6edfb9cf780 arch/s390/include/asm/processor.h Heiko Carstens     2015-10-12  399  	__load_psw(psw);
edd5378740fe77 arch/s390/include/asm/processor.h Heiko Carstens     2008-12-25  400  	while (1);
^1da177e4c3f41 include/asm-s390/processor.h      Linus Torvalds     2005-04-16  401  }
^1da177e4c3f41 include/asm-s390/processor.h      Linus Torvalds     2005-04-16  402  

:::::: The code at line 398 was first introduced by commit
:::::: 98587c2d894c34c9af5cd84ca169e1cd493aa692 s390: simplify disabled_wait

:::::: TO: Martin Schwidefsky <schwidefsky@de.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
