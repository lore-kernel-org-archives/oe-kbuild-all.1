Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57D41E493
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 13:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730034791; cv=none; b=QFx7LaYi8XzSy/20+ViGEX1YFC4YBqqmATapZxRe6wIh1hneSpNDuiStSD/5OZ+6hcGXnryu0Ee/TTPmLhrQ+MUtvNLd9MRtZFiAnYqQVZELHRTL1BkUzZVMrV5eAGYFoBbHJUOoyU8DQX4GnXgJJpb+Qn+VSUWgO8NA2fcBaog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730034791; c=relaxed/simple;
	bh=qb1FMlWlQkOvXDky802VLW3ZjzOd6Arkb/HT0HK6Rv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=utucaJVnFhBHRYuW60EhEYVwxP41BfGkUbHmnXWanny2Uwq6+TODbmNgWqYrE7Kn6IjDLT5krKRA82D2lWuWK3+OAZSiyevagvUpxU5GXgmkPC4t8Tasm/0Pe1ePKCqQxVJvWYXp73e9lNTVREvTLfyVT5iGfyLiRUCI3GYUlgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=es7ISlzC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="es7ISlzC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730034789; x=1761570789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qb1FMlWlQkOvXDky802VLW3ZjzOd6Arkb/HT0HK6Rv4=;
  b=es7ISlzClsCll3eLsHOp3s22kRmS+IV52Ai827HUmhqi1hPBw649kkSR
   XOQx+vP02eT1xGVMausHWeBs1NY3YBaepK0XpnmPUi8iXfL4lxUKIVoof
   JrpM+xM+l7jykdPvzQh1M1JOD2JqHuRR7tJMJVILzfrdkqZKkOTa8zJ9x
   QiObtVpwSZOXqud4YKGc071HC5FtKZIYokrR/Ti3olnNgrwr2rK1iXiI0
   4PanIQKg3CYAenO4LU+ejPu5CZ88XJyZ42rP06ZYZJcE0BWBpXnHCZqSS
   85X81/zMlroAoUSEReRLHPDU/VK5KkoXme80wheZdUHIQLKwtV/G/9ILn
   A==;
X-CSE-ConnectionGUID: IQ+6HLvpSnat13fuDzixHg==
X-CSE-MsgGUID: UyKBYtnuTP6mufIDjKjg6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52201036"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52201036"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 06:13:08 -0700
X-CSE-ConnectionGUID: 6ej6fChQSQeppfzG5Zl0bA==
X-CSE-MsgGUID: EIn7O4PmRX+0txAYEWP+3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="104696213"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Oct 2024 06:13:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t534q-000ahw-0K;
	Sun, 27 Oct 2024 13:13:04 +0000
Date: Sun, 27 Oct 2024 21:12:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2385/15331] kernel/cgroup/cgroup.c:3968:29:
 error: 'cgroup_psi_stat_show' undeclared here (not in a function); did you
 mean 'cgroup_stat_show'?
Message-ID: <202410272152.5flmz7cD-lkp@intel.com>
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
head:   9d0af12b79bee784902822ddeec2e1a8cfc18524
commit: 4a69b56540f40550585b9f93c35e415ac90bdecc [2385/15331] sched/psi: Introduce pressure.stat in psi
config: arm64-randconfig-003-20241027 (https://download.01.org/0day-ci/archive/20241027/202410272152.5flmz7cD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410272152.5flmz7cD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410272152.5flmz7cD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/cgroup/cgroup.c:3968:29: error: 'cgroup_psi_stat_show' undeclared here (not in a function); did you mean 'cgroup_stat_show'?
    3968 |                 .seq_show = cgroup_psi_stat_show,
         |                             ^~~~~~~~~~~~~~~~~~~~
         |                             cgroup_stat_show


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
