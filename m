Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D693A1F55F8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 09:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752831891; cv=none; b=eHw4W44D14NxEr4bqekznT7OwsuMEUh00xgp2rslr8U1RFkMRJXd++Wap6fcC3tzJGdqMnHpV+OsaDcRvxrR3bI9MoIQo2N+WvFeiT8xkXiyk6S1x/5YNMAEh5joK7EBxJHNvahLFkLN9dkKO0Tp9tOxHj+ADtuejc4NqnI5NL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752831891; c=relaxed/simple;
	bh=sjmE8MbLPPp4V2w1XMNjJZR8sNPWTVo/dLniat1RBoY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Aos54f5Z5P5SiB0DolKfXNUO8U22wJZoxU5AJjOllE9kSLC5UiYsZ5Vke8octYFM8So+4VeqbizfM9ATh8yoUMFjyYpPHlantP9IjkbTnpW0ZehJMxRVE8f49rx/1HqR2DQTnUyh5hTPnzOKkIImQdmsJ/PtKEs6vpK9GkCykXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S4AY1PCe; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S4AY1PCe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752831890; x=1784367890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sjmE8MbLPPp4V2w1XMNjJZR8sNPWTVo/dLniat1RBoY=;
  b=S4AY1PCeNOQCmRj3ChOPVE4v+9//4g+fJsYOq9LyBzXCxzRDk1tWOqo2
   R+DLPhKbwUrKZ56e9yDpulnDZsMNwaamLW1VJE0897DIvlkCwbGWp3ZO5
   QLXUplDTX5lQolAkt3PlG+fCfsNGIxQ/A+FV/NY6XVobH1yB83hHsG09m
   IDmFl1sglTrDnRHcwVATvnlri39BT2qn+OmyNO4axqclgly1NDtAr3Jkp
   Mz0ci87jIOBRMZvgMSh7V2ZiIXgmsUkiPb/i/7eRAoF1/rLfKK8VYHRb/
   RbHiIj6ZxTuBgyW6jDfQN4K/Z7D0dOS9zsRvJ1+gdwi5l9WkK7pIOpfGw
   Q==;
X-CSE-ConnectionGUID: O40gbkiRRgKDYUDfE9RnJw==
X-CSE-MsgGUID: 65sGqSPcRkKpqFkQf/dWwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="54335458"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="54335458"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 02:44:49 -0700
X-CSE-ConnectionGUID: JI2wSHhgSRqXRE+D2KkNwA==
X-CSE-MsgGUID: c9tgZJETS2i096bpoqB07Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="157407359"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Jul 2025 02:44:48 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uche1-000EWH-2L;
	Fri, 18 Jul 2025 09:44:45 +0000
Date: Fri, 18 Jul 2025 17:44:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1732/1732]
 drivers/scsi/sssraid/sssraid_os.c:1704:2: error: implicit declaration of
 function 'for_each_pci_msi_entry'
Message-ID: <202507181741.tfXG7WLG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   700db19c02e9c8dcf291aa7a6a29337c97ea1805
commit: 2e2a4edd9d4a725c5474dc278b090913d9b5bfd5 [1732/1732] SCSI: SSSRAID: Support 3SNIC 3S5XX serial RAID/HBA  controllers
config: x86_64-buildonly-randconfig-005-20250718 (https://download.01.org/0day-ci/archive/20250718/202507181741.tfXG7WLG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507181741.tfXG7WLG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507181741.tfXG7WLG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/sssraid/sssraid_os.c:1704:2: error: implicit declaration of function 'for_each_pci_msi_entry' [-Werror,-Wimplicit-function-declaration]
    1704 |         for_each_pci_msi_entry(entry, pdev) {
         |         ^
>> drivers/scsi/sssraid/sssraid_os.c:1704:37: error: expected ';' after expression
    1704 |         for_each_pci_msi_entry(entry, pdev) {
         |                                            ^
         |                                            ;
>> drivers/scsi/sssraid/sssraid_os.c:1705:43: error: no member named 'msi_list' in 'struct device'
    1705 |                 struct list_head *msi_list = &pdev->dev.msi_list;
         |                                               ~~~~~~~~~ ^
   drivers/scsi/sssraid/sssraid_os.c:1716:5: error: 'continue' statement not in loop statement
    1716 |                                 continue;
         |                                 ^
   drivers/scsi/sssraid/sssraid_os.c:1726:3: error: 'continue' statement not in loop statement
    1726 |                 continue;
         |                 ^
   5 errors generated.


vim +/for_each_pci_msi_entry +1704 drivers/scsi/sssraid/sssraid_os.c

  1689	
  1690	static int sssraid_map_queues(struct Scsi_Host *shost)
  1691	{
  1692		struct sssraid_ioc *sdioc = shost_priv(shost);
  1693		struct pci_dev *pdev = sdioc->pdev;
  1694		struct msi_desc *entry = NULL;
  1695		struct blk_mq_tag_set *tag_set = &shost->tag_set;
  1696		unsigned int *map = tag_set->mq_map;
  1697		const struct cpumask *node_mask = NULL;
  1698		unsigned int nr_queues = tag_set->nr_hw_queues;
  1699		unsigned int node_id, node_id_last = 0xFFFFFFFF;
  1700		int cpu, queue = 0;
  1701		u8 node_count = 0, i;
  1702		unsigned int node_id_array[100];
  1703	
> 1704		for_each_pci_msi_entry(entry, pdev) {
> 1705			struct list_head *msi_list = &pdev->dev.msi_list;
  1706	
  1707			if (list_is_last(msi_list, &entry->list))
  1708				goto get_next_numa_node;
  1709	
  1710			if (entry->irq) {
  1711				node_mask = entry->affinity;
  1712	
  1713				cpu = cpumask_first(node_mask);
  1714				node_id = cpu_to_node(cpu);
  1715				if (node_id_last == node_id)
  1716					continue;
  1717	
  1718				for (i = 0; i < node_count; i++) {
  1719					if (node_id == node_id_array[i])
  1720						goto get_next_numa_node;
  1721				}
  1722				node_id_array[node_count++] = node_id;
  1723				node_id_last = node_id;
  1724			}
  1725	get_next_numa_node:
  1726			continue;
  1727		}
  1728	
  1729		for (i = 0; i < node_count; i++) {
  1730			node_mask = cpumask_of_node(node_id_array[i]);
  1731			dbgprint(sdioc, "NUMA_node = %d\n", node_id_array[i]);
  1732			for_each_cpu(cpu, node_mask) {
  1733				map[cpu] = (queue < nr_queues) ? queue++ : 0;
  1734				dbgprint(sdioc, "map[%d] = %d\n", cpu, map[cpu]);
  1735			}
  1736		}
  1737	
  1738		return 0;
  1739	}
  1740	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
