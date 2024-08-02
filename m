Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E1E1ABEAC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Aug 2024 22:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722639364; cv=none; b=bwxeFtUaHlDhyLS+Ez57vgPtRXdeks3bsG7PbCP64Jh6uKTY9B3/MwrsNYjt9wyhLwlTMNBFXox4U+/oiF5fbQEl7kvdHrW2ecVLUGl9KW9s4qYEGs/wfUXpQiANzpqZ2gcmyV+9nnGofC73Jh4MRiusJwJM0gPRW8m18wRhDO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722639364; c=relaxed/simple;
	bh=/OStogDMNVmM4GxUWbtt1OCYIM94oZoP0wsK9kn9EMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oZGet80MXROKMsqDH8kTuNBGVkcEJuidGgDYUQIJ7vrKDM2O4AgFd4zW3ScE/BPX9kEXi+VqHUaRINtupeKAw60pQ008R4yuOn8U58Qpsx2wuhzb94T2YbrYzGo8Je162i3RJ8EPJm5ZnQQnpl6GYJPZm1LHln3JMZk7JM4Houk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NI9wqLrh; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NI9wqLrh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722639362; x=1754175362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/OStogDMNVmM4GxUWbtt1OCYIM94oZoP0wsK9kn9EMY=;
  b=NI9wqLrhgOUs+SP8wfSmgikHCQxKA4CSG0cX1NUUbD6zusAvp6eWscfq
   m1ElnsCCWVl2nMJ3liEs10c3ZtDc4VyjWa1IDA5vuInIBKKDA+q5Mn7oO
   03a+DW5f49uA1AMRlKlop+e7M+4VK/4tZQXncEhGX9gmTC/J+/etBJrVn
   2NdTcaRcBR2TwquBn4jJPcGtzJqfN+erVG6+MztLwwR2uvwmRjBd2v6VH
   BM3ntVtp6mBWwXfVST/WTki3bXwp3EjShvLLIpwdGzo3TKNxkjfJAf1Q8
   /cSTjyLUP972fvXMFjk/HZxJGqmKgoQ/s97Z4zeGTxQCT0Qh0EtcbaVhp
   Q==;
X-CSE-ConnectionGUID: Tq1elxILS/yDJWlFhD/xGw==
X-CSE-MsgGUID: IwlElj05TZ6/DsTE31GL/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20793121"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="20793121"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 15:55:52 -0700
X-CSE-ConnectionGUID: FOG53XmQSPatYD2URmxUSQ==
X-CSE-MsgGUID: bOin3340Q3aAT+SuiFzMfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="56151607"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Aug 2024 15:55:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa1Bb-000xWU-0z;
	Fri, 02 Aug 2024 22:55:47 +0000
Date: Sat, 3 Aug 2024 06:55:10 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Kai Huang <kai.huang@intel.com>,
	Yan Zhao <yan.y.zhao@intel.com>
Subject: [intel-tdx:tdx_kvm_dev-2024-08-01-rebase 66/152]
 arch/x86/kvm/vmx/main.c:34:28: error: lvalue required as left operand of
 assignment
Message-ID: <202408030605.0mQr74Id-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git tdx_kvm_dev-2024-08-01-rebase
head:   5c43d1421f84cdeb3172f10826e98cbb920657fa
commit: 9cf78ea6bd2d11c2f86e94a416ddcf6797a60602 [66/152] With fixup: KVM: TDX: TDP MMU TDX support
config: i386-randconfig-004-20240803 (https://download.01.org/0day-ci/archive/20240803/202408030605.0mQr74Id-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408030605.0mQr74Id-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408030605.0mQr74Id-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/x86/kvm/vmx/main.c: In function 'vt_hardware_setup':
>> arch/x86/kvm/vmx/main.c:34:28: error: lvalue required as left operand of assignment
      34 |                 enable_tdx = false;
         |                            ^
   arch/x86/kvm/vmx/main.c: At top level:
>> arch/x86/kvm/vmx/main.c:182:12: warning: 'vt_flush_remote_tlbs_range' defined but not used [-Wunused-function]
     182 | static int vt_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, gfn_t nr_pages)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/vmx/main.c:170:12: warning: 'vt_flush_remote_tlbs' defined but not used [-Wunused-function]
     170 | static int vt_flush_remote_tlbs(struct kvm *kvm)
         |            ^~~~~~~~~~~~~~~~~~~~


vim +34 arch/x86/kvm/vmx/main.c

    17	
    18	static __init int vt_hardware_setup(void)
    19	{
    20		int ret;
    21	
    22		ret = vmx_hardware_setup();
    23		if (ret)
    24			return ret;
    25	
    26	#if IS_ENABLED(CONFIG_HYPERV)
    27		/*
    28		 * TDX KVM overrides flush_remote_tlbs method and assumes
    29		 * flush_remote_tlbs_range = NULL that falls back to
    30		 * flush_remote_tlbs.  Disable TDX if there are conflicts.
    31		 */
    32		if (vt_x86_ops.flush_remote_tlbs ||
    33		    vt_x86_ops.flush_remote_tlbs_range) {
  > 34			enable_tdx = false;
    35			pr_warn_ratelimited("TDX requires baremetal. Not Supported on VMM guest.\n");
    36		}
    37	#endif
    38	
    39		/*
    40		 * Undate vt_x86_ops::vm_size here so it is ready before
    41		 * kvm_ops_update() is called in kvm_x86_vendor_init().
    42		 *
    43		 * Note, the actual bringing up of TDX must be done after
    44		 * kvm_ops_update() because enabling TDX requires enabling
    45		 * hardware virtualization first, i.e., all online CPUs must
    46		 * be in post-VMXON state.  This means the @vm_size here
    47		 * may be updated to TDX's size but TDX may fail to enable
    48		 * at later time.
    49		 *
    50		 * The VMX/VT code could update kvm_x86_ops::vm_size again
    51		 * after bringing up TDX, but this would require exporting
    52		 * either kvm_x86_ops or kvm_ops_update() from the base KVM
    53		 * module, which looks overkill.  Anyway, the worst case here
    54		 * is KVM may allocate couple of more bytes than needed for
    55		 * each VM.
    56		 */
    57		if (enable_tdx) {
    58			vt_x86_ops.vm_size = max_t(unsigned int, vt_x86_ops.vm_size,
    59					sizeof(struct kvm_tdx));
    60			/*
    61			 * Note, TDX may fail to initialize in a later time in
    62			 * vt_init(), in which case it is not necessary to setup
    63			 * those callbacks.  But making them valid here even
    64			 * when TDX fails to init later is fine because those
    65			 * callbacks won't be called if the VM isn't TDX guest.
    66			 */
    67			vt_x86_ops.link_external_spt = tdx_sept_link_private_spt;
    68			vt_x86_ops.set_external_spte = tdx_sept_set_private_spte;
    69			vt_x86_ops.free_external_spt = tdx_sept_free_private_spt;
    70			vt_x86_ops.remove_external_spte = tdx_sept_remove_private_spte;
    71		}
    72	
    73	#if IS_ENABLED(CONFIG_INTEL_TDX_HOST)
    74		if (enable_tdx) {
    75			vt_x86_ops.flush_remote_tlbs = vt_flush_remote_tlbs;
    76			vt_x86_ops.flush_remote_tlbs_range = vt_flush_remote_tlbs_range;
    77		}
    78	#endif
    79	
    80		return 0;
    81	}
    82	
    83	static int vt_vm_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
    84	{
    85		if (is_td(kvm))
    86			return tdx_vm_enable_cap(kvm, cap);
    87	
    88		return -EINVAL;
    89	}
    90	
    91	static int vt_vm_init(struct kvm *kvm)
    92	{
    93		if (is_td(kvm))
    94			return tdx_vm_init(kvm);
    95	
    96		return vmx_vm_init(kvm);
    97	}
    98	
    99	static void vt_vm_destroy(struct kvm *kvm)
   100	{
   101		if (is_td(kvm))
   102			return tdx_mmu_release_hkid(kvm);
   103	
   104		vmx_vm_destroy(kvm);
   105	}
   106	
   107	static void vt_vm_free(struct kvm *kvm)
   108	{
   109		if (is_td(kvm))
   110			tdx_vm_free(kvm);
   111	}
   112	
   113	static int vt_vcpu_precreate(struct kvm *kvm)
   114	{
   115		if (is_td(kvm))
   116			return 0;
   117	
   118		return vmx_vcpu_precreate(kvm);
   119	}
   120	
   121	static int vt_vcpu_create(struct kvm_vcpu *vcpu)
   122	{
   123		if (is_td_vcpu(vcpu))
   124			return tdx_vcpu_create(vcpu);
   125	
   126		return vmx_vcpu_create(vcpu);
   127	}
   128	
   129	static void vt_vcpu_free(struct kvm_vcpu *vcpu)
   130	{
   131		if (is_td_vcpu(vcpu)) {
   132			tdx_vcpu_free(vcpu);
   133			return;
   134		}
   135	
   136		vmx_vcpu_free(vcpu);
   137	}
   138	
   139	static void vt_vcpu_reset(struct kvm_vcpu *vcpu, bool init_event)
   140	{
   141		if (is_td_vcpu(vcpu)) {
   142			tdx_vcpu_reset(vcpu, init_event);
   143			return;
   144		}
   145	
   146		vmx_vcpu_reset(vcpu, init_event);
   147	}
   148	
   149	static void vt_flush_tlb_all(struct kvm_vcpu *vcpu)
   150	{
   151		if (is_td_vcpu(vcpu)) {
   152			tdx_flush_tlb(vcpu);
   153			return;
   154		}
   155	
   156		vmx_flush_tlb_all(vcpu);
   157	}
   158	
   159	static void vt_flush_tlb_current(struct kvm_vcpu *vcpu)
   160	{
   161		if (is_td_vcpu(vcpu)) {
   162			tdx_flush_tlb_current(vcpu);
   163			return;
   164		}
   165	
   166		vmx_flush_tlb_current(vcpu);
   167	}
   168	
   169	#if IS_ENABLED(CONFIG_HYPERV) || IS_ENABLED(CONFIG_INTEL_TDX_HOST)
 > 170	static int vt_flush_remote_tlbs(struct kvm *kvm)
   171	{
   172		if (is_td(kvm))
   173			return tdx_sept_flush_remote_tlbs(kvm);
   174	
   175		/*
   176		 * fallback to KVM_REQ_TLB_FLUSH.
   177		 * See kvm_arch_flush_remote_tlb() and kvm_flush_remote_tlbs().
   178		 */
   179		return -EOPNOTSUPP;
   180	}
   181	
 > 182	static int vt_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, gfn_t nr_pages)
   183	{
   184		return -EOPNOTSUPP;
   185	}
   186	#endif
   187	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
