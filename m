Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B5621A449
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 04:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745899390; cv=none; b=qjHn4FzW7Rv05s1iBgMNaY44MVR2NxO5id39gAJ2VHeyFSBYnE9feT37ZsLt6DmulDO7panwzHkGx9mkgx4DKb58z+r+hDjqp4wktFT5vOD2ETKbwHEzbLBUqWb6ciUSJyUO2oO8T+gTMa7WZDIs1klvmpwUzerRk519s0WV+8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745899390; c=relaxed/simple;
	bh=OD7S5i9kfka/Kkir/GuAYAAHX7f7CfTC+/4dMcUFSR0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tmCMRTtRIYtXGw9QxGkKOflgmR15mSNUXjZdUO/BJtLbT4oJ9o3ZkTpntF5x+rLRA+idR6xblk7mMPXVrZyRmTu7zUq4QtDw0/rNhOurh5tLjmeDpyWhWGgS/SutyLUCc3rtE0ulir1lN63cK/7Kgtr04f+0QI98ikWJz57EFk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JsCXq1Fc; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JsCXq1Fc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745899387; x=1777435387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OD7S5i9kfka/Kkir/GuAYAAHX7f7CfTC+/4dMcUFSR0=;
  b=JsCXq1Fc0vNopiWMayOZXOUQPVyMU9Ech4sKfykpb0e8e4pF8fPQ3X4D
   zqeHo7coQ4XNooeW3kUgeKp7vMQmthKsos0WLv9qh0sUpQUzoqUqmnS31
   w5Rv11ar07vcKutFT1QF5yp8Tqp43GguPUqDSiUqYZErfGDFMzTfKFwsv
   5IVF8n1ETlsF7mrsXk4ciWLEN06QPmFqnF49DHGm8iYOwS4dlKHXjV7Wy
   GwSPYhIaAME4SduT4sQ2G8nQ5gJ3MzQ3AnHYAcDOo6rYCtRaP2bdaqZPX
   RuljCeDIy56qBJZOk5IfxRjKGUJaWAwHMJotUOWPsbmFk+FNfZFjxGBYM
   w==;
X-CSE-ConnectionGUID: 3dKSEVCrT7qUUiHdb/bnXg==
X-CSE-MsgGUID: n6T2wTlSQJG6CCMwtwHdrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58879061"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="58879061"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 21:03:06 -0700
X-CSE-ConnectionGUID: haV+AHFATI6rOl0WaV2ofg==
X-CSE-MsgGUID: RRA+3anwTKq+4dknbLiV5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="138799695"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Apr 2025 21:03:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9cBT-0000SJ-0C;
	Tue, 29 Apr 2025 04:03:03 +0000
Date: Tue, 29 Apr 2025 12:02:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1597/1597]
 include/linux/ktask.h:123:35: warning: cast between incompatible function
 types from 'int (*)(long unsigned int,  long unsigned int,  struct hf_args
 *)' to 'int (*)(void *, void *, void *)'
Message-ID: <202504291102.S4UEqzyV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   230c2b30f879859ac3e9d3cc46407a9dbb103160
commit: 4733c59fabc3d9c145aca2f1c86b4872a7fb671d [1597/1597] hugetlbfs: parallelize hugetlbfs_fallocate with ktask
config: arm64-randconfig-002-20250429 (https://download.01.org/0day-ci/archive/20250429/202504291102.S4UEqzyV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504291102.S4UEqzyV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504291102.S4UEqzyV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/hugetlbfs/inode.c:39:
   fs/hugetlbfs/inode.c: In function 'hugetlbfs_fallocate':
>> include/linux/ktask.h:123:35: warning: cast between incompatible function types from 'int (*)(long unsigned int,  long unsigned int,  struct hf_args *)' to 'int (*)(void *, void *, void *)' [-Wcast-function-type]
     123 |                 .kc_thread_func = (ktask_thread_func)(thread_func),          \
         |                                   ^
   include/linux/ktask.h:139:17: note: in expansion of macro 'KTASK_CTL_INITIALIZER'
     139 |                 KTASK_CTL_INITIALIZER(thread_func, func_arg, min_chunk_size) \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   fs/hugetlbfs/inode.c:635:17: note: in expansion of macro 'DEFINE_KTASK_CTL'
     635 |                 DEFINE_KTASK_CTL(ctl, hugetlbfs_fallocate_chunk,
         |                 ^~~~~~~~~~~~~~~~


vim +123 include/linux/ktask.h

c48676ef6b6f9cb Daniel Jordan 2019-08-14  120  
c48676ef6b6f9cb Daniel Jordan 2019-08-14  121  #define KTASK_CTL_INITIALIZER(thread_func, func_arg, min_chunk_size)	     \
c48676ef6b6f9cb Daniel Jordan 2019-08-14  122  	{								     \
c48676ef6b6f9cb Daniel Jordan 2019-08-14 @123  		.kc_thread_func = (ktask_thread_func)(thread_func),	     \
69cc5b58cc50d2f Daniel Jordan 2019-08-14  124  		.kc_undo_func = NULL,					     \
c48676ef6b6f9cb Daniel Jordan 2019-08-14  125  		.kc_func_arg = (func_arg),				     \
c48676ef6b6f9cb Daniel Jordan 2019-08-14  126  		.kc_min_chunk_size = (min_chunk_size),			     \
c48676ef6b6f9cb Daniel Jordan 2019-08-14  127  		.kc_iter_func = (ktask_iter_range),			     \
c48676ef6b6f9cb Daniel Jordan 2019-08-14  128  		.kc_max_threads = 0,					     \
c48676ef6b6f9cb Daniel Jordan 2019-08-14  129  	}
c48676ef6b6f9cb Daniel Jordan 2019-08-14  130  

:::::: The code at line 123 was first introduced by commit
:::::: c48676ef6b6f9cb8497d6264ae9ff71b87630337 ktask: multithread CPU-intensive kernel work

:::::: TO: Daniel Jordan <daniel.m.jordan@oracle.com>
:::::: CC: Xie XiuQi <xiexiuqi@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
