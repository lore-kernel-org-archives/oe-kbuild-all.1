Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C9AAD37
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 12:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693569879; x=1725105879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bwZImjdHs21SYowmYd6MBUgD+CDmoNjxa8y0qYgIXb4=;
  b=P5y6AmJRt+iHaR/q47bvFKH4nVQiUTazTeKlerlRtsi3oxpSfdSJ5Bj+
   LufE+DXVyZqOK9czvGOaA4YPohYQMwNokGruyFCP1h9gIg3ZCHZeftxwr
   4q7QiR/IR0/Nsg4dY5h64lKw4p9SjdcnPemQgW/OpIQZCfsdg25j59WOD
   jDkpucEEkxbuEk27LM4D49FmOag22f2u6kifPh2MaLINT/0G3QC1AzW0V
   gdroDjiCFB8UXkcsw84TzsIahtpLqVd/pAPgfZiDVw/bV5MOab6aeOr6S
   TyiiKY7IDuDv7tTFz2Qw3WdBf+dbvR6MXLJV1QQly8xYQSoH9MAsanqtL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="462571802"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="462571802"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 05:04:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="743085999"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="743085999"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 01 Sep 2023 05:04:37 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc2t9-0001Fr-0X;
	Fri, 01 Sep 2023 12:04:35 +0000
Date: Fri, 1 Sep 2023 20:04:13 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 1379/24603]
 drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:294:5: warning: no previous
 prototype for 'cdns_mhdp_register_cec_driver'
Message-ID: <202309011935.G1pIRTgz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sandor,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: bc753308a6c069eeba6e0da7438dbc00d0011bf9 [1379/24603] drm: bridge: mhdp: Add cdns mhdp driver bridge driver
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20230901/202309011935.G1pIRTgz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309011935.G1pIRTgz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309011935.G1pIRTgz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:294:5: warning: no previous prototype for 'cdns_mhdp_register_cec_driver' [-Wmissing-prototypes]
     294 | int cdns_mhdp_register_cec_driver(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:326:5: warning: no previous prototype for 'cdns_mhdp_unregister_cec_driver' [-Wmissing-prototypes]
     326 | int cdns_mhdp_unregister_cec_driver(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cdns_mhdp_register_cec_driver +294 drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c

   293	
 > 294	int cdns_mhdp_register_cec_driver(struct device *dev)
   295	{
   296		struct cdns_mhdp_device *mhdp = dev_get_drvdata(dev);
   297		struct cdns_mhdp_cec *cec = &mhdp->hdmi.cec;
   298		int ret;
   299	
   300		cec->adap = cec_allocate_adapter(&cdns_mhdp_cec_adap_ops, cec,
   301						 CEC_NAME,
   302						 CEC_CAP_PHYS_ADDR | CEC_CAP_LOG_ADDRS |
   303						 CEC_CAP_TRANSMIT | CEC_CAP_PASSTHROUGH
   304						 | CEC_CAP_RC, CEC_MAX_LOG_ADDRS);
   305		ret = PTR_ERR_OR_ZERO(cec->adap);
   306		if (ret)
   307			return ret;
   308		ret = cec_register_adapter(cec->adap, dev);
   309		if (ret) {
   310			cec_delete_adapter(cec->adap);
   311			return ret;
   312		}
   313	
   314		cec->dev = dev;
   315	
   316		cec->cec_worker = kthread_create(mhdp_cec_poll_worker, cec, "cdns-mhdp-cec");
   317		if (IS_ERR(cec->cec_worker))
   318			dev_err(cec->dev, "failed  create hdp cec thread\n");
   319	
   320		wake_up_process(cec->cec_worker);
   321	
   322		dev_dbg(dev, "CEC successfuly probed\n");
   323		return 0;
   324	}
   325	
 > 326	int cdns_mhdp_unregister_cec_driver(struct device *dev)
   327	{
   328		struct cdns_mhdp_device *mhdp = dev_get_drvdata(dev);
   329		struct cdns_mhdp_cec *cec = &mhdp->hdmi.cec;
   330	
   331		if (cec->cec_worker) {
   332			kthread_stop(cec->cec_worker);
   333			cec->cec_worker = NULL;
   334		}
   335		cec_unregister_adapter(cec->adap);
   336		return 0;
   337	}
   338	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
