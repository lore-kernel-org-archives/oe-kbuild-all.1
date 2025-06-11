Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5102918D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 17:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749663557; cv=none; b=qM143Cbpi+3aSdEUZz2HHIEmDwcbgBkOyhC/JJgRKqypmkr0KITkQWTHyJGXlXj671GCidw4TuG4cH5cOVlwJwG36PaCC4cAG8ttbDxtAkouPyP0A4efQ1WRDyU65E4PYFkJx+UA4NMFoiiebWr9QGOl/SpZj3LB88Wkpg62t+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749663557; c=relaxed/simple;
	bh=LlHYbLKuc5Dpf3SM1B0yZBldrX/STWRuRqFEHSQ1DwU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eeuvKFzAzrBfDG7gGYWQrpSnVE6fk4yK1EGfLpjblQqMMwvJwhkCLpFCOYUKursQld2ORVxEPNzYjYx/xZo06xG+3gzrvkAjkeV95NSzca+YRPKKP7amo/rxp7UOZwTTnZxb75/kFBi+0/BkRBQxu0pNPUajR1dqHRI6qQrEYSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=atIALvka; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atIALvka"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749663555; x=1781199555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LlHYbLKuc5Dpf3SM1B0yZBldrX/STWRuRqFEHSQ1DwU=;
  b=atIALvkaAOci9pig5Lvx66kqLwSmNbMhz3kRxTr7vstnRqbCyzVR397g
   Thp/FAUYoyPKLhit/0iOy4p14NBEij7IruZa9+mJM3ngVlLFClJWln5C1
   weigpBIDx4BmnSipusTPQxNICGbPjNehmdpIZ8uxDDUg94nEOZevVjQAT
   IxAEfYS2Fdj0zXJlbCYAaF+Jsu7hQp7Utd5xH0qYVuf1aqLHMS5d6kow1
   W98Hi5vaPzfEVTjYwxkZoGyskWiy/UQ8GxlFOCZaENCHD4bTH/7W6Bld4
   QuioKQL8RDj4HwDFUOqsPD4j5Ly0JRjeAjbUaSZVZjFzceOUg+DaS6/J5
   A==;
X-CSE-ConnectionGUID: 67sATo0VR2669mDi214y7w==
X-CSE-MsgGUID: fTd3T5ZRRjitwXnw/Rr69Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="39434586"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="39434586"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 10:39:14 -0700
X-CSE-ConnectionGUID: 9Uc40EKdQsyVc+VTo4+sjA==
X-CSE-MsgGUID: bcsE+wHqSjSwvfuQzANkLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="147164788"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Jun 2025 10:39:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPPPr-000Ak6-2T;
	Wed, 11 Jun 2025 17:39:11 +0000
Date: Thu, 12 Jun 2025 01:38:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, chenrenhui <chenrenhui1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2954/2954] ipc/fast_ipc.c:249:18: warning:
 variable 'pending_signals' set but not used
Message-ID: <202506120113.Q1CFi903-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   90ff3e07cc268a8e40bd578dcc4907a3db419c52
commit: 1fc14d09b9f01b271181b25cc434d200e220c4d3 [2954/2954] ipc: add fast_ipc module to enable fast process switching
config: arm64-randconfig-r133-20250610 (https://download.01.org/0day-ci/archive/20250612/202506120113.Q1CFi903-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250612/202506120113.Q1CFi903-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506120113.Q1CFi903-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ipc/fast_ipc.c: In function 'fast_ipc_wait_call':
>> ipc/fast_ipc.c:249:18: warning: variable 'pending_signals' set but not used [-Wunused-but-set-variable]
     249 |         sigset_t pending_signals;
         |                  ^~~~~~~~~~~~~~~


vim +/pending_signals +249 ipc/fast_ipc.c

   244	
   245	long fast_ipc_wait_call(struct fast_ipc_bind_info *bind_info,
   246			struct task_struct *tsk)
   247	{
   248		long ret = 0;
 > 249		sigset_t pending_signals;
   250	
   251		for (;;) {
   252			set_current_state(TASK_INTERRUPTIBLE);
   253			if (bind_info->is_calling)
   254				break;
   255	
   256			if (bind_info->server_need_exit) {
   257				ret = -ENODEV;
   258				break;
   259			}
   260	
   261			schedule();
   262	
   263			if (signal_pending_state(TASK_INTERRUPTIBLE, tsk)
   264				&& !bind_info->is_calling) {
   265				if (fatal_signal_pending(tsk)) {
   266					pr_err("[CPU/%d][%s/%d] current task has SIGKILL\n",
   267						   smp_processor_id(), tsk->comm, tsk->pid);
   268				}
   269	
   270				pending_signals = current->pending.signal;
   271				ret = -ERESTARTSYS;
   272				break;
   273			}
   274		}
   275	
   276		set_current_state(TASK_RUNNING);
   277		return ret;
   278	}
   279	EXPORT_SYMBOL_GPL(fast_ipc_wait_call);
   280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
