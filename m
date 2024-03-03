Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5A47E6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 00:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709426470; cv=none; b=YWNwg9wUUtOs5YxaRVhR0aR77sWh+eZmU00PysGER/Y3CowHBbe1PMcc8OctCOeK1Vn4gx9SQ1JPKBMENqNoz/fK1ez+24iRIi8vSMLDz/xeLKHR5CCoIK0olsr8oXnMb5TANpaKzs5GjBNTWkMhEqQfDUM58Ck2A4avgI58nPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709426470; c=relaxed/simple;
	bh=beDAhFnp+kb15uNBtN6QKnXCM3JAHA/SoxKVTXw0wyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k1+EqC92iBXyfx1wXRrk7ZCDaxjSY1FgmbgQkHm8J2REFShICEF/TdUXvI7vm62ifI/vyuUVvB3GGgTvicitfdyFK2ha/DmT9F+CnSzOBD8x7McZs2lUIuoLsbkBYni2tga/TQlZboJGqcrccbZQqXsPb2vt6XlwzfIQtbrbLrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SufT9Ai8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SufT9Ai8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709426466; x=1740962466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=beDAhFnp+kb15uNBtN6QKnXCM3JAHA/SoxKVTXw0wyQ=;
  b=SufT9Ai8XlOFwjKi/Ro9aDQcPhht/3AToD+3Hl9phnKuDdqGbTcUffsH
   Lqb2G5ZQ8a+OT2XrCpkllT4kF3IO4OFzKIY7KHGE3FBGNYuNJR1DsuSzp
   yIwNkAXC3EAwuMyGsnr9Db+sNKkL54H30Ab2NStMWVwF+CeFoPDSx80U/
   3JdDDmSeRpFQJnjwIcH8tMnM0FeMxBk+iP9UIj//ZnJsxPCvFcWnr6FuZ
   o7i0sdztjL76mjWeLkcnBfx7Tkj/TIkMCKS8qMM0bUUZSjtbtSzn7uwXk
   B38bVmLvDa9DC3rZpTMJ6kYPElHjYok/ALXfffUrUtHwRmfD375igp+dW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="4113026"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="4113026"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 16:41:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="8810007"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Mar 2024 16:41:04 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgZuX-0000Ou-2y;
	Sun, 03 Mar 2024 00:41:01 +0000
Date: Sun, 3 Mar 2024 08:40:34 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 6169/27938]
 drivers/irqchip/irq-imx-irqsteer.c:194:34: error: 'irqsteer_data' undeclared
Message-ID: <202403030846.GeZOlxY8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   d761b18f6bc83bce94251467e3c0974243318456
commit: 1013ce054e00c2eeac5d993a760d27ea8695c81c [6169/27938] Merge branch 'irq/next' into next
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240303/202403030846.GeZOlxY8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403030846.GeZOlxY8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403030846.GeZOlxY8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/irqchip/irq-imx-irqsteer.c: In function 'imx_irqsteer_chans_enable':
>> drivers/irqchip/irq-imx-irqsteer.c:194:34: error: 'irqsteer_data' undeclared (first use in this function)
     194 |         ret = clk_prepare_enable(irqsteer_data->ipg_clk);
         |                                  ^~~~~~~~~~~~~
   drivers/irqchip/irq-imx-irqsteer.c:194:34: note: each undeclared identifier is reported only once for each function it appears in


vim +/irqsteer_data +194 drivers/irqchip/irq-imx-irqsteer.c

0136afa08967f6 Lucas Stach 2018-12-17  183  
5e46c8d4031866 Fugang Duan 2020-04-01  184  #ifdef CONFIG_PM_SLEEP
5e46c8d4031866 Fugang Duan 2020-04-01  185  static int imx_irqsteer_chans_enable(struct irqsteer_data *data)
5e46c8d4031866 Fugang Duan 2020-04-01  186  {
5e46c8d4031866 Fugang Duan 2020-04-01  187  	return 0;
5e46c8d4031866 Fugang Duan 2020-04-01  188  }
5e46c8d4031866 Fugang Duan 2020-04-01  189  #else
5e46c8d4031866 Fugang Duan 2020-04-01  190  static int imx_irqsteer_chans_enable(struct irqsteer_data *data)
5e46c8d4031866 Fugang Duan 2020-04-01  191  {
5e46c8d4031866 Fugang Duan 2020-04-01  192  	int ret;
5e46c8d4031866 Fugang Duan 2020-04-01  193  
5e46c8d4031866 Fugang Duan 2020-04-01 @194  	ret = clk_prepare_enable(irqsteer_data->ipg_clk);
5e46c8d4031866 Fugang Duan 2020-04-01  195  	if (ret) {
5e46c8d4031866 Fugang Duan 2020-04-01  196  		dev_err(data->dev, "failed to enable ipg clk: %d\n", ret);
5e46c8d4031866 Fugang Duan 2020-04-01  197  		return ret;
5e46c8d4031866 Fugang Duan 2020-04-01  198  	}
5e46c8d4031866 Fugang Duan 2020-04-01  199  
5e46c8d4031866 Fugang Duan 2020-04-01  200  	/* steer all IRQs into configured channel */
5e46c8d4031866 Fugang Duan 2020-04-01  201  	writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
5e46c8d4031866 Fugang Duan 2020-04-01  202  
5e46c8d4031866 Fugang Duan 2020-04-01  203  	/* read back CHANCTRL register cannot reflact on HW register
5e46c8d4031866 Fugang Duan 2020-04-01  204  	 * real value due to the HW action, so add one flag here.
5e46c8d4031866 Fugang Duan 2020-04-01  205  	 */
5e46c8d4031866 Fugang Duan 2020-04-01  206  	data->inited = true;
5e46c8d4031866 Fugang Duan 2020-04-01  207  	return 0;
5e46c8d4031866 Fugang Duan 2020-04-01  208  }
5e46c8d4031866 Fugang Duan 2020-04-01  209  #endif
5e46c8d4031866 Fugang Duan 2020-04-01  210  

:::::: The code at line 194 was first introduced by commit
:::::: 5e46c8d4031866e0084fcdeb68ca1998f158aa9d MLK-17290-01 irqchip: imx-irqsteer: add runtime pm support

:::::: TO: Fugang Duan <fugang.duan@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
