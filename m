Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D2FDDA0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 02:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726453728; cv=none; b=VZarHzgEYnduxpJc5SylqLYdj0iQxex0f6WkjXD1jovSzPi71DIhI2pwPMccXdni1hSel81aKAtvakYfdZ7IeUY45Vmhf31pYoNV8fXDxg7qI64Y2ZlZ2quLFVaTZB39lbL77EhLjBrLUv8h8NLlijXaS3Eagt/B2Nb5A/qhfzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726453728; c=relaxed/simple;
	bh=ZMGytmPYLqhXRaQ5670qPn5MWevM10lj/+w0qvhO4eA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RdyjDmiUSKJVNcqQYVHP+vPMD1bS6uxM+WA1k1i13DHvjS26z7LXaoWLQrYkcCQIwWlkxDHQH4GZ3iBB2o4EnYDpsNFGVNnrrG+JI3jkj83r3BzHX8RisDvrCG0OL1Tjw7+rsvXD9UTaHRB7BTz+WO1l2XsO/GlVo8lHFbL11l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dmIQDKUv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dmIQDKUv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726453726; x=1757989726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZMGytmPYLqhXRaQ5670qPn5MWevM10lj/+w0qvhO4eA=;
  b=dmIQDKUvwjNFFk+VS7IsN8ITr4rXfQxtDwvIhP76V1+xCCq69EF3jl4U
   lMPZV8+YsvIf0t4qUSe9PkegHC40DC4oR3yYI9ahK4PuaRUDq0IYltx/i
   7eH5lq9Gc6r5W4T7hlfbnMtkT3sYi2oE5ODtXZ/z+9kfSUgtQxEwp6N6L
   WVUS2DgaRN0CegRguvANk3gwiLxgwjNrrZ8UvDuGAZyKHVVrzL4C57X2E
   D0nVLHVhsG78kf9xyOxEQIHoDx32Nf9qyCaybsh9ymjipMnnAuBoyKs7o
   uMKwuke+7N2bVUd0FzjAShyFWJOtYGD/+zWkjvYk/uEatoEwaj3yJTquG
   Q==;
X-CSE-ConnectionGUID: zbIGGhiVRoqfBGpdiIDNxw==
X-CSE-MsgGUID: I49MxOK0SVitxUIH0ComIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="25479127"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="25479127"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 19:28:45 -0700
X-CSE-ConnectionGUID: R6eBMaxmTwGFOGsUKlMDhg==
X-CSE-MsgGUID: 4Kzz2mb5S7q84JnADvde2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="73335020"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Sep 2024 19:28:44 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq1Tm-0009FM-0x;
	Mon, 16 Sep 2024 02:28:42 +0000
Date: Mon, 16 Sep 2024 10:27:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 7/24]
 arch/arm64/kvm/hyp_events.c:260:25: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202409161020.8Pt073dj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   1fa94a14074632ecff57ab73a2c9677521b7524f
commit: 78bed703d25530454c49f696c15ffaa7c02bfeb2 [7/24] ANDROID: KVM: arm64: Allow registration of pKVM module hyp events
config: arm64-randconfig-r122-20240915 (https://download.01.org/0day-ci/archive/20240916/202409161020.8Pt073dj-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20240916/202409161020.8Pt073dj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409161020.8Pt073dj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kvm/hyp_events.c: note: in included file (through arch/arm64/include/asm/kvm_define_hypevents.h):
   arch/arm64/include/asm/kvm_hypevents.h:14:1: sparse: sparse: symbol 'hyp_event_trace_hyp_enter' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:23:1: sparse: sparse: symbol 'hyp_event_trace_hyp_exit' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:32:1: sparse: sparse: symbol 'hyp_event_trace_host_hcall' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:46:1: sparse: sparse: symbol 'hyp_event_trace_host_smc' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:61:1: sparse: sparse: symbol 'hyp_event_trace_host_mem_abort' was not declared. Should it be static?
   arch/arm64/kvm/hyp_events.c: note: in included file (through arch/arm64/include/asm/kvm_define_hypevents.h):
   arch/arm64/include/asm/kvm_hypevents.h:14:1: sparse: sparse: symbol 'hyp_event_hyp_enter' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:23:1: sparse: sparse: symbol 'hyp_event_hyp_exit' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:32:1: sparse: sparse: symbol 'hyp_event_host_hcall' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:46:1: sparse: sparse: symbol 'hyp_event_host_smc' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:61:1: sparse: sparse: symbol 'hyp_event_host_mem_abort' was not declared. Should it be static?
>> arch/arm64/kvm/hyp_events.c:260:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/hyp_events.c:260:25: sparse:    struct hyp_event_table [noderef] __rcu *
   arch/arm64/kvm/hyp_events.c:260:25: sparse:    struct hyp_event_table *
   arch/arm64/kvm/hyp_events.c:379:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/hyp_events.c:379:18: sparse:    struct hyp_event_table [noderef] __rcu *
   arch/arm64/kvm/hyp_events.c:379:18: sparse:    struct hyp_event_table *
   arch/arm64/kvm/hyp_events.c:379:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/hyp_events.c:379:18: sparse:    struct hyp_event_table [noderef] __rcu *
   arch/arm64/kvm/hyp_events.c:379:18: sparse:    struct hyp_event_table *

vim +260 arch/arm64/kvm/hyp_events.c

   245	
   246	#define nr_events(__start, __stop) \
   247		(((unsigned long)__stop - (unsigned long)__start) / sizeof(*__start))
   248	
   249	struct hyp_event *hyp_trace_find_event(int id)
   250	{
   251		struct hyp_event *event = __hyp_events_start + id;
   252	
   253		if ((unsigned long)event >= (unsigned long)__hyp_events_end) {
   254			struct hyp_event_table *table;
   255	
   256			event = NULL;
   257			id -= nr_events(__hyp_events_start, __hyp_events_end);
   258	
   259			rcu_read_lock();
 > 260			table = rcu_dereference(mod_event_tables.tables);
   261	
   262			for (int i = 0; i < mod_event_tables.nr_tables; i++) {
   263				if (table->nr_events < id) {
   264					id -= table->nr_events;
   265					table++;
   266					continue;
   267				}
   268	
   269				event = table->start + id;
   270				break;
   271			}
   272			rcu_read_unlock();
   273		}
   274	
   275		return event;
   276	}
   277	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
