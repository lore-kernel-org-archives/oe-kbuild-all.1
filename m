Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B16170A11
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 23:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726268795; cv=none; b=CPcEVdK4jzlpWpeN5hP3ZQLNrd99+kD5PWJ6nugtwhNO1vvOOef5q/B/kEQYihe4hmICFnARp/7Ibb/Si6rygy7niVPYTTTnGjX9okPjaC81bX/UjbNJdXv2XZj3mmW/kQrfmhQHPCq4MzMJDFDbfUV37zpXqvA4j30Vu7eXvuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726268795; c=relaxed/simple;
	bh=wnToeX8YzDppkDKMgMsn/V/HdNlGQr09epLSRpo5Wv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EP4cYWDX4wojn1SOqVpSuSO99F4TOfufVme/llXU4Cf2CvUTGPmmscQ6g3dUukZI0RwIqO1Kw2VXnoIWfIy6agEONhKjz8CnHM3XPAl/wIavKGo9WlW2+i2Bqu6qEaMMQ5MtMAo934fN+qKqfj6n8CEQSk5+vUJ2AdMVO/jDz80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KltF6waC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KltF6waC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726268793; x=1757804793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wnToeX8YzDppkDKMgMsn/V/HdNlGQr09epLSRpo5Wv4=;
  b=KltF6waCpSKyUJO8bx2qjPD567K7/+GwWyTdgB3aRJlJYQnsnGtLKLuq
   19Ra89hbKMssay3AbO2V7thtnrU/K3AQpBZJ4jfzimyziuMdQDKHE2EJZ
   9dPeYfFnEB75m+re1Wmz/rSkD3CaWZwzwL2uFnvxuz6/3b8+QC5Cxcm8e
   4KJ7Ip1P/VxXdwO2i7oFPRfKteaNKusAGRKGA62c1y/aet/IsJleQ7vRX
   4lBzeHiy690ZygUz35MWzcHnQ4nRR1b4taCDMLsx7BcbibZod/aX1TnXU
   qM0CMqF+AAfP844Iik4GQDTTElgWRfWtBDh/A4xQod5HUTKRnhvQqk3b2
   Q==;
X-CSE-ConnectionGUID: KmvL+3EzSyOro84fApznSA==
X-CSE-MsgGUID: oRX++dV7QeiOihbcXkgtQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="36533411"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="36533411"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 16:06:32 -0700
X-CSE-ConnectionGUID: 3wW/D9yCQcOX/zhYzqkZ5A==
X-CSE-MsgGUID: wBA1xxxbTQewDCs8o9Xq+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="68733764"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Sep 2024 16:06:31 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spFMy-00077g-2W;
	Fri, 13 Sep 2024 23:06:28 +0000
Date: Sat, 14 Sep 2024 07:06:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2385/13930] kernel/cgroup/cgroup.c:3968:15:
 error: use of undeclared identifier 'cgroup_psi_stat_show'; did you mean
 'cgroup_stat_show'?
Message-ID: <202409140727.bS0VY46J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   13706c950ff941dc015e16f76812077f9861e378
commit: 4a69b56540f40550585b9f93c35e415ac90bdecc [2385/13930] sched/psi: Introduce pressure.stat in psi
config: arm64-randconfig-001-20240913 (https://download.01.org/0day-ci/archive/20240914/202409140727.bS0VY46J-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140727.bS0VY46J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140727.bS0VY46J-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/cgroup/cgroup.c:3968:15: error: use of undeclared identifier 'cgroup_psi_stat_show'; did you mean 'cgroup_stat_show'?
                   .seq_show = cgroup_psi_stat_show,
                               ^~~~~~~~~~~~~~~~~~~~
                               cgroup_stat_show
   kernel/cgroup/cgroup.c:3660:12: note: 'cgroup_stat_show' declared here
   static int cgroup_stat_show(struct seq_file *seq, void *v)
              ^
   1 error generated.


vim +3968 kernel/cgroup/cgroup.c

  3929	
  3930	struct cftype cgroup_v1_psi_files[] = {
  3931		{
  3932			.name = "io.pressure",
  3933			.flags = CFTYPE_NO_PREFIX,
  3934			.seq_show = cgroup_io_pressure_show,
  3935			.write = cgroup_io_pressure_write,
  3936			.poll = cgroup_pressure_poll,
  3937			.release = cgroup_pressure_release,
  3938		},
  3939		{
  3940			.name = "memory.pressure",
  3941			.flags = CFTYPE_NO_PREFIX,
  3942			.seq_show = cgroup_memory_pressure_show,
  3943			.write = cgroup_memory_pressure_write,
  3944			.poll = cgroup_pressure_poll,
  3945			.release = cgroup_pressure_release,
  3946		},
  3947		{
  3948			.name = "cpu.pressure",
  3949			.flags = CFTYPE_NO_PREFIX,
  3950			.seq_show = cgroup_cpu_pressure_show,
  3951			.write = cgroup_cpu_pressure_write,
  3952			.poll = cgroup_pressure_poll,
  3953			.release = cgroup_pressure_release,
  3954		},
  3955	#ifdef CONFIG_IRQ_TIME_ACCOUNTING
  3956		{
  3957			.name = "irq.pressure",
  3958			.flags = CFTYPE_NO_PREFIX,
  3959			.seq_show = cgroup_irq_pressure_show,
  3960			.write = cgroup_irq_pressure_write,
  3961			.poll = cgroup_pressure_poll,
  3962			.release = cgroup_pressure_release,
  3963		},
  3964	#endif
  3965		{
  3966			.name = "pressure.stat",
  3967			.flags = CFTYPE_NO_PREFIX,
> 3968			.seq_show = cgroup_psi_stat_show,
  3969		},
  3970		{ }	/* terminate */
  3971	};
  3972	#endif
  3973	#else /* CONFIG_PSI */
  3974	bool cgroup_psi_enabled(void)
  3975	{
  3976		return false;
  3977	}
  3978	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
