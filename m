Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4E331065A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Dec 2025 22:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767048107; cv=none; b=lYENcGAlyGXnSKu9GHjK5Z67+Dv46EiXH3U1Xg61raeuZ+CaD2UoWWJttbadSw0p4hSLtfFgFUK9qvQ3KflK+E15PTxHX6qgDCqj13nCnCBQ6EROmf4Gzi956eBy2MkbtDEinzWi3350831JNftwfKbZmlpOBjPTiVktMwWvcnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767048107; c=relaxed/simple;
	bh=E/diWKKnI9oefl2ok6xsnvX57dmSV/YhOP/7AXEv2IE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JL5JC+hK93iab9umRYfNUlb8WwPsS3lrN5kOvT9nFpRZ93vkax8JVD4R2gnTo04SmjNCpHye036V9ZaMj+RayY8sktU4sNSZXEQkxq0jcRfpSMDVWdyI7Gi/wBIIYhmpo9DuNgWOUnowOOkLxDVBavT/THJfdByNzRTMixbqS70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FLsIuPM0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FLsIuPM0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767048105; x=1798584105;
  h=date:from:to:cc:subject:message-id;
  bh=E/diWKKnI9oefl2ok6xsnvX57dmSV/YhOP/7AXEv2IE=;
  b=FLsIuPM0QfHLU6b/JLByPb3L8nm1S6TUVhfL0WFQzUXkIBxqLMYvt8M+
   FRDwfrf9gkZ8NhZB1sWXGftSls7TcaLbglCXy4ieA6PG3ZP47/x1Xjkd2
   6rycnpyQ1/WEhY9UkYkAf92uMRyxvVq4+cHT6VAldyhBf1dhs+zgGCe7u
   CDxw6xMaAIK35qh7qL+tdemKSl4l3qxq+Zbe0/q9pALXn1TQIzUquPx6+
   GzdxtgjeYj+yE6rQuOWtMjl0JRgfSw9P2drNbzBcDNUOLhVrI9PJpkQES
   Zx4CKcE7DTsK7+MSIau+COfCAFX+AMM3T5qoQYbEOfTBbZKTU0kSFKKHn
   w==;
X-CSE-ConnectionGUID: Jy0k8nuHT4maFG7XOQX4sg==
X-CSE-MsgGUID: zK+8/GWKQlGENzfZPsazuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="72273686"
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="72273686"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 14:41:45 -0800
X-CSE-ConnectionGUID: oKYtzMdAQpaBXmqGZ3m7dQ==
X-CSE-MsgGUID: ZdFOJUErReOVc3b6qCHBtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="201007469"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 29 Dec 2025 14:41:43 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaLvb-00000000865-3VId;
	Mon, 29 Dec 2025 22:41:29 +0000
Date: Tue, 30 Dec 2025 06:40:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1]
 drivers/android/debug_symbols.c:47:9: sparse: sparse: cast removes address
 space '__percpu' of expression
Message-ID: <202512300652.30m8OYJ9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   a0f93b828ee5433c5b427d8122a6dda0b514d985
commit: 3fcbb15c1a91a318fb9367bee24603af24648a2d [1/1] ANDROID: android: Create debug_symbols driver
config: arm64-randconfig-r122-20251224 (https://download.01.org/0day-ci/archive/20251230/202512300652.30m8OYJ9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251230/202512300652.30m8OYJ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512300652.30m8OYJ9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/debug_symbols.c:47:9: sparse: sparse: cast removes address space '__percpu' of expression

vim +/__percpu +47 drivers/android/debug_symbols.c

    41	
    42	/*
    43	 * ads_per_cpu_entries array contains all the per_cpu variable address information.
    44	 */
    45	static const struct ads_entry ads_per_cpu_entries[ADS_DEBUG_PER_CPU_END] = {
    46	#ifdef CONFIG_ARM64
  > 47		ADS_PER_CPU_ENTRY(ADS_IRQ_STACK_PTR, irq_stack_ptr),
    48	#endif
    49	#ifdef CONFIG_X86
    50		ADS_PER_CPU_ENTRY(ADS_IRQ_STACK_PTR, hardirq_stack_ptr),
    51	#endif
    52	};
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
