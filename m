Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DA914F9FD
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 07:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730620282; cv=none; b=XNcMuqZKPuR1Q/RZEwv4LvsHUYO1A55YLqRLQOb6QKiLr9qTfmavfcEY21QWxOo8LnY7XP6n67ylyHB3SFXc4DfGpICvctzQQS520gEeDC7u6XPDdyXTUEIBfQLMR3jODnprFR7Pkhvsa07vza43rAH62UoSUgn6c+AfwXVDwrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730620282; c=relaxed/simple;
	bh=Zf/2LX4HS9MYk0jxfyPjVq1ZvFzMvxnw/m8FxN2lCQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LPVaHtnCz1Pu6onB4TnK69bl7xtp8Reegj4GpSlKeW1TnRP0zLEeTTGDKEjQpUABNUIluG06FmXRJ9IXZeI75AwJW9P/a0qNs33yTUCcxZkZXXwoXRot5C2sE0hMqPDT3fpppkz3v8I0tyIT3xc8wiDkaH6S52K3w9b1MsuIu14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nQhXCH02; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nQhXCH02"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730620280; x=1762156280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zf/2LX4HS9MYk0jxfyPjVq1ZvFzMvxnw/m8FxN2lCQs=;
  b=nQhXCH02/J6KwIcymy0Bjlq70rv5ZFUtWltTX8WNfQlEdIn2+hkCZXco
   /oyR42VLeyaLYEfJdFqYNrmXAGDR7rMUlC6/M1/Ym61IbD8u1kddzjUSO
   0IKzcQMnK/Rzu78bmd6rQgwQuxaVfdM0OSI7B0deYfQpWK8KATp2A/VL6
   5kB3ObPe6wQQ3XaFuWTCuNY4iQRz9Mywkhhxchk2pizprpJM/BJI1rLFY
   FzlmkrBXS0HDlOlWW1B4ERSEiCJvpL43MjrOgWLF2t4Ct7ZV80zDrM432
   FwDaoIQtUbr9ox/u15GPbkeBShPWLtApnpG7UIt6pS1sfAvF/xSw9z8l1
   Q==;
X-CSE-ConnectionGUID: RrBf+neXSV+q0XRLiS/0tw==
X-CSE-MsgGUID: lJcMgjGpSjuApaj3eEo8jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30186202"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30186202"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 00:51:20 -0700
X-CSE-ConnectionGUID: IqwNL9zJTKmBiyjq/kt1uw==
X-CSE-MsgGUID: IPhjTAHoQiCITp+2hjpqOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="88175736"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Nov 2024 00:51:18 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7VOG-000jnN-0L;
	Sun, 03 Nov 2024 07:51:16 +0000
Date: Sun, 3 Nov 2024 15:51:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yizhen Fan <fanyizhen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2284/2284]
 drivers/ub/urma/ubcore/ubcore_netdev.c:213:5: warning: no previous prototype
 for 'ubcore_unset_port_netdev'
Message-ID: <202411031516.C5nPknta-lkp@intel.com>
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
head:   170b758d064664f953e8f6de41dd4a3ef122443a
commit: 37c6170f742ef3a18a3131a2a157dd7b7aa08103 [2284/2284] ub: Fix bugs in urma kernel and user lib
config: arm64-randconfig-003-20241029 (https://download.01.org/0day-ci/archive/20241103/202411031516.C5nPknta-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411031516.C5nPknta-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411031516.C5nPknta-lkp@intel.com/

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
