Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7E9265CD0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 08:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422179; cv=none; b=uj0WGb5aZRH5I0vna9EASruTuzMxfTf8T2CLuq3lliEXjKwod1+Qi8cfNYTVdslOyIiqzBqFRLDEh0HTXR9qWsFPeRLRy+Leba40WRQlQUbEmSaFWqkyVkr5ftNOETkMsz1aIhDaXlkKdG4yu504qAwT7bx8UmXgfFQKJGV00SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422179; c=relaxed/simple;
	bh=ruYXKagm6lunE9XSqaPgZ2qc3kneYFDjs6tZWGM4HEs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iheheAtX+1I8hHUcqoKdlrgi70zr5mWDTKQOnOMpvzMwgcV1lNc7kyGCEIgj2orGDrh/QyXt1TCcgfhJ5tXHoaCSS/rJA60WqwU165PS9G/sdMr2Il4gy+NU6YotYx7CcgySx6rfvLukJldxvogATQ1A3i8kj8PdOknGFwD6fkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZU7hIkEX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZU7hIkEX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748422177; x=1779958177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ruYXKagm6lunE9XSqaPgZ2qc3kneYFDjs6tZWGM4HEs=;
  b=ZU7hIkEXmuLAXxkkt2sF6xNJlOJ3DurFp9mXK1plEfSJvAIMURZClC2y
   4DU2Co3SDBQYu/F1MXsTdl6EHZnSlDrT9Z8HMd3Q9CZpzRJLEjposLc0B
   ktq8axQuWsgaB/sAvvv72qxLTDjZ9tKyY2SBamTnfQm3vSCSQAHROR4EC
   Z5Hn11ZyyXsSrOmvqJnqJgQwQQ/a692yX3ag+KkKtB3AH8eAvtQclyaWt
   mUwhask6MysejmtUgRoYa+4bHwZrfBgqr0CBDuQkMl1mYlNdUMLHHG/tW
   x1UiyyfIfI13gL+1F/8ylc5cTAR1hWuMomcb8khyDQyIZdOTVgEWkkSCH
   w==;
X-CSE-ConnectionGUID: YQ03V+19Qua/ij7Op5D5lQ==
X-CSE-MsgGUID: UZaEU/eiQMWvWwBXAOfrSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61493281"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="61493281"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 01:49:36 -0700
X-CSE-ConnectionGUID: RRh52bDkSaKPelURSforFQ==
X-CSE-MsgGUID: 08VPtfNsSOW2ZfPc5KRWAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="174069044"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 May 2025 01:49:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKCTd-000VSq-0p;
	Wed, 28 May 2025 08:49:33 +0000
Date: Wed, 28 May 2025 16:49:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2320/2320] kernel/cgroup/cpuset.c:5231:26:
 warning: no previous prototype for 'bpf_cpumask_weight'
Message-ID: <202505281622.nxl9aDmY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9a55d4a78730623072ee5a82518e7c094296b8b6
commit: cb2b3e306ed2549685a2456e484abc8c30618411 [2320/2320] bpf: Add bpf_cpumask_weight() kfunc
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250528/202505281622.nxl9aDmY-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505281622.nxl9aDmY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505281622.nxl9aDmY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/cgroup/cpuset.c:5224:28: warning: no previous prototype for 'bpf_cpuset_from_task' [-Wmissing-prototypes]
    5224 | __bpf_kfunc struct cpuset *bpf_cpuset_from_task(struct task_struct *task)
         |                            ^~~~~~~~~~~~~~~~~~~~
>> kernel/cgroup/cpuset.c:5231:26: warning: no previous prototype for 'bpf_cpumask_weight' [-Wmissing-prototypes]
    5231 | __bpf_kfunc unsigned int bpf_cpumask_weight(struct cpumask *pmask)
         |                          ^~~~~~~~~~~~~~~~~~


vim +/bpf_cpumask_weight +5231 kernel/cgroup/cpuset.c

  5230	
> 5231	__bpf_kfunc unsigned int bpf_cpumask_weight(struct cpumask *pmask)
  5232	{
  5233		return cpumask_weight(pmask);
  5234	}
  5235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
