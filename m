Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6401BF513
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 16:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770482574; cv=none; b=CRty6RjbROSkwqwU5xWeYOKVPif9qOEskbM6He9EQiif/8/CGi47i8jFbweJs6bgcXZMFZ/VZ0ie2zykqzfUGTePxEaidOhBGzn0QkapAj0FW8eNG0Uckh6ouephWL5CcIzQY3isKBzU4IgowpsPYAjeE0qIh1OJM1XqF/NGG3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770482574; c=relaxed/simple;
	bh=+Of0wIPKgL1HQxcXw4Txcw7fJe9VXJ67u3sQ+9VFYGE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cEfJ2ohpGB9k9iSgjMB3rL9EwkbvufZUvRMcoLRZQo89y3r3ygjQc3pxCGQkVkjFvBSd1IF6o1qN2ND9kyU/LZ8Cj+EQ2hCc2Q7FPrc+cv9JbiCT/SOEeoStHfbVamyZhJJ9lySyrb7nU8wgjMRJmJTNAJzWVG7r44h+n5+k0ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1boQzbf; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1boQzbf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770482572; x=1802018572;
  h=date:from:to:cc:subject:message-id;
  bh=+Of0wIPKgL1HQxcXw4Txcw7fJe9VXJ67u3sQ+9VFYGE=;
  b=R1boQzbfdABHy6QXFUjC53laC+v+aGn1xEfgX4lieNaK+MnLCwMx4jIJ
   HEqs25MgRPt9IFQBybedcR0fSddOj9Ysr8MnMPMTotevhGoarVtfm5+z9
   o71xTy7gSVVFa16+KyNwBkX71jp9ulLc+dkaxJll/3B3pwGPd4T9y8b70
   0wQkJxQ8aQEDV5jEDJrShGZ4TgywWS9jYU0iatYg6tZOTBeq5MeSAPH0l
   byaZ0rYocTrbZgLk7NShrDN5LOzjQV3LHrSvwys9sx2xdHRkwE/n7TlRh
   QiUd3fsrQ03AUqumOapgd5cEZkG0+/pM85E+HzdYD5IgOHMwhVUzxEeA3
   Q==;
X-CSE-ConnectionGUID: +8fLub3nT1uPQL7j+dpZXA==
X-CSE-MsgGUID: I9GjL3EbSMG7dU1zNEgA3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11694"; a="71564175"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="71564175"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 08:42:52 -0800
X-CSE-ConnectionGUID: 3aWFnSnmTiuRs6OHhRy6qg==
X-CSE-MsgGUID: EECMlVYJQVuNFLIcv6x7ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="216134479"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Feb 2026 08:42:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1volOS-00000000llU-0OSG;
	Sat, 07 Feb 2026 16:42:48 +0000
Date: Sun, 08 Feb 2026 00:42:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/6]
 arch/x86/kvm/vmx/pkvm/hyp/../../../pkvm/vmx/vmx.c:1568:6: warning: variable
 'error_code' set but not used
Message-ID: <202602080017.AEj4Dl2K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   1d370994ba023ff99b9ddab815c6e190e10b3403
commit: 130c1b96b9ed1e0e5910a7d3a4ac8739e938f1ba [0/6] ANDROID: pkvm: vmx: Handle ept violation vmexit
config: x86_64-randconfig-123-20260207 (https://download.01.org/0day-ci/archive/20260208/202602080017.AEj4Dl2K-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260208/202602080017.AEj4Dl2K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602080017.AEj4Dl2K-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kvm/vmx/pkvm/hyp/../../../pkvm/vmx/vmx.c:16:
   In file included from arch/x86/kvm/vmx/pkvm/hyp/pkvm_hyp.h:10:
   arch/x86/kvm/vmx/pkvm/include/pkvm.h:144:30: error: expected identifier or '('
     144 | extern unsigned int pkvm_sym(nr_cpu_ids);
         |                              ^
   include/linux/cpumask.h:28:22: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                      ^
   In file included from arch/x86/kvm/vmx/pkvm/hyp/../../../pkvm/vmx/vmx.c:16:
   In file included from arch/x86/kvm/vmx/pkvm/hyp/pkvm_hyp.h:10:
   arch/x86/kvm/vmx/pkvm/include/pkvm.h:144:30: error: expected ')'
   include/linux/cpumask.h:28:22: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                      ^
   arch/x86/kvm/vmx/pkvm/include/pkvm.h:144:30: note: to match this '('
   include/linux/cpumask.h:28:21: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                     ^
   In file included from arch/x86/kvm/vmx/pkvm/hyp/../../../pkvm/vmx/vmx.c:16:
   In file included from arch/x86/kvm/vmx/pkvm/hyp/pkvm_hyp.h:10:
   arch/x86/kvm/vmx/pkvm/include/pkvm.h:144:30: error: expected ')'
     144 | extern unsigned int pkvm_sym(nr_cpu_ids);
         |                              ^
   include/linux/cpumask.h:28:35: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                                   ^
   include/linux/threads.h:21:18: note: expanded from macro 'NR_CPUS'
      21 | #define NR_CPUS         CONFIG_NR_CPUS
         |                         ^
   ./include/generated/autoconf.h:358:24: note: expanded from macro 'CONFIG_NR_CPUS'
     358 | #define CONFIG_NR_CPUS 1
         |                        ^
   arch/x86/kvm/vmx/pkvm/include/pkvm.h:144:30: note: to match this '('
   include/linux/cpumask.h:28:20: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                    ^
>> arch/x86/kvm/vmx/pkvm/hyp/../../../pkvm/vmx/vmx.c:1568:6: warning: variable 'error_code' set but not used [-Wunused-but-set-variable]
    1568 |         u64 error_code;
         |             ^
   1 warning and 3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +/error_code +1568 arch/x86/kvm/vmx/pkvm/hyp/../../../pkvm/vmx/vmx.c

  1563	
  1564	static int handle_ept_violation(struct kvm_vcpu *vcpu)
  1565	{
  1566		unsigned long exit_qualification;
  1567		gpa_t gpa;
> 1568		u64 error_code;
  1569	
  1570		exit_qualification = vmx_get_exit_qual(vcpu);
  1571	
  1572		/*
  1573		 * EPT violation happened while executing iret from NMI,
  1574		 * "blocked by NMI" bit has to be set before next VM entry.
  1575		 * There are errata that may cause this bit to not be set:
  1576		 * AAK134, BY25.
  1577		 */
  1578		if (!(to_vmx(vcpu)->idt_vectoring_info & VECTORING_INFO_VALID_MASK) &&
  1579				enable_vnmi &&
  1580				(exit_qualification & INTR_INFO_UNBLOCK_NMI))
  1581			vmcs_set_bits(GUEST_INTERRUPTIBILITY_INFO, GUEST_INTR_STATE_NMI);
  1582	
  1583		gpa = vmcs_read64(GUEST_PHYSICAL_ADDRESS);
  1584		trace_kvm_page_fault(vcpu, gpa, exit_qualification);
  1585	
  1586		/* Is it a read fault? */
  1587		error_code = (exit_qualification & EPT_VIOLATION_ACC_READ)
  1588			     ? PFERR_USER_MASK : 0;
  1589		/* Is it a write fault? */
  1590		error_code |= (exit_qualification & EPT_VIOLATION_ACC_WRITE)
  1591			      ? PFERR_WRITE_MASK : 0;
  1592		/* Is it a fetch fault? */
  1593		error_code |= (exit_qualification & EPT_VIOLATION_ACC_INSTR)
  1594			      ? PFERR_FETCH_MASK : 0;
  1595		/* ept page table entry is present? */
  1596		error_code |= (exit_qualification & EPT_VIOLATION_RWX_MASK)
  1597			      ? PFERR_PRESENT_MASK : 0;
  1598	
  1599		error_code |= (exit_qualification & EPT_VIOLATION_GVA_TRANSLATED) != 0 ?
  1600		       PFERR_GUEST_FINAL_MASK : PFERR_GUEST_PAGE_MASK;
  1601	
  1602		/*
  1603		 * Check that the GPA doesn't exceed physical memory limits, as that is
  1604		 * a guest page fault.  We have to emulate the instruction here, because
  1605		 * if the illegal address is that of a paging structure, then
  1606		 * EPT_VIOLATION_ACC_WRITE bit is set.  Alternatively, if supported we
  1607		 * would also use advanced VM-exit information for EPT violations to
  1608		 * reconstruct the page fault error code.
  1609		 */
  1610		if (unlikely(allow_smaller_maxphyaddr && !kvm_vcpu_is_legal_gpa(vcpu, gpa)))
  1611			return kvm_emulate_instruction(vcpu, 0);
  1612	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
