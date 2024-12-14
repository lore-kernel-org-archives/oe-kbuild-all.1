Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D561401C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 03:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734145636; cv=none; b=G3Wa6GaZSCYktUunbQUY7cGQH1gUy5S4wAzsO/Ls4apzIZs6x19b/fJJCPNNvkhXZNHmLD47ZqEi26QUE6eC6iuClOekPF3cWW7J33qm+dSa6YTqEM+HKgvSxTbDMoj3iL80Y1vzELrMxlLqmALL7tsbMrtlwYnoaq0b8+0Tcog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734145636; c=relaxed/simple;
	bh=XE01NiCl1rsb4jVZWfc62pdpWJcU9yAxzFIykLSEQzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UMDsK++5GGPLd1U+qzHvo+8BsxOrRCSAwddcz0hgGvvgmrnIOhBt3WRLIdC9APXVY6uabzVXMveptke+SAhqWz/FHJ9hTP3H8NWlPxFKh4wwjTWsRtK3e6/r3W6kPBdyfIX5xgXLGPoH44Id67Hmi3vtxanKG9V5B7erQw9/fm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ldLTHnCx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ldLTHnCx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734145634; x=1765681634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XE01NiCl1rsb4jVZWfc62pdpWJcU9yAxzFIykLSEQzQ=;
  b=ldLTHnCxdfLbYnGGtuiD6JZ9RNNrqG8/FpVmTLwx6q1xV6fgM6Udd/2U
   WIKG+E630CdqzhZoABzNDf9BH3iqi6mvRFMR1zmfd/hAFF3RCGBNsXlnA
   8ORgcQjgWNXjjhB/OX8In0KqLdshJafRb+xK5yXCout0nUakXXiZ4ZeId
   +IrIrwLw693jbGkjXPOVP2hIQ2RFXnnRsOeoMuGbPQZ5ZnO0yd1+D+VdB
   cQjvu/Sv58aD64PKTYDaJ2+RQMejp4bGpi+Vuo0BoSCTY9TMDQc25by60
   Odpo3s+w8HdAGUSGdC5HuWGyMI5u4PPLQzmU6W5aDMayueqYbDnSH6bi2
   Q==;
X-CSE-ConnectionGUID: n7SAzXKLSZ+v1avjCKT8vA==
X-CSE-MsgGUID: XV/+uRbBQHuqHtaWtgNlIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45092722"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45092722"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 19:07:14 -0800
X-CSE-ConnectionGUID: zx/bbAtISjG5itOVY7ja9Q==
X-CSE-MsgGUID: HRJ59qAUSy2e1jCvQdTCpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134051196"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Dec 2024 19:07:13 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMIUo-000Cex-2e;
	Sat, 14 Dec 2024 03:07:10 +0000
Date: Sat, 14 Dec 2024 11:06:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 2/4]
 drivers/android/android_debug_symbols.c:59:9: sparse: sparse: cast removes
 address space '__percpu' of expression
Message-ID: <202412141031.RSw5Yoks-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   22b7ded8b55bf28ae8d1214bba61b8d8403330da
commit: dfabd2e38be31725210d182c5648b8c24157cef8 [2/4] ANDROID: android: Create debug_symbols driver
config: i386-randconfig-r131-20241211 (https://download.01.org/0day-ci/archive/20241214/202412141031.RSw5Yoks-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412141031.RSw5Yoks-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412141031.RSw5Yoks-lkp@intel.com/

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
