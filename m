Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AABA19882B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 19:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732821976; cv=none; b=MbgwWms3ZS0Z9KGa+BxZQTx1tVc1URj6ydU83eUYofkBHT+IxlJ4qEKhyXqUSjAbom9tMy2xSj1zNtvKxVem67m38ZxZuhQHIGLiE/9UsfvDdrS6ab6d0b/iR711FPQU+Kl2pE5sy7DmI0AecnJ7TdIpAWe4g6H7BsoG0gOaGiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732821976; c=relaxed/simple;
	bh=K4qUNI+2qGOTtJDDIp1h2FzfOUuANWeedmQ3/fGg6PA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PTocCMNCdh9veehWaO2uD5ovGqhDG4/1FVRgPkELuKcuvOlVRXPlqhV2NJusCPv4Na4c8J6sUNTthhW47rbJwP7UPZ8+yCWFHQTbltrUQEcyOxvAMr3dRiG35nuwzJ6C/jrgwOVCi3PVibyGkNFguqSDVdlSx8xZKLpgEXNP7s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FgoTk1S4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FgoTk1S4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732821974; x=1764357974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K4qUNI+2qGOTtJDDIp1h2FzfOUuANWeedmQ3/fGg6PA=;
  b=FgoTk1S48PDZjmn1KRzbVKBQLvZbHq3bkwqK5m2NTTsL85e7G+6DK1w8
   sGnQUT7vwHX9LMa9/kYKHQYAow4oWbQOxgnPzIDIz8OMbJwmhEhex9IDG
   lWB56lBOjv1KiXUun5ZXBNwigQ1qPbtCCAW98orxSXOJayrmQelyAMCdO
   zuLHGs/OSbSGSzefBG8Mk3leaUERrEM0VQlluyXlEo7RohpAXe+xXnZh7
   Vf6mTWq3FpvoOn65XqZ9iIcldNBE6NIKPEhmYwQUxXjb8ZD/7DwU5vBc1
   2mRoElwJh/b1QgrDDj6iU9OuOoRh9w5rOtXbZm1A5f1Isgp+AHGb/zb58
   w==;
X-CSE-ConnectionGUID: mnsUsSHlQ5ayWm+TuCWPlQ==
X-CSE-MsgGUID: ZGQ1noERSK+RuB6dpL/9uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33214472"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="33214472"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 11:26:13 -0800
X-CSE-ConnectionGUID: MyWYRBnDSKqo3Y17ntMsKQ==
X-CSE-MsgGUID: HhI1yjNRQfSxYHKoZJdgag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="97407290"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Nov 2024 11:26:12 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGk9S-0009wd-1T;
	Thu, 28 Nov 2024 19:26:10 +0000
Date: Fri, 29 Nov 2024 03:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1559/1559] kernel/cgroup/cgroup.c:3968:29: error:
 'cgroup_psi_stat_show' undeclared here (not in a function); did you mean
 'cgroup_stat_show'?
Message-ID: <202411290300.aJLGkB0L-lkp@intel.com>
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
head:   95bc69473a373c2e578d4fc39734e5811a03ead3
commit: 4a69b56540f40550585b9f93c35e415ac90bdecc [1559/1559] sched/psi: Introduce pressure.stat in psi
config: loongarch-randconfig-001-20241129 (https://download.01.org/0day-ci/archive/20241129/202411290300.aJLGkB0L-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290300.aJLGkB0L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290300.aJLGkB0L-lkp@intel.com/

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
