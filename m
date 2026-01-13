Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9651525A357
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 04:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768277802; cv=none; b=c+oBRSBVjzyeuJiu+/JV9ZJRPQ/ndpNqDJkbuDlTfeLy4z7Twr48si6aJcDSgW2ZP2HwFGu+RqSwW2D/7QzV9jJ6gdjth7Qu01enM8RohXlPorUDLo5LEA3cP3Y5d/d6P0rXyEdezUfZ4QtAU0AfMZU9n9D0DEzijtjg086kETE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768277802; c=relaxed/simple;
	bh=f0prDkpNDjiFMNfgm2lPTAu6Ytgqaf2amBoSNF128LI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tg7UDkqL/CJT7GOLBgooDfuch6XQnqzVVgxGxsJL8/gX2okYnfLf+RJz/S0mN/rmpIb8TgHJiC0HIAiw6olI5AUJMI2E6X3hywzLs/ukg32LswKcptYdXRB4tRb7e4hcCB7ubFvnPZFrbgBbjW9oOpWevPegZuqsm2P5ZJLjJyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HdA81PZf; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HdA81PZf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768277801; x=1799813801;
  h=date:from:to:cc:subject:message-id;
  bh=f0prDkpNDjiFMNfgm2lPTAu6Ytgqaf2amBoSNF128LI=;
  b=HdA81PZfawGmM/onUmLLNfCS8ufdQfo3AKwj1afly6NaGokxgew/aPrK
   15m8aq9LYhwEovE96WzVEJgUT82boHB8dE6vC8g511awvprvE9yyEFZub
   0vcfc8G+y1eddxZuwWCK45QsOLxRf+GudQTGQYWc2RaG3Tnftd0B6Z44q
   xynO5MNrTWeOaWfFKRFcAH0u6wjjPk1GTCv6nNFWQQzCbgBmlLs+veLjC
   0TcbtnSvndxwBeMJLtl72s9ek6dxeOrD8pOyhK465NLKhn+7P+NCS5/eB
   xrogLzfPMHrcqBuSRuPUuQaVNshbWPJr/lEYiIVNiBacvkNpQ/6YN8t0v
   w==;
X-CSE-ConnectionGUID: gXtOOn4rRLejCWiMWE54jA==
X-CSE-MsgGUID: jKCjCe7LQJGA2r9yJ3FTWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="95035124"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="95035124"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 20:16:40 -0800
X-CSE-ConnectionGUID: ns0FJ0piQ+KINVG5x7ruag==
X-CSE-MsgGUID: HoN7xNCEQXGqfRdfIFLQFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203918945"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Jan 2026 20:16:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfVpc-00000000ECS-200s;
	Tue, 13 Jan 2026 04:16:36 +0000
Date: Tue, 13 Jan 2026 12:15:38 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/cxl/controllers/v2 6/6]
 drivers/cxl/core/memctrl/sysram_region.c:267:14: error: 'MMOP_OFFLINE'
 undeclared; did you mean 'MEM_OFFLINE'?
Message-ID: <202601131231.u6x9Bgvd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/cxl/controllers/v2
head:   dcbd460f630113f17cb71133f44920a1f35c2605
commit: 9a7e9f00bdcec2e1a0f8843abe36f31f75d00493 [6/6] cxl/sysram: disallow onlining in ZONE_NORMAL if state is movable only
config: i386-randconfig-001-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131231.u6x9Bgvd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131231.u6x9Bgvd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131231.u6x9Bgvd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cxl/core/memctrl/sysram_region.c: In function 'hotunplug_store':
   drivers/cxl/core/memctrl/sysram_region.c:92:14: error: implicit declaration of function 'offline_and_remove_memory' [-Wimplicit-function-declaration]
      92 |         rc = offline_and_remove_memory(range.start, range_len(&range));
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/memctrl/sysram_region.c: In function 'cxl_sysram_online_memory':
   drivers/cxl/core/memctrl/sysram_region.c:149:14: error: implicit declaration of function 'walk_memory_blocks'; did you mean 'online_memory_block_cb'? [-Wimplicit-function-declaration]
     149 |         rc = walk_memory_blocks(range->start, range_len(range),
         |              ^~~~~~~~~~~~~~~~~~
         |              online_memory_block_cb
   drivers/cxl/core/memctrl/sysram_region.c: In function 'cxl_sysram_memory_notify_cb':
   drivers/cxl/core/memctrl/sysram_region.c:201:39: error: 'MMOP_ONLINE_MOVABLE' undeclared (first use in this function)
     201 |         if (data->last_online_type != MMOP_ONLINE_MOVABLE)
         |                                       ^~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/memctrl/sysram_region.c:201:39: note: each undeclared identifier is reported only once for each function it appears in
   drivers/cxl/core/memctrl/sysram_region.c: In function 'cxl_sysram_auto_online':
   drivers/cxl/core/memctrl/sysram_region.c:230:31: error: 'MMOP_ONLINE_MOVABLE' undeclared (first use in this function)
     230 |                 online_type = MMOP_ONLINE_MOVABLE;
         |                               ^~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/memctrl/sysram_region.c:232:31: error: 'MMOP_ONLINE_KERNEL' undeclared (first use in this function)
     232 |                 online_type = MMOP_ONLINE_KERNEL;
         |                               ^~~~~~~~~~~~~~~~~~
   drivers/cxl/core/memctrl/sysram_region.c: In function 'state_show':
   drivers/cxl/core/memctrl/sysram_region.c:263:14: error: 'MMOP_ONLINE_MOVABLE' undeclared (first use in this function)
     263 |         case MMOP_ONLINE_MOVABLE:
         |              ^~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/memctrl/sysram_region.c:265:14: error: 'MMOP_ONLINE_KERNEL' undeclared (first use in this function)
     265 |         case MMOP_ONLINE_KERNEL:
         |              ^~~~~~~~~~~~~~~~~~
>> drivers/cxl/core/memctrl/sysram_region.c:267:14: error: 'MMOP_OFFLINE' undeclared (first use in this function); did you mean 'MEM_OFFLINE'?
     267 |         case MMOP_OFFLINE:
         |              ^~~~~~~~~~~~
         |              MEM_OFFLINE
   drivers/cxl/core/memctrl/sysram_region.c: In function 'state_store':
   drivers/cxl/core/memctrl/sysram_region.c:280:27: error: 'MMOP_OFFLINE' undeclared (first use in this function); did you mean 'MEM_OFFLINE'?
     280 |         int online_type = MMOP_OFFLINE;
         |                           ^~~~~~~~~~~~
         |                           MEM_OFFLINE
   drivers/cxl/core/memctrl/sysram_region.c:299:31: error: 'MMOP_ONLINE_MOVABLE' undeclared (first use in this function)
     299 |                 online_type = MMOP_ONLINE_MOVABLE;
         |                               ^~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/memctrl/sysram_region.c:302:31: error: 'MMOP_ONLINE' undeclared (first use in this function); did you mean 'MEM_ONLINE'?
     302 |                 online_type = MMOP_ONLINE;
         |                               ^~~~~~~~~~~
         |                               MEM_ONLINE
   drivers/cxl/core/memctrl/sysram_region.c: In function 'hotplug_store':
   drivers/cxl/core/memctrl/sysram_region.c:343:14: error: implicit declaration of function 'add_memory_driver_managed' [-Wimplicit-function-declaration]
     343 |         rc = add_memory_driver_managed(data->mgid, range.start,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/memctrl/sysram_region.c:345:40: error: 'MHP_NID_IS_MGID' undeclared (first use in this function)
     345 |                                        MHP_NID_IS_MGID);
         |                                        ^~~~~~~~~~~~~~~
   drivers/cxl/core/memctrl/sysram_region.c: In function 'cxl_sysram_unregister':
   drivers/cxl/core/memctrl/sysram_region.c:382:17: error: implicit declaration of function 'memory_group_unregister' [-Wimplicit-function-declaration]
     382 |                 memory_group_unregister(data->mgid);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/memctrl/sysram_region.c: In function 'devm_cxl_add_sysram_region':
   drivers/cxl/core/memctrl/sysram_region.c:400:9: error: unknown type name 'mhp_t'
     400 |         mhp_t mhp_flags;
         |         ^~~~~
   drivers/cxl/core/memctrl/sysram_region.c:440:34: error: 'MMOP_OFFLINE' undeclared (first use in this function); did you mean 'MEM_OFFLINE'?
     440 |         data->last_online_type = MMOP_OFFLINE;
         |                                  ^~~~~~~~~~~~
         |                                  MEM_OFFLINE
   drivers/cxl/core/memctrl/sysram_region.c:448:14: error: implicit declaration of function 'memory_group_register_static' [-Wimplicit-function-declaration]
     448 |         rc = memory_group_register_static(numa_node, PFN_UP(total_len));
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/memctrl/sysram_region.c:470:21: error: 'MHP_NID_IS_MGID' undeclared (first use in this function)
     470 |         mhp_flags = MHP_NID_IS_MGID;
         |                     ^~~~~~~~~~~~~~~


vim +267 drivers/cxl/core/memctrl/sysram_region.c

   252	
   253	static ssize_t state_show(struct device *dev,
   254				  struct device_attribute *attr, char *buf)
   255	{
   256		struct cxl_sysram_data *data;
   257	
   258		data = dev_get_drvdata(dev);
   259		if (!data)
   260			return -ENODEV;
   261	
   262		switch (data->last_online_type) {
   263		case MMOP_ONLINE_MOVABLE:
   264			return sysfs_emit(buf, "online\n");
   265		case MMOP_ONLINE_KERNEL:
   266			return sysfs_emit(buf, "online_normal\n");
 > 267		case MMOP_OFFLINE:
   268		default:
   269			return sysfs_emit(buf, "offline\n");
   270		}
   271	}
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
