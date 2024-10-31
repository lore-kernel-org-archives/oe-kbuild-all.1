Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D993118593E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 21:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730410081; cv=none; b=FLkf0MYDN/TPszeKtCQfNOjeCZXuP0xPqBNbTg5Z3C4GFleJS75iwH0sAFw/daJJ7e64EUF0woW6FfK9JLwK/MsKneCbIjlYKefX2ha4/tanibmxMeQe+YsiPv86JvD4tm4RnOrmkoepWMJnIl7Wm7OrwhpQSuG9Hu3VcI1rD4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730410081; c=relaxed/simple;
	bh=sCo4Iphd2oCD0iu0918UkAZCHGO4frz4TK/kK1uRq0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QPe7w6zjVrI0mTscZ8h+k7am63MMG7zTyIe2ZxqiplvGucoEqFMoCFhd60QRUaD7LSa6NT+IaxrQf4ZNveEtoZihzgZ45SEn7uoqV8J8NfMidM8O7Ci0dYf7nrLZ7ynuV8eff92P3iE12Wua63MWJF9QBBlcH7BEWe5hTgp8nZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZeNZbEh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZeNZbEh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730410076; x=1761946076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sCo4Iphd2oCD0iu0918UkAZCHGO4frz4TK/kK1uRq0g=;
  b=JZeNZbEhlMJlvU8XMOswbC7TCB5aJ1l2jyVNIBAZAYmDFTPNDCER7aY7
   cU16g+G5zzcbemfK683PUeIcfxrA2TSnwrh5GSnYlPT6B7RaR8h53i4yp
   9OnmjL245OfsgG2JYzzmp9QkNGw8+QP7/P5jG2WK45OTI0MT6B5AS5B36
   E1nxfr4IZ/Y4jTcb/eETWg08P1WuMutT8s5Q8W/A7lrOSMRKF+bLpyQLc
   yPjRwSR5o90AgRDM1FIEJL7TQO6H5x9kzizsWTp5bi4xrfhwAKrnOXX1M
   0r2zF6vIA/N21V3ulPgXFyGhnBHyXSW5Fk1HhmAsmRAp8egq0r7ogz9Ig
   w==;
X-CSE-ConnectionGUID: NNjUhVtISyKH6AyNexltSQ==
X-CSE-MsgGUID: DwEgC4f7QySCoGEXDzXnNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="30288872"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="30288872"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 14:27:55 -0700
X-CSE-ConnectionGUID: YGYaF5UWSMa4kDSJiaQf4g==
X-CSE-MsgGUID: PuhWBhmeSkiBe7KPQcrJGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="82920102"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Oct 2024 14:27:52 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6chl-000gjl-0U;
	Thu, 31 Oct 2024 21:27:45 +0000
Date: Fri, 1 Nov 2024 05:27:41 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/extended-linear 5/5] drivers/cxl/core/mbox.c:1488:15:
 error: call to undeclared function 'mce_usable_address'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202411010505.vn7ntl1k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/extended-linear
head:   c4724382d8850a1fd8ea8b7777e1ef783c31f480
commit: c4724382d8850a1fd8ea8b7777e1ef783c31f480 [5/5] cxl: Add mce notifier to emit aliased address for extended linear cache
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20241101/202411010505.vn7ntl1k-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010505.vn7ntl1k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010505.vn7ntl1k-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/cxl/core/mbox.c:3:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/cxl/core/mbox.c:1488:15: error: call to undeclared function 'mce_usable_address'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1488 |         if (!mce || !mce_usable_address(mce))
         |                      ^
>> drivers/cxl/core/mbox.c:1491:11: error: incomplete definition of type 'struct mce'
    1491 |         spa = mce->addr & MCI_ADDR_PHYSADDR;
         |               ~~~^
   drivers/cxl/core/mbox.c:1484:9: note: forward declaration of 'struct mce'
    1484 |         struct mce *mce = (struct mce *)data;
         |                ^
>> drivers/cxl/core/mbox.c:1491:20: error: use of undeclared identifier 'MCI_ADDR_PHYSADDR'
    1491 |         spa = mce->addr & MCI_ADDR_PHYSADDR;
         |                           ^
>> drivers/cxl/core/mbox.c:1534:31: error: use of undeclared identifier 'MCE_PRIO_CXL'
    1534 |         mds->mce_notifier.priority = MCE_PRIO_CXL;
         |                                      ^
>> drivers/cxl/core/mbox.c:1535:2: error: call to undeclared function 'mce_register_decode_chain'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1535 |         mce_register_decode_chain(&mds->mce_notifier);
         |         ^
   4 warnings and 5 errors generated.


vim +/mce_usable_address +1488 drivers/cxl/core/mbox.c

  1476	
  1477	static int cxl_handle_mce(struct notifier_block *nb, unsigned long val,
  1478				  void *data)
  1479	{
  1480		struct cxl_memdev_state *mds = container_of(nb, struct cxl_memdev_state,
  1481							    mce_notifier);
  1482		struct cxl_memdev *cxlmd = mds->cxlds.cxlmd;
  1483		struct cxl_port *endpoint = cxlmd->endpoint;
  1484		struct mce *mce = (struct mce *)data;
  1485		u64 spa, spa_alias;
  1486		unsigned long pfn;
  1487	
> 1488		if (!mce || !mce_usable_address(mce))
  1489			return NOTIFY_DONE;
  1490	
> 1491		spa = mce->addr & MCI_ADDR_PHYSADDR;
  1492	
  1493		pfn = spa >> PAGE_SHIFT;
  1494		if (!pfn_valid(pfn))
  1495			return NOTIFY_DONE;
  1496	
  1497		spa_alias = cxl_port_get_spa_cache_alias(endpoint, spa);
  1498		if (!spa_alias)
  1499			return NOTIFY_DONE;
  1500	
  1501		pfn = spa_alias >> PAGE_SHIFT;
  1502	
  1503		/*
  1504		 * Take down the aliased memory page. The original memory page flagged
  1505		 * by the MCE will be taken cared of by the standard MCE handler.
  1506		 */
  1507		dev_emerg(mds->cxlds.dev, "Offlining aliased SPA address: %#llx\n",
  1508			  spa_alias);
  1509		if (!memory_failure(pfn, 0))
  1510			set_mce_nospec(pfn);
  1511	
  1512		return NOTIFY_OK;
  1513	}
  1514	
  1515	struct cxl_memdev_state *cxl_memdev_state_create(struct device *dev)
  1516	{
  1517		struct cxl_memdev_state *mds;
  1518	
  1519		mds = devm_kzalloc(dev, sizeof(*mds), GFP_KERNEL);
  1520		if (!mds) {
  1521			dev_err(dev, "No memory available\n");
  1522			return ERR_PTR(-ENOMEM);
  1523		}
  1524	
  1525		mutex_init(&mds->event.log_lock);
  1526		mds->cxlds.dev = dev;
  1527		mds->cxlds.reg_map.host = dev;
  1528		mds->cxlds.reg_map.resource = CXL_RESOURCE_NONE;
  1529		mds->cxlds.type = CXL_DEVTYPE_CLASSMEM;
  1530		mds->ram_perf.qos_class = CXL_QOS_CLASS_INVALID;
  1531		mds->pmem_perf.qos_class = CXL_QOS_CLASS_INVALID;
  1532	
  1533		mds->mce_notifier.notifier_call = cxl_handle_mce;
> 1534		mds->mce_notifier.priority = MCE_PRIO_CXL;
> 1535		mce_register_decode_chain(&mds->mce_notifier);
  1536	
  1537		return mds;
  1538	}
  1539	EXPORT_SYMBOL_NS_GPL(cxl_memdev_state_create, CXL);
  1540	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
