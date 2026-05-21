Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CD1365A13
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 21:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779398079; cv=none; b=WEYx2kvFcKu46U6Sj6gyuajmZmUsC1CUB4NVb7jVrPkCSfimDdNEDmQ6DFN+cvtuF5y4OoiHePm7xBVEtKe6iwXTz2OqjZMUA91hh0gM5y15YmKeDQwFSCs1pIGhYD7G6NMKnEkk2B9zd4P63NWF4YGNzpMbp2iWOgPNSv21vLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779398079; c=relaxed/simple;
	bh=lwz1wX3AJ/y9U7sDDar02vqxxEHyA//+uWWI3gXvAaw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S1H1Ctd100yhpzZK1rLIrc35yJJcFZGiHjPunurzRoyI0RFOSKIuYU1eqr25jChXEMTw4+2ZuoYJkSKS/0UqjZKpt/fug/1wpppha9kjS0uO9huBin6AAxuArxFBSaCe/Pc3I330up40UiJbwGaIR6VNBItYfOI/dgMDeQSUHnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CNAbF8+u; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CNAbF8+u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779398077; x=1810934077;
  h=date:from:to:cc:subject:message-id;
  bh=lwz1wX3AJ/y9U7sDDar02vqxxEHyA//+uWWI3gXvAaw=;
  b=CNAbF8+u+dt3YU5v9ZC0pKB/T/khAlcFPQnAgJGjBc8i2AgYKEJDxzYe
   WCuoCkWoC48jhqVd9Kf2jHiA8QVMgLdk/N75IrTtI7q+VerxI3ilkDZc2
   p+hmfY4cvkhrQxBQdCqplW1kS0aIjKckqm1kcWJlboD6fzetMw3UVCPiM
   gaub+BL/mjlO91n+irqz8aTDZuVZdRbnRin9h/ENZge2jRykc6LPetGus
   l24qj71J7tlxwbkhneoA5aAsdYFSS4kjoIxx1Isr6XlZD7ifSgqbVFd3Z
   QypprwsPRosB2EhdA5Zqwqxns3ouKUlBJ+DStYAM04ghnH7ZGWyH/98wT
   Q==;
X-CSE-ConnectionGUID: xVO7g2IqSMmi9Ty7gRI17A==
X-CSE-MsgGUID: +ae5hLIKRXmXbOEQ6usokg==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="67851267"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="67851267"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 14:14:37 -0700
X-CSE-ConnectionGUID: 4C/iAifSToWRcsQAQEC70w==
X-CSE-MsgGUID: EVtNZ5luTgOWcfh9tnMJ8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="240697103"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 May 2026 14:14:36 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQAiu-000000001BR-3jaX;
	Thu, 21 May 2026 21:14:32 +0000
Date: Fri, 22 May 2026 05:13:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 arch/arm64/kernel/hibernate.c:122:41: error: no member named
 'android_vendor_data1' in 'struct arch_hibernate_hdr'
Message-ID: <202605220557.jHmzL9Il-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   52ec049b522a04eef8b061f17437595220e5395a
commit: 47490190cdcd68dcd92de0692439009c64049b60 [1/1] ANDROID: vendor hooks: Add hooks to support bootloader based hibernation
config: arm64-randconfig-001-20260522 (https://download.01.org/0day-ci/archive/20260522/202605220557.jHmzL9Il-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605220557.jHmzL9Il-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605220557.jHmzL9Il-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/hibernate.c:122:41: error: no member named 'android_vendor_data1' in 'struct arch_hibernate_hdr'
     122 |         trace_android_vh_save_cpu_resume(&hdr->android_vendor_data1,
         |                                           ~~~  ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=n] && (ARM || ARM64 [=y] || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=n]
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


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
