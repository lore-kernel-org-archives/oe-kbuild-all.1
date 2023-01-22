Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93BA2115
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Jan 2023 21:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674423102; x=1705959102;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bGTffgdXP4A8aNDrSF98zysRm+8uRZ3ch5yCbv9lOAU=;
  b=ErMwSlUVSgNpQOITpXM97Aqq5PdqQP/tT0hAM8JO9SebZq3lykbxFgm5
   TRxeUFZabSCyajyk22Qb3iW7ZPPc978pP7MDuhUCJ+rIXG751LAsCIK1+
   vOZ1+aGyWasMXNe7hu8k1hfBpc5Kd7bYv153cKFx9sypMD8UpaZ2rseQ1
   tPs/cX0erJ4ihlgg257uZpojN9jhpuv1UVnc69bhXUSOqpGPzEiK0r/XG
   s8Gndj85bMWDgdTebgu6hkzI5wN2z63XGWFknVurbC14Eh4NbvoG3WGdT
   og51JM0Gwge6hLU8tujzOphkaoqkhdOFr4p7BR+vYPA/FasjgvG7QRbuh
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="313837927"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="313837927"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2023 13:31:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="724823032"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="724823032"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 22 Jan 2023 13:31:40 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJhwB-0005G0-2d;
	Sun, 22 Jan 2023 21:31:39 +0000
Date: Mon, 23 Jan 2023 05:30:42 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/200-dcp 90/91]
 drivers/gpu/drm/apple/apple_drv.c:425:39: warning: format '%d' expects
 argument of type 'int', but argument 4 has type 'long int'
Message-ID: <202301230545.6EszMlPl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   a2482bcc061b8b8143649c24162ebcaed9af3102
commit: db981af1f9501e533d9bb90a1a35dce5a08be857 [90/91] drm/apple: Support DCP shutdown and restart
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230123/202301230545.6EszMlPl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/db981af1f9501e533d9bb90a1a35dce5a08be857
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/200-dcp
        git checkout db981af1f9501e533d9bb90a1a35dce5a08be857
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/apple/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from drivers/gpu/drm/apple/apple_drv.c:11:
   drivers/gpu/drm/apple/apple_drv.c: In function 'apple_drm_init_dcp':
>> drivers/gpu/drm/apple/apple_drv.c:425:39: warning: format '%d' expects argument of type 'int', but argument 4 has type 'long int' [-Wformat=]
     425 |                         dev_warn(dev, "dcp[%d] device link failed:%d\n",
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:146:61: note: in expansion of macro 'dev_fmt'
     146 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/gpu/drm/apple/apple_drv.c:425:25: note: in expansion of macro 'dev_warn'
     425 |                         dev_warn(dev, "dcp[%d] device link failed:%d\n",
         |                         ^~~~~~~~
   drivers/gpu/drm/apple/apple_drv.c:425:68: note: format string is defined here
     425 |                         dev_warn(dev, "dcp[%d] device link failed:%d\n",
         |                                                                   ~^
         |                                                                    |
         |                                                                    int
         |                                                                   %ld


vim +425 drivers/gpu/drm/apple/apple_drv.c

   399	
   400	static int apple_drm_init_dcp(struct device *dev)
   401	{
   402		struct apple_drm_private *apple = dev_get_drvdata(dev);
   403		struct platform_device *dcp[MAX_COPROCESSORS];
   404		struct device_node *np;
   405		u64 timeout;
   406		int i, ret, num_dcp = 0;
   407	
   408		for_each_matching_node(np, apple_dcp_id_tbl) {
   409			struct device_link *link;
   410	
   411			if (!of_device_is_available(np)) {
   412				of_node_put(np);
   413				continue;
   414			}
   415	
   416			dcp[num_dcp] = of_find_device_by_node(np);
   417			of_node_put(np);
   418			if (!dcp[num_dcp])
   419				continue;
   420		
   421			link = device_link_add(dev, &dcp[num_dcp]->dev,
   422				     DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_SUPPLIER);
   423	
   424			if (IS_ERR(link))
 > 425				dev_warn(dev, "dcp[%d] device link failed:%d\n",
   426					 num_dcp, PTR_ERR(link));
   427	
   428			ret = apple_probe_per_dcp(dev, &apple->drm, dcp[num_dcp],
   429						  num_dcp);
   430			if (ret)
   431				continue;
   432	
   433			ret = dcp_start(dcp[num_dcp]);
   434			if (ret)
   435				continue;
   436	
   437			num_dcp++;
   438		}
   439	
   440		if (num_dcp < 1)
   441			return -ENODEV;
   442	
   443		timeout = get_jiffies_64() + msecs_to_jiffies(500);
   444	
   445		for (i = 0; i < num_dcp; ++i) {
   446			u64 jiffies = get_jiffies_64();
   447			u64 wait = time_after_eq64(jiffies, timeout) ?
   448					   0 :
   449					   timeout - jiffies;
   450			ret = dcp_wait_ready(dcp[i], wait);
   451			/* There is nothing we can do if a dcp/dcpext does not boot
   452			 * (successfully). Ignoring it should not do any harm now.
   453			 * Needs to reevaluated whenn adding dcpext support.
   454			 */
   455			if (ret)
   456				dev_warn(dev, "DCP[%d] not ready: %d\n", i, ret);
   457		}
   458	
   459		return 0;
   460	}
   461	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
