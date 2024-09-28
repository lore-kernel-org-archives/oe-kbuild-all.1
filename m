Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68056BA3D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 01:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727486342; cv=none; b=FKXZHUJNKJVjziwWb31/yydbXunO9ptJcgihnI0jI0+oXRyxMTNn5l4YFx+yPmmp2a/A8oPNlxGLNwDoBEmNTJV5kxm/903Alu2eODzjZTQHi7pTHXUeVeag/3OS+A2a6kgLTcMbvfKVMpI3wAIPwimQXHX9mHon2n7Y/SyxXCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727486342; c=relaxed/simple;
	bh=r6S2sJkRUEswTOzhHgzb0i4Y5KHR6I+xGOP5iWkW9U4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HNp468b/cBQ3poM8+dddbHVvF5luaZrXt+ar6nd8W7cjHDF6jgsDjB8azlkq3WlbmrY/Elks8hHInKYJuDcUkuXCr+dHFAaqErCQvmThsYLcLSgcHrpUri3z/+oBqhtTvcxuBdejY+ndJkPLmczGmeSdB+3jyKQmyiA7Mn6McUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X0SgLcd2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X0SgLcd2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727486337; x=1759022337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r6S2sJkRUEswTOzhHgzb0i4Y5KHR6I+xGOP5iWkW9U4=;
  b=X0SgLcd2IShbqWCNgbBYzuEe3MHC9CQYPy00v0gGxmAa4MjuuB42Mkgf
   OVC+p7jL/XeLrUB+vlCkyrppL1eikFB21UWW0BoYMpRyRBw8SF8JFZZ3A
   1Cv8ElaRP8Th3NSGtm8nVGC5O2I1XNWDqFsK1TaA4V+RDk3ljZgXfHNdU
   vPivu/R91APXeqKUe5vugyF7K7fRoAScLgKM5yACGiirAXQ7beeq1s/5Q
   Mg7VCdilG9QAVVJRuvdrETb4BC+P/Y23UTIJt3jnfy2PhPiMntd73v/qj
   OChrIOkHN86UznqDz38ufTkvsFGnBecJlS23RRLx50s2FXDau9TwaZk6y
   A==;
X-CSE-ConnectionGUID: byxhdJAZQXy27qusz3evew==
X-CSE-MsgGUID: mWoH99bNSlWbm6XkXFcRkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26821135"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26821135"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 18:18:55 -0700
X-CSE-ConnectionGUID: 9jLRGa4NQJWzVqLiVrtTlg==
X-CSE-MsgGUID: N6H5ySZ8Sv25Vmg/5faDhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72586787"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Sep 2024 18:18:54 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suM6l-000MoZ-2t;
	Sat, 28 Sep 2024 01:18:51 +0000
Date: Sat, 28 Sep 2024 09:18:45 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 6/6] cxl: Add mce notifier to emit aliased address
 for extended linear cache
Message-ID: <202409280948.0QFDTcPb-lkp@intel.com>
References: <20240927142108.1156362-7-dave.jiang@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927142108.1156362-7-dave.jiang@intel.com>

Hi Dave,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus tip/x86/core tip/x86/mm v6.11]
[cannot apply to rafael-pm/linux-next rafael-pm/bleeding-edge cxl/next linus/master cxl/pending next-20240927]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Jiang/ACPICA-actbl1-h-Add-extended-linear-address-mode-to-MSCIS/20240927-222421
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20240927142108.1156362-7-dave.jiang%40intel.com
patch subject: [RFC PATCH 6/6] cxl: Add mce notifier to emit aliased address for extended linear cache
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240928/202409280948.0QFDTcPb-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280948.0QFDTcPb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280948.0QFDTcPb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/cxl/core/mbox.c:3:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/cxl/core/mbox.c:1461:15: error: call to undeclared function 'mce_usable_address'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1461 |         if (!mce || !mce_usable_address(mce))
         |                      ^
>> drivers/cxl/core/mbox.c:1464:11: error: incomplete definition of type 'struct mce'
    1464 |         spa = mce->addr & MCI_ADDR_PHYSADDR;
         |               ~~~^
   drivers/cxl/core/mbox.c:1457:9: note: forward declaration of 'struct mce'
    1457 |         struct mce *mce = (struct mce *)data;
         |                ^
>> drivers/cxl/core/mbox.c:1464:20: error: use of undeclared identifier 'MCI_ADDR_PHYSADDR'
    1464 |         spa = mce->addr & MCI_ADDR_PHYSADDR;
         |                           ^
>> drivers/cxl/core/mbox.c:1508:31: error: use of undeclared identifier 'MCE_PRIO_CXL'
    1508 |         mds->mce_notifier.priority = MCE_PRIO_CXL;
         |                                      ^
>> drivers/cxl/core/mbox.c:1509:2: error: call to undeclared function 'mce_register_decode_chain'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1509 |         mce_register_decode_chain(&mds->mce_notifier);
         |         ^
   4 warnings and 5 errors generated.


vim +/mce_usable_address +1461 drivers/cxl/core/mbox.c

  1449	
  1450	static int cxl_handle_mce(struct notifier_block *nb, unsigned long val,
  1451				  void *data)
  1452	{
  1453		struct cxl_memdev_state *mds = container_of(nb, struct cxl_memdev_state,
  1454							    mce_notifier);
  1455		struct cxl_memdev *cxlmd = mds->cxlds.cxlmd;
  1456		struct cxl_port *endpoint = cxlmd->endpoint;
  1457		struct mce *mce = (struct mce *)data;
  1458		u64 spa, spa_alias;
  1459		unsigned long pfn;
  1460	
> 1461		if (!mce || !mce_usable_address(mce))
  1462			return NOTIFY_DONE;
  1463	
> 1464		spa = mce->addr & MCI_ADDR_PHYSADDR;
  1465	
  1466		pfn = spa >> PAGE_SHIFT;
  1467		if (!pfn_valid(pfn))
  1468			return NOTIFY_DONE;
  1469	
  1470		spa_alias = cxl_port_get_spa_cache_alias(endpoint, spa);
  1471		if (!spa_alias)
  1472			return NOTIFY_DONE;
  1473	
  1474		pfn = spa_alias >> PAGE_SHIFT;
  1475	
  1476		/*
  1477		 * Take down the aliased memory page. The original memory page flagged
  1478		 * by the MCE will be taken cared of by the standard MCE handler.
  1479		 */
  1480		dev_emerg(mds->cxlds.dev, "Offlining aliased SPA address: %#llx\n",
  1481			  spa_alias);
  1482		if (!memory_failure(pfn, 0))
  1483			set_mce_nospec(pfn);
  1484	
  1485		return NOTIFY_OK;
  1486	}
  1487	
  1488	struct cxl_memdev_state *cxl_memdev_state_create(struct device *dev)
  1489	{
  1490		struct cxl_memdev_state *mds;
  1491	
  1492		mds = devm_kzalloc(dev, sizeof(*mds), GFP_KERNEL);
  1493		if (!mds) {
  1494			dev_err(dev, "No memory available\n");
  1495			return ERR_PTR(-ENOMEM);
  1496		}
  1497	
  1498		mutex_init(&mds->mbox_mutex);
  1499		mutex_init(&mds->event.log_lock);
  1500		mds->cxlds.dev = dev;
  1501		mds->cxlds.reg_map.host = dev;
  1502		mds->cxlds.reg_map.resource = CXL_RESOURCE_NONE;
  1503		mds->cxlds.type = CXL_DEVTYPE_CLASSMEM;
  1504		mds->ram_perf.qos_class = CXL_QOS_CLASS_INVALID;
  1505		mds->pmem_perf.qos_class = CXL_QOS_CLASS_INVALID;
  1506	
  1507		mds->mce_notifier.notifier_call = cxl_handle_mce;
> 1508		mds->mce_notifier.priority = MCE_PRIO_CXL;
> 1509		mce_register_decode_chain(&mds->mce_notifier);
  1510	
  1511		return mds;
  1512	}
  1513	EXPORT_SYMBOL_NS_GPL(cxl_memdev_state_create, CXL);
  1514	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
