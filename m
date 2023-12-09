Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459F97F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 03:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MeavgEWN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702091389; x=1733627389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ZlpVIzc9BGXyLaOXJJn+Yoxlme66PiY2pQcJxRkkD0=;
  b=MeavgEWNQY83NycoDed1uFtuy+juZPQE46CRB0ilORhRP9SbCZJUw77W
   3DVwu14cqDjmBJOKir/R1Csly4ePqmj8fS6Hq/2Ny9qvnJKtiSnRGEw+a
   XSohYV5pEdzexyqaGjvfjXOvoxWFaaxW7l09t1WoN3+W7fCbDqLr51Wsn
   NhJjCkyiQzbCP+b9S+H/b19Ix8T62X4iHA3FX7LPnYvAShZShuF2HMIz2
   wjo6OeKsZ1KYooyMirEbVVOVOE4ucLorot0aXd0q21epT4AKMTwe5Jez6
   jeBC+9eIW38jdHs05MJPIRjdUQBraN9gTfhQb30K7P0o6p8L3Wrrtr3Qh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="460964952"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="460964952"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 19:09:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="772335805"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="772335805"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 08 Dec 2023 19:09:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBniq-000EkV-2I;
	Sat, 09 Dec 2023 03:09:44 +0000
Date: Sat, 9 Dec 2023 11:09:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kalesh Singh <kaleshsingh@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>, Fuad Tabba <tabba@google.com>
Subject: arch/arm64/kvm/arm.c:52:1: sparse: sparse: symbol
 '__pcpu_scope_kvm_arm_hyp_stack_page' was not declared. Should it be static?
Message-ID: <202312091147.jpPmUHGm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f2e8a57ee9036c7d5443382b6c3c09b51a92ec7e
commit: db129d486ebdf4e3168282236f9d9008b42cac7e KVM: arm64: Implement non-protected nVHE hyp stack unwinder
date:   1 year, 4 months ago
config: arm64-randconfig-r112-20231117 (https://download.01.org/0day-ci/archive/20231209/202312091147.jpPmUHGm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231209/202312091147.jpPmUHGm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312091147.jpPmUHGm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/arm.c:52:1: sparse: sparse: symbol '__pcpu_scope_kvm_arm_hyp_stack_page' was not declared. Should it be static?

vim +/__pcpu_scope_kvm_arm_hyp_stack_page +52 arch/arm64/kvm/arm.c

    51	
  > 52	DEFINE_PER_CPU(unsigned long, kvm_arm_hyp_stack_page);
    53	unsigned long kvm_arm_hyp_percpu_base[NR_CPUS];
    54	DECLARE_KVM_NVHE_PER_CPU(struct kvm_nvhe_init_params, kvm_init_params);
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
