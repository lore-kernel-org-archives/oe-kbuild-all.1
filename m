Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D630E577
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 20:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PxLUJiFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697401846; x=1728937846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7fg6bRFktxVRV0JI0VtrCsX5JS94/vOp3DXLZpr5ggU=;
  b=PxLUJiFwF31OxijH3dn96buK+/l+YY+WUNQN3jE3JQJco7d/V4WN6/hZ
   BhMS42TkEo66gn33qPrYyYjoWQopLm9DgS3FM6fxhnTFZ+NubkiJHkgdP
   DqwsrHkvKacx7wKntAtUhtv7isoZI64EFgffJIfOfugkaUL1ta6muguYY
   qdcMro8iNgXnE/LQSmlIEsSC5YKzaFaJI8OMo9ThAkM56z9XUZ00gRxYw
   QVWVn9LeZ2CwQ54cc2GlqBFcNpoCL32goELJQm6oaKn2n1R3Y0ASsSNm/
   DjugINQXvc9KQX91mHXOeTDhQ6xf1K9xgGH19evay2hhWyXBf58SZ3Uue
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="365677705"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="365677705"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 13:30:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="899244921"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="899244921"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Oct 2023 13:28:47 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qs7l4-0007mH-1F;
	Sun, 15 Oct 2023 20:30:42 +0000
Date: Mon, 16 Oct 2023 04:30:22 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 3312/24603]
 drivers/irqchip/irq-imx-irqsteer.c:193:34: error: 'irqsteer_data' undeclared
Message-ID: <202310160403.Rq46S2dJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fugang,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 5e46c8d4031866e0084fcdeb68ca1998f158aa9d [3312/24603] MLK-17290-01 irqchip: imx-irqsteer: add runtime pm support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231016/202310160403.Rq46S2dJ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310160403.Rq46S2dJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160403.Rq46S2dJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/irqchip/irq-imx-irqsteer.c: In function 'imx_irqsteer_chans_enable':
>> drivers/irqchip/irq-imx-irqsteer.c:193:34: error: 'irqsteer_data' undeclared (first use in this function)
     193 |         ret = clk_prepare_enable(irqsteer_data->ipg_clk);
         |                                  ^~~~~~~~~~~~~
   drivers/irqchip/irq-imx-irqsteer.c:193:34: note: each undeclared identifier is reported only once for each function it appears in


vim +/irqsteer_data +193 drivers/irqchip/irq-imx-irqsteer.c

   182	
   183	#ifdef CONFIG_PM_SLEEP
   184	static int imx_irqsteer_chans_enable(struct irqsteer_data *data)
   185	{
   186		return 0;
   187	}
   188	#else
   189	static int imx_irqsteer_chans_enable(struct irqsteer_data *data)
   190	{
   191		int ret;
   192	
 > 193		ret = clk_prepare_enable(irqsteer_data->ipg_clk);
   194		if (ret) {
   195			dev_err(data->dev, "failed to enable ipg clk: %d\n", ret);
   196			return ret;
   197		}
   198	
   199		/* steer all IRQs into configured channel */
   200		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
   201	
   202		/* read back CHANCTRL register cannot reflact on HW register
   203		 * real value due to the HW action, so add one flag here.
   204		 */
   205		data->inited = true;
   206		return 0;
   207	}
   208	#endif
   209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
