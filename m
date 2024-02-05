Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5533679E0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 00:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707094379; cv=none; b=VE6Fy7jSEzHUSKwcpjBlm2XqsoeUIZUc/zGY8rFEO7W3J14VWNh9xCShqTpSoEYFsrwprd8Me9qSmtXyjuC2IYVT4WGaShzXdrMSRXyo952sYkgjDfWoSUnTcN9wSpIThQqnldSDKoatqhXdOnOJDEP9Cimc9r+kzUM6y9xHBZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707094379; c=relaxed/simple;
	bh=9gpCQHbJT6hgLIKTZDaHpX8KSWO4r+6i0Oi8hqA2n5s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xq7q1mbL4FQYvWIdPtVjHKQSUHdO1EJgIysg7XMst6N9LWSEGVRwp/EGLZlWBEYnA1PoF3uIxtwk5Oftx3XdQr5mj9qk3dGoILrWQa1xgiGC+oFEkXpWYYDeiHYK6S8bO4vshJzdZ2Xe0558B7Q2zrVZKRF5l9DvXdO6w+UMx0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HGhbx/ox; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HGhbx/ox"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707094377; x=1738630377;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9gpCQHbJT6hgLIKTZDaHpX8KSWO4r+6i0Oi8hqA2n5s=;
  b=HGhbx/oxYZY8OkWqAwhX1bG8RKzfaJTZoueh6EIG5sjg2rKHoYSCSR5i
   kvFXLBTji45yvIluKJoSfm2kXUp/OJP8TBlVjAmBKo+k/SN+NUPgytwcF
   wrDIB7WXg/qHF0eheUmFZrgR08TFa/ot5hchJkcDcxbtb5H1FoOC5kpf8
   QkvtyA5aJB5k/HJiFANZy4gdusnvzTIXjrCjenC5VK5CG1Kont+US++EI
   y4HakCgcfMhHIe8txE/x3ErTXAgE3y7RPhHXiS768/vkQfW+MRivXTnwf
   rYw1vweW8mFxry8SS/ach3SqEdRXUDnSeT1VmyQod6bZHonimMRrFsIla
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="3392122"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="3392122"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 16:52:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5183407"
Received: from lkp-server02.sh.intel.com (HELO 1098e01a32bc) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 04 Feb 2024 16:52:56 -0800
Received: from kbuild by 1098e01a32bc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWnEC-00003S-31;
	Mon, 05 Feb 2024 00:52:52 +0000
Date: Mon, 5 Feb 2024 08:52:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wenyu Huang <huangwenyu5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1659/2942] kernel/sched/fair.c:146:12: warning:
 'hundred_thousand' defined but not used
Message-ID: <202402050715.VjY76Raq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   988c7111f1e95028838eb8e4f71ee49b45132a23
commit: a3c9f2da0a35df4e41751556be4308f57bdaf3d6 [1659/2942] sched: Introduce handle priority reversion mechanism
config: arm64-randconfig-002-20240205 (https://download.01.org/0day-ci/archive/20240205/202402050715.VjY76Raq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402050715.VjY76Raq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402050715.VjY76Raq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:146:12: warning: 'hundred_thousand' defined but not used [-Wunused-variable]
     146 | static int hundred_thousand = 100000;
         |            ^~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:145:12: warning: 'one_thousand' defined but not used [-Wunused-variable]
     145 | static int one_thousand = 1000;
         |            ^~~~~~~~~~~~


vim +/hundred_thousand +146 kernel/sched/fair.c

   139	
   140	static DEFINE_PER_CPU_SHARED_ALIGNED(struct list_head, qos_throttled_cfs_rq);
   141	static DEFINE_PER_CPU_SHARED_ALIGNED(struct hrtimer, qos_overload_timer);
   142	static DEFINE_PER_CPU(int, qos_cpu_overload);
   143	unsigned int sysctl_overload_detect_period = 5000;  /* in ms */
   144	unsigned int sysctl_offline_wait_interval = 100;  /* in ms */
 > 145	static int one_thousand = 1000;
 > 146	static int hundred_thousand = 100000;
   147	static int unthrottle_qos_cfs_rqs(int cpu);
   148	#endif
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
