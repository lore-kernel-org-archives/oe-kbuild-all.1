Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF5133F5A5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 03:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792381473; cv=none; b=IK2GPAi+0TznSITdy6e901CqUSlDN4gvEj3ybm+CLcfqAw2V6CupHYNRjg26sA3lkEs8NUTgXewJd/EyEQpIOOtFQeg3KM18Nt8+NHMuyLQfIxmb32CXGpPFLXCpf0xC5Wo4JHj6NVmKzvb/XMSqhK0Rg2J4/0nRn4OUAu3qwDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792381473; c=relaxed/simple;
	bh=PayGBNt0fq1jajSuMonqkFmlhlPDi21DrRcTGxeaEtk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MLTjQ+CUj8CYVMmuN2J3e0wVEa8cc1xBnc40F6ET+BWn9vrIevwtgNiMo5MydUHZS8h+Qkzrnw2dRNy+lxzW7J0/mNFu2acCmJCOfucrtSj0gIwA/2qDnNHgXB7UJra8/jDkphuH9GZjj5pbMer9HmnzLVqp3RhNoKoCtxtKQtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TyfwbR9E; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TyfwbR9E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792381472; x=1823917472;
  h=date:from:to:cc:subject:message-id;
  bh=PayGBNt0fq1jajSuMonqkFmlhlPDi21DrRcTGxeaEtk=;
  b=TyfwbR9EsKQwKKrDJyutUDZ3NT4cD8sryJWIfxD92ZTVuCReFOmxYe/o
   3AaNWZVCrhQo+Y0i8BEOytvzB78PTgtWhkWcVFgHngnseKheQ8lyUL9qb
   85Gh4GlnfxMnUwWYEkiqCChp64BCVYGLMAx081rAvon/ybp7CdZRb3L3T
   njlIz6lTeXIQwXU/7ChVNZVM0lx1fl+nrFNlXt+SdHO+2+iopyNmLzCXI
   tu07a5CYtsJbMtyM44Vnkhyn00PvNLmH/3RaazvN6pQgzmI8JoncM4hgr
   KMga+ce4pz7kv3omPAlqvnXMAcoMYESLw2sU2cOCg19f//nd4VeFR2f6w
   A==;
X-CSE-ConnectionGUID: q/pKJ+yrRkaTtlQTylb9Ow==
X-CSE-MsgGUID: mbl2a+w3RN2b8gJ2pVbC0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="946349"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="946349"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 20:44:31 -0700
X-CSE-ConnectionGUID: 0dT+YPskS1qr/gCf3bo3rw==
X-CSE-MsgGUID: iFMQ1XzyRJCHUnxZFcT+rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2801440"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 18 Oct 2026 20:44:31 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIeIV-000000005Sb-45rR;
	Mon, 19 Oct 2026 03:44:27 +0000
Date: Mon, 19 Oct 2026 05:44:07 +0200
From: kernel test robot <lkp@intel.com>
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/managed_nodes/rfc6-numa 29/47]
 mm/page-writeback.c:322:14: sparse: sparse: unsigned value that used to be
 signed checked against zero?
Message-ID: <202610190502.r5fOtco0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/rfc6-numa
head:   ad25e75667a4391ac566927c41f6e88f60ecff50
commit: 4a6dd59bd5f785c70f3f118501996645d770c8ed [29/47] mm/page-writeback: exclude private free memory from dirtyable memory
config: arc-randconfig-r2307-20261019 (https://download.01.org/0day-ci/archive/20261019/202610190502.r5fOtco0-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610190502.r5fOtco0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610190502.r5fOtco0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/page-writeback.c:322:14: sparse: sparse: unsigned value that used to be signed checked against zero?
   mm/page-writeback.c:336:20: sparse: signed value source

vim +322 mm/page-writeback.c

   309	
   310	/**
   311	 * global_dirtyable_memory - number of globally dirtyable pages
   312	 *
   313	 * Return: the global number of pages potentially available for dirty
   314	 * page cache.  This is the base value for the global dirty limits.
   315	 */
   316	static unsigned long global_dirtyable_memory(void)
   317	{
   318		unsigned long x;
   319	
   320		x = global_zone_page_state(NR_FREE_PAGES);
   321		/* Free private memory cannot hold dirty-accounted page cache. */
 > 322		x -= min(x, private_free_pages());
   323		/*
   324		 * Pages reserved for the kernel should not be considered
   325		 * dirtyable, to prevent a situation where reclaim has to
   326		 * clean pages in order to balance the zones.
   327		 */
   328		x -= min(x, totalreserve_pages);
   329	
   330		x += global_node_page_state(NR_INACTIVE_FILE);
   331		x += global_node_page_state(NR_ACTIVE_FILE);
   332	
   333		if (!vm_highmem_is_dirtyable)
   334			x -= highmem_dirtyable_memory(x);
   335	
   336		return x + 1;	/* Ensure that we never return 0 */
   337	}
   338	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
