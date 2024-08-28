Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A5E69D2B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 02:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724813377; cv=none; b=Q8t9Afslyp60XbDS/FRSnTjsUAtuBh7xG5pHYoatGG6fltI+Eaz6Bb79e0Cf9x8JMg1A0bhBGkBNPgaR1zoF7QJWyDzK+TlIy6tWjihOLXHtDgiE+1E1ze48z9hoqkX59wPTWkq4BXIeZzit4+BTyWsgR9fPxcRInBEWo7vuAIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724813377; c=relaxed/simple;
	bh=s/4wOn61q0C7ryXGwq15Wh+X3Y7oOU8rVFfEGoAjpPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qF2iI2guYNFJuJUPjTCKNpH1SdfOKTzs7P3ynP0Rvon0hhFhss12mJYvpQ+Cc3maxUwgut/4TF6gxEOEkRd68od43e2sf7LVAcGp4PH+oNfTf7i8zawx9XKLMxed2qr33+JU0GStR8fRy9ourJgP4+sE1WVsa6nwn2Ac95ZTmd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=arp7BUyA; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="arp7BUyA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724813375; x=1756349375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s/4wOn61q0C7ryXGwq15Wh+X3Y7oOU8rVFfEGoAjpPQ=;
  b=arp7BUyAh79xtidiz+OkDQ/ff+s5I1ny1ZHYV6dZjEzsnKFetsJus/vs
   5oL3yopGGWEiOE2Lb6UtzEPBz5HOCNDfDOaq1jt7TcR0zyQe9Nf9cIK0S
   qzWG5HW5NcC3zLuNmlvzO6KcrdeOXRCZnEgPGJVtaJC7gfyHj/HEhjsid
   CEefrRkUdvoRilQWmPMFJ98+mrWJMEMnyq4H0xY1ZbVw6NrAwMsucP7wc
   T6XiurFKKhevbXTYK/l4Dy+sjPgEQ7lwVLemXpb77IbtbhZ0z5LL/rajG
   aS3HcudlNnXYroYR87GH4Mw0fRc6UG34D59vh+jxcDwcANpq6xwoOrThM
   A==;
X-CSE-ConnectionGUID: xZvwx6DFSryDa5dhSNz+3w==
X-CSE-MsgGUID: hbEiZbsIR/OGcMA+5OTpqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="34696918"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="34696918"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 19:49:32 -0700
X-CSE-ConnectionGUID: JXsFZuzkQoKNsAroa93qbQ==
X-CSE-MsgGUID: GJbBiIi/S0qxlSckVqVPGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="67434800"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Aug 2024 19:49:31 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sj8kS-000KNG-28;
	Wed, 28 Aug 2024 02:49:28 +0000
Date: Wed, 28 Aug 2024 10:49:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, chriszhou <zhouqin@3snic.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7228/13744]
 drivers/scsi/sssraid/sssraid_os.c:1553: undefined reference to
 `msi_domain_first_desc'
Message-ID: <202408281025.qPre06ub-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e65c0786c5c765daf978c13bfe587f5426745bc7
commit: 165b3cc224374728856b5584455d7ae7f054fbe5 [7228/13744] SCSI: SSSRAID: Support 3SNIC 3S5XX serial RAID/HBA controllers
config: x86_64-randconfig-074-20240827 (https://download.01.org/0day-ci/archive/20240828/202408281025.qPre06ub-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408281025.qPre06ub-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408281025.qPre06ub-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `ls2k500sfb_events_fn':
   drivers/video/fbdev/ls2k500sfb.c:249: undefined reference to `fg_console'
   ld: drivers/video/fbdev/ls2k500sfb.c:249: undefined reference to `fg_console'
   ld: drivers/video/fbdev/ls2k500sfb.c:249: undefined reference to `fg_console'
   ld: vmlinux.o: in function `sssraid_map_queues':
>> drivers/scsi/sssraid/sssraid_os.c:1553: undefined reference to `msi_domain_first_desc'
>> ld: drivers/scsi/sssraid/sssraid_os.c:1553: undefined reference to `msi_next_desc'


vim +1553 drivers/scsi/sssraid/sssraid_os.c

  1535	
  1536	static void sssraid_map_queues(struct Scsi_Host *shost)
  1537	{
  1538		struct sssraid_ioc *sdioc = shost_priv(shost);
  1539		struct pci_dev *pdev = sdioc->pdev;
  1540		struct msi_desc *entry = NULL;
  1541		struct irq_affinity_desc *affinity = NULL;
  1542		struct blk_mq_tag_set *tag_set = &shost->tag_set;
  1543		struct blk_mq_queue_map *queue_map = &tag_set->map[HCTX_TYPE_DEFAULT];
  1544		const struct cpumask *node_mask = NULL;
  1545		unsigned int queue_offset = queue_map->queue_offset;
  1546		unsigned int *map = queue_map->mq_map;
  1547		unsigned int nr_queues = queue_map->nr_queues;
  1548		unsigned int node_id, node_id_last = 0xFFFFFFFF;
  1549		int cpu, first_sibling, cpu_index = 0;
  1550		u8 node_count = 0, i;
  1551		unsigned int node_id_array[100];
  1552	
> 1553		msi_for_each_desc(entry, &pdev->dev, MSI_DESC_ALL) {
  1554			if (entry->irq) {
  1555				affinity = entry->affinity;
  1556				node_mask = &affinity->mask;
  1557	
  1558				cpu = cpumask_first(node_mask);
  1559				node_id = cpu_to_node(cpu);
  1560				if (node_id_last == node_id)
  1561					continue;
  1562	
  1563				for (i = 0; i < node_count; i++) {
  1564					if (node_id == node_id_array[i])
  1565						goto get_next_numa_node;
  1566				}
  1567				node_id_array[node_count++] = node_id;
  1568				node_id_last = node_id;
  1569			}
  1570	get_next_numa_node:
  1571			continue;
  1572		}
  1573	
  1574		for (i = 0; i < node_count; i++) {
  1575			node_mask = cpumask_of_node(node_id_array[i]);
  1576			dbgprint(sdioc, "NUMA_node = %d\n", node_id_array[i]);
  1577			for_each_cpu(cpu, node_mask) {
  1578				if (cpu_index < nr_queues) {
  1579					map[cpu_index++] = queue_offset + (cpu % nr_queues);
  1580				} else {
  1581					first_sibling = sssraid_get_first_sibling(cpu);
  1582					if (first_sibling == cpu)
  1583						map[cpu_index++] = queue_offset + (cpu % nr_queues);
  1584					else
  1585						map[cpu_index++] = map[first_sibling];
  1586				}
  1587				dbgprint(sdioc, "map[%d] = %d\n", cpu_index - 1, map[cpu_index - 1]);
  1588			}
  1589		}
  1590	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
