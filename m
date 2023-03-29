Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6391102
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 07:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680076004; x=1711612004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iKXifoHx5lElDCWRpDNmBAS/JgQk8h6DxWJOuVMFqkU=;
  b=VV3pw8a2+xf1a9uebAFqC76wB7qckD0/FIXBt/AngUYohaItOj3c+2p2
   O+Im2lRuMp7sqUqjpLlFUuS7Nlg7LsFaArxn7t2CI0CDMfUb9/pe/vTDl
   901JV9KPlnyO/+Q4zqCpwQoUFLKF7DXjWXXxSERgUIpqjvC7hFvYE/27r
   kkvR2JkL8ICrQ1oKVP/EWXlbXiY5EWBlx2ee0MkwEV1XKAJBIN0dsdB2+
   kCW76TuQUQAjhyA8Ei/+WV+VCjSn7rCkCt1QBFApR1OKYOLLy2sVweUqK
   FrrRJR+ZAYVRUEdf1kQej9A2PuK3XUx+U0Q0lJPTdd67HfrzP+sqrcre1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="324709788"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="324709788"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 00:46:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="808101072"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="808101072"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 29 Mar 2023 00:46:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phQW1-000JLW-2J;
	Wed, 29 Mar 2023 07:46:41 +0000
Date: Wed, 29 Mar 2023 15:46:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 28981/30000]
 drivers/staging/olpc_dcon/olpc_dcon.c:605:13: error: 'num_registered_fb'
 undeclared; did you mean 'WB_registered'?
Message-ID: <202303291517.1D5BSZaU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   3d06aac2e0879c67834fd31862ed9689255d9d18
commit: c569f6601cd01d049191bf568437144a5ac7d7e3 [28981/30000] UPSTREAM: fbdev: Make registered_fb[] private to fbmem.c
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230329/202303291517.1D5BSZaU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout c569f6601cd01d049191bf568437144a5ac7d7e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303291517.1D5BSZaU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/olpc_dcon/olpc_dcon.c: In function 'dcon_probe':
>> drivers/staging/olpc_dcon/olpc_dcon.c:605:13: error: 'num_registered_fb' undeclared (first use in this function); did you mean 'WB_registered'?
     605 |         if (num_registered_fb < 1) {
         |             ^~~~~~~~~~~~~~~~~
         |             WB_registered
   drivers/staging/olpc_dcon/olpc_dcon.c:605:13: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/staging/olpc_dcon/olpc_dcon.c:610:24: error: 'registered_fb' undeclared (first use in this function)
     610 |         dcon->fbinfo = registered_fb[0];
         |                        ^~~~~~~~~~~~~


vim +605 drivers/staging/olpc_dcon/olpc_dcon.c

53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  584  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  585  static int dcon_probe(struct i2c_client *client, const struct i2c_device_id *id)
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  586  {
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  587  	struct dcon_priv *dcon;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  588  	int rc, i, j;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  589  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  590  	if (!pdata)
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  591  		return -ENXIO;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  592  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  593  	dcon = kzalloc(sizeof(*dcon), GFP_KERNEL);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  594  	if (!dcon)
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  595  		return -ENOMEM;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  596  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  597  	dcon->client = client;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  598  	init_waitqueue_head(&dcon->waitq);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  599  	INIT_WORK(&dcon->switch_source, dcon_source_switch);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  600  	dcon->reboot_nb.notifier_call = dcon_reboot_notify;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  601  	dcon->reboot_nb.priority = -1;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  602  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  603  	i2c_set_clientdata(client, dcon);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  604  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04 @605  	if (num_registered_fb < 1) {
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  606  		dev_err(&client->dev, "DCON driver requires a registered fb\n");
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  607  		rc = -EIO;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  608  		goto einit;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  609  	}
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04 @610  	dcon->fbinfo = registered_fb[0];
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  611  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  612  	rc = dcon_hw_init(dcon, 1);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  613  	if (rc)
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  614  		goto einit;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  615  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  616  	/* Add the DCON device */
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  617  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  618  	dcon_device = platform_device_alloc("dcon", -1);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  619  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  620  	if (!dcon_device) {
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  621  		pr_err("Unable to create the DCON device\n");
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  622  		rc = -ENOMEM;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  623  		goto eirq;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  624  	}
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  625  	rc = platform_device_add(dcon_device);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  626  	platform_set_drvdata(dcon_device, dcon);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  627  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  628  	if (rc) {
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  629  		pr_err("Unable to add the DCON device\n");
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  630  		goto edev;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  631  	}
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  632  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  633  	for (i = 0; i < ARRAY_SIZE(dcon_device_files); i++) {
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  634  		rc = device_create_file(&dcon_device->dev,
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  635  					&dcon_device_files[i]);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  636  		if (rc) {
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  637  			dev_err(&dcon_device->dev, "Cannot create sysfs file\n");
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  638  			goto ecreate;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  639  		}
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  640  	}
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  641  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  642  	dcon->bl_val = dcon_read(dcon, DCON_REG_BRIGHT) & 0x0F;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  643  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  644  	/* Add the backlight device for the DCON */
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  645  	dcon_bl_props.brightness = dcon->bl_val;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  646  	dcon->bl_dev = backlight_device_register("dcon-bl", &dcon_device->dev,
848d9eabcaebf21 Zebulon McCorkle   2017-11-21  647  						 dcon, &dcon_bl_ops,
848d9eabcaebf21 Zebulon McCorkle   2017-11-21  648  						 &dcon_bl_props);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  649  	if (IS_ERR(dcon->bl_dev)) {
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  650  		dev_err(&client->dev, "cannot register backlight dev (%ld)\n",
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  651  			PTR_ERR(dcon->bl_dev));
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  652  		dcon->bl_dev = NULL;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  653  	}
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  654  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  655  	register_reboot_notifier(&dcon->reboot_nb);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  656  	atomic_notifier_chain_register(&panic_notifier_list, &dcon_panic_nb);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  657  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  658  	return 0;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  659  
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  660   ecreate:
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  661  	for (j = 0; j < i; j++)
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  662  		device_remove_file(&dcon_device->dev, &dcon_device_files[j]);
4996b4610767064 Jing Xiangfeng     2020-11-20  663  	platform_device_del(dcon_device);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  664   edev:
4996b4610767064 Jing Xiangfeng     2020-11-20  665  	platform_device_put(dcon_device);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  666  	dcon_device = NULL;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  667   eirq:
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  668  	free_irq(DCON_IRQ, dcon);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  669   einit:
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  670  	kfree(dcon);
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  671  	return rc;
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  672  }
53c43c5ca13328a Greg Kroah-Hartman 2016-04-04  673  

:::::: The code at line 605 was first introduced by commit
:::::: 53c43c5ca13328ac8f415aa2251791b441a12b51 Revert "Staging: olpc_dcon: Remove obsolete driver"

:::::: TO: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
