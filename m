Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE4E1AD3E1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 01:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889582; cv=none; b=fAnXAX3Z+kCKh5R+bm43c6flErSqcQxYURPqCxTH6m4hsFoCjaW9GJ/MwsD7Us9y9CnaXKPDxLQLNudiYvjUcpHHJkEHUt+Rvvu02Z9ymk+x41ppWTpGoBYqDXFmaPn9e7GUgGNaKlTA8ysYNlF+s2i9oecgzGn61bD8y3fUmTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889582; c=relaxed/simple;
	bh=bbGRpSDNgSMqp2NJkQnv0piyt36+5XoMQY5eHqfaxWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YhqBStq4KDhhcL5FiOL8ZN89+U//tmOqq2NU3BCOXwfST7lbJnFyNi6nP/onAhHEBUaZaVFXWSmERp3Arx5Y9G2/HmS86VSV4Tads4AygOD/cTbkMRFVU6AhqFaWqhhDXSqCAE2Eb8gXepxTM0G2u71fIHukgda6V7E7OVBUPVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aDHdJZtN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aDHdJZtN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745889581; x=1777425581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bbGRpSDNgSMqp2NJkQnv0piyt36+5XoMQY5eHqfaxWk=;
  b=aDHdJZtNYAOYdKfF7g7z8UtRqyBrS2RWizTdGKx4LR8cfMqDGCry/kkm
   TJZ+yPUIfHvvgWU7ynnkxJpCtNLuvQ3B2WTUKy4J8GA+MmSYRZrSHEwdH
   4MhORsCa+nIMVNksUbrohshPwKdN631MNU2RGRtcdIqDHoR6yeBpOOaqV
   sWQtVI8ar/TCM5wq1cPeciKB1Qgmo1g6I6OIsbFjl+HBdnIBKyKGBOqX/
   AUVZuqg4kBT/KqC5+5aN2cR7gG0WFPMCs2Q/lyFeno+oEo4SdnMGCfI8o
   knEMkT+6mfmYc5m0xg2pRM3NVO4pWwBu6S0ZvbFUq39C6WLVFJQSL1uDC
   g==;
X-CSE-ConnectionGUID: kmU03xTqTjCj3AszxmYmQw==
X-CSE-MsgGUID: JXZM+LarTKmsKhKuawuSGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="50154555"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="50154555"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:19:36 -0700
X-CSE-ConnectionGUID: 1Ymtqv1MRseXMEVPl/9cmQ==
X-CSE-MsgGUID: S/7hz7wUR0quxGODdQb60Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="133561625"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Apr 2025 18:19:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9ZdE-0000Fo-2t;
	Tue, 29 Apr 2025 01:19:32 +0000
Date: Tue, 29 Apr 2025 06:24:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1597/1597]
 include/linux/ktask.h:123:21: warning: cast between incompatible function
 types from 'int (*)(long unsigned int,  long unsigned int,  struct cgp_args
 *)' to 'int (*)(void *, void *, void *)'
Message-ID: <202504290604.Y62ysEZs-lkp@intel.com>
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
commit: ae0cd4d46ced733c522f2cc6da2d380d69123fc4 [1597/1597] mm: parallelize clear_gigantic_page
config: arm64-randconfig-004-20250429 (https://download.01.org/0day-ci/archive/20250429/202504290604.Y62ysEZs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290604.Y62ysEZs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504290604.Y62ysEZs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/memory.c:72:
   mm/memory.c: In function 'clear_huge_page':
>> include/linux/ktask.h:123:21: warning: cast between incompatible function types from 'int (*)(long unsigned int,  long unsigned int,  struct cgp_args *)' to 'int (*)(void *, void *, void *)' [-Wcast-function-type]
     123 |   .kc_thread_func = (ktask_thread_func)(thread_func),      \
         |                     ^
   include/linux/ktask.h:139:3: note: in expansion of macro 'KTASK_CTL_INITIALIZER'
     139 |   KTASK_CTL_INITIALIZER(thread_func, func_arg, min_chunk_size) \
         |   ^~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:4491:3: note: in expansion of macro 'DEFINE_KTASK_CTL'
    4491 |   DEFINE_KTASK_CTL(ctl, clear_gigantic_page_chunk, &args,
         |   ^~~~~~~~~~~~~~~~


vim +123 include/linux/ktask.h

c48676ef6b6f9c Daniel Jordan 2019-08-14  120  
c48676ef6b6f9c Daniel Jordan 2019-08-14  121  #define KTASK_CTL_INITIALIZER(thread_func, func_arg, min_chunk_size)	     \
c48676ef6b6f9c Daniel Jordan 2019-08-14  122  	{								     \
c48676ef6b6f9c Daniel Jordan 2019-08-14 @123  		.kc_thread_func = (ktask_thread_func)(thread_func),	     \
69cc5b58cc50d2 Daniel Jordan 2019-08-14  124  		.kc_undo_func = NULL,					     \
c48676ef6b6f9c Daniel Jordan 2019-08-14  125  		.kc_func_arg = (func_arg),				     \
c48676ef6b6f9c Daniel Jordan 2019-08-14  126  		.kc_min_chunk_size = (min_chunk_size),			     \
c48676ef6b6f9c Daniel Jordan 2019-08-14  127  		.kc_iter_func = (ktask_iter_range),			     \
c48676ef6b6f9c Daniel Jordan 2019-08-14  128  		.kc_max_threads = 0,					     \
c48676ef6b6f9c Daniel Jordan 2019-08-14  129  	}
c48676ef6b6f9c Daniel Jordan 2019-08-14  130  

:::::: The code at line 123 was first introduced by commit
:::::: c48676ef6b6f9cb8497d6264ae9ff71b87630337 ktask: multithread CPU-intensive kernel work

:::::: TO: Daniel Jordan <daniel.m.jordan@oracle.com>
:::::: CC: Xie XiuQi <xiexiuqi@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
