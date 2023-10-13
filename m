Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C1A568E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 05:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEXPsBwo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697176626; x=1728712626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3CFeDAn4O3GkqJnAFTDRn1/llQrbGhExqeRkIMz8O0Q=;
  b=jEXPsBwo4EWoIHKOW/ISIUKU+qaMI6oW3D2CovDf1M00EDkUg0Y/m1mo
   HPla2/iMwNLSms47iz4FnAyKg1bI3VrpRQNs4q1TU2R+iVgPpEy2qitmm
   Y8ogADoy7jZbIUffIyOe3CYmFyEKhKDKRiu5VYiE5RiBwQPjYcOm8VnFi
   v2PfhyGmrJEWTsoALo/mgnFmCqHf+9FdJQvrAQ3gJxGq5mCeNI/R2KlR9
   i2XmqhiUuUsNvpUcqAfIdRB5OgXVMgIJ7BsZgIhTdqk7i3ajsUX/ALqVD
   IdF607LVektSbMadgTwTGS1akxULwOdo2BIYv/C9XLHD179cn91cqSQQZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375458325"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="375458325"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 22:57:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1086006766"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="1086006766"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 12 Oct 2023 22:57:04 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrBAU-0004ON-2F;
	Fri, 13 Oct 2023 05:57:02 +0000
Date: Fri, 13 Oct 2023 13:56:29 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 563/30000]
 drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:300:5: warning: no previous
 prototype for 'cdns_mhdp_register_cec_driver'
Message-ID: <202310131352.YgLs77bT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 18252d211f87a754abef249a3bbf6fc05f41c569 [563/30000] drm: bridge: cadence: Add CEC driver for cdns mhdp hdmi
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231013/202310131352.YgLs77bT-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131352.YgLs77bT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131352.YgLs77bT-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                                        ^~~
         |                                        |
         |                                        struct cdns_mhdp_cec *
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:84:50: note: expected 'struct cdns_mhdp_cec *' but argument is of type 'struct cdns_mhdp_cec *'
      84 | static void mhdp_cec_write(struct cdns_mhdp_cec *cec, u32 offset, u32 val)
         |                            ~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:222:46: error: invalid use of undefined type 'struct cdns_mhdp_cec'
     222 |                         cec_transmit_done(cec->adap,
         |                                              ^~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:232:37: error: passing argument 1 of 'mhdp_cec_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
     232 |                 sts = mhdp_cec_read(cec, RX_MSG_STATUS);
         |                                     ^~~
         |                                     |
         |                                     struct cdns_mhdp_cec *
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:77:48: note: expected 'struct cdns_mhdp_cec *' but argument is of type 'struct cdns_mhdp_cec *'
      77 | static u32 mhdp_cec_read(struct cdns_mhdp_cec *cec, u32 offset)
         |                          ~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:233:45: error: passing argument 1 of 'mhdp_cec_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
     233 |                 num_rx_msgs = mhdp_cec_read(cec, NUM_OF_MSG_RX_BUF);
         |                                             ^~~
         |                                             |
         |                                             struct cdns_mhdp_cec *
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:77:48: note: expected 'struct cdns_mhdp_cec *' but argument is of type 'struct cdns_mhdp_cec *'
      77 | static u32 mhdp_cec_read(struct cdns_mhdp_cec *cec, u32 offset)
         |                          ~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:240:44: error: invalid use of undefined type 'struct cdns_mhdp_cec'
     240 |                                 dev_err(cec->dev, "Error rx msg num %d\n",
         |                                            ^~
   include/linux/device.h:1741:18: note: in definition of macro 'dev_err'
    1741 |         _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                  ^~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:242:58: error: passing argument 1 of 'mhdp_cec_clear_rx_buffer' from incompatible pointer type [-Werror=incompatible-pointer-types]
     242 |                                 mhdp_cec_clear_rx_buffer(cec);
         |                                                          ^~~
         |                                                          |
         |                                                          struct cdns_mhdp_cec *
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:91:60: note: expected 'struct cdns_mhdp_cec *' but argument is of type 'struct cdns_mhdp_cec *'
      91 | static void mhdp_cec_clear_rx_buffer(struct cdns_mhdp_cec *cec)
         |                                      ~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:248:55: error: passing argument 1 of 'mhdp_cec_read_message' from incompatible pointer type [-Werror=incompatible-pointer-types]
     248 |                                 mhdp_cec_read_message(cec);
         |                                                       ^~~
         |                                                       |
         |                                                       struct cdns_mhdp_cec *
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:111:56: note: expected 'struct cdns_mhdp_cec *' but argument is of type 'struct cdns_mhdp_cec *'
     111 | static u32 mhdp_cec_read_message(struct cdns_mhdp_cec *cec)
         |                                  ~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:249:36: error: invalid use of undefined type 'struct cdns_mhdp_cec'
     249 |                                 cec->msg.rx_status = CEC_RX_STATUS_OK;
         |                                    ^~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:250:53: error: invalid use of undefined type 'struct cdns_mhdp_cec'
     250 |                                 cec_received_msg(cec->adap, &cec->msg);
         |                                                     ^~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:250:65: error: invalid use of undefined type 'struct cdns_mhdp_cec'
     250 |                                 cec_received_msg(cec->adap, &cec->msg);
         |                                                                 ^~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c: In function 'mhdp_cec_adap_enable':
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:269:32: error: passing argument 1 of 'mhdp_cec_write' from incompatible pointer type [-Werror=incompatible-pointer-types]
     269 |                 mhdp_cec_write(cec, DB_L_TIMER, 0x10);
         |                                ^~~
         |                                |
         |                                struct cdns_mhdp_cec *
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:84:50: note: expected 'struct cdns_mhdp_cec *' but argument is of type 'struct cdns_mhdp_cec *'
      84 | static void mhdp_cec_write(struct cdns_mhdp_cec *cec, u32 offset, u32 val)
         |                            ~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:270:38: error: passing argument 1 of 'mhdp_cec_set_divider' from incompatible pointer type [-Werror=incompatible-pointer-types]
     270 |                 mhdp_cec_set_divider(cec);
         |                                      ^~~
         |                                      |
         |                                      struct cdns_mhdp_cec *
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:97:56: note: expected 'struct cdns_mhdp_cec *' but argument is of type 'struct cdns_mhdp_cec *'
      97 | static void mhdp_cec_set_divider(struct cdns_mhdp_cec *cec)
         |                                  ~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:272:38: error: passing argument 1 of 'mhdp_cec_set_divider' from incompatible pointer type [-Werror=incompatible-pointer-types]
     272 |                 mhdp_cec_set_divider(cec);
         |                                      ^~~
         |                                      |
         |                                      struct cdns_mhdp_cec *
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:97:56: note: expected 'struct cdns_mhdp_cec *' but argument is of type 'struct cdns_mhdp_cec *'
      97 | static void mhdp_cec_set_divider(struct cdns_mhdp_cec *cec)
         |                                  ~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c: In function 'mhdp_cec_adap_log_addr':
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:281:42: error: passing argument 1 of 'mhdp_cec_set_logical_addr' from incompatible pointer type [-Werror=incompatible-pointer-types]
     281 |         return mhdp_cec_set_logical_addr(cec, addr);
         |                                          ^~~
         |                                          |
         |                                          struct cdns_mhdp_cec *
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:167:60: note: expected 'struct cdns_mhdp_cec *' but argument is of type 'struct cdns_mhdp_cec *'
     167 | static int mhdp_cec_set_logical_addr(struct cdns_mhdp_cec *cec, u32 la)
         |                                      ~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c: In function 'mhdp_cec_adap_transmit':
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:289:32: error: passing argument 1 of 'mhdp_cec_write_message' from incompatible pointer type [-Werror=incompatible-pointer-types]
     289 |         mhdp_cec_write_message(cec, msg);
         |                                ^~~
         |                                |
         |                                struct cdns_mhdp_cec *
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:134:57: note: expected 'struct cdns_mhdp_cec *' but argument is of type 'struct cdns_mhdp_cec *'
     134 | static u32 mhdp_cec_write_message(struct cdns_mhdp_cec *cec, struct cec_msg *msg)
         |                                   ~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c: At top level:
>> drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:300:5: warning: no previous prototype for 'cdns_mhdp_register_cec_driver' [-Wmissing-prototypes]
     300 | int cdns_mhdp_register_cec_driver(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c: In function 'cdns_mhdp_register_cec_driver':
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:303:48: error: 'struct _hdmi_data' has no member named 'cec'
     303 |         struct cdns_mhdp_cec *cec = &mhdp->hdmi.cec;
         |                                                ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:306:12: error: invalid use of undefined type 'struct cdns_mhdp_cec'
     306 |         cec->adap = cec_allocate_adapter(&cdns_mhdp_cec_adap_ops, cec,
         |            ^~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:311:34: error: invalid use of undefined type 'struct cdns_mhdp_cec'
     311 |         ret = PTR_ERR_OR_ZERO(cec->adap);
         |                                  ^~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:314:39: error: invalid use of undefined type 'struct cdns_mhdp_cec'
     314 |         ret = cec_register_adapter(cec->adap, dev);
         |                                       ^~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:316:39: error: invalid use of undefined type 'struct cdns_mhdp_cec'
     316 |                 cec_delete_adapter(cec->adap);
         |                                       ^~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:320:12: error: invalid use of undefined type 'struct cdns_mhdp_cec'
     320 |         cec->dev = dev;
         |            ^~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:322:12: error: invalid use of undefined type 'struct cdns_mhdp_cec'
     322 |         cec->cec_worker = kthread_create(mhdp_cec_poll_worker, cec, "cdns-mhdp-cec");
         |            ^~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:323:23: error: invalid use of undefined type 'struct cdns_mhdp_cec'
     323 |         if (IS_ERR(cec->cec_worker))
         |                       ^~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:324:28: error: invalid use of undefined type 'struct cdns_mhdp_cec'
     324 |                 dev_err(cec->dev, "failed  create hdp cec thread\n");
         |                            ^~
   include/linux/device.h:1741:18: note: in definition of macro 'dev_err'
    1741 |         _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                  ^~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:326:28: error: invalid use of undefined type 'struct cdns_mhdp_cec'
     326 |         wake_up_process(cec->cec_worker);
         |                            ^~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c: At top level:
>> drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:332:5: warning: no previous prototype for 'cdns_mhdp_unregister_cec_driver' [-Wmissing-prototypes]
     332 | int cdns_mhdp_unregister_cec_driver(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c: In function 'cdns_mhdp_unregister_cec_driver':
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:335:48: error: 'struct _hdmi_data' has no member named 'cec'
     335 |         struct cdns_mhdp_cec *cec = &mhdp->hdmi.cec;
         |                                                ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:337:16: error: invalid use of undefined type 'struct cdns_mhdp_cec'
     337 |         if (cec->cec_worker) {
         |                ^~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:338:33: error: invalid use of undefined type 'struct cdns_mhdp_cec'
     338 |                 kthread_stop(cec->cec_worker);
         |                                 ^~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:339:20: error: invalid use of undefined type 'struct cdns_mhdp_cec'
     339 |                 cec->cec_worker = NULL;
         |                    ^~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:341:35: error: invalid use of undefined type 'struct cdns_mhdp_cec'
     341 |         cec_unregister_adapter(cec->adap);
         |                                   ^~
   cc1: some warnings being treated as errors


vim +/cdns_mhdp_register_cec_driver +300 drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c

   299	
 > 300	int cdns_mhdp_register_cec_driver(struct device *dev)
   301	{
   302		struct cdns_mhdp_device *mhdp = dev_get_drvdata(dev);
   303		struct cdns_mhdp_cec *cec = &mhdp->hdmi.cec;
   304		int ret;
   305	
   306		cec->adap = cec_allocate_adapter(&cdns_mhdp_cec_adap_ops, cec,
   307						 CEC_NAME,
   308						 CEC_CAP_PHYS_ADDR | CEC_CAP_LOG_ADDRS |
   309						 CEC_CAP_TRANSMIT | CEC_CAP_PASSTHROUGH
   310						 | CEC_CAP_RC, 1);
   311		ret = PTR_ERR_OR_ZERO(cec->adap);
   312		if (ret)
   313			return ret;
   314		ret = cec_register_adapter(cec->adap, dev);
   315		if (ret) {
   316			cec_delete_adapter(cec->adap);
   317			return ret;
   318		}
   319	
   320		cec->dev = dev;
   321	
   322		cec->cec_worker = kthread_create(mhdp_cec_poll_worker, cec, "cdns-mhdp-cec");
   323		if (IS_ERR(cec->cec_worker))
   324			dev_err(cec->dev, "failed  create hdp cec thread\n");
   325	
   326		wake_up_process(cec->cec_worker);
   327	
   328		dev_dbg(dev, "CEC successfuly probed\n");
   329		return 0;
   330	}
   331	
 > 332	int cdns_mhdp_unregister_cec_driver(struct device *dev)
   333	{
   334		struct cdns_mhdp_device *mhdp = dev_get_drvdata(dev);
   335		struct cdns_mhdp_cec *cec = &mhdp->hdmi.cec;
   336	
   337		if (cec->cec_worker) {
   338			kthread_stop(cec->cec_worker);
   339			cec->cec_worker = NULL;
   340		}
   341		cec_unregister_adapter(cec->adap);
   342		return 0;
   343	}
   344	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
