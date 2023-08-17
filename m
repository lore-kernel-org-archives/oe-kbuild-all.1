Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14CAD518
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 10:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692268139; x=1723804139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T1OGbPvHR32JM3L3eDbsuIl0gvrEsmNz1ey6VP3yFVU=;
  b=guAX4aN1N5rvkAjPJ27akfUYFHtASbu5wilVub2cSM8sPllkI/nWlKAX
   A4/WDGFHJTh5WUHEhzoj72bzQo1iwklGJ82DRaGt+KyCC/o32KDnY8LLr
   PGqZEGkXkvKC4Y0KaFaT641lpS+0y0FAsSuTJZvCgoV9NVS8ktZ0EgOD9
   Pj13ubx7S3ZdQkH+AeNk2UoS7kgaGrHWBRlG0cgzY5b0znpS7B5tQ0udM
   AoekqvHWgtbawP4XS0jzgCl03a/8lugZbpxLiBjZo9bvkeoRtM+JZGced
   03WoqED7vDKku3vJMBjUR1XvONBVfQ3j0l5sxsR6TDeW71XFs1U+Ygwfn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="371676229"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="371676229"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 03:28:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="728093903"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="728093903"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Aug 2023 03:28:44 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWaF9-00012l-2G;
	Thu, 17 Aug 2023 10:28:43 +0000
Date: Thu, 17 Aug 2023 18:28:03 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:osv-integration 235/343] arch/x86/kvm/mmu/mmu.c:6589:55:
 warning: implicit conversion from 'enum <anonymous>' to 'enum
 tdp_zap_private'
Message-ID: <202308171852.WukNrESs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git osv-integration
head:   70f3f1eeaaab6b7c6bcb5b7b3e1f1bc6c32d3b99
commit: 8887865c7f7a93364d31dfb8098f3aeb75f36af5 [235/343] KVM: TDX: Allow blocked Secure-EPT
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230817/202308171852.WukNrESs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171852.WukNrESs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171852.WukNrESs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/mmu/mmu.c: In function 'kvm_zap_gfn_range':
>> arch/x86/kvm/mmu/mmu.c:6589:55: warning: implicit conversion from 'enum <anonymous>' to 'enum tdp_zap_private' [-Wenum-conversion]
    6589 |                                                       false);
         |                                                       ^~~~~


vim +6589 arch/x86/kvm/mmu/mmu.c

6103bc07404887 arch/x86/kvm/mmu/mmu.c Ben Gardon          2021-04-01  6555  
21fa324654e4c7 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-10-21  6556  /*
21fa324654e4c7 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-10-21  6557   * Invalidate (zap) SPTEs that cover GFNs from gfn_start and up to gfn_end
21fa324654e4c7 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-10-21  6558   * (not including it)
21fa324654e4c7 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-10-21  6559   */
21fa324654e4c7 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-10-21  6560  void kvm_zap_gfn_range(struct kvm *kvm, gfn_t gfn_start, gfn_t gfn_end)
21fa324654e4c7 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-10-21  6561  {
21fa324654e4c7 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-10-21  6562  	bool flush;
21fa324654e4c7 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-10-21  6563  	int i;
21fa324654e4c7 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-10-21  6564  
f4209439b52243 arch/x86/kvm/mmu/mmu.c Maciej S. Szmigiero 2021-12-06  6565  	if (WARN_ON_ONCE(gfn_end <= gfn_start))
f4209439b52243 arch/x86/kvm/mmu/mmu.c Maciej S. Szmigiero 2021-12-06  6566  		return;
f4209439b52243 arch/x86/kvm/mmu/mmu.c Maciej S. Szmigiero 2021-12-06  6567  
21fa324654e4c7 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-10-21  6568  	write_lock(&kvm->mmu_lock);
21fa324654e4c7 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-10-21  6569  
f407bb3353cc10 arch/x86/kvm/mmu/mmu.c Chao Peng           2022-12-02  6570  	kvm_mmu_invalidate_begin(kvm);
f407bb3353cc10 arch/x86/kvm/mmu/mmu.c Chao Peng           2022-12-02  6571  
f407bb3353cc10 arch/x86/kvm/mmu/mmu.c Chao Peng           2022-12-02  6572  	kvm_mmu_invalidate_range_add(kvm, gfn_start, gfn_end);
21fa324654e4c7 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-10-21  6573  
2833eda0e296ba arch/x86/kvm/mmu/mmu.c Sean Christopherson 2022-07-15  6574  	flush = kvm_rmap_zap_gfn_range(kvm, gfn_start, gfn_end);
21fa324654e4c7 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-10-21  6575  
1f98f2bd8ec4df arch/x86/kvm/mmu/mmu.c David Matlack       2022-09-21  6576  	if (tdp_mmu_enabled) {
42c1d1de229675 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2023-01-23  6577  		for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++)
fe00557a34ae74 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-06-18  6578  			/*
fe00557a34ae74 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-06-18  6579  			 * zap_private = true. Zap both private/shared pages.
fe00557a34ae74 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-06-18  6580  			 *
fe00557a34ae74 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-06-18  6581  			 * kvm_zap_gfn_range() is used when MTRR or PAT memory
fe00557a34ae74 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-06-18  6582  			 * type was changed.  Later on the next kvm page fault,
fe00557a34ae74 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-06-18  6583  			 * populate it with updated spte entry.
fe00557a34ae74 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-06-18  6584  			 * Because only WB is supported for private pages, don't
fe00557a34ae74 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-06-18  6585  			 * care of private pages.
fe00557a34ae74 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-06-18  6586  			 */
f47e5bbbc92f5d arch/x86/kvm/mmu/mmu.c Sean Christopherson 2022-03-25  6587  			flush = kvm_tdp_mmu_zap_leafs(kvm, i, gfn_start,
fe00557a34ae74 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-06-18  6588  						      gfn_end, true, flush,
fe00557a34ae74 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-06-18 @6589  						      false);
5a324c24b638d0 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-08-10  6590  	}
5a324c24b638d0 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-08-10  6591  
2b9663d8a19d0a arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-25  6592  	if (flush)
8c63e8c2176552 arch/x86/kvm/mmu/mmu.c David Matlack       2023-01-26  6593  		kvm_flush_remote_tlbs_range(kvm, gfn_start, gfn_end - gfn_start);
2b9663d8a19d0a arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-25  6594  
f407bb3353cc10 arch/x86/kvm/mmu/mmu.c Chao Peng           2022-12-02  6595  	kvm_mmu_invalidate_end(kvm);
edb298c663fcca arch/x86/kvm/mmu/mmu.c Maxim Levitsky      2021-08-10  6596  
5a324c24b638d0 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-08-10  6597  	write_unlock(&kvm->mmu_lock);
efdfe536d8c643 arch/x86/kvm/mmu.c     Xiao Guangrong      2015-05-13  6598  }
efdfe536d8c643 arch/x86/kvm/mmu.c     Xiao Guangrong      2015-05-13  6599  

:::::: The code at line 6589 was first introduced by commit
:::::: fe00557a34ae7407fdb211a3bd22868acf88d4a8 KVM: x86/tdp_mmu: Don't zap private pages for unsupported cases

:::::: TO: Sean Christopherson <sean.j.christopherson@intel.com>
:::::: CC: Isaku Yamahata <isaku.yamahata@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
