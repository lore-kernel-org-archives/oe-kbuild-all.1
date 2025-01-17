Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB3E1FDE3A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 12:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737116261; cv=none; b=WKseHJIkHsfzqBPbv7JdyZpHehSyHNryUyZtNscmZnsP1iDBhTTxTjP1vj6xI8uToO7hNEBhxe4nXEbuA4I5YRGphIEss8bnbnl0ii4WtLkb8iauh5e57+8bUni9Emh0ZyV/ckYq3oImbhP8PNs86lkAD/6EozG4/8EneyMbpJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737116261; c=relaxed/simple;
	bh=BZ2dXHOeQnSPOStdSMsJuGcB9JBZHYiOmgJVvsMFnTY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U4uKiofo1XBlEUNXsGaGukTb01g0hovaF8XCiA3fw6JutaT3JJ3y+7zecGoNIz4Au6ytcnwzb0whdgRSVWZWNvgAALALypieAFh/WJ6+6vK5Q9Cf3jmRp3A+WCKadqz4CGvk4V6DdzBb85VVEaNO2ioe1UMcbZEo45keoMFy5D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BVe2kL4q; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVe2kL4q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737116259; x=1768652259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BZ2dXHOeQnSPOStdSMsJuGcB9JBZHYiOmgJVvsMFnTY=;
  b=BVe2kL4qdVLUi7KgaCaPlDVYAWHiBx61mNjiVsSDFKQ2O6nZuQzZS3Dg
   gsMn8lo5eteTbVulRHG8IDMBTr11u6CyUEoZF0ZR097nRfkNICll1AmEE
   3LKleXlk0O0dlofGNPXwk4yAZ7TvJpFRdkWfawy50W9lJVEw/SeD/kF6c
   O+cbKWxKYMO3r1VtFKUUcnLwxAzSRAN+dHlgwLvZ7+RdcuDQYwy2+UENI
   6FGmz4G+Q2NQJiBHNpkAFpRNLrPHKqFuy1vkqeXrigcWIdMbG6aeYpW4M
   xPFI5uxU/UMVG20pBnKt262Wz10DycEpRlHMT5oWF3vMGguNH3a0Wd0Fr
   Q==;
X-CSE-ConnectionGUID: eVJ9esMuSqKy2HkxtqZlgA==
X-CSE-MsgGUID: EXC6pYm6QGuK6HyrPS4jQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37568592"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37568592"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 04:17:36 -0800
X-CSE-ConnectionGUID: Yba0bFSoRxOLSNXr205Wgg==
X-CSE-MsgGUID: nYbSQcwSRfuWKj1ZizurrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106265660"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jan 2025 04:17:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYlI5-000TB9-0x;
	Fri, 17 Jan 2025 12:17:33 +0000
Date: Fri, 17 Jan 2025 20:16:48 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:vmx/nested_hlt_pause_intercept 7/7]
 arch/x86/kvm/vmx/vmx.c:8084:22: error: too few arguments to function
 'vmx_is_io_intercepted'
Message-ID: <202501172017.CCfelXjY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux vmx/nested_hlt_pause_intercept
head:   3eba42004fd15e5353a24b6527ea809e83e2985a
commit: 3eba42004fd15e5353a24b6527ea809e83e2985a [7/7] KVM: nVMX: Synthesize nested VM-Exit for supported emulation intercepts
config: i386-buildonly-randconfig-003-20250117 (https://download.01.org/0day-ci/archive/20250117/202501172017.CCfelXjY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501172017.CCfelXjY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501172017.CCfelXjY-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/vmx/vmx.c: In function 'vmx_check_intercept':
>> arch/x86/kvm/vmx/vmx.c:8084:22: error: too few arguments to function 'vmx_is_io_intercepted'
    8084 |                 if (!vmx_is_io_intercepted(vcpu, info))
         |                      ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/vmx.c:8010:13: note: declared here
    8010 | static bool vmx_is_io_intercepted(struct kvm_vcpu *vcpu,
         |             ^~~~~~~~~~~~~~~~~~~~~


vim +/vmx_is_io_intercepted +8084 arch/x86/kvm/vmx/vmx.c

35a571346a94fb arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-04  8055  
5f18c642ff7e21 arch/x86/kvm/vmx/vmx.c Paolo Bonzini       2024-03-18  8056  int vmx_check_intercept(struct kvm_vcpu *vcpu,
8a76d7f25f8f24 arch/x86/kvm/vmx.c     Joerg Roedel        2011-04-04  8057  			struct x86_instruction_info *info,
21f1b8f29ea5b2 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-02-18  8058  			enum x86_intercept_stage stage,
21f1b8f29ea5b2 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-02-18  8059  			struct x86_exception *exception)
8a76d7f25f8f24 arch/x86/kvm/vmx.c     Joerg Roedel        2011-04-04  8060  {
fb6d4d340e0532 arch/x86/kvm/vmx.c     Paolo Bonzini       2016-07-12  8061  	struct vmcs12 *vmcs12 = get_vmcs12(vcpu);
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8062  	unsigned long exit_qualification = 0;
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8063  	u32 vm_exit_reason;
fb6d4d340e0532 arch/x86/kvm/vmx.c     Paolo Bonzini       2016-07-12  8064  
35a571346a94fb arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-04  8065  	switch (info->intercept) {
4948ba1f4b2af0 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8066  	case x86_intercept_rdpid:
fb6d4d340e0532 arch/x86/kvm/vmx.c     Paolo Bonzini       2016-07-12  8067  		/*
4948ba1f4b2af0 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8068  		 * RDPID causes #UD if not enabled through secondary execution
4948ba1f4b2af0 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8069  		 * controls (ENABLE_RDTSCP).  Note, the implicit MSR access to
4948ba1f4b2af0 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8070  		 * TSC_AUX is NOT subject to interception, i.e. checking only
4948ba1f4b2af0 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8071  		 * the dedicated execution control is architecturally correct.
fb6d4d340e0532 arch/x86/kvm/vmx.c     Paolo Bonzini       2016-07-12  8072  		 */
7f3603b6313623 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-09-23  8073  		if (!nested_cpu_has2(vmcs12, SECONDARY_EXEC_ENABLE_RDTSCP)) {
21f1b8f29ea5b2 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-02-18  8074  			exception->vector = UD_VECTOR;
21f1b8f29ea5b2 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-02-18  8075  			exception->error_code_valid = false;
fb6d4d340e0532 arch/x86/kvm/vmx.c     Paolo Bonzini       2016-07-12  8076  			return X86EMUL_PROPAGATE_FAULT;
fb6d4d340e0532 arch/x86/kvm/vmx.c     Paolo Bonzini       2016-07-12  8077  		}
4948ba1f4b2af0 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8078  		return X86EMUL_CONTINUE;
35a571346a94fb arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-04  8079  
35a571346a94fb arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-04  8080  	case x86_intercept_in:
35a571346a94fb arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-04  8081  	case x86_intercept_ins:
35a571346a94fb arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-04  8082  	case x86_intercept_out:
35a571346a94fb arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-04  8083  	case x86_intercept_outs:
b057118e8af266 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16 @8084  		if (!vmx_is_io_intercepted(vcpu, info))
b057118e8af266 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8085  			return X86EMUL_CONTINUE;
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8086  
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8087  		vm_exit_reason = EXIT_REASON_IO_INSTRUCTION;
b057118e8af266 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8088  		break;
fb6d4d340e0532 arch/x86/kvm/vmx.c     Paolo Bonzini       2016-07-12  8089  
86f7e90ce840aa arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-29  8090  	case x86_intercept_lgdt:
86f7e90ce840aa arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-29  8091  	case x86_intercept_lidt:
86f7e90ce840aa arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-29  8092  	case x86_intercept_lldt:
86f7e90ce840aa arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-29  8093  	case x86_intercept_ltr:
86f7e90ce840aa arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-29  8094  	case x86_intercept_sgdt:
86f7e90ce840aa arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-29  8095  	case x86_intercept_sidt:
86f7e90ce840aa arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-29  8096  	case x86_intercept_sldt:
86f7e90ce840aa arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-29  8097  	case x86_intercept_str:
86f7e90ce840aa arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-29  8098  		if (!nested_cpu_has2(vmcs12, SECONDARY_EXEC_DESC))
86f7e90ce840aa arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-29  8099  			return X86EMUL_CONTINUE;
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8100  
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8101  		if (info->intercept == x86_intercept_lldt ||
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8102  		    info->intercept == x86_intercept_ltr ||
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8103  		    info->intercept == x86_intercept_sldt ||
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8104  		    info->intercept == x86_intercept_str)
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8105  			vm_exit_reason = EXIT_REASON_LDTR_TR;
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8106  		else
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8107  			vm_exit_reason = EXIT_REASON_GDTR_IDTR;
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8108  		/*
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8109  		 * FIXME: Decode the ModR/M to generate the correct exit
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8110  		 *        qualification for memory operands.
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8111  		 */
86f7e90ce840aa arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-29  8112  		break;
86f7e90ce840aa arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-29  8113  
9bbc38752725d4 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8114  	case x86_intercept_hlt:
9bbc38752725d4 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8115  		if (!nested_cpu_has(vmcs12, CPU_BASED_HLT_EXITING))
9bbc38752725d4 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8116  			return X86EMUL_CONTINUE;
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8117  
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8118  		vm_exit_reason = EXIT_REASON_HLT;
9bbc38752725d4 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8119  		break;
9bbc38752725d4 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8120  
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8121  	case x86_intercept_pause:
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8122  		/*
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8123  		 * PAUSE is a single-byte NOP with a REPE prefix, i.e. collides
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8124  		 * with vanilla NOPs in the emulator.  Apply the interception
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8125  		 * check only to actual PAUSE instructions.  Don't check
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8126  		 * PAUSE-loop-exiting, software can't expect a given PAUSE to
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8127  		 * exit, i.e. KVM is within its rights to allow L2 to execute
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8128  		 * the PAUSE.
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8129  		 */
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8130  		if ((info->rep_prefix != REPE_PREFIX) ||
7a223b397dc217 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8131  		    !nested_cpu_has(vmcs12, CPU_BASED_PAUSE_EXITING))
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8132  			return X86EMUL_CONTINUE;
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8133  
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8134  		vm_exit_reason = EXIT_REASON_PAUSE_INSTRUCTION;
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8135  		break;
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8136  
fb6d4d340e0532 arch/x86/kvm/vmx.c     Paolo Bonzini       2016-07-12  8137  	/* TODO: check more intercepts... */
35a571346a94fb arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-04  8138  	default:
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8139  		return X86EMUL_UNHANDLEABLE;
35a571346a94fb arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-04  8140  	}
35a571346a94fb arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-04  8141  
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8142  	nested_vmx_vmexit(vcpu, vm_exit_reason, 0, exit_qualification);
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8143  	return X86EMUL_INTERCEPTED;
8a76d7f25f8f24 arch/x86/kvm/vmx.c     Joerg Roedel        2011-04-04  8144  }
8a76d7f25f8f24 arch/x86/kvm/vmx.c     Joerg Roedel        2011-04-04  8145  

:::::: The code at line 8084 was first introduced by commit
:::::: b057118e8af2668869986a817ef0196510be9818 KVM: nVMX: Consolidate missing X86EMUL_INTERCEPTED logic in L2 emulation

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
