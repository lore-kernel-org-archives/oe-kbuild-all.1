Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E47E7F8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 06:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679122718; x=1710658718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I+5aYTM054pXjD1/anJYhgpLfc9fYTqrnEoUzn80kzw=;
  b=PwI9w6+PnpW6ZzHAvlcCVWq/9q3OGAHxc7W1RZKXWm9F514UlWeAca4b
   HtbD8Ft/5E7PKy2OIdKHdG5zn4ackuDK+g4HMSkf3woN4V3ENzV+bblF7
   +bM53m+YuKSmq+7TeZxxYkLJ9gsiPSH+AuODUw0eNgAN3zTL2KZMXJM77
   8YU6iAfYWutyYCUcUM/fD7lCFgBdWu3VrsE4EsH0Q8V+CDbzI1hOP+xdD
   qdLHTl6EPoOkcy263oOAXqoiUh1xa6+w9ywLlNhgrRi4KcFe+OFqaYYZF
   9eSFEz1rtlWUr7jknz/TiyB9Iu15QkT4f8MqzAgNkn0jgd16NKS896SOl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="318813033"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="318813033"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 23:58:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="926402028"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="926402028"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 17 Mar 2023 23:58:36 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdQWS-0009sw-09;
	Sat, 18 Mar 2023 06:58:36 +0000
Date: Sat, 18 Mar 2023 14:58:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Gardon <bgardon@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Christopherson <seanjc@google.com>
Subject: [sean-jc:x86/formalize_shadow_mmu 28/39]
 arch/x86/kvm/mmu/mmu.c:2584:9: error: implicit declaration of function
 'for_each_shadow_entry_using_root'
Message-ID: <202303181409.03KjRIWw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ben,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/sean-jc/linux x86/formalize_shadow_mmu
head:   dd395c7174581183cd66020ac5a784bdf2e79cd1
commit: 4fac69350253a64640e70ed9f63ea2871f397b82 [28/39] KVM: x86/MMU: Clean up Shadow MMU exports
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230318/202303181409.03KjRIWw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/sean-jc/linux/commit/4fac69350253a64640e70ed9f63ea2871f397b82
        git remote add sean-jc https://github.com/sean-jc/linux
        git fetch --no-tags sean-jc x86/formalize_shadow_mmu
        git checkout 4fac69350253a64640e70ed9f63ea2871f397b82
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181409.03KjRIWw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/x86/kvm/mmu/mmu.c:758:1: error: version control conflict marker in file
     758 | <<<<<<< HEAD
         | ^~~~~~~
   arch/x86/kvm/mmu/mmu.c: In function 'kvm_handle_error_pfn':
   arch/x86/kvm/mmu/mmu.c:785:17: error: implicit declaration of function 'kvm_send_hwpoison_signal' [-Werror=implicit-function-declaration]
     785 |                 kvm_send_hwpoison_signal(fault->slot, fault->gfn);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c: In function 'paging64_init_context':
   arch/x86/kvm/mmu/mmu.c:2129:30: error: 'paging64_sync_spte' undeclared (first use in this function); did you mean 'paging64_sync_page'?
    2129 |         context->sync_spte = paging64_sync_spte;
         |                              ^~~~~~~~~~~~~~~~~~
         |                              paging64_sync_page
   arch/x86/kvm/mmu/mmu.c:2129:30: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/kvm/mmu/mmu.c: In function 'paging32_init_context':
   arch/x86/kvm/mmu/mmu.c:2136:30: error: 'paging32_sync_spte' undeclared (first use in this function); did you mean 'paging32_sync_page'?
    2136 |         context->sync_spte = paging32_sync_spte;
         |                              ^~~~~~~~~~~~~~~~~~
         |                              paging32_sync_page
   arch/x86/kvm/mmu/mmu.c: In function 'kvm_init_shadow_ept_mmu':
   arch/x86/kvm/mmu/mmu.c:2355:38: error: 'ept_sync_spte' undeclared (first use in this function); did you mean 'ept_sync_page'?
    2355 |                 context->sync_spte = ept_sync_spte;
         |                                      ^~~~~~~~~~~~~
         |                                      ept_sync_page
   arch/x86/kvm/mmu/mmu.c: In function '__kvm_mmu_invalidate_addr':
>> arch/x86/kvm/mmu/mmu.c:2576:41: error: storage size of 'iterator' isn't known
    2576 |         struct kvm_shadow_walk_iterator iterator;
         |                                         ^~~~~~~~
>> arch/x86/kvm/mmu/mmu.c:2584:9: error: implicit declaration of function 'for_each_shadow_entry_using_root' [-Werror=implicit-function-declaration]
    2584 |         for_each_shadow_entry_using_root(vcpu, root_hpa, addr, iterator) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/mmu/mmu.c:2584:73: error: expected ';' before '{' token
    2584 |         for_each_shadow_entry_using_root(vcpu, root_hpa, addr, iterator) {
         |                                                                         ^~
         |                                                                         ;
>> arch/x86/kvm/mmu/mmu.c:2576:41: warning: unused variable 'iterator' [-Wunused-variable]
    2576 |         struct kvm_shadow_walk_iterator iterator;
         |                                         ^~~~~~~~
   arch/x86/kvm/mmu/mmu.c: At top level:
   arch/x86/kvm/mmu/mmu.c:167:14: warning: 'kvm_mmu_page_get_gfn' used but never defined
     167 | static gfn_t kvm_mmu_page_get_gfn(struct kvm_mmu_page *sp, int index);
         |              ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:170:13: warning: 'kvm_flush_remote_tlbs_sptep' defined but not used [-Wunused-function]
     170 | static void kvm_flush_remote_tlbs_sptep(struct kvm *kvm, u64 *sptep)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/for_each_shadow_entry_using_root +2584 arch/x86/kvm/mmu/mmu.c

3067714cf59bd4 drivers/kvm/mmu.c      Avi Kivity    2007-10-28  2572  
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17  2573  static void __kvm_mmu_invalidate_addr(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17  2574  				      u64 addr, hpa_t root_hpa)
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17  2575  {
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17 @2576  	struct kvm_shadow_walk_iterator iterator;
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17  2577  
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17  2578  	vcpu_clear_mmio_info(vcpu, addr);
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17  2579  
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17  2580  	if (!VALID_PAGE(root_hpa))
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17  2581  		return;
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17  2582  
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17  2583  	write_lock(&vcpu->kvm->mmu_lock);
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17 @2584  	for_each_shadow_entry_using_root(vcpu, root_hpa, addr, iterator) {
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17  2585  		struct kvm_mmu_page *sp = sptep_to_sp(iterator.sptep);
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17  2586  
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17  2587  		if (sp->unsync) {
19ace7d6ca15a4 arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17  2588  			int ret = kvm_sync_spte(vcpu, sp, iterator.index);
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17  2589  
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17  2590  			if (ret < 0)
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17  2591  				mmu_page_zap_pte(vcpu->kvm, sp, iterator.sptep, NULL);
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17  2592  			if (ret)
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17  2593  				kvm_flush_remote_tlbs_sptep(vcpu->kvm, iterator.sptep);
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17  2594  		}
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17  2595  
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17  2596  		if (!sp->unsync_children)
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17  2597  			break;
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17  2598  	}
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17  2599  	write_unlock(&vcpu->kvm->mmu_lock);
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17  2600  }
9fd4a4e3a3d9fc arch/x86/kvm/mmu/mmu.c Lai Jiangshan 2023-02-17  2601  

:::::: The code at line 2584 was first introduced by commit
:::::: 9fd4a4e3a3d9fc0306525d95bf3eca693d311406 KVM: x86/mmu: Remove FNAME(invlpg) and use FNAME(sync_spte) to update vTLB instead.

:::::: TO: Lai Jiangshan <jiangshan.ljs@antgroup.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
