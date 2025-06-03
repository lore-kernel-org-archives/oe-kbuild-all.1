Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066D019066D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Jun 2025 07:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748934946; cv=none; b=aJMKKcNZFvUsry5wJF9xaIemKYdZAF3ZSxXYUI4iOYZci07XmUB9Nj07SldlZ9DVkqXMp3OfQfSNqtgVhNGT7lKejZVoP34mIIc1QWw/70YqdzZAi/3tVV5aqJW1f+pu2uvEuYEnGQzn6wOZX3BqiRiutY9e1AmQPDy3/dkdZ7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748934946; c=relaxed/simple;
	bh=/inthWLWbgDBjmik6wy0zvKMgMjAT5IhnxD76SloLSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m0HOmcFyvN/ZkEVPnJnqPHXRkpPsmAaxxFZetDFN8oxWShA7y9lu4M85s7whe8NBDzOkcgdkUe65NGUyXcxA+r730QjrCs7oWkU3Vqnud0uvg9aGYhr1e1yx+yrX6pRzJFdpYfv0gkrthmCSujlu5JOYVnEaL8bORrSEM2a4RGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jyEbQLxX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jyEbQLxX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748934944; x=1780470944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/inthWLWbgDBjmik6wy0zvKMgMjAT5IhnxD76SloLSw=;
  b=jyEbQLxXF8djybhBKC2+N1aDU2nfLEk+gd06vXCPdkCJXNTyrwS0Z1Xj
   gdL5Yu2duDB1UmHbV1Z0K/ASvaE8gP6Vn84fQAGTscXMuXKsACCMNuZ+Z
   Jz9t51LsYI2RT4s/rsiGKBEtQCkDGnocgNpw+uJLgsmW/gCS/+GT2+x+L
   T4NSYYo3ONOCeE9rMlwCjJSc6bUkZ6jImVxn3S9zYR44jko62nI1mLDYV
   1HORbmJmfuGXvHChsyA1yO6By7mRe6GijjUxcebeg77b1xUoUb0Jdh1gX
   n9pmZSCKhuNxi5NOWqhbOEUnldSnmRf3kSQ3kMSdAAmdMIc4q58hsf5nw
   w==;
X-CSE-ConnectionGUID: OZbgVRtTR0K+sGaqx9/myg==
X-CSE-MsgGUID: yFFgW0KWRQiimwYj/cJq0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="62016827"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="62016827"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 00:15:43 -0700
X-CSE-ConnectionGUID: 5I43hB6dQ8i6gjDHR8UPuA==
X-CSE-MsgGUID: Oyv2KKd4TeyN5Xl3oo9h8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="145263885"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Jun 2025 00:15:41 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMLs3-0001Rq-1o;
	Tue, 03 Jun 2025 07:15:39 +0000
Date: Tue, 3 Jun 2025 15:15:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2195/2195]
 arch/x86/events/zhaoxin/uncore.c:2761:6: warning: no previous prototype for
 'kx5000_uncore_cpu_init'
Message-ID: <202506031554.QV1bCcG7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   97c2d1a4aa1430a6305c949fa1f72efe454c946d
commit: dc5b97374ba722156acbdfc4e3adbc69e2dbe7f4 [2195/2195] perf/x86/zhaoxin/uncore: Add KX-7000 support
config: x86_64-buildonly-randconfig-2002-20250502 (https://download.01.org/0day-ci/archive/20250603/202506031554.QV1bCcG7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250603/202506031554.QV1bCcG7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506031554.QV1bCcG7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/events/zhaoxin/uncore.c:2761:6: warning: no previous prototype for 'kx5000_uncore_cpu_init' [-Wmissing-prototypes]
    2761 | void kx5000_uncore_cpu_init(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/events/zhaoxin/uncore.c:2770:6: warning: no previous prototype for 'kh40000_uncore_cpu_init' [-Wmissing-prototypes]
    2770 | void kh40000_uncore_cpu_init(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/events/zhaoxin/uncore.c:2775:5: warning: no previous prototype for 'kh40000_uncore_pci_init' [-Wmissing-prototypes]
    2775 | int kh40000_uncore_pci_init(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/zhaoxin/uncore.c:2791:6: warning: no previous prototype for 'kx8000_uncore_cpu_init' [-Wmissing-prototypes]
    2791 | void kx8000_uncore_cpu_init(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/zhaoxin/uncore.c:2796:5: warning: no previous prototype for 'kx8000_uncore_pci_init' [-Wmissing-prototypes]
    2796 | int kx8000_uncore_pci_init(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/zhaoxin/uncore.c:2804:6: warning: no previous prototype for 'kx8000_uncore_mmio_init' [-Wmissing-prototypes]
    2804 | void kx8000_uncore_mmio_init(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/kx5000_uncore_cpu_init +2761 arch/x86/events/zhaoxin/uncore.c

  2760	
> 2761	void kx5000_uncore_cpu_init(void)
  2762	{
  2763		uncore_msr_uncores = kx5000_msr_uncores;
  2764	}
  2765	
  2766	static const struct zhaoxin_uncore_init_fun kx5000_uncore_init __initconst = {
  2767		.cpu_init = kx5000_uncore_cpu_init,
  2768	};
  2769	
> 2770	void kh40000_uncore_cpu_init(void)
  2771	{
  2772		uncore_msr_uncores = kh40000_msr_uncores;
  2773	}
  2774	
> 2775	int kh40000_uncore_pci_init(void)
  2776	{
  2777		int ret = kh40000_pci2node_map_init();/*pci_bus to package mapping, do nothing*/
  2778	
  2779		if (ret)
  2780			return ret;
  2781		uncore_pci_uncores = kh40000_pci_uncores;
  2782		uncore_pci_driver = &kh40000_uncore_pci_driver;
  2783		return 0;
  2784	}
  2785	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
