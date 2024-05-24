Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381493FB1B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 May 2024 18:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716576439; cv=none; b=E1GIpWqmyXLgUa/LeolBDPcWEMoJb00QQJILEHlmc75zciyr9SA1QgVRNio1dTWsDv5Lb+u7Ab00m+Sq8V9HRolTUmLL4+BSHzT47oOxpndx3y4efaJBGLqEubLN8pNLq3bSysSa2rgXrWYit+Jk3fexqBVzfnS8S7EbEfu+QZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716576439; c=relaxed/simple;
	bh=KXnwd4HyCFaxvhxTvbZXVNDxHngPY9VvXZL6EiExc0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AvXnuGSGxLIYsklAHtNaNwFYYDVQq73ju/L8OXiPbWabzfsdUzreWfIQI/bk3frblSYI+W8drBd6hJflmivSiFFu9US9B6Nt3ekTFJxDxE5sXgGp1IFycrIJGyf7R97H2X7Rt8ezeUFFas5V6sDJnonjqNyI4v5qIpJnj7hGdmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aLWTKSqO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aLWTKSqO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716576437; x=1748112437;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KXnwd4HyCFaxvhxTvbZXVNDxHngPY9VvXZL6EiExc0Q=;
  b=aLWTKSqOUH2p1z7gAuRLYZWKgyoo4bzuBFjjeNi0pCAa7hx/F5KmPVwn
   pwCea1c/nm69pSdhCcXzj4TyqV7zcgvaCO8WxFy4aIcDt/QkosT6SXt/P
   IetzcTH11ETVS7wQKckCvJR4B8l6ZYieW+5XGc84OZf33jglnJx+ojCjc
   SuyflqBF/gevd8u67WJYqJneUnkAEMChSmv7EcFYNWA9kWdumdq06XFpX
   4tAEZm5Z5pUHwniw4brAqL+qRkGNavyylGq3P0d3XQ5zorJX1Dh6lFiVP
   di/ukq5arjwptkes4RPKKsVvenzEorpfNGqBr9XLMbGa/O9lXLEBov9p/
   w==;
X-CSE-ConnectionGUID: TDFnP3RDTjqMrs5tMr3Gqg==
X-CSE-MsgGUID: AvmPkFR0Rs6xA/JEyJMqvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="16803431"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="16803431"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 11:47:17 -0700
X-CSE-ConnectionGUID: I7aAX2enRryzSsm6Ur4SBA==
X-CSE-MsgGUID: pIpSz1nISsCxNmwqRrkEqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="34203843"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 24 May 2024 11:47:15 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAZwd-0005oQ-2F;
	Fri, 24 May 2024 18:47:12 +0000
Date: Sat, 25 May 2024 02:46:45 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] clocksource: hyper-v: Enable the tsc_page for a TDX
 VM in TD mode
Message-ID: <202405250230.M6wftLlV-lkp@intel.com>
References: <20240523022441.20879-1-decui@microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240523022441.20879-1-decui@microsoft.com>

Hi Dexuan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/tdx]
[also build test ERROR on tip/x86/mm tip/x86/core linus/master v6.9 next-20240523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dexuan-Cui/clocksource-hyper-v-Enable-the-tsc_page-for-a-TDX-VM-in-TD-mode/20240523-102623
base:   tip/x86/tdx
patch link:    https://lore.kernel.org/r/20240523022441.20879-1-decui%40microsoft.com
patch subject: [RFC PATCH] clocksource: hyper-v: Enable the tsc_page for a TDX VM in TD mode
config: i386-randconfig-016-20240524 (https://download.01.org/0day-ci/archive/20240525/202405250230.M6wftLlV-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405250230.M6wftLlV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405250230.M6wftLlV-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/cpu/mshyperv.o: in function `ms_hyperv_init_platform':
>> arch/x86/kernel/cpu/mshyperv.c:453:(.init.text+0x445): undefined reference to `__start_bss_decrypted'
>> ld: arch/x86/kernel/cpu/mshyperv.c:454:(.init.text+0x44a): undefined reference to `__end_bss_decrypted'


vim +453 arch/x86/kernel/cpu/mshyperv.c

   378	
   379		/*
   380		 * Extract the features and hints
   381		 */
   382		ms_hyperv.features = cpuid_eax(HYPERV_CPUID_FEATURES);
   383		ms_hyperv.priv_high = cpuid_ebx(HYPERV_CPUID_FEATURES);
   384		ms_hyperv.misc_features = cpuid_edx(HYPERV_CPUID_FEATURES);
   385		ms_hyperv.hints    = cpuid_eax(HYPERV_CPUID_ENLIGHTMENT_INFO);
   386	
   387		hv_max_functions_eax = cpuid_eax(HYPERV_CPUID_VENDOR_AND_MAX_FUNCTIONS);
   388	
   389		pr_info("Hyper-V: privilege flags low 0x%x, high 0x%x, hints 0x%x, misc 0x%x\n",
   390			ms_hyperv.features, ms_hyperv.priv_high, ms_hyperv.hints,
   391			ms_hyperv.misc_features);
   392	
   393		ms_hyperv.max_vp_index = cpuid_eax(HYPERV_CPUID_IMPLEMENT_LIMITS);
   394		ms_hyperv.max_lp_index = cpuid_ebx(HYPERV_CPUID_IMPLEMENT_LIMITS);
   395	
   396		pr_debug("Hyper-V: max %u virtual processors, %u logical processors\n",
   397			 ms_hyperv.max_vp_index, ms_hyperv.max_lp_index);
   398	
   399		/*
   400		 * Check CPU management privilege.
   401		 *
   402		 * To mirror what Windows does we should extract CPU management
   403		 * features and use the ReservedIdentityBit to detect if Linux is the
   404		 * root partition. But that requires negotiating CPU management
   405		 * interface (a process to be finalized). For now, use the privilege
   406		 * flag as the indicator for running as root.
   407		 *
   408		 * Hyper-V should never specify running as root and as a Confidential
   409		 * VM. But to protect against a compromised/malicious Hyper-V trying
   410		 * to exploit root behavior to expose Confidential VM memory, ignore
   411		 * the root partition setting if also a Confidential VM.
   412		 */
   413		if ((ms_hyperv.priv_high & HV_CPU_MANAGEMENT) &&
   414		    !(ms_hyperv.priv_high & HV_ISOLATION)) {
   415			hv_root_partition = true;
   416			pr_info("Hyper-V: running as root partition\n");
   417		}
   418	
   419		if (ms_hyperv.hints & HV_X64_HYPERV_NESTED) {
   420			hv_nested = true;
   421			pr_info("Hyper-V: running on a nested hypervisor\n");
   422		}
   423	
   424		if (ms_hyperv.features & HV_ACCESS_FREQUENCY_MSRS &&
   425		    ms_hyperv.misc_features & HV_FEATURE_FREQUENCY_MSRS_AVAILABLE) {
   426			x86_platform.calibrate_tsc = hv_get_tsc_khz;
   427			x86_platform.calibrate_cpu = hv_get_tsc_khz;
   428		}
   429	
   430		if (ms_hyperv.priv_high & HV_ISOLATION) {
   431			ms_hyperv.isolation_config_a = cpuid_eax(HYPERV_CPUID_ISOLATION_CONFIG);
   432			ms_hyperv.isolation_config_b = cpuid_ebx(HYPERV_CPUID_ISOLATION_CONFIG);
   433	
   434			if (ms_hyperv.shared_gpa_boundary_active)
   435				ms_hyperv.shared_gpa_boundary =
   436					BIT_ULL(ms_hyperv.shared_gpa_boundary_bits);
   437	
   438			hyperv_paravisor_present = !!ms_hyperv.paravisor_present;
   439	
   440			pr_info("Hyper-V: Isolation Config: Group A 0x%x, Group B 0x%x\n",
   441				ms_hyperv.isolation_config_a, ms_hyperv.isolation_config_b);
   442	
   443	
   444			if (hv_get_isolation_type() == HV_ISOLATION_TYPE_SNP) {
   445				static_branch_enable(&isolation_type_snp);
   446			} else if (hv_get_isolation_type() == HV_ISOLATION_TYPE_TDX) {
   447				static_branch_enable(&isolation_type_tdx);
   448	
   449				/* A TDX VM must use x2APIC and doesn't use lazy EOI. */
   450				ms_hyperv.hints &= ~HV_X64_APIC_ACCESS_RECOMMENDED;
   451	
   452				if (!ms_hyperv.paravisor_present) {
 > 453					unsigned long vaddr = (unsigned long)__start_bss_decrypted;
 > 454					unsigned long vaddr_end = (unsigned long)__end_bss_decrypted;
   455	
   456					for (; vaddr < vaddr_end; vaddr += PMD_SIZE)
   457						set_memory_decrypted(vaddr, PMD_SIZE >> PAGE_SHIFT);
   458	
   459					/* HV_MSR_CRASH_CTL is unsupported. */
   460					ms_hyperv.misc_features &= ~HV_FEATURE_GUEST_CRASH_MSR_AVAILABLE;
   461	
   462					/* Don't trust Hyper-V's TLB-flushing hypercalls. */
   463					ms_hyperv.hints &= ~HV_X64_REMOTE_TLB_FLUSH_RECOMMENDED;
   464	
   465					x86_init.acpi.reduced_hw_early_init = reduced_hw_init;
   466				}
   467			}
   468		}
   469	
   470		if (hv_max_functions_eax >= HYPERV_CPUID_NESTED_FEATURES) {
   471			ms_hyperv.nested_features =
   472				cpuid_eax(HYPERV_CPUID_NESTED_FEATURES);
   473			pr_info("Hyper-V: Nested features: 0x%x\n",
   474				ms_hyperv.nested_features);
   475		}
   476	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
