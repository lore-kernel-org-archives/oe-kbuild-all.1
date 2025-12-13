Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50613219E8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 07:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765610475; cv=none; b=twEzCczWy5ZjVQjB3ArXl9ererlLmqHsOPe6OXfqLgoo+Trrl5nZKJ7k//vOadZe8YypGkKTH0wuy4t6BOcKnE0FSWe9+Vw25v+E6BvpU7j+haDPZx1XD50RwK0qN7ZDRm+xurOKHPvwCk/pfn80UM6PdNB0JVxnbUwGM7SCa5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765610475; c=relaxed/simple;
	bh=dPGjKgY19ySXRGCtP9rehDAGMy/p71JTW9W+M4T3SnA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WgUVuQrGVtYS8VDmSZbtIbHY8yP4AjMJX45da/w584D9C8iqC9VD6fYlX4yR5u7XVyk9y1jdKB5xn1fkGbTHEUqF1KIyDKAsgzK7FFD2HBAgUKSsSJd3fyxNieOzk1s2CADeN/RXNXbbjR78qUnUXnDHreOz0PtIm7A3WJ3MSCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fb02Aw0q; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fb02Aw0q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765610473; x=1797146473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dPGjKgY19ySXRGCtP9rehDAGMy/p71JTW9W+M4T3SnA=;
  b=Fb02Aw0qOOvQXC9B+S6DWy6HO+Rawb+tlzuTcco1/fx6qEtG5S244o2j
   +viD0ln9H5JRHGdIxUbXMlPsZACzgozyZ3J6VGNEhtOYwfZEiIVhb+mbQ
   87sb0m462MRGG2Ln6jLOW+fu+uT2UxgmB5Qdlb5DzrqjrawWhot4eERWj
   Mpu1OoX2UEcw5qyVP/utAj+YmgCSjh5DG6JOcdmhXf4aVesKih5Dnoh22
   Y4cmWaDygmYsZpfVDR8969nPSKelf5qB0BerGlRCSjHBDvC8FNx3a0MQu
   K9Ki1cIWosnoD4EFxKJveYUzPyjREH4wS+RqFBq04+Z30ro3yjT6+9ehS
   w==;
X-CSE-ConnectionGUID: /wghOavJRQ6U4Hn8f4YHsQ==
X-CSE-MsgGUID: jPJw/dQEQNW1Jm5/6jR/hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67354708"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="67354708"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 23:21:12 -0800
X-CSE-ConnectionGUID: Py0TjGsEQtKMHj0V7vx9oQ==
X-CSE-MsgGUID: uuTCD/bTSi29yoXgBBAxJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="197270062"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Dec 2025 23:21:11 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUJwC-000000007Dl-2Lz7;
	Sat, 13 Dec 2025 07:21:08 +0000
Date: Sat, 13 Dec 2025 15:20:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Jian <liujian56@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3407/3407] kernel/cgroup/cgroup.c:6217: warning:
 Function parameter or member 'f' not described in 'cgroup_get_from_file'
Message-ID: <202512131534.2ojlpY7Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   da8948fdddb84e5496272bab85973165594dd469
commit: 590ef7039097222551e104343ae4ba74e4ed2f87 [3407/3407] cgroup: add cgroup_v1v2_get_from_[fd/file]()
config: arm64-randconfig-r071-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131534.2ojlpY7Q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131534.2ojlpY7Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131534.2ojlpY7Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cgroup/cgroup.c:6217: warning: Function parameter or member 'f' not described in 'cgroup_get_from_file'
   kernel/cgroup/cgroup.c:6369: warning: Function parameter or member 'kargs' not described in 'cgroup_can_fork'
   kernel/cgroup/cgroup.c:6430: warning: Function parameter or member 'kargs' not described in 'cgroup_post_fork'
>> kernel/cgroup/cgroup.c:6716: warning: Function parameter or member 'fd' not described in 'cgroup_get_from_fd'


vim +6217 kernel/cgroup/cgroup.c

  6211	
  6212	/**
  6213	 * cgroup_get_from_file - same as cgroup_v1v2_get_from_file, but only supports
  6214	 * cgroup2.
  6215	 */
  6216	static struct cgroup *cgroup_get_from_file(struct file *f)
> 6217	{
  6218		struct cgroup *cgrp = cgroup_v1v2_get_from_file(f);
  6219	
  6220		if (IS_ERR(cgrp))
  6221			return ERR_CAST(cgrp);
  6222	
  6223		if (!cgroup_on_dfl(cgrp)) {
  6224			cgroup_put(cgrp);
  6225			return ERR_PTR(-EBADF);
  6226		}
  6227	
  6228		return cgrp;
  6229	}
  6230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
