Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A59369D71
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Aug 2026 20:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788034775; cv=none; b=ldW7eM7/kGWH5s3p6zGHe1T5/6vj8HoLOHuOo9JOmiKt2ycsXik++xdRe7e+3qiaoFT9H1A43cK/5UnRLukUfSzLNC3pYuxw+Dazeprxn/fW7tA5b2S9sOC8UN8fGOB69WMWF61VREqthIryXnDC7M3bYK8RpkHXrLBciZ1l5DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788034775; c=relaxed/simple;
	bh=AAHVeni9xchUpzBQz5+XJ3i0KsQPj+uDcQQbCtMCP7I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GMoATqAGLk5pbUMXp3oMc9qe5schwONJZtsdtbNf0ll5z/HIgISHmhDEHnOj1O/CtHipr55Ip+n5axY46ML7ThNeFr+A8NL0u2gEo1SpoVsNed9pw9zvrUo/NLampZlRp6vdnE+ZKLCUQ+A9uJXQ0CfK0wl4C/mdBYMBkbEhOQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AokQItwv; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AokQItwv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788034772; x=1819570772;
  h=date:from:to:cc:subject:message-id;
  bh=AAHVeni9xchUpzBQz5+XJ3i0KsQPj+uDcQQbCtMCP7I=;
  b=AokQItwvDWa1bN/1cBJDTfdtj74Jhd0FlZXg2jtpcIia6YtoLoccZatA
   xtpiAXLycahTBlSke0J+q0LcJ2R/Gw4zt889lTLC9gvQEsAlkmdXfYZft
   SiX/WxnRkaM2VLScLzQ74mgp7YoD8cW3uovywvctOZQOllDC+CLmKksuN
   VPCecfl5tx50W14WxZvVFY9XNr3j6/A5bLaBah6MPzN79JHFx1DwbPlIX
   qyw/JJ7pp/9bHxKua4XU87GOM4QDr+35Ejo1hmsccr4qAPsMw8CjpGMEF
   5/qhi+W1H2vMo11aShI9d+nDrI57Zt3LFrJLBdPNl1ZfYcc0Fsgc5b7NM
   g==;
X-CSE-ConnectionGUID: qIEwQj0tSpqgcGUZwISb3w==
X-CSE-MsgGUID: VmLd89KDRJGcGx6y1epXRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="92186984"
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="92186984"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2026 13:19:31 -0700
X-CSE-ConnectionGUID: Y6Z+pfa9S8uZQZgDK+Hssw==
X-CSE-MsgGUID: HZ/KAmv0SRScVjQdMLZxKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="264699169"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Aug 2026 13:19:30 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0PWR-00000000DGE-23Jq;
	Sat, 29 Aug 2026 20:19:27 +0000
Date: Sun, 30 Aug 2026 04:19:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 drivers/virt/gunyah/vm_mgr.c:887:5: warning: no previous prototype for
 'gunyah_gup_reclaim_parcel'
Message-ID: <202608300430.V8pWj3RV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sreenad,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   a935e740bf20a3a3d4fa33345a1339c5ee225865
commit: 296cceed084451decfd348415b1db9c833443713 [1/1] ANDROID: virt: gunyah: Add gup based demand paging support
config: arm64-randconfig-002-20260829 (https://download.01.org/0day-ci/archive/20260830/202608300430.V8pWj3RV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608300430.V8pWj3RV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608300430.V8pWj3RV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from arch/arm64/include/asm/cpufeature.h:23,
                    from arch/arm64/include/asm/hwcap.h:9,
                    from arch/arm64/include/asm/arch_timer.h:12,
                    from arch/arm64/include/asm/timex.h:8,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/compat.h:10,
                    from drivers/virt/gunyah/vm_mgr.c:9:
   drivers/virt/gunyah/vm_mgr.c: In function 'gunyah_vm_function_unregister':
   drivers/virt/gunyah/vm_mgr.c:183:28: error: implicit declaration of function 'module_refcount' [-Werror=implicit-function-declaration]
     183 |         WARN_ON(fn->mod && module_refcount(fn->mod));
         |                            ^~~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/virt/gunyah/vm_mgr.c: At top level:
>> drivers/virt/gunyah/vm_mgr.c:887:5: warning: no previous prototype for 'gunyah_gup_reclaim_parcel' [-Wmissing-prototypes]
     887 | int gunyah_gup_reclaim_parcel(struct gunyah_vm *ghvm,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/gunyah_gup_reclaim_parcel +887 drivers/virt/gunyah/vm_mgr.c

   886	
 > 887	int gunyah_gup_reclaim_parcel(struct gunyah_vm *ghvm,
   888				       struct gunyah_rm_mem_parcel *parcel, u64 gfn,
   889				       u64 nr)
   890	{
   891		struct gunyah_rm_mem_entry *entry;
   892		struct folio *folio;
   893		pgoff_t i;
   894		int ret;
   895	
   896		if (parcel->mem_handle != GUNYAH_MEM_HANDLE_INVAL) {
   897			ret = gunyah_rm_mem_reclaim(ghvm->rm, parcel);
   898			if (ret) {
   899				dev_err(ghvm->parent, "Failed to reclaim parcel: %d\n",
   900					ret);
   901				/* We can't reclaim the pages -- hold onto the pages
   902				 * forever because we don't know what state the memory
   903				 * is in
   904				 */
   905				return ret;
   906			}
   907			parcel->mem_handle = GUNYAH_MEM_HANDLE_INVAL;
   908	
   909			for (i = 0; i < parcel->n_mem_entries; i++) {
   910				entry = &parcel->mem_entries[i];
   911	
   912				folio = pfn_folio(PHYS_PFN(le64_to_cpu(entry->phys_addr)));
   913	
   914				if (folio_test_private(folio))
   915					gunyah_folio_host_reclaim(folio);
   916	
   917				folio_put(folio);
   918			}
   919	
   920			kfree(parcel->mem_entries);
   921			kfree(parcel->acl_entries);
   922		}
   923	
   924		return 0;
   925	}
   926	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
