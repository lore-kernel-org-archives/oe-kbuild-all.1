Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B3914010
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 19:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694115271; x=1725651271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3cgcQ3EfhoI7CQlUHhfDp7HIswCTFayK+S4/qvsr0Dg=;
  b=f8ueSwagglLYT/JrSiLdEt3RNBx9l6TLKPH39MwrU/eWg2eFTTTS1dW3
   0UAhxmfbl6iJ/gIuYrtrLZGXJalKApKanMgXI9uBgPJHvAzopsMWUUDBe
   5Bu9jRpcAr6zz4kWZwXvdXlQWXrv5aC3/7DD+Msq0PNboj4cl7n2EdAo0
   YfTn2uCm9yIoujJ9KsMJBkcWZbENbLUHc/FmoZ259Pr9GodgOKR79NcZk
   NkNxsAMiw/jpmYFwcLI/4wYWST7bYJVkm994xONaMOP2QQdJkeQHmX2VC
   YUQNNANbmwaJxObrQolksFa/Iollfp9lo4hVIpePsvvywl8WwKBZNt7F0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="381260749"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="381260749"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 12:34:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="1072984785"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="1072984785"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Sep 2023 12:34:29 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeKln-0001Vp-2m;
	Thu, 07 Sep 2023 19:34:27 +0000
Date: Fri, 8 Sep 2023 03:34:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 94/120]
 arch/arm64/kernel/hibernate.c:123:41: error: no member named
 'android_vendor_data1' in 'struct arch_hibernate_hdr'
Message-ID: <202309080307.IQG7Xo8f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   84131c988b4a33d9c909f0400147dcac5c53af58
commit: d7e1f4f02153646cd5514cc134fbe9c1e1178869 [94/120] ANDROID: vendor hooks: Add hooks to support bootloader based hibernation
config: arm64-randconfig-r016-20230908 (https://download.01.org/0day-ci/archive/20230908/202309080307.IQG7Xo8f-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080307.IQG7Xo8f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309080307.IQG7Xo8f-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/hibernate.c:123:41: error: no member named 'android_vendor_data1' in 'struct arch_hibernate_hdr'
     123 |         trace_android_vh_save_cpu_resume(&hdr->android_vendor_data1,
         |                                           ~~~  ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]


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
