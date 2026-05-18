Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816C930AD10
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 02:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779156798; cv=none; b=fimaqypyIIqsoVc/a8l4OUAxwa+q+Y8sCqZU6K/Dz25gJ/0/BbyO/5NdfdBRTYkm3gllfxaN0dA/y6q6PsNHLHQq/8XBhLOXNu5px6umw84o9osew7ORug+vCT1o4vaXZNLAb/5peY/tk+s94onBGGaBMn4FXdvpti6tj2KyfiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779156798; c=relaxed/simple;
	bh=gud64GCUIRmb8+zq6nlk7cKvvL1p+AzhlVOpOGY3S9I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QGV91n0WW23Bj75FIncno/KR5uwrdQEOXBhfXPVa0DXAaFsRWRXy4nH2vIFgR8cH70AFoin1CK0lBjNBR26u/bgVDC4+M0yY0PTDaK/FL//Ez6kKMJ1eCIIu7WbT5Nv1PsR9Vbymfvk+bKgJVLQBHUKvb2j96gDTy3Gn6H3NGCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1EdJmh+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1EdJmh+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779156797; x=1810692797;
  h=date:from:to:cc:subject:message-id;
  bh=gud64GCUIRmb8+zq6nlk7cKvvL1p+AzhlVOpOGY3S9I=;
  b=R1EdJmh+Cjs4zufQnOOe9aY6DvSJ7WsfWRTYc6A7U15TyU2AbN5zgp6c
   6rgqGvCHJurzvrviEjgZjk80JlyTuDxL1CXyUYPqfPIDBi5DkjhqN/WP8
   zKP+XA3MX+wbENUOZpIz2H0lFdTODo08Cy8uZr0a/IG3oZBzK+tvpWqqK
   VAN+DtRyqxLMR3yioE8DDWiHv75ohlfZMnMLWLaTPAQI6vI40mGu7eRrv
   JMa3cmk5p5j5qUUR0W0uGKjO3b6os+0CeAfhiT7ZKqexvVXK1PfAJCmG1
   wUFWjoFH/XJ8fkMWXkrAJJSD6+ZRN9IgZHgAbp9bPLcXflxYtjaC6MJx8
   g==;
X-CSE-ConnectionGUID: Qx5zQN2EQ824mvoNjJl1wg==
X-CSE-MsgGUID: kOITsJGQSwKYDWriGKDHWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79876125"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79876125"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:13:16 -0700
X-CSE-ConnectionGUID: Tr/4PuWgRhqx5XCmeLfHOA==
X-CSE-MsgGUID: VERkjTMdRzyGFMm9688JRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="235167848"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 18 May 2026 19:13:14 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP9xI-0000000004F-0BoS;
	Tue, 19 May 2026 02:13:12 +0000
Date: Tue, 19 May 2026 06:42:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 76/238]
 arch/x86/kvm/vmx/sgx.c:4:9: warning: "pr_fmt" redefined
Message-ID: <202605190517.ZuzmIxXP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: 9f39e5e1674188b92a32f709a9c3225553110dc0 [76/238] KVM: VMX: replace __get_free_page() with kmalloc()
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260519/202605190517.ZuzmIxXP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190517.ZuzmIxXP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190517.ZuzmIxXP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/vmx/sgx.c:4:9: warning: "pr_fmt" redefined
       4 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |         ^~~~~~
   In file included from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:193,
                    from include/linux/bug.h:5,
                    from include/linux/slab.h:15,
                    from arch/x86/kvm/vmx/sgx.c:1:
   include/linux/printk.h:401:9: note: this is the location of the previous definition
     401 | #define pr_fmt(fmt) fmt
         |         ^~~~~~


vim +/pr_fmt +4 arch/x86/kvm/vmx/sgx.c

8d20bd638167038 Sean Christopherson 2022-11-30 @4  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
9798adbc04cf1b1 Sean Christopherson 2021-04-12  5  

:::::: The code at line 4 was first introduced by commit
:::::: 8d20bd6381670382669d9bb39b5fd566a84cdbef KVM: x86: Unify pr_fmt to use module name for all KVM modules

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
