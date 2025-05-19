Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959681854
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 15:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670147; cv=none; b=SQU9BfKBW9jgMo3GMgftA0wAhJwhaA0ipKy4lYYYB64XL2zb1NiEF3rDegnN6KNA87Vf/vNLRVKkG06zwk53G3CjEC5PpFOjWP7c6gZh4vNIaKHOJOoU9YKrlVCBtIfKjZK20hI2p02LxNY6ttz4ylaYK9lcWqx4M30qRVj2bIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670147; c=relaxed/simple;
	bh=wEq5SoGr5+9IA+N0s73VVH1FToOaLSzMjoFsR0h7b+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TZVwr7zV2NS+Fo1uW5osCr+0MOZLOUbqAK5VA8PxOQ5j/Wba1h1DpFDLrBHE1JXA2Ni9D2Wp15jtSrJOCjf7fzWxxaNO51PPkgDBmhmTw0nXFEVo/Qa0IePipWqhHhvH/LDZYOi40RzCygb9EROm6f0GzwWEgWk2139v4/im+xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZfHesEAt; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZfHesEAt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747670146; x=1779206146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wEq5SoGr5+9IA+N0s73VVH1FToOaLSzMjoFsR0h7b+o=;
  b=ZfHesEAtU2ziQwhkv5yX40nZ5EX/xBIsj/w5WhlvrSl040tUSS+UKqyR
   Src2148nq1b9vW7Tt0PDimHOJ5uVSgGXjz1Z9+keW3ih/KxFVLkLZg577
   j7uTMsbiZrSqDpxPBN34rf/Hqp3QzpSCKiAf/quL+yVV/E8UtUd5ncEKk
   deDOKWZHMSSfSA6GNJkJhnmDDVBCGzfdzBuhhVgf4RhJEIWV+wd3Hge/w
   d2WDEfXsYt1FvzG/7Ohtz3oaBcyq7oWG73FFG1uGFV0MxoXQ2NXCBE+2R
   vQVsX3gPxvqUI6VJB6tjf5KbFqA6vVhPiTJaiWhttudaV39PIsn7yTz7y
   Q==;
X-CSE-ConnectionGUID: mQLDsSOgQEOI9mg0J6VmnA==
X-CSE-MsgGUID: B/RaE3i8QEyLh7liiJmvxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="48830281"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="48830281"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 08:55:44 -0700
X-CSE-ConnectionGUID: egjOWSfiROaVPFYJ7Iri9Q==
X-CSE-MsgGUID: /820/l9STISWOFlSKnKb4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="139152881"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 May 2025 08:55:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uH2q4-000LeO-0x;
	Mon, 19 May 2025 15:55:40 +0000
Date: Mon, 19 May 2025 23:55:09 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:ackerley-1g-master 55/75]
 arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1388:37: warning: left shift
 count >= width of type
Message-ID: <202505192313.V76LPyVV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git ackerley-1g-master
head:   773f26b5bef6e4d3094a33605165a5c6ab9aa0f0
commit: 0d68c26c85d69c2365731a23a9f4c392d26ceac7 [55/75] KVM: guest_memfd: Support guestmem_hugetlb as custom allocator
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250519/202505192313.V76LPyVV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505192313.V76LPyVV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505192313.V76LPyVV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/../../../virt/kvm/guest_memfd.c: In function 'kvm_gmem_supports_shared':
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:904:26: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     904 |         uint64_t flags = (uint64_t)inode->i_private;
         |                          ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c: In function 'kvm_gmem_create':
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1388:37: warning: left shift count >= width of type [-Wshift-count-overflow]
    1388 |         (GUESTMEM_HUGETLB_FLAG_MASK << GUESTMEM_HUGETLB_FLAG_SHIFT)
         |                                     ^~
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1405:32: note: in expansion of macro 'SUPPORTED_CUSTOM_ALLOCATOR_MASK'
    1405 |                                SUPPORTED_CUSTOM_ALLOCATOR_MASK;
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c: In function 'kvm_gmem_bind':
   include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_680' declared with attribute error: BUILD_BUG_ON failed: sizeof(gfn_t) != sizeof(slot->gmem.pgoff)
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
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1453:9: note: in expansion of macro 'BUILD_BUG_ON'
    1453 |         BUILD_BUG_ON(sizeof(gfn_t) != sizeof(slot->gmem.pgoff));
         |         ^~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HUGETLB_PAGE_OPTIMIZE_VMEMMAP
   Depends on [n]: ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP [=n] && SPARSEMEM_VMEMMAP [=n]
   Selected by [y]:
   - GUESTMEM_HUGETLB [=y]


vim +1388 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

  1385	
  1386	/* Mask of bits belonging to allocators and are opaque to guest_memfd. */
  1387	#define SUPPORTED_CUSTOM_ALLOCATOR_MASK \
> 1388		(GUESTMEM_HUGETLB_FLAG_MASK << GUESTMEM_HUGETLB_FLAG_SHIFT)
  1389	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
