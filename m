Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA5A20313
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 06:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713163517; cv=none; b=lVuzq0vFEOza//cBG327KOPXqGl9UP4QDsgwQdZBz+ax0iXYu3PzRtPkwm0aJz4P3c7WPf4vgWNjVDx2t0yhOMKiBm+Qc3WDCtIBTGwjQz02aOPf1tHbAmaJ7CZ2E72iAowKIjaM/V90bKxVut72A8uO59DBopwNMBNoo5qpHS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713163517; c=relaxed/simple;
	bh=Qj01QMWcqD6yRRdCkHvZubWUUI6a+PZiruwPEn529v8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LSPGJxo3B/ReddDTgCuiIHTX5iaGdeCqNeUgH/MAJVAE1guDkLRrE8G90R2/uQlDN+jhUs7gyD/DYrFZ6oXtrmyzP1LnI3QbIvl0MMUVJMWpJ6e6bERSSKU3gNg2XIEyavXPjiBhHq30zHH1yZRv7ks0cDmtrtBR+PNSmvP1eo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ehlgUBwk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ehlgUBwk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713163514; x=1744699514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qj01QMWcqD6yRRdCkHvZubWUUI6a+PZiruwPEn529v8=;
  b=ehlgUBwkNLZOtSrYe3tBLg8tXR1GmBxlGrjq2N82+0yHiKdMqlukw3zW
   jCa6Ydq0jxSCen5OFMb6ec3sqt/7ZTjJ1RekWdj0F34V7aFCZAh7AecB0
   FamAFwrX9bl9ri4lxspEWJAmKWiC77L5VPjoivu5zuNoHamYr8HyLANz6
   BiggHYq358+N5UeTdqvHle3PuU43+zo9XmBLUTNh8/mK4/JyIUJQltrYl
   VJHYc84b7QAqbIgvvV2hqHftHRpW0Ud+b+nAcJPrNMQHp0CRp3wyG5L9V
   5TI1/jRFilfoEXralc4NTjkuRWeQEO7S79YvjGPPzZSG8PmWS91veHunF
   A==;
X-CSE-ConnectionGUID: NRjVrlrwTXa5s0/PhLo9Fg==
X-CSE-MsgGUID: JKKmXC1iSyyiQGGctbC01A==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8402690"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="8402690"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 23:45:13 -0700
X-CSE-ConnectionGUID: N10c3A5QTF68n0XxRFXhUg==
X-CSE-MsgGUID: 3igIUhXJRxSzdckzCdTgRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="26373833"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 14 Apr 2024 23:45:12 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwG5Q-00041Q-2r;
	Mon, 15 Apr 2024 06:45:06 +0000
Date: Mon, 15 Apr 2024 14:44:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Steven Song <steven.song@3snic.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 19114/30000]
 drivers/scsi/sssraid/sssraid_os.c:1568:2: error: implicit declaration of
 function 'for_each_pci_msi_entry'
Message-ID: <202404151411.qh3ixZhW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   9a6863f4e4a4271bdb5b3a1e955bcd851d81c27a
commit: bbae0ca11850da2793282896206974656859a73e [19114/30000] SCSI: SSSRAID: Introduce map_queue in sssraid module
config: x86_64-randconfig-122-20240413 (https://download.01.org/0day-ci/archive/20240415/202404151411.qh3ixZhW-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240415/202404151411.qh3ixZhW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404151411.qh3ixZhW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/sssraid/sssraid_os.c:1568:2: error: implicit declaration of function 'for_each_pci_msi_entry' [-Werror,-Wimplicit-function-declaration]
    1568 |         for_each_pci_msi_entry(entry, pdev) {
         |         ^
>> drivers/scsi/sssraid/sssraid_os.c:1568:37: error: expected ';' after expression
    1568 |         for_each_pci_msi_entry(entry, pdev) {
         |                                            ^
         |                                            ;
>> drivers/scsi/sssraid/sssraid_os.c:1569:43: error: no member named 'msi_list' in 'struct device'
    1569 |                 struct list_head *msi_list = &pdev->dev.msi_list;
         |                                               ~~~~~~~~~ ^
>> drivers/scsi/sssraid/sssraid_os.c:1581:5: error: 'continue' statement not in loop statement
    1581 |                                 continue;
         |                                 ^
   drivers/scsi/sssraid/sssraid_os.c:1591:3: error: 'continue' statement not in loop statement
    1591 |                 continue;
         |                 ^
   5 errors generated.


vim +/for_each_pci_msi_entry +1568 drivers/scsi/sssraid/sssraid_os.c

  1550	
  1551	static int sssraid_map_queues(struct Scsi_Host *shost)
  1552	{
  1553		struct sssraid_ioc *sdioc = shost_priv(shost);
  1554		struct pci_dev *pdev = sdioc->pdev;
  1555		struct msi_desc *entry = NULL;
  1556		struct irq_affinity_desc *affinity = NULL;
  1557		struct blk_mq_tag_set *tag_set = &shost->tag_set;
  1558		struct blk_mq_queue_map *queue_map = &tag_set->map[HCTX_TYPE_DEFAULT];
  1559		const struct cpumask *node_mask = NULL;
  1560		unsigned int queue_offset = queue_map->queue_offset;
  1561		unsigned int *map = queue_map->mq_map;
  1562		unsigned int nr_queues = queue_map->nr_queues;
  1563		unsigned int node_id, node_id_last = 0xFFFFFFFF;
  1564		int cpu, first_sibling, cpu_index = 0;
  1565		u8 node_count = 0, i;
  1566		unsigned int node_id_array[100];
  1567	
> 1568		for_each_pci_msi_entry(entry, pdev) {
> 1569			struct list_head *msi_list = &pdev->dev.msi_list;
  1570	
  1571			if (list_is_last(msi_list, &entry->list))
  1572				goto get_next_numa_node;
  1573	
  1574			if (entry->irq) {
  1575				affinity = entry->affinity;
  1576				node_mask = &affinity->mask;
  1577	
  1578				cpu = cpumask_first(node_mask);
  1579				node_id = cpu_to_node(cpu);
  1580				if (node_id_last == node_id)
> 1581					continue;
  1582	
  1583				for (i = 0; i < node_count; i++) {
  1584					if (node_id == node_id_array[i])
  1585						goto get_next_numa_node;
  1586				}
  1587				node_id_array[node_count++] = node_id;
  1588				node_id_last = node_id;
  1589			}
  1590	get_next_numa_node:
  1591			continue;
  1592		}
  1593	
  1594		for (i = 0; i < node_count; i++) {
  1595			node_mask = cpumask_of_node(node_id_array[i]);
  1596			dbgprint(sdioc, "NUMA_node = %d\n", node_id_array[i]);
  1597			for_each_cpu(cpu, node_mask) {
  1598				if (cpu_index < nr_queues) {
  1599					map[cpu_index++] = queue_offset + (cpu % nr_queues);
  1600				} else {
  1601					first_sibling = sssraid_get_first_sibling(cpu);
  1602					if (first_sibling == cpu)
  1603						map[cpu_index++] = queue_offset + (cpu % nr_queues);
  1604					else
  1605						map[cpu_index++] = map[first_sibling];
  1606				}
  1607				dbgprint(sdioc, "map[%d] = %d\n", cpu_index - 1, map[cpu_index - 1]);
  1608			}
  1609		}
  1610	
  1611		return 0;
  1612	}
  1613	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
