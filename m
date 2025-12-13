Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27FD1D0DEE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 03:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765594916; cv=none; b=gv63zTR+QLQmjOzns+o4IU41qqSdgMh6IDy/fqhQDPyIJjNztid6f4GJ7mAb1TK28kf377g1G1BoslJ+gmBjU/avs/X41jbl1yyckFE+TvMurxwEKFUcb/Ribo9Jcq51uOaF5Goh4a5CbMr52x0P5AsTfa63rkA/0HfoZmWskn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765594916; c=relaxed/simple;
	bh=2LnaTF3XkGX5hAyPWM02Wd+PU0mGzau1ioBYACQv9fA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nObWdltpGQBgMMNSGhBWl+84uOJVdJto1qedRiFKOIbiJkxqnqarEEJC+mCOASipFkv0tTn6fcMna0rHB4M4nUGxaIVVRN0Pma5FQilrDjZ6qmQW8wtQ14ZX6ltdenxVV1vuUV9/9yJ2J8E05OrJzMnA/O2YvOK1TVW+b7XLyKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e7neOFUh; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e7neOFUh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765594914; x=1797130914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2LnaTF3XkGX5hAyPWM02Wd+PU0mGzau1ioBYACQv9fA=;
  b=e7neOFUh+GPYmZ8gDzMuKCEjApOEA4itb93G5N2un8FNO00aF4kQX4DE
   HRHuiI3BwSunGFkXImzrQj7rDOZEPkbsq9wk/JzKurrcNLdTkUmuxHIG9
   q1Zt0xao1TBn6FoyINorxFj0ahAJzB+Dwy/lTH9NWe4vEtBiGeLnPs+q/
   d9WVZLBMwqX/HcQoLc/oMb8BiQg8FBCs2oVV3wD0vsWVKr55gAZpm2Sfk
   4xLIQp0vMqTt2LxSmEHGS/AKeIViuu4mbpom6CDnfG9HfWXABYPzwA4YO
   MlUw825vfFgDmjbx/TNQLi2+IMvgagjWq41rFGYjMXYpqxuChffVL3jrZ
   Q==;
X-CSE-ConnectionGUID: 3pb0A9JiQVutZUh8rSr7og==
X-CSE-MsgGUID: T56iNxSwS++lCBwGox3Lgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="85190238"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="85190238"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 19:01:54 -0800
X-CSE-ConnectionGUID: TRKti/VHRAyVm8oPofPqZA==
X-CSE-MsgGUID: yT25fc42QFiMV6uQOewnFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="202165875"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Dec 2025 19:01:53 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUFtH-000000006yD-0GsY;
	Sat, 13 Dec 2025 03:01:51 +0000
Date: Sat, 13 Dec 2025 11:01:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhengchao Shao <shaozhengchao@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1941/1941]
 net/netfilter/nf_nat_proto.c:56:6: warning: no previous prototype for
 'nf_nat_csum_recalc'
Message-ID: <202512131018.8qdFT5tV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   df8d11fbcbb07177c2500e63d7f5a36063977596
commit: 83abe3a3b85762720192809ac8695ff9255cfd23 [1941/1941] netfilter: nat: remove csum_recalc hook
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251213/202512131018.8qdFT5tV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131018.8qdFT5tV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131018.8qdFT5tV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/nf_nat_proto.c:56:6: warning: no previous prototype for 'nf_nat_csum_recalc' [-Wmissing-prototypes]
      56 | void nf_nat_csum_recalc(struct sk_buff *skb,
         |      ^~~~~~~~~~~~~~~~~~


vim +/nf_nat_csum_recalc +56 net/netfilter/nf_nat_proto.c

    55	
  > 56	void nf_nat_csum_recalc(struct sk_buff *skb,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
