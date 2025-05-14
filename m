Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074D8226CE0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 23:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747265852; cv=none; b=CM96cf5qxl8HxV2Q+FNUj2Dk1OVE94M2wiQLkw6cqZY5BuU1mtDmx3sA6G2itHGtLcu7oNzTWquINSRVSYvZDDYNu/zjKFcgdY+UaEocNg3V03RnDlB/hbS5GCvYPZDTuUrSZKmCJJ8IUwRcMBEEJq0W/i4Wbkbu25nUq3Hz/lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747265852; c=relaxed/simple;
	bh=z92PGK0Xy6qJJ2j/rHbUppn9/qIWSH3BqyfdKJSjc3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCtuH39hILmfPpluhIO+K9Sbbl89q75N3SCzLt3kRe4DBhJHUd9o1B5M/nfeCLhJdxT0MGJWp94Lqy59c4sz5agg9MvXK99gwIRIOBTYmzz9QHztCx6RovTa59DAxncsUE4h/YDtAFpf6jnkDvusekkFJHtDeyxco0z/w8+FkDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NAFAnRwZ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NAFAnRwZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747265850; x=1778801850;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z92PGK0Xy6qJJ2j/rHbUppn9/qIWSH3BqyfdKJSjc3Y=;
  b=NAFAnRwZ8HwINDBLZnL7si96KbNy8HsCEVUDNoE8on5whDy9cVoSqTyL
   lJKwD+mqSxLV19BimcekGT0Zi2A+7o5lVQ8ORzf5UDWRd7aY72qOWIKCf
   1xTZkhtSn0DZSjrEuAHHFthO7HsC0wspj0VDslm5p7aLlN0oU/ZEo7a52
   xXKyKlpvXXcRjVNcZleBFSKpGPmocBn3lrb+OfftbQsMenCHYyAcJHDUa
   LjuLUo7a/ZmRAEEDXwmfVbQVHnJJzKvipgOPXl/PSpejWG2v+uFmyyvcj
   aWug7BAPfEPwSMKqidVOwgE3wNJDHAEuPvc/J2WAjmXI8SK85lht4kGcf
   Q==;
X-CSE-ConnectionGUID: EoZkarbnQdSHNAdtun1VEQ==
X-CSE-MsgGUID: X46GIMwBTI6oMcQWQGS7qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="52990404"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="52990404"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 16:37:29 -0700
X-CSE-ConnectionGUID: EZsZoPCUSjyD0UJw0w7GeA==
X-CSE-MsgGUID: 5j5NZt30Q3O2YJSxYazgww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="175318364"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 May 2025 16:37:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFLfC-000Hgp-06;
	Wed, 14 May 2025 23:37:26 +0000
Date: Thu, 15 May 2025 07:37:11 +0800
From: kernel test robot <lkp@intel.com>
To: Fuad Tabba <tabba@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 07/17] KVM: guest_memfd: Allow host to map
 guest_memfd() pages
Message-ID: <202505150727.pG8Uz6uy-lkp@intel.com>
References: <20250513163438.3942405-8-tabba@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513163438.3942405-8-tabba@google.com>

Hi Fuad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3]

url:    https://github.com/intel-lab-lkp/linux/commits/Fuad-Tabba/KVM-Rename-CONFIG_KVM_PRIVATE_MEM-to-CONFIG_KVM_GMEM/20250514-003900
base:   82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
patch link:    https://lore.kernel.org/r/20250513163438.3942405-8-tabba%40google.com
patch subject: [PATCH v9 07/17] KVM: guest_memfd: Allow host to map guest_memfd() pages
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250515/202505150727.pG8Uz6uy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505150727.pG8Uz6uy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505150727.pG8Uz6uy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/../../../virt/kvm/guest_memfd.c: In function 'kvm_gmem_supports_shared':
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:319:26: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     319 |         uint64_t flags = (uint64_t)inode->i_private;
         |                          ^
   In file included from <command-line>:
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c: In function 'kvm_gmem_bind':
   include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_672' declared with attribute error: BUILD_BUG_ON failed: sizeof(gfn_t) != sizeof(slot->gmem.pgoff)
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:569:9: note: in expansion of macro 'BUILD_BUG_ON'
     569 |         BUILD_BUG_ON(sizeof(gfn_t) != sizeof(slot->gmem.pgoff));
         |         ^~~~~~~~~~~~


vim +319 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

   316	
   317	static bool kvm_gmem_supports_shared(struct inode *inode)
   318	{
 > 319		uint64_t flags = (uint64_t)inode->i_private;
   320	
   321		return flags & GUEST_MEMFD_FLAG_SUPPORT_SHARED;
   322	}
   323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
