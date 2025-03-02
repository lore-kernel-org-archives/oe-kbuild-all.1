Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C304C81
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 05:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740891663; cv=none; b=TZ5YmycvyaeyWgHay2o3l+nqvLmDYb7DHMGC1wMu6jZufCGXzDs9VenmnS/tCfiXYy0h/CzCg6K2HeOvutLJVHIViV+uUQkrH5j9Q+niwYKJGFbaATMsg9VNiedAQdzyHP+6huETYFXwOP/EUYoWMqq/g2sQxfsbma651anMNO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740891663; c=relaxed/simple;
	bh=cgzvNCMs/mdtsziqu6XWRi5dd5OkhstH4KvgAj7tNI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aZ4Q6ZhRb1DeYDPXTDiTGQoSN9Im/e+N/O615k0cRG7Zieggk03W+eduIIw19nU380BbJKaU+SJhNOUi9Iy9QPOiVO/1qy5+5iyPOtrG/cn/wppqU0TbJUYnOgD0zoO1745fZH/6PALXO7xBh0AHn3lcuDEJ+tKLjysj/0+6gPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VYznB5CI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VYznB5CI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740891660; x=1772427660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cgzvNCMs/mdtsziqu6XWRi5dd5OkhstH4KvgAj7tNI8=;
  b=VYznB5CIBRQUyLMW73VJYsp9Gom8G/hUYHmNod76f6gRcgFFn5AUFqsu
   zDjkOHErkOM5I8m7Nej4q3sGZbVOCCc63RMIbPc/DVfSBfy8J6GNrm6vF
   CHl/XPnjvlX8owvNlgoFEUGwB7OTXL0PMEQ1ztxcLk6oteBeoQgcyC2VF
   rGo6MY2d1q3axpeYfPNJUr30/LiHyUg+a1CodeZvMEQJRJdimMkkkwJIn
   fSgI4Uy/grH8Wg2QjiLV0Bdy53XfAdD7UQDrHMr2ZJC9b8VIc+IZtd/kU
   Qy9rtW3hoVzRAsU1/pDwjZm98tRoSdHknwpI0mRZRhMcFUSCQjz6D960r
   A==;
X-CSE-ConnectionGUID: nvZy8Lf7T163J3euDac86Q==
X-CSE-MsgGUID: D4WQ2KYBTDST/E5CXQj9OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="51989158"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="51989158"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 21:00:59 -0800
X-CSE-ConnectionGUID: VcKzaB7FSIGkr3REDvOzdA==
X-CSE-MsgGUID: YoTqYMCcQOa/JCL9uVAZZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="140925397"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 01 Mar 2025 21:00:58 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tobRf-000H4s-39;
	Sun, 02 Mar 2025 05:00:55 +0000
Date: Sun, 2 Mar 2025 13:00:09 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1] kernel/sched/cpuacct.c:974:5:
 warning: no previous prototype for 'load_calc_func'
Message-ID: <202503021220.NUwpylpo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   b546d9695894905e1bc9de7646f89b06dbeae968
commit: 72138c49ff07bddef1c2f042528863f81189c6ce [1/1] ck: sched: introduce asynchronous cgroup load calculation.
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20250302/202503021220.NUwpylpo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021220.NUwpylpo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503021220.NUwpylpo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/cpuacct.c:974:5: warning: no previous prototype for 'load_calc_func' [-Wmissing-prototypes]
     974 | int load_calc_func(void *unsed)
         |     ^~~~~~~~~~~~~~


vim +/load_calc_func +974 kernel/sched/cpuacct.c

   973	
 > 974	int load_calc_func(void *unsed)
   975	{
   976		unsigned long next_update = jiffies + LOAD_FREQ;
   977	
   978		while (!kthread_should_stop()) {
   979			set_current_state(TASK_UNINTERRUPTIBLE);
   980			schedule_timeout(HZ/5);
   981			set_current_state(TASK_RUNNING);
   982	
   983			if (time_before(jiffies, next_update + 10))
   984				continue;
   985	
   986			async_calc_cgroup_load();
   987			next_update += LOAD_FREQ;
   988		}
   989	
   990		return 0;
   991	}
   992	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
