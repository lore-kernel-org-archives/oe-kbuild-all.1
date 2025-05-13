Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7091A4E70
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 02:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747102197; cv=none; b=UXD4ZIpy5PBY8JLq5J/6gtQhp5I7qbs/qf4OsyPdSVTuWntMMCdWqOZyf/DvtOBRhVdyGVCedYcMpW2+9MGcfYrvFv88BUj+ikNBak8u58CqrmrC3wfC6XuGJyENcEXj/y1PFA0vEUK0CCZC4VuwSOXzWa5TqI0uEVjBR/ktpwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747102197; c=relaxed/simple;
	bh=TYkUstq3UUzmZ+M8bxoXrV0PJaSCeQeQfpgNfb4hqW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tCVhELBhUvKOTs3FHAnXBwVlxeKWzMEMVtCq1nYnDsZtRpQ/oDbdG2mUsQHFawH5fFhqTKyWnVDoIdPmgKSvhQj0tS6y1kqqKQbzttLsrB1K/wybm3rST0FVs/msvt3T8MatvKDXTbXVUL0q2g0YKs53WsU+St4WMPXQHwM/75o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IPr0UcV1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IPr0UcV1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747102195; x=1778638195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TYkUstq3UUzmZ+M8bxoXrV0PJaSCeQeQfpgNfb4hqW4=;
  b=IPr0UcV1+TCmEynwpRuRDqIuDq3u8QvI5xxQX8dCqF/V0gjllgrs87hr
   w9zaX9mYjXwY7eK2NQAOUCysWC7zP2Pi228vInBr50KZuwjJRo08GDObd
   YKcBeG8quKgF4nOD55cbuvdqnKx5JqGpCnUs16KGFJQLiE2SgyogS/Y9s
   sD0znS27MhIcm8ZfEW2o57N0T8g79CV1RNLfUgk1sF2mVU8F9n9L6l+N6
   iitsLh/DAapbmOh+XwS7nMhrpgHkpfwGnY28I8FPbf25qU2S8zLasSezM
   BPe+hQ+L+5Fx16+aeD2o4KFoKN6THhCzENkemcEEGn5pdjuJt1R/QWtnp
   A==;
X-CSE-ConnectionGUID: 7oS1yOffR6mCCUKC0vtkUg==
X-CSE-MsgGUID: j12MQdF7QPeylDLZtlPWqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59929221"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="59929221"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 19:09:53 -0700
X-CSE-ConnectionGUID: 92r4J0XOQ/2zRv5DHX9a/Q==
X-CSE-MsgGUID: Ih/9LsOQS9OQWt4Ynv4P2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="168642029"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 May 2025 19:09:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEf5Z-000Fad-2w;
	Tue, 13 May 2025 02:09:49 +0000
Date: Tue, 13 May 2025 10:09:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2220/2220] mm/page_cache_limit.c:35:5: sparse:
 sparse: symbol 'cache_reclaim_enable_handler' was not declared. Should it be
 static?
Message-ID: <202505130948.VRZsdeDC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e1106320058bf1d983657f80490249b4f919ebad
commit: 621647ce254f1d347ae9bc3d328c09cbb2732487 [2220/2220] mm: support periodical memory reclaim
config: x86_64-randconfig-123-20250513 (https://download.01.org/0day-ci/archive/20250513/202505130948.VRZsdeDC-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505130948.VRZsdeDC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505130948.VRZsdeDC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/page_cache_limit.c:35:5: sparse: sparse: symbol 'cache_reclaim_enable_handler' was not declared. Should it be static?
>> mm/page_cache_limit.c:51:5: sparse: sparse: symbol 'cache_reclaim_sysctl_handler' was not declared. Should it be static?

vim +/cache_reclaim_enable_handler +35 mm/page_cache_limit.c

    34	
  > 35	int cache_reclaim_enable_handler(struct ctl_table *table, int write,
    36				void *buffer, size_t *length, loff_t *ppos)
    37	{
    38		int ret;
    39	
    40		ret = proc_dointvec_minmax(table, write, buffer, length, ppos);
    41		if (ret || !write)
    42			return ret;
    43	
    44		if (should_periodical_reclaim())
    45			schedule_delayed_work(&shepherd, round_jiffies_relative(
    46				(unsigned long)vm_cache_reclaim_s * HZ));
    47	
    48		return 0;
    49	}
    50	
  > 51	int cache_reclaim_sysctl_handler(struct ctl_table *table, int write,
    52			void *buffer, size_t *length, loff_t *ppos)
    53	{
    54		int ret;
    55	
    56		ret = proc_dointvec_minmax(table, write, buffer, length, ppos);
    57		if (ret || !write)
    58			return ret;
    59	
    60		if (should_periodical_reclaim())
    61			mod_delayed_work(system_unbound_wq, &shepherd,
    62					round_jiffies_relative(
    63					(unsigned long)vm_cache_reclaim_s * HZ));
    64	
    65		return ret;
    66	}
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
