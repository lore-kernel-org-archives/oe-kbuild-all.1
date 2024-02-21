Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0BD7C09A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Feb 2024 13:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708523931; cv=none; b=UjM51w+J70NH55+g4avy23AiTQi1C7gba1fVouBbwKvXE4+TpPxjwjwKYR8UyfRXlj1c03Ykk4zn2HVqrAOWDA7XwXseTc1pFOMG3Xo3CQs9oirzhgzY0pnvZdMf8MCDWZmhCt5/4dqiGLj2OVbQiQ0TiOGJgdYlAFNoKR25mIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708523931; c=relaxed/simple;
	bh=VjJHey64D9oYUpYm9xOEzwY8my0phN2Z9K/PL1YJQLM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uh8LkrR1lIpNtkdYxsV11Ol9KQ5NIkn6QorOYFTTVTSq3XFscrQ7uu9JRnlhCWxZwfPYb+wHcjKNHV9MAFjBZCzNpkbCCc0XXBrKPvpVJ8MLmrTONPmyZRVfAhFagzfD+f1YZU1BdivT3xiFVYfpgwvlD3jBgODeFcF33v3WltQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PyGED9xE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PyGED9xE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708523930; x=1740059930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VjJHey64D9oYUpYm9xOEzwY8my0phN2Z9K/PL1YJQLM=;
  b=PyGED9xEmnBVEQxtt65Ke4iOomptJRJgPUXFCqJDcA16bk3TFiswF9Hb
   xD04ikZ29lFWN4nsy0p9vH+gYRu2l9LzGnTP/Mb+7F+DPILflVaGk7S+r
   a+Dw9NnB7nXrd65rkIzI9CakEbS1CPUDIAMOcD0ZjX//0T59J4Hbj6KzP
   iao4Khhg61ZEXDuwXTJcmR/PWqkuzx2a0qeXwvtd/mbfojGbq4Ytg1GUt
   dVZNv+5fW+yO3EXPODGQjvnFsVC/PnGbLnGrBGEt/4Jp0nYSibsUSsCr9
   dcVGuHSoO4t5H6CJKvXnXuk6XTBqsvQFvL87VG1QgXpMeboyUd28+ianx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="6513423"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="6513423"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 05:58:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5306622"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 21 Feb 2024 05:58:47 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcn7V-0005Ng-1Z;
	Wed, 21 Feb 2024 13:58:45 +0000
Date: Wed, 21 Feb 2024 21:56:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2385/3300] kernel/cgroup/cgroup.c:3968:15: error:
 use of undeclared identifier 'cgroup_psi_stat_show'; did you mean
 'cgroup_stat_show'?
Message-ID: <202402212124.9Ot7vWp2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8d757f9866d24f61f34a4d4639ff0395322c2f5c
commit: 4a69b56540f40550585b9f93c35e415ac90bdecc [2385/3300] sched/psi: Introduce pressure.stat in psi
config: x86_64-buildonly-randconfig-004-20240221 (https://download.01.org/0day-ci/archive/20240221/202402212124.9Ot7vWp2-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240221/202402212124.9Ot7vWp2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402212124.9Ot7vWp2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/cgroup/cgroup.c:3968:15: error: use of undeclared identifier 'cgroup_psi_stat_show'; did you mean 'cgroup_stat_show'?
    3968 |                 .seq_show = cgroup_psi_stat_show,
         |                             ^~~~~~~~~~~~~~~~~~~~
         |                             cgroup_stat_show
   kernel/cgroup/cgroup.c:3660:12: note: 'cgroup_stat_show' declared here
    3660 | static int cgroup_stat_show(struct seq_file *seq, void *v)
         |            ^
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
