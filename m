Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE1E188012
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 08:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733299718; cv=none; b=FuONzKOxLIRU3gkBvDDLV55Cr4/EPMRt3Vi9akxgs4PI1IYS3Xh2+GEK57cYgiNhncmFlPmiWb7HuTVJzDZh1ww4XQcUK5/ukPoqEs5kKhHoaSYP+D28dpfma0cStVHPbhvrruiVImMWvqlgeIDkwBuhWKQo/wFa4O+0XxvvAUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733299718; c=relaxed/simple;
	bh=SGw6XYxhUQRnna/TOCsN2pdSnWTY7AYyC+45JpAzHp8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VN1Xhg85BGXrtgD2BrzQKAveyUiAXRpuvCNRQh5+glFQHW1BmmcXJYXdCQQOt/Z3bpeOdP1Hb/CGI+MuODUNHM6n9TF7+At2VPuBhBCUCA+wBzUR/SLTT0YFenSc8lAeyK/oT6tkWMTrkos64+0iWcQfhyGzuGTGvbyHXENdENw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AYyWADhV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AYyWADhV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733299716; x=1764835716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SGw6XYxhUQRnna/TOCsN2pdSnWTY7AYyC+45JpAzHp8=;
  b=AYyWADhVcHgiYH7ygfxiWvbkFBV3znh+uWDJ9d+OjEMtfkC9fsH9IZ2O
   TgHJUn/1HkDNMnlUu1or0jgjOKMGZzJAqr60OT+4t332Uqupz2cwwx8DA
   7irBS08I81Fi4Xz3vnh9iIFTuqFtUglTBk1mjwyt7TfIYjW2eCT9yLozl
   OOdOR9TsCc+Ku0kTAKeYvbmgHvIAunsg816nGt5BgKYdslwEnJtJJPpk2
   kSCOULlWCNBA1B5Hx21PcInN8Tf6oRZsSoiQAYKysC5lWPicylNuOxmOm
   iIz5l8tS3j1VxS0DHaJa2iyaMqEc2DVYZ3maaFFSZoG3C54EsDYKTIITb
   A==;
X-CSE-ConnectionGUID: f4NBvINbRiGFZVFsvKbWzw==
X-CSE-MsgGUID: eQGhUJAFS/uX1+MmieVYIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44214963"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44214963"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 00:08:34 -0800
X-CSE-ConnectionGUID: 5DwepD4LRNaP/T6FC6zOvw==
X-CSE-MsgGUID: daDZoRjAR2WD9zwPCxhepw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="93781812"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 04 Dec 2024 00:08:33 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIkQw-0002k1-22;
	Wed, 04 Dec 2024 08:08:30 +0000
Date: Wed, 4 Dec 2024 16:08:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yizhen Fan <fanyizhen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2516/2516]
 drivers/ub/urma/ubcore/ubcore_netdev.c:213:5: warning: no previous prototype
 for 'ubcore_unset_port_netdev'
Message-ID: <202412041601.Eu6aB1G8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yizhen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b71af6f00ede58be00cb7306c9acb2660ec90947
commit: 37c6170f742ef3a18a3131a2a157dd7b7aa08103 [2516/2516] ub: Fix bugs in urma kernel and user lib
config: arm64-randconfig-003-20241203 (https://download.01.org/0day-ci/archive/20241204/202412041601.Eu6aB1G8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041601.Eu6aB1G8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041601.Eu6aB1G8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/urma/ubcore/ubcore_netdev.c:51:5: warning: no previous prototype for 'ubcore_check_port_state' [-Wmissing-prototypes]
      51 | int ubcore_check_port_state(struct ubcore_device *dev, uint8_t port_idx)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:75:6: warning: no previous prototype for 'ubcore_find_port_netdev' [-Wmissing-prototypes]
      75 | void ubcore_find_port_netdev(struct ubcore_device *dev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:133:5: warning: no previous prototype for 'ubcore_set_port_netdev' [-Wmissing-prototypes]
     133 | int ubcore_set_port_netdev(struct ubcore_device *dev, struct net_device *ndev,
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_netdev.c:213:5: warning: no previous prototype for 'ubcore_unset_port_netdev' [-Wmissing-prototypes]
     213 | int ubcore_unset_port_netdev(struct ubcore_device *dev, struct net_device *ndev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:242:6: warning: no previous prototype for 'ubcore_put_port_netdev' [-Wmissing-prototypes]
     242 | void ubcore_put_port_netdev(struct ubcore_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:262:10: warning: no previous prototype for 'ubcore_sip_idx_alloc' [-Wmissing-prototypes]
     262 | uint32_t ubcore_sip_idx_alloc(uint32_t idx)
         |          ^~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:290:5: warning: no previous prototype for 'ubcore_sip_idx_free' [-Wmissing-prototypes]
     290 | int ubcore_sip_idx_free(uint32_t idx)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:303:6: warning: no previous prototype for 'ubcore_sip_table_init' [-Wmissing-prototypes]
     303 | void ubcore_sip_table_init(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:309:6: warning: no previous prototype for 'ubcore_sip_table_uninit' [-Wmissing-prototypes]
     309 | void ubcore_sip_table_uninit(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:324:5: warning: no previous prototype for 'ubcore_add_sip_entry' [-Wmissing-prototypes]
     324 | int ubcore_add_sip_entry(const struct ubcore_sip_info *sip, uint32_t idx)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:344:5: warning: no previous prototype for 'ubcore_del_sip_entry' [-Wmissing-prototypes]
     344 | int ubcore_del_sip_entry(uint32_t idx)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:358:5: warning: no previous prototype for 'ubcore_lookup_sip_idx' [-Wmissing-prototypes]
     358 | int ubcore_lookup_sip_idx(struct ubcore_sip_info *sip, uint32_t *idx)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:379:10: warning: no previous prototype for 'ubcore_get_sip_max_cnt' [-Wmissing-prototypes]
     379 | uint32_t ubcore_get_sip_max_cnt(void)
         |          ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:384:25: warning: no previous prototype for 'ubcore_lookup_sip_info' [-Wmissing-prototypes]
     384 | struct ubcore_sip_info *ubcore_lookup_sip_info(uint32_t idx)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:395:5: warning: no previous prototype for 'ubcore_notify_uvs_del_sip' [-Wmissing-prototypes]
     395 | int ubcore_notify_uvs_del_sip(struct ubcore_device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:437:5: warning: no previous prototype for 'ubcore_notify_uvs_add_sip' [-Wmissing-prototypes]
     437 | int ubcore_notify_uvs_add_sip(struct ubcore_device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ubcore_unset_port_netdev +213 drivers/ub/urma/ubcore/ubcore_netdev.c

   212	
 > 213	int ubcore_unset_port_netdev(struct ubcore_device *dev, struct net_device *ndev,
   214		unsigned int port_id)
   215	{
   216		struct ubcore_ndev_port *port_info;
   217	
   218		if (dev == NULL || ndev == NULL) {
   219			ubcore_log_err("invalid input parameter.\n");
   220			return -1;
   221		}
   222		down_write(&g_port_list_lock);
   223		list_for_each_entry(port_info, &dev->port_list, node) {
   224			if (port_info->ndev == ndev) {
   225				if (ubcore_del_port(port_info, (uint8_t)port_id, dev, ndev) != 0) {
   226					up_write(&g_port_list_lock);
   227					ubcore_log_err("Failed to do ubcore_del_port");
   228					return -1;
   229				}
   230				up_write(&g_port_list_lock);
   231				return 0;
   232			}
   233		}
   234		up_write(&g_port_list_lock);
   235	
   236		ubcore_log_err("Failed to find and remove ndev:%s dev_name: %s bound port: %u\n",
   237			netdev_name(ndev), dev->dev_name, port_id);
   238		return -1;
   239	}
   240	EXPORT_SYMBOL(ubcore_unset_port_netdev);
   241	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
