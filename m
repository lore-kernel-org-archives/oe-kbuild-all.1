Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9252066CB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 22:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737843837; cv=none; b=bOU62iMpJuWW288IAaxiKKPhTjbY3D8O2bsUkRIiplarUxIr5fxKTCkpvhcVwCz4YgQKJ19QtBbpuFlwOTuFC6IsCwOnZcxAM6IEtBiZRpeUm0VUdMTKMsVFBEnQ6pPIpBKujzZoUYHB0EtUiH39QLSTeTGfxIXL3jcdz8eI2vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737843837; c=relaxed/simple;
	bh=2Yh8CkgBbTBhXBFm3u1cDdBgI47bZuZ+uMLKfSRm1IE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YqgsKm24dG1l5LlLtQnHTczAged9MlqMFh1ifc81DQlHk45M1eOQ4jAfialECRON8G5LkEszu/ra2G6T0AllCP5RR/Z06GK+hgIvb493BsaX19oZyecDvDGPk2LDUtht/tjErFVTnoDpN5qmwqm+BeCk5rS604eafY9LmyhGzhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ej8EdOAT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ej8EdOAT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737843836; x=1769379836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Yh8CkgBbTBhXBFm3u1cDdBgI47bZuZ+uMLKfSRm1IE=;
  b=ej8EdOATw16rdVpeqq0i7ZI6iq4V0aUq7Dlmp6Zz0dxWmMvsUth2wUAX
   AK/1xEpXgVgr2zVDnDHVZ7/DwdKWdwOiR7yiPpXWl+TBdjafHKd032uuy
   DDfewF0tnPaQ3Ywlgb5IbBOuVksTd8RL18sWwEKeK42rDeNymTRtTg77t
   cf3QhwURaaHe/3ruY9m3hJJhBQ6+vNt/RZ2WJbA/mOSJUVLvNQ2kowRYY
   wgAXoTyBPNjMjy0VFSxRldK+BQRaRNex1frGOtPx7plqxMaFohmOHDUn2
   +kZjJUjdHIufQ0UA9rZH1Pc7dktb+Q+NOYNJEIMPF9srBNF3iuZzHQTc5
   A==;
X-CSE-ConnectionGUID: 2MvZt5tLRiu8HQxUE7rf4Q==
X-CSE-MsgGUID: JINkpKjiR7+bywdyvvF/kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="49741045"
X-IronPort-AV: E=Sophos;i="6.13,235,1732608000"; 
   d="scan'208";a="49741045"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 14:23:55 -0800
X-CSE-ConnectionGUID: 9nTtMkcJQ26EycKTORrhlQ==
X-CSE-MsgGUID: RwAXExIgR+eT16dphfNWxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107934969"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 25 Jan 2025 14:23:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tboZE-000eIF-0I;
	Sat, 25 Jan 2025 22:23:52 +0000
Date: Sun, 26 Jan 2025 06:23:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/1]
 include/linux/userfaultfd_k.h:81:64: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202501260614.SQrfOXlQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   cf32d6ffe2eb44f4f011f25c0692458cf0032772
commit: a905086c85cb076b98620df34ee237ece7c0599f [0/1] ANDROID: userfaultfd: allow SPF for UFFD_FEATURE_SIGBUS on private+anon
config: x86_64-randconfig-123-20250125 (https://download.01.org/0day-ci/archive/20250126/202501260614.SQrfOXlQ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501260614.SQrfOXlQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501260614.SQrfOXlQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mmap.c: note: in included file (through include/linux/kernel.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   mm/mmap.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   mm/mmap.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   mm/mmap.c: note: in included file (through include/linux/hugetlb.h):
>> include/linux/userfaultfd_k.h:81:64: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/userfaultfd_k.h:81:64: sparse:    struct userfaultfd_ctx *
   include/linux/userfaultfd_k.h:81:64: sparse:    struct userfaultfd_ctx [noderef] __rcu *
>> include/linux/userfaultfd_k.h:81:64: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/userfaultfd_k.h:81:64: sparse:    struct userfaultfd_ctx *
   include/linux/userfaultfd_k.h:81:64: sparse:    struct userfaultfd_ctx [noderef] __rcu *

vim +81 include/linux/userfaultfd_k.h

    58	
    59	extern int mfill_atomic_install_pte(struct mm_struct *dst_mm, pmd_t *dst_pmd,
    60					    struct vm_area_struct *dst_vma,
    61					    unsigned long dst_addr, struct page *page,
    62					    bool newly_allocated, bool wp_copy);
    63	
    64	extern ssize_t mcopy_atomic(struct mm_struct *dst_mm, unsigned long dst_start,
    65				    unsigned long src_start, unsigned long len,
    66				    bool *mmap_changing, __u64 mode);
    67	extern ssize_t mfill_zeropage(struct mm_struct *dst_mm,
    68				      unsigned long dst_start,
    69				      unsigned long len,
    70				      bool *mmap_changing);
    71	extern ssize_t mcopy_continue(struct mm_struct *dst_mm, unsigned long dst_start,
    72				      unsigned long len, bool *mmap_changing);
    73	extern int mwriteprotect_range(struct mm_struct *dst_mm,
    74				       unsigned long start, unsigned long len,
    75				       bool enable_wp, bool *mmap_changing);
    76	
    77	/* mm helpers */
    78	static inline bool is_mergeable_vm_userfaultfd_ctx(struct vm_area_struct *vma,
    79						struct vm_userfaultfd_ctx vm_ctx)
    80	{
  > 81		return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
    82	}
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
