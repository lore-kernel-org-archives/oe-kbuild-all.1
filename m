Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A74C18641
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 01:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727573352; cv=none; b=b4MOytLXvuPJF85tfLBV+vdSIcP7CAMH1pmPsixeS5g2zbgeI7HVpiVgehpsciRX0nhJpJAPmTrlsWVFFv5dOmlj5d5EoZNxMDmVpZmuq9V7CNDHTcEwvdBT6PtvwAfEBDm4m51bEjrFoNwhIWNMgbXhNfMTTa/E3Cgy6oA3zX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727573352; c=relaxed/simple;
	bh=+uC/Zs1Cn39R5KKWK8NSwB9u1hlatv8JEPAa0OnCHqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AM/95IVPKLDUkkUV1pCzbBRnQSR0sIbHeGn+3KPZNIW+lAGNoU1Q4K99xuD2jv/pl5x3nZVxwWSuz1V3vIRJHxZkv9gKhAi+6DOCoxKnoF07dbTOFchpbgMHmZE3QjIz9O6Efrm39xpGyda+AvvKvESp94Ur7XK0S3FFJS5r4Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G2DJ18P7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G2DJ18P7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727573350; x=1759109350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+uC/Zs1Cn39R5KKWK8NSwB9u1hlatv8JEPAa0OnCHqw=;
  b=G2DJ18P7Y2bakCpQs+BBt/DHr2jsD5RqutijCuyg2oRpanZ2Ke5ewxD1
   phx/1gBRqAyCYH7BuYpOfPxwMKbn3SjPvyOGciyenUBNxKM4+oFrtEfBz
   RJJ50H9hNb8AwiCu7ob4fqxluurPZMev31rKzEoMVPOUoGlvJAhXRPgR+
   YvVLcdiL1iVv+4RRcsITI4zc39qXce8OggzLhkftiyoBmGfjWYB69eP5/
   JzPl56/gQTuEuIjxpbrtSHLkiIwSUKw0gZsxBADZsiDr9yK8vl1sLzUAx
   5+qECbQPFhFJKUHUyycL3oKPN6L2AMQmTkOPCilI386PXRe/Sy6MqD0Lk
   g==;
X-CSE-ConnectionGUID: VzRCNS8dS8iMIQPDemUWqA==
X-CSE-MsgGUID: xpJU0hKkS5Sdzy9Q7LB7ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="52100369"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="52100369"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 18:29:08 -0700
X-CSE-ConnectionGUID: mIE6syRzSk+hRIoxYszm/A==
X-CSE-MsgGUID: V/f/7GPRR9KLq0uqzQkGDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="77437606"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Sep 2024 18:29:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suikD-000NoA-2U;
	Sun, 29 Sep 2024 01:29:05 +0000
Date: Sun, 29 Sep 2024 09:28:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yizhen Fan <fanyizhen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 21562/30000]
 drivers/ub/urma/ubcore/ubcore_netdev.c:213:5: warning: no previous prototype
 for 'ubcore_unset_port_netdev'
Message-ID: <202409290901.wWQmpMUX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   bef6f06e039b8929481350d15d6d8c3ba81c6fd2
commit: 37c6170f742ef3a18a3131a2a157dd7b7aa08103 [21562/30000] ub: Fix bugs in urma kernel and user lib
config: arm64-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240929/202409290901.wWQmpMUX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290901.wWQmpMUX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290901.wWQmpMUX-lkp@intel.com/

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
