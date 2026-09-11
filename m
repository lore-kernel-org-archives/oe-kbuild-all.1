Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1603947532C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 12:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789129922; cv=none; b=WWBDxr0nX4GiBVp6h74Xo9lauMMnAIU845dYungNYpPsdnLquTFRQv6pf3NavrhHWFLz5YLdcRxucZPkvpalJzMbJVQElYOt4wZWEmvSYMHESQ7O++fmUop33rXgGEk7vqMfLJNzLJSTh9cq8RWbLv7VPEcnXgasqOGyYnrbbdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789129922; c=relaxed/simple;
	bh=TTvjgwiO2XovIQfkLOhMXVwSkhOi7NUC3mZifRal8YQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M+jS8s6RA+oCm9Ze51F64oPHsiFPS6bRDYcZSJxfdfYSVwlUMiITr5bkWIiTa2SPWHWTW3i5z6xgxeshh3tlfyxV+moSAN000WbUkF0tpETxGPEzNpcYXUWOVQZotLdBEB9KQ7cGV37/evHB9FE1VhozfZZ/lC9pZxd4EHiPtL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GP/Y1aSa; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GP/Y1aSa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789129915; x=1820665915;
  h=date:from:to:cc:subject:message-id;
  bh=TTvjgwiO2XovIQfkLOhMXVwSkhOi7NUC3mZifRal8YQ=;
  b=GP/Y1aSa+5VHCUc0owkNTeLqOS+YcxOCfxWpOgFr6nb6HHAXY/GI2py/
   daoAMYdDcJN3xmmhG1Fy2X8jGsRBXjWGx99j25rSR0G7iqGEZX0/f/a1W
   NzkRw9048QU7mUJHbeSQi0FQKlnl7K0Nhnv5uozQY1hO11sN57CNhaO79
   CjZK9kI4dVHLrZLudkdq3gIYRcKgR9l3nDUFWFwCgMrkGS9yP3J1vfEjz
   KMNL4PJiZogxgc9/ExctUZknUpCy9vUPAH7UNaP7Zy9qBxTOMgM68b7JL
   KUSnYffttWO73fYvswxt02olqTVZIV3w/r1D+Y2I2f4QZlz+JnNryh602
   w==;
X-CSE-ConnectionGUID: YOIiOlZIQ/O+HuA5S46wJQ==
X-CSE-MsgGUID: UDKhSdHrQUqjmXEecgN0eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89432254"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89432254"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 05:31:52 -0700
X-CSE-ConnectionGUID: 99uFyEoASEK1j/gQ7gP7eA==
X-CSE-MsgGUID: 8JmpSsw2RyeFXpjqgJa1/w==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 11 Sep 2026 05:31:51 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x50PN-000000001Wr-1si3;
	Fri, 11 Sep 2026 12:31:19 +0000
Date: Fri, 11 Sep 2026 20:29:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 1/1]
 arch/arm64/kvm/hyp/nvhe/power/scmi.c:215:36: sparse: sparse: incorrect type
 in assignment (different address spaces)
Message-ID: <202609112056.90z1OFir-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   7542d32487b53ed1a59d02f013a6e6b66804c874
commit: 220be807706d350ba6a1f17f0a3586269d844eda [1/1] BACKPORT: FROMLIST: KVM: arm64: pkvm: Support SCMI power domain
config: arm64-randconfig-r123-20260910 (https://download.01.org/0day-ci/archive/20260911/202609112056.90z1OFir-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d3db069999553568848400c84cbf815c03f5470f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609112056.90z1OFir-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609112056.90z1OFir-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/power/scmi.c:215:36: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *static [assigned] [toplevel] shmem @@     got void * @@
   arch/arm64/kvm/hyp/nvhe/power/scmi.c:215:36: sparse:     expected void [noderef] __iomem *static [assigned] [toplevel] shmem
   arch/arm64/kvm/hyp/nvhe/power/scmi.c:215:36: sparse:     got void *

vim +215 arch/arm64/kvm/hyp/nvhe/power/scmi.c

   191	
   192	int pkvm_init_scmi_pd(struct kvm_power_domain *pd,
   193			      const struct kvm_power_domain_ops *ops)
   194	{
   195		int ret;
   196	
   197		if (!IS_ALIGNED(pd->arm_scmi.shmem_base, PAGE_SIZE) ||
   198		    pd->arm_scmi.shmem_size < PAGE_SIZE) {
   199			return -EINVAL;
   200		}
   201	
   202		if (!scmi_channel.shmem) {
   203			unsigned long shmem;
   204	
   205			/* FIXME: Do we need to mark those pages shared in the host s2? */
   206			ret = __pkvm_create_private_mapping(pd->arm_scmi.shmem_base,
   207							    pd->arm_scmi.shmem_size,
   208							    PAGE_HYP_DEVICE,
   209							    &shmem);
   210			if (ret)
   211				return ret;
   212	
   213			scmi_channel.smc_id = pd->arm_scmi.smc_id;
   214			scmi_channel.shmem_pfn = hyp_phys_to_pfn(pd->arm_scmi.shmem_base);
 > 215			scmi_channel.shmem = (void *)shmem;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
