Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63AF7EC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 06:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679119657; x=1710655657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CPSG7mUJf+l3DD60UNSvmiXngEWUy4dDEhwDapnBj0M=;
  b=kFEqxbgLtvBzCqyFWw8vfCFv6gq29i6DNFrZm416TR+WAkiVz25HQ3dG
   0zA3iVRvopcK2r+WBVXvLP/sYDVRj25LO4UMY7PJYsX1PPhH7E/ye4Szp
   25SMl0tlTdbQBGq+9aLIuCrkHbUCZ7TY1nKwvIGPG+a79aWBhgYFwUBHk
   iev6kfBixybtQr3xX4HteQyAwH7wXzB36Hsjaj6HdtuICjsLOEN0sY+33
   oc+DvonIh+By5rFw3a/r3Xz9o9glDANSe1yi+3jCRH+kMtfdoMzP79jW0
   N0e79vft9ycAnYLG19d1PcdzaRRqPsix0B56zTvVnpoqWJJiYKijDtWvF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="338432289"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="338432289"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 23:07:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="749517300"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="749517300"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Mar 2023 23:07:35 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdPj5-0009qm-01;
	Sat, 18 Mar 2023 06:07:35 +0000
Date: Sat, 18 Mar 2023 14:06:47 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Gardon <bgardon@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Christopherson <seanjc@google.com>
Subject: [sean-jc:x86/formalize_shadow_mmu 27/39]
 arch/x86/kvm/mmu/mmu.c:2129:30: error: 'paging64_sync_spte' undeclared; did
 you mean 'paging64_sync_page'?
Message-ID: <202303181427.aTT44wt4-lkp@intel.com>
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
commit: 47e60247f1c316484333b71439780fd37a2c1014 [27/39] KVM: x86/MMU: Move paging_tmpl.h includes to shadow_mmu.c
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230318/202303181427.aTT44wt4-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/sean-jc/linux/commit/47e60247f1c316484333b71439780fd37a2c1014
        git remote add sean-jc https://github.com/sean-jc/linux
        git fetch --no-tags sean-jc x86/formalize_shadow_mmu
        git checkout 47e60247f1c316484333b71439780fd37a2c1014
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181427.aTT44wt4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/x86/kvm/mmu/mmu.c:167:14: error: static declaration of 'kvm_mmu_page_get_gfn' follows non-static declaration
     167 | static gfn_t kvm_mmu_page_get_gfn(struct kvm_mmu_page *sp, int index);
         |              ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/mmu.c:24:
   arch/x86/kvm/mmu/shadow_mmu.h:57:7: note: previous declaration of 'kvm_mmu_page_get_gfn' with type 'gfn_t(struct kvm_mmu_page *, int)' {aka 'long long unsigned int(struct kvm_mmu_page *, int)'}
      57 | gfn_t kvm_mmu_page_get_gfn(struct kvm_mmu_page *sp, int index);
         |       ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:758:1: error: version control conflict marker in file
     758 | <<<<<<< HEAD
         | ^~~~~~~
   arch/x86/kvm/mmu/mmu.c: In function 'kvm_handle_error_pfn':
   arch/x86/kvm/mmu/mmu.c:785:17: error: implicit declaration of function 'kvm_send_hwpoison_signal' [-Werror=implicit-function-declaration]
     785 |                 kvm_send_hwpoison_signal(fault->slot, fault->gfn);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c: In function 'paging64_init_context':
>> arch/x86/kvm/mmu/mmu.c:2129:30: error: 'paging64_sync_spte' undeclared (first use in this function); did you mean 'paging64_sync_page'?
    2129 |         context->sync_spte = paging64_sync_spte;
         |                              ^~~~~~~~~~~~~~~~~~
         |                              paging64_sync_page
   arch/x86/kvm/mmu/mmu.c:2129:30: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/kvm/mmu/mmu.c: In function 'paging32_init_context':
>> arch/x86/kvm/mmu/mmu.c:2136:30: error: 'paging32_sync_spte' undeclared (first use in this function); did you mean 'paging32_sync_page'?
    2136 |         context->sync_spte = paging32_sync_spte;
         |                              ^~~~~~~~~~~~~~~~~~
         |                              paging32_sync_page
   arch/x86/kvm/mmu/mmu.c: In function 'kvm_init_shadow_ept_mmu':
>> arch/x86/kvm/mmu/mmu.c:2355:38: error: 'ept_sync_spte' undeclared (first use in this function); did you mean 'ept_sync_page'?
    2355 |                 context->sync_spte = ept_sync_spte;
         |                                      ^~~~~~~~~~~~~
         |                                      ept_sync_page
   arch/x86/kvm/mmu/mmu.c: In function '__kvm_mmu_invalidate_addr':
   arch/x86/kvm/mmu/mmu.c:2588:35: error: implicit declaration of function 'kvm_sync_spte' [-Werror=implicit-function-declaration]
    2588 |                         int ret = kvm_sync_spte(vcpu, sp, iterator.index);
         |                                   ^~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c: At top level:
   arch/x86/kvm/mmu/mmu.c:167:14: warning: 'kvm_mmu_page_get_gfn' used but never defined
     167 | static gfn_t kvm_mmu_page_get_gfn(struct kvm_mmu_page *sp, int index);
         |              ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1732:29: error: static declaration of 'kvm_mmu_get_child_sp' follows non-static declaration
    1732 | static struct kvm_mmu_page *kvm_mmu_get_child_sp(struct kvm_vcpu *vcpu,
         |                             ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:20:
   arch/x86/kvm/mmu/shadow_mmu.h:94:22: note: previous declaration of 'kvm_mmu_get_child_sp' with type 'struct kvm_mmu_page *(struct kvm_vcpu *, u64 *, gfn_t,  bool,  unsigned int)' {aka 'struct kvm_mmu_page *(struct kvm_vcpu *, long long unsigned int *, long long unsigned int,  _Bool,  unsigned int)'}
      94 | struct kvm_mmu_page *kvm_mmu_get_child_sp(struct kvm_vcpu *vcpu, u64 *sptep,
         |                      ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1745:13: error: conflicting types for 'shadow_walk_init_using_root'; have 'void(struct kvm_shadow_walk_iterator *, struct kvm_vcpu *, hpa_t,  u64)' {aka 'void(struct kvm_shadow_walk_iterator *, struct kvm_vcpu *, long long unsigned int,  long long unsigned int)'}
    1745 | static void shadow_walk_init_using_root(struct kvm_shadow_walk_iterator *iterator,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:20:
   arch/x86/kvm/mmu/shadow_mmu.h:98:6: note: previous declaration of 'shadow_walk_init_using_root' with type 'void(struct kvm_shadow_walk_iterator *, struct kvm_vcpu *, hpa_t,  u64)' {aka 'void(struct kvm_shadow_walk_iterator *, struct kvm_vcpu *, long long unsigned int,  long long unsigned int)'}
      98 | void shadow_walk_init_using_root(struct kvm_shadow_walk_iterator *iterator,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1774:13: error: conflicting types for 'shadow_walk_init'; have 'void(struct kvm_shadow_walk_iterator *, struct kvm_vcpu *, u64)' {aka 'void(struct kvm_shadow_walk_iterator *, struct kvm_vcpu *, long long unsigned int)'}
    1774 | static void shadow_walk_init(struct kvm_shadow_walk_iterator *iterator,
         |             ^~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:20:
   arch/x86/kvm/mmu/shadow_mmu.h:100:6: note: previous declaration of 'shadow_walk_init' with type 'void(struct kvm_shadow_walk_iterator *, struct kvm_vcpu *, u64)' {aka 'void(struct kvm_shadow_walk_iterator *, struct kvm_vcpu *, long long unsigned int)'}
     100 | void shadow_walk_init(struct kvm_shadow_walk_iterator *iterator,
         |      ^~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1781:13: error: conflicting types for 'shadow_walk_okay'; have 'bool(struct kvm_shadow_walk_iterator *)' {aka '_Bool(struct kvm_shadow_walk_iterator *)'}
    1781 | static bool shadow_walk_okay(struct kvm_shadow_walk_iterator *iterator)
         |             ^~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:20:
   arch/x86/kvm/mmu/shadow_mmu.h:102:6: note: previous declaration of 'shadow_walk_okay' with type 'bool(struct kvm_shadow_walk_iterator *)' {aka '_Bool(struct kvm_shadow_walk_iterator *)'}
     102 | bool shadow_walk_okay(struct kvm_shadow_walk_iterator *iterator);
         |      ^~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1803:13: error: conflicting types for 'shadow_walk_next'; have 'void(struct kvm_shadow_walk_iterator *)'
    1803 | static void shadow_walk_next(struct kvm_shadow_walk_iterator *iterator)
         |             ^~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:20:
   arch/x86/kvm/mmu/shadow_mmu.h:103:6: note: previous declaration of 'shadow_walk_next' with type 'void(struct kvm_shadow_walk_iterator *)'
     103 | void shadow_walk_next(struct kvm_shadow_walk_iterator *iterator);
         |      ^~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1843:13: error: static declaration of 'link_shadow_page' follows non-static declaration
    1843 | static void link_shadow_page(struct kvm_vcpu *vcpu, u64 *sptep,
         |             ^~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:20:
   arch/x86/kvm/mmu/shadow_mmu.h:105:6: note: previous declaration of 'link_shadow_page' with type 'void(struct kvm_vcpu *, u64 *, struct kvm_mmu_page *)' {aka 'void(struct kvm_vcpu *, long long unsigned int *, struct kvm_mmu_page *)'}
     105 | void link_shadow_page(struct kvm_vcpu *vcpu, u64 *sptep, struct kvm_mmu_page *sp);
         |      ^~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1849:13: error: static declaration of 'validate_direct_spte' follows non-static declaration
    1849 | static void validate_direct_spte(struct kvm_vcpu *vcpu, u64 *sptep,
         |             ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:20:
   arch/x86/kvm/mmu/shadow_mmu.h:107:6: note: previous declaration of 'validate_direct_spte' with type 'void(struct kvm_vcpu *, u64 *, unsigned int)' {aka 'void(struct kvm_vcpu *, long long unsigned int *, unsigned int)'}
     107 | void validate_direct_spte(struct kvm_vcpu *vcpu, u64 *sptep,
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1872:12: error: static declaration of 'mmu_page_zap_pte' follows non-static declaration
    1872 | static int mmu_page_zap_pte(struct kvm *kvm, struct kvm_mmu_page *sp,
         |            ^~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:20:
   arch/x86/kvm/mmu/shadow_mmu.h:110:5: note: previous declaration of 'mmu_page_zap_pte' with type 'int(struct kvm *, struct kvm_mmu_page *, u64 *, struct list_head *)' {aka 'int(struct kvm *, struct kvm_mmu_page *, long long unsigned int *, struct list_head *)'}
     110 | int mmu_page_zap_pte(struct kvm *kvm, struct kvm_mmu_page *sp, u64 *spte,
         |     ^~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1948:13: error: static declaration of '__kvm_mmu_prepare_zap_page' follows non-static declaration
    1948 | static bool __kvm_mmu_prepare_zap_page(struct kvm *kvm,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:20:
   arch/x86/kvm/mmu/shadow_mmu.h:112:6: note: previous declaration of '__kvm_mmu_prepare_zap_page' with type 'bool(struct kvm *, struct kvm_mmu_page *, struct list_head *, int *)' {aka '_Bool(struct kvm *, struct kvm_mmu_page *, struct list_head *, int *)'}
     112 | bool __kvm_mmu_prepare_zap_page(struct kvm *kvm, struct kvm_mmu_page *sp,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:2093:12: error: static declaration of 'make_mmu_pages_available' follows non-static declaration
    2093 | static int make_mmu_pages_available(struct kvm_vcpu *vcpu)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:20:
   arch/x86/kvm/mmu/shadow_mmu.h:119:5: note: previous declaration of 'make_mmu_pages_available' with type 'int(struct kvm_vcpu *)'
     119 | int make_mmu_pages_available(struct kvm_vcpu *vcpu);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:2157:12: error: static declaration of 'kvm_mmu_unprotect_page_virt' follows non-static declaration
    2157 | static int kvm_mmu_unprotect_page_virt(struct kvm_vcpu *vcpu, gva_t gva)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:20:
   arch/x86/kvm/mmu/shadow_mmu.h:121:5: note: previous declaration of 'kvm_mmu_unprotect_page_virt' with type 'int(struct kvm_vcpu *, gva_t)' {aka 'int(struct kvm_vcpu *, long unsigned int)'}
     121 | int kvm_mmu_unprotect_page_virt(struct kvm_vcpu *vcpu, gva_t gva);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:2288:12: error: static declaration of 'mmu_set_spte' follows non-static declaration
    2288 | static int mmu_set_spte(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
         |            ^~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:20:
   arch/x86/kvm/mmu/shadow_mmu.h:123:5: note: previous declaration of 'mmu_set_spte' with type 'int(struct kvm_vcpu *, struct kvm_memory_slot *, u64 *, unsigned int,  gfn_t,  kvm_pfn_t,  struct kvm_page_fault *)' {aka 'int(struct kvm_vcpu *, struct kvm_memory_slot *, long long unsigned int *, unsigned int,  long long unsigned int,  long long unsigned int,  struct kvm_page_fault *)'}
     123 | int mmu_set_spte(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
         |     ^~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:2394:13: error: static declaration of '__direct_pte_prefetch' follows non-static declaration
    2394 | static void __direct_pte_prefetch(struct kvm_vcpu *vcpu,
         |             ^~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:20:
   arch/x86/kvm/mmu/shadow_mmu.h:126:6: note: previous declaration of '__direct_pte_prefetch' with type 'void(struct kvm_vcpu *, struct kvm_mmu_page *, u64 *)' {aka 'void(struct kvm_vcpu *, struct kvm_mmu_page *, long long unsigned int *)'}
     126 | void __direct_pte_prefetch(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:2446:12: error: static declaration of 'direct_map' follows non-static declaration
    2446 | static int direct_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
         |            ^~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:20:
   arch/x86/kvm/mmu/shadow_mmu.h:128:5: note: previous declaration of 'direct_map' with type 'int(struct kvm_vcpu *, struct kvm_page_fault *)'
     128 | int direct_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault);
         |     ^~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:2960:
>> arch/x86/kvm/mmu/paging_tmpl.h:54:29: warning: no previous prototype for 'ept_sync_spte' [-Wmissing-prototypes]
      54 |         #define FNAME(name) ept_##name
         |                             ^~~~
   arch/x86/kvm/mmu/paging_tmpl.h:883:5: note: in expansion of macro 'FNAME'
     883 | int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int i)
         |     ^~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:2964:
>> arch/x86/kvm/mmu/paging_tmpl.h:27:29: warning: no previous prototype for 'paging64_sync_spte' [-Wmissing-prototypes]
      27 |         #define FNAME(name) paging##64_##name
         |                             ^~~~~~
   arch/x86/kvm/mmu/paging_tmpl.h:883:5: note: in expansion of macro 'FNAME'
     883 | int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int i)
         |     ^~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:2968:
>> arch/x86/kvm/mmu/paging_tmpl.h:40:29: warning: no previous prototype for 'paging32_sync_spte' [-Wmissing-prototypes]
      40 |         #define FNAME(name) paging##32_##name
         |                             ^~~~~~
   arch/x86/kvm/mmu/paging_tmpl.h:883:5: note: in expansion of macro 'FNAME'
     883 | int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int i)
         |     ^~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:3203:29: error: static declaration of 'walk_slot_rmaps' follows non-static declaration
    3203 | static __always_inline bool walk_slot_rmaps(struct kvm *kvm,
         |                             ^~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:20:
   arch/x86/kvm/mmu/shadow_mmu.h:145:6: note: previous declaration of 'walk_slot_rmaps' with type 'bool(struct kvm *, const struct kvm_memory_slot *, bool (*)(struct kvm *, struct kvm_rmap_head *, const struct kvm_memory_slot *), int,  int,  bool)' {aka '_Bool(struct kvm *, const struct kvm_memory_slot *, _Bool (*)(struct kvm *, struct kvm_rmap_head *, const struct kvm_memory_slot *), int,  int,  _Bool)'}
     145 | bool walk_slot_rmaps(struct kvm *kvm, const struct kvm_memory_slot *slot,
         |      ^~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:3214:29: error: static declaration of 'walk_slot_rmaps_4k' follows non-static declaration
    3214 | static __always_inline bool walk_slot_rmaps_4k(struct kvm *kvm,
         |                             ^~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:20:
   arch/x86/kvm/mmu/shadow_mmu.h:148:6: note: previous declaration of 'walk_slot_rmaps_4k' with type 'bool(struct kvm *, const struct kvm_memory_slot *, bool (*)(struct kvm *, struct kvm_rmap_head *, const struct kvm_memory_slot *), bool)' {aka '_Bool(struct kvm *, const struct kvm_memory_slot *, _Bool (*)(struct kvm *, struct kvm_rmap_head *, const struct kvm_memory_slot *), _Bool)'}
     148 | bool walk_slot_rmaps_4k(struct kvm *kvm, const struct kvm_memory_slot *slot,
         |      ^~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:3535:13: error: static declaration of 'kvm_rmap_zap_collapsible_sptes' follows non-static declaration
    3535 | static void kvm_rmap_zap_collapsible_sptes(struct kvm *kvm,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:20:
   arch/x86/kvm/mmu/shadow_mmu.h:161:6: note: previous declaration of 'kvm_rmap_zap_collapsible_sptes' with type 'void(struct kvm *, const struct kvm_memory_slot *)'
     161 | void kvm_rmap_zap_collapsible_sptes(struct kvm *kvm,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:3535:13: warning: 'kvm_rmap_zap_collapsible_sptes' defined but not used [-Wunused-function]
    3535 | static void kvm_rmap_zap_collapsible_sptes(struct kvm *kvm,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:2446:12: warning: 'direct_map' defined but not used [-Wunused-function]
    2446 | static int direct_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
         |            ^~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:2157:12: warning: 'kvm_mmu_unprotect_page_virt' defined but not used [-Wunused-function]
    2157 | static int kvm_mmu_unprotect_page_virt(struct kvm_vcpu *vcpu, gva_t gva)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   cc1: some warnings being treated as errors


vim +2129 arch/x86/kvm/mmu/mmu.c

6fd01b711bee96 arch/x86/kvm/mmu.c     Avi Kivity          2012-09-12  2124  
fe660f7244d7e2 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-06-22  2125  static void paging64_init_context(struct kvm_mmu *context)
6aa8b732ca01c3 drivers/kvm/mmu.c      Avi Kivity          2006-12-10  2126  {
6aa8b732ca01c3 drivers/kvm/mmu.c      Avi Kivity          2006-12-10  2127  	context->page_fault = paging64_page_fault;
6aa8b732ca01c3 drivers/kvm/mmu.c      Avi Kivity          2006-12-10  2128  	context->gva_to_gpa = paging64_gva_to_gpa;
c3c6c9fc5d24bc arch/x86/kvm/mmu/mmu.c Lai Jiangshan       2023-02-16 @2129  	context->sync_spte = paging64_sync_spte;
6aa8b732ca01c3 drivers/kvm/mmu.c      Avi Kivity          2006-12-10  2130  }
6aa8b732ca01c3 drivers/kvm/mmu.c      Avi Kivity          2006-12-10  2131  
84a16226046d1c arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-06-22  2132  static void paging32_init_context(struct kvm_mmu *context)
6aa8b732ca01c3 drivers/kvm/mmu.c      Avi Kivity          2006-12-10  2133  {
6aa8b732ca01c3 drivers/kvm/mmu.c      Avi Kivity          2006-12-10  2134  	context->page_fault = paging32_page_fault;
6aa8b732ca01c3 drivers/kvm/mmu.c      Avi Kivity          2006-12-10  2135  	context->gva_to_gpa = paging32_gva_to_gpa;
c3c6c9fc5d24bc arch/x86/kvm/mmu/mmu.c Lai Jiangshan       2023-02-16 @2136  	context->sync_spte = paging32_sync_spte;
6aa8b732ca01c3 drivers/kvm/mmu.c      Avi Kivity          2006-12-10  2137  }
6aa8b732ca01c3 drivers/kvm/mmu.c      Avi Kivity          2006-12-10  2138  

:::::: The code at line 2129 was first introduced by commit
:::::: c3c6c9fc5d24bcafbbeda2edb521b70f5df052b7 KVM: x86/mmu: Move the code out of FNAME(sync_page)'s loop body into mmu.c

:::::: TO: Lai Jiangshan <jiangshan.ljs@antgroup.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
