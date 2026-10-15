Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FB0376BC2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Oct 2026 17:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083627; cv=none; b=mrjOd0oGx0XdP7fQBEVJbzQeAMFtIAfKtrzuPlwwUKiy9/Oiv+PeoOrPR87zJhg3YsGo61331GKSSRuDtaDGHAgvvkvab0k8qc/sard0f9eJMLKl69/HJR2i9fy5ZE3VEdC/EpasVdWZHwRq/nhfexwcfQ+2VZ2VzVjXhq8RYXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083627; c=relaxed/simple;
	bh=1BPfFhNA8jyQe/23860PGKWA/smluAlieVCjf4bQBdE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uQs6cSRCjIP/Igi5bpW9jG3ewtxcDf+apQLYxR86bW9MPtAmbYaKte87hZN5aTjBM6wlSiKFc1izeeV4tZjupxjf5Bb9lvcfhyyJGJJebL2LrDae28YZQRwybrI/LL/LuQDgWuYgzJDNBI0uNwSA5wTDxnKxu/l1ZJRTMr53FTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gtgjkyM/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gtgjkyM/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792083608; x=1823619608;
  h=date:from:to:cc:subject:message-id;
  bh=1BPfFhNA8jyQe/23860PGKWA/smluAlieVCjf4bQBdE=;
  b=gtgjkyM/dbtnGsxHqAM0raQZT6fm0z3QrJhqZINTl77MgIPF+45/H2eo
   kZJxMrD+Qqnha3RPflDXA5Qf0QWq2+sohW7phy0rG+KxBRVidmS7KU6t0
   WRNZMXeC3PkSvzCGpcpTcUpZE8eah0I5gZlIjgfTm82gsp8Qq326w5cyl
   RUWZqd/bjAGihQeN84SQhoGMl8UYsBY3Lijq9evBScYmQbIbAZnwb3agU
   jJwKCupb5/JDoR51paHFaRMTsicuAHnzMDIxuIKl/9MHmMplfCWsy5xlG
   Cmr2N2M7Il5xI37vI6WBJ7kTwLH8adpcWWv+QsJcFeJzspLec1RiqAhid
   g==;
X-CSE-ConnectionGUID: yBWBetm+RLmzTA4rLIZx9Q==
X-CSE-MsgGUID: q5har+VrQtWN+LrETnh9Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="872627"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="872627"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 10:00:08 -0700
X-CSE-ConnectionGUID: J9YajE9nRDin3jh0Mf7MWA==
X-CSE-MsgGUID: DZgYPa33SpG+FiLNqW2elA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="2101240"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Oct 2026 10:00:06 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHOoF-00000000Gpa-3bbM;
	Thu, 15 Oct 2026 17:00:03 +0000
Date: Fri, 16 Oct 2026 00:59:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/kill_should_kick_with_force 3/7]
 arch/powerpc/kvm/powerpc.c:1906:9: error: implicit declaration of function
 'kvmppc_vcpu_kick'; did you mean 'kvm_vcpu_kick'?
Message-ID: <202610160007.HMCCMTIp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/kill_should_kick_with_force
head:   01d71338eb030f22b384bb16b117a6429b0ed13a
commit: 9be4d75f5b9b7cb22aa41ed3b0d1e8b8fa5335e8 [3/7] KVM: PPC: Explicitly force IPIs when directly kicking vCPUs
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20261016/202610160007.HMCCMTIp-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610160007.HMCCMTIp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610160007.HMCCMTIp-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kvm/powerpc.c: In function 'kvm_vcpu_ioctl_interrupt':
>> arch/powerpc/kvm/powerpc.c:1906:9: error: implicit declaration of function 'kvmppc_vcpu_kick'; did you mean 'kvm_vcpu_kick'? [-Wimplicit-function-declaration]
    1906 |         kvmppc_vcpu_kick(vcpu);
         |         ^~~~~~~~~~~~~~~~
         |         kvm_vcpu_kick
--
   arch/powerpc/kvm/book3s.c: In function 'kvmppc_decrementer_func':
>> arch/powerpc/kvm/book3s.c:830:9: error: implicit declaration of function 'kvmppc_vcpu_kick'; did you mean 'kvm_vcpu_kick'? [-Wimplicit-function-declaration]
     830 |         kvmppc_vcpu_kick(vcpu);
         |         ^~~~~~~~~~~~~~~~
         |         kvm_vcpu_kick
--
>> arch/powerpc/kvm/book3s_pr.c:2069:27: error: 'kvmppc_vcpu_kick' undeclared here (not in a function); did you mean 'kvm_vcpu_kick'?
    2069 |         .fast_vcpu_kick = kvmppc_vcpu_kick,
         |                           ^~~~~~~~~~~~~~~~
         |                           kvm_vcpu_kick


vim +1906 arch/powerpc/kvm/powerpc.c

  1896	
  1897	int kvm_vcpu_ioctl_interrupt(struct kvm_vcpu *vcpu, struct kvm_interrupt *irq)
  1898	{
  1899		if (irq->irq == KVM_INTERRUPT_UNSET) {
  1900			kvmppc_core_dequeue_external(vcpu);
  1901			return 0;
  1902		}
  1903	
  1904		kvmppc_core_queue_external(vcpu, irq);
  1905	
> 1906		kvmppc_vcpu_kick(vcpu);
  1907	
  1908		return 0;
  1909	}
  1910	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
