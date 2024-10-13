Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8B8231CA8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 19:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728849187; cv=none; b=OUMuKgnftvlSZszZe3BKDZTcADQ4ehnBLm5hs1lCkwZ1Sf0iWEE1IqyxmnHHEuso5XSeS5J6QiQGaIon/kYvhPuqyaOeF12IkkWQlquN9NfL6KPQz4zqdR96uVvVh2tzrkkdL9Z34YRgvJ0lFIs5ZJUn/eWpf0mtpYMPKVouiP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728849187; c=relaxed/simple;
	bh=2aFrM+S/mJ8YlRrbpF5VQ0+tPAr/vBIE9f0fTlUZA0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n1gLFEEQD4gDqj2yRqFyMp1LWMLVkKVNRQVuwkoTpyl7QarAt/C7mECZORupJ6C++2Mfvlt8fSQo1iMRdc4BulbeK4n7+ERAq9HSSZ8V9uNH7GLc112qVLMCuBUyvtqS2XI+Xv6xjHC7OJARYg40OsZYFs2drPfQgMwEGYJiJL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mu8ezuBU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mu8ezuBU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728849186; x=1760385186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2aFrM+S/mJ8YlRrbpF5VQ0+tPAr/vBIE9f0fTlUZA0U=;
  b=Mu8ezuBUlQMaNkuei/L8hhyBzgcJBEIsGZ0vruWA0jc9JTafa6c/Db7M
   KBOUMMkzoxDLvpeGGZSzQX49HvjGwsCftS5qEXlJoXxpSZsrR3Bez3htl
   M/HYvK85wb32gujBr0qzD1LFUADgk51d0kfgrKKNwzvBTFsFYXFGxdcNn
   SKe+G9MKXR+eAM3vTsvI1Hq0zAsH70NzM/uOJkZir5dXePTzalyDieQWf
   HeIcWfe7ZPYyg2i9HXKcxQZeSs6rEX9EIeUyaKtBVV+wjbKzg4p/Zrmrm
   VM+VXOU83CvR9/wy3kuP2BCaP31SVygSOgfPXbYRfk7sGo6yRZ+7nrR8u
   w==;
X-CSE-ConnectionGUID: 5fT6ImzFTMCVQ68qtUEwdQ==
X-CSE-MsgGUID: tJTXtRg0SvasGWBz8D0V4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="28276630"
X-IronPort-AV: E=Sophos;i="6.11,201,1725346800"; 
   d="scan'208";a="28276630"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 12:53:05 -0700
X-CSE-ConnectionGUID: BNRLzpA9SuW2ONsLZeetBQ==
X-CSE-MsgGUID: p3hdOonFSfiFvUyHoICsXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,201,1725346800"; 
   d="scan'208";a="82405728"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Oct 2024 12:53:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t04eD-000Eev-01;
	Sun, 13 Oct 2024 19:53:01 +0000
Date: Mon, 14 Oct 2024 03:52:28 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 5/6]
 arch/x86/include/asm/msr.h:127:26: error: unsupported inline asm: input with
 type 'u64' (aka 'unsigned long long') matching output with type 'int'
Message-ID: <202410140357.9p6sNb5D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   e5a67a380b17d57cd761a88882e1d30104311f9a
commit: f3e83a0d55e6df342644f685e555af4df8fa6a9d [5/6] x86/msr: Use the alternatives mechanism to call Xen MSR write API
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241014/202410140357.9p6sNb5D-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410140357.9p6sNb5D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410140357.9p6sNb5D-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:50:
   In file included from arch/x86/include/asm/uprobes.h:13:
   In file included from include/linux/notifier.h:16:
   In file included from include/linux/srcu.h:21:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
>> arch/x86/include/asm/msr.h:127:26: error: unsupported inline asm: input with type 'u64' (aka 'unsigned long long') matching output with type 'int'
     126 |                      : [err] "=a" (err)
         |                                    ~~~
     127 |                      : "c" (msr), "0" (val), "d" ((u32)(val >> 32)),
         |                                        ^~~
   arch/x86/include/asm/msr.h:142:26: error: unsupported inline asm: input with type 'u64' (aka 'unsigned long long') matching output with type 'int'
     141 |                      : [err] "=a" (err)
         |                                    ~~~
     142 |                      : "c" (msr), "0" (val), "d" ((u32)(val >> 32)));
         |                                        ^~~
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:


vim +127 arch/x86/include/asm/msr.h

   118	
   119	static __always_inline int native_wrmsrl_safe(u32 msr, u64 val)
   120	{
   121		int err;
   122	
   123		asm volatile("1: " ALTERNATIVE("ds wrmsr", WRMSRNS, X86_FEATURE_WRMSRNS)
   124			     "xor %[err],%[err]\n"
   125			     "2: " _ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_WRMSR_SAFE, %[err])
   126			     : [err] "=a" (err)
 > 127			     : "c" (msr), "0" (val), "d" ((u32)(val >> 32)),
   128			     "D" (msr), "S" (val));
   129	
   130		return err;
   131	}
   132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
