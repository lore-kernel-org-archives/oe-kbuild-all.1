Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20218137C52
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 23:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755990366; cv=none; b=MVW9DWC/n58qj/KFU/WeiwHpnL23ievE3PDNeGzL1F6nWkgF3oLkuCMX/OJxXvzXuyPE2SNzUgRrPfV3eTgsH0B5xd3J/h85i4MyufhfmTlsm5B6FonYvAH1WgzKYd/eUDkNsOF/++PYVIgkj9Hfl5PTh6Sys/LHSIhvQwtXOpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755990366; c=relaxed/simple;
	bh=FoderK6BN61yZTJnwChEGWF6QiTgK+FJPQ9mw0WkcZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yh++esgFtPSnYws2ZGWkXaiWikLd3EPe6qrJwlKHA+IGN2fxfN1wmgQqO5K+2J0P1wT1ntU0eJE6iJJNGrrwu7wVZICGfWOX2uoX66pTlCUzfYv7iRAottvKfQVhebTK1y33AmsWlbfxS/YQmF5yaZZyKw1Mj4YEY9YD+rkxgh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YK9uGDRg; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YK9uGDRg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755990363; x=1787526363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FoderK6BN61yZTJnwChEGWF6QiTgK+FJPQ9mw0WkcZE=;
  b=YK9uGDRgnvMPjinPhcDUvlRMLP4q/tw5w1x3Sdn0AROtzpDDmY24whYx
   fJ3pNHAJ+Mv5jN75F/wROOFecP17LLjGiydnODfLwlGJmf5vkixHugHO4
   fKNqu2EB08JpRdmp0aH8c2g4D1WXUpMJfkdsVoqFnxV/bxyRIxPQn5auZ
   dfTfT4V4zIxs+FjJLo6pB4eQvpkjAvRZFD3HgeUkHtbrTLU8mSU+7srgr
   XvrS1XzYqyPvR2VKSalEnwqmcYdBta+i/iEcY4yic3s3/ofwi4lGBY8jw
   oRUq/q1pdoVLgYUXlvRwwtKcHIGwKLePKGgF5SMCiGcPaRYncE6VHt4iu
   g==;
X-CSE-ConnectionGUID: ZsPLFpjwRTqjgynfs1usqQ==
X-CSE-MsgGUID: 1pNhMZF2QBSjObisZUX/fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58200394"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58200394"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 16:06:02 -0700
X-CSE-ConnectionGUID: KHucsrV+RcWjsihpIxKaXQ==
X-CSE-MsgGUID: 8Uq26LnIRXCwf1T9gdAKxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="174263271"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 23 Aug 2025 16:06:01 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upxJ9-000Mdr-1W;
	Sat, 23 Aug 2025 23:05:59 +0000
Date: Sun, 24 Aug 2025 07:05:49 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fred-kvm-v7 44/45]
 arch/x86/kvm/vmx/vmx.c:2220:42: error: implicit declaration of function
 'vmx_read_guest_fred_ssp0'; did you mean 'vmx_read_guest_fred_rsp0'?
Message-ID: <202508240654.Wd2CTESU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fred-kvm-v7
head:   ba4a099cdfb6456f5fae6fd235ce77659517af0e
commit: ba4a099cdfb6456f5fae6fd235ce77659517af0e [44/45] KVM: VMX: Add support for FRED SSP0 save/restore
config: i386-buildonly-randconfig-001-20250824 (https://download.01.org/0day-ci/archive/20250824/202508240654.Wd2CTESU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240654.Wd2CTESU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508240654.Wd2CTESU-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/vmx/vmx.c: In function 'vmx_get_msr':
>> arch/x86/kvm/vmx/vmx.c:2220:42: error: implicit declaration of function 'vmx_read_guest_fred_ssp0'; did you mean 'vmx_read_guest_fred_rsp0'? [-Werror=implicit-function-declaration]
    2220 |                         msr_info->data = vmx_read_guest_fred_ssp0(vmx);
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                          vmx_read_guest_fred_rsp0
   arch/x86/kvm/vmx/vmx.c: In function 'vmx_set_msr':
>> arch/x86/kvm/vmx/vmx.c:2583:25: error: implicit declaration of function 'vmx_write_guest_fred_ssp0'; did you mean 'vmx_read_guest_fred_rsp0'? [-Werror=implicit-function-declaration]
    2583 |                         vmx_write_guest_fred_ssp0(vmx, data);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                         vmx_read_guest_fred_rsp0
   cc1: some warnings being treated as errors


vim +2220 arch/x86/kvm/vmx/vmx.c

  2053	
  2054	/*
  2055	 * Reads an msr value (of 'msr_info->index') into 'msr_info->data'.
  2056	 * Returns 0 on success, non-0 otherwise.
  2057	 * Assumes vcpu_load() was already called.
  2058	 */
  2059	int vmx_get_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
  2060	{
  2061		struct vcpu_vmx *vmx = to_vmx(vcpu);
  2062		struct vmx_uret_msr *msr;
  2063		u32 index;
  2064	
  2065		switch (msr_info->index) {
  2066	#ifdef CONFIG_X86_64
  2067		case MSR_FS_BASE:
  2068			msr_info->data = vmcs_readl(GUEST_FS_BASE);
  2069			break;
  2070		case MSR_GS_BASE:
  2071			msr_info->data = vmcs_readl(GUEST_GS_BASE);
  2072			break;
  2073		case MSR_KERNEL_GS_BASE:
  2074			msr_info->data = vmx_read_guest_kernel_gs_base(vmx);
  2075			break;
  2076		case MSR_IA32_FRED_RSP0:
  2077			msr_info->data = vmx_read_guest_fred_rsp0(vmx);
  2078			break;
  2079		case MSR_IA32_FRED_RSP1 ... MSR_IA32_FRED_CONFIG:
  2080			msr_info->data = vmcs_read64(fred_msr_to_vmcs(msr_info->index));
  2081			break;
  2082	#endif
  2083		case MSR_EFER:
  2084			return kvm_get_msr_common(vcpu, msr_info);
  2085		case MSR_IA32_TSX_CTRL:
  2086			if (!msr_info->host_initiated &&
  2087			    !(vcpu->arch.arch_capabilities & ARCH_CAP_TSX_CTRL_MSR))
  2088				return 1;
  2089			goto find_uret_msr;
  2090		case MSR_IA32_UMWAIT_CONTROL:
  2091			if (!msr_info->host_initiated && !vmx_has_waitpkg(vmx))
  2092				return 1;
  2093	
  2094			msr_info->data = vmx->msr_ia32_umwait_control;
  2095			break;
  2096		case MSR_IA32_SPEC_CTRL:
  2097			if (!msr_info->host_initiated &&
  2098			    !guest_has_spec_ctrl_msr(vcpu))
  2099				return 1;
  2100	
  2101			msr_info->data = to_vmx(vcpu)->spec_ctrl;
  2102			break;
  2103		case MSR_IA32_SYSENTER_CS:
  2104			msr_info->data = vmcs_read32(GUEST_SYSENTER_CS);
  2105			break;
  2106		case MSR_IA32_SYSENTER_EIP:
  2107			msr_info->data = vmcs_readl(GUEST_SYSENTER_EIP);
  2108			break;
  2109		case MSR_IA32_SYSENTER_ESP:
  2110			msr_info->data = vmcs_readl(GUEST_SYSENTER_ESP);
  2111			break;
  2112		case MSR_IA32_BNDCFGS:
  2113			if (!kvm_mpx_supported() ||
  2114			    (!msr_info->host_initiated &&
  2115			     !guest_cpu_cap_has(vcpu, X86_FEATURE_MPX)))
  2116				return 1;
  2117			msr_info->data = vmcs_read64(GUEST_BNDCFGS);
  2118			break;
  2119		case MSR_IA32_MCG_EXT_CTL:
  2120			if (!msr_info->host_initiated &&
  2121			    !(vmx->msr_ia32_feature_control &
  2122			      FEAT_CTL_LMCE_ENABLED))
  2123				return 1;
  2124			msr_info->data = vcpu->arch.mcg_ext_ctl;
  2125			break;
  2126		case MSR_IA32_FEAT_CTL:
  2127			msr_info->data = vmx->msr_ia32_feature_control;
  2128			break;
  2129		case MSR_IA32_SGXLEPUBKEYHASH0 ... MSR_IA32_SGXLEPUBKEYHASH3:
  2130			if (!msr_info->host_initiated &&
  2131			    !guest_cpu_cap_has(vcpu, X86_FEATURE_SGX_LC))
  2132				return 1;
  2133			msr_info->data = to_vmx(vcpu)->msr_ia32_sgxlepubkeyhash
  2134				[msr_info->index - MSR_IA32_SGXLEPUBKEYHASH0];
  2135			break;
  2136		case KVM_FIRST_EMULATED_VMX_MSR ... KVM_LAST_EMULATED_VMX_MSR:
  2137			if (!guest_cpu_cap_has(vcpu, X86_FEATURE_VMX))
  2138				return 1;
  2139			if (vmx_get_vmx_msr(&vmx->nested.msrs, msr_info->index,
  2140					    &msr_info->data))
  2141				return 1;
  2142	#ifdef CONFIG_KVM_HYPERV
  2143			/*
  2144			 * Enlightened VMCS v1 doesn't have certain VMCS fields but
  2145			 * instead of just ignoring the features, different Hyper-V
  2146			 * versions are either trying to use them and fail or do some
  2147			 * sanity checking and refuse to boot. Filter all unsupported
  2148			 * features out.
  2149			 */
  2150			if (!msr_info->host_initiated && guest_cpu_cap_has_evmcs(vcpu))
  2151				nested_evmcs_filter_control_msr(vcpu, msr_info->index,
  2152								&msr_info->data);
  2153	#endif
  2154			break;
  2155		case MSR_IA32_RTIT_CTL:
  2156			if (!vmx_pt_mode_is_host_guest())
  2157				return 1;
  2158			msr_info->data = vmx->pt_desc.guest.ctl;
  2159			break;
  2160		case MSR_IA32_RTIT_STATUS:
  2161			if (!vmx_pt_mode_is_host_guest())
  2162				return 1;
  2163			msr_info->data = vmx->pt_desc.guest.status;
  2164			break;
  2165		case MSR_IA32_RTIT_CR3_MATCH:
  2166			if (!vmx_pt_mode_is_host_guest() ||
  2167				!intel_pt_validate_cap(vmx->pt_desc.caps,
  2168							PT_CAP_cr3_filtering))
  2169				return 1;
  2170			msr_info->data = vmx->pt_desc.guest.cr3_match;
  2171			break;
  2172		case MSR_IA32_RTIT_OUTPUT_BASE:
  2173			if (!vmx_pt_mode_is_host_guest() ||
  2174				(!intel_pt_validate_cap(vmx->pt_desc.caps,
  2175						PT_CAP_topa_output) &&
  2176				 !intel_pt_validate_cap(vmx->pt_desc.caps,
  2177						PT_CAP_single_range_output)))
  2178				return 1;
  2179			msr_info->data = vmx->pt_desc.guest.output_base;
  2180			break;
  2181		case MSR_IA32_RTIT_OUTPUT_MASK:
  2182			if (!vmx_pt_mode_is_host_guest() ||
  2183				(!intel_pt_validate_cap(vmx->pt_desc.caps,
  2184						PT_CAP_topa_output) &&
  2185				 !intel_pt_validate_cap(vmx->pt_desc.caps,
  2186						PT_CAP_single_range_output)))
  2187				return 1;
  2188			msr_info->data = vmx->pt_desc.guest.output_mask;
  2189			break;
  2190		case MSR_IA32_RTIT_ADDR0_A ... MSR_IA32_RTIT_ADDR3_B:
  2191			index = msr_info->index - MSR_IA32_RTIT_ADDR0_A;
  2192			if (!vmx_pt_mode_is_host_guest() ||
  2193			    (index >= 2 * vmx->pt_desc.num_address_ranges))
  2194				return 1;
  2195			if (index % 2)
  2196				msr_info->data = vmx->pt_desc.guest.addr_b[index / 2];
  2197			else
  2198				msr_info->data = vmx->pt_desc.guest.addr_a[index / 2];
  2199			break;
  2200		case MSR_IA32_S_CET:
  2201			msr_info->data = vmcs_readl(GUEST_S_CET);
  2202			break;
  2203		case MSR_KVM_INTERNAL_GUEST_SSP:
  2204			msr_info->data = vmcs_readl(GUEST_SSP);
  2205			break;
  2206		case MSR_IA32_INT_SSP_TAB:
  2207			msr_info->data = vmcs_readl(GUEST_INTR_SSP_TABLE);
  2208			break;
  2209		case MSR_IA32_DEBUGCTLMSR:
  2210			msr_info->data = vmx_guest_debugctl_read();
  2211			break;
  2212		case MSR_IA32_PL0_SSP:
  2213			/*
  2214			 * If kvm_cpu_cap_has(X86_FEATURE_SHSTK) but
  2215			 * !guest_cpu_cap_has(vcpu, X86_FEATURE_SHSTK), XSAVES/XRSTORS
  2216			 * cover SSP MSRs.
  2217			 */
  2218			if (!kvm_cpu_cap_has(X86_FEATURE_SHSTK) &&
  2219			    guest_cpu_cap_has(vcpu, X86_FEATURE_FRED)) {
> 2220				msr_info->data = vmx_read_guest_fred_ssp0(vmx);
  2221				break;
  2222			}
  2223			fallthrough;
  2224		default:
  2225		find_uret_msr:
  2226			msr = vmx_find_uret_msr(vmx, msr_info->index);
  2227			if (msr) {
  2228				msr_info->data = msr->data;
  2229				break;
  2230			}
  2231			return kvm_get_msr_common(vcpu, msr_info);
  2232		}
  2233	
  2234		return 0;
  2235	}
  2236	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
