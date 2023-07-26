Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D071C1BEED
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 20:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690403977; x=1721939977;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GkwT5cqtCsCqsI4BNv/wVw6cX4K9Pf2YYRNSYJoK3uw=;
  b=ja0STruQyV87YbxdmEaHzukXyAc30bPldAYQGq56zMVNWhS8R07ceANX
   FoKpLNByM1nHrCQL9VDouC5+Gy+cyqtH8viqWsq5JR93G7H1p4HeKmF0Z
   uLFt8IzfahC6RDE7Wt8XZA0kPxU1KxQ5RlRmKpsXBJXJwozAQc94j2BLG
   X582blQOnxPoaw6V+bm5aDXRRcQoavjg2C7qDIb0Dx14zXSxz/g3pyC9x
   yRFRUpDh+42iUuR9IU4wmkD2RpqYbOiMYohiC/sk5s9U1IDaHQjstm6Mt
   vV9Dkx/YP9FuHnb548N3qckvdo0nB1+YFD+bRHyt4WcJ06xOf9qHVASor
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="431925465"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="431925465"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 13:39:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="796710806"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="796710806"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 26 Jul 2023 13:39:33 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOlIC-0001Jz-1x;
	Wed, 26 Jul 2023 20:39:32 +0000
Date: Thu, 27 Jul 2023 04:39:27 +0800
From: kernel test robot <lkp@intel.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	arm@kernel.org
Subject: [soc:drivers/genpd 5/18] drivers/genpd/bcm/bcm-pmb.c:103:65: sparse:
 sparse: cast to restricted __be32
Message-ID: <202307270439.UhLDzRiQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git drivers/genpd
head:   7ed363cd8d0a3e4fbe3c37b7458420f82ef9a106
commit: aded002384c13a473af7d519e38ff59bf6056289 [5/18] soc: bcm: Move power-domain drivers to the genpd dir
config: um-randconfig-r072-20230725 (https://download.01.org/0day-ci/archive/20230727/202307270439.UhLDzRiQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270439.UhLDzRiQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307270439.UhLDzRiQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/genpd/bcm/bcm-pmb.c:103:65: sparse: sparse: cast to restricted __be32
>> drivers/genpd/bcm/bcm-pmb.c:103:65: sparse: sparse: cast to restricted __be32
>> drivers/genpd/bcm/bcm-pmb.c:103:65: sparse: sparse: cast to restricted __be32
>> drivers/genpd/bcm/bcm-pmb.c:103:65: sparse: sparse: cast to restricted __be32
>> drivers/genpd/bcm/bcm-pmb.c:103:65: sparse: sparse: cast to restricted __be32
>> drivers/genpd/bcm/bcm-pmb.c:103:65: sparse: sparse: cast to restricted __be32
>> drivers/genpd/bcm/bcm-pmb.c:103:45: sparse: sparse: cast to restricted __le32
>> drivers/genpd/bcm/bcm-pmb.c:115:36: sparse: sparse: restricted __le32 degrades to integer
>> drivers/genpd/bcm/bcm-pmb.c:115:55: sparse: sparse: restricted __be32 degrades to integer

vim +103 drivers/genpd/bcm/bcm-pmb.c

8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14   90  
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14   91  static int bcm_pmb_bpcm_read(struct bcm_pmb *pmb, int bus, u8 device,
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14   92  			     int offset, u32 *val)
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14   93  {
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14   94  	void __iomem *base = pmb->base + bus * 0x20;
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14   95  	unsigned long flags;
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14   96  	int err;
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14   97  
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14   98  	spin_lock_irqsave(&pmb->lock, flags);
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14   99  	err = bpcm_rd(base, device, offset, val);
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14  100  	spin_unlock_irqrestore(&pmb->lock, flags);
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14  101  
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14  102  	if (!err)
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14 @103  		*val = pmb->little_endian ? le32_to_cpu(*val) : be32_to_cpu(*val);
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14  104  
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14  105  	return err;
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14  106  }
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14  107  
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14  108  static int bcm_pmb_bpcm_write(struct bcm_pmb *pmb, int bus, u8 device,
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14  109  			      int offset, u32 val)
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14  110  {
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14  111  	void __iomem *base = pmb->base + bus * 0x20;
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14  112  	unsigned long flags;
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14  113  	int err;
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14  114  
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14 @115  	val = pmb->little_endian ? cpu_to_le32(val) : cpu_to_be32(val);
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14  116  
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14  117  	spin_lock_irqsave(&pmb->lock, flags);
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14  118  	err = bpcm_wr(base, device, offset, val);
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14  119  	spin_unlock_irqrestore(&pmb->lock, flags);
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14  120  
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14  121  	return err;
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14  122  }
8bcac4011ebe0d drivers/soc/bcm/bcm63xx/bcm-pmb.c Rafał Miłecki 2020-12-14  123  

:::::: The code at line 103 was first introduced by commit
:::::: 8bcac4011ebe0dbdd46fd55b036ee855c95702d3 soc: bcm: add PM driver for Broadcom's PMB

:::::: TO: Rafał Miłecki <rafal@milecki.pl>
:::::: CC: Florian Fainelli <f.fainelli@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
