Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F0AA4D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 08:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679129561; x=1710665561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kv4YD+5/Z/YgInQgSo465Vy0NZftBtrJnx1MFgBwCmw=;
  b=MG9uVbo6G7JCKMBXHIq415j1S0tUs2ngXfxbPhutnXWLZKVICEVQsbBt
   fXUQDRf6iJ047YbGfcM7u0IwgR/JDp6xGgBHqNUGWT2AMvckrHanRcyBQ
   oA+GEvgGwToP0aSButko6ski0xeenXKrYdY4VEPiQmolPQB9DUSJ+JTtk
   NrcTJTnpKHAOyH+wFfBoakBJ+5iCvSW7RHqED03aMtGiSREySUtWPC3Da
   1pmGtVckP2ejZ5lNxRseSYxifeSrwsmkKrxBoe/gPPaKRG+IAIMg018/+
   Ot3W94m9yhBYN6+qBaNqbjyciR+l0S1PSS0fiGekGABp/KkPGFdks5pND
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="340775223"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="340775223"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 01:52:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="630551820"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="630551820"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Mar 2023 01:52:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdSIp-0009ww-0o;
	Sat, 18 Mar 2023 08:52:39 +0000
Date: Sat, 18 Mar 2023 16:51:51 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Gardon <bgardon@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Christopherson <seanjc@google.com>
Subject: [sean-jc:x86/formalize_shadow_mmu 33/39]
 arch/x86/kvm/mmu/shadow_mmu.c:3316:6: warning: no previous prototype for
 'slot_rmap_write_protect'
Message-ID: <202303181657.VdcFPogf-lkp@intel.com>
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
commit: 35f2a3e85c12f85d138998cc783213c29f73d1d4 [33/39] KVM: x86/MMU: Remove unneeded exports from shadow_mmu.c
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230318/202303181657.VdcFPogf-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/sean-jc/linux/commit/35f2a3e85c12f85d138998cc783213c29f73d1d4
        git remote add sean-jc https://github.com/sean-jc/linux
        git fetch --no-tags sean-jc x86/formalize_shadow_mmu
        git checkout 35f2a3e85c12f85d138998cc783213c29f73d1d4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181657.VdcFPogf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/mmu/shadow_mmu.c:50:8: error: redefinition of 'struct pte_list_desc'
      50 | struct pte_list_desc {
         |        ^~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:20:
   arch/x86/kvm/mmu/shadow_mmu.h:29:8: note: originally defined here
      29 | struct pte_list_desc {
         |        ^~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c: In function 'drop_large_spte':
   arch/x86/kvm/mmu/shadow_mmu.c:811:17: error: implicit declaration of function 'kvm_flush_remote_tlbs_sptep'; did you mean 'kvm_flush_remote_tlbs_gfn'? [-Werror=implicit-function-declaration]
     811 |                 kvm_flush_remote_tlbs_sptep(kvm, sptep);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 kvm_flush_remote_tlbs_gfn
   arch/x86/kvm/mmu/shadow_mmu.c: At top level:
   arch/x86/kvm/mmu/shadow_mmu.c:905:13: error: static declaration of 'kvm_zap_rmap' follows non-static declaration
     905 | static bool kvm_zap_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
         |             ^~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:20:
   arch/x86/kvm/mmu/shadow_mmu.h:41:6: note: previous declaration of 'kvm_zap_rmap' with type 'bool(struct kvm *, struct kvm_rmap_head *, struct kvm_memory_slot *, gfn_t,  int,  pte_t)' {aka '_Bool(struct kvm *, struct kvm_rmap_head *, struct kvm_memory_slot *, long long unsigned int,  int,  pte_t)'}
      41 | bool kvm_zap_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
         |      ^~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:912:13: error: static declaration of 'kvm_set_pte_rmap' follows non-static declaration
     912 | static bool kvm_set_pte_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
         |             ^~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:20:
   arch/x86/kvm/mmu/shadow_mmu.h:44:6: note: previous declaration of 'kvm_set_pte_rmap' with type 'bool(struct kvm *, struct kvm_rmap_head *, struct kvm_memory_slot *, gfn_t,  int,  pte_t)' {aka '_Bool(struct kvm *, struct kvm_rmap_head *, struct kvm_memory_slot *, long long unsigned int,  int,  pte_t)'}
      44 | bool kvm_set_pte_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
         |      ^~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1025:29: error: static declaration of 'kvm_handle_gfn_range' follows non-static declaration
    1025 | static __always_inline bool kvm_handle_gfn_range(struct kvm *kvm,
         |                             ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:20:
   arch/x86/kvm/mmu/shadow_mmu.h:51:6: note: previous declaration of 'kvm_handle_gfn_range' with type 'bool(struct kvm *, struct kvm_gfn_range *, bool (*)(struct kvm *, struct kvm_rmap_head *, struct kvm_memory_slot *, gfn_t,  int,  pte_t))' {aka '_Bool(struct kvm *, struct kvm_gfn_range *, _Bool (*)(struct kvm *, struct kvm_rmap_head *, struct kvm_memory_slot *, long long unsigned int,  int,  pte_t))'}
      51 | bool kvm_handle_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range,
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1040:13: error: static declaration of 'kvm_age_rmap' follows non-static declaration
    1040 | static bool kvm_age_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
         |             ^~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:20:
   arch/x86/kvm/mmu/shadow_mmu.h:54:6: note: previous declaration of 'kvm_age_rmap' with type 'bool(struct kvm *, struct kvm_rmap_head *, struct kvm_memory_slot *, gfn_t,  int,  pte_t)' {aka '_Bool(struct kvm *, struct kvm_rmap_head *, struct kvm_memory_slot *, long long unsigned int,  int,  pte_t)'}
      54 | bool kvm_age_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
         |      ^~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1054:13: error: static declaration of 'kvm_test_age_rmap' follows non-static declaration
    1054 | static bool kvm_test_age_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
         |             ^~~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:20:
   arch/x86/kvm/mmu/shadow_mmu.h:57:6: note: previous declaration of 'kvm_test_age_rmap' with type 'bool(struct kvm *, struct kvm_rmap_head *, struct kvm_memory_slot *, gfn_t,  int,  pte_t)' {aka '_Bool(struct kvm *, struct kvm_rmap_head *, struct kvm_memory_slot *, long long unsigned int,  int,  pte_t)'}
      57 | bool kvm_test_age_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
         |      ^~~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:2960:
   arch/x86/kvm/mmu/paging_tmpl.h:54:29: warning: no previous prototype for 'ept_sync_spte' [-Wmissing-prototypes]
      54 |         #define FNAME(name) ept_##name
         |                             ^~~~
   arch/x86/kvm/mmu/paging_tmpl.h:883:5: note: in expansion of macro 'FNAME'
     883 | int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int i)
         |     ^~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:2964:
   arch/x86/kvm/mmu/paging_tmpl.h:27:29: warning: no previous prototype for 'paging64_sync_spte' [-Wmissing-prototypes]
      27 |         #define FNAME(name) paging##64_##name
         |                             ^~~~~~
   arch/x86/kvm/mmu/paging_tmpl.h:883:5: note: in expansion of macro 'FNAME'
     883 | int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int i)
         |     ^~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:2968:
   arch/x86/kvm/mmu/paging_tmpl.h:40:29: warning: no previous prototype for 'paging32_sync_spte' [-Wmissing-prototypes]
      40 |         #define FNAME(name) paging##32_##name
         |                             ^~~~~~
   arch/x86/kvm/mmu/paging_tmpl.h:883:5: note: in expansion of macro 'FNAME'
     883 | int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int i)
         |     ^~~~~
>> arch/x86/kvm/mmu/shadow_mmu.c:3316:6: warning: no previous prototype for 'slot_rmap_write_protect' [-Wmissing-prototypes]
    3316 | bool slot_rmap_write_protect(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1294:13: warning: 'kvm_mmu_prepare_zap_page' declared 'static' but never defined [-Wunused-function]
    1294 | static bool kvm_mmu_prepare_zap_page(struct kvm *kvm, struct kvm_mmu_page *sp,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1296:13: warning: 'kvm_mmu_commit_zap_page' declared 'static' but never defined [-Wunused-function]
    1296 | static void kvm_mmu_commit_zap_page(struct kvm *kvm,
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1054:13: warning: 'kvm_test_age_rmap' defined but not used [-Wunused-function]
    1054 | static bool kvm_test_age_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
         |             ^~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1040:13: warning: 'kvm_age_rmap' defined but not used [-Wunused-function]
    1040 | static bool kvm_age_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
         |             ^~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:912:13: warning: 'kvm_set_pte_rmap' defined but not used [-Wunused-function]
     912 | static bool kvm_set_pte_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
         |             ^~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:905:13: warning: 'kvm_zap_rmap' defined but not used [-Wunused-function]
     905 | static bool kvm_zap_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
         |             ^~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:685:13: warning: 'rmap_can_add' defined but not used [-Wunused-function]
     685 | static bool rmap_can_add(struct kvm_vcpu *vcpu)
         |             ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/slot_rmap_write_protect +3316 arch/x86/kvm/mmu/shadow_mmu.c

6b83197856f485 Ben Gardon 2023-02-02  3315  
6b83197856f485 Ben Gardon 2023-02-02 @3316  bool slot_rmap_write_protect(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
6b83197856f485 Ben Gardon 2023-02-02  3317  			     const struct kvm_memory_slot *slot)
6b83197856f485 Ben Gardon 2023-02-02  3318  {
6b83197856f485 Ben Gardon 2023-02-02  3319  	return rmap_write_protect(rmap_head, false);
6b83197856f485 Ben Gardon 2023-02-02  3320  }
6b83197856f485 Ben Gardon 2023-02-02  3321  

:::::: The code at line 3316 was first introduced by commit
:::::: 6b83197856f485c960da6f39a01d447f0589aa1b KVM: x86/MMU: Move the Shadow MMU implementation to shadow_mmu.c

:::::: TO: Ben Gardon <bgardon@google.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
