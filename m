Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311427478
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jul 2026 03:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783826198; cv=none; b=Lay0oVBduSYi2AI0PCKMN+ojCzfhsoeyMKc0gCk0EqB7+UmykARxEIeFxuwlfVU6aLK5GwTilqGLNL0gB7pqBvXGTmM/H16VXiK4ZlaFwIo8pVwEC2naKQ1WeEZA8VpLQwYNfSMnz0laJvpj0Ft+VNQFXBmRjHWeId3iF3K/tFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783826198; c=relaxed/simple;
	bh=1dTiwxZz+e5a8gN6QJ+3OY12R5oGZLG0qT4j0gsYHlA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YMFZvjHFf79dFSs4NTO0zmvZMwWl1ocajxhT7p+q8/Ckb+zZBV2DBpbn8402d8BpARLac2K7ss7IlqF3XUUIwUOguRNK1Kd4qrNpjV5WmJWpTY9zLQdEKp93WxJYXINDxk4KRCiSkfuBM9zL1p+2CcGfFIVyowrF29Oav/Nc41U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AEBQgEpg; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AEBQgEpg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783826196; x=1815362196;
  h=date:from:to:cc:subject:message-id;
  bh=1dTiwxZz+e5a8gN6QJ+3OY12R5oGZLG0qT4j0gsYHlA=;
  b=AEBQgEpgD5hCpnXNHrEdda87gieYKBrqoIu0xI4Ebzue+cwLGj5lD8wl
   yql7HKeScbFC3bGLH1zIi84mHMKUFHze0Dx+pYahL/OlvqWsFOvaofq5L
   t1/gVl2qRMzlH0PZOwcXNNO8Lh81VSOwgnzqxXIjFCB5078NTvu8NqpSK
   2Oo/Aw+GT0eyoFyI5bzx2NBzwErhJEQIHlNJ0JE7/98h3Bjo3oCMpzEvh
   4O4DW083PQCa/wSTL3RIXuGHopVKJlSkLH7IJXpOZ08gRU7YqXpA/B6rl
   5MA2WgUQpkJMi3+Wfj9qgWvd35S1S/ey8sJeERnIs3W6T6NlBM7T7AlIn
   A==;
X-CSE-ConnectionGUID: ZsO/qVKLSHe8udwJTnHZ1A==
X-CSE-MsgGUID: yibp30jZSb6ep1HKAEfwjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84530169"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84530169"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 20:16:35 -0700
X-CSE-ConnectionGUID: biRFBCC6RxS9g3q7tTYORw==
X-CSE-MsgGUID: Um3gBeEGSdGkE/t+jZzzKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="260118186"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jul 2026 20:16:34 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wikgC-000000003UT-0uPs;
	Sun, 12 Jul 2026 03:16:32 +0000
Date: Sun, 12 Jul 2026 05:15:50 +0200
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/cleanup 54/59]
 arch/powerpc/kernel/process.c:1985:44: error: implicit declaration of
 function 'get_random_long'
Message-ID: <202607120500.VD5iDUQ0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Thomas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/cleanup
head:   0ad363c8e014568032d53fe2c7ab288de68373f4
commit: 6299571fd92a863d5d0412683cd5c2c8f3da42c8 [54/59] powerpc: Select ARCH_HAS_RANDOM_ENTROPY
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260712/202607120500.VD5iDUQ0-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607120500.VD5iDUQ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607120500.VD5iDUQ0-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kernel/process.c: In function 'start_thread':
>> arch/powerpc/kernel/process.c:1985:44: error: implicit declaration of function 'get_random_long' [-Wimplicit-function-declaration]
    1985 |                 current->thread.hashkeyr = get_random_long();
         |                                            ^~~~~~~~~~~~~~~
   arch/powerpc/kernel/process.c: In function 'arch_align_stack':
>> arch/powerpc/kernel/process.c:2409:23: error: implicit declaration of function 'get_random_u32_below' [-Wimplicit-function-declaration]
    2409 |                 sp -= get_random_u32_below(PAGE_SIZE);
         |                       ^~~~~~~~~~~~~~~~~~~~
--
   arch/powerpc/mm/book3s64/hash_4k.c: In function '__hash_page_4K':
>> arch/powerpc/mm/book3s64/hash_4k.c:101:37: error: implicit declaration of function 'mftb'; did you mean 'mb'? [-Wimplicit-function-declaration]
     101 |                                 if (mftb() & 0x1)
         |                                     ^~~~
         |                                     mb
--
   arch/powerpc/mm/book3s64/hash_hugepage.c: In function '__hash_page_thp':
>> arch/powerpc/mm/book3s64/hash_hugepage.c:149:37: error: implicit declaration of function 'mftb'; did you mean 'mb'? [-Wimplicit-function-declaration]
     149 |                                 if (mftb() & 0x1)
         |                                     ^~~~
         |                                     mb


vim +/get_random_long +1985 arch/powerpc/kernel/process.c

8e96a87c5431c2 Cyril Bur        2016-06-17  1893  
ec6d0dde71d760 Naveen N Rao     2022-06-09  1894  	memset(&regs->gpr[1], 0, sizeof(regs->gpr) - sizeof(regs->gpr[0]));
14cf11af6cf608 Paul Mackerras   2005-09-26  1895  	regs->ctr = 0;
14cf11af6cf608 Paul Mackerras   2005-09-26  1896  	regs->link = 0;
14cf11af6cf608 Paul Mackerras   2005-09-26  1897  	regs->xer = 0;
14cf11af6cf608 Paul Mackerras   2005-09-26  1898  	regs->ccr = 0;
14cf11af6cf608 Paul Mackerras   2005-09-26  1899  	regs->gpr[1] = sp;
06d67d54741a5b Paul Mackerras   2005-10-10  1900  
06d67d54741a5b Paul Mackerras   2005-10-10  1901  #ifdef CONFIG_PPC32
06d67d54741a5b Paul Mackerras   2005-10-10  1902  	regs->mq = 0;
06d67d54741a5b Paul Mackerras   2005-10-10  1903  	regs->nip = start;
14cf11af6cf608 Paul Mackerras   2005-09-26  1904  	regs->msr = MSR_USER;
06d67d54741a5b Paul Mackerras   2005-10-10  1905  #else
9904b00593f548 Denis Kirjanov   2010-07-29  1906  	if (!is_32bit_task()) {
94af3abf995b17 Rusty Russell    2013-11-20  1907  		unsigned long entry;
06d67d54741a5b Paul Mackerras   2005-10-10  1908  
94af3abf995b17 Rusty Russell    2013-11-20  1909  		if (is_elf2_task()) {
94af3abf995b17 Rusty Russell    2013-11-20  1910  			/* Look ma, no function descriptors! */
94af3abf995b17 Rusty Russell    2013-11-20  1911  			entry = start;
94af3abf995b17 Rusty Russell    2013-11-20  1912  
94af3abf995b17 Rusty Russell    2013-11-20  1913  			/*
94af3abf995b17 Rusty Russell    2013-11-20  1914  			 * Ulrich says:
94af3abf995b17 Rusty Russell    2013-11-20  1915  			 *   The latest iteration of the ABI requires that when
94af3abf995b17 Rusty Russell    2013-11-20  1916  			 *   calling a function (at its global entry point),
94af3abf995b17 Rusty Russell    2013-11-20  1917  			 *   the caller must ensure r12 holds the entry point
94af3abf995b17 Rusty Russell    2013-11-20  1918  			 *   address (so that the function can quickly
94af3abf995b17 Rusty Russell    2013-11-20  1919  			 *   establish addressability).
94af3abf995b17 Rusty Russell    2013-11-20  1920  			 */
94af3abf995b17 Rusty Russell    2013-11-20  1921  			regs->gpr[12] = start;
94af3abf995b17 Rusty Russell    2013-11-20  1922  			/* Make sure that's restored on entry to userspace. */
94af3abf995b17 Rusty Russell    2013-11-20  1923  			set_thread_flag(TIF_RESTOREALL);
94af3abf995b17 Rusty Russell    2013-11-20  1924  		} else {
94af3abf995b17 Rusty Russell    2013-11-20  1925  			unsigned long toc;
94af3abf995b17 Rusty Russell    2013-11-20  1926  
94af3abf995b17 Rusty Russell    2013-11-20  1927  			/* start is a relocated pointer to the function
94af3abf995b17 Rusty Russell    2013-11-20  1928  			 * descriptor for the elf _start routine.  The first
94af3abf995b17 Rusty Russell    2013-11-20  1929  			 * entry in the function descriptor is the entry
94af3abf995b17 Rusty Russell    2013-11-20  1930  			 * address of _start and the second entry is the TOC
94af3abf995b17 Rusty Russell    2013-11-20  1931  			 * value we need to use.
06d67d54741a5b Paul Mackerras   2005-10-10  1932  			 */
f66dbe43798fc9 Michael Ellerman 2024-12-16  1933  			get_user(entry, (unsigned long __user *)start);
f66dbe43798fc9 Michael Ellerman 2024-12-16  1934  			get_user(toc, (unsigned long __user *)start+1);
06d67d54741a5b Paul Mackerras   2005-10-10  1935  
06d67d54741a5b Paul Mackerras   2005-10-10  1936  			/* Check whether the e_entry function descriptor entries
06d67d54741a5b Paul Mackerras   2005-10-10  1937  			 * need to be relocated before we can use them.
06d67d54741a5b Paul Mackerras   2005-10-10  1938  			 */
06d67d54741a5b Paul Mackerras   2005-10-10  1939  			if (load_addr != 0) {
06d67d54741a5b Paul Mackerras   2005-10-10  1940  				entry += load_addr;
06d67d54741a5b Paul Mackerras   2005-10-10  1941  				toc   += load_addr;
06d67d54741a5b Paul Mackerras   2005-10-10  1942  			}
06d67d54741a5b Paul Mackerras   2005-10-10  1943  			regs->gpr[2] = toc;
94af3abf995b17 Rusty Russell    2013-11-20  1944  		}
59dc5bfca0cb6a Nicholas Piggin  2021-06-18  1945  		regs_set_return_ip(regs, entry);
59dc5bfca0cb6a Nicholas Piggin  2021-06-18  1946  		regs_set_return_msr(regs, MSR_USER64);
d4bf9a7858a076 Stephen Rothwell 2005-10-13  1947  	} else {
d4bf9a7858a076 Stephen Rothwell 2005-10-13  1948  		regs->gpr[2] = 0;
59dc5bfca0cb6a Nicholas Piggin  2021-06-18  1949  		regs_set_return_ip(regs, start);
59dc5bfca0cb6a Nicholas Piggin  2021-06-18  1950  		regs_set_return_msr(regs, MSR_USER32);
06d67d54741a5b Paul Mackerras   2005-10-10  1951  	}
59dc5bfca0cb6a Nicholas Piggin  2021-06-18  1952  
06d67d54741a5b Paul Mackerras   2005-10-10  1953  #endif
ce48b2100785e5 Michael Neuling  2008-06-25  1954  #ifdef CONFIG_VSX
ce48b2100785e5 Michael Neuling  2008-06-25  1955  	current->thread.used_vsr = 0;
ce48b2100785e5 Michael Neuling  2008-06-25  1956  #endif
5434ae74629af5 Nicholas Piggin  2018-09-15  1957  	current->thread.load_slb = 0;
1195892c091a15 Breno Leitao     2017-06-02  1958  	current->thread.load_fp = 0;
b6254ced4da6cf Christophe Leroy 2020-08-18  1959  #ifdef CONFIG_PPC_FPU_REGS
de79f7b9f6f92e Paul Mackerras   2013-09-10  1960  	memset(&current->thread.fp_state, 0, sizeof(current->thread.fp_state));
18461960cbf50b Paul Mackerras   2013-09-10  1961  	current->thread.fp_save_area = NULL;
b6254ced4da6cf Christophe Leroy 2020-08-18  1962  #endif
14cf11af6cf608 Paul Mackerras   2005-09-26  1963  #ifdef CONFIG_ALTIVEC
de79f7b9f6f92e Paul Mackerras   2013-09-10  1964  	memset(&current->thread.vr_state, 0, sizeof(current->thread.vr_state));
de79f7b9f6f92e Paul Mackerras   2013-09-10  1965  	current->thread.vr_state.vscr.u[3] = 0x00010000; /* Java mode disabled */
18461960cbf50b Paul Mackerras   2013-09-10  1966  	current->thread.vr_save_area = NULL;
14cf11af6cf608 Paul Mackerras   2005-09-26  1967  	current->thread.vrsave = 0;
14cf11af6cf608 Paul Mackerras   2005-09-26  1968  	current->thread.used_vr = 0;
1195892c091a15 Breno Leitao     2017-06-02  1969  	current->thread.load_vec = 0;
14cf11af6cf608 Paul Mackerras   2005-09-26  1970  #endif /* CONFIG_ALTIVEC */
14cf11af6cf608 Paul Mackerras   2005-09-26  1971  #ifdef CONFIG_SPE
14cf11af6cf608 Paul Mackerras   2005-09-26  1972  	memset(current->thread.evr, 0, sizeof(current->thread.evr));
14cf11af6cf608 Paul Mackerras   2005-09-26  1973  	current->thread.acc = 0;
14cf11af6cf608 Paul Mackerras   2005-09-26  1974  	current->thread.spefscr = 0;
14cf11af6cf608 Paul Mackerras   2005-09-26  1975  	current->thread.used_spe = 0;
14cf11af6cf608 Paul Mackerras   2005-09-26  1976  #endif /* CONFIG_SPE */
bc2a9408fa6519 Michael Neuling  2013-02-13  1977  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
bc2a9408fa6519 Michael Neuling  2013-02-13  1978  	current->thread.tm_tfhar = 0;
bc2a9408fa6519 Michael Neuling  2013-02-13  1979  	current->thread.tm_texasr = 0;
bc2a9408fa6519 Michael Neuling  2013-02-13  1980  	current->thread.tm_tfiar = 0;
7f22ced4377628 Breno Leitao     2017-06-05  1981  	current->thread.load_tm = 0;
bc2a9408fa6519 Michael Neuling  2013-02-13  1982  #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
be98fcf7c10dea Benjamin Gray    2023-06-19  1983  #ifdef CONFIG_PPC_BOOK3S_64
be98fcf7c10dea Benjamin Gray    2023-06-19  1984  	if (cpu_has_feature(CPU_FTR_DEXCR_NPHIE)) {
be98fcf7c10dea Benjamin Gray    2023-06-19 @1985  		current->thread.hashkeyr = get_random_long();
be98fcf7c10dea Benjamin Gray    2023-06-19  1986  		mtspr(SPRN_HASHKEYR, current->thread.hashkeyr);
be98fcf7c10dea Benjamin Gray    2023-06-19  1987  	}
be98fcf7c10dea Benjamin Gray    2023-06-19  1988  #endif /* CONFIG_PPC_BOOK3S_64 */
14cf11af6cf608 Paul Mackerras   2005-09-26  1989  }
e1802b065d189c Anton Blanchard  2014-08-20  1990  EXPORT_SYMBOL(start_thread);
14cf11af6cf608 Paul Mackerras   2005-09-26  1991  

:::::: The code at line 1985 was first introduced by commit
:::::: be98fcf7c10dea74e9c3e2cd0018e47bdee67442 powerpc/dexcr: Support userspace ROP protection

:::::: TO: Benjamin Gray <bgray@linux.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
