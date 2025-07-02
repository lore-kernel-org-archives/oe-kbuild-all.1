Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A73B1A3168
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 04:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751431156; cv=none; b=MreD730oFMG9x12YONB1XbYK0hDcOywt61KURxSuoOIn/nhNyrich+iA/L3QElFHciA5F+XK+dtrZSfdGpR/a6bQ/2PgVZr9lYby1dLdma5fJ9UkxQ61tYqv1hPV8bQXprnhzKXtrqiWIJbupQqWgWKiPGEvSKpP0/z1BDMtz3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751431156; c=relaxed/simple;
	bh=pBUe78IOJjW89b/y9WSmwtr638jP3H0dAd4UtS77dJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fnJwkn6TnSUfIS52qwIDXSPAR7i6zbvv8pSE+Byo6FClWZGF51E8s/fhrNc1XYgQxE4nRy1TJmiwePT9Lm+D5Thul2xkarQ8vIMWWWxWgTcZlcHIsbYyXqTJyB+bzmqTQtnixsNgTSi2xiBvkS6BMqxt+4MoAMIb3arKdO2NNNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wd/L9rhL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wd/L9rhL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751431154; x=1782967154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pBUe78IOJjW89b/y9WSmwtr638jP3H0dAd4UtS77dJA=;
  b=Wd/L9rhL2u79CxnvOkE/X712fmS96su7n0WKIllAXTyXRuVkPa9E61s+
   zYMQpEawlw7sDIHIqKd8vy4AgNjQOQZsIlac5XcV5cPeVPGHDdJn0aToR
   tdTwIk9ttfMVaxlX40yanm8zC6SPP/X8ajbjJNlSs3tLRrLf3+MZXC20Q
   UDZ5CGsAexvp7z7HTsU8gErH/u0HpyQJcTaMnedmw/PLwV0kXwYiG+6be
   LE0AwVHBRQT5ceCQWlCXn8s4VAisjk096H5WOjq889azNB4b1ZrSrr3AZ
   8L4eOrWAQFEhiGcWKHO1VJSSd9BvkPgjpA6pqbgzCd5ZUhYJzJsQTZoJe
   w==;
X-CSE-ConnectionGUID: 1ZkZiDlOREap0M6V2n+jrw==
X-CSE-MsgGUID: xoLnA7KCQcOCUc7AkhAWoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="56333906"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="56333906"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 21:39:13 -0700
X-CSE-ConnectionGUID: SsjzQQwwRbyIOIGErH6VPA==
X-CSE-MsgGUID: rv0r+LDQRcCeSZq6x9kDTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="153588157"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 01 Jul 2025 21:39:12 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWpFW-0000Dt-2e;
	Wed, 02 Jul 2025 04:39:10 +0000
Date: Wed, 2 Jul 2025 06:38:51 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2882/2882] arch/x86/events/amd/core.c:716:24:
 warning: variable 'hwc' set but not used
Message-ID: <202507020623.TJsJ79Ng-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4fdf755b0cabc80fc65da83c9da27ec2cee144dc
commit: f760d3d70f9029c226c09529168977f860e83950 [2882/2882] perf/x86/amd: Add AMD Fam19h Branch Sampling support
config: x86_64-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250702/202507020623.TJsJ79Ng-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020623.TJsJ79Ng-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507020623.TJsJ79Ng-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/events/amd/core.c:716:24: warning: variable 'hwc' set but not used [-Wunused-but-set-variable]
     716 |         struct hw_perf_event *hwc;
         |                               ^
   1 warning generated.


vim +/hwc +716 arch/x86/events/amd/core.c

   712	
   713	static void amd_pmu_enable_all(int added)
   714	{
   715		struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
 > 716		struct hw_perf_event *hwc;
   717		int idx;
   718	
   719		amd_brs_enable_all();
   720	
   721		for (idx = 0; idx < x86_pmu.num_counters; idx++) {
   722			hwc = &cpuc->events[idx]->hw;
   723	
   724			/* only activate events which are marked as active */
   725			if (!test_bit(idx, cpuc->active_mask))
   726				continue;
   727	
   728			amd_pmu_enable_event(cpuc->events[idx]);
   729		}
   730	}
   731	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
