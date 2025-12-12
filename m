Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3B321D3E4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 21:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765575876; cv=none; b=AkkEJvbIoSxOrl4xs2a5eDIdHURzqMtir6SVg1aO4YMjdhDx7N3RH/pN+ik1tvrLDjE3upZB2i80ae3AMDI0Z2lylOji6YgC6eFvzn++oWsLGQpy0fFsuMGynhmQX3WJbTuK7GLAG4urgQjWKuYP9q9oDl6VUc72hxGjY6/YubY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765575876; c=relaxed/simple;
	bh=Q4SncV2aZQLmnSpW0tkJMN2HWg1sp/Ihh5HMjXJGgxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eIIfoaR3t9bDNwe4rTWNiGeNglXm/7f9dRPAagJlAB3IIGt3U60fq++WfouBhQKFHRgD7Ji9DLyXGA+659T+Xd/+7ghFrzu/0hq9IX5aSY2C7NpPLNmdmd8R+wUsitucs82DJZZa3TBDz+54wK1M+pWRScHpbAFSOFd+yrOIIS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dfQ7hMje; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dfQ7hMje"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765575874; x=1797111874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q4SncV2aZQLmnSpW0tkJMN2HWg1sp/Ihh5HMjXJGgxQ=;
  b=dfQ7hMjegYKsKhgK9Tqetq3jkRg6SlBjW+UODatRKD4z7vxEHLg9gf/y
   AbaRRM9InMGKT3pswy+AmAWDdd6yey+EUg8LkKSumMEOs3lHRUWsd0u5q
   Dc27JcLvW+qi8cwvpaXB6klw80GChrTHUJyR3kn9LmP2chjbPEky/gYE6
   RNKOSS2riTly6v4P8Ft7VP2b1Kx24vu721aMJpWjlw2OX4mRyt7Cy959w
   DviZxrL2TYrUp0tbstQCIr6X8yrlU16Jdu/nvo+JYhYrZQ9sR2T1U2VrP
   GWOkPKm0rZY/9vfAsEaLwGIjmbCp/i5BBFzzM1idTc4IX7+pasBmhwRp1
   A==;
X-CSE-ConnectionGUID: wEkIdQT+SK+eg8J4d5mxuQ==
X-CSE-MsgGUID: T8e1rQrAQomxQFkqHuRzHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67542578"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="67542578"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 13:44:33 -0800
X-CSE-ConnectionGUID: CqrHhLIeQAi9L77MsXkrhQ==
X-CSE-MsgGUID: imztlkn4QeObabghV3AIKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="227853367"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Dec 2025 13:44:32 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUAw9-000000006ez-3u6a;
	Fri, 12 Dec 2025 21:44:29 +0000
Date: Sat, 13 Dec 2025 05:44:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1]
 kernel/power/energy_model.c:135:19: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202512130518.mEUIAZfC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5580efd2c7e4791254a0c26f9791aaa33dd70484
commit: 4c863dbb80141ba881866c8a8bad6f44105df9b3 [0/1] UPSTREAM: PM: EM: Add functions for memory allocations for new EM tables
config: x86_64-randconfig-121-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130518.mEUIAZfC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130518.mEUIAZfC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130518.mEUIAZfC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/power/energy_model.c:113:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct em_perf_table [noderef] __rcu *table @@     got struct em_perf_table * @@
   kernel/power/energy_model.c:113:15: sparse:     expected struct em_perf_table [noderef] __rcu *table
   kernel/power/energy_model.c:113:15: sparse:     got struct em_perf_table *
   kernel/power/energy_model.c:114:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct em_perf_table [noderef] __rcu *table @@
   kernel/power/energy_model.c:114:15: sparse:     expected void const *objp
   kernel/power/energy_model.c:114:15: sparse:     got struct em_perf_table [noderef] __rcu *table
   kernel/power/energy_model.c:122:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct em_perf_table [noderef] __rcu *table @@     got struct em_perf_table * @@
   kernel/power/energy_model.c:122:15: sparse:     expected struct em_perf_table [noderef] __rcu *table
   kernel/power/energy_model.c:122:15: sparse:     got struct em_perf_table *
   kernel/power/energy_model.c:124:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct callback_head *head @@     got struct callback_head [noderef] __rcu * @@
   kernel/power/energy_model.c:124:19: sparse:     expected struct callback_head *head
   kernel/power/energy_model.c:124:19: sparse:     got struct callback_head [noderef] __rcu *
>> kernel/power/energy_model.c:135:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct kref *kref @@     got struct kref [noderef] __rcu * @@
   kernel/power/energy_model.c:135:19: sparse:     expected struct kref *kref
   kernel/power/energy_model.c:135:19: sparse:     got struct kref [noderef] __rcu *
   kernel/power/energy_model.c:153:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct em_perf_table [noderef] __rcu *table @@     got void * @@
   kernel/power/energy_model.c:153:15: sparse:     expected struct em_perf_table [noderef] __rcu *table
   kernel/power/energy_model.c:153:15: sparse:     got void *
   kernel/power/energy_model.c:157:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct kref *kref @@     got struct kref [noderef] __rcu * @@
   kernel/power/energy_model.c:157:20: sparse:     expected struct kref *kref
   kernel/power/energy_model.c:157:20: sparse:     got struct kref [noderef] __rcu *
   kernel/power/energy_model.c:223:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:223:9: sparse:     expected void const *
   kernel/power/energy_model.c:223:9: sparse:     got struct em_perf_state [noderef] __rcu *
   kernel/power/energy_model.c:223:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:223:9: sparse:     expected void const *
   kernel/power/energy_model.c:223:9: sparse:     got struct em_perf_state [noderef] __rcu *
   kernel/power/energy_model.c:223:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *p @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:223:9: sparse:     expected void *p
   kernel/power/energy_model.c:223:9: sparse:     got struct em_perf_state [noderef] __rcu *

vim +135 kernel/power/energy_model.c

   126	
   127	/**
   128	 * em_table_free() - Handles safe free of the EM table when needed
   129	 * @table : EM table which is going to be freed
   130	 *
   131	 * No return values.
   132	 */
   133	void em_table_free(struct em_perf_table __rcu *table)
   134	{
 > 135		kref_put(&table->kref, em_release_table_kref);
   136	}
   137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
