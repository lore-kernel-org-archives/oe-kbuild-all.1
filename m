Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FB73074B1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jun 2025 07:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750834869; cv=none; b=FU9WTPxwMTzERFoaZEkRWZ/Tf9SqlCMMI5HtXGeeQFu5prIquYWDBLWJZD1hJbpvozO9pDXV5QqlWfkSqIJO2GvmzCGe8L7UoH1/IGMq3ywJO7lYmS1O+Vk4XNK3jTSNUuL5C8mJhiiV/fNxuBeWsAziggUwZ/WKeA6nnwlMvo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750834869; c=relaxed/simple;
	bh=u6FOVuq9l/gp8hBtHcRZNii2EgdnrWKE2Smg8OYsgk8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jkOCyqm4TpZftW7couQzLQwqZoCWSSsnjU6mI6nCk0zJggIh6XOG7oIGwXg6elIkWlF3lpR+2DtKsUXInOGE6YmB0W8R4lfEr4JVMc8PjIUaHmNPxeLrWBXN7nIxtHA8bmHlEzEg3HHU9vr/CijivYJVgzLaIhwWtBdc8Pc8nes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nOVLz8hV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nOVLz8hV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750834866; x=1782370866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u6FOVuq9l/gp8hBtHcRZNii2EgdnrWKE2Smg8OYsgk8=;
  b=nOVLz8hVCsRLLAza9xp23IF9DzpMU7PfG0Hbxt6Y9B6La7OfReHy1+RM
   VrQhTLLHyxpo5L7Z6YfAAZN+x15lYXco/3uAcO5xCwu4IVbJfWbvYkVJ6
   yPvAnT2rlokFkfyphANkOClg1aA/hfhfb4CkfsY2S/ea7YP7Aziod5Ims
   kHmfzLJe8h14MREKUbuxNmD++KEZ9Jkkq4aP91l7vXE/t69E6bAQ/NAfQ
   Uok0VQNvALAPHdn0Gt2uFReYgJ2WHDrEozIjKxh2mDcpn6nWe5HmKes6r
   Z643R4rZphbeGHK4ePyRoUaV8sPFzK+6l4pkojSKKYUPSYnyh/s6IuMvK
   g==;
X-CSE-ConnectionGUID: uWJ1/3MTQvWo4EyTLdvFAw==
X-CSE-MsgGUID: JprFLmWYQeKElbr4WsI4kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52962629"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="52962629"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 00:01:05 -0700
X-CSE-ConnectionGUID: eSE1zGFyQcu7w5Vu4YkhPw==
X-CSE-MsgGUID: N+8dVzHqT5K4erUGCp1HTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="152620162"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Jun 2025 00:01:04 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUK7y-000Spj-0E;
	Wed, 25 Jun 2025 07:01:02 +0000
Date: Wed, 25 Jun 2025 15:00:19 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 20/21]
 arch/x86/kvm/vmx/tdx.c:779:33: error: call to undeclared function
 'read_msr'; ISO C99 and later do not support implicit function declarations
Message-ID: <202506251414.ubuFeMUa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   f5a7aa46f2de853090449e1a5bb733628907c08b
commit: 4c8b4516efd0095821b118c1d1beaa3fd32d6dbe [20/21] KVM: VMX: Remove read_msr() defined in <asm/kvm_host.h>
config: x86_64-buildonly-randconfig-006-20250625 (https://download.01.org/0day-ci/archive/20250625/202506251414.ubuFeMUa-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506251414.ubuFeMUa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506251414.ubuFeMUa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/vmx/tdx.c:779:33: error: call to undeclared function 'read_msr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     779 |                 vt->msr_host_kernel_gs_base = read_msr(MSR_KERNEL_GS_BASE);
         |                                               ^
   1 error generated.


vim +/read_msr +779 arch/x86/kvm/vmx/tdx.c

90cfe144c8ed98 Sean Christopherson 2025-02-22  764  
81bf40d54cd56e Isaku Yamahata      2025-01-29  765  /*
81bf40d54cd56e Isaku Yamahata      2025-01-29  766   * Compared to vmx_prepare_switch_to_guest(), there is not much to do
81bf40d54cd56e Isaku Yamahata      2025-01-29  767   * as SEAMCALL/SEAMRET calls take care of most of save and restore.
81bf40d54cd56e Isaku Yamahata      2025-01-29  768   */
81bf40d54cd56e Isaku Yamahata      2025-01-29  769  void tdx_prepare_switch_to_guest(struct kvm_vcpu *vcpu)
81bf40d54cd56e Isaku Yamahata      2025-01-29  770  {
81bf40d54cd56e Isaku Yamahata      2025-01-29  771  	struct vcpu_vt *vt = to_vt(vcpu);
81bf40d54cd56e Isaku Yamahata      2025-01-29  772  
81bf40d54cd56e Isaku Yamahata      2025-01-29  773  	if (vt->guest_state_loaded)
81bf40d54cd56e Isaku Yamahata      2025-01-29  774  		return;
81bf40d54cd56e Isaku Yamahata      2025-01-29  775  
81bf40d54cd56e Isaku Yamahata      2025-01-29  776  	if (likely(is_64bit_mm(current->mm)))
81bf40d54cd56e Isaku Yamahata      2025-01-29  777  		vt->msr_host_kernel_gs_base = current->thread.gsbase;
81bf40d54cd56e Isaku Yamahata      2025-01-29  778  	else
81bf40d54cd56e Isaku Yamahata      2025-01-29 @779  		vt->msr_host_kernel_gs_base = read_msr(MSR_KERNEL_GS_BASE);
81bf40d54cd56e Isaku Yamahata      2025-01-29  780  
8af099037527c5 Adrian Hunter       2025-01-29  781  	vt->host_debugctlmsr = get_debugctlmsr();
8af099037527c5 Adrian Hunter       2025-01-29  782  
81bf40d54cd56e Isaku Yamahata      2025-01-29  783  	vt->guest_state_loaded = true;
81bf40d54cd56e Isaku Yamahata      2025-01-29  784  }
81bf40d54cd56e Isaku Yamahata      2025-01-29  785  

:::::: The code at line 779 was first introduced by commit
:::::: 81bf40d54cd56e33b4cd381cc719efaa53832468 KVM: TDX: vcpu_run: save/restore host state(host kernel gs)

:::::: TO: Isaku Yamahata <isaku.yamahata@intel.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
