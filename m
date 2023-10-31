Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8EC10976
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 13:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S57zKwFz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698757297; x=1730293297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pTMDJ8UGVtfohkri6fq8u5kFLUZMtPtquV2UhmVkwAI=;
  b=S57zKwFzKy4c0BA0FwJf7zSqQZzUUJl5Okz45nGGUqq5dj9w7qBDSV22
   2OKhf0TjypZerI3DHdmMAPzWtsip/sffg5/CX2HyFsjRKRwgsN3CKrZXY
   bHIsfW6ml+Vo8/XIILVqhbTPpMZzaGmeUYV+Da/rOn2zFHnl0l5Wh8aqh
   ROea1n8c8Ekxel+kthA8ymh8JgIRCJNlyQG2iVC5vSl9IN+hYPGGg7xGn
   yLQu0gQcLmi0I4iEWEw3Cg5ehx7c5+p5Q2lwtDCXOg3G6O028rA2NkExW
   SvcsrjTZaTz8W/hFpXIjfB1dG+mNz/T+RYqZu+ASSyl4hX6v4lY/PP6FM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="373332377"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="373332377"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 06:01:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="1782929"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Oct 2023 06:01:35 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxoNB-0000Aa-1I;
	Tue, 31 Oct 2023 13:01:33 +0000
Date: Tue, 31 Oct 2023 21:00:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 94/120]
 arch/arm64/kernel/hibernate.c:123:46: error: 'struct arch_hibernate_hdr' has
 no member named 'android_vendor_data1'
Message-ID: <202310312040.QHv61ult-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   82fe654f56524dce8c0600282db927816d2b3451
commit: d7e1f4f02153646cd5514cc134fbe9c1e1178869 [94/120] ANDROID: vendor hooks: Add hooks to support bootloader based hibernation
config: arm64-randconfig-004-20231031 (https://download.01.org/0day-ci/archive/20231031/202310312040.QHv61ult-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310312040.QHv61ult-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310312040.QHv61ult-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/hibernate.c: In function 'arch_hibernation_header_save':
>> arch/arm64/kernel/hibernate.c:123:46: error: 'struct arch_hibernate_hdr' has no member named 'android_vendor_data1'
     123 |         trace_android_vh_save_cpu_resume(&hdr->android_vendor_data1,
         |                                              ^~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +123 arch/arm64/kernel/hibernate.c

   111	
   112	int arch_hibernation_header_save(void *addr, unsigned int max_size)
   113	{
   114		struct arch_hibernate_hdr *hdr = addr;
   115	
   116		if (max_size < sizeof(*hdr))
   117			return -EOVERFLOW;
   118	
   119		arch_hdr_invariants(&hdr->invariants);
   120		hdr->ttbr1_el1		= __pa_symbol(swapper_pg_dir);
   121		hdr->reenter_kernel	= _cpu_resume;
   122	
 > 123		trace_android_vh_save_cpu_resume(&hdr->android_vendor_data1,
   124							__pa(cpu_resume));
   125	
   126		/* We can't use __hyp_get_vectors() because kvm may still be loaded */
   127		if (el2_reset_needed())
   128			hdr->__hyp_stub_vectors = __pa_symbol(__hyp_stub_vectors);
   129		else
   130			hdr->__hyp_stub_vectors = 0;
   131	
   132		/* Save the mpidr of the cpu we called cpu_suspend() on... */
   133		if (sleep_cpu < 0) {
   134			pr_err("Failing to hibernate on an unknown CPU.\n");
   135			return -ENODEV;
   136		}
   137		hdr->sleep_cpu_mpidr = cpu_logical_map(sleep_cpu);
   138		pr_info("Hibernating on CPU %d [mpidr:0x%llx]\n", sleep_cpu,
   139			hdr->sleep_cpu_mpidr);
   140	
   141		return 0;
   142	}
   143	EXPORT_SYMBOL(arch_hibernation_header_save);
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
