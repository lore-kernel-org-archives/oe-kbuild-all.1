Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C65D2C18C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Sep 2024 02:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727316171; cv=none; b=RbMHc1J1q2EEITlCSBPDWKtDEMHNCGA8RiAfr+VDTTHIp4dp6oxQGdjmjbKif9KsuhXRKX9U/7Y4Gk9JbmfPyFlfWF0KpBCsr0McbAvv+Gwhj2wn+1CBvQ2NU6thvwYYOLr8khmc1DZvZpIGh58wv8T/HAkWq8cvPvDDfY10bgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727316171; c=relaxed/simple;
	bh=CNTuMzyMeTgepB2Wr6Ba2dc74GIWZ8Ga8fXhQfGITeU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p/Pk8OLhC7eFD0WEvHSJkeH7BvqJ8Hm7WzsKqJLRTue7PPf/EWHX9YGURP3sNVyu7H0AkXSjc3IhjAhvXhwOJy7SOBZmnPUJZAxI772rlJc9a0i3G5yLxbnBJ+YexTSpjVrf9jLLFJwge9TuTQyfJQGxjooNu8U/ZSWzGTRAk00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDOOv6zs; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDOOv6zs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727316169; x=1758852169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CNTuMzyMeTgepB2Wr6Ba2dc74GIWZ8Ga8fXhQfGITeU=;
  b=fDOOv6zsCA/TeaiC/DCR4ETrh/qXXa4fMCQtL6G3gn4IqlhnmvrTTGTG
   SchzBOIXSR0QBNCVyzHfAnMARHZ1vX5BGGcXWtTwL0l7IeoLpQvkWcDZr
   oMkmorYgmwX4i+/ipv+96LWA3VVuG9slRy3mfyr+R7HmsB3XfeARPkput
   DVtmcaOUbBnqy1zl6OcJdpHwXlAUTmLykKhkeIraYKrOXN3PZFUGQmrvz
   Ky8SZrvV7Ssor1EuR4ZYSnaeir0L1hqPRRFli+j1PU/bCcyDOWsuTDQnN
   xSmfwNuo/XOrXdGb+3Lvk8qX0L1Wj4zTusE+BTAMWiv9IOgqEOiXG/TCX
   A==;
X-CSE-ConnectionGUID: xhjv1qjXQjGc7Rljgaqpsw==
X-CSE-MsgGUID: z8d6yIkfSh+03hYhM3zPow==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="51808668"
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; 
   d="scan'208";a="51808668"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 19:02:48 -0700
X-CSE-ConnectionGUID: 3I5zB/rRRNqB2XOpRhksJg==
X-CSE-MsgGUID: VTzEZFm0SnewmFAGqDPg+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; 
   d="scan'208";a="76483710"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Sep 2024 19:02:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stdq8-000K7v-2J;
	Thu, 26 Sep 2024 02:02:44 +0000
Date: Thu, 26 Sep 2024 10:02:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2385/14122] kernel/cgroup/cgroup.c:3968:29:
 error: 'cgroup_psi_stat_show' undeclared here (not in a function); did you
 mean 'cgroup_stat_show'?
Message-ID: <202409260923.Yh7ALQqg-lkp@intel.com>
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
head:   81a41d2ac1de43215c014bc71d907a026042e55b
commit: 4a69b56540f40550585b9f93c35e415ac90bdecc [2385/14122] sched/psi: Introduce pressure.stat in psi
config: loongarch-randconfig-r061-20240926 (https://download.01.org/0day-ci/archive/20240926/202409260923.Yh7ALQqg-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409260923.Yh7ALQqg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409260923.Yh7ALQqg-lkp@intel.com/

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
