Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7442E5B2D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Aug 2026 03:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785728124; cv=none; b=JxgtXJT4qDT313IkKcLVvypg0NF7Dzv2xmV1cSDaAc561CNI1hopcEmAzZpXAzPKjplmq5MwQVFQzz7u9FObaZ6wG5qmP8B/QPDHiduVWahGhNGP8o+edn9YQmGRyOr4CjzOUR79gGoZM9PwF9oFmly+BlkfJTpLVNPdPC1ZzpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785728124; c=relaxed/simple;
	bh=D0dgNrm/mwR3kRQjdoQuyL5EgP2wKNWMLNtgD3WHGzo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ehu/ILVF2sef+HiRRkD8//0IifrVmzWxNkJ+2Gh6IjAHaL5emjS7c99fKdH0BLbHBYSSPQQQGIM5px7P+tycFZyBD+rEeHXHhmbhksvROQk24WbavmWy5Nrh3bOdewTzllCQvLxsk+XZDDo8fuAm0/qIStcooNg8RjDLJ2w4YPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dGbsf0Z5; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dGbsf0Z5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785728122; x=1817264122;
  h=date:from:to:cc:subject:message-id;
  bh=D0dgNrm/mwR3kRQjdoQuyL5EgP2wKNWMLNtgD3WHGzo=;
  b=dGbsf0Z5I///D7pyOWDC5RDBcMitSH+5rXW+8Zf1S2RKK53mund3s7r2
   Qy9vxRAMmwxK4GBRAwQ/QruIPk9olo/0gQdcu76FMUX5chyAtRGMeig0x
   a9IrUSZi5s1FO5eBOKMKE3jh+73+tcXyYV2106hrfySPXCaJi5sMKBgut
   6sG7XtXw6mKXA4Kd+k+PKWivEnpnZ/8YuCgyniSmzVZw3mNfxK8pA369P
   N4muHD8/2lcPQHMU66dD0/2YC8m+fVJ/aS4sWXAVk2tNpl3OyG3gSfksI
   cAgJHC8nN/4Pi/SXSog6hQ4ThiG3CoAqY/RpaMavPWbnKRNeWAmD0vuUm
   g==;
X-CSE-ConnectionGUID: 2bHX4X65TymUPOLDhy158Q==
X-CSE-MsgGUID: ABuLpL+aQiObcyTetk0E6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="86462114"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="86462114"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2026 20:35:21 -0700
X-CSE-ConnectionGUID: O408ecNgSsaNo3DhUa26fA==
X-CSE-MsgGUID: s2l7MSA7SSmSa77nkwUZaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="264572491"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Aug 2026 20:35:20 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqjSP-000000005xh-0x9C;
	Mon, 03 Aug 2026 03:35:17 +0000
Date: Mon, 03 Aug 2026 11:35:04 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 428/700]
 drivers/dma/mstar/mstar-msc313-urdma.c:411:30: warning: unused variable
 'urdma'
Message-ID: <202608031013.CMw7xEVK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: 7835e2083509e8c5bb48c0e7a459adbd8fc2d23a [428/700] dma: mstar: msc313 urdma: transfer handling implementation
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260803/202608031013.CMw7xEVK-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260803/202608031013.CMw7xEVK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608031013.CMw7xEVK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/mstar/mstar-msc313-urdma.c: In function 'msc313_urdma_terminate_all':
>> drivers/dma/mstar/mstar-msc313-urdma.c:411:30: warning: unused variable 'urdma' [-Wunused-variable]
     411 |         struct msc313_urdma *urdma = ch->urdma;
         |                              ^~~~~
   At top level:
   drivers/dma/mstar/mstar-msc313-urdma.c:676:12: warning: 'msc313_urdma_resume' defined but not used [-Wunused-function]
     676 | static int msc313_urdma_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~
   drivers/dma/mstar/mstar-msc313-urdma.c:667:12: warning: 'msc313_urdma_suspend' defined but not used [-Wunused-function]
     667 | static int msc313_urdma_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~
   drivers/dma/mstar/mstar-msc313-urdma.c:31:31: warning: 'ctrl_rx_op_mode' defined but not used [-Wunused-const-variable=]
      31 | static const struct reg_field ctrl_rx_op_mode   = REG_FIELD(REG_CTRL, 11, 11);
         |                               ^~~~~~~~~~~~~~~


vim +/urdma +411 drivers/dma/mstar/mstar-msc313-urdma.c

   407	
   408	static int msc313_urdma_terminate_all(struct dma_chan *chan)
   409	{
   410		struct msc313_urdma_chan *ch = to_chan(chan);
 > 411		struct msc313_urdma *urdma = ch->urdma;
   412	
   413		printk("%s:%d\n", __func__, __LINE__);
   414	
   415		/* End the running job if there is one */
   416		msc313_urdma_terminate_inflight(ch);
   417	
   418		/* make sure the tasklet runs */
   419		schedule();
   420	
   421		return 0;
   422	}
   423	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
