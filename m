Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F2E2EB5C6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Dec 2025 23:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765150059; cv=none; b=eGiKyygYUgky9HkxJ4oOKm8lWZjLxZDPgsUxPMKPItQ9kVuiL4ZI+5oF4j1ixCezg9Uz5hG+NIn/0cLveuvqJY0IOmdi9I9oceL4CahiM8eWyRTYzmV4uTr9J6wZZLvjJSACp6ppdxRaH35mP26IzgElhNuCrx4pV1kTK84kh3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765150059; c=relaxed/simple;
	bh=JIckfr7Dfv3c1jBIvKkhisZI5D3tK0OfOLVgFDVrmzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lEzRBYDNSvnUPo0XYcDMy/hm/99Mphsai5uWTNOGoEt0WX/Jr8kmTlWizg6CjOLxbTdvIYH/JXy0DbnJ5S25MkTYe36O15yoFtiq2mVajk7WPA/xn4eVYS8QNzDjDjsXALpe7iSGKy6m3V4kEhIzpjJwq9wkirh1/8Rw3YgOyWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SXtEzyXm; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SXtEzyXm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765150057; x=1796686057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JIckfr7Dfv3c1jBIvKkhisZI5D3tK0OfOLVgFDVrmzU=;
  b=SXtEzyXmQ1M1j/ptFsK4tOSKN2ryRtgaL42QGUPNOVmj4FzgpIbnHSRm
   XN7bXv3Y+L6MjuyTct4GC+BehZSJxbvU5VbVeFwr+ZbIFk3OT0Bwvrzya
   rqwJHTHLmJZ9BjQ2tvlVNQVuH2XZ64rcoJjTWv72jVmxDOKPuVMZ1gTPA
   rGRudz+ALsk+IknjtB9F21LY+MEGnRZz/ft6oWYPAY+rl8B8G5XZf4oC9
   qwvqdfca3fb2P4mVXg57gg7vZd3FhP7Klv5Tt1v9XMG7qdPObMHLDuBBk
   0m2OPMvBPu5XHo8IQSdpPQ+GpNMflWB1OJri6ZCC+2PZ8w1wtGWoIuKPS
   Q==;
X-CSE-ConnectionGUID: HKFbK3tdR1m41Lh1DW4elg==
X-CSE-MsgGUID: yqALdUyQRw2CP4XSdcZjKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="66097680"
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="66097680"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 15:27:37 -0800
X-CSE-ConnectionGUID: +oWT6GIvSyuP005yMk4AdQ==
X-CSE-MsgGUID: DXoOD5XYStS8xp9kENFCkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="226796017"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Dec 2025 15:27:35 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSOA9-00000000Jhx-2cOY;
	Sun, 07 Dec 2025 23:27:33 +0000
Date: Mon, 8 Dec 2025 07:26:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 7/7]
 arch/arm64/kvm/hyp_events.c:139:1: sparse: sparse: symbol
 'hyp_ftrace_funcs_lock' was not declared. Should it be static?
Message-ID: <202512080740.Vp1ySejR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vincent,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   d0bf55e49c08c429d48fa782a0bb545804ffacb6
commit: 58ca789e21bb4fc0af3eaeacd88252a5564a816b [7/7] ANDROID: KVM: arm64: PROTECTED_NVHE_FTRACE to PKVM_FTRACE
config: arm64-randconfig-r111-20251208 (https://download.01.org/0day-ci/archive/20251208/202512080740.Vp1ySejR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512080740.Vp1ySejR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512080740.Vp1ySejR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kvm/hyp_events.c: note: in included file (through arch/arm64/include/asm/kvm_define_hypevents.h):
   arch/arm64/include/asm/kvm_hypevents.h:15:1: sparse: sparse: symbol 'hyp_event_func' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:28:1: sparse: sparse: symbol 'hyp_event_func_ret' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:40:1: sparse: sparse: symbol 'hyp_event_hyp_enter' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:49:1: sparse: sparse: symbol 'hyp_event_hyp_exit' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:58:1: sparse: sparse: symbol 'hyp_event_host_hcall' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:72:1: sparse: sparse: symbol 'hyp_event_host_smc' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:87:1: sparse: sparse: symbol 'hyp_event_host_mem_abort' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:101:1: sparse: sparse: symbol 'hyp_event___hyp_printk' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:121:1: sparse: sparse: symbol 'hyp_event_psci_mem_protect' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:134:1: sparse: sparse: symbol 'hyp_event_vcpu_illegal_trap' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:154:1: sparse: sparse: symbol 'hyp_event_iommu_idmap' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:169:1: sparse: sparse: symbol 'hyp_event_iommu_idmap_complete' was not declared. Should it be static?
   arch/arm64/kvm/hyp_events.c:51:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/hyp_events.c:51:15: sparse:    struct hyp_table [noderef] __rcu *
   arch/arm64/kvm/hyp_events.c:51:15: sparse:    struct hyp_table *
   arch/arm64/kvm/hyp_events.c:51:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/hyp_events.c:51:15: sparse:    struct hyp_table [noderef] __rcu *
   arch/arm64/kvm/hyp_events.c:51:15: sparse:    struct hyp_table *
   arch/arm64/kvm/hyp_events.c:66:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/hyp_events.c:66:17: sparse:    struct hyp_table [noderef] __rcu *
   arch/arm64/kvm/hyp_events.c:66:17: sparse:    struct hyp_table *
>> arch/arm64/kvm/hyp_events.c:139:1: sparse: sparse: symbol 'hyp_ftrace_funcs_lock' was not declared. Should it be static?
>> arch/arm64/kvm/hyp_events.c:417:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   arch/arm64/kvm/hyp_events.c:417:23: sparse:     expected unsigned int [usertype]
   arch/arm64/kvm/hyp_events.c:417:23: sparse:     got restricted __le32 [usertype]
   arch/arm64/kvm/hyp_events.c:428:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   arch/arm64/kvm/hyp_events.c:428:15: sparse:     expected unsigned int [usertype]
   arch/arm64/kvm/hyp_events.c:428:15: sparse:     got restricted __le32 [usertype]
   arch/arm64/kvm/hyp_events.c:693:18: sparse: sparse: symbol '__hyp_trace_find_event_name' was not declared. Should it be static?
   arch/arm64/kvm/hyp_events.c:716:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/hyp_events.c:716:17: sparse:    struct hyp_table [noderef] __rcu *
   arch/arm64/kvm/hyp_events.c:716:17: sparse:    struct hyp_table *
   arch/arm64/kvm/hyp_events.c:705:18: sparse: sparse: symbol 'hyp_trace_find_event_name' was not declared. Should it be static?
--
>> arch/arm64/kvm/hyp/nvhe/ftrace.c:142:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   arch/arm64/kvm/hyp/nvhe/ftrace.c:142:15: sparse:     expected unsigned int [usertype]
   arch/arm64/kvm/hyp/nvhe/ftrace.c:142:15: sparse:     got restricted __le32 [usertype]
   arch/arm64/kvm/hyp/nvhe/ftrace.c:155:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   arch/arm64/kvm/hyp/nvhe/ftrace.c:155:15: sparse:     expected unsigned int [usertype]
   arch/arm64/kvm/hyp/nvhe/ftrace.c:155:15: sparse:     got restricted __le32 [usertype]
   arch/arm64/kvm/hyp/nvhe/ftrace.c:175:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   arch/arm64/kvm/hyp/nvhe/ftrace.c:175:15: sparse:     expected unsigned int [usertype]
   arch/arm64/kvm/hyp/nvhe/ftrace.c:175:15: sparse:     got restricted __le32 [usertype]
   arch/arm64/kvm/hyp/nvhe/ftrace.c:245:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   arch/arm64/kvm/hyp/nvhe/ftrace.c:245:23: sparse:     expected unsigned int [usertype]
   arch/arm64/kvm/hyp/nvhe/ftrace.c:245:23: sparse:     got restricted __le32 [usertype]

vim +/hyp_ftrace_funcs_lock +139 arch/arm64/kvm/hyp_events.c

3d1cb21f1918aa Vincent Donnefort 2024-08-12   30  
3d1cb21f1918aa Vincent Donnefort 2024-08-12   31  #define nr_entries(__start, __stop) \
3d1cb21f1918aa Vincent Donnefort 2024-08-12   32  	(((unsigned long)__stop - (unsigned long)__start) / sizeof(*__start))
3d1cb21f1918aa Vincent Donnefort 2024-08-12   33  
3d1cb21f1918aa Vincent Donnefort 2024-08-12   34  static int hyp_table_add(struct hyp_mod_tables *mod_tables, void *start,
3d1cb21f1918aa Vincent Donnefort 2024-08-12   35  			 unsigned long nr_entries)
3d1cb21f1918aa Vincent Donnefort 2024-08-12   36  {
3d1cb21f1918aa Vincent Donnefort 2024-08-12   37  	struct hyp_table *new, *old;
3d1cb21f1918aa Vincent Donnefort 2024-08-12   38  	int i;
3d1cb21f1918aa Vincent Donnefort 2024-08-12   39  
3d1cb21f1918aa Vincent Donnefort 2024-08-12   40  	new = kmalloc_array(mod_tables->nr_tables + 1, sizeof(*new), GFP_KERNEL);
3d1cb21f1918aa Vincent Donnefort 2024-08-12   41  	if (!new)
3d1cb21f1918aa Vincent Donnefort 2024-08-12   42  		return -ENOMEM;
3d1cb21f1918aa Vincent Donnefort 2024-08-12   43  
3d1cb21f1918aa Vincent Donnefort 2024-08-12   44  	for (i = 0; i < mod_tables->nr_tables; i++) {
3d1cb21f1918aa Vincent Donnefort 2024-08-12   45  		new[i].start = mod_tables->tables[i].start;
3d1cb21f1918aa Vincent Donnefort 2024-08-12   46  		new[i].nr_entries = mod_tables->tables[i].nr_entries;
3d1cb21f1918aa Vincent Donnefort 2024-08-12   47  	}
3d1cb21f1918aa Vincent Donnefort 2024-08-12   48  	new[i].start = start;
3d1cb21f1918aa Vincent Donnefort 2024-08-12   49  	new[i].nr_entries = nr_entries;
3d1cb21f1918aa Vincent Donnefort 2024-08-12   50  
3d1cb21f1918aa Vincent Donnefort 2024-08-12  @51  	old = rcu_replace_pointer(mod_tables->tables, new, true);
3d1cb21f1918aa Vincent Donnefort 2024-08-12   52  	synchronize_rcu();
3d1cb21f1918aa Vincent Donnefort 2024-08-12   53  	mod_tables->nr_tables++;
3d1cb21f1918aa Vincent Donnefort 2024-08-12   54  	kfree(old);
3d1cb21f1918aa Vincent Donnefort 2024-08-12   55  
3d1cb21f1918aa Vincent Donnefort 2024-08-12   56  	return 0;
3d1cb21f1918aa Vincent Donnefort 2024-08-12   57  }
3d1cb21f1918aa Vincent Donnefort 2024-08-12   58  
3d1cb21f1918aa Vincent Donnefort 2024-08-12   59  static void *hyp_table_entry(struct hyp_mod_tables *mod_tables,
3d1cb21f1918aa Vincent Donnefort 2024-08-12   60  			     size_t entry_size, unsigned long id)
3d1cb21f1918aa Vincent Donnefort 2024-08-12   61  {
3d1cb21f1918aa Vincent Donnefort 2024-08-12   62  	struct hyp_table *table;
3d1cb21f1918aa Vincent Donnefort 2024-08-12   63  	void *entry = NULL;
3d1cb21f1918aa Vincent Donnefort 2024-08-12   64  
3d1cb21f1918aa Vincent Donnefort 2024-08-12   65  	rcu_read_lock();
3d1cb21f1918aa Vincent Donnefort 2024-08-12   66  	table = rcu_dereference(mod_tables->tables);
3d1cb21f1918aa Vincent Donnefort 2024-08-12   67  
3d1cb21f1918aa Vincent Donnefort 2024-08-12   68  	for (int i = 0; i < mod_tables->nr_tables; i++) {
3d1cb21f1918aa Vincent Donnefort 2024-08-12   69  		if (table->nr_entries <= id) {
3d1cb21f1918aa Vincent Donnefort 2024-08-12   70  			id -= table->nr_entries;
3d1cb21f1918aa Vincent Donnefort 2024-08-12   71  			table++;
3d1cb21f1918aa Vincent Donnefort 2024-08-12   72  			continue;
3d1cb21f1918aa Vincent Donnefort 2024-08-12   73  		}
3d1cb21f1918aa Vincent Donnefort 2024-08-12   74  
3d1cb21f1918aa Vincent Donnefort 2024-08-12   75  		entry = (void *)((char *)table->start + (id * entry_size));
3d1cb21f1918aa Vincent Donnefort 2024-08-12   76  		break;
3d1cb21f1918aa Vincent Donnefort 2024-08-12   77  	}
3d1cb21f1918aa Vincent Donnefort 2024-08-12   78  	rcu_read_unlock();
3d1cb21f1918aa Vincent Donnefort 2024-08-12   79  
3d1cb21f1918aa Vincent Donnefort 2024-08-12   80  	return entry;
3d1cb21f1918aa Vincent Donnefort 2024-08-12   81  }
3d1cb21f1918aa Vincent Donnefort 2024-08-12   82  
3d1cb21f1918aa Vincent Donnefort 2024-08-12   83  extern struct hyp_printk_fmt __hyp_printk_fmts_start[];
3d1cb21f1918aa Vincent Donnefort 2024-08-12   84  extern struct hyp_printk_fmt __hyp_printk_fmts_end[];
1235f3457b1143 Vincent Donnefort 2023-08-07   85  
c7a85f5f4ce786 Vincent Donnefort 2024-07-11   86  static struct hyp_mod_tables mod_printk_fmt_tables;
c7a85f5f4ce786 Vincent Donnefort 2024-07-11   87  static unsigned long total_printk_fmts;
c7a85f5f4ce786 Vincent Donnefort 2024-07-11   88  
1235f3457b1143 Vincent Donnefort 2023-08-07   89  static const char *hyp_printk_fmt_from_id(u8 fmt_id)
1235f3457b1143 Vincent Donnefort 2023-08-07   90  {
c7a85f5f4ce786 Vincent Donnefort 2024-07-11   91  	u8 nr_fmts = nr_entries(__hyp_printk_fmts_start, __hyp_printk_fmts_end);
c7a85f5f4ce786 Vincent Donnefort 2024-07-11   92  	struct hyp_printk_fmt *fmt = NULL;
c7a85f5f4ce786 Vincent Donnefort 2024-07-11   93  
c7a85f5f4ce786 Vincent Donnefort 2024-07-11   94  	if (fmt_id < nr_fmts)
c7a85f5f4ce786 Vincent Donnefort 2024-07-11   95  		return (__hyp_printk_fmts_start + fmt_id)->fmt;
1235f3457b1143 Vincent Donnefort 2023-08-07   96  
c7a85f5f4ce786 Vincent Donnefort 2024-07-11   97  	fmt_id -= nr_fmts;
1235f3457b1143 Vincent Donnefort 2023-08-07   98  
c7a85f5f4ce786 Vincent Donnefort 2024-07-11   99  	fmt = hyp_table_entry(&mod_printk_fmt_tables, sizeof(*fmt), fmt_id);
c7a85f5f4ce786 Vincent Donnefort 2024-07-11  100  
c7a85f5f4ce786 Vincent Donnefort 2024-07-11  101  	return fmt ? fmt->fmt : "Unknown Format";
1235f3457b1143 Vincent Donnefort 2023-08-07  102  }
1235f3457b1143 Vincent Donnefort 2023-08-07  103  
58ca789e21bb4f Vincent Donnefort 2025-02-21  104  #ifdef CONFIG_PKVM_FTRACE
e5a5778f97569e Vincent Donnefort 2024-10-01  105  extern unsigned long __hyp_patchable_function_entries_start[];
e5a5778f97569e Vincent Donnefort 2024-10-01  106  extern unsigned long __hyp_patchable_function_entries_end[];
e5a5778f97569e Vincent Donnefort 2024-10-01  107  extern unsigned long kvm_nvhe_sym(__hyp_text_start_kern);
e5a5778f97569e Vincent Donnefort 2024-10-01  108  
e5a5778f97569e Vincent Donnefort 2024-10-01  109  static int hyp_ftrace_init_lr_ins(unsigned long addr)
e5a5778f97569e Vincent Donnefort 2024-10-01  110  {
e5a5778f97569e Vincent Donnefort 2024-10-01  111  	u32 old, new;
e5a5778f97569e Vincent Donnefort 2024-10-01  112  
e5a5778f97569e Vincent Donnefort 2024-10-01  113  	if (aarch64_insn_read((void *)addr, &old))
e5a5778f97569e Vincent Donnefort 2024-10-01  114  		return -EFAULT;
e5a5778f97569e Vincent Donnefort 2024-10-01  115  
e5a5778f97569e Vincent Donnefort 2024-10-01  116  	if (old != aarch64_insn_gen_nop())
e5a5778f97569e Vincent Donnefort 2024-10-01  117  		return -EINVAL;
e5a5778f97569e Vincent Donnefort 2024-10-01  118  
e5a5778f97569e Vincent Donnefort 2024-10-01  119  	new = aarch64_insn_gen_move_reg(AARCH64_INSN_REG_9,
e5a5778f97569e Vincent Donnefort 2024-10-01  120  					AARCH64_INSN_REG_LR,
e5a5778f97569e Vincent Donnefort 2024-10-01  121  					AARCH64_INSN_VARIANT_64BIT);
e5a5778f97569e Vincent Donnefort 2024-10-01  122  	if (aarch64_insn_patch_text_nosync((void *)addr, new))
e5a5778f97569e Vincent Donnefort 2024-10-01  123  		return -EPERM;
e5a5778f97569e Vincent Donnefort 2024-10-01  124  
e5a5778f97569e Vincent Donnefort 2024-10-01  125  	return 0;
e5a5778f97569e Vincent Donnefort 2024-10-01  126  }
e5a5778f97569e Vincent Donnefort 2024-10-01  127  
5740e8b1a01c70 Vincent Donnefort 2024-10-01  128  static unsigned long *hyp_ftrace_funcs_pg;
5740e8b1a01c70 Vincent Donnefort 2024-10-01  129  static char hyp_ftrace_filter_early[128];
5740e8b1a01c70 Vincent Donnefort 2024-10-01  130  
5740e8b1a01c70 Vincent Donnefort 2024-10-01  131  static __init int setup_hyp_ftrace_filter_early_early(char *str)
5740e8b1a01c70 Vincent Donnefort 2024-10-01  132  {
5740e8b1a01c70 Vincent Donnefort 2024-10-01  133  	strscpy(hyp_ftrace_filter_early, str, sizeof(hyp_ftrace_filter_early));
5740e8b1a01c70 Vincent Donnefort 2024-10-01  134  
5740e8b1a01c70 Vincent Donnefort 2024-10-01  135  	return 1;
5740e8b1a01c70 Vincent Donnefort 2024-10-01  136  }
5740e8b1a01c70 Vincent Donnefort 2024-10-01  137  __setup("hyp_ftrace_filter=", setup_hyp_ftrace_filter_early_early);
5740e8b1a01c70 Vincent Donnefort 2024-10-01  138  
5740e8b1a01c70 Vincent Donnefort 2024-10-01 @139  DEFINE_MUTEX(hyp_ftrace_funcs_lock);
5740e8b1a01c70 Vincent Donnefort 2024-10-01  140  

:::::: The code at line 139 was first introduced by commit
:::::: 5740e8b1a01c70c309080c128db78af4433005a1 ANDROID: KVM: arm64: Add set_ftrace_filter for pKVM hyp

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Vincent Donnefort <vdonnefort@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
