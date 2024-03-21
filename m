Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4002779C8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Mar 2024 21:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711055167; cv=none; b=FsAwGFH0R5LIFcwCqhDcuyodm7h68cSAjpFfmhuB54taZOnLbAqhoSAf64+zSpnDQXjOl4GzUvrcG50Mi56rdDEycY7WjpomzuJPrUIOYE6F3EMSdyD6rHSoux9Vtt4cnq1sgrCLvE4McYciSLF1ReNOycRQs+1JFWsyQ35lYLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711055167; c=relaxed/simple;
	bh=2aOBW9udkrif+RpkZk/nUi/Ol9PKf1HncvzmbeFJvRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e0s/Z67ymswmn13zLK3EzMH5TzoS3BIDfonouaAF6qS3nCcRaOgvqEel52pZwCgrYu0rcnxfDrovz63AvgKrGK1Av09ijNOsqC268uCTpjOAnCQ7M/DFVOzbzDy6Xj759sPpdZAsI77MXweAuSIgSv3MMu5L2/ARWiasqeWVBGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FKVzn+uF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKVzn+uF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711055164; x=1742591164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2aOBW9udkrif+RpkZk/nUi/Ol9PKf1HncvzmbeFJvRQ=;
  b=FKVzn+uF2QTAV4w8Qimv+dQfbZoOVwZPDQYDFXQC7bowOE4a1aZ2ZzOx
   ezik/ePCZ3sHHVAMeVk3QBmwnHPEYwk0Sx1F9S8tCXOV+Rt4IoB3YHuxC
   XlmiX4ODtZIGxs0wIc+obDhVSW/gXqs9K93Yal46U0LQftfBOU8SyIbrG
   /E7Yipe3m9yax5FMsv9x7UFt90Ym+ClY0LzFZRRoE5ALy6NqPBS9eRuUB
   JIvaOF0Ey/tb7QBisr2Yd2f3y7F0qdUk7aEDM0SGBhoYO/iNHhCeIUJZo
   JLmL+168thsNoizzRW8oEn3yjwPS0ht4g4fHgvLNIOSEjR9JwBUAfOsvQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5938118"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="5938118"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 14:06:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="19366184"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Mar 2024 14:06:01 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnPbq-000JmF-2K;
	Thu, 21 Mar 2024 21:05:58 +0000
Date: Fri, 22 Mar 2024 05:05:23 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gregory.price@memverge.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry.memverge@gmail.com>
Subject: [gmprice:sys_move_phys_pages_2024_3_14 2/3] mm/migrate.c:2204:47:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202403220414.P4WFkXxN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gmprice/linux sys_move_phys_pages_2024_3_14
head:   18bc4aaa72396bf7409348958ba2bb3fad2d88c1
commit: 2727276faa0c537ef9df039aea1d6e7cb264e0db [2/3] mm/migrate: Create move_phys_pages syscall
config: x86_64-randconfig-123-20240321 (https://download.01.org/0day-ci/archive/20240322/202403220414.P4WFkXxN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240322/202403220414.P4WFkXxN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403220414.P4WFkXxN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/migrate.c:2204:47: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *owner @@     got struct task_struct [noderef] __rcu *owner @@
   mm/migrate.c:2204:47: sparse:     expected struct task_struct *owner
   mm/migrate.c:2204:47: sparse:     got struct task_struct [noderef] __rcu *owner
   mm/migrate.c:328:20: sparse: sparse: context imbalance in 'migration_entry_wait' - unexpected unlock
   mm/migrate.c:798:9: sparse: sparse: context imbalance in '__buffer_migrate_folio' - different lock contexts for basic block

vim +2204 mm/migrate.c

  2191	
  2192	/*
  2193	 * Walks each vma mapping a given page and determines if those
  2194	 * vma's are both migratable, and that the target node is within
  2195	 * the allowed cpuset of the owning task.
  2196	 */
  2197	static bool phys_page_migratable(struct folio *folio,
  2198					 struct vm_area_struct *vma,
  2199					 unsigned long address,
  2200					 void *arg)
  2201	{
  2202		struct rmap_page_ctxt *ctxt = arg;
  2203	#ifdef CONFIG_MEMCG
> 2204		struct task_struct *owner = vma->vm_mm->owner;
  2205		nodemask_t task_nodes = cpuset_mems_allowed(owner);
  2206	#else
  2207		nodemask_t task_nodes = node_possible_map;
  2208	#endif
  2209	
  2210		ctxt->found = true;
  2211		ctxt->migratable &= vma_migratable(vma);
  2212		ctxt->node_allowed &= node_isset(ctxt->node, task_nodes);
  2213	
  2214		return ctxt->migratable && ctxt->node_allowed;
  2215	}
  2216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
