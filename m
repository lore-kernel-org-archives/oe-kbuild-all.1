Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C878B345757
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 07:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765956875; cv=none; b=a+peYWFMkfmTlSr1YHoJmmJ/F43eD3HChIIYxtrvri6UvrGg2XUzeUUNjz0Dm2LIH5GPj/AKgOUC1o/F2s6hpklX7HOl7TH6VGn8yFT/6xdkY0tTMfianBnalYkEav6lebyqc6aZC0YkVyFX+eV3vXO6A5mOtvNDKdBYbNGagHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765956875; c=relaxed/simple;
	bh=1gpaUzzWxqhiO9l6eizBUS8gP8KifwzwMookH4mQIHE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o5zpSORDMXCccpZIlKVbm8ELlFuXM3UMvD9MruLQX5oO90vtNhdAXwKy7Jv5Be2B0lJVClJTy43N+BZ/zyQExyNbaoe7r4DMjxVq+DJ/n6t6Vuvpo4foPeIiCRtxcoC59hJxZ0cw7bIiex2yIvNiMm7nbKWewl1qYGv9e++/lkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YHOpt4e2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YHOpt4e2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765956873; x=1797492873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1gpaUzzWxqhiO9l6eizBUS8gP8KifwzwMookH4mQIHE=;
  b=YHOpt4e2hRNk3A48wxyFVOwbOFEmdco99kCZoSGakRyxxKY0BsBHwQp2
   mKlq5NVj3DvzQUlTNXrmqwiHI80icNUZae3ZpInuCx10H5+d0212RtGxQ
   SvfRa8JxRwbMMTbCuC/h6LWUJ2J/SREV/6xJz/FcG5CGcj9VaEUwQfilR
   cmY19FcVVHTmhKfu3/XvmJp5awZtkKL/4Yb0IB0/xur08hL1AGk/oWHXb
   1+KzIE6CPEYn06vKTLqf3NumdmcP41nup1knilNNbuL5QgrUxWw08eXS2
   HXVnpNgVRZtZHMtRajo3rAG+bw78ky5lm6KyLYRYL9USmJm48TvRGEQij
   w==;
X-CSE-ConnectionGUID: fowS0YcwR0mC/2i7e3pSpQ==
X-CSE-MsgGUID: 3bziR5c+RxqcS7bdS3sjsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="70466157"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="70466157"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 23:34:19 -0800
X-CSE-ConnectionGUID: L1kq6ND1Ru+WvgyL5lLsOg==
X-CSE-MsgGUID: Ni/COINiRgmNvnLhUAX7HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="202733146"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Dec 2025 23:34:18 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVm35-000000000AJ-2qzl;
	Wed, 17 Dec 2025 07:34:15 +0000
Date: Wed, 17 Dec 2025 15:34:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/kvm/hyp/nvhe/trace.c:174:15: warning: no previous prototype for
 function 'rb_event_size'
Message-ID: <202512171529.pJEGRQzQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e48fbb6a53e582d8881d31d6b3de0405f7543cfd
commit: 794f874404060e7e14863872950b53e6a7aa9b68 [2/2] ANDROID: KVM: arm64: Add tracing support for the nVHE hyp
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251217/202512171529.pJEGRQzQ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512171529.pJEGRQzQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512171529.pJEGRQzQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/trace.c:7:
   In file included from arch/arm64/kvm/hyp/include/nvhe/clock.h:6:
   In file included from arch/arm64/include/asm/kvm_hyp.h:11:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/trace.c:134:49: warning: variable 'new_head' set but not used [-Wunused-but-set-variable]
     134 |         struct hyp_buffer_page *tail_page, *new_tail, *new_head;
         |                                                        ^
>> arch/arm64/kvm/hyp/nvhe/trace.c:174:15: warning: no previous prototype for function 'rb_event_size' [-Wmissing-prototypes]
     174 | unsigned long rb_event_size(unsigned long length)
         |               ^
   arch/arm64/kvm/hyp/nvhe/trace.c:174:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     174 | unsigned long rb_event_size(unsigned long length)
         | ^
         | static 
   7 warnings generated.


vim +/rb_event_size +174 arch/arm64/kvm/hyp/nvhe/trace.c

   173	
 > 174	unsigned long rb_event_size(unsigned long length)
   175	{
   176		struct ring_buffer_event *event;
   177	
   178		return length + RB_EVNT_HDR_SIZE + sizeof(event->array[0]);
   179	}
   180	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
