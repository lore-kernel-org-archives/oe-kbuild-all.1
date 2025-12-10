Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1EB311946
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 05:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765345552; cv=none; b=iEDqweozi885Nfl4HzlRVpXgswR4oZPB6XgpaUiELDr2jBidaNh8CPb+hSak2Qx9SJaW+fjU86deociGZ0lISytPUUQZtGsN4akmjYUTDG90asSTHMNlkEe9+Zizqptd0IeePRUfoKNcD/3PdPeLUzY0FzuO2FcyRPTH/DjyYJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765345552; c=relaxed/simple;
	bh=5pf2wai2UJ2C2GqYRCVZzc6TGkRgYvwWEp3K3DYYL3o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BHVm602dYSzn6kPzFcP5s6soB1xhDGwB1Kz3ltGCpJDjXfz2ncE8un4gHBy87/YfZjqDu1YZXbwbmfKh+dyOkRtUcuYFHYETs2zYOy0ENC/f4k0bEqhP0GCP+9JwD+Am4wP7vp1YjGHEaiQGzL8P/AXYTLL/Bj5t1k4JkwfGnDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JworVovp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JworVovp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765345550; x=1796881550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5pf2wai2UJ2C2GqYRCVZzc6TGkRgYvwWEp3K3DYYL3o=;
  b=JworVovpIjTsRFTZfjn3UEULPvc11UsxowcRlz92RrSS+Kn/Z4vjEhOI
   2T/ux+P8rZX1tjtzarVfw3/hkWLSDVgQuJwxORSHyZN1dy99zXFgRjTYt
   Evh8KPxGUIHmuRtzUT/UxOhwgl3WjoZxeAduAn6fnJ8DjeAe58Y6lhIGq
   oPgfVzRbQnta8kW/bIhrj4V7Ys95lqyHtqmX1YY4UwVU6CSf6sTbhMGSX
   BoWuJKWapL9astMKjlzUHUqNuPqvKUmRlDeGW4THZovqzGT+4jUM7ygI4
   GtIT11WRbbdlRJSIIuQZa8OireeTFlXtAcFLvzquXtyTZoq4y5TAz1sAW
   g==;
X-CSE-ConnectionGUID: ZrORQ2C1Rl+deL4ZIfy7jw==
X-CSE-MsgGUID: Z3B7BKzSR2GEcquTvDHntQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="78672427"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="78672427"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 21:45:47 -0800
X-CSE-ConnectionGUID: K3tMuBPxSg2Zh3soVJzZpw==
X-CSE-MsgGUID: R/Zo0s0RQXuLhdkz5vn+zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="196176431"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Dec 2025 21:45:46 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTD1D-000000002he-2YEu;
	Wed, 10 Dec 2025 05:45:43 +0000
Date: Wed, 10 Dec 2025 13:45:42 +0800
From: kernel test robot <lkp@intel.com>
To: Praveen K Paladugu <prapal@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Wei Liu <wei.liu@kernel.org>,
	Anatol Belski <anbelski@linux.microsoft.com>,
	Easwar Hariharan <easwar.hariharan@linux.microsoft.com>
Subject: drivers/hv/mshv_common.c:224:6: warning: no previous prototype for
 'hv_machine_power_off'
Message-ID: <202512101321.EaX2X9FD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c9b47175e9131118e6f221cc8fb81397d62e7c91
commit: 615a6e7d83f958e7ef3bc818e818f7c6433b4c2a mshv: Cleanly shutdown root partition with MSHV
date:   4 days ago
config: arm64-randconfig-001-20251210 (https://download.01.org/0day-ci/archive/20251210/202512101321.EaX2X9FD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512101321.EaX2X9FD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512101321.EaX2X9FD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hv/mshv_common.c:210:6: warning: no previous prototype for 'hv_sleep_notifiers_register' [-Wmissing-prototypes]
     210 | void hv_sleep_notifiers_register(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hv/mshv_common.c:224:6: warning: no previous prototype for 'hv_machine_power_off' [-Wmissing-prototypes]
     224 | void hv_machine_power_off(void)
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/hv_machine_power_off +224 drivers/hv/mshv_common.c

   219	
   220	/*
   221	 * Power off the machine by entering S5 sleep state via Hyper-V hypercall.
   222	 * This call does not return if successful.
   223	 */
 > 224	void hv_machine_power_off(void)
   225	{
   226		unsigned long flags;
   227		struct hv_input_enter_sleep_state *in;
   228	
   229		local_irq_save(flags);
   230		in = *this_cpu_ptr(hyperv_pcpu_input_arg);
   231		in->sleep_state = HV_SLEEP_STATE_S5;
   232	
   233		(void)hv_do_hypercall(HVCALL_ENTER_SLEEP_STATE, in, NULL);
   234		local_irq_restore(flags);
   235	
   236		/* should never reach here */
   237		BUG();
   238	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
