Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD012E5B23
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Aug 2025 08:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754988972; cv=none; b=dqE1fNvO3wOde1NDakd4Da5rUxTkRhBWdCJupTE/+gh2pw+QpBzlqnbpXpdMdGU/Dlh/1rYhKiJ3cj2sDQCzbKx6u6/C77A7T4jB4v6k/dvWeOFko+IGm82WbNa3u/YC9JMR+PiBJAorPzVY3szYYMDlZUfQKT9ZgMyo8YfjMII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754988972; c=relaxed/simple;
	bh=1QPCgQAGU7UKvmaGYCvExO+zjKgIxkTWb1R53VE67Go=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GDq2dZS5OD4L4t8PnGQpxK9Go815X+cMkTkbSopFTlk8SXROisgYaaGBJlD2lpFXbf2J44q8moprL2ZBjFDTeLQkEWqcl4P+rKek4yPqO63TPm4POO6Nd2MTGkC7bd3J6aX3Evcls0Ioa2eqzIGnRndUeQQdnjKopLiFNsvtXy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KGh7rFad; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KGh7rFad"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754988969; x=1786524969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1QPCgQAGU7UKvmaGYCvExO+zjKgIxkTWb1R53VE67Go=;
  b=KGh7rFadNVu+4GQk00gAUKkCMM518w1OevxkxJ9WovV9QIoS04G0GpmB
   s1iZnWlVmtEd6mg8eHQrDM7G8NbDX/d2cEWotUkJyWuAwZ8EXlIHZ2+sQ
   G7UHOd0L8AUhNA5Ij7t1jUU2wzGb7dABIZ7PNGm2/Af10D8GG9p3g5sST
   uBNd31zCRlYSo862Ak9yunRdm3zV43+DD/ewmSVitX3Wrv/QAe+ZMknbz
   iBzFJPiiSrcRWBvFhW2dzhJM19xhf5cE2TfvrFfLLsxVIY3+vSYzbUvBW
   bSZjG5Sg8A9xBrX18Vvjxh9WWqOLFSugfwnegQ0J5OCSxw42WFn+Q4mBL
   A==;
X-CSE-ConnectionGUID: 0/p2AQjtTjyKNvoQFiH1RQ==
X-CSE-MsgGUID: cVsll44+TuW5Bfoe9ocnow==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="67963782"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="67963782"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 01:56:09 -0700
X-CSE-ConnectionGUID: H0R788ClRs672ajhlzYkfA==
X-CSE-MsgGUID: I+Yf6FBhRPSOrsbTAHFMcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="166940177"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 12 Aug 2025 01:56:08 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulkmz-0006bT-2C;
	Tue, 12 Aug 2025 08:55:42 +0000
Date: Tue, 12 Aug 2025 16:51:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Yu <serein.chengyu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2669/2669] kernel/sched/debug.c:102:12: warning:
 no previous prototype for function 'is_prefer_numa'
Message-ID: <202508121611.xU3A9CdS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   263cf8eeb5316aeebd9d692e9966df029f65889f
commit: 0f22304e62d360fce47988586d599e33895ccb01 [2669/2669] sched: Support NUMA parallel scheduling for multiple processes
config: x86_64-buildonly-randconfig-001-20250812 (https://download.01.org/0day-ci/archive/20250812/202508121611.xU3A9CdS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508121611.xU3A9CdS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508121611.xU3A9CdS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:73:
>> kernel/sched/debug.c:102:12: warning: no previous prototype for function 'is_prefer_numa' [-Wmissing-prototypes]
     102 | int __weak is_prefer_numa(void)
         |            ^
   kernel/sched/debug.c:102:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     102 | int __weak is_prefer_numa(void)
         | ^
         | static 
   In file included from kernel/sched/build_utility.c:105:
   kernel/sched/isolation.c:134:46: error: use of undeclared identifier 'setup_max_cpus'
     134 |         if (first_cpu >= nr_cpu_ids || first_cpu >= setup_max_cpus) {
         |                                                     ^
   1 warning and 1 error generated.


vim +/is_prefer_numa +102 kernel/sched/debug.c

   101	
 > 102	int __weak is_prefer_numa(void)
   103	{
   104		return 0;
   105	}
   106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
