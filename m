Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3627E1E834B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 May 2026 01:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779586030; cv=none; b=kUcCGnsg9U4wdrMMleuhooIEqQLgPHAL7LAV4j/R2x5yUslWksNYdua7ftpi9LmggyX6m20pzw7M/zhYmsFWxXnb6L5MLr2Arhw97f2c8rJ4A+EQLmHF0hEAswgBLNhaMkwKBkTinKBAuvzUMp+QA5IDKKlG98R6XBkdKFmy1HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779586030; c=relaxed/simple;
	bh=q0rm5gmwcX3O4pFDeOP2+vVMC1RYxYrCSYEBjloSt3o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i+zYhDlZwHXEGNboniKwgTXVGv+ki78jmQZAae4tFoFvNvRaF6dF/UmG4gPvENnCP91gbKbzGGohEHm8QrxHOGA+ifZKgXJNoXc3FBs51qEEexwwUyjEE1Qe83N7KR6coCn+646BnNPbjKWEt43A0wETQmJ8JRMMmuTfNqQ36vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NzElZ/dH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NzElZ/dH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779586028; x=1811122028;
  h=date:from:to:cc:subject:message-id;
  bh=q0rm5gmwcX3O4pFDeOP2+vVMC1RYxYrCSYEBjloSt3o=;
  b=NzElZ/dHHiBckBhexnbYKeYa/SLoFq2rmHxG41tdzG9fcNPB7e/pYp4m
   jxyBs9W/uYT3oUCMWw9bLe7+VizIUAhQECB/OjwJ1g/xSp1mKVflGH63I
   4ZXz1lHfNL5DyI3DheZm2vDAO44eU+x1WFwiw/ywNYS9RKKcPRIBXV5Uh
   bT7HxgYQIQZ1RITNV4w2e40FVy0dp37c7ysdpkNAWkq2td58o4WlR6P3R
   a24RX4soxLc5YDFSbAHJPcjDX2GO5EjMazRWrZoR8HGUNuMIYvWPgLxFq
   O2F80TR+400Cjgjza+0TDdVXZZsEde6A4zKQhsEC84YNeEzpbuiBM09YH
   Q==;
X-CSE-ConnectionGUID: mzp6qF6JR3yRpqP3ZWOPXw==
X-CSE-MsgGUID: utWmRxZ0RpidYjgVC7ObgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="80367975"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="80367975"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 18:27:08 -0700
X-CSE-ConnectionGUID: nQmRNVZUQTyBtEGc41BvZA==
X-CSE-MsgGUID: ZaMwpUvSSwC6NaOludoVxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="237043998"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 May 2026 18:27:06 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQxcN-000000000XV-335r;
	Sun, 24 May 2026 01:27:03 +0000
Date: Sun, 24 May 2026 09:26:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Tejun Heo <tj@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>
Subject: [tj-sched-ext:arena-direct-v4 58/64]
 kernel/bpf/core.c:3293:13: error: redefinition of
 'bpf_arena_handle_page_fault'
Message-ID: <202605240931.MV0LSvkS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git arena-direct-v4
head:   2d25ba3fed37e8da4b3c91d6bf5d209e2ca5f8d6
commit: 96960690387e0641d86fd9fefa49ee3210aa2208 [58/64] bpf: Recover arena kernel faults with scratch page
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20260524/202605240931.MV0LSvkS-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605240931.MV0LSvkS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605240931.MV0LSvkS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/core.c:3293:13: error: redefinition of 'bpf_arena_handle_page_fault'
    3293 | __weak bool bpf_arena_handle_page_fault(unsigned long addr, bool is_write,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bpf.h:9,
                    from include/linux/filter.h:9,
                    from kernel/bpf/core.c:21:
   include/linux/bpf_defs.h:12:20: note: previous definition of 'bpf_arena_handle_page_fault' with type 'bool(long unsigned int,  bool,  long unsigned int)' {aka '_Bool(long unsigned int,  _Bool,  long unsigned int)'}
      12 | static inline bool bpf_arena_handle_page_fault(unsigned long addr, bool is_write,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_arena_handle_page_fault +3293 kernel/bpf/core.c

  3282	
  3283	/* for configs without MMU or 32-bit */
  3284	__weak const struct bpf_map_ops arena_map_ops;
  3285	__weak u64 bpf_arena_get_user_vm_start(struct bpf_arena *arena)
  3286	{
  3287		return 0;
  3288	}
  3289	__weak u64 bpf_arena_get_kern_vm_start(struct bpf_arena *arena)
  3290	{
  3291		return 0;
  3292	}
> 3293	__weak bool bpf_arena_handle_page_fault(unsigned long addr, bool is_write,
  3294						unsigned long fault_ip)
  3295	{
  3296		return false;
  3297	}
  3298	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
