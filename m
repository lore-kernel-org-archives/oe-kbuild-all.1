Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B3339AFC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Feb 2024 12:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707740473; cv=none; b=PDjRron/sAGuJ+2HWsDgvTqOLvhDWLK5SJelynYs4pQCHslWvL4Wt3dEkhJg+UTHpLfvEWDlbySeZvN4rJY0iKbQcgrmRq/HNk+BmG058XN32UF7MFXRYwpvnD605uWu+DdLl0Vxe6ehpZBG9z0mFGwZiznikGDvrogOjUCPl3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707740473; c=relaxed/simple;
	bh=EqRSx4arArHqCJq3JYeQDEnG4ZNsTMfLl46Jh3FHV4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZYGMh0/WlcH2pbCDMt3ctdgDky5wxrqdcZEoPQJVtNgCWJvsGzaH3aV7jbhvT81P0e36hi0Bu123jVz2VMgXPyOKtiEhelLCWTI0jeM/MoBcpYTNO5Ym3vM3RDRQcjesiblayf8rAdnruexdLAK0lGUeBB1ci4Y3D+4Dxw3l6Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GodMRKmI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GodMRKmI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707740471; x=1739276471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EqRSx4arArHqCJq3JYeQDEnG4ZNsTMfLl46Jh3FHV4Q=;
  b=GodMRKmIGM+pk1GPE/foJBdL1e/m+N+SDJZDzLlFIuI2p0qGML34Hufm
   yC+ESZyfkO/LXDMcIfIi67f2BO3Qv4WE/yGe8N5daynm8Is1gkq4xXUeI
   1uq2+u3+BtzUtRXeBppc87MqlgIyj06dQrLTnKrWi58a5oKJTVJUxDL0X
   cl2J1l9N4STcusS7n2xPQGblTYChlQqKQX0ypZ0goak7lRFcplF1CXdMy
   ZbaSDNg1nM8cUMMURnz+X3OiWKOEYh541edH35uYPdsLfCFGr03CLdRQV
   XaSx+E19pmqJZQneaV9aeW0EPSh4nSMpaUHkhIbYbRcyfadUelPnF3CqF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="2058755"
X-IronPort-AV: E=Sophos;i="6.06,263,1705392000"; 
   d="scan'208";a="2058755"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 04:21:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,263,1705392000"; 
   d="scan'208";a="2542408"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Feb 2024 04:21:09 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZVJ4-00077e-1r;
	Mon, 12 Feb 2024 12:21:06 +0000
Date: Mon, 12 Feb 2024 20:20:54 +0800
From: kernel test robot <lkp@intel.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>
Subject: [linux-next:master 4686/6082] kernel/power/energy_model.c:135:19:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202402122047.yDhRZmM4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ae00c445390b349e070a64dc62f08aa878db7248
commit: ffcf9bce7af02a21fb73738999de1e3d4fde5aca [4686/6082] PM: EM: Add functions for memory allocations for new EM tables
config: x86_64-randconfig-122-20240211 (https://download.01.org/0day-ci/archive/20240212/202402122047.yDhRZmM4-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240212/202402122047.yDhRZmM4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402122047.yDhRZmM4-lkp@intel.com/

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
