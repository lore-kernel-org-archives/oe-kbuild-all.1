Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748A6360
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Jul 2025 02:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751683333; cv=none; b=Y+jnO42EFBBKk5HA8BZ/HXzVWIFICAVtzbnUIoJ2msJAgRG9rZp6Buj8agg1f4KkjPLB745iLs3j0Ub4JADPpihuXZuZDUB7YLC6d0T335dXmYwblrSMMfTO4FzD/ZVO7SBkhRQz7Or2h8xV7KjoM5VZEGuL5QbmyX2ADhXO8k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751683333; c=relaxed/simple;
	bh=7SDj9nyNVBOLUf8/ai5QWRlQA9FpJ4sWQK5r8B/8np0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bIBe8V4BPcYce/3lMS/Ot9Aia4ABUklsvRc8gW4EKDciigObyyMx8zaEYT8NqjWJ8wfIsftV9xAhZT8RvV+VqGOJKAbwf4uTv2P2rDkhqNR/Fj0ir+wV5i1sxO2elFOsjOvCpfXqWO6brZgppdOkcELPDyAYzyYiUo3YBZQ2/W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kbk1S7jn; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kbk1S7jn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751683329; x=1783219329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7SDj9nyNVBOLUf8/ai5QWRlQA9FpJ4sWQK5r8B/8np0=;
  b=kbk1S7jnKB1Hpp4/0m28BNzle1mzAg7VBmoF1PDPY1lzo5S5IXlPJQGD
   pQJdfUSOf0gbwqI6WjggZ0s/zOcTUO3U32OvJXzN1AAw4JjizsZlz0ENc
   ds6WrFNkdoWCTgfTMGLn2W934ir84TqqjjsYCif9iwAg1SLimd/vuQ4ae
   hQqtD+YQDjrmr2JbD/uaWocA6mEe0aO2OY2pFM3XdJs4mYbRU287gOpEY
   BmJcZq7Yq4tU9GpfjS/qOjHB0boQP0fViRXIlFMFW45RoCsS8f6muwL4j
   hoVLNDxUQRticrc+fCQvjdNKL+J08Zp5ixTAb5VS5m6yRYH5vLX9ZIiBg
   g==;
X-CSE-ConnectionGUID: uERaF5sASGu8zdUGhsMx7Q==
X-CSE-MsgGUID: DL3f8OcRRayMPuGfe+swug==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="57670408"
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="57670408"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 19:42:08 -0700
X-CSE-ConnectionGUID: 61QUFjXDS3CVwldmRvhz4w==
X-CSE-MsgGUID: M1Dx02bkTwKV5N/OKozU7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="191934933"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Jul 2025 19:42:08 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXsqs-0004DN-0w;
	Sat, 05 Jul 2025 02:42:06 +0000
Date: Sat, 5 Jul 2025 10:41:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jia Qingtong <jiaqingtong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2439/2439]
 drivers/irqchip/irq-gic-v3-its.c:422:6: warning: no previous prototype for
 function 'build_devid_pools'
Message-ID: <202507051010.IHIzrory-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   016a2eb38be5e29bea5011bd5fed627886f59f65
commit: dce2ff908fc83eb4decc87632bdd0cad670528cf [2439/2439] irqchip/gic-v3-its: Move build_devid_pools from its to acpi iort init
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250705/202507051010.IHIzrory-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507051010.IHIzrory-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507051010.IHIzrory-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/irqchip/irq-gic-v3-its.c:7:
   In file included from include/linux/acpi.h:37:
   In file included from include/acpi/acpi_io.h:7:
   In file included from arch/arm64/include/asm/acpi.h:14:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2253:
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
>> drivers/irqchip/irq-gic-v3-its.c:422:6: warning: no previous prototype for function 'build_devid_pools' [-Wmissing-prototypes]
     422 | void build_devid_pools(void)
         |      ^
   drivers/irqchip/irq-gic-v3-its.c:422:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     422 | void build_devid_pools(void)
         | ^
         | static 
   drivers/irqchip/irq-gic-v3-its.c:54:12: warning: unused function 'iort_get_used_bus_bitmap' [-Wunused-function]
      54 | static int iort_get_used_bus_bitmap(unsigned long **bus_bm, resource_size_t *len)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   7 warnings generated.


vim +/build_devid_pools +422 drivers/irqchip/irq-gic-v3-its.c

   417	
   418	#ifdef CONFIG_VIRT_PLAT_DEV
   419	/*
   420	 * Currently we only build *one* devid pool.
   421	 */
 > 422	void build_devid_pools(void)
   423	{
   424		struct its_node *its;
   425	
   426		its = list_first_entry(&its_nodes, struct its_node, entry);
   427		if (readl_relaxed(its->base + GITS_IIDR) != 0x00051736)
   428			return;
   429	
   430		if (!probe_devid_pool_one())
   431			rsv_devid_pool_cap = true;
   432	
   433		if (rsv_devid_pool_cap)
   434			pr_info("ITS: reserved device id pools enabled\n");
   435	}
   436	#endif
   437	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
