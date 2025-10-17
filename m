Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D64334693
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 08:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760688748; cv=none; b=fiUeKjff54jIEdglKBbYB7AQtMAfe56jEW+HgjQUERTgNshSPfrY7D/FIJOS90rPyEeVDQQkCfINFTz9EWqm/ht631EOmDmuwFjl58ZshdHbfnfaRWeARUvRsCbeZ5AHGkCh0CqCxbrn8cLc+XCPRAqxmADfgAjEaMLp0A7UKeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760688748; c=relaxed/simple;
	bh=fjnbGIobN/xolDVVa5CEMSA16EIXKsbffFytcm349hQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F97UtNQkunBD7hBZOGQ9U6Zkf3xjxZfujbzl5mFIG4fMEjU64Rsk2HLl6kRQpdNh+PfaXxw6dQ8AuxdAW80aYe7jX741sZvKRrd2x+lPlLqJNAl16gAbzduFxSGiq7swe5B6EHy+LAH+xShW2Kdagp1DwtIWaprGjsKWGtCq1Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0U6BJmp; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0U6BJmp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760688746; x=1792224746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fjnbGIobN/xolDVVa5CEMSA16EIXKsbffFytcm349hQ=;
  b=R0U6BJmpQ0cB0dJO38AGMy/1vZUbU1KjQtAzV9XlhZaK4aiHH0AB1jP2
   IXqVp0qiWlA2rSBPCVmc5QiMGZZoE4bhYfeUIft9RH4AHKubVbm/LKQgv
   6FgOwXckT3gcXg36yh/fqzxMEJuYZAOgnUsagw3fPOYHjbrfeKqd+FML2
   8BmtSAK0RHFDwv0NCQbLvIdqZ3usU4V2g+mJ3eLiBnfLbOgWAE0DJNJQX
   +cEsM1eSv/PeHwMHznYCteD3LVgc8ANWcsEz6OjDPK6oZ+gryLrvLxv1k
   pXafKBB7R24MhdLDoHMnbFWEq8p1iRBL3wDmwWZ9Hc0sV/nBo0q8/JZef
   g==;
X-CSE-ConnectionGUID: upB6R0ZdRAqJljfeS/OpKQ==
X-CSE-MsgGUID: QV6sN56TQEuF7YfxOrAqEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62985319"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="62985319"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 01:12:25 -0700
X-CSE-ConnectionGUID: yoykjBTZTyie397u/wNPJg==
X-CSE-MsgGUID: Qsa2hYszQWuWY7AFyT80ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="206384961"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 17 Oct 2025 01:12:24 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9fZV-0005jd-37;
	Fri, 17 Oct 2025 08:12:21 +0000
Date: Fri, 17 Oct 2025 16:11:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Yu <serein.chengyu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3238/3238] arch/arm64/kernel/topology.c:369:5:
 warning: no previous prototype for 'is_sibling_idle'
Message-ID: <202510171614.CbuynB0r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   8d2412bb9958a209d2d0344ea1b88dd633699677
commit: 693a9b432a9de18f51bb572c83082c525458d3fc [3238/3238] sched: More flexible use of CPU quota when CPU is idle
config: arm64-randconfig-003-20251017 (https://download.01.org/0day-ci/archive/20251017/202510171614.CbuynB0r-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510171614.CbuynB0r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510171614.CbuynB0r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/topology.c:369:5: warning: no previous prototype for 'is_sibling_idle' [-Wmissing-prototypes]
     369 | int is_sibling_idle(void)
         |     ^~~~~~~~~~~~~~~
--
   kernel/sched/fair.c: In function 'select_task_rq_fair':
   kernel/sched/fair.c:8277:23: warning: variable 'time' set but not used [-Wunused-but-set-variable]
    8277 |         unsigned long time;
         |                       ^~~~
   kernel/sched/fair.c: In function 'pick_next_task_fair':
   kernel/sched/fair.c:9278:23: warning: variable 'time' set but not used [-Wunused-but-set-variable]
    9278 |         unsigned long time;
         |                       ^~~~
   kernel/sched/fair.c: At top level:
>> kernel/sched/fair.c:14428:12: warning: no previous prototype for 'is_sibling_idle' [-Wmissing-prototypes]
   14428 | int __weak is_sibling_idle(void)
         |            ^~~~~~~~~~~~~~~


vim +/is_sibling_idle +369 arch/arm64/kernel/topology.c

   368	
 > 369	int is_sibling_idle(void)
   370	{
   371		return this_cpu_read(sibling_idle);
   372	}
   373	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
