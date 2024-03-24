Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8763628E7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Mar 2024 08:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711268373; cv=none; b=QnMMqOjNLPLCAanVf8hWgLYnJg7hgsEJF1iactnIE5qR4PSo8moWnDDf9b2eGtiQ6cT21Tmyo0yoFTVwW3BjPYFYhGv4Xsj/gmbar6HfdzUoBZj3znH36YfPg7dOu8mL7WH0n0PHTlRlIdMv29HFNdWjmhbfEqkOj/Oh4u35OoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711268373; c=relaxed/simple;
	bh=dBAZ5lgBS+IQ/KxM2Okm4hst1ca82TjT+29eDtVZlHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FdN9VOVXwcHT9Okc0ajU94nZWq+1icqCQsKDrtadp+m9m+7ZpGmlYrGYCvHfjkPYLYprG58aWdQokKSV5nEq7H/8aLYALFaly9VIxx4/iikG+blrWHCNl/KduS+ocBfbwTu9lXo3F2iVpBgvnqVsC921z/KBbnjFLZ2xDWCxEvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O3qTqjt/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O3qTqjt/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711268372; x=1742804372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dBAZ5lgBS+IQ/KxM2Okm4hst1ca82TjT+29eDtVZlHk=;
  b=O3qTqjt/WC+xwbH23XOjteKLZQWUg1AZxSrz+6M/deGPmFAEXwEcxGYd
   q1hWt7tdakX2hG25dl9gyVRhV7X1MXwiiaRp3+k8i8ClKsNLYKOZpIHXy
   DAJ9+md0DH1+9ycV7RAUTsSl8McD4JemvYqmsiQmbeenU0s6R8OHetU7C
   fykCVzA0sxh5y8KNcxbw2u+rWYKIICglQGmasMio5NPFiOWu4aUgBUm76
   V/hOc7jwG5DrKkYqkUt+W1/o6UzqyKe73K5Z94fx6Lzk2NK96VLKNepb+
   AjFmxtNqJaHXkVA2kFMZ1JGOkvhfx4NVo9MNNX09iBmcbm6lCCe+U+vQA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="23731318"
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="23731318"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 01:19:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="19796001"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Mar 2024 01:19:29 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roJ4h-000Lj1-0X;
	Sun, 24 Mar 2024 08:19:27 +0000
Date: Sun, 24 Mar 2024 16:19:25 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.7/main 334/3386] kernel/sched/smp.h:14:20: error:
 redefinition of 'flush_smp_call_function_queue'
Message-ID: <202403241605.fDJXyKC6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alfred,

FYI, the error/warning still remains.

tree:   https://github.com/zen-kernel/zen-kernel 6.7/main
head:   56c7820d4581e633d4d3a9015a5c45d9f4f67b01
commit: d3eaf77e9b721b7ead96e32ec9e08dc48c33d176 [334/3386] sched/alt: [Sync] 16bf5a5e1ec5 smp: Rename flush_smp_call_function_from_idle()
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240324/202403241605.fDJXyKC6-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403241605.fDJXyKC6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403241605.fDJXyKC6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:35:
>> kernel/sched/smp.h:14:20: error: redefinition of 'flush_smp_call_function_queue'
      14 | static inline void flush_smp_call_function_queue(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/sched.h:9,
                    from kernel/sched/build_policy.c:34:
   kernel/sched/alt_sched.h:296:20: note: previous definition of 'flush_smp_call_function_queue' with type 'void(void)'
     296 | static inline void flush_smp_call_function_queue(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/flush_smp_call_function_queue +14 kernel/sched/smp.h

d664e399128bd7 Thomas Gleixner 2022-04-13  10  
d664e399128bd7 Thomas Gleixner 2022-04-13  11  #ifdef CONFIG_SMP
16bf5a5e1ec564 Thomas Gleixner 2022-04-13  12  extern void flush_smp_call_function_queue(void);
d664e399128bd7 Thomas Gleixner 2022-04-13  13  #else
16bf5a5e1ec564 Thomas Gleixner 2022-04-13 @14  static inline void flush_smp_call_function_queue(void) { }

:::::: The code at line 14 was first introduced by commit
:::::: 16bf5a5e1ec56474ed2a19d72f272ed09a5d3ea1 smp: Rename flush_smp_call_function_from_idle()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
