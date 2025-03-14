Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31C1126BF1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 17:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741975165; cv=none; b=CLIuO8v32XR0MvoxCYKbp46zatmyAIIQFCD1wexsZspSxgyVj2JCZ1r7PDafKLSy7EziFCwEwB6uBm4gaDgE74eY0LVpYqtaQknK45JfnQeRP7wbWfd55AIaMkXLUel4kuUGfCyPjPQcWW2hKfCXmnY2nYQKTmoNMrAawezknwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741975165; c=relaxed/simple;
	bh=m6GTgxWfdLxF0CeogY/pMWfH0CzNPCvR8IqBOhaWc7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tzSCrSYaw5pDlOkzHFearawXvmAimLUCGznpcgL7+6VuSwT9WxG209nDmHOsDIboLggXxzimXuupdvnuZ+BTTJlRFWbTZUX7s9+HJgS1O6+tbdhhugS4pSxMqtSPInYYm6yZqjA6ZEQNeJecfrK3okJyOeqSpn8oFjfJYKprP/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IoY6APEN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IoY6APEN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741975164; x=1773511164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m6GTgxWfdLxF0CeogY/pMWfH0CzNPCvR8IqBOhaWc7E=;
  b=IoY6APENqh6lvQtGghGLX4GdSLvyo4yxaGr8BcsZoQ/YYyqcIgENDM4J
   9GESF+sA6cg22jxmusddAROAAYP5Y8X7xgwSAeyfhs1nbToJsi6icTwi0
   3rZVG1NjIc+Q8Je2uYbdoKAJf4Z2Mue3/y4o1f8D4i7yzfS71PtEtT8WV
   zb4FCW67+Jcf3oZJ1osYJCSsZYrKa/KUeKstQb0k97NFh3elXiOxsVWlr
   g+HFa/IQo0LvAptgTGoI9PvvCLMlmJK6atHqAPj5b+hGo0M9AtPcEA+2I
   cQqoYRU8DAcA+wU+rlz9cWFTknc//dZhg9zgKmn3DTqWkEZmyJ8KAqgIk
   g==;
X-CSE-ConnectionGUID: ULHgsPL+RMyV+QDLgDBrEQ==
X-CSE-MsgGUID: /pKqity2QqewCpUVMw0uEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="65597774"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="65597774"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 10:59:24 -0700
X-CSE-ConnectionGUID: g6hVxLOqReSMNpECcJJUYw==
X-CSE-MsgGUID: 9oOQu42aQC6tOXadoRH73Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="121073299"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 14 Mar 2025 10:59:22 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt9JT-000Ai4-19;
	Fri, 14 Mar 2025 17:59:16 +0000
Date: Sat, 15 Mar 2025 01:58:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2] arch/arm64/kvm/mmu.c:2012:5:
 warning: no previous prototype for function 'pkvm_mem_abort_prefault'
Message-ID: <202503150116.RQjydghy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   5c6a903b8e75e9e04fdd8dd3a5cc74f96b0a707d
commit: 3fc1e219027721249a621d54449e0f3db624b655 [2/2] ANDROID: KVM: arm64: Introduce kvm-arm.protected_prefault parameter
config: arm64-randconfig-003-20250314 (https://download.01.org/0day-ci/archive/20250315/202503150116.RQjydghy-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503150116.RQjydghy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503150116.RQjydghy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/mmu.c:313:1: warning: no previous prototype for function 'kvm_pinned_pages_insert' [-Wmissing-prototypes]
   INTERVAL_TREE_DEFINE(struct kvm_pinned_page, node, u64, __subtree_last,
   ^
   include/linux/interval_tree_generic.h:38:15: note: expanded from macro 'INTERVAL_TREE_DEFINE'
   ITSTATIC void ITPREFIX ## _insert(ITSTRUCT *node,                             \
                 ^
   <scratch space>:149:1: note: expanded from here
   kvm_pinned_pages_insert
   ^
   arch/arm64/kvm/mmu.c:313:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   include/linux/interval_tree_generic.h:38:10: note: expanded from macro 'INTERVAL_TREE_DEFINE'
   ITSTATIC void ITPREFIX ## _insert(ITSTRUCT *node,                             \
            ^
>> arch/arm64/kvm/mmu.c:2012:5: warning: no previous prototype for function 'pkvm_mem_abort_prefault' [-Wmissing-prototypes]
   int pkvm_mem_abort_prefault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
       ^
   arch/arm64/kvm/mmu.c:2012:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int pkvm_mem_abort_prefault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
   ^
   static 
   arch/arm64/kvm/mmu.c:2037:14: warning: variable 'ipa' set but not used [-Wunused-but-set-variable]
           phys_addr_t ipa = fault_ipa;
                       ^
   3 warnings generated.


vim +/pkvm_mem_abort_prefault +2012 arch/arm64/kvm/mmu.c

  2011	
> 2012	int pkvm_mem_abort_prefault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
  2013				    struct kvm_memory_slot *memslot)
  2014	{
  2015		phys_addr_t memslot_start = memslot->base_gfn << PAGE_SHIFT;
  2016		size_t size = (1 << pkvm_prefault) << PAGE_SHIFT;
  2017	
  2018		fault_ipa = ALIGN_DOWN(fault_ipa, size);
  2019		if (fault_ipa < memslot_start) {
  2020			size -= memslot_start - fault_ipa;
  2021			fault_ipa = memslot_start;
  2022		}
  2023	
  2024		return pkvm_mem_abort(vcpu, fault_ipa, size, memslot);
  2025	}
  2026	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
