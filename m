Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C860A58115
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Dec 2023 22:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bWg1cBpF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702073262; x=1733609262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l2GK5+nk+OwU4BU3NlpJzQj7ELtkXW6KvbmCOp0koaA=;
  b=bWg1cBpFZYPVtGyAlGOADAA+3jc0iH/L7be59P3u72BD7dCL4JDLOgcu
   Ct09FngY3Nx9ANDgXHU1We6/yuiZPI7DTzxELyYzj1VxgigmLVP2I0keQ
   FeO5NCmzNaGqFQBW3t5XMtWKq3Nb6ZSjEV2Fcr/RTa/sREQfpokpoeAis
   gcfPYmNmxa/SfyjguGLuZG8mhAHqXdRiwbP65ETo2Y4Q//bidMP9KfIkX
   0Z1nJcnCGI875R8uu6gLdkDW+h2p5gl7w0EXLk1wwqQdiT38lSBFnA/Bp
   la7DcgxZAqqhdJ47JXMc5iDqf8fQv9zeiUTcW+hmYemcXryz94mVTKxLV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="391643353"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="391643353"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 14:07:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="748484937"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="748484937"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 08 Dec 2023 14:07:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBj0S-000ESr-2y;
	Fri, 08 Dec 2023 22:07:36 +0000
Date: Sat, 9 Dec 2023 06:07:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kalesh Singh <kaleshsingh@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>, Fuad Tabba <tabba@google.com>
Subject: arch/arm64/kvm/hyp/nvhe/stacktrace.c:15:1: sparse: sparse: symbol
 '__pcpu_scope_kvm_stacktrace_info' was not declared. Should it be static?
Message-ID: <202312090640.WWaaFv2N-lkp@intel.com>
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
commit: 879e5ac7b2e4db05799a905b5a07fc9e5dedf651 KVM: arm64: Prepare non-protected nVHE hypervisor stacktrace
date:   1 year, 4 months ago
config: arm64-randconfig-r112-20231117 (https://download.01.org/0day-ci/archive/20231209/202312090640.WWaaFv2N-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231209/202312090640.WWaaFv2N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312090640.WWaaFv2N-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kvm/hyp/nvhe/stacktrace.c:12:1: sparse: sparse: symbol '__pcpu_scope_overflow_stack' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/stacktrace.c:15:1: sparse: sparse: symbol '__pcpu_scope_kvm_stacktrace_info' was not declared. Should it be static?

vim +/__pcpu_scope_kvm_stacktrace_info +15 arch/arm64/kvm/hyp/nvhe/stacktrace.c

    11	
    12	DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)], overflow_stack)
    13		__aligned(16);
    14	
  > 15	DEFINE_PER_CPU(struct kvm_nvhe_stacktrace_info, kvm_stacktrace_info);
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
