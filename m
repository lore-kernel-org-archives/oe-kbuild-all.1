Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4838F49
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 00:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768694793; cv=none; b=UnUoi4WRczLicUW1yNyrjTp3weyxjmQez8rYbM+vwQP+c42jbyi/Z9nbGDiNdV+tMliEh4AISzcxBMx/g7aWtvtTIScQ7byKvYSQr8hl7lj2D+X9kvHhtQSS2wLMNvzPgpiYfyMTCbg+645zJ1IF+3CLX4DwsoIqRkat3wEn+5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768694793; c=relaxed/simple;
	bh=ckJ6V+DvZNm6vZEDZ+8c9I2Jkufz2va0dtQnJly4hBM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VYOiqyugvrMQwMv3EHb4/mDk1LlhC8OCxpHdyPmyxyHvneJNBcT+FXmfkBtkuBrryrZvlYVKnh1Ldhi7g0/AllhV7xb7itY3/SDN+8pqnXGtaqLBPhSKx5ICvYYcYchXh3Vjm+K9WAFue6niwUt30NJWaS1fv7sO7SkhwsNl3zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gd7RcYk+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gd7RcYk+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768694791; x=1800230791;
  h=date:from:to:cc:subject:message-id;
  bh=ckJ6V+DvZNm6vZEDZ+8c9I2Jkufz2va0dtQnJly4hBM=;
  b=Gd7RcYk+5NrGCUWJOiXLo13m/6se0/f7EykaQK9XUC022GuBGhvmeJg0
   S7YLZBX89bxGKlsRy0OVwR0MyMNYzCaVGkaP84BRVvdKFPFEcj0ujPJGl
   i4sjC5R4wn5L2OZJsUef6cm8mzxy/3C/tBduvyrxuygwCJAGOZT5vsy0U
   3HgIU5gwG/x7p4ipdSDjLmpr94QO493ecRtfeBg8YPnf9ipEh9ltAVs53
   8CgNO1IoM0054ZvKvEIipuDiU8yhYNzgTlmcM5Wq1EmuQXGCnN4vo0OGq
   ldRYo5UiOsX0qH4HDCrPNiuXGnQG4pOIWrYH3BxZFcIJvVNGawXw92B38
   A==;
X-CSE-ConnectionGUID: EZW3gyUXQzS0DEvf0MHIsQ==
X-CSE-MsgGUID: mKwgTFncRO2bvwQO1F4+yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="72548947"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="72548947"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 16:06:30 -0800
X-CSE-ConnectionGUID: 4PmjxhgVQl6GhqSbJ+Kpcg==
X-CSE-MsgGUID: mrjMYliqSlejmNm3wKdJVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="209677719"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jan 2026 16:06:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhGJF-00000000MQ5-1ACX;
	Sun, 18 Jan 2026 00:06:25 +0000
Date: Sun, 18 Jan 2026 08:05:56 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: [tip:timers/vdso 16/16]
 include/linux/compiler_types.h:568:5: warning: 'CC_HAS_TYPEOF_UNQUAL' is not
 defined, evaluates to '0'
Message-ID: <202601180747.rlQMyHZI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/vdso
head:   adc00a0daf1bb08915bceee9ae73cca682e7d5bb
commit: adc00a0daf1bb08915bceee9ae73cca682e7d5bb [16/16] compiler: Use __typeof_unqual__() for __unqual_scalar_typeof()
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260118/202601180747.rlQMyHZI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601180747.rlQMyHZI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601180747.rlQMyHZI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/compiler.h:5,
                    from include/linux/export.h:5,
                    from arch/alpha/lib/divide.S:49:
>> include/linux/compiler_types.h:568:5: warning: 'CC_HAS_TYPEOF_UNQUAL' is not defined, evaluates to '0' [-Wundef]
     568 | #if CC_HAS_TYPEOF_UNQUAL || defined(__CHECKER__)
         |     ^~~~~~~~~~~~~~~~~~~~


vim +568 include/linux/compiler_types.h

   564	
   565	/*
   566	 * Use __typeof_unqual__() when available.
   567	 */
 > 568	#if CC_HAS_TYPEOF_UNQUAL || defined(__CHECKER__)
   569	# define USE_TYPEOF_UNQUAL 1
   570	#endif
   571	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
