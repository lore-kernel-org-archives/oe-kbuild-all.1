Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40BE7F8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 07:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679125839; x=1710661839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b7uHeL6gQbxWSc2N7OvxHrl/AYe/vmCmmiUz24YZWuE=;
  b=XifdYoKzrBjjNvayKGfKxuRPzjZNcbB+SmruhLIF0i/YrPOV+SnJwFBJ
   wszGLWpZ6noOEtLC7bn0iqoD1fzRUAaGtxixPnNPgf3UEFlLKVAn6fcST
   vqiQwpMyWGtVPudXI9D1BslPW+T+yRF1Rd7a7TYdu8yD/frUygMxnrq46
   Gl/t1utEoGIj+AH7C5pO8HeyN81Nis/AFqkslnris+2/EeKJal+WLlQIk
   NznL63Dd4ohoP6pWjpCVrQ8JK1ecTn7yLi0CCWL3r1x07vxBt/FsstcDQ
   +/w1G4yHxM9hXv25bh1OMeiGCVslgdfZM3BHubks5BOz6/rnoBZtqpJMB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="337121200"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="337121200"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 00:50:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="791011766"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="791011766"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Mar 2023 00:50:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdRKn-0009uY-1O;
	Sat, 18 Mar 2023 07:50:37 +0000
Date: Sat, 18 Mar 2023 15:49:52 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Gardon <bgardon@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Christopherson <seanjc@google.com>
Subject: [sean-jc:x86/formalize_shadow_mmu 29/39]
 arch/x86/kvm/mmu/mmu.c:3178:15: warning: no previous prototype for
 'mmu_shrink_scan'
Message-ID: <202303181521.c5kCvhpR-lkp@intel.com>
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
commit: 65d06e1aa5898de35579978883d1d71dad826347 [29/39] KVM: x86/MMU: Cleanup shrinker interface with Shadow MMU
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230318/202303181521.c5kCvhpR-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/sean-jc/linux/commit/65d06e1aa5898de35579978883d1d71dad826347
        git remote add sean-jc https://github.com/sean-jc/linux
        git fetch --no-tags sean-jc x86/formalize_shadow_mmu
        git checkout 65d06e1aa5898de35579978883d1d71dad826347
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181521.c5kCvhpR-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   arch/x86/kvm/mmu/mmu.c:2576:41: error: storage size of 'iterator' isn't known
    2576 |         struct kvm_shadow_walk_iterator iterator;
         |                                         ^~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2584:9: error: implicit declaration of function 'for_each_shadow_entry_using_root' [-Werror=implicit-function-declaration]
    2584 |         for_each_shadow_entry_using_root(vcpu, root_hpa, addr, iterator) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2584:73: error: expected ';' before '{' token
    2584 |         for_each_shadow_entry_using_root(vcpu, root_hpa, addr, iterator) {
         |                                                                         ^~
         |                                                                         ;
   arch/x86/kvm/mmu/mmu.c:2576:41: warning: unused variable 'iterator' [-Wunused-variable]
    2576 |         struct kvm_shadow_walk_iterator iterator;
         |                                         ^~~~~~~~
   arch/x86/kvm/mmu/mmu.c: At top level:
>> arch/x86/kvm/mmu/mmu.c:3178:15: warning: no previous prototype for 'mmu_shrink_scan' [-Wmissing-prototypes]
    3178 | unsigned long mmu_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
         |               ^~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:167:14: warning: 'kvm_mmu_page_get_gfn' used but never defined
     167 | static gfn_t kvm_mmu_page_get_gfn(struct kvm_mmu_page *sp, int index);
         |              ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:170:13: warning: 'kvm_flush_remote_tlbs_sptep' defined but not used [-Wunused-function]
     170 | static void kvm_flush_remote_tlbs_sptep(struct kvm *kvm, u64 *sptep)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/mmu_shrink_scan +3178 arch/x86/kvm/mmu/mmu.c

  3177	
> 3178	unsigned long mmu_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
  3179	{
  3180		struct kvm *kvm;
  3181		int nr_to_scan = sc->nr_to_scan;
  3182		unsigned long freed = 0;
  3183	
  3184		mutex_lock(&kvm_lock);
  3185	
  3186		list_for_each_entry(kvm, &vm_list, vm_list) {
  3187			/*
  3188			 * Never scan more than sc->nr_to_scan VM instances.
  3189			 * Will not hit this condition practically since we do not try
  3190			 * to shrink more than one VM and it is very unlikely to see
  3191			 * !n_used_mmu_pages so many times.
  3192			 */
  3193			if (!nr_to_scan--)
  3194				break;
  3195	
  3196			/*
  3197			 * n_used_mmu_pages is accessed without holding kvm->mmu_lock
  3198			 * here. We may skip a VM instance errorneosly, but we do not
  3199			 * want to shrink a VM that only started to populate its MMU
  3200			 * anyway.
  3201			 */
  3202			if (!kvm->arch.n_used_mmu_pages &&
  3203			    !kvm_shadow_mmu_has_zapped_obsolete_pages(kvm))
  3204				continue;
  3205	
  3206			freed = kvm_shadow_mmu_shrink_scan(kvm, sc->nr_to_scan);
  3207	
  3208			/*
  3209			 * unfair on small ones
  3210			 * per-vm shrinkers cry out
  3211			 * sadness comes quickly
  3212			 */
  3213			list_move_tail(&kvm->vm_list, &vm_list);
  3214			break;
  3215		}
  3216	
  3217		mutex_unlock(&kvm_lock);
  3218		return freed;
  3219	}
  3220	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
