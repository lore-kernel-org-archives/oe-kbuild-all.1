Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD8E10EA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 14:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675521227; x=1707057227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NgcGNNRP6hVbWXHO7LCyzJAV74DuBQ8b5waA7mHWOQA=;
  b=leIumNcFR8PtzCt0NkdcPBYFnBmDLgf0/Ch8pPGFASfiGULQ4USJPPk2
   Ee6Dzcq57POuFtmw9ZTspeHpnNrS6G2EPaT4zGCS1eybjrjWxFAztQCtN
   StKHIvv0QoMPRQBtbxrDfBb5HZJSIL24SMUui7wlwnPVi01xkqBbjFoiQ
   XbkcCyVmfdsCIJnyGXhdZR98qlOZM6jFMHKt3tgkavzWJzEK0yrTVDBQk
   bEwMTW2Z5J3mdGLwT1EdvomVRHodfpAZ4JElEXSkU4IUEGgOMUpNf2cUw
   45hjqJyFGWlAy0HxeATnuWYNlEriyv6zsW5Ttvhot86jwwcvt3V31LKU7
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="316950957"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="316950957"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 06:33:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="808651979"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="808651979"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Feb 2023 06:33:46 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOJbt-0001MC-2W;
	Sat, 04 Feb 2023 14:33:45 +0000
Date: Sat, 4 Feb 2023 22:33:43 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 1379/20208]
 drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:294:5: warning: no previous
 prototype for 'cdns_mhdp_register_cec_driver'
Message-ID: <202302042257.PpZcS6ou-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: bc753308a6c069eeba6e0da7438dbc00d0011bf9 [1379/20208] drm: bridge: mhdp: Add cdns mhdp driver bridge driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230204/202302042257.PpZcS6ou-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/bc753308a6c069eeba6e0da7438dbc00d0011bf9
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout bc753308a6c069eeba6e0da7438dbc00d0011bf9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/firmware/imx/ drivers/gpu/drm/bridge/cadence/ drivers/gpu/drm/imx/ drivers/net/ethernet/freescale/fman/ drivers/pwm/ drivers/staging/ drivers/tty/serial/ net/ sound/soc/sof/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
https://github.com/intel/lkp-tests
