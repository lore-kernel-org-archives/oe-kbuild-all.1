Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ED825CC73
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 23:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747784930; cv=none; b=kiPX984ao+rYuJPhFU+CPnHBJjZvc2YDA1cw3kRio44uIRyZhiESULR6rRY/Vk+FnR4IvffIEKrSZ6aIhwmsLdfRGGgFBKmyZyQebhU0KkMgyX7tfEce4QNvym92J8IGq8O35mu4uEzwiBy4wHBrboNZ7AMrx4acCsy/YfWmOY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747784930; c=relaxed/simple;
	bh=qK9KfpF+RCiYkwa4Z4USuVJnQ/rRg7+g/eR/EwdA/4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L980Ru5XhMXNygJeesN5FU9twOypARqMoVd10NWurgNRcM5VdRSKSXjs3hNx0wRhw6OcCUUXfplj9IFPdcPFXIJhPIDK7gAyCkcux5Lr9UJp8WvhYbGPK7rvZu7FwfKLYo4+bSmIhmqSXMdxkwkFLz9heuy121/+btMYMuUT/zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jKBKjY9L; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jKBKjY9L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747784929; x=1779320929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qK9KfpF+RCiYkwa4Z4USuVJnQ/rRg7+g/eR/EwdA/4k=;
  b=jKBKjY9L6776+g+0lYp14sU1KTOyjLGJFyWbC63QDgdJXZq/QvURonVa
   M9nh0ETLUnkayqwe60HQGymHKQABxOacDDpLvluCiTSRUsDg4K6DaL4wL
   oNWU5m4J2I0N4MzQ255H/Yn1//HHxLSHUu6tqXdYS25qtVr1tYvPkgciB
   jlAFcj4fFaN7K2B9shFuh35faEEbg5UAWuPChIF+bXINZd+UANdG4rImI
   elD3nFAXAXXuZQyDJ9yuGM5Ofvh/Peei9uCEgKQriMwDxBjF5DXPpTuwB
   V1i1P6wRv6cfl+sTb0CMXEyHuqXGIC32MuQL7bCBWPwfMI1P/kGIaTr8F
   A==;
X-CSE-ConnectionGUID: 3wi6wPaWREyIpuqvov+hMQ==
X-CSE-MsgGUID: fhHiI6JFSq6joXmvUL+CEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49898256"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49898256"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 16:48:49 -0700
X-CSE-ConnectionGUID: Jcm4GjywQkOZnDh+eApcDA==
X-CSE-MsgGUID: kE6lRB7KS9GBk5WN4KNpPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="140782406"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 May 2025 16:48:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHWhR-000Ng0-0f;
	Tue, 20 May 2025 23:48:45 +0000
Date: Wed, 21 May 2025 07:48:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2263/2263] mm/mem_sampling.c:37:6: warning: no
 previous prototype for function 'mem_sampling_record_cb_register'
Message-ID: <202505210722.gwnDsvxy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   dea1e68d661266b45b33cc596c34b451de95000c
commit: cc5f4f44852f9eb4feb22a40cbb4e3d1b10c36a0 [2263/2263] mm_monitor/mm_spe: Add PMU based memory sampling abstract layer
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250521/202505210722.gwnDsvxy-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210722.gwnDsvxy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210722.gwnDsvxy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/mem_sampling.c:37:6: warning: no previous prototype for function 'mem_sampling_record_cb_register' [-Wmissing-prototypes]
      37 | void mem_sampling_record_cb_register(mem_sampling_record_cb_type cb)
         |      ^
   mm/mem_sampling.c:37:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      37 | void mem_sampling_record_cb_register(mem_sampling_record_cb_type cb)
         | ^
         | static 
>> mm/mem_sampling.c:54:6: warning: no previous prototype for function 'mem_sampling_record_cb_unregister' [-Wmissing-prototypes]
      54 | void mem_sampling_record_cb_unregister(mem_sampling_record_cb_type cb)
         |      ^
   mm/mem_sampling.c:54:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      54 | void mem_sampling_record_cb_unregister(mem_sampling_record_cb_type cb)
         | ^
         | static 
   mm/mem_sampling.c:67:6: warning: no previous prototype for function 'mem_sampling_process' [-Wmissing-prototypes]
      67 | void mem_sampling_process(void)
         |      ^
   mm/mem_sampling.c:67:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      67 | void mem_sampling_process(void)
         | ^
         | static 
   3 warnings generated.


vim +/mem_sampling_record_cb_register +37 mm/mem_sampling.c

    36	
  > 37	void mem_sampling_record_cb_register(mem_sampling_record_cb_type cb)
    38	{
    39		struct mem_sampling_record_cb_list_entry *cb_entry, *tmp;
    40	
    41		list_for_each_entry_safe(cb_entry, tmp, &mem_sampling_record_cb_list, list) {
    42			if (cb_entry->cb == cb)
    43				return;
    44		}
    45	
    46		cb_entry = kmalloc(sizeof(struct mem_sampling_record_cb_list_entry), GFP_KERNEL);
    47		if (!cb_entry)
    48			return;
    49	
    50		cb_entry->cb = cb;
    51		list_add(&(cb_entry->list), &mem_sampling_record_cb_list);
    52	}
    53	
  > 54	void mem_sampling_record_cb_unregister(mem_sampling_record_cb_type cb)
    55	{
    56		struct mem_sampling_record_cb_list_entry *cb_entry, *tmp;
    57	
    58		list_for_each_entry_safe(cb_entry, tmp, &mem_sampling_record_cb_list, list) {
    59			if (cb_entry->cb == cb) {
    60				list_del(&cb_entry->list);
    61				kfree(cb_entry);
    62				return;
    63			}
    64		}
    65	}
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
