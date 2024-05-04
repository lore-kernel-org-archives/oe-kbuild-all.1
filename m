Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C201839F5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 19:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714852793; cv=none; b=M7UB3rMGjODo3J38q5kqBjFgmk0A3v/E21fCcPAOjlDjjgzY0we5McU/IwLYWiiqu96Wj+ACN3RhykL3odXoS+k5AfN1JiQlYCGf67QQZcYz65eoIzF7susQpA9vLDCU37cHCb2kwwpz+TpE7HLxUt4GYmVwO//V7UBQaE+6jYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714852793; c=relaxed/simple;
	bh=D0Ea7R5Cdz75Sn4fXDP8EGmbCNIuCx3ejw1sQcpoiCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QeLMvwWBH4vW2o815gB9lS5F7LMK3Z+s4q9d2fELUGIC+MAshNe7e6FRE5AyPhn1FOy8ek1Rh8YhuoNZJmWP8lp+Krj3LehrNK9e9BbkT8nPuaZDb2C9qH+njM6T1aRzXvJiF4B3Ib6v9XGQMX413ukEPxPH06QSFsEEzWtey9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AILVYMMf; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AILVYMMf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714852790; x=1746388790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D0Ea7R5Cdz75Sn4fXDP8EGmbCNIuCx3ejw1sQcpoiCc=;
  b=AILVYMMfB/dox7NfSH0E/wVVv8mS0qgXoXLx60r31MXW56B3B6hhL89k
   almG+p8Te0udeWUomsLm+644IFYAwo6ttUj6xczxlA0sVlOeKNVknlFHX
   jqajtIAAznkL7YRy/MFyKBO5FKB6qcBjnW053WDDDp9uYBTA0J2NXkGMd
   3m2HwZb9OPTcfSZBvul36IfisVG5Yh476ponsrlIF9SzQux9Kar78sy8y
   yEF+jcLY557bTs2jBFSSR1HfvX344eEsq/E9Gat174CBxj1gRNbX5SxCh
   X9AJc+4QAQLB+CGQDkx0NJwsWyKh9jSRzgJpVDHV4P9RBsCT35P2kgV2Q
   Q==;
X-CSE-ConnectionGUID: IMXQXZQQQBuMVp7TLq4uDA==
X-CSE-MsgGUID: sWU4xitkTyOAZuUon2gePQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14447231"
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="14447231"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 12:59:48 -0700
X-CSE-ConnectionGUID: lND2vwz8SAuhQwxuRW2a6g==
X-CSE-MsgGUID: 1N16BuB3Tz+5Nnou6+8X+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="32569589"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 May 2024 12:59:47 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3LXs-000D8c-2I;
	Sat, 04 May 2024 19:59:44 +0000
Date: Sun, 5 May 2024 03:59:39 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Graf <graf@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev, kvm-ppc@vger.kernel.org
Subject: [agraf-2.6:kvm-kho-gmem-test 23/27]
 arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:4477:55: error: 'struct
 kvm_arch' has no member named 'timer_data'
Message-ID: <202405050307.cSw7dtP2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/agraf/linux-2.6.git kvm-kho-gmem-test
head:   9a58862a298a63bad21d05191e28b857063bb9dc
commit: 3c9cb25fc553cc12e4cca8f313472e567f41f128 [23/27] XXX initial kvm kho integration
config: powerpc-powernv_defconfig (https://download.01.org/0day-ci/archive/20240505/202405050307.cSw7dtP2-lkp@intel.com/config)
compiler: powerpc64le-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405050307.cSw7dtP2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405050307.cSw7dtP2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bug.h:5,
                    from arch/powerpc/include/asm/mmu.h:142,
                    from arch/powerpc/include/asm/paca.h:18,
                    from arch/powerpc/include/asm/current.h:13,
                    from include/linux/mutex.h:14,
                    from include/linux/kvm_types.h:23,
                    from include/kvm/iodev.h:6,
                    from arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:16:
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_kho_write_vcpu':
>> arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:4433:49: error: 'struct kvm_vcpu_arch' has no member named 'ctxt'
    4433 |                         .addr = __pa(&vcpu->arch.ctxt),
         |                                                 ^
   arch/powerpc/include/asm/bug.h:88:32: note: in definition of macro 'WARN_ON'
      88 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   arch/powerpc/include/asm/page.h:217:9: note: in expansion of macro 'VIRTUAL_WARN_ON'
     217 |         VIRTUAL_WARN_ON((unsigned long)(x) < PAGE_OFFSET);              \
         |         ^~~~~~~~~~~~~~~
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:4433:33: note: in expansion of macro '__pa'
    4433 |                         .addr = __pa(&vcpu->arch.ctxt),
         |                                 ^~~~
   In file included from arch/powerpc/include/asm/mmu.h:144:
>> arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:4433:49: error: 'struct kvm_vcpu_arch' has no member named 'ctxt'
    4433 |                         .addr = __pa(&vcpu->arch.ctxt),
         |                                                 ^
   arch/powerpc/include/asm/page.h:218:25: note: in definition of macro '__pa'
     218 |         (unsigned long)(x) & 0x0fffffffffffffffUL;                      \
         |                         ^
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:4434:49: error: 'struct kvm_vcpu_arch' has no member named 'ctxt'
    4434 |                         .len = sizeof(vcpu->arch.ctxt),
         |                                                 ^
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_kho_write_vm':
>> arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:4477:55: error: 'struct kvm_arch' has no member named 'timer_data'
    4477 |         ret |= fdt_property(fdt, "voffset", &kvm->arch.timer_data.voffset, sizeof(u64));
         |                                                       ^
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:4478:55: error: 'struct kvm_arch' has no member named 'timer_data'
    4478 |         ret |= fdt_property(fdt, "poffset", &kvm->arch.timer_data.poffset, sizeof(u64));
         |                                                       ^
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c: At top level:
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:4524:49: warning: 'struct kvm_s2_mmu' declared inside parameter list will not be visible outside of this definition or declaration
    4524 | int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long type);
         |                                                 ^~~~~~~~~~
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_unwrap_file':
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:4550:58: error: 'struct kvm_arch' has no member named 'mmu'
    4550 |                 ret = kvm_init_stage2_mmu(kvm, &kvm->arch.mmu, 0);
         |                                                          ^
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_wrap_vm':
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:4601:48: error: 'struct kvm_arch' has no member named 'mmu'
    4601 |         r = kvm_init_stage2_mmu(kvm, &kvm->arch.mmu, 0);
         |                                                ^
   In file included from include/asm-generic/bug.h:22,
                    from arch/powerpc/include/asm/bug.h:116:
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_dev_ioctl_create_vm':
   include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 4 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:500:9: note: in expansion of macro 'printk'
     500 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:500:16: note: in expansion of macro 'KERN_ERR'
     500 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:5682:1: note: in expansion of macro 'pr_err'
    5682 | pr_err("XXX %s:%d type=%d fdname=%s", __func__, __LINE__, type, fdname);
         | ^~~~~~
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_kho_recover_vcpu':
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:6744:27: error: 'struct kvm_vcpu_arch' has no member named 'ctxt'
    6744 |         memcpy(&vcpu->arch.ctxt, old_ctxt, sizeof(*old_ctxt));
         |                           ^
>> arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:6744:50: error: invalid application of 'sizeof' to incomplete type 'struct kvm_cpu_context'
    6744 |         memcpy(&vcpu->arch.ctxt, old_ctxt, sizeof(*old_ctxt));
         |                                                  ^
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_kho_recover_vm':
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:6784:17: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    6784 |         poffset = fdt_getprop(fdt, node, "poffset", &l);
         |                 ^
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:6787:18: error: 'struct kvm_arch' has no member named 'timer_data'
    6787 |         kvm->arch.timer_data.poffset = *poffset;
         |                  ^
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:6789:17: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    6789 |         voffset = fdt_getprop(fdt, node, "voffset", &l);
         |                 ^
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:6792:18: error: 'struct kvm_arch' has no member named 'timer_data'
    6792 |         kvm->arch.timer_data.voffset = *voffset;
         |                  ^


vim +4477 arch/powerpc/kvm/../../../virt/kvm/kvm_main.c

  4427	
  4428	static int kvm_kho_write_vcpu(void *fdt, struct kvm_vcpu *vcpu)
  4429	{
  4430		const char compatible[] = "kvm,vcpu-v1";
  4431		struct kho_mem mem[] = {
  4432			{
> 4433				.addr = __pa(&vcpu->arch.ctxt),
  4434				.len = sizeof(vcpu->arch.ctxt),
  4435			}
  4436		};
  4437		int ret = 0;
  4438		char *name;
  4439	
  4440		name = kasprintf(GFP_KERNEL, "vcpu@%lx", (long)vcpu);
  4441		if (!name)
  4442			return -ENOMEM;
  4443	
  4444		ret |= fdt_begin_node(fdt, name);
  4445		ret |= fdt_property(fdt, "compatible", compatible, sizeof(compatible));
  4446		ret |= fdt_property(fdt, "phandle", &vcpu, sizeof(vcpu));
  4447		ret |= fdt_property(fdt, "mem", mem, sizeof(mem));
  4448		ret |= fdt_property(fdt, "id", &vcpu->vcpu_id, sizeof(vcpu->vcpu_id));
  4449		ret |= fdt_end_node(fdt);
  4450	
  4451		kfree(name);
  4452	
  4453		return ret;
  4454	}
  4455	
  4456	static int kvm_kho_write_vm(void *fdt, struct kvm *kvm)
  4457	{
  4458		const char compatible[] = "kvm,vm-v1";
  4459		struct kvm_memory_slot *kho_slots;
  4460		struct kvm_memory_slot *slot;
  4461		struct kvm_memslots *slots;
  4462		int bkt, nr_slots = 0;
  4463		struct kvm_vcpu *vcpu;
  4464		unsigned long i;
  4465		char *name;
  4466		int ret;
  4467	
  4468		name = kasprintf(GFP_KERNEL, "vm@%lx", (long)kvm);
  4469		if (!name)
  4470			return -ENOMEM;
  4471	
  4472		ret |= fdt_begin_node(fdt, name);
  4473		ret |= fdt_property(fdt, "compatible", compatible, sizeof(compatible));
  4474		ret |= fdt_property(fdt, "phandle", &kvm, sizeof(kvm));
  4475	
  4476		/* XXX should go to arch code */
> 4477		ret |= fdt_property(fdt, "voffset", &kvm->arch.timer_data.voffset, sizeof(u64));
  4478		ret |= fdt_property(fdt, "poffset", &kvm->arch.timer_data.poffset, sizeof(u64));
  4479	
  4480		/* XXX protect memslots from writes after serialization */
  4481		slots = kvm_memslots(kvm);
  4482		kvm_for_each_memslot(slot, bkt, slots)
  4483			nr_slots++;
  4484	
  4485		kho_slots = kmalloc(sizeof(*kho_slots) * nr_slots, GFP_KERNEL);
  4486		if (!kho_slots) {
  4487			ret = -ENOMEM;
  4488			goto out;
  4489		}
  4490	
  4491		i = 0;
  4492		kvm_for_each_memslot(slot, bkt, slots)
  4493			kho_slots[i++] = *slot;
  4494	
  4495		ret |= fdt_property(fdt, "slots", kho_slots, sizeof(*kho_slots) * nr_slots);
  4496		kfree(kho_slots);
  4497	
  4498		kvm_for_each_vcpu(i, vcpu, kvm) {
  4499			ret |= kvm_kho_write_vcpu(fdt, vcpu);
  4500		}
  4501	
  4502	out:
  4503		ret |= fdt_end_node(fdt);
  4504		kfree(name);
  4505	
  4506		return ret;
  4507	}
  4508	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
