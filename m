Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C70266B67
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 05:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765173002; cv=none; b=BPYcICx1JsLXl/ztm1zLrm/7nb0QG5AnE0JnHS6FDaC4KC2FSp7JgIMbmJh3JEKf6wmzyi2qCz5N04g9vvnxkvP6haZPqnRk94Ni8wLPvNdccWtU8Yt/66HrtTBpz4TUkdm9AscuugnR3kb+Bj1pu5Se5+5IvpwMShv7SE3RkAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765173002; c=relaxed/simple;
	bh=IYltqi0JFCzU8IJKdJjR1DokyLUUSNUNDaSQt3A65l8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U592J2szUaG7M3rndtCt/U6+faPB+Em6sN81CHGofxNMsqBiPzvpuzqxuMLB7ykteQbaMqWSCGtqMd+2chEK777SUj+LFpxSXVynJehAQObBq3dt2T5eySkK9PHxt0E0fo4aFkYIxFH/EYnHRo73Ui80mAAwGDlzCzMT8gQpgno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fasl/ggM; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fasl/ggM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765173001; x=1796709001;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IYltqi0JFCzU8IJKdJjR1DokyLUUSNUNDaSQt3A65l8=;
  b=fasl/ggMnhe6KiT2TXnItqof4t4T4zwJUJmZUnm0PFrEjavNnlRI8l+X
   qS0ghhp1/aHrNnnR+E1bVyo71KXsri8uGzfRzz3aVqQ5/TcWp3QF1NH4A
   +O+VRK7bcW7ZFLtvTgFPZvtY/f9/wlLnXhyoOYqdKSleu2zzB0C4yUmLq
   wV055Y9DDO3ngfzoZLqXgd6DO206VeMXPlc6aQQyvqmg70qRaLRz5QNF0
   4ySPlazz996mUEbXMgoJHDf+lFWQqhmqRBl5da06hbAp0IiWC1IYX7bIS
   hdKQecnPSIo66U83nOYVnoSsTySDYw1zjyEi5s3wtVGK0vdNvAV8kPA8G
   A==;
X-CSE-ConnectionGUID: yScXIjkjSFq9YYfGB4rYIw==
X-CSE-MsgGUID: qwlrPiq1RkuSBnI5f8XutA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="66296346"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="66296346"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 21:50:00 -0800
X-CSE-ConnectionGUID: ru2i0fk8STS8LxC4L0r64g==
X-CSE-MsgGUID: 00b80pp0Spuu+3SBXAp/bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="200323176"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Dec 2025 21:49:59 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSU8C-00000000K0V-00lk;
	Mon, 08 Dec 2025 05:49:56 +0000
Date: Mon, 8 Dec 2025 13:49:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zicheng Qu <quzicheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3482/3482] kernel/xsched/cgroup.c:30:21: sparse:
 sparse: symbol 'root_xcg' was not declared. Should it be static?
Message-ID: <202512081339.m9dijSrU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   79aa4f2e99baed837a6933aa6b1a852197d30b91
commit: 43bbefc53356009d3603faa2c6e6a2858f724e4d [3482/3482] xsched: Add XCU control group implementation and its backend in xsched CFS
config: arm64-randconfig-r111-20251206 (https://download.01.org/0day-ci/archive/20251208/202512081339.m9dijSrU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512081339.m9dijSrU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512081339.m9dijSrU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/xsched/cgroup.c:30:21: sparse: sparse: symbol 'root_xcg' was not declared. Should it be static?
>> kernel/xsched/cgroup.c:368:6: sparse: sparse: symbol 'xcu_move_task' was not declared. Should it be static?
   kernel/xsched/cgroup.c:368:6: sparse: sparse: context imbalance in 'xcu_move_task' - different lock contexts for basic block

vim +/root_xcg +30 kernel/xsched/cgroup.c

    28	
    29	static struct xsched_group root_xsched_group;
  > 30	struct xsched_group *root_xcg = &root_xsched_group;
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
