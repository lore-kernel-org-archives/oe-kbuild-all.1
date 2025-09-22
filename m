Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2312F9DBE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 11:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758540444; cv=none; b=tJEBJGFXIDanfb71XozIYlUmoabrTDd6UvJDM/ogqeMxJKpdpAv1/yD5FWIigaHfgwUfhH0iKj+gaxuOs+l1LudvvluzFbMaHWh+xG+aMlKZuBsw+Rr2cbAeXc+ADXoodb4RiJU2thz6DD/RtDby+FYN77s+EAAZVDPqzpgKUE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758540444; c=relaxed/simple;
	bh=VOVuKM1jtC026WGimcuNtlB8SL77AkJRcbZosGI/eks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pPiIF3QCw672fyYv3ibI8QZaKxFeq2A01SFW5xIHlt3rTTF93BlCoZ1aXFsXKBo9hnoix8sHdIfNyDRU57+JaxD1FvMITfEhZEsdbs3J46EkVHZ6uodzHs0cKs2TLsAQASHQXhjVJwKjDzTf2ig+tsN2m8ZUdr5ulU9BqmyYrVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HSK5DiPK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HSK5DiPK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758540443; x=1790076443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VOVuKM1jtC026WGimcuNtlB8SL77AkJRcbZosGI/eks=;
  b=HSK5DiPKZ33npzACFpeYeUUO1FJAAfpVWEJ4gI538E6kSnXvSM0F6mg2
   9vgPY7shobYFcV+FnO41jclpzqPZz/g5JBq6hS0TQTVIXEWbQiXAEBgkM
   MFmoDIr+ZLwD7YWjTUJlEeXyrBhhBQGo6ATSclF/g9MsO0R1xs1x89Zmo
   s9pkmDa/RGwZ6eDG7puj0vZ15h2rvjcv807jjn2JScPWdfkCv2zd5C6kf
   iDXtuBjxe5uT60pYMVJdqGdTNBxgXAq4EaxYzQxl1FIPOgaZtSq2vx+WT
   RqH1d9Nw1X92BSP2OLQyti4R0AFkzeuPliRixHYP8rY9tilqCYIjPP57z
   g==;
X-CSE-ConnectionGUID: 31MAq1xKTf+V4CwJu+PwYg==
X-CSE-MsgGUID: r308YNQeSwu1ZvJ7Js+vBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="64438344"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="64438344"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 04:27:22 -0700
X-CSE-ConnectionGUID: vDefJLKrRMC3JPVeHOodLw==
X-CSE-MsgGUID: 0IPiCTCHSkyINWwuSKN0UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="180711196"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Sep 2025 04:27:20 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0ehG-0001b7-0Y;
	Mon, 22 Sep 2025 11:27:15 +0000
Date: Mon, 22 Sep 2025 19:26:56 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 146/146] kernel/cgroup/cgroup.c:6276:
 warning: Function parameter or member 'child' not described in
 'cgroup_css_set_fork'
Message-ID: <202509221914.x9NNkVt8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   c73db7ebb024f59416db0cf136dc2d4b9dbc3695
commit: 7636e313bdd5f19593653f18ae26f57a8ebbc93d [146/146] bytedance: async_fork: Fix incorrectly rolling back async-fork in multithreading.
config: arm64-randconfig-004-20250922 (https://download.01.org/0day-ci/archive/20250922/202509221914.x9NNkVt8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509221914.x9NNkVt8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509221914.x9NNkVt8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cgroup/cgroup.c:6276: warning: Function parameter or member 'child' not described in 'cgroup_css_set_fork'
   kernel/cgroup/cgroup.c:6417: warning: Function parameter or member 'kargs' not described in 'cgroup_can_fork'
   kernel/cgroup/cgroup.c:6478: warning: Function parameter or member 'kargs' not described in 'cgroup_post_fork'


vim +6276 kernel/cgroup/cgroup.c

17703097f34564 Christian Brauner 2020-02-05  6256  
ef2c41cf38a755 Christian Brauner 2020-02-05  6257  /**
ef2c41cf38a755 Christian Brauner 2020-02-05  6258   * cgroup_css_set_fork - find or create a css_set for a child process
ef2c41cf38a755 Christian Brauner 2020-02-05  6259   * @kargs: the arguments passed to create the child process
ef2c41cf38a755 Christian Brauner 2020-02-05  6260   *
ef2c41cf38a755 Christian Brauner 2020-02-05  6261   * This functions finds or creates a new css_set which the child
ef2c41cf38a755 Christian Brauner 2020-02-05  6262   * process will be attached to in cgroup_post_fork(). By default,
ef2c41cf38a755 Christian Brauner 2020-02-05  6263   * the child process will be given the same css_set as its parent.
ef2c41cf38a755 Christian Brauner 2020-02-05  6264   *
ef2c41cf38a755 Christian Brauner 2020-02-05  6265   * If CLONE_INTO_CGROUP is specified this function will try to find an
ef2c41cf38a755 Christian Brauner 2020-02-05  6266   * existing css_set which includes the requested cgroup and if not create
ef2c41cf38a755 Christian Brauner 2020-02-05  6267   * a new css_set that the child will be attached to later. If this function
ef2c41cf38a755 Christian Brauner 2020-02-05  6268   * succeeds it will hold cgroup_threadgroup_rwsem on return. If
ef2c41cf38a755 Christian Brauner 2020-02-05  6269   * CLONE_INTO_CGROUP is requested this function will grab cgroup mutex
ef2c41cf38a755 Christian Brauner 2020-02-05  6270   * before grabbing cgroup_threadgroup_rwsem and will hold a reference
ef2c41cf38a755 Christian Brauner 2020-02-05  6271   * to the target cgroup.
ef2c41cf38a755 Christian Brauner 2020-02-05  6272   */
7636e313bdd5f1 Peng Zhang        2025-08-13  6273  static int cgroup_css_set_fork(struct task_struct *child,
7636e313bdd5f1 Peng Zhang        2025-08-13  6274  			       struct kernel_clone_args *kargs)
ef2c41cf38a755 Christian Brauner 2020-02-05  6275  	__acquires(&cgroup_mutex) __acquires(&cgroup_threadgroup_rwsem)
ef2c41cf38a755 Christian Brauner 2020-02-05 @6276  {
ef2c41cf38a755 Christian Brauner 2020-02-05  6277  	int ret;
ef2c41cf38a755 Christian Brauner 2020-02-05  6278  	struct cgroup *dst_cgrp = NULL;
ef2c41cf38a755 Christian Brauner 2020-02-05  6279  	struct css_set *cset;
ef2c41cf38a755 Christian Brauner 2020-02-05  6280  	struct super_block *sb;
ef2c41cf38a755 Christian Brauner 2020-02-05  6281  	struct file *f;
ef2c41cf38a755 Christian Brauner 2020-02-05  6282  

:::::: The code at line 6276 was first introduced by commit
:::::: ef2c41cf38a7559bbf91af42d5b6a4429db8fc68 clone3: allow spawning processes into cgroups

:::::: TO: Christian Brauner <christian.brauner@ubuntu.com>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
