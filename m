Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBDE7EA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 05:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679116536; x=1710652536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6qhHoKc35bNrtScjvZUjEnaaS4X76+xo3xaDDQy3NmU=;
  b=LMUGoRY7B/MB9qoe+YjgplhzGUPQFQrdq9S+cmb8DaBlU3xfufaVtTrx
   ZYflhFNv0tMuFQAFTCIp77h3R4Fy0qxc0CzEEbMKbIeaISsIgEOxoJkqc
   OExI5IK2EfB/32SlTRH4potiDSx97KWNvRTjiG/bnjKiFlPBvl/hRysjo
   wlX6Wg9J5WGPQVkOxl+NsBW78KlJxt5AJYdUhGDCBADnMMisUDZ6XkL6c
   slhtBD0fuh86EubdOmduoktg0P0d3mZ2I1YflSwcfF8CZJafdiZvhZ6YA
   tlEtDrS/eYRaOk2pXoLvZ5jgpDNMVxmoBiJEfcCX3drYmOHvUrS3UR84D
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="322256706"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="322256706"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 22:15:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="710735631"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="710735631"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 17 Mar 2023 22:15:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdOuj-0009pG-2J;
	Sat, 18 Mar 2023 05:15:33 +0000
Date: Sat, 18 Mar 2023 13:15:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Gardon <bgardon@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Christopherson <seanjc@google.com>
Subject: [sean-jc:x86/formalize_shadow_mmu 25/39]
 arch/x86/kvm/mmu/mmu.c:806:1: error: version control conflict marker in file
Message-ID: <202303181309.XryQAFFi-lkp@intel.com>
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
commit: 6b83197856f485c960da6f39a01d447f0589aa1b [25/39] KVM: x86/MMU: Move the Shadow MMU implementation to shadow_mmu.c
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230318/202303181309.XryQAFFi-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/sean-jc/linux/commit/6b83197856f485c960da6f39a01d447f0589aa1b
        git remote add sean-jc https://github.com/sean-jc/linux
        git fetch --no-tags sean-jc x86/formalize_shadow_mmu
        git checkout 6b83197856f485c960da6f39a01d447f0589aa1b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181309.XryQAFFi-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/x86/kvm/mmu/mmu.c:215:14: error: static declaration of 'kvm_mmu_page_get_gfn' follows non-static declaration
     215 | static gfn_t kvm_mmu_page_get_gfn(struct kvm_mmu_page *sp, int index);
         |              ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/mmu.c:24:
   arch/x86/kvm/mmu/shadow_mmu.h:57:7: note: previous declaration of 'kvm_mmu_page_get_gfn' with type 'gfn_t(struct kvm_mmu_page *, int)' {aka 'long long unsigned int(struct kvm_mmu_page *, int)'}
      57 | gfn_t kvm_mmu_page_get_gfn(struct kvm_mmu_page *sp, int index);
         |       ^~~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/mmu/mmu.c:806:1: error: version control conflict marker in file
     806 | <<<<<<< HEAD
         | ^~~~~~~
   arch/x86/kvm/mmu/mmu.c: In function 'kvm_handle_error_pfn':
>> arch/x86/kvm/mmu/mmu.c:833:17: error: implicit declaration of function 'kvm_send_hwpoison_signal' [-Werror=implicit-function-declaration]
     833 |                 kvm_send_hwpoison_signal(fault->slot, fault->gfn);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/mmu.c:1781:
   arch/x86/kvm/mmu/paging_tmpl.h: In function 'ept_fetch':
   arch/x86/kvm/mmu/paging_tmpl.h:644:9: error: implicit declaration of function 'for_each_shadow_entry' [-Werror=implicit-function-declaration]
     644 |         for_each_shadow_entry(vcpu, fault->addr, it) {
         |         ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/paging_tmpl.h:644:53: error: expected ';' before '{' token
     644 |         for_each_shadow_entry(vcpu, fault->addr, it) {
         |                                                     ^~
         |                                                     ;
   arch/x86/kvm/mmu/paging_tmpl.h:622:37: warning: unused variable 'access' [-Wunused-variable]
     622 |         unsigned int direct_access, access;
         |                                     ^~~~~~
   arch/x86/kvm/mmu/paging_tmpl.h: In function 'ept_sync_spte':
   arch/x86/kvm/mmu/paging_tmpl.h:934:13: error: implicit declaration of function 'kvm_mmu_page_get_access'; did you mean 'kvm_mmu_page_set_access'? [-Werror=implicit-function-declaration]
     934 |         if (kvm_mmu_page_get_access(sp, i) == pte_access)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
         |             kvm_mmu_page_set_access
   In file included from arch/x86/kvm/mmu/mmu.c:1785:
   arch/x86/kvm/mmu/paging_tmpl.h: In function 'paging64_fetch':
   arch/x86/kvm/mmu/paging_tmpl.h:644:53: error: expected ';' before '{' token
     644 |         for_each_shadow_entry(vcpu, fault->addr, it) {
         |                                                     ^~
         |                                                     ;
   arch/x86/kvm/mmu/paging_tmpl.h:622:37: warning: unused variable 'access' [-Wunused-variable]
     622 |         unsigned int direct_access, access;
         |                                     ^~~~~~
   In file included from arch/x86/kvm/mmu/mmu.c:1789:
   arch/x86/kvm/mmu/paging_tmpl.h: In function 'paging32_fetch':
   arch/x86/kvm/mmu/paging_tmpl.h:644:53: error: expected ';' before '{' token
     644 |         for_each_shadow_entry(vcpu, fault->addr, it) {
         |                                                     ^~
         |                                                     ;
   arch/x86/kvm/mmu/paging_tmpl.h:622:37: warning: unused variable 'access' [-Wunused-variable]
     622 |         unsigned int direct_access, access;
         |                                     ^~~~~~
   arch/x86/kvm/mmu/mmu.c: In function '__kvm_mmu_invalidate_addr':
   arch/x86/kvm/mmu/mmu.c:2667:35: error: implicit declaration of function 'kvm_sync_spte'; did you mean 'ept_sync_spte'? [-Werror=implicit-function-declaration]
    2667 |                         int ret = kvm_sync_spte(vcpu, sp, iterator.index);
         |                                   ^~~~~~~~~~~~~
         |                                   ept_sync_spte
   arch/x86/kvm/mmu/mmu.c: At top level:
>> arch/x86/kvm/mmu/mmu.c:215:14: warning: 'kvm_mmu_page_get_gfn' used but never defined
     215 | static gfn_t kvm_mmu_page_get_gfn(struct kvm_mmu_page *sp, int index);
         |              ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
>> arch/x86/kvm/mmu/shadow_mmu.c:48:8: error: redefinition of 'struct pte_list_desc'
      48 | struct pte_list_desc {
         |        ^~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:18:
   arch/x86/kvm/mmu/shadow_mmu.h:29:8: note: originally defined here
      29 | struct pte_list_desc {
         |        ^~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:57:8: error: redefinition of 'struct kvm_shadow_walk_iterator'
      57 | struct kvm_shadow_walk_iterator {
         |        ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:18:
   arch/x86/kvm/mmu/shadow_mmu.h:41:8: note: originally defined here
      41 | struct kvm_shadow_walk_iterator {
         |        ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c: In function 'drop_large_spte':
>> arch/x86/kvm/mmu/shadow_mmu.c:809:17: error: implicit declaration of function 'kvm_flush_remote_tlbs_sptep'; did you mean 'kvm_flush_remote_tlbs_gfn'? [-Werror=implicit-function-declaration]
     809 |                 kvm_flush_remote_tlbs_sptep(kvm, sptep);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 kvm_flush_remote_tlbs_gfn
   arch/x86/kvm/mmu/shadow_mmu.c: At top level:
   arch/x86/kvm/mmu/shadow_mmu.c:903:13: error: static declaration of 'kvm_zap_rmap' follows non-static declaration
     903 | static bool kvm_zap_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
         |             ^~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:18:
   arch/x86/kvm/mmu/shadow_mmu.h:68:6: note: previous declaration of 'kvm_zap_rmap' with type 'bool(struct kvm *, struct kvm_rmap_head *, struct kvm_memory_slot *, gfn_t,  int,  pte_t)' {aka '_Bool(struct kvm *, struct kvm_rmap_head *, struct kvm_memory_slot *, long long unsigned int,  int,  pte_t)'}
      68 | bool kvm_zap_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
         |      ^~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:910:13: error: static declaration of 'kvm_set_pte_rmap' follows non-static declaration
     910 | static bool kvm_set_pte_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
         |             ^~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:18:
   arch/x86/kvm/mmu/shadow_mmu.h:71:6: note: previous declaration of 'kvm_set_pte_rmap' with type 'bool(struct kvm *, struct kvm_rmap_head *, struct kvm_memory_slot *, gfn_t,  int,  pte_t)' {aka '_Bool(struct kvm *, struct kvm_rmap_head *, struct kvm_memory_slot *, long long unsigned int,  int,  pte_t)'}
      71 | bool kvm_set_pte_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
         |      ^~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1023:29: error: static declaration of 'kvm_handle_gfn_range' follows non-static declaration
    1023 | static __always_inline bool kvm_handle_gfn_range(struct kvm *kvm,
         |                             ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:18:
   arch/x86/kvm/mmu/shadow_mmu.h:78:6: note: previous declaration of 'kvm_handle_gfn_range' with type 'bool(struct kvm *, struct kvm_gfn_range *, bool (*)(struct kvm *, struct kvm_rmap_head *, struct kvm_memory_slot *, gfn_t,  int,  pte_t))' {aka '_Bool(struct kvm *, struct kvm_gfn_range *, _Bool (*)(struct kvm *, struct kvm_rmap_head *, struct kvm_memory_slot *, long long unsigned int,  int,  pte_t))'}
      78 | bool kvm_handle_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range,
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1038:13: error: static declaration of 'kvm_age_rmap' follows non-static declaration
    1038 | static bool kvm_age_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
         |             ^~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:18:
   arch/x86/kvm/mmu/shadow_mmu.h:81:6: note: previous declaration of 'kvm_age_rmap' with type 'bool(struct kvm *, struct kvm_rmap_head *, struct kvm_memory_slot *, gfn_t,  int,  pte_t)' {aka '_Bool(struct kvm *, struct kvm_rmap_head *, struct kvm_memory_slot *, long long unsigned int,  int,  pte_t)'}
      81 | bool kvm_age_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
         |      ^~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1052:13: error: static declaration of 'kvm_test_age_rmap' follows non-static declaration
    1052 | static bool kvm_test_age_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
         |             ^~~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:18:
   arch/x86/kvm/mmu/shadow_mmu.h:84:6: note: previous declaration of 'kvm_test_age_rmap' with type 'bool(struct kvm *, struct kvm_rmap_head *, struct kvm_memory_slot *, gfn_t,  int,  pte_t)' {aka '_Bool(struct kvm *, struct kvm_rmap_head *, struct kvm_memory_slot *, long long unsigned int,  int,  pte_t)'}
      84 | bool kvm_test_age_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
         |      ^~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1170:13: error: static declaration of 'drop_parent_pte' follows non-static declaration
    1170 | static void drop_parent_pte(struct kvm_mmu_page *sp,
         |             ^~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:18:
   arch/x86/kvm/mmu/shadow_mmu.h:88:6: note: previous declaration of 'drop_parent_pte' with type 'void(struct kvm_mmu_page *, u64 *)' {aka 'void(struct kvm_mmu_page *, long long unsigned int *)'}
      88 | void drop_parent_pte(struct kvm_mmu_page *sp, u64 *parent_pte);
         |      ^~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1293:13: error: static declaration of 'kvm_mmu_prepare_zap_page' follows non-static declaration
    1293 | static bool kvm_mmu_prepare_zap_page(struct kvm *kvm, struct kvm_mmu_page *sp,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:18:
   arch/x86/kvm/mmu/shadow_mmu.h:116:6: note: previous declaration of 'kvm_mmu_prepare_zap_page' with type 'bool(struct kvm *, struct kvm_mmu_page *, struct list_head *)' {aka '_Bool(struct kvm *, struct kvm_mmu_page *, struct list_head *)'}
     116 | bool kvm_mmu_prepare_zap_page(struct kvm *kvm, struct kvm_mmu_page *sp,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1295:13: error: static declaration of 'kvm_mmu_commit_zap_page' follows non-static declaration
    1295 | static void kvm_mmu_commit_zap_page(struct kvm *kvm,
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:18:
   arch/x86/kvm/mmu/shadow_mmu.h:118:6: note: previous declaration of 'kvm_mmu_commit_zap_page' with type 'void(struct kvm *, struct list_head *)'
     118 | void kvm_mmu_commit_zap_page(struct kvm *kvm, struct list_head *invalid_list);
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1730:29: error: static declaration of 'kvm_mmu_get_child_sp' follows non-static declaration
    1730 | static struct kvm_mmu_page *kvm_mmu_get_child_sp(struct kvm_vcpu *vcpu,
         |                             ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:18:
   arch/x86/kvm/mmu/shadow_mmu.h:95:22: note: previous declaration of 'kvm_mmu_get_child_sp' with type 'struct kvm_mmu_page *(struct kvm_vcpu *, u64 *, gfn_t,  bool,  unsigned int)' {aka 'struct kvm_mmu_page *(struct kvm_vcpu *, long long unsigned int *, long long unsigned int,  _Bool,  unsigned int)'}
      95 | struct kvm_mmu_page *kvm_mmu_get_child_sp(struct kvm_vcpu *vcpu, u64 *sptep,
         |                      ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1743:13: error: conflicting types for 'shadow_walk_init_using_root'; have 'void(struct kvm_shadow_walk_iterator *, struct kvm_vcpu *, hpa_t,  u64)' {aka 'void(struct kvm_shadow_walk_iterator *, struct kvm_vcpu *, long long unsigned int,  long long unsigned int)'}
    1743 | static void shadow_walk_init_using_root(struct kvm_shadow_walk_iterator *iterator,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:18:
   arch/x86/kvm/mmu/shadow_mmu.h:99:6: note: previous declaration of 'shadow_walk_init_using_root' with type 'void(struct kvm_shadow_walk_iterator *, struct kvm_vcpu *, hpa_t,  u64)' {aka 'void(struct kvm_shadow_walk_iterator *, struct kvm_vcpu *, long long unsigned int,  long long unsigned int)'}
      99 | void shadow_walk_init_using_root(struct kvm_shadow_walk_iterator *iterator,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1772:13: error: conflicting types for 'shadow_walk_init'; have 'void(struct kvm_shadow_walk_iterator *, struct kvm_vcpu *, u64)' {aka 'void(struct kvm_shadow_walk_iterator *, struct kvm_vcpu *, long long unsigned int)'}
    1772 | static void shadow_walk_init(struct kvm_shadow_walk_iterator *iterator,
         |             ^~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:18:
   arch/x86/kvm/mmu/shadow_mmu.h:101:6: note: previous declaration of 'shadow_walk_init' with type 'void(struct kvm_shadow_walk_iterator *, struct kvm_vcpu *, u64)' {aka 'void(struct kvm_shadow_walk_iterator *, struct kvm_vcpu *, long long unsigned int)'}
     101 | void shadow_walk_init(struct kvm_shadow_walk_iterator *iterator,
         |      ^~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1779:13: error: conflicting types for 'shadow_walk_okay'; have 'bool(struct kvm_shadow_walk_iterator *)' {aka '_Bool(struct kvm_shadow_walk_iterator *)'}
    1779 | static bool shadow_walk_okay(struct kvm_shadow_walk_iterator *iterator)
         |             ^~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:18:
   arch/x86/kvm/mmu/shadow_mmu.h:103:6: note: previous declaration of 'shadow_walk_okay' with type 'bool(struct kvm_shadow_walk_iterator *)' {aka '_Bool(struct kvm_shadow_walk_iterator *)'}
     103 | bool shadow_walk_okay(struct kvm_shadow_walk_iterator *iterator);
         |      ^~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1801:13: error: conflicting types for 'shadow_walk_next'; have 'void(struct kvm_shadow_walk_iterator *)'
    1801 | static void shadow_walk_next(struct kvm_shadow_walk_iterator *iterator)
         |             ^~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:18:
   arch/x86/kvm/mmu/shadow_mmu.h:104:6: note: previous declaration of 'shadow_walk_next' with type 'void(struct kvm_shadow_walk_iterator *)'
     104 | void shadow_walk_next(struct kvm_shadow_walk_iterator *iterator);
         |      ^~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/shadow_mmu.c:1841:13: error: static declaration of 'link_shadow_page' follows non-static declaration
    1841 | static void link_shadow_page(struct kvm_vcpu *vcpu, u64 *sptep,
         |             ^~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/mmu/shadow_mmu.c:18:
   arch/x86/kvm/mmu/shadow_mmu.h:106:6: note: previous declaration of 'link_shadow_page' with type 'void(struct kvm_vcpu *, u64 *, struct kvm_mmu_page *)' {aka 'void(struct kvm_vcpu *, long long unsigned int *, struct kvm_mmu_page *)'}


vim +806 arch/x86/kvm/mmu/mmu.c

   805	
 > 806	<<<<<<< HEAD
   807	
   808	=======
   809	>>>>>>> c69490fd540c (KVM: x86/MMU: Move the Shadow MMU implementation to shadow_mmu.c)
   810	static void kvm_send_hwpoison_signal(struct kvm_memory_slot *slot, gfn_t gfn)
   811	{
   812		unsigned long hva = gfn_to_hva_memslot(slot, gfn);
   813	
   814		send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva, PAGE_SHIFT, current);
   815	}
   816	
   817	static int kvm_handle_error_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
   818	{
   819		if (is_sigpending_pfn(fault->pfn)) {
   820			kvm_handle_signal_exit(vcpu);
   821			return -EINTR;
   822		}
   823	
   824		/*
   825		 * Do not cache the mmio info caused by writing the readonly gfn
   826		 * into the spte otherwise read access on readonly gfn also can
   827		 * caused mmio page fault and treat it as mmio access.
   828		 */
   829		if (fault->pfn == KVM_PFN_ERR_RO_FAULT)
   830			return RET_PF_EMULATE;
   831	
   832		if (fault->pfn == KVM_PFN_ERR_HWPOISON) {
 > 833			kvm_send_hwpoison_signal(fault->slot, fault->gfn);
   834			return RET_PF_RETRY;
   835		}
   836	
   837		return -EFAULT;
   838	}
   839	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
