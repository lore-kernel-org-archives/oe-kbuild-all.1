Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256DC3502A7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 18:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778609818; cv=none; b=R7SbIbti8gjquCddlyxHTN34nFrFy/c6NbA//soKLlGiWvfp2GwoeE+2xJu+huTH7qlGC2dV2yGtghMaE8o60KibPqNbtYIrDk0M5QnqNE+eEw/oGoa42b42Qd58E+v092qCk1V123elN42BgQJIUHKqI1vzf90byycPciYXyBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778609818; c=relaxed/simple;
	bh=puW0xaHVsaeQRDWH1MtdH7A1fjS7EmIqoc8POQxDsyM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oebDRgZshW5QCDSe3m9+Ap4BAAzWKup0lRVimXaF9C2B1kkl+QMdJTlSf0rbN3y+mTaeQhw81VnJL9FSqvERe6CZqXyGWoi+Kihk68OrruOcv/3JB4zlAu3qcJCbpTQ5XuA0nL5Y6F9X7P6LkoxRaAQJZMmrgwrpCggqwb4xfIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vx5j6cOx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vx5j6cOx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778609817; x=1810145817;
  h=date:from:to:cc:subject:message-id;
  bh=puW0xaHVsaeQRDWH1MtdH7A1fjS7EmIqoc8POQxDsyM=;
  b=Vx5j6cOxBtniKCseJsAnQIZDn8/zFGSEyHwsyYf3n2p5wH+rzt/28joP
   778/gvaeoe4Jl2tozE2Oe5psN6s8dgB0XVZr/Cz6TJRJSbkrocqtrvNhh
   AUj6FNzPImsj7VK4YnWrjKTUVd81OfvZDq97zpbvW6WL/VIR7vpJdmnJA
   mVJYiSDvJ3ZQhbdiwX6fuPH4jtbwPxcbg1rR950h7UF181ALClF6oH0Pd
   /PMDtW8+IJ1slNbjP9R2ZXs/wGWvsah+OfdJVUjKQW0N4PUvN6mlHPgoe
   yexG6rKZ6ko5GfHJikzr9ayp0/gznxQeEobxxXi1YcJ6zGHcqXFD4jo0d
   w==;
X-CSE-ConnectionGUID: IGr4yo52QvSc6L49Y6aWvA==
X-CSE-MsgGUID: BLZX6cZST3O5ZxLMZhOXQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79243361"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="79243361"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 11:16:56 -0700
X-CSE-ConnectionGUID: kWEp0yjDRoylRqXJWDDCLg==
X-CSE-MsgGUID: DMN6elYOSpOSGfdZviRJMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="239654374"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 May 2026 11:16:54 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMrf2-000000002a3-2Hg8;
	Tue, 12 May 2026 18:16:52 +0000
Date: Wed, 13 May 2026 02:15:55 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/gpc_fixes_and_guards 10/20]
 include/linux/kvm_types.h:78:23: error: 'PAGE_SHIFT' undeclared
Message-ID: <202605130230.kO0TCxad-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/gpc_fixes_and_guards
head:   d5f8f54e5db2370ba0d38cf5ad6a498e5e903b21
commit: 1fe323d467df5946f616c9e6d497775278f4a359 [10/20] KVM: Move {g,p}fn <=> {g,h}pa conversion helpers to kvm_types.h
config: riscv-randconfig-001-20260512 (https://download.01.org/0day-ci/archive/20260513/202605130230.kO0TCxad-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130230.kO0TCxad-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605130230.kO0TCxad-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/kvm/iodev.h:6,
                    from arch/riscv/kvm/../../../virt/kvm/coalesced_mmio.c:12:
   include/linux/kvm_types.h: In function 'gfn_to_gpa':
>> include/linux/kvm_types.h:78:23: error: 'PAGE_SHIFT' undeclared (first use in this function)
      78 |  return (gpa_t)gfn << PAGE_SHIFT;
         |                       ^~~~~~~~~~
   include/linux/kvm_types.h:78:23: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/kvm_types.h: In function 'gpa_to_gfn':
   include/linux/kvm_types.h:83:24: error: 'PAGE_SHIFT' undeclared (first use in this function)
      83 |  return (gfn_t)(gpa >> PAGE_SHIFT);
         |                        ^~~~~~~~~~
   include/linux/kvm_types.h: In function 'pfn_to_hpa':
   include/linux/kvm_types.h:88:23: error: 'PAGE_SHIFT' undeclared (first use in this function)
      88 |  return (hpa_t)pfn << PAGE_SHIFT;
         |                       ^~~~~~~~~~
   In file included from arch/riscv/kvm/../../../virt/kvm/coalesced_mmio.c:14:
   include/linux/kvm_host.h: In function 'kvm_gpc_mark_dirty_in_slot':
   include/linux/kvm_host.h:1937:28: error: 'struct gfn_to_pfn_cache' has no member named 'never_mark_dirty'; did you mean 'never_dirty'?
    1937 |  if (!gpc->memslot || gpc->never_mark_dirty)
         |                            ^~~~~~~~~~~~~~~~
         |                            never_dirty
--
   In file included from include/kvm/iodev.h:6,
                    from arch/riscv/kvm/../../../virt/kvm/kvm_main.c:13:
   include/linux/kvm_types.h: In function 'gfn_to_gpa':
>> include/linux/kvm_types.h:78:23: error: 'PAGE_SHIFT' undeclared (first use in this function)
      78 |  return (gpa_t)gfn << PAGE_SHIFT;
         |                       ^~~~~~~~~~
   include/linux/kvm_types.h:78:23: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/kvm_types.h: In function 'gpa_to_gfn':
   include/linux/kvm_types.h:83:24: error: 'PAGE_SHIFT' undeclared (first use in this function)
      83 |  return (gfn_t)(gpa >> PAGE_SHIFT);
         |                        ^~~~~~~~~~
   include/linux/kvm_types.h: In function 'pfn_to_hpa':
   include/linux/kvm_types.h:88:23: error: 'PAGE_SHIFT' undeclared (first use in this function)
      88 |  return (hpa_t)pfn << PAGE_SHIFT;
         |                       ^~~~~~~~~~
   In file included from arch/riscv/kvm/../../../virt/kvm/kvm_main.c:15:
   include/linux/kvm_host.h: In function 'kvm_gpc_mark_dirty_in_slot':
   include/linux/kvm_host.h:1937:28: error: 'struct gfn_to_pfn_cache' has no member named 'never_mark_dirty'; did you mean 'never_dirty'?
    1937 |  if (!gpc->memslot || gpc->never_mark_dirty)
         |                            ^~~~~~~~~~~~~~~~
         |                            never_dirty
   In file included from include/kvm/iodev.h:6,
                    from arch/riscv/kvm/../../../virt/kvm/kvm_main.c:13:
   include/linux/kvm_types.h: In function 'pfn_to_hpa':
>> include/linux/kvm_types.h:89:1: warning: control reaches end of non-void function [-Wreturn-type]
      89 | }
         | ^


vim +/PAGE_SHIFT +78 include/linux/kvm_types.h

    75	
    76	static inline gpa_t gfn_to_gpa(gfn_t gfn)
    77	{
  > 78		return (gpa_t)gfn << PAGE_SHIFT;
    79	}
    80	
    81	static inline gfn_t gpa_to_gfn(gpa_t gpa)
    82	{
    83		return (gfn_t)(gpa >> PAGE_SHIFT);
    84	}
    85	
    86	static inline hpa_t pfn_to_hpa(kvm_pfn_t pfn)
    87	{
    88		return (hpa_t)pfn << PAGE_SHIFT;
  > 89	}
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
