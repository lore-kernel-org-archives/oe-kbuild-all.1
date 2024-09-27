Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E1C186606
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 13:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727442029; cv=none; b=GBFt16aLkeUbVoT8bw0es/qbX7qklVYUVAcMIrjPll6EFWKVgLwgbFuOaxA64HpHvMzj2VcsyKnIxkymqdOsilepVXKyU7dHbbYpXODzml6OZCMGxBnGMNhhXDpY0GNVqzOGJTFlYro78/8rpBQPo1IrMjCPWZetWs8NRcQVdho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727442029; c=relaxed/simple;
	bh=QQu8THmHdqhYUOaN4/VWO+631IT/2gbkUDcsvqcHYxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EiyZagOTax0Ohl2ip+oQZhmqYIBwfRQbWbbGvxneBk8cxZ61jvC0N07tdqtgg5nwQp2e4hdSoTPO8hQ1/z3bL/XKbqNb36npVHKuEb9ojgorz4PN1Do7c1IXzuGnyHvgNCCk/SyrzAwqx9cY8pAQNA/x4GLrSflMvdQ0I7khb10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bZ/4qY80; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bZ/4qY80"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727442026; x=1758978026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QQu8THmHdqhYUOaN4/VWO+631IT/2gbkUDcsvqcHYxI=;
  b=bZ/4qY80bnD/ppf4hhQZapmlPagZKaXj+i6Vm240VB5EBR4LACzquZjv
   vf+XmIW5tSuc64Bfu7vW8L9xozrdXxcDxzF4rwmJv2J2B2OJH0Zk7DRGs
   pla8ZBFo7fTAGtVzUfWlP8OnYVJ8e1Y9F4eqY8oZ3WfFUm+qMoLPJA1hT
   HNCIprf6mrs6S8KBXFTxB82XEFEIbChtOkmM/SrrHTV+xAUP0FeW7Fb1y
   gNAEDocgZie2021eZuF3Vt6W/4F9sNThkJtzN9FWaTfBJ4iEntpPkDALl
   /mHym+VBFOi/3VpSz8EIhXYkmqtgnPPEl0vCMeoq1FSkYx8f4aC5UwoHm
   g==;
X-CSE-ConnectionGUID: KVKUpKcZS1OyWoolO1k23w==
X-CSE-MsgGUID: v9NMYj51RleOR5jrzJuvZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26457093"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="26457093"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 06:00:25 -0700
X-CSE-ConnectionGUID: 8Buj+Ac/QpmpftXuGDUdRw==
X-CSE-MsgGUID: tPekUw3/QNWYX5i5bfDNSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="76906995"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Sep 2024 06:00:23 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suAa4-000M9e-2l;
	Fri, 27 Sep 2024 13:00:20 +0000
Date: Fri, 27 Sep 2024 20:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: Pranavi Somisetty <pranavi.somisetty@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Harini Katakam <harini.katakam@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 150/1001]
 drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c:284:47: warning: 'sprintf' may
 write a terminating nul past the end of the destination
Message-ID: <202409272024.OCKXxxTT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: 613e39d370ef73bc8bffb2c5bfc7e07f8b153d24 [150/1001] staging: net: xilinx: add Xilinx TSN driver
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240927/202409272024.OCKXxxTT-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409272024.OCKXxxTT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409272024.OCKXxxTT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c: In function 'axienet_tadma_open':
>> drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c:284:47: warning: 'sprintf' may write a terminating nul past the end of the destination [-Wformat-overflow=]
     284 |                 sprintf(irq_name, "%s_tadma_tx", ndev->name);
         |                                               ^
   drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c:284:17: note: 'sprintf' output between 10 and 25 bytes into a destination of size 24
     284 |                 sprintf(irq_name, "%s_tadma_tx", ndev->name);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sprintf +284 drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c

   274	
   275	int axienet_tadma_open(struct net_device *ndev)
   276	{
   277		struct axienet_local *lp = netdev_priv(ndev);
   278		u32 cr;
   279		u8 i = 0;
   280		int ret;
   281		static char irq_name[24];
   282	
   283		if (lp->tadma_irq) {
 > 284			sprintf(irq_name, "%s_tadma_tx", ndev->name);
   285			ret = request_irq(lp->tadma_irq, tadma_irq, IRQF_SHARED,
   286					  irq_name, ndev);
   287			if (ret)
   288				return ret;
   289		}
   290		pr_debug("%s TADMA irq %d\n", __func__, lp->tadma_irq);
   291	
   292		/* enable all interrupts */
   293		tadma_iow(lp, XTADMA_INT_EN_OFFSET, XTADMA_FFI_INT_EN |
   294			  XTADMA_IE_INT_EN);
   295	
   296		tadma_sfm_init(ndev);
   297		tadma_sfm_hash_init(ndev);
   298		cr = XTADMA_CFG_DONE;
   299		tadma_iow(lp, XTADMA_CR_OFFSET, cr);
   300	
   301		lp->tx_bd = kmalloc_array(lp->num_streams, sizeof(struct axitadma_bd *),
   302					  GFP_KERNEL);
   303		if (!lp->tx_bd)
   304			ret = -ENOMEM;
   305	
   306		for (i = 0; i < lp->num_streams ; i++) {
   307			lp->tx_bd_head[i] = 0;
   308			lp->tx_bd_tail[i] = 0;
   309			lp->tx_bd_rd[i] = 0;
   310			lp->tx_bd[i] = kmalloc_array(lp->num_tadma_buffers,
   311						     sizeof(*lp->tx_bd[i]), GFP_KERNEL);
   312			if (!lp->tx_bd[i])
   313				return -ENOMEM;
   314		}
   315	
   316		return ret;
   317	}
   318	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
