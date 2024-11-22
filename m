Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D9517D341
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 23:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732318363; cv=none; b=ivVls+edYGXpbEu3XMTEyQvfrYxklbm+NwFEcrgGl5gnQaxk3uF16eP1yWGOPuv/cePoaEokus+e0bqE5Q7mj52xWKweF+QURpvr9D831ppjyqN0pCklAPY2nAU3NFGYEbfqyAk3BQ6PLkXpITmyOhysXopJnCemfGwn21Bf8VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732318363; c=relaxed/simple;
	bh=RE98F1L2/PsFT/3Ui2ro6Ny+vSjoPQXZ0NmKHbQZy1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cjy4Tn87ssV81XMnRyBL/uLP/uslt/1o82kkvS+4gtbKR9w4WMgdGJNK/dcGAc2Qcgljmovnh06r9ZpRxkkjsQcJpSpI7YytiEJ+2FfzLJ0OCNg7B+Ks4iYOYWMPGdEZeMmP+KT2TxYdbOq1V4KIIjaa3+sH2sj6ccNL585Ezjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hoJZVB8p; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hoJZVB8p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732318362; x=1763854362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RE98F1L2/PsFT/3Ui2ro6Ny+vSjoPQXZ0NmKHbQZy1Y=;
  b=hoJZVB8p9JVx9i2YFnSNfVpAwflKFw+wVKQZ9y7MdaM3FI0eRjSrWn3H
   0GsH+sdMQ5VqDojLexM6T8MDkybHk2Stff7u4tEf1L8AxzCSfAB/QCAOu
   IqfwQYX5hiLcSQVy/HtqXAxbqvx1h2rGBk7Vs8zVo4i9QRPJ8M4parMUT
   PIgDNRA8AIo6quB1kpiDdd4PIiRmhbGeUcqYSMKXjCb/9+xZak7FdV08y
   UYkkjWQXPIoIypzDx7UOUwOwyigdtj9w/z3mRtrC5KBLieS5rjoQR3Cil
   yffARQdrUGE6rAV0vtYtuaX+5u9guqBtxqrWcaF9oS0lRuQxmKT6T1ra7
   w==;
X-CSE-ConnectionGUID: IGG/Q6IuTyaeUpmQsCmKYw==
X-CSE-MsgGUID: BOJItXIDSB2bCysVq0E1zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="43134647"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="43134647"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 15:32:41 -0800
X-CSE-ConnectionGUID: yqkvgV9kTY+m8oHyXofESQ==
X-CSE-MsgGUID: 7M7CTNRETi+WCsZsqtrdfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="95647456"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Nov 2024 15:32:33 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEd8Y-0004Hr-2V;
	Fri, 22 Nov 2024 23:32:30 +0000
Date: Sat, 23 Nov 2024 07:31:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/4]
 arch/arm64/kernel/hibernate.c:122:41: error: no member named
 'android_vendor_data1' in 'struct arch_hibernate_hdr'
Message-ID: <202411230753.tsdnkWCy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   3a7ac7a6bbe12c8167c3f06898da00cf72a00c3d
commit: 4f8ffa0f055581b1f71a2abb6abd409022f47658 [1/4] ANDROID: vendor hooks: Add hooks to support bootloader based hibernation
config: arm64-randconfig-001-20241123 (https://download.01.org/0day-ci/archive/20241123/202411230753.tsdnkWCy-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230753.tsdnkWCy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230753.tsdnkWCy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/hibernate.c:14:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/hibernate.c:122:41: error: no member named 'android_vendor_data1' in 'struct arch_hibernate_hdr'
     122 |         trace_android_vh_save_cpu_resume(&hdr->android_vendor_data1,
         |                                           ~~~  ^
   4 warnings and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=n] && (ARM || ARM64 [=y] || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=n]
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +122 arch/arm64/kernel/hibernate.c

   110	
   111	int arch_hibernation_header_save(void *addr, unsigned int max_size)
   112	{
   113		struct arch_hibernate_hdr *hdr = addr;
   114	
   115		if (max_size < sizeof(*hdr))
   116			return -EOVERFLOW;
   117	
   118		arch_hdr_invariants(&hdr->invariants);
   119		hdr->ttbr1_el1		= __pa_symbol(swapper_pg_dir);
   120		hdr->reenter_kernel	= _cpu_resume;
   121	
 > 122		trace_android_vh_save_cpu_resume(&hdr->android_vendor_data1,
   123							__pa(cpu_resume));
   124	
   125		/* We can't use __hyp_get_vectors() because kvm may still be loaded */
   126		if (el2_reset_needed())
   127			hdr->__hyp_stub_vectors = __pa_symbol(__hyp_stub_vectors);
   128		else
   129			hdr->__hyp_stub_vectors = 0;
   130	
   131		/* Save the mpidr of the cpu we called cpu_suspend() on... */
   132		if (sleep_cpu < 0) {
   133			pr_err("Failing to hibernate on an unknown CPU.\n");
   134			return -ENODEV;
   135		}
   136		hdr->sleep_cpu_mpidr = cpu_logical_map(sleep_cpu);
   137		pr_info("Hibernating on CPU %d [mpidr:0x%llx]\n", sleep_cpu,
   138			hdr->sleep_cpu_mpidr);
   139	
   140		return 0;
   141	}
   142	EXPORT_SYMBOL(arch_hibernation_header_save);
   143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
