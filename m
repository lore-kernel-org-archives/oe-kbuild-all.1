Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621A925771
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Mar 2025 12:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742128228; cv=none; b=qG9wY/jFZDN+kVoj3xnBXn0egoIpvneejOVIjoBtWaCsUht0KGO/3TpcLLCMSJWmjRDCOCOyzNEiBhJnb9Tbe+FjE4OfiF4Y/bhVBU3GbgmXuBA5uB7sW9V/UNb7R715pBN9JcxUpbsN+gVh4t4sRLzqAORhm05Vx06ZzdKunuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742128228; c=relaxed/simple;
	bh=9sqWnTJDYxfbm79/ZhG1EczsmJktMwIE4Dq5g+fdN2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tIwn6ROFHeTT+X6yk0arnJu9a6838o4q5dbJahEErAEb9OYDhzxqOSThy9waI8g1SQrSc1MXmD905ZjOMvI/4psQZtDwPwQ4lUfOXLHKmoYkors50H57LnouFw07OivNZZx2ucyzJJ1gVwII06Byi4eoXAgaNa7P37e09Zh/OzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DgasX1k/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DgasX1k/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742128227; x=1773664227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9sqWnTJDYxfbm79/ZhG1EczsmJktMwIE4Dq5g+fdN2U=;
  b=DgasX1k/EGLcrtbfBZFBLBk+lOwNClO81pbZIL5xDmcmQRGqRJ9JCvD7
   JKQagT2zb0uXlWKWmQJ5TqUpiujALoCOJUx8bHmBCUdb7ndoHSW3zVMlG
   02iPHZpukV0UqzMXVvQsWQYOBEuz25Wy80ovTBovzGY1/rn3ILwSGUL3u
   4mO4ufHPD1bTkWA1JfxIDQi148BcWr0qfK0L/RRcRfz2YhmHD1GnB3kmz
   He+d9hNmYqw/JfqQmsQTWTxSo22W/Jkp29dJ5wV7oMAIzUYVGXcufNl6P
   iwR2CriHbUs2baK6QHOq2qeDW7lehlvuvObpAA62daalLzl3Vsc8svBvk
   A==;
X-CSE-ConnectionGUID: 2zAPYtx5TRGcU9n3WwKX4Q==
X-CSE-MsgGUID: JTWuPIDoQgCrf1j49qZLpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43260962"
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="43260962"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 05:30:26 -0700
X-CSE-ConnectionGUID: SLVLAYADSdKXhLjiPCTE7w==
X-CSE-MsgGUID: M6BEUjcpQJ+/mYMLz31Cmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="122210654"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 16 Mar 2025 05:30:24 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttn8I-000Bzn-0j;
	Sun, 16 Mar 2025 12:30:22 +0000
Date: Sun, 16 Mar 2025 20:29:28 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 12/15]
 arch/x86/include/asm/msr.h:339:17: error: use of undeclared identifier
 'pv_msr_pv'
Message-ID: <202503162032.yt1WOSdu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   2a93967cbc089183a3ee08556bcdab2711c1c6de
commit: 483ec528ba6f92a2d0aa8d8dd829e2f91c56dd89 [12/15] x86/msr: Use the alternatives mechanism to write MSR
config: i386-buildonly-randconfig-002-20250316 (https://download.01.org/0day-ci/archive/20250316/202503162032.yt1WOSdu-lkp@intel.com/config)
compiler: clang version 20.1.0 (https://github.com/llvm/llvm-project 24a30daaa559829ad079f2ff7f73eb4e18095f88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250316/202503162032.yt1WOSdu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503162032.yt1WOSdu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:18:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
>> arch/x86/include/asm/msr.h:339:17: error: use of undeclared identifier 'pv_msr_pv'
     339 |         if (pv_what == pv_msr_pv) {
         |                        ^
>> arch/x86/include/asm/msr.h:341:24: error: use of undeclared identifier 'pv_msr_ignore'
     341 |         } else if (pv_what == pv_msr_ignore) {
         |                               ^
   arch/x86/include/asm/msr.h:515:20: error: redefinition of 'wrmsrl'
     515 | static inline void wrmsrl(u32 msr, u64 val)
         |                    ^
   arch/x86/include/asm/msr.h:413:29: note: previous definition is here
     413 | static __always_inline void wrmsrl(const u32 msr, const u64 val)
         |                             ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
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
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
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
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
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
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
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
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
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
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
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
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:


vim +/pv_msr_pv +339 arch/x86/include/asm/msr.h

   334	
   335	static __always_inline bool __wrmsr_variable_all(const u32 msr, const u64 val, const int type)
   336	{
   337		const pv_msr_action_t pv_what = pv_msr_action(msr);
   338	
 > 339		if (pv_what == pv_msr_pv) {
   340			return __wrmsr_variable(msr, val, type);
 > 341		} else if (pv_what == pv_msr_ignore) {
   342			if (cpu_feature_enabled(X86_FEATURE_XENPV))
   343				return false;
   344		}
   345	
   346		return __native_wrmsr_variable(msr, val, type);
   347	}
   348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
