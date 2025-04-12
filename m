Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85431193436
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Apr 2025 22:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744496833; cv=none; b=qMQr2UEuYsX59zcXXhSOqon/8UCEpIyRHWt0f9iVKbRiEQfstRflsuFlV8f7DuDdkbCLYIn34684tvjK7Y3miyqy/h5rQiApPs50yNBtx4O0uoHj0Ng1lEitnMyt2c3geLuAYpaC8nYBZF8EN3M8qUzHwl86F4+UOmboOFKwzJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744496833; c=relaxed/simple;
	bh=N2sQGTIMJd7g+guY4J1RF0Ix/9hkmDul+gfS+SQJ7zQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eSDJk0zn+nTlgw/yJhtCt9VcSlDNL/BvmkfLBkJUwl635DVvBmH3ULbyLyaxgR3Zp/3WBxEm0BtBaw6wwZUzlKoOf7cE9yj3pWXV5/AF2rFU1jRTPvQTPIsqScnJEN7tsRZiZjtmZsjZsjeB10e84tKwkeue44M1zwjUCjcTbL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UuKdOxNT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UuKdOxNT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744496832; x=1776032832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N2sQGTIMJd7g+guY4J1RF0Ix/9hkmDul+gfS+SQJ7zQ=;
  b=UuKdOxNTzxQT7U2r8soKCN18ss4iRd/mDRHN7wCv4BLQcbctp3e1jalk
   OH0cZk6FlqbdVN3hzClL4WH+NacxN6C2sRQNegf6cZnjmfgjl8aQEQYNE
   5+8fI/kGSSBF6X5n+sY28101kJFkIJcUoHwN+Ht7b31KLFMsK6paNf1kc
   iTa7uUfF8w/xdchN2oufRd3TEMO7ZoXAB/zz/nE2O9X1sc74CWMgCQURm
   uyHtO0BYoUa78m5y463dvNcKZCvXXZSE2d7blFab5B86Ei8Q4dFlLbH5w
   jPo77mFgtTpuYQ+tdhx2AHApNu9nMfi9FhVLKxdfNkHq3SttKI7nW4w54
   w==;
X-CSE-ConnectionGUID: zosfDTrMQpqIcX+NcKPqzg==
X-CSE-MsgGUID: tbDVzSU4QxaGruVPyU1YsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="71395512"
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="71395512"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 15:27:11 -0700
X-CSE-ConnectionGUID: FJwukCfhQEiHf4NvaBoyng==
X-CSE-MsgGUID: iPggAJxpR7KebsIMaBqljg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="129490428"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Apr 2025 15:27:10 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3jJb-000CBO-2L;
	Sat, 12 Apr 2025 22:27:07 +0000
Date: Sun, 13 Apr 2025 06:27:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1]
 include/trace/events/rwmmio.h:13:1: sparse: sparse: cast removes address
 space '__iomem' of expression
Message-ID: <202504130647.h9Hkbe3b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   f0ea2e9acc1e26a4ecd7a0f40f601bbe3d1fd691
commit: c7b6c40553f8ae90617595cc851e19520fbd945b [1/1] FROMLIST: tracing: Add register read/write tracing support
config: arm64-randconfig-r111-20250413 (https://download.01.org/0day-ci/archive/20250413/202504130647.h9Hkbe3b-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce: (https://download.01.org/0day-ci/archive/20250413/202504130647.h9Hkbe3b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504130647.h9Hkbe3b-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/trace_readwrite.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/rwmmio.h):
>> include/trace/events/rwmmio.h:13:1: sparse: sparse: cast removes address space '__iomem' of expression
   include/trace/events/rwmmio.h:38:1: sparse: sparse: cast removes address space '__iomem' of expression
   include/trace/events/rwmmio.h:63:1: sparse: sparse: cast removes address space '__iomem' of expression
   include/trace/events/rwmmio.h:85:1: sparse: sparse: cast removes address space '__iomem' of expression
   kernel/trace/trace_readwrite.c:16:6: sparse: sparse: symbol 'log_write_mmio' was not declared. Should it be static?
   kernel/trace/trace_readwrite.c:24:6: sparse: sparse: symbol 'log_post_write_mmio' was not declared. Should it be static?
   kernel/trace/trace_readwrite.c:32:6: sparse: sparse: symbol 'log_read_mmio' was not declared. Should it be static?
   kernel/trace/trace_readwrite.c:40:6: sparse: sparse: symbol 'log_post_read_mmio' was not declared. Should it be static?

vim +/__iomem +13 include/trace/events/rwmmio.h

    12	
  > 13	TRACE_EVENT(rwmmio_write,
    14	
    15		TP_PROTO(unsigned long caller, u64 val, u8 width, volatile void __iomem *addr),
    16	
    17		TP_ARGS(caller, val, width, addr),
    18	
    19		TP_STRUCT__entry(
    20			__field(u64, caller)
    21			__field(u64, val)
    22			__field(u64, addr)
    23			__field(u8, width)
    24		),
    25	
    26		TP_fast_assign(
    27			__entry->caller = caller;
    28			__entry->val = val;
    29			__entry->addr = (unsigned long)(void *)addr;
    30			__entry->width = width;
    31		),
    32	
    33		TP_printk("%pS width=%d val=%#llx addr=%#llx",
    34			(void *)(unsigned long)__entry->caller, __entry->width,
    35			__entry->val, __entry->addr)
    36	);
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
