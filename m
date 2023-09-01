Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E939A4E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 14:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693579544; x=1725115544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ofAtnKLdYHaRJ5H6VgI+QQbszQfPYgk+INl5BdTdmcY=;
  b=BYUGNqJjJl8/TiOc2zodHWje1AMVf8mumvVPR8+W6IwvjQ2NPk0zygeL
   c3nBPfjhWqUG6WUCsrSWhI5eZ0Y0rx2lsm8LC78cBWLdCcG5fYim8DFin
   mpCpLlmGu6B1pGESD3Ps7vF0otF5cF8cXhy2XxfGwySP515K/7BC0x/v2
   3P37hZNnaigMsA34ZCsYLy2dLnNc74iGBzUr4iNUhebi8KYaAFjNf8RBR
   hw+1LGaNMoXlmu417/7xA79Eq6SOeje7rC4yamj+Gp4dTdY2DVMUM/Wy/
   9wZsaCsyr7GQql7dK5tMWxQmgxVj6iUdzMTMWErTzQmaVtl0lAItz1ZYV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="462600203"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="462600203"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 07:45:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="863558377"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="863558377"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Sep 2023 07:45:42 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc5P2-0001NY-0f;
	Fri, 01 Sep 2023 14:45:40 +0000
Date: Fri, 1 Sep 2023 22:45:37 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 17396/24603]
 drivers/mailbox/imx-mailbox.c:132:10: warning: no previous declaration for
 'get_mu_buf'
Message-ID: <202309012210.b3yqYfvY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: e7f19219a4920854744c970b43522cb6d17e0262 [17396/24603] LF-6580-1: drivers: imx-mailbox: MU Buffer
config: x86_64-buildonly-randconfig-004-20230831 (https://download.01.org/0day-ci/archive/20230901/202309012210.b3yqYfvY-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309012210.b3yqYfvY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309012210.b3yqYfvY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mailbox/imx-mailbox.c:132:10: warning: no previous declaration for 'get_mu_buf' [-Wmissing-declarations]
    uint8_t *get_mu_buf(struct mbox_chan *chan)
             ^~~~~~~~~~
   drivers/mailbox/imx-mailbox.c:900:10: warning: initialized field overwritten [-Woverride-init]
     .rxdb = imx_mu_generic_rxdb,
             ^~~~~~~~~~~~~~~~~~~
   drivers/mailbox/imx-mailbox.c:900:10: note: (near initialization for 'imx_mu_cfg_imx8ulp.rxdb')


vim +/get_mu_buf +132 drivers/mailbox/imx-mailbox.c

   131	
 > 132	uint8_t *get_mu_buf(struct mbox_chan *chan)
   133	{
   134		uint8_t *addr;
   135		struct imx_mu_priv *priv = to_imx_mu_priv(chan->mbox);
   136	
   137		addr = priv->base + priv->dcfg->xBUF;
   138		return addr;
   139	}
   140	EXPORT_SYMBOL(get_mu_buf);
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
