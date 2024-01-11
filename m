Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CC31856
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 05:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TZ7/Qq8B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704950093; x=1736486093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jrs3Y9ElLtkBHyCdaxIQ3sx2/cLOhOQzjXKhYeouxyM=;
  b=TZ7/Qq8BIeA21r+K0rvL066fXYJtfMWSN1v8oLc+5eoEGw8zFArpTteE
   d5wT3CkCitbPHsq3CCpuCngtf7pMm/MKLUd1OBI0SwQq1alemGkQ4eiUh
   6btKfzBDC4zi+0qtMsj/nLeg7q/Nk492WwkCk+vzXwf2LSrQz759J1mBU
   sFEO81q50cBD4og0n+WUpzfushdaJKm8idlD+Iq9nct+sTjmrzil22Ajb
   q+8A7mpD4pqhAu+G4owQ3xk3Y9KBgKOPCJFd1xrY0qhGhWpgDC633qW40
   3xsrVxtNccK5h78nsKsQFI55su328Q9yNaqAGqYf9d57SEfYRJPanv5ZD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="5826905"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="5826905"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 21:14:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="1113705787"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="1113705787"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 10 Jan 2024 21:14:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNnOv-0007rY-1a;
	Thu, 11 Jan 2024 05:14:45 +0000
Date: Thu, 11 Jan 2024 13:13:58 +0800
From: kernel test robot <lkp@intel.com>
To: Rakie Kim <rakie.kim@sk.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry.memverge@gmail.com>,
	Gregory Price <gregory.price@memverge.com>,
	Honggyu Kim <honggyu.kim@sk.com>,
	Hyeongtak Ji <hyeongtak.ji@sk.com>
Subject: [gmprice:mempolicy2_mbind2 1/13] mm/mempolicy.c:3109:17: sparse:
 sparse: incompatible types in comparison expression (different address
 spaces):
Message-ID: <202401111343.92K4RgDo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gmprice/linux mempolicy2_mbind2
head:   5dc13fbba4bf6f4a96d78938d99006aebed9613e
commit: 0ae790a6d216e5777a213701819cdce76c032afe [1/13] mm/mempolicy: implement the sysfs-based weighted_interleave interface
config: powerpc64-randconfig-r112-20240111 (https://download.01.org/0day-ci/archive/20240111/202401111343.92K4RgDo-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240111/202401111343.92K4RgDo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401111343.92K4RgDo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mempolicy.c:154:1: sparse: sparse: symbol 'iw_table_mtx' was not declared. Should it be static?
>> mm/mempolicy.c:3109:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/mempolicy.c:3109:17: sparse:    struct iw_table [noderef] __rcu *
   mm/mempolicy.c:3109:17: sparse:    struct iw_table *
   mm/mempolicy.c:3134:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/mempolicy.c:3134:15: sparse:    struct iw_table [noderef] __rcu *
   mm/mempolicy.c:3134:15: sparse:    struct iw_table *
   mm/mempolicy.c:3140:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/mempolicy.c:3140:9: sparse:    struct iw_table [noderef] __rcu *
   mm/mempolicy.c:3140:9: sparse:    struct iw_table *
   mm/mempolicy.c:3245:16: sparse: sparse: symbol 'mempolicy_kobj' was not declared. Should it be static?
   mm/mempolicy.c: note: in included file (through include/linux/mmzone.h, include/linux/mempolicy.h):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   mm/mempolicy.c:592:9: sparse: sparse: context imbalance in 'queue_folios_pte_range' - unexpected unlock

vim +3109 mm/mempolicy.c

  3098	
  3099	static ssize_t node_show(struct kobject *kobj, struct kobj_attribute *attr,
  3100				 char *buf)
  3101	{
  3102		struct iw_node_attr *node_attr;
  3103		u8 weight;
  3104		struct iw_table *table;
  3105	
  3106		node_attr = container_of(attr, struct iw_node_attr, kobj_attr);
  3107	
  3108		rcu_read_lock();
> 3109		table = rcu_dereference(iw_table);
  3110		weight = table->weights[node_attr->nid];
  3111		rcu_read_unlock();
  3112	
  3113		return sysfs_emit(buf, "%d\n", weight);
  3114	}
  3115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
