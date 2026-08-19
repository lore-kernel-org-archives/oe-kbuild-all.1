Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E53D1C01
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 22:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787178199; cv=none; b=iRWYD+R7MpOMIOPeVTxoPluIS9o5SHxSC9h8lsLca8DXzZgSMlDwqJvhzwb1kZaA8vGJ5ZWFBVBxCWeD0VuRHCLo2zU3W1LJdjt884Spb3DybwOwnDTxLo/N3DPf85ST7skQF6uIvXgrawrgI6jBpoP+bG9QASDYEPX5mEUh6Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787178199; c=relaxed/simple;
	bh=Lfp1IPFGfojRdOYax2PCRJ1whx9c46f74dbTjQBcpoo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L3CMO2hec61D26uRsEOfNKhSC0fYyLo2WoEiso7CKfkWohm4SJOOSl/fv5HYg/VctE4xXiQUhSWc28gRGjQakzhVySTiJx18ykPDempVFmtDtocI9paUaX94cTkCgH1wNlJJh2y4JTEDKgYBbHNWI4WLtRaE+oySGeF9eMFShXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZCOeGKr; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZCOeGKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787178198; x=1818714198;
  h=date:from:to:cc:subject:message-id;
  bh=Lfp1IPFGfojRdOYax2PCRJ1whx9c46f74dbTjQBcpoo=;
  b=fZCOeGKrUXZDJ7XtCPvPd4Yb5c+iMIrSvlJzeUWFGpg7nv+ebhLNYUob
   sZyTbkSVIObpJkfxnRxnLjOzPce1wtIDKdwh0GeI9j9B6R/8uc0kNfLm9
   BgyC2c9MlY0gC5LsyiirLtxUDEfCcMQMfBXEeLynR9Ejma5W6yFmiEMrx
   zbnlpca1cX6TclMGT1XNiI0s/eCjIqlEvfYpokyE8FqIS/hH8HNSJjXGo
   fpuRNX+8UdJ/M7LjnuNzBme+AVWZWmmD+4RiVLqCo54GYU+modNz9C2oR
   TkYd8mDF/oXR6OjO4Iyzj0cJBgYE5frmPL46+G/HRHDOjQjRx+28RBpy3
   A==;
X-CSE-ConnectionGUID: T06QQ0lfT5yf6aUcYGTaWw==
X-CSE-MsgGUID: 8WXfADKhQ8KLjK6dIy3dAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87914077"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="87914077"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 15:23:17 -0700
X-CSE-ConnectionGUID: OX7JycMbT+iq1vRiTHJvkw==
X-CSE-MsgGUID: i/P1+d3BTtCkoPeWT5uiMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="289178643"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Aug 2026 15:23:14 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwogh-00000000ggH-2J3w;
	Wed, 19 Aug 2026 22:23:11 +0000
Date: Thu, 20 Aug 2026 06:22:33 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 5730/16300]
 drivers/dma/fsl_raid.c:116:17: sparse: sparse: incorrect type in argument 1
 (different base types)
Message-ID: <202608200637.ro1CqMxi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6a746cd265aed59107ebdaa9ce039bb832922969
commit: 68b7fbc235290937e4e2daa097896b6b94618f15 [5730/16300] dma: fsl_raid: keep MMIO bases as void __iomem and cast at access
config: powerpc64-randconfig-r131-20260820 (https://download.01.org/0day-ci/archive/20260820/202608200637.ro1CqMxi-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608200637.ro1CqMxi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608200637.ro1CqMxi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma/fsl_raid.c:116:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:116:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/dma/fsl_raid.c:116:17: sparse:     got restricted __be32 [noderef] __iomem *
>> drivers/dma/fsl_raid.c:130:34: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:130:34: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/dma/fsl_raid.c:130:34: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/dma/fsl_raid.c:170:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:170:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/dma/fsl_raid.c:170:17: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/dma/fsl_raid.c:195:34: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:195:34: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/dma/fsl_raid.c:195:34: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/dma/fsl_raid.c:209:36: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:209:36: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/dma/fsl_raid.c:209:36: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/dma/fsl_raid.c:219:42: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:219:42: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/dma/fsl_raid.c:219:42: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/dma/fsl_raid.c:225:26: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:225:26: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/dma/fsl_raid.c:225:26: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/dma/fsl_raid.c:338:18: sparse: sparse: incompatible types for operation (<=):
   drivers/dma/fsl_raid.c:338:18: sparse:    struct fsl_re_desc *[assigned] desc
   drivers/dma/fsl_raid.c:338:18: sparse:    int
   drivers/dma/fsl_raid.c:462:18: sparse: sparse: incompatible types for operation (<=):
   drivers/dma/fsl_raid.c:462:18: sparse:    struct fsl_re_desc *[assigned] desc
   drivers/dma/fsl_raid.c:462:18: sparse:    int
   drivers/dma/fsl_raid.c:546:18: sparse: sparse: incompatible types for operation (<=):
   drivers/dma/fsl_raid.c:546:18: sparse:    struct fsl_re_desc *[assigned] desc
   drivers/dma/fsl_raid.c:546:18: sparse:    int
   drivers/dma/fsl_raid.c:711:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:713:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:715:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:717:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:719:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:721:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:725:31: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:728:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:734:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:773:19: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:776:19: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:778:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:778:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/dma/fsl_raid.c:778:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@

vim +116 drivers/dma/fsl_raid.c

ad80da658bbcaaa Xuelin Shi 2015-03-03  104  
ad80da658bbcaaa Xuelin Shi 2015-03-03  105  /* Copy descriptor from per chan software queue into hardware job ring */
ad80da658bbcaaa Xuelin Shi 2015-03-03  106  static void fsl_re_issue_pending(struct dma_chan *chan)
ad80da658bbcaaa Xuelin Shi 2015-03-03  107  {
ad80da658bbcaaa Xuelin Shi 2015-03-03  108  	struct fsl_re_chan *re_chan;
ad80da658bbcaaa Xuelin Shi 2015-03-03  109  	int avail;
ad80da658bbcaaa Xuelin Shi 2015-03-03  110  	struct fsl_re_desc *desc, *_desc;
ad80da658bbcaaa Xuelin Shi 2015-03-03  111  	unsigned long flags;
ad80da658bbcaaa Xuelin Shi 2015-03-03  112  
ad80da658bbcaaa Xuelin Shi 2015-03-03  113  	re_chan = container_of(chan, struct fsl_re_chan, chan);
ad80da658bbcaaa Xuelin Shi 2015-03-03  114  
ad80da658bbcaaa Xuelin Shi 2015-03-03  115  	spin_lock_irqsave(&re_chan->desc_lock, flags);
ad80da658bbcaaa Xuelin Shi 2015-03-03 @116  	avail = FSL_RE_SLOT_AVAIL(
ad80da658bbcaaa Xuelin Shi 2015-03-03  117  		in_be32(&re_chan->jrregs->inbring_slot_avail));
ad80da658bbcaaa Xuelin Shi 2015-03-03  118  
ad80da658bbcaaa Xuelin Shi 2015-03-03  119  	list_for_each_entry_safe(desc, _desc, &re_chan->submit_q, node) {
ad80da658bbcaaa Xuelin Shi 2015-03-03  120  		if (!avail)
ad80da658bbcaaa Xuelin Shi 2015-03-03  121  			break;
ad80da658bbcaaa Xuelin Shi 2015-03-03  122  
ad80da658bbcaaa Xuelin Shi 2015-03-03  123  		list_move_tail(&desc->node, &re_chan->active_q);
ad80da658bbcaaa Xuelin Shi 2015-03-03  124  
ad80da658bbcaaa Xuelin Shi 2015-03-03  125  		memcpy(&re_chan->inb_ring_virt_addr[re_chan->inb_count],
ad80da658bbcaaa Xuelin Shi 2015-03-03  126  		       &desc->hwdesc, sizeof(struct fsl_re_hw_desc));
ad80da658bbcaaa Xuelin Shi 2015-03-03  127  
ad80da658bbcaaa Xuelin Shi 2015-03-03  128  		re_chan->inb_count = (re_chan->inb_count + 1) &
ad80da658bbcaaa Xuelin Shi 2015-03-03  129  						FSL_RE_RING_SIZE_MASK;
ad80da658bbcaaa Xuelin Shi 2015-03-03 @130  		out_be32(&re_chan->jrregs->inbring_add_job, FSL_RE_ADD_JOB(1));
ad80da658bbcaaa Xuelin Shi 2015-03-03  131  		avail--;
ad80da658bbcaaa Xuelin Shi 2015-03-03  132  	}
ad80da658bbcaaa Xuelin Shi 2015-03-03  133  	spin_unlock_irqrestore(&re_chan->desc_lock, flags);
ad80da658bbcaaa Xuelin Shi 2015-03-03  134  }
ad80da658bbcaaa Xuelin Shi 2015-03-03  135  

:::::: The code at line 116 was first introduced by commit
:::::: ad80da658bbcaaac1d3617ea6cb0f4d5e16da422 dmaengine: Driver support for FSL RaidEngine device.

:::::: TO: Xuelin Shi <xuelin.shi@freescale.com>
:::::: CC: Vinod Koul <vinod.koul@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
