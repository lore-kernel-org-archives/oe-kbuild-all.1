Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE23224466F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Aug 2025 22:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754866578; cv=none; b=RhNCGUp+uDXau8U3weteGb+0JsBwbw70qQHdy309c9hjyqlIQ0G3Ec5uzPLenshZNmvtoUIKApJEj/V5rtyJXURnfzBqVt2U7ulx8C6lJkcZLjQ+Cu7MTRklHKMj/JPThoBE4pCNuUgplzcqlEjudGTjL3wKn+a4U9e5CKPxaaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754866578; c=relaxed/simple;
	bh=kW3p4RDzi9Fct0N8q0MxggpytL0yXS8chxSjSjeAb2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dDimeE2fDRBhOD4Aj/MF8YsuOgG8VQE8LLsjzEI0nbHifUbINYI75uN3Sod4EzHtjzraBNf/0IePfQkj5ULt2ubfqYEUkIH+4qJv0Sm0moS2GUwuw/ZFKWCqGD0nLY77s3BUHqgdEHBQb+Q5Y/klzTa021CSiCDp1RXzLDdZQcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CcuLbZ//; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CcuLbZ//"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754866576; x=1786402576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kW3p4RDzi9Fct0N8q0MxggpytL0yXS8chxSjSjeAb2w=;
  b=CcuLbZ//fsyfsKdaBKxu3hF530Cxou8RFWPPJV1wlD1/LCJGALl1Tw+c
   QIqyiZjGgcg8ViUHKQryHyT2Q9mKjuAIE5oya8uECEXCJlrItovajhZ/B
   2HRxYQLSkZzSvFNH42zZvXaajIsVvGBbIBfT5Brg3cPdeMDaSxpdt/AOp
   GCewWaYIUA5v/nVXuQhsQiPzn2hPCC2AhQenCfpkLH2FHlh8xLTvrONmu
   LG6zRLIZAwLtVnglteg6oZPAmiL3QDssxUx8AQoSHApyIkss1s/MWiE4o
   Scbcw05EV94ARuHRDAz00gUMstnm5Vi54U12hXBhK8ptoW/zfhHQNG2RX
   A==;
X-CSE-ConnectionGUID: whKndylMRgy4otlPkx01vg==
X-CSE-MsgGUID: 45kBHjBkRu+odaw5RL9irQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57026243"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57026243"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2025 15:56:15 -0700
X-CSE-ConnectionGUID: 0J5tl/PiQECJul65mW/gtQ==
X-CSE-MsgGUID: T318WttoTzSwIvTPb3upFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165658523"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 10 Aug 2025 15:56:14 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulExY-0002yV-0D;
	Sun, 10 Aug 2025 22:56:12 +0000
Date: Mon, 11 Aug 2025 00:56:02 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/xfer_to_guest_mode 1/1]
 arch/loongarch/kvm/vcpu.c:254:15: error: too many arguments to function
 'xfer_to_guest_mode_handle_work'
Message-ID: <202508110047.GJ9AZG1I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/xfer_to_guest_mode
head:   7b4624b4ef6957706b9925831c9d5968c1cd9173
commit: 7b4624b4ef6957706b9925831c9d5968c1cd9173 [1/1] entry/kvm: KVM: Move KVM details related to signal/-EINTR into KVM proper
config: loongarch-randconfig-2004-20250810 (https://download.01.org/0day-ci/archive/20250811/202508110047.GJ9AZG1I-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508110047.GJ9AZG1I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508110047.GJ9AZG1I-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/irqflags.h:19,
                    from include/linux/spinlock.h:59,
                    from include/linux/sched.h:2205,
                    from include/linux/resume_user_mode.h:6,
                    from include/linux/entry-kvm.h:6,
                    from include/linux/kvm_host.h:5,
                    from arch/loongarch/kvm/vcpu.c:6:
   arch/loongarch/include/asm/percpu.h:20:4: error: #error compiler support for the model attribute is necessary when a recent assembler is used
      20 | #  error compiler support for the model attribute is necessary when a recent assembler is used
         |    ^~~~~
   arch/loongarch/kvm/vcpu.c: In function 'kvm_enter_guest_check':
>> arch/loongarch/kvm/vcpu.c:254:15: error: too many arguments to function 'xfer_to_guest_mode_handle_work'
     254 |         ret = xfer_to_guest_mode_handle_work(vcpu);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-kvm.h:50:5: note: declared here
      50 | int xfer_to_guest_mode_handle_work(void);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/xfer_to_guest_mode_handle_work +254 arch/loongarch/kvm/vcpu.c

b5d4e2325db29e Bibo Mao     2024-07-09  237  
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  238  /*
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  239   * Check and handle pending signal and vCPU requests etc
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  240   * Run with irq enabled and preempt enabled
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  241   *
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  242   * Return: RESUME_GUEST if we should enter the guest
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  243   *         RESUME_HOST  if we should exit to userspace
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  244   *         < 0 if we should exit to userspace, where the return value
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  245   *         indicates an error
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  246   */
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  247  static int kvm_enter_guest_check(struct kvm_vcpu *vcpu)
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  248  {
589e6cc7597655 Huacai Chen  2024-12-02  249  	int idx, ret;
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  250  
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  251  	/*
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  252  	 * Check conditions before entering the guest
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  253  	 */
2fc3bd86db4b6f Tianrui Zhao 2023-10-02 @254  	ret = xfer_to_guest_mode_handle_work(vcpu);
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  255  	if (ret < 0)
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  256  		return ret;
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  257  
589e6cc7597655 Huacai Chen  2024-12-02  258  	idx = srcu_read_lock(&vcpu->kvm->srcu);
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  259  	ret = kvm_check_requests(vcpu);
589e6cc7597655 Huacai Chen  2024-12-02  260  	srcu_read_unlock(&vcpu->kvm->srcu, idx);
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  261  
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  262  	return ret;
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  263  }
2fc3bd86db4b6f Tianrui Zhao 2023-10-02  264  

:::::: The code at line 254 was first introduced by commit
:::::: 2fc3bd86db4b6f6992d4b459879a17b2ae6b2b3d LoongArch: KVM: Implement basic vcpu interfaces

:::::: TO: Tianrui Zhao <zhaotianrui@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
