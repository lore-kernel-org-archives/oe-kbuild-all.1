Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE38627587D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 06:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765866631; cv=none; b=HNmD8Z3oAxsZFE9XYt30gv7rLhzKSLJBJy3Kwoog8O0d5/6KjXXdnUYKfcdKE+DvjF33L5npPzYVlqwEb65tUqwTjeXtZa1v+H8rceF1iJq25Hsu8NulGsXnEfvS6BzwrMp5GGY+7IRpSZDVwy9sL+e8NIM4M9MZSc5OZXkGZ7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765866631; c=relaxed/simple;
	bh=U9+lHJk25XnxUPHtohKPRAxT4d19Eq72uvN8xw72uN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dn1OtrBAvikIOz5IIVbNApVIi+GgGLSuG3VCTfyzZnxVErYf3otm57GkxjOhQyfTCLORcjm13uCj4hEs4sELPEZJ3XV9sA39XeLp46Zq1RYHWYvN+8vpQgpHKkOvsgifQnlhto1dTxWbNFhvdPpYFXgBzNmIAX/WVvIzxVqkUJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HtLHAgDl; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HtLHAgDl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765866626; x=1797402626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U9+lHJk25XnxUPHtohKPRAxT4d19Eq72uvN8xw72uN0=;
  b=HtLHAgDl2VOCK86xSlMChzjjDrR4ke4lZvHeT+NGSqSUAM1PvXGkYPDr
   ZGtqANwuld5Atb1Wqj9JxazJrLrfqo7fR1W2ax8pmUA8p1ZYcQ9HTXGNN
   geu3NE5G2WsIv2vp6NgWWLX8Jmsqarg6rei7Kn9SnFvR2oFaKligOraM+
   QJuqUnxSRWeaGgTQCv2B/XhzJ43dU4/CHEOzwgnE2r0kCbuhNWo9g+wo6
   0qx2Vm9kSfGynP9HIFYQTVpHkiwYiucNl/7+xJ2Tzf2sBElIisKdT6NbD
   MbJxJgjB6qnOdr1yqUwEb6U5h0ACAdHx1r69LD21TUGlIcKdLdwbzX+Hb
   w==;
X-CSE-ConnectionGUID: A3HTqKtORR6tDWXbWqs5ug==
X-CSE-MsgGUID: f15pVV3zQ+u/1kRXu8EtXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78896068"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="78896068"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 22:30:23 -0800
X-CSE-ConnectionGUID: 5+a8hLNMS4u06T+nZre/ZA==
X-CSE-MsgGUID: 7x/tufstRsSSLZYfONlMiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="202435517"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 15 Dec 2025 22:30:21 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVOZe-000000001FJ-496U;
	Tue, 16 Dec 2025 06:30:18 +0000
Date: Tue, 16 Dec 2025 14:29:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kalesh Singh <kaleshsingh@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Subject: arch/arm64/kvm/arm.c:64:1: sparse: sparse: symbol
 '__pcpu_scope_kvm_arm_hyp_stack_base' was not declared. Should it be static?
Message-ID: <202512161450.H8u3Nf3Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 38f9e4b905a00047a96fbdc6cefe9ceb4dae34c3 arm64: kvm: Introduce nvhe stack size constants
date:   11 months ago
config: arm64-randconfig-r112-20251216 (https://download.01.org/0day-ci/archive/20251216/202512161450.H8u3Nf3Z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161450.H8u3Nf3Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161450.H8u3Nf3Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/arm.c:64:1: sparse: sparse: symbol '__pcpu_scope_kvm_arm_hyp_stack_base' was not declared. Should it be static?
   arch/arm64/kvm/arm.c:241:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/arm.c:241:16: sparse:    struct kvm_mpidr_data [noderef] __rcu *
   arch/arm64/kvm/arm.c:241:16: sparse:    struct kvm_mpidr_data *
   arch/arm64/kvm/arm.c:244:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/arm.c:244:17: sparse:    struct kvm_mpidr_data [noderef] __rcu *
   arch/arm64/kvm/arm.c:244:17: sparse:    struct kvm_mpidr_data *
   arch/arm64/kvm/arm.c:743:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/arm.c:743:13: sparse:    struct kvm_mpidr_data [noderef] __rcu *
   arch/arm64/kvm/arm.c:743:13: sparse:    struct kvm_mpidr_data *
   arch/arm64/kvm/arm.c:781:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/arm.c:781:9: sparse:    struct kvm_mpidr_data [noderef] __rcu *
   arch/arm64/kvm/arm.c:781:9: sparse:    struct kvm_mpidr_data *
   arch/arm64/kvm/arm.c:2681:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/arm.c:2681:16: sparse:    struct kvm_mpidr_data [noderef] __rcu *
   arch/arm64/kvm/arm.c:2681:16: sparse:    struct kvm_mpidr_data *

vim +/__pcpu_scope_kvm_arm_hyp_stack_base +64 arch/arm64/kvm/arm.c

    63	
  > 64	DEFINE_PER_CPU(unsigned long, kvm_arm_hyp_stack_base);
    65	DECLARE_KVM_NVHE_PER_CPU(struct kvm_nvhe_init_params, kvm_init_params);
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
