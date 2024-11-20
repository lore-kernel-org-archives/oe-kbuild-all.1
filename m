Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE6049659
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 19:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732129349; cv=none; b=dHH854htH9evqYRp9UZh1sItCUXoAfcTXFu95VvURZbmZYSvCW1QXCXgU724dofTjzt6QN9TKk+et80Ofm/Gz0wWIJ+RU+vEeLXtPIZf7t4pEe+2XIhcBrgUOWjw4scUYbQNI38aV2HeMkPQnB3GzD+2R8vvorjKM2be8R2qtoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732129349; c=relaxed/simple;
	bh=L26I2zZP80IN+gluA1PmMicr80Ad2JZdYjJReG8U2XE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=df5+r0Mli/KBvqp66WFUNJw6FUCPOlL+GSx0jmFjq7yjBeGVkZ+0lBjZ30Ki86k4tR2rDCaYfb1gg/xTYTXV9FLwxd/ws51JAGjXHVFxvFm4yba4GMpKDL+/HJ4fMQRA2E9QLMfkYDFsHXxojTULHvkY3lGiNspx6IlL5gNgH7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l1C+e/4P; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l1C+e/4P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732129348; x=1763665348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L26I2zZP80IN+gluA1PmMicr80Ad2JZdYjJReG8U2XE=;
  b=l1C+e/4P5q6kmeGmbp4eGf+3d8/JYIqt6xoSLuAhTr8pDhY+AaqKPVy1
   aW6RiDqqTlpMjSSpCExtjCQogJPHROkhZ9s2ZfLk0GK7b7kh4bi2ZqlMv
   yFRck2xBx0qogo8Ee7nCCoVS5fSFnw8ULQT+G0ftUoBUwZ6SI2D/xCIhL
   pX257HBiTSyjyjdoKZ0iy2a3quhL/yTqdYU6AkzN1pJ0RUjxeUs9ei1SF
   Zuh4M0f6/AzX0fHrDBHJnI1BMStKGyq6Az3ELNW5D9oPITplhVHSERbuL
   3Ioec3/1EJgcdwPlEon3iwM48lSwJUtpP7E7jekjMCRozkeIDk6CMHa2V
   A==;
X-CSE-ConnectionGUID: mqofY1cSQJSY7HGnBqOe5A==
X-CSE-MsgGUID: Ogr/zOANQ5CaN7lr16bM4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32456516"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="32456516"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 11:02:27 -0800
X-CSE-ConnectionGUID: +/n8IiHUSPqLJ1yskUEfDw==
X-CSE-MsgGUID: 8DkR6+3sREKV7xhR1Y5SPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="120951855"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Nov 2024 11:02:26 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDpy3-00016N-2E;
	Wed, 20 Nov 2024 19:02:23 +0000
Date: Thu, 21 Nov 2024 03:01:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, s00851154 <shijing34@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1495/1495]
 drivers/net/ethernet/huawei/hinic3/adapter/sw_cmdq/sw_cmdq_ops.c:77:34:
 warning: expression does not compute the number of elements in this array;
 element type is 'u16' (aka 'unsigned short'), not 'u32' (aka 'unsigned int')
Message-ID: <202411210200.MEZRD0ST-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cce003012298a00277187319a2527882a18278c1
commit: 0908fafca4fdc46cd425b6d2d39a5b283fbdc425 [1495/1495] net/hinic3: Support New SDK and NIC features
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241121/202411210200.MEZRD0ST-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411210200.MEZRD0ST-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411210200.MEZRD0ST-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/huawei/hinic3/adapter/sw_cmdq/sw_cmdq_ops.c:5:
   In file included from drivers/net/ethernet/huawei/hinic3/hinic3_nic_cmdq.h:7:
   In file included from drivers/net/ethernet/huawei/hinic3/ossl_knl.h:7:
   In file included from drivers/net/ethernet/huawei/hinic3/ossl_knl_linux.h:7:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:100:
   In file included from include/linux/tcp.h:17:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2247:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic3/adapter/sw_cmdq/sw_cmdq_ops.c:77:34: warning: expression does not compute the number of elements in this array; element type is 'u16' (aka 'unsigned short'), not 'u32' (aka 'unsigned int') [-Wsizeof-array-div]
      77 |         size = sizeof(indir_tbl->entry) / sizeof(u32);
         |                       ~~~~~~~~~~~~~~~~  ^
   drivers/net/ethernet/huawei/hinic3/adapter/sw_cmdq/sw_cmdq_ops.c:77:34: note: place parentheses around the 'sizeof(u32)' expression to silence this warning
   6 warnings generated.
--
   In file included from drivers/net/ethernet/huawei/hinic3/hinic3_nic_io.c:7:
   In file included from include/linux/pci.h:1669:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2247:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic3/hinic3_nic_io.c:272:5: warning: no previous prototype for function 'hinic3_get_rq_wqe_type' [-Wmissing-prototypes]
     272 | int hinic3_get_rq_wqe_type(void *hwdev)
         |     ^
   drivers/net/ethernet/huawei/hinic3/hinic3_nic_io.c:272:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     272 | int hinic3_get_rq_wqe_type(void *hwdev)
         | ^
         | static 
   6 warnings generated.


vim +77 drivers/net/ethernet/huawei/hinic3/adapter/sw_cmdq/sw_cmdq_ops.c

    61	
    62	static u8 prepare_cmd_buf_set_rss_indir_table(const struct hinic3_nic_io *nic_io,
    63						      const u32 *indir_table,
    64						      struct hinic3_cmd_buf *cmd_buf)
    65	{
    66		u32 i, size;
    67		u32 *temp = NULL;
    68		struct nic_rss_indirect_tbl *indir_tbl = NULL;
    69	
    70		indir_tbl = (struct nic_rss_indirect_tbl *)cmd_buf->buf;
    71		cmd_buf->size = sizeof(struct nic_rss_indirect_tbl);
    72		memset(indir_tbl, 0, sizeof(*indir_tbl));
    73	
    74		for (i = 0; i < NIC_RSS_INDIR_SIZE; i++)
    75			indir_tbl->entry[i] = (u16)(*(indir_table + i));
    76	
  > 77		size = sizeof(indir_tbl->entry) / sizeof(u32);
    78		temp = (u32 *)indir_tbl->entry;
    79		for (i = 0; i < size; i++)
    80			temp[i] = cpu_to_be32(temp[i]);
    81	
    82		return (u8)HINIC3_UCODE_CMD_SET_RSS_INDIR_TABLE;
    83	}
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
