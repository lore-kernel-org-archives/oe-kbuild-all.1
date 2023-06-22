Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5D95239
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 11:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687434879; x=1718970879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/c87+i79uLpjyUqmTVZGC2cM9UZv3W1PRdIWdtUAa/k=;
  b=eSCR2iyvwCr6c8abX+GqCweL/Ilg77eOYOHMVrRFy3pYIsxhj3HXy9WQ
   BzVpIomhBviHFDV6Iq/EYYJ48vD4S4Mt+1IaPtXB6GwOITus1cKxjTyac
   N7vjj3+QzpeEHFEUECkBDH+QpXISHjqIzACnhWi87fXbzaBcTsiDuSECl
   tWwZDmDUkKfWaItFkxYSUDrOiVJ1aAr5PAg9CSQ2jdz9OzlDM7CGuMEqH
   6DIOamM3s7jWGpPJIR76iI78+Aq9ePQHfGaLfi/ChggCWF8ctTRsnT7eY
   dVSb0Qeuv4kpydTk4/lui1ePfw+MqxQa3WA4XZoGNt0KS99KuzPGxGLGS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="350202221"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="350202221"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:54:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="961555606"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="961555606"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Jun 2023 04:54:37 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCItY-0007Wx-35;
	Thu, 22 Jun 2023 11:54:36 +0000
Date: Thu, 22 Jun 2023 19:54:09 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/634 1393/9880]
 drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:325:5: warning: no previous
 prototype for 'cdns_mhdp_register_cec_driver'
Message-ID: <202306221922.nPJzcvq1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Li,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc pr/634
head:   386bab91e0ee054cb0fd7007a05f8ea3ed8c2c7d
commit: 925a91175b17d3848258235b30c9bc4a94b58f85 [1393/9880] drm/display: update header path and name
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230622/202306221922.nPJzcvq1-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306221922.nPJzcvq1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306221922.nPJzcvq1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:325:5: warning: no previous prototype for 'cdns_mhdp_register_cec_driver' [-Wmissing-prototypes]
     325 | int cdns_mhdp_register_cec_driver(struct cdns_mhdp_cec *cec)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:353:5: warning: no previous prototype for 'cdns_mhdp_unregister_cec_driver' [-Wmissing-prototypes]
     353 | int cdns_mhdp_unregister_cec_driver(struct cdns_mhdp_cec *cec)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cdns_mhdp_register_cec_driver +325 drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c

cd2d042a0ebc13 Sandor Yu 2020-04-20  324  
61347c8e1dba15 Sandor Yu 2020-11-16 @325  int cdns_mhdp_register_cec_driver(struct cdns_mhdp_cec *cec)
cd2d042a0ebc13 Sandor Yu 2020-04-20  326  {
cd2d042a0ebc13 Sandor Yu 2020-04-20  327  	int ret;
cd2d042a0ebc13 Sandor Yu 2020-04-20  328  
cd2d042a0ebc13 Sandor Yu 2020-04-20  329  	cec->adap = cec_allocate_adapter(&cdns_mhdp_cec_adap_ops, cec,
cd2d042a0ebc13 Sandor Yu 2020-04-20  330  					 CEC_NAME,
cd2d042a0ebc13 Sandor Yu 2020-04-20  331  					 CEC_CAP_PHYS_ADDR | CEC_CAP_LOG_ADDRS |
cd2d042a0ebc13 Sandor Yu 2020-04-20  332  					 CEC_CAP_TRANSMIT | CEC_CAP_PASSTHROUGH
cd2d042a0ebc13 Sandor Yu 2020-04-20  333  					 | CEC_CAP_RC, CEC_MAX_LOG_ADDRS);
cd2d042a0ebc13 Sandor Yu 2020-04-20  334  	ret = PTR_ERR_OR_ZERO(cec->adap);
cd2d042a0ebc13 Sandor Yu 2020-04-20  335  	if (ret)
cd2d042a0ebc13 Sandor Yu 2020-04-20  336  		return ret;
61347c8e1dba15 Sandor Yu 2020-11-16  337  	ret = cec_register_adapter(cec->adap, cec->dev);
cd2d042a0ebc13 Sandor Yu 2020-04-20  338  	if (ret) {
cd2d042a0ebc13 Sandor Yu 2020-04-20  339  		cec_delete_adapter(cec->adap);
cd2d042a0ebc13 Sandor Yu 2020-04-20  340  		return ret;
cd2d042a0ebc13 Sandor Yu 2020-04-20  341  	}
cd2d042a0ebc13 Sandor Yu 2020-04-20  342  
cd2d042a0ebc13 Sandor Yu 2020-04-20  343  	cec->cec_worker = kthread_create(mhdp_cec_poll_worker, cec, "cdns-mhdp-cec");
cd2d042a0ebc13 Sandor Yu 2020-04-20  344  	if (IS_ERR(cec->cec_worker))
cd2d042a0ebc13 Sandor Yu 2020-04-20  345  		dev_err(cec->dev, "failed  create hdp cec thread\n");
cd2d042a0ebc13 Sandor Yu 2020-04-20  346  
cd2d042a0ebc13 Sandor Yu 2020-04-20  347  	wake_up_process(cec->cec_worker);
cd2d042a0ebc13 Sandor Yu 2020-04-20  348  
61347c8e1dba15 Sandor Yu 2020-11-16  349  	dev_dbg(cec->dev, "CEC successfuly probed\n");
cd2d042a0ebc13 Sandor Yu 2020-04-20  350  	return 0;
cd2d042a0ebc13 Sandor Yu 2020-04-20  351  }
cd2d042a0ebc13 Sandor Yu 2020-04-20  352  
61347c8e1dba15 Sandor Yu 2020-11-16 @353  int cdns_mhdp_unregister_cec_driver(struct cdns_mhdp_cec *cec)
cd2d042a0ebc13 Sandor Yu 2020-04-20  354  {
cd2d042a0ebc13 Sandor Yu 2020-04-20  355  	if (cec->cec_worker) {
cd2d042a0ebc13 Sandor Yu 2020-04-20  356  		kthread_stop(cec->cec_worker);
cd2d042a0ebc13 Sandor Yu 2020-04-20  357  		cec->cec_worker = NULL;
cd2d042a0ebc13 Sandor Yu 2020-04-20  358  	}
cd2d042a0ebc13 Sandor Yu 2020-04-20  359  	cec_unregister_adapter(cec->adap);
cd2d042a0ebc13 Sandor Yu 2020-04-20  360  	return 0;
cd2d042a0ebc13 Sandor Yu 2020-04-20  361  }
cd2d042a0ebc13 Sandor Yu 2020-04-20  362  

:::::: The code at line 325 was first introduced by commit
:::::: 61347c8e1dba157940e9db569f404755c66eac5c MLK-24081-03: drm: bridge: cdns-cec: support hdmi rx cec

:::::: TO: Sandor Yu <Sandor.yu@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
