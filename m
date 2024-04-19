Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015CE7D416
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 23:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713567795; cv=none; b=Fzn/Lap8XRFq9bzbldrpJ1NJ5VGx1n0N0cNvamTZalkdza/gYMj4b61QIWdBGVLGUY3q+JicJNKcafJr5oL6ZttEL8b1Wj04vX74kMK5rg+Y0+ZbMRaUWlZnMdiHwBOh5XDm6bKJX5rxHdZaXwarqAhnRNkOsdWgWYj3s9s/CWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713567795; c=relaxed/simple;
	bh=qgn5KQg1m5P8VaxwKlKLQ4EnbKySLbpdxBjOLfS5x3s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=suPFewalumkYbUdb+jPgKuOL+q0SkfQx5G492YblPZaxGih3AWxhtQMUeugnQtldMGE+mOyGGD6gApNONZoRfZQ6Fq4ITzDLDcrCnVsBZJ8DPklP2JxpzvOLSa608mRyyEeXNqTgYUvU1p+ljEX5J1mP6d9uNM81jv+X6tNvIHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MeqivzhE; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MeqivzhE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713567793; x=1745103793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qgn5KQg1m5P8VaxwKlKLQ4EnbKySLbpdxBjOLfS5x3s=;
  b=MeqivzhEpnnQI1C+/edvXm0X3pWDKoWaXsYgRZYH+V8hbMtVb9uTRzs9
   4zK7BuABQS/idzkFGCs9QuAhq8vslt3GHad/iXGMYo5ZKOe5ASoduxdNy
   AuDzO5KwU+E2RUAHm4B97ISFqe0vzK+gh8ZjlJ95qcJcI3X2Uy3b7Ube9
   SFAOwlfCZTIcMMbEZFeTFclWiZIqWEY/IDVZXhuIx2IHfhN5u+nDA94f1
   ph4njBJsGd3h50SC0879JtKdvOetUxK5rlcTqYeCJ6uk3ZHmq3tDA/+7b
   1Ja9e/fghsO/KvRAqmMzM4pwYJZx0VNfka6Y8kAoSA68q65EkGrrmrOxh
   w==;
X-CSE-ConnectionGUID: J0f5GTQ6QTSaKXKkS9X4Hg==
X-CSE-MsgGUID: UnCSe6c6SAuqCebOEQKtwQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="26708551"
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="26708551"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 16:02:15 -0700
X-CSE-ConnectionGUID: HgQJwNnCQW+CJfvPiKnH7g==
X-CSE-MsgGUID: hRUdz12FQ1izD+UnmuqBRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="28287310"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 19 Apr 2024 16:02:13 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxxFC-000AXE-2D;
	Fri, 19 Apr 2024 23:02:10 +0000
Date: Sat, 20 Apr 2024 07:01:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Steven Song <steven.song@3snic.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 18710/30000]
 drivers/scsi/sssraid/sssraid_os.c:1556:35: warning: unused variable
 'affinity'
Message-ID: <202404200623.QfzEE7tC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   f8ab733c9440022fd40f3c6d44e18f6ae930dc48
commit: bbae0ca11850da2793282896206974656859a73e [18710/30000] SCSI: SSSRAID: Introduce map_queue in sssraid module
config: x86_64-randconfig-014-20240420 (https://download.01.org/0day-ci/archive/20240420/202404200623.QfzEE7tC-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404200623.QfzEE7tC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404200623.QfzEE7tC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/sssraid/sssraid_os.c: In function 'sssraid_map_queues':
   drivers/scsi/sssraid/sssraid_os.c:1568:9: error: implicit declaration of function 'for_each_pci_msi_entry'; did you mean 'for_each_msi_entry'? [-Werror=implicit-function-declaration]
    1568 |         for_each_pci_msi_entry(entry, pdev) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         for_each_msi_entry
   drivers/scsi/sssraid/sssraid_os.c:1568:44: error: expected ';' before '{' token
    1568 |         for_each_pci_msi_entry(entry, pdev) {
         |                                            ^~
         |                                            ;
   drivers/scsi/sssraid/sssraid_os.c:1566:22: warning: unused variable 'node_id_array' [-Wunused-variable]
    1566 |         unsigned int node_id_array[100];
         |                      ^~~~~~~~~~~~~
   drivers/scsi/sssraid/sssraid_os.c:1565:28: warning: unused variable 'i' [-Wunused-variable]
    1565 |         u8 node_count = 0, i;
         |                            ^
   drivers/scsi/sssraid/sssraid_os.c:1565:12: warning: unused variable 'node_count' [-Wunused-variable]
    1565 |         u8 node_count = 0, i;
         |            ^~~~~~~~~~
   drivers/scsi/sssraid/sssraid_os.c:1564:33: warning: unused variable 'cpu_index' [-Wunused-variable]
    1564 |         int cpu, first_sibling, cpu_index = 0;
         |                                 ^~~~~~~~~
   drivers/scsi/sssraid/sssraid_os.c:1564:18: warning: unused variable 'first_sibling' [-Wunused-variable]
    1564 |         int cpu, first_sibling, cpu_index = 0;
         |                  ^~~~~~~~~~~~~
   drivers/scsi/sssraid/sssraid_os.c:1564:13: warning: unused variable 'cpu' [-Wunused-variable]
    1564 |         int cpu, first_sibling, cpu_index = 0;
         |             ^~~
   drivers/scsi/sssraid/sssraid_os.c:1563:31: warning: unused variable 'node_id_last' [-Wunused-variable]
    1563 |         unsigned int node_id, node_id_last = 0xFFFFFFFF;
         |                               ^~~~~~~~~~~~
   drivers/scsi/sssraid/sssraid_os.c:1563:22: warning: unused variable 'node_id' [-Wunused-variable]
    1563 |         unsigned int node_id, node_id_last = 0xFFFFFFFF;
         |                      ^~~~~~~
   drivers/scsi/sssraid/sssraid_os.c:1562:22: warning: unused variable 'nr_queues' [-Wunused-variable]
    1562 |         unsigned int nr_queues = queue_map->nr_queues;
         |                      ^~~~~~~~~
   drivers/scsi/sssraid/sssraid_os.c:1561:23: warning: unused variable 'map' [-Wunused-variable]
    1561 |         unsigned int *map = queue_map->mq_map;
         |                       ^~~
   drivers/scsi/sssraid/sssraid_os.c:1560:22: warning: unused variable 'queue_offset' [-Wunused-variable]
    1560 |         unsigned int queue_offset = queue_map->queue_offset;
         |                      ^~~~~~~~~~~~
   drivers/scsi/sssraid/sssraid_os.c:1559:31: warning: unused variable 'node_mask' [-Wunused-variable]
    1559 |         const struct cpumask *node_mask = NULL;
         |                               ^~~~~~~~~
>> drivers/scsi/sssraid/sssraid_os.c:1556:35: warning: unused variable 'affinity' [-Wunused-variable]
    1556 |         struct irq_affinity_desc *affinity = NULL;
         |                                   ^~~~~~~~
   drivers/scsi/sssraid/sssraid_os.c:1612:1: warning: no return statement in function returning non-void [-Wreturn-type]
    1612 | }
         | ^
   drivers/scsi/sssraid/sssraid_os.c: At top level:
   drivers/scsi/sssraid/sssraid_os.c:1466:12: warning: 'sssraid_get_first_sibling' defined but not used [-Wunused-function]
    1466 | static int sssraid_get_first_sibling(unsigned int cpu)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/affinity +1556 drivers/scsi/sssraid/sssraid_os.c

  1550	
  1551	static int sssraid_map_queues(struct Scsi_Host *shost)
  1552	{
  1553		struct sssraid_ioc *sdioc = shost_priv(shost);
  1554		struct pci_dev *pdev = sdioc->pdev;
  1555		struct msi_desc *entry = NULL;
> 1556		struct irq_affinity_desc *affinity = NULL;
  1557		struct blk_mq_tag_set *tag_set = &shost->tag_set;
  1558		struct blk_mq_queue_map *queue_map = &tag_set->map[HCTX_TYPE_DEFAULT];
  1559		const struct cpumask *node_mask = NULL;
  1560		unsigned int queue_offset = queue_map->queue_offset;
> 1561		unsigned int *map = queue_map->mq_map;
  1562		unsigned int nr_queues = queue_map->nr_queues;
  1563		unsigned int node_id, node_id_last = 0xFFFFFFFF;
  1564		int cpu, first_sibling, cpu_index = 0;
  1565		u8 node_count = 0, i;
  1566		unsigned int node_id_array[100];
  1567	
  1568		for_each_pci_msi_entry(entry, pdev) {
  1569			struct list_head *msi_list = &pdev->dev.msi_list;
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
  1581					continue;
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
