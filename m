Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE2571B2D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 20:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706645577; cv=none; b=Sa6v/PgxEA0r2g43X4btCnu/alZHh2zqoOLtZGXE1IsbKEkNfNjtGu0aKxZ8e0FzdjEB8DQexvfZj3wV2OFMT74ge0Wh/6ALJv6hdaIyjL/xNuMOFvAlEvBnG+o6hwn8MVr/8Dgf6PEXfrCeEpvDkaZX78y6i9qHfqpZYFsPW00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706645577; c=relaxed/simple;
	bh=aoG0G5hZzKtPxSsc34bBO03RX/gZk2w1QxgY2dvQ0q8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ire+AdNqLR7IPn2YZgBpb2/imqmGxiCU9gJcRVUMwNNGky2dJ+1ewPS7vVgBz/B9Ew64OBqjEeBy5oWtGOi/wXOxWcDCdLw6ldXQcIiUB7sZs+dZkiViyhxm49gJh/m0y9laDyQUaHuyPsPdtCLSPoiMe9tb9qMqKTVZdUxbEhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OBhAhRS2; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OBhAhRS2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706645576; x=1738181576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aoG0G5hZzKtPxSsc34bBO03RX/gZk2w1QxgY2dvQ0q8=;
  b=OBhAhRS272MjOQoncIZOuo4UF0sUl374B11cF2PWh95a9PFk1WAourOl
   wCyrPmIa0IrTKLS+bKG1niwR0/gGLq84LhHiTSJpXwn/9K6G7iBj6yXSm
   LOB+CflMeZwfH3NBMRz759OU2HK6zwswbR78/EcfHUCkNRqCKLYmadCQp
   V1Dh102jZytsefPhD5EhZ55bikIbzr+obA7zEf3ywAfdbWUrHBeLgihH9
   1+F/SPYCdMUPnpEByw1evQIEgLF3LyIaOLPJ6+1EUFE8Y8dVmbtPdr5n/
   YN844IP6joII379mRcQ3uAJA1d2WHma1OxiHJGsM9uttxCfA3o6HzuX/W
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="393840891"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="393840891"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 12:12:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3834107"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jan 2024 12:12:32 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUuT8-0000lg-0q;
	Tue, 30 Jan 2024 20:12:30 +0000
Date: Wed, 31 Jan 2024 04:11:48 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.4-main 11394/26476]
 drivers/net/wireless/mediatek/mt76_new/mt76x02_util.c:300:79: error: cast
 from pointer to integer of different size
Message-ID: <202401310416.2xTLaqf2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-main
head:   645dca86a686ddae272b209432af075ecc0185c5
commit: 181fd8ff4a9feb40a391eea4957a79274eda157e [11394/26476] mt76x02: add debug print for possible NULL pointer dereference
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240131/202401310416.2xTLaqf2-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401310416.2xTLaqf2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310416.2xTLaqf2-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76_new/mt76x02_util.c: In function 'mt76x02_vif_init':
>> drivers/net/wireless/mediatek/mt76_new/mt76x02_util.c:300:79: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
     300 |         printk(KERN_ALERT "DEBUG: Passed %s %d 0x%x \n",__FUNCTION__,__LINE__,(unsigned int)vif->txq);
         |                                                                               ^
   cc1: all warnings being treated as errors


vim +300 drivers/net/wireless/mediatek/mt76_new/mt76x02_util.c

   287	
   288	static void
   289	mt76x02_vif_init(struct mt76x02_dev *dev, struct ieee80211_vif *vif,
   290			 unsigned int idx)
   291	{
   292		struct mt76x02_vif *mvif = (struct mt76x02_vif *)vif->drv_priv;
   293		struct mt76_txq *mtxq;
   294	
   295		memset(mvif, 0, sizeof(*mvif));
   296	
   297		mvif->idx = idx;
   298		mvif->group_wcid.idx = MT_VIF_WCID(idx);
   299		mvif->group_wcid.hw_key_idx = -1;
 > 300		printk(KERN_ALERT "DEBUG: Passed %s %d 0x%x \n",__FUNCTION__,__LINE__,(unsigned int)vif->txq);
   301		mtxq = (struct mt76_txq *)vif->txq->drv_priv;
   302		mtxq->wcid = &mvif->group_wcid;
   303	
   304		mt76_txq_init(&dev->mt76, vif->txq);
   305	}
   306	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
