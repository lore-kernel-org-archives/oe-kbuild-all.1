Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080353BAD8F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 18:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775844735; cv=none; b=qxS73wGSswkifSkvCKT7mEvtxlYwXgVqJfRVmo5up3B6//D7R+vgC8Jq72wnAFcTlodSJRE543nKJx2wmLmWWnFezJYWxlbtrSD2s7kThpAntTEfjgfYoNWhP6tBCgginYiTmejKkTqDdtX1VWdn3GSPyCANXu6ylEjDaXlzLBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775844735; c=relaxed/simple;
	bh=N+5FmlkMmKRD+ePmlcl/V5ulpeZAGfm8wdgUIeZGr0k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AgJ9rgt0hcKI/TzNcygCDQWPzenircG6xcekiZQwFvXw83BUWbSWIew/jlcor9nBAfEwT0ROo6Py3BvqJuSA9726zcKOvuj89a5onzKYKszo3AsEtFKbH1TgceYYMlfv9eqNXwN+1/3/Veo5GXA72vPhGhgdwrRfseSldy/UYwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvtCzzmg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvtCzzmg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775844734; x=1807380734;
  h=date:from:to:cc:subject:message-id;
  bh=N+5FmlkMmKRD+ePmlcl/V5ulpeZAGfm8wdgUIeZGr0k=;
  b=mvtCzzmgQf7o3sSEamAPbGS7TRZCiLusL5uAuyM+zfXW1K33W+ZNddmW
   W8Zwuzf/HBgAxzc45Wcqg8HLhkE+GIkPc8TDvqHd7r+TRLzEFMw73+q9E
   xYvaIBiBbub7RPBVQPy5mpRMOXnuXbn3LquXKCgRkwr4OPpnQGHmwgqsT
   71rdiX4N5Fb7ncsDHmj3KfySuy1H8F9hHeYgpwMbfF1Gn5dLBv7Fp/yM6
   G3giAbEqQa/MfkEsHzmdNeYZCxON0mtyPNSk2HjNi4hwyl+7yputQ/L6U
   ilwtImIT7mlzzSm3VBmA6RKC8ny2EJjS3bdB5/jSTDa5ngv+1im7DIdG6
   A==;
X-CSE-ConnectionGUID: e2TD9uHIRPOhdcab8LfVtQ==
X-CSE-MsgGUID: GGc9H5V2QnmGl7l0w9guCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87159093"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="87159093"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 11:12:14 -0700
X-CSE-ConnectionGUID: Qdefcf+FQ6O51FfzNe18vQ==
X-CSE-MsgGUID: Tt1eOStGTg6Fky6kMe9DTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="228296182"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Apr 2026 11:12:13 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBGKw-000000004C9-0nOR;
	Fri, 10 Apr 2026 18:12:10 +0000
Date: Sat, 11 Apr 2026 02:12:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-lajolla-staging 1/1]
 ld.lld: error: undefined symbol: iommu_free_pages
Message-ID: <202604110201.jpOlJHdd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Isaac,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-lajolla-staging
head:   98d7c614567503c5f77342040d101685ef4335ab
commit: 6ace5be5937cc205a98e4738d000581686a7c3d9 [1/1] ANDROID: KVM: arm64: iommu: Implement IOMMU subsystem accounting
config: arm64-randconfig-003-20260410 (https://download.01.org/0day-ci/archive/20260411/202604110201.jpOlJHdd-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project ae825cb8cea7f3ac8e5e4096f22713845cf5e501)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110201.jpOlJHdd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110201.jpOlJHdd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: iommu_free_pages
   >>> referenced by xarray.c
   >>>               vmlinux.o:(__pkvm_free_iommu_hyp_memcache)
   >>> referenced by xarray.c
   >>>               vmlinux.o:(__free_hyp_memcache)
--
>> ld.lld: error: undefined symbol: iommu_alloc_pages_node_sz
   >>> referenced by xarray.c
   >>>               vmlinux.o:(__pkvm_topup_hyp_iommu)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
