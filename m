Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D34854757
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Aug 2024 16:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724083838; cv=none; b=XQhd/mBfqI6QWVr66pf+fBOY5lIMFpVnDLtsDwEkOHNOpQyyeM6NJ/YYZgVD10xeI3Daj47rYl+sd0j4S26JnBesF6p17zCqHAdUlI4ukI00G47oKOQwp2rIVyjRRkc7KRz2sPFcmnpGXnMuvpmYh/TOE9yTkkT4TKsNsqLp7m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724083838; c=relaxed/simple;
	bh=r3IMyGyxp1m0mdYF7Y0cw37Comak3Udn/CA93zmBZI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HNdeh7zOpeAfddejoo8iLTjC4kZ70pmS3Bsj9Fgn9G+T+fXhSxBX8PItc/PdDAK8bZvqbd9WxySUhM7XorE03+DRb+MPYAxXEEqagG59v1QI44NP4xd2aIcfm7x8Q5okpdLcRXPjjB7WAeFqGbVvxPIn71+MzP270Qo2rJgVcA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NE/wwIlq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NE/wwIlq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724083836; x=1755619836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r3IMyGyxp1m0mdYF7Y0cw37Comak3Udn/CA93zmBZI0=;
  b=NE/wwIlq49bfRccV3IfvBaU4hnWlcDJJ43UHriOgz3aNXJOcrna7yabL
   GzpF6AQefNezShfJZwIddiDfILrKWf/X/EOPFWcen32GJyopdkV8VuxDo
   b5hYTL3KOSy0CGTX1rScKvu7IEVDGnqDLuSej4fgJkLa8RbodmO6PRLuQ
   6jlwp4W+1sXeAryciEa72ViNgcIaIadEEYC6oBjkB/myL5sljxQNo95kB
   z0+IMFqTTw9STRexb/1aqvQKWqsAB7Lx46D0Lpg5pHr+33wLngo2NZY28
   fESbJJBBH+of2SMJwdGXscyRxjncdpXcpdPP22Md6VW5SDbAKribOuu1e
   g==;
X-CSE-ConnectionGUID: 1PiF90jmRDK7C6kTCjN7pw==
X-CSE-MsgGUID: rLZiJZGeQOGzX8GZanqcjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="39801550"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="39801550"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 09:09:59 -0700
X-CSE-ConnectionGUID: elR9i2tKS46R4/iwXWy3Yg==
X-CSE-MsgGUID: uUuVOwjmQ+CIFwZN+q/utw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="60078646"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Aug 2024 09:09:50 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg4x2-0009AR-0L;
	Mon, 19 Aug 2024 16:09:48 +0000
Date: Tue, 20 Aug 2024 00:09:00 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 15/34]
 arch/x86/kvm/vmx/vmx.c:1515:81: error: 'DB' undeclared; did you mean 'DS'?
Message-ID: <202408200026.ytNs3H4F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   ae58d028f319b7fde38a21d188e30e46471e1e3c
commit: 4584c853845ae8950025fa5e40335060a2eec7a3 [15/34] KVM: VMX: Initialize VMCS FRED fields
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240820/202408200026.ytNs3H4F-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408200026.ytNs3H4F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408200026.ytNs3H4F-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/pgtable_32_areas.h:4,
                    from arch/x86/include/asm/pgtable_areas.h:5,
                    from arch/x86/include/asm/highmem.h:29,
                    from include/linux/highmem-internal.h:25,
                    from include/linux/highmem.h:14,
                    from arch/x86/kvm/vmx/vmx.c:17:
   arch/x86/kvm/vmx/vmx.c: In function 'vmx_vcpu_load_vmcs':
>> arch/x86/include/asm/cpu_entry_area.h:148:9: error: implicit declaration of function 'CEA_ESTACK_TOP'; did you mean 'STACK_TOP'? [-Werror=implicit-function-declaration]
     148 |         CEA_ESTACK_TOP(__this_cpu_read(cea_exception_stacks), name)
         |         ^~~~~~~~~~~~~~
   arch/x86/kvm/vmx/vmx.c:1515:59: note: in expansion of macro '__this_cpu_ist_top_va'
    1515 |                         vmcs_write64(HOST_IA32_FRED_RSP1, __this_cpu_ist_top_va(DB));
         |                                                           ^~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/vmx/vmx.c:1515:81: error: 'DB' undeclared (first use in this function); did you mean 'DS'?
    1515 |                         vmcs_write64(HOST_IA32_FRED_RSP1, __this_cpu_ist_top_va(DB));
         |                                                                                 ^~
   arch/x86/include/asm/cpu_entry_area.h:148:63: note: in definition of macro '__this_cpu_ist_top_va'
     148 |         CEA_ESTACK_TOP(__this_cpu_read(cea_exception_stacks), name)
         |                                                               ^~~~
   arch/x86/kvm/vmx/vmx.c:1515:81: note: each undeclared identifier is reported only once for each function it appears in
    1515 |                         vmcs_write64(HOST_IA32_FRED_RSP1, __this_cpu_ist_top_va(DB));
         |                                                                                 ^~
   arch/x86/include/asm/cpu_entry_area.h:148:63: note: in definition of macro '__this_cpu_ist_top_va'
     148 |         CEA_ESTACK_TOP(__this_cpu_read(cea_exception_stacks), name)
         |                                                               ^~~~
>> arch/x86/kvm/vmx/vmx.c:1516:81: error: 'NMI' undeclared (first use in this function)
    1516 |                         vmcs_write64(HOST_IA32_FRED_RSP2, __this_cpu_ist_top_va(NMI));
         |                                                                                 ^~~
   arch/x86/include/asm/cpu_entry_area.h:148:63: note: in definition of macro '__this_cpu_ist_top_va'
     148 |         CEA_ESTACK_TOP(__this_cpu_read(cea_exception_stacks), name)
         |                                                               ^~~~
>> arch/x86/kvm/vmx/vmx.c:1517:81: error: 'DF' undeclared (first use in this function); did you mean 'DS'?
    1517 |                         vmcs_write64(HOST_IA32_FRED_RSP3, __this_cpu_ist_top_va(DF));
         |                                                                                 ^~
   arch/x86/include/asm/cpu_entry_area.h:148:63: note: in definition of macro '__this_cpu_ist_top_va'
     148 |         CEA_ESTACK_TOP(__this_cpu_read(cea_exception_stacks), name)
         |                                                               ^~~~
   cc1: some warnings being treated as errors


vim +1515 arch/x86/kvm/vmx/vmx.c

  1449	
  1450	void vmx_vcpu_load_vmcs(struct kvm_vcpu *vcpu, int cpu,
  1451				struct loaded_vmcs *buddy)
  1452	{
  1453		struct vcpu_vmx *vmx = to_vmx(vcpu);
  1454		bool already_loaded = vmx->loaded_vmcs->cpu == cpu;
  1455		struct vmcs *prev;
  1456	
  1457		if (!already_loaded) {
  1458			loaded_vmcs_clear(vmx->loaded_vmcs);
  1459			local_irq_disable();
  1460	
  1461			/*
  1462			 * Ensure loaded_vmcs->cpu is read before adding loaded_vmcs to
  1463			 * this cpu's percpu list, otherwise it may not yet be deleted
  1464			 * from its previous cpu's percpu list.  Pairs with the
  1465			 * smb_wmb() in __loaded_vmcs_clear().
  1466			 */
  1467			smp_rmb();
  1468	
  1469			list_add(&vmx->loaded_vmcs->loaded_vmcss_on_cpu_link,
  1470				 &per_cpu(loaded_vmcss_on_cpu, cpu));
  1471			local_irq_enable();
  1472		}
  1473	
  1474		prev = per_cpu(current_vmcs, cpu);
  1475		if (prev != vmx->loaded_vmcs->vmcs) {
  1476			per_cpu(current_vmcs, cpu) = vmx->loaded_vmcs->vmcs;
  1477			vmcs_load(vmx->loaded_vmcs->vmcs);
  1478	
  1479			/*
  1480			 * No indirect branch prediction barrier needed when switching
  1481			 * the active VMCS within a vCPU, unless IBRS is advertised to
  1482			 * the vCPU.  To minimize the number of IBPBs executed, KVM
  1483			 * performs IBPB on nested VM-Exit (a single nested transition
  1484			 * may switch the active VMCS multiple times).
  1485			 */
  1486			if (!buddy || WARN_ON_ONCE(buddy->vmcs != prev))
  1487				indirect_branch_prediction_barrier();
  1488		}
  1489	
  1490		if (!already_loaded) {
  1491			void *gdt = get_current_gdt_ro();
  1492	
  1493			/*
  1494			 * Flush all EPTP/VPID contexts, the new pCPU may have stale
  1495			 * TLB entries from its previous association with the vCPU.
  1496			 */
  1497			kvm_make_request(KVM_REQ_TLB_FLUSH, vcpu);
  1498	
  1499			/*
  1500			 * Linux uses per-cpu TSS and GDT, so set these when switching
  1501			 * processors.  See 22.2.4.
  1502			 */
  1503			vmcs_writel(HOST_TR_BASE,
  1504				    (unsigned long)&get_cpu_entry_area(cpu)->tss.x86_tss);
  1505			vmcs_writel(HOST_GDTR_BASE, (unsigned long)gdt);   /* 22.2.4 */
  1506	
  1507			if (IS_ENABLED(CONFIG_IA32_EMULATION) || IS_ENABLED(CONFIG_X86_32)) {
  1508				/* 22.2.3 */
  1509				vmcs_writel(HOST_IA32_SYSENTER_ESP,
  1510					    (unsigned long)(cpu_entry_stack(cpu) + 1));
  1511			}
  1512	
  1513			/* Per-CPU FRED MSRs */
  1514			if (kvm_cpu_cap_has(X86_FEATURE_FRED)) {
> 1515				vmcs_write64(HOST_IA32_FRED_RSP1, __this_cpu_ist_top_va(DB));
> 1516				vmcs_write64(HOST_IA32_FRED_RSP2, __this_cpu_ist_top_va(NMI));
> 1517				vmcs_write64(HOST_IA32_FRED_RSP3, __this_cpu_ist_top_va(DF));
  1518				vmcs_write64(HOST_IA32_FRED_SSP1, 0);
  1519				vmcs_write64(HOST_IA32_FRED_SSP2, 0);
  1520				vmcs_write64(HOST_IA32_FRED_SSP3, 0);
  1521			}
  1522	
  1523			vmx->loaded_vmcs->cpu = cpu;
  1524		}
  1525	}
  1526	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
