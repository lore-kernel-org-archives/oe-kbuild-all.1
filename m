Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C4413473A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 17:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706202054; cv=none; b=p097yC1p3a2aVNAldPvcmdD+79uhnweqcWed4SR4uhHKM/NFNzK4qPaNxcQOz1TETef1DQNI4Uz15tymz3c2vf7ESEzoX1iIpeLr8GAHcJKcPz9nGI8Otr4RoyG2gltK1c4mvHWVm78rhHapOT/E9yxmHWLjk364G8K5uc9r5vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706202054; c=relaxed/simple;
	bh=cqtzmHL6OXvgj9LEfw+W+XmiiKXpaoGtgO2h5i3V9Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=frTaMqbqdEuiVI0SWUL0xRchEefiKAJOah9pvhHgPfz+mVuIa6nNVH/0ezFwq/ZBtHhQl8eLNgjMigUJxM4rptqA2gTvlGmO+LUFMqT0oLff4At4JMnVh23YMqvDtxhu0btXGzbhGRxsVe/Ywh8Tc7jA0psKi0e7uj/WM+9DJr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mScwImwh; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mScwImwh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706202052; x=1737738052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cqtzmHL6OXvgj9LEfw+W+XmiiKXpaoGtgO2h5i3V9Tc=;
  b=mScwImwh6iXWtjGwahvqxpgPO0i5EbEIJ3qGLXGuC4RWbf9x6hNCezpR
   8GWoF7Ae83wnkSTNyHlW/uMm7mlCkI8tqy9yYjL1VQyyW4pxGKK6bkI74
   KLIMbnWZacw4mM2MRaWXjslUjVEcPpPWjDIrop0AtHFVibT29JRAby+q4
   12eDb0a2xLCuurfgCGiFyVfPlD6UKMeTJhkOl4oOrOcIdkDtV8EvxAso8
   wNepuOBgEFkbrhmlIjtbrZ91+zGVKKlUr+K+TBdH5uwN9GY4Lav4JA0Qd
   +OwI+uzAipgRQ6myao/I85y5BoVaHhpnBCjqeKyKlxJBhgmARQ9DPzUl3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2068907"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2068907"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 09:00:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="35162433"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Jan 2024 09:00:05 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rT358-0000Dc-1K;
	Thu, 25 Jan 2024 17:00:02 +0000
Date: Fri, 26 Jan 2024 00:59:29 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Shi <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:schedtest2 11/12] kernel/sched/fair.c:9744:12: error:
 expected '(' before '!' token
Message-ID: <202401260029.d5ycMdk8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git schedtest2
head:   326c08b860db40ad088d64cbca38afdccc196410
commit: 0436efe9a058218c483c6d296083253e871a391e [11/12] sched/fair: pack SD_ASYM_PACKING into sched_use_asym_prio
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240126/202401260029.d5ycMdk8-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401260029.d5ycMdk8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401260029.d5ycMdk8-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'sched_use_asym_prio':
>> kernel/sched/fair.c:9744:12: error: expected '(' before '!' token
    9744 |         if !(sd->flags & SD_ASYM_PACKING)
         |            ^
         |            (
   kernel/sched/fair.c:9744:12: warning: statement with no effect [-Wunused-value]
    9744 |         if !(sd->flags & SD_ASYM_PACKING)
         |            ^~~~~~~~~~~~~
>> kernel/sched/fair.c:9744:42: error: expected ';' before 'return'
    9744 |         if !(sd->flags & SD_ASYM_PACKING)
         |                                          ^
         |                                          ;
    9745 |                 return false;
         |                 ~~~~~~                    


vim +9744 kernel/sched/fair.c

  9730	
  9731	/**
  9732	 * sched_use_asym_prio - Check whether asym_packing priority must be used
  9733	 * @sd:		The scheduling domain of the load balancing
  9734	 * @cpu:	A CPU
  9735	 *
  9736	 * Always use CPU priority when balancing load between SMT siblings. When
  9737	 * balancing load between cores, it is not sufficient that @cpu is idle. Only
  9738	 * use CPU priority if the whole core is idle.
  9739	 *
  9740	 * Returns: True if the priority of @cpu must be followed. False otherwise.
  9741	 */
  9742	static bool sched_use_asym_prio(struct sched_domain *sd, int cpu)
  9743	{
> 9744		if !(sd->flags & SD_ASYM_PACKING)
  9745			return false;
  9746	
  9747		return (!sched_smt_active()) ||
  9748			(sd->flags & SD_SHARE_CPUCAPACITY) || is_core_idle(cpu);
  9749	}
  9750	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
