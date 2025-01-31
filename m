Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16C41F151B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 19:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738353426; cv=none; b=Wgf+LCq9AXCyBMnszKsYgYIO2ngDADVIU4L7C/WSwO+UtPwQCZH7IcW5AJ9KtD8KcCZuQHNrn8wSpP2u6rAxgB9HKGFGQ0NEGi1d6RhB93b/M0d0Yu9DJikjpISLfNjE5AcXZhsxO0V74TrTK2jOniQwjYsrIWvQyftD7rzrgzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738353426; c=relaxed/simple;
	bh=l5sD+pNPBAcougMmecSXpNNNNP0rxIj4zEZLBekUeUI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b/ZVQL0yuMl9nbKNc6BqV8rbSIt1wZyNSDLWJOCdtK3m2Us+b9UvczLz/OUPDQMJqeKkRWR6J0l3vZgEFSr8Lupa8Y6JXpRIOX2UFgOkonycCC/X5jcCexzGVvCpbwy8uyJd1eVWXGLonCPdD5U6/043UT7o7OBlVkrqTfA5ZB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gaQsTFHx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gaQsTFHx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738353425; x=1769889425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l5sD+pNPBAcougMmecSXpNNNNP0rxIj4zEZLBekUeUI=;
  b=gaQsTFHxi1dEOuRvtChU3iwIt41SlDOAsYV5Nugh/dyoBCjP72ibjkLL
   E9hVYJuteaQf9Bdcs0zWoWcKjFELGZR6pEn0E9WMawu67GnpRxYu9Z5ry
   bwaXJcCoFvHH+WPEcSApgj+TnOhI67syYpR+eoD2qJMGYWsiBYqea7ME2
   OXh361qFLWLKi49IGUVebYXaYPorjcw2AASzD3tWeIVsv94Jzu5wBYj4Y
   p9UtTJCoX7C7pcQRHzSeBL2OYG4w8/wWFYVwYQFGfMltCa3jyYV+hZR/u
   FXEPwp6wfVzxff+eNRqh8415ax/4beOuBgW1vwBj+oWSNNc+uiF+2HKBF
   g==;
X-CSE-ConnectionGUID: NVXwpgCVQvSEeLYVlFhwQw==
X-CSE-MsgGUID: 6Pc98n8iTPCFSaaPaFNEig==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38635201"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="38635201"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 11:57:04 -0800
X-CSE-ConnectionGUID: 2pD+SzKZRqOJ6/OnqJ9uPA==
X-CSE-MsgGUID: IgGNH6aSQA+HZ72z60gPvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140603054"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Jan 2025 11:57:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdx8O-000n2j-1X;
	Fri, 31 Jan 2025 19:57:00 +0000
Date: Sat, 1 Feb 2025 03:56:57 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-mk-pte 7/9]
 arch/um/include/asm/pgtable.h:272:3: error: call to undeclared function
 'pte_mknewprot'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202502010351.5JZ51lnR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache folio-mk-pte
head:   44333e58349adcdfcb5b34f6086bf7c01dfd9c9a
commit: a225e946006795d33af26ec560a4f454379959e1 [7/9] um: Remove custom definition of mk_pte()
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20250201/202502010351.5JZ51lnR-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502010351.5JZ51lnR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502010351.5JZ51lnR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/open.c:9:
   In file included from include/linux/mm.h:30:
   In file included from include/linux/pgtable.h:6:
>> arch/um/include/asm/pgtable.h:272:3: error: call to undeclared function 'pte_mknewprot'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                 ^
>> arch/um/include/asm/pgtable.h:272:17: error: call to undeclared function 'pte_mknewpage'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                               ^
   In file included from fs/open.c:9:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/open.c:9:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/open.c:9:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/open.c:9:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/open.c:9:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/open.c:9:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/open.c:9:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/open.c:9:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
--
   In file included from fs/read_write.c:14:
   In file included from include/linux/fsnotify.h:16:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:30:
   In file included from include/linux/pgtable.h:6:
>> arch/um/include/asm/pgtable.h:272:3: error: call to undeclared function 'pte_mknewprot'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                 ^
>> arch/um/include/asm/pgtable.h:272:17: error: call to undeclared function 'pte_mknewpage'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                               ^
   2 errors generated.
--
   In file included from fs/statfs.c:2:
   In file included from include/linux/syscalls.h:94:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:30:
   In file included from include/linux/pgtable.h:6:
>> arch/um/include/asm/pgtable.h:272:3: error: call to undeclared function 'pte_mknewprot'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                 ^
>> arch/um/include/asm/pgtable.h:272:17: error: call to undeclared function 'pte_mknewpage'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                               ^
   fs/statfs.c:129:3: warning: 'memcpy' will always overflow; destination buffer has size 64, but size argument is 84 [-Wfortify-source]
     129 |                 memcpy(&buf, st, sizeof(*st));
         |                 ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
     150 | #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
         |                         ^
   1 warning and 2 errors generated.
--
   In file included from fs/aio.c:20:
   In file included from include/linux/syscalls.h:94:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:30:
   In file included from include/linux/pgtable.h:6:
>> arch/um/include/asm/pgtable.h:272:3: error: call to undeclared function 'pte_mknewprot'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                 ^
>> arch/um/include/asm/pgtable.h:272:17: error: call to undeclared function 'pte_mknewpage'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     272 |                 pte_mknewprot(pte_mknewpage(pte));
         |                               ^
   In file included from fs/aio.c:29:
   include/linux/mman.h:159:9: warning: division by zero is undefined [-Wdivision-by-zero]
     159 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:137:21: note: expanded from macro '_calc_vm_trans'
     137 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:160:9: warning: division by zero is undefined [-Wdivision-by-zero]
     160 |                _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:137:21: note: expanded from macro '_calc_vm_trans'
     137 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   2 warnings and 2 errors generated.


vim +/pte_mknewprot +272 arch/um/include/asm/pgtable.h

   265	
   266	static inline pte_t pfn_pte(unsigned long pfn, pgprot_t pgprot)
   267	{
   268		pte_t pte;
   269	
   270		pte_set_val(pte, pfn_to_phys(pfn), pgprot);
   271		if (pte_present(pte))
 > 272			pte_mknewprot(pte_mknewpage(pte));
   273	
   274		return pte;
   275	}
   276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
