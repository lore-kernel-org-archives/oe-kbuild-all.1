Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AA415C0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Dec 2024 01:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734225347; cv=none; b=IvKAFHD34Zv8Nas3vw9njOxRVLiHMHKkODzbzsx0XEr2/efYgsQueDTOoTRsK8P2n/eIA5e6AnmyKZOsncBbHmHamwkmCMT4EvEj5pxOu/V9pvupotf9RuuT+HmVBl0ipPeaSjgzADYL5tArQTFeNpu9RjDULJ3vyWlhbOGz2vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734225347; c=relaxed/simple;
	bh=MTj9Cr9KiaWY9wdyeiibj+BalyUypi1o03C7DNKFEXI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k6OsvrbbVn7f6z6R/7oL88cQhFN3l58bKzxhAq6PGTO0n81sFi3DLDT/utSCTJjp4oXXQDIG9G3NIEKDN1aypRpEoatSDeY2gV9nAFms+UCS65qajOyutDTL+AUiHXlLJf75aTZSYNXvIWjnte4LBMF4X+X03PWTW/yeLhUhDDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQV2F+KV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQV2F+KV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734225345; x=1765761345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MTj9Cr9KiaWY9wdyeiibj+BalyUypi1o03C7DNKFEXI=;
  b=XQV2F+KV9tjfyBs6AHL0AzdpkZgAfU8SWRRaL+HqFubLMCqO9M6/UNv+
   xRRHalCKqULgEIOwYVh7w6pUiScwJAH0IrQ7V9GViyuCuRWyWN9BqyT2U
   /JkLQkLujO6Wb9/yl4VChW08kCIAGlSWAnFksDRzMnQ8EXhcvDx6ivW09
   1vXSsp8KrgVAPiL5JZK/eRQcsfHc9Y1f1IEHAtW6L3g6z1OMpW8iozqBc
   JBMl7JwlLru2rRmiu+Wr+WyecgY15NNVjBEBRAt0627/LaB3izImcSRH0
   jG9JRm9cW/QilfT03N9/6bhmD4zPaZfcm+2OAfeaqTl8EM2PIY612FWfw
   g==;
X-CSE-ConnectionGUID: 7itYQJHDT7uRX/2I9ST/qg==
X-CSE-MsgGUID: B2ZcChQ9Sby0dVsljJ7f+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45128524"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45128524"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 17:15:45 -0800
X-CSE-ConnectionGUID: SDTqEp0BQZa19dvlStdZ3g==
X-CSE-MsgGUID: G5j9TQHpR3OtOXI6lzamNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="101712083"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Dec 2024 17:15:43 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMdES-000DMI-31;
	Sun, 15 Dec 2024 01:15:40 +0000
Date: Sun, 15 Dec 2024 09:15:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Fengyan <mufengyan@hisilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2566/2566]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_unic_guid.c:279:5: warning:
 no previous prototype for function 'hclge_unic_del_mc_guid_common'
Message-ID: <202412150919.g1didEmM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6c3413fbf8c430b89f5d23f465e10e99ea145199
commit: a1799222294b713b168b8444b973c2b9d69c64d9 [2566/2566] UNIC: Support using MC GUID and table management
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241215/202412150919.g1didEmM-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412150919.g1didEmM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412150919.g1didEmM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_unic_guid.c:16:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:14:
   In file included from include/linux/mm.h:1573:
   include/linux/vmstat.h:417:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:445:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_unic_guid.c:21:
   In file included from drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.h:11:
   include/net/devlink.h:28:19: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
      28 |         u32 reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:25:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      25 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:29:26: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
      29 |         u32 remote_reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:25:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      25 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_unic_guid.c:170:5: warning: no previous prototype for function 'hclge_unic_add_mc_guid_common' [-Wmissing-prototypes]
     170 | int hclge_unic_add_mc_guid_common(struct hclge_vport *vport,
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_unic_guid.c:170:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     170 | int hclge_unic_add_mc_guid_common(struct hclge_vport *vport,
         | ^
         | static 
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_unic_guid.c:279:5: warning: no previous prototype for function 'hclge_unic_del_mc_guid_common' [-Wmissing-prototypes]
     279 | int hclge_unic_del_mc_guid_common(struct hclge_vport *vport,
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_unic_guid.c:279:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     279 | int hclge_unic_del_mc_guid_common(struct hclge_vport *vport,
         | ^
         | static 
   9 warnings generated.


vim +/hclge_unic_del_mc_guid_common +279 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_unic_guid.c

   278	
 > 279	int hclge_unic_del_mc_guid_common(struct hclge_vport *vport,
   280					  const unsigned char *mguid)
   281	{
   282		struct hclge_unic_mc_guid_cfg_cmd req = {0};
   283		struct hclge_dev *hdev = vport->back;
   284		struct hclge_desc desc[3];
   285		int ret;
   286	
   287		memcpy(req.mguid, mguid, UBL_ALEN);
   288		ret = hclge_unic_lookup_mc_guid(vport, &req, desc);
   289		if (!ret) {
   290			ret = hclge_unic_fill_del_desc(vport, &req, desc);
   291			if (ret)
   292				return ret;
   293			if (hclge_unic_is_all_function_deleted(desc)) {
   294				ret = hclge_unic_del_mc_guid_cmd(vport, &req, desc);
   295				if (!ret) {
   296					clear_bit(req.index, hdev->mc_guid_tbl_bmap);
   297					hdev->used_mc_guid_num--;
   298				}
   299			} else {
   300				return hclge_unic_add_mc_guid_cmd(vport, &req, desc);
   301			}
   302		} else if (ret == -ENOENT) {
   303			ret = 0;
   304		}
   305	
   306		return ret;
   307	}
   308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
