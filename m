Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151188814
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 17:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695143823; x=1726679823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tNupomnwGf31ajG1JEBMA528bsZ+/sbPhS0K6PLmX3o=;
  b=Td1mKShYuZpRckM5lihF9994zXP+JN6DqQAoIvLFDDreES2K2JKIt725
   nN59cDNzMjAMtHfMxBKYB3jUZVHCNWkfVriZJ8OO40GACinNfU+5fH2Yl
   0F0EePTuVgA8YDvWjygv00oCwa/amkst38RUAGvX9wI+pe9oi60jJ3jvU
   us7Y6kY+rinlhWMPKFMrw1uXL1gO77wpR1vdbB2CAHFy9j6TiEYZ4sNeQ
   rrSX52XKJQj5DSV+PS/21wWBSTn6gtbdKar1YRTpAmkEiyf4ea67mrOjE
   7ESrGEONYFhSwo9Z1gH9PxwlqfuEG8mwdl+bsszOn/A9c+NoJRKhB7foj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410932923"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="410932923"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 10:17:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="816526427"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="816526427"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 19 Sep 2023 10:17:00 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qieLJ-0007iw-2S;
	Tue, 19 Sep 2023 17:16:57 +0000
Date: Wed, 20 Sep 2023 01:16:05 +0800
From: kernel test robot <lkp@intel.com>
To: Pranavi Somisetty <pranavi.somisetty@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Harini Katakam <harini.katakam@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 637/1363]
 drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c:284:47: warning: 'sprintf' may
 write a terminating nul past the end of the destination
Message-ID: <202309200105.4WwNixBM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   4f412ed20fd2c5353c1e878ef9ed77952a5040a1
commit: 03252b346d787210f709c33dc420d2e1bcb0f10a [637/1363] staging: net: xilinx: add Xilinx TSN driver
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230920/202309200105.4WwNixBM-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309200105.4WwNixBM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309200105.4WwNixBM-lkp@intel.com/

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
