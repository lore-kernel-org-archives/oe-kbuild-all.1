Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5C2A956
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 11:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692788605; x=1724324605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=90mFy0giDcyu6emWCddSJtkY89m9kcGhMqnajXR+Zes=;
  b=MD7Obj4S5MEQh8gmXm02RKDyAgHWgCNXl0mw2+/9P1lagvK38jjncLVa
   a53Aufm0JwMOdXLIrZrSVrPb/wUr/fyshaE2UHg2dWWRABIv0dYYeRS/9
   plKv0+fLXhGvgtYfTwd9YtINTpaKsjpcbnyM66EoVOz7ynOmCNyKzCYVg
   TbuyYiNZy6fw6lsUAmY3TLOVZgrhNzWnUivCKdcLXW6j9iRgRBdzIy6Af
   u+JM/MA6g2i0tmrSB567x+Lh/nUhrh/qO8Wx91M4/6MsvIMfM4WRGNK24
   /SVBW5Pk5QHBTUBimdldbvT81Gm6nv2RcGyqB3HEsr8r2Tt4C7LqWUye6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="460500134"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="460500134"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 04:03:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="730175867"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="730175867"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 23 Aug 2023 04:03:20 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYldv-00017m-0t;
	Wed, 23 Aug 2023 11:03:19 +0000
Date: Wed, 23 Aug 2023 19:02:39 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <tiala@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Michael Kelley <mikelley@microsoft.com>
Subject: [linux-next:master 11576/12208] arch/x86/kernel/cpu/mshyperv.c:407:
 undefined reference to `isolation_type_en_snp'
Message-ID: <202308231805.RyYOycAU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e3f80d3eae76c3557b3c9b5938ad01c0e6cf25ec
commit: d6e2d652443751e290b2edb70173ec3c22f78fbe [11576/12208] x86/hyperv: Add sev-snp enlightened guest static key
config: x86_64-randconfig-103-20230823 (https://download.01.org/0day-ci/archive/20230823/202308231805.RyYOycAU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308231805.RyYOycAU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308231805.RyYOycAU-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `ms_hyperv_init_platform':
>> arch/x86/kernel/cpu/mshyperv.c:407: undefined reference to `isolation_type_en_snp'


vim +407 arch/x86/kernel/cpu/mshyperv.c

   327	
   328		/*
   329		 * Extract the features and hints
   330		 */
   331		ms_hyperv.features = cpuid_eax(HYPERV_CPUID_FEATURES);
   332		ms_hyperv.priv_high = cpuid_ebx(HYPERV_CPUID_FEATURES);
   333		ms_hyperv.misc_features = cpuid_edx(HYPERV_CPUID_FEATURES);
   334		ms_hyperv.hints    = cpuid_eax(HYPERV_CPUID_ENLIGHTMENT_INFO);
   335	
   336		hv_max_functions_eax = cpuid_eax(HYPERV_CPUID_VENDOR_AND_MAX_FUNCTIONS);
   337	
   338		pr_info("Hyper-V: privilege flags low 0x%x, high 0x%x, hints 0x%x, misc 0x%x\n",
   339			ms_hyperv.features, ms_hyperv.priv_high, ms_hyperv.hints,
   340			ms_hyperv.misc_features);
   341	
   342		ms_hyperv.max_vp_index = cpuid_eax(HYPERV_CPUID_IMPLEMENT_LIMITS);
   343		ms_hyperv.max_lp_index = cpuid_ebx(HYPERV_CPUID_IMPLEMENT_LIMITS);
   344	
   345		pr_debug("Hyper-V: max %u virtual processors, %u logical processors\n",
   346			 ms_hyperv.max_vp_index, ms_hyperv.max_lp_index);
   347	
   348		/*
   349		 * Check CPU management privilege.
   350		 *
   351		 * To mirror what Windows does we should extract CPU management
   352		 * features and use the ReservedIdentityBit to detect if Linux is the
   353		 * root partition. But that requires negotiating CPU management
   354		 * interface (a process to be finalized). For now, use the privilege
   355		 * flag as the indicator for running as root.
   356		 *
   357		 * Hyper-V should never specify running as root and as a Confidential
   358		 * VM. But to protect against a compromised/malicious Hyper-V trying
   359		 * to exploit root behavior to expose Confidential VM memory, ignore
   360		 * the root partition setting if also a Confidential VM.
   361		 */
   362		if ((ms_hyperv.priv_high & HV_CPU_MANAGEMENT) &&
   363		    !(ms_hyperv.priv_high & HV_ISOLATION)) {
   364			hv_root_partition = true;
   365			pr_info("Hyper-V: running as root partition\n");
   366		}
   367	
   368		if (ms_hyperv.hints & HV_X64_HYPERV_NESTED) {
   369			hv_nested = true;
   370			pr_info("Hyper-V: running on a nested hypervisor\n");
   371		}
   372	
   373		/*
   374		 * Extract host information.
   375		 */
   376		if (hv_max_functions_eax >= HYPERV_CPUID_VERSION) {
   377			hv_host_info_eax = cpuid_eax(HYPERV_CPUID_VERSION);
   378			hv_host_info_ebx = cpuid_ebx(HYPERV_CPUID_VERSION);
   379			hv_host_info_ecx = cpuid_ecx(HYPERV_CPUID_VERSION);
   380			hv_host_info_edx = cpuid_edx(HYPERV_CPUID_VERSION);
   381	
   382			pr_info("Hyper-V: Host Build %d.%d.%d.%d-%d-%d\n",
   383				hv_host_info_ebx >> 16, hv_host_info_ebx & 0xFFFF,
   384				hv_host_info_eax, hv_host_info_edx & 0xFFFFFF,
   385				hv_host_info_ecx, hv_host_info_edx >> 24);
   386		}
   387	
   388		if (ms_hyperv.features & HV_ACCESS_FREQUENCY_MSRS &&
   389		    ms_hyperv.misc_features & HV_FEATURE_FREQUENCY_MSRS_AVAILABLE) {
   390			x86_platform.calibrate_tsc = hv_get_tsc_khz;
   391			x86_platform.calibrate_cpu = hv_get_tsc_khz;
   392		}
   393	
   394		if (ms_hyperv.priv_high & HV_ISOLATION) {
   395			ms_hyperv.isolation_config_a = cpuid_eax(HYPERV_CPUID_ISOLATION_CONFIG);
   396			ms_hyperv.isolation_config_b = cpuid_ebx(HYPERV_CPUID_ISOLATION_CONFIG);
   397	
   398			if (ms_hyperv.shared_gpa_boundary_active)
   399				ms_hyperv.shared_gpa_boundary =
   400					BIT_ULL(ms_hyperv.shared_gpa_boundary_bits);
   401	
   402			pr_info("Hyper-V: Isolation Config: Group A 0x%x, Group B 0x%x\n",
   403				ms_hyperv.isolation_config_a, ms_hyperv.isolation_config_b);
   404	
   405	
   406			if (cc_platform_has(CC_ATTR_GUEST_SEV_SNP)) {
 > 407				static_branch_enable(&isolation_type_en_snp);
   408			} else if (hv_get_isolation_type() == HV_ISOLATION_TYPE_SNP) {
   409				static_branch_enable(&isolation_type_snp);
   410			}
   411		}
   412	
   413		if (hv_max_functions_eax >= HYPERV_CPUID_NESTED_FEATURES) {
   414			ms_hyperv.nested_features =
   415				cpuid_eax(HYPERV_CPUID_NESTED_FEATURES);
   416			pr_info("Hyper-V: Nested features: 0x%x\n",
   417				ms_hyperv.nested_features);
   418		}
   419	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
