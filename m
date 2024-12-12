Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F38558BB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 14:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734013062; cv=none; b=QsASuvW4m8iEpLNcCr3ExZhN5vOkytfCiPU2IigeSGk6O7aKIFMNEUmJtd6rtLPdzFEfCYAgvAVswznHfFPOLoqxcQKfjK5aWTCUA5QVZ05KUZ4K423NejO8dUTTweHzZUO7iRl3Ys4sHz4E9dclSlNZgRfbXniXUQXP1WUgoxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734013062; c=relaxed/simple;
	bh=9MvShmNrw2aZ5Jyt9NICnXPnCzUmDAai1LWWb0zGqhw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H6MDYRRaYz9XG4x8pj4BcP6WjwSJy+9YEnvIUL3bCGcHmLJ0LxzmE/1wi8vQJow7grTJWepoPnyS1XNpUv1SxoYsAUnHN/LLni9eKekSdT9ZzPm7eUpEzlQt3gC+vJu9eE8doQxXTG2r2P+9cMqhJCntzrdqspPUR38NzvkUC5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LBAC0ngk; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LBAC0ngk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734013061; x=1765549061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9MvShmNrw2aZ5Jyt9NICnXPnCzUmDAai1LWWb0zGqhw=;
  b=LBAC0ngkawKk5C9HxowHoQaLLbFSZAm523Bllmzp3Nrnj9Ylk5P/LCT7
   JRdxVELovtx1pthc5jfxURQwomOsnbvUv5e0pbIRQhrpCFMQkeCA3L+8/
   9YclKmnALgSNnqQgQ6LDUopI3ugyzYjdZ0t4k91NwfWlPgllHUL3xms1+
   ofVGb6NzAkkp1AlhAS6uV+0L1zDv21N6gR2Rz195vrdKcjiK9hjEupIaz
   fLrrdrujtbqRU+bAKM5SOCs8U2NwAQWuySqnoA9O6mSX9FcdTl23s9PSZ
   BuTLme0eNMnR/K2kge5eZRYIgEc9+AZQL5ql9AxVhyqc2uTwWIA9B0sUZ
   Q==;
X-CSE-ConnectionGUID: w6ZvEqk4Q++l1I6NHnwBoA==
X-CSE-MsgGUID: 8la5x00ITt+fvLeZx1SKSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34157133"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="34157133"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 06:17:40 -0800
X-CSE-ConnectionGUID: XTCeULfzT/eBkRm9UIUalA==
X-CSE-MsgGUID: VNKvGhcfRcSt+0I7Yt/aVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97034240"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Dec 2024 06:17:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLk0V-0007vA-2w;
	Thu, 12 Dec 2024 14:17:35 +0000
Date: Thu, 12 Dec 2024 22:17:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 2/4]
 drivers/android/android_debug_symbols.c:59:9: sparse: sparse: cast removes
 address space '__percpu' of expression
Message-ID: <202412122231.aQabCSP7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b9ba16d91d44709fa2b3cdb7caadfd5b19a823e7
commit: dfabd2e38be31725210d182c5648b8c24157cef8 [2/4] ANDROID: android: Create debug_symbols driver
config: i386-randconfig-r131-20241211 (https://download.01.org/0day-ci/archive/20241212/202412122231.aQabCSP7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412122231.aQabCSP7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412122231.aQabCSP7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/android_debug_symbols.c:59:9: sparse: sparse: cast removes address space '__percpu' of expression

vim +/__percpu +59 drivers/android/android_debug_symbols.c

    50	
    51	/*
    52	 * ads_per_cpu_entries array contains all the per_cpu variable address information.
    53	 */
    54	static const struct ads_entry ads_per_cpu_entries[ADS_DEBUG_PER_CPU_END] = {
    55	#ifdef CONFIG_ARM64
    56		ADS_PER_CPU_ENTRY(ADS_IRQ_STACK_PTR, irq_stack_ptr),
    57	#endif
    58	#ifdef CONFIG_X86
  > 59		ADS_PER_CPU_ENTRY(ADS_IRQ_STACK_PTR, hardirq_stack_ptr),
    60	#endif
    61	};
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
