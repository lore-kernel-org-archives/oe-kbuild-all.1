Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B755D3234
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 04:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735620348; cv=none; b=ncOEqZjfH2Y4McUdqtLbQP1IpgLz0v6hJaZ0LdB5HkuDccrMyfGHcLHciw7suectYGmRp339jzqjgdDVd4c+yvdSDu0MAGSZBLVGpmESzxlwpJWJB7D8JDdRZtFUGSzEVWttNnLCcc54ca1ATnGlCqZkAREq0a4omRkUDhw1YjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735620348; c=relaxed/simple;
	bh=aB1OzJF+dI8FSBUZ+/j3kIr4YOfwrOWf/W/8tQguREE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zz0gVlCvTmB/0ZL2tp0nMC/CwwwAOpUjlDJUBNIsFyu/zJWRVLZ9YK57WeB44kY09uk0UV2JcksoJj2bY4ZPayMnaTow+FyjLvu9ZXCOFA4P6lFoRnuwhX2eyFVvMooxhTEpFVWrmTga1ZeqoggKOtja0UrNHOWIsT/d/5ei3NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QcEGRJey; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QcEGRJey"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735620347; x=1767156347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aB1OzJF+dI8FSBUZ+/j3kIr4YOfwrOWf/W/8tQguREE=;
  b=QcEGRJeykNwykAoeGHxWD9/rU9hef1vbbTIoBu5JNDzkcpiCUoDRJ5Tm
   j6Ugafz66K0s6sjVGE4jlMzNQcP6lPXbRv5HNapQx1CScUDMUdKhGHVaQ
   oROW4l/o/WUOC3mUwnBvtf4fZkgumswdWBJBeTsGpO0rbmO88L23F2J1a
   2y+GruSvtkdA2UxmDNrAD2HDRV8X6hZCWLckWDj9O8dKsh1p6XlR7CozO
   UCYvqa86Phe+Tep+60SxG7OuiWz52yLVYEgFOnGJbqVsK5O9xErDTrSiu
   3oMf9QBncXKLFrz6vHLFTRSZ0Y53spUlS76jEqAgDlDJt6ZUsw30wAC9a
   w==;
X-CSE-ConnectionGUID: dyEfmetJShuTrSq0lvocjA==
X-CSE-MsgGUID: xtEOIE/PToekVSKZuSOpiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="35786043"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="35786043"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 20:45:46 -0800
X-CSE-ConnectionGUID: ZdMvmixkT4unO8/dozev+w==
X-CSE-MsgGUID: S9ABsFKKTm2jnO5vgVfGcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105577884"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Dec 2024 20:45:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSU8U-0006jj-3D;
	Tue, 31 Dec 2024 04:45:42 +0000
Date: Tue, 31 Dec 2024 12:45:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1359/1359]
 drivers/scsi/sssraid/sssraid_os.c:1704:9: error: implicit declaration of
 function 'for_each_pci_msi_entry'; did you mean 'for_each_msi_entry'?
Message-ID: <202412311259.7ewDSIIe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4dc4cec05b40921a3db85d24f97f1142272e4abf
commit: 2e2a4edd9d4a725c5474dc278b090913d9b5bfd5 [1359/1359] SCSI: SSSRAID: Support 3SNIC 3S5XX serial RAID/HBA  controllers
config: x86_64-buildonly-randconfig-004-20241231 (https://download.01.org/0day-ci/archive/20241231/202412311259.7ewDSIIe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412311259.7ewDSIIe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412311259.7ewDSIIe-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/scsi/sssraid/sssraid_os.c: In function 'sssraid_map_queues':
>> drivers/scsi/sssraid/sssraid_os.c:1704:9: error: implicit declaration of function 'for_each_pci_msi_entry'; did you mean 'for_each_msi_entry'? [-Werror=implicit-function-declaration]
    1704 |         for_each_pci_msi_entry(entry, pdev) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         for_each_msi_entry
>> drivers/scsi/sssraid/sssraid_os.c:1704:44: error: expected ';' before '{' token
    1704 |         for_each_pci_msi_entry(entry, pdev) {
         |                                            ^~
         |                                            ;
   drivers/scsi/sssraid/sssraid_os.c:1702:22: warning: unused variable 'node_id_array' [-Wunused-variable]
    1702 |         unsigned int node_id_array[100];
         |                      ^~~~~~~~~~~~~
>> drivers/scsi/sssraid/sssraid_os.c:1701:28: warning: unused variable 'i' [-Wunused-variable]
    1701 |         u8 node_count = 0, i;
         |                            ^
   drivers/scsi/sssraid/sssraid_os.c:1701:12: warning: unused variable 'node_count' [-Wunused-variable]
    1701 |         u8 node_count = 0, i;
         |            ^~~~~~~~~~
   drivers/scsi/sssraid/sssraid_os.c:1700:18: warning: unused variable 'queue' [-Wunused-variable]
    1700 |         int cpu, queue = 0;
         |                  ^~~~~
>> drivers/scsi/sssraid/sssraid_os.c:1700:13: warning: unused variable 'cpu' [-Wunused-variable]
    1700 |         int cpu, queue = 0;
         |             ^~~
>> drivers/scsi/sssraid/sssraid_os.c:1699:31: warning: unused variable 'node_id_last' [-Wunused-variable]
    1699 |         unsigned int node_id, node_id_last = 0xFFFFFFFF;
         |                               ^~~~~~~~~~~~
>> drivers/scsi/sssraid/sssraid_os.c:1699:22: warning: unused variable 'node_id' [-Wunused-variable]
    1699 |         unsigned int node_id, node_id_last = 0xFFFFFFFF;
         |                      ^~~~~~~
>> drivers/scsi/sssraid/sssraid_os.c:1698:22: warning: unused variable 'nr_queues' [-Wunused-variable]
    1698 |         unsigned int nr_queues = tag_set->nr_hw_queues;
         |                      ^~~~~~~~~
   drivers/scsi/sssraid/sssraid_os.c:1697:31: warning: unused variable 'node_mask' [-Wunused-variable]
    1697 |         const struct cpumask *node_mask = NULL;
         |                               ^~~~~~~~~
>> drivers/scsi/sssraid/sssraid_os.c:1696:23: warning: unused variable 'map' [-Wunused-variable]
    1696 |         unsigned int *map = tag_set->mq_map;
         |                       ^~~
   drivers/scsi/sssraid/sssraid_os.c:1739:1: warning: no return statement in function returning non-void [-Wreturn-type]
    1739 | }
         | ^
   cc1: some warnings being treated as errors


vim +1704 drivers/scsi/sssraid/sssraid_os.c

  1689	
  1690	static int sssraid_map_queues(struct Scsi_Host *shost)
  1691	{
  1692		struct sssraid_ioc *sdioc = shost_priv(shost);
  1693		struct pci_dev *pdev = sdioc->pdev;
  1694		struct msi_desc *entry = NULL;
  1695		struct blk_mq_tag_set *tag_set = &shost->tag_set;
> 1696		unsigned int *map = tag_set->mq_map;
  1697		const struct cpumask *node_mask = NULL;
> 1698		unsigned int nr_queues = tag_set->nr_hw_queues;
> 1699		unsigned int node_id, node_id_last = 0xFFFFFFFF;
> 1700		int cpu, queue = 0;
> 1701		u8 node_count = 0, i;
  1702		unsigned int node_id_array[100];
  1703	
> 1704		for_each_pci_msi_entry(entry, pdev) {
  1705			struct list_head *msi_list = &pdev->dev.msi_list;
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
