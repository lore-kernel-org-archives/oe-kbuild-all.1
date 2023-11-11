Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B797D1854
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 08:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBwjHCoR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699690839; x=1731226839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XORCf+w1JavYrND5oguvV8GvhSRxKknV7rUX51+XLN8=;
  b=QBwjHCoRzQmPFy8pe34rkAEx0nD8cRNe3ObTNepEGkXshQjgcS2mKwqM
   18AkudnhK4NM+2hHyBi45+Jk4oXfDlrXXTOv3+Gvv2X2UjKd6wMdlbgOJ
   +c6OLIjvLyEAbxU2sBviPJ3OPzdjcnS6gA60IRXqscss6Q2FqRUjtl6cz
   Hb8yacTSXWB2micwMBMty15O5y2CL1/lx99PVFLWnmAKHiiMcDy2rstpy
   quvn/Ok3Z9cbZDkTDECNW2EDRZ9eTAyDe5Ct+RCINOgOanwFOESA03xsf
   +o4PSBBV1/gBDuOZs0xRl5hhHc1EtJhDdsaOOAyuMMUQZZ9FDACODgiH8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="380650814"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="380650814"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 00:20:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="798759535"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="798759535"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Nov 2023 00:20:38 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1jEJ-000AKE-2Y;
	Sat, 11 Nov 2023 08:20:35 +0000
Date: Sat, 11 Nov 2023 16:20:04 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-6.7 335/336]
 drivers/tty/hvc/hvc_iucv.c:1104:28: error: assignment to 'void (*)(struct
 device *)' from incompatible pointer type 'int (*)(void *)'
Message-ID: <202311111643.4GFEqULD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-6.7
head:   a4b755e29c5eea2a696d7ec17a623dcb675a9897
commit: 61caa2dc47b1faa31a67192533f7bfaf1277db54 [335/336] fixup function pointers
config: s390-defconfig (https://download.01.org/0day-ci/archive/20231111/202311111643.4GFEqULD-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311111643.4GFEqULD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111643.4GFEqULD-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/hvc/hvc_iucv.c:1038:5: warning: no previous prototype for 'hvc_iucv_free' [-Wmissing-prototypes]
    1038 | int hvc_iucv_free(void *data)
         |     ^~~~~~~~~~~~~
   drivers/tty/hvc/hvc_iucv.c: In function 'hvc_iucv_alloc':
>> drivers/tty/hvc/hvc_iucv.c:1104:28: error: assignment to 'void (*)(struct device *)' from incompatible pointer type 'int (*)(void *)' [-Werror=incompatible-pointer-types]
    1104 |         priv->dev->release = hvc_iucv_free;
         |                            ^
   drivers/tty/hvc/hvc_iucv.c: In function 'hvc_iucv_free':
   drivers/tty/hvc/hvc_iucv.c:1041:1: warning: control reaches end of non-void function [-Wreturn-type]
    1041 | }
         | ^
   cc1: some warnings being treated as errors


vim +1104 drivers/tty/hvc/hvc_iucv.c

  1037	
> 1038	int hvc_iucv_free(void *data)
  1039	{
  1040		kfree(data);
  1041	}
  1042	
  1043	/**
  1044	 * hvc_iucv_alloc() - Allocates a new struct hvc_iucv_private instance
  1045	 * @id:			hvc_iucv_table index
  1046	 * @is_console:		Flag if the instance is used as Linux console
  1047	 *
  1048	 * This function allocates a new hvc_iucv_private structure and stores
  1049	 * the instance in hvc_iucv_table at index @id.
  1050	 * Returns 0 on success; otherwise non-zero.
  1051	 */
  1052	static int __init hvc_iucv_alloc(int id, unsigned int is_console)
  1053	{
  1054		struct hvc_iucv_private *priv;
  1055		char name[9];
  1056		int rc;
  1057	
  1058		priv = kzalloc(sizeof(struct hvc_iucv_private), GFP_KERNEL);
  1059		if (!priv)
  1060			return -ENOMEM;
  1061	
  1062		spin_lock_init(&priv->lock);
  1063		INIT_LIST_HEAD(&priv->tty_outqueue);
  1064		INIT_LIST_HEAD(&priv->tty_inqueue);
  1065		INIT_DELAYED_WORK(&priv->sndbuf_work, hvc_iucv_sndbuf_work);
  1066		init_waitqueue_head(&priv->sndbuf_waitq);
  1067	
  1068		priv->sndbuf = (void *) get_zeroed_page(GFP_KERNEL);
  1069		if (!priv->sndbuf) {
  1070			kfree(priv);
  1071			return -ENOMEM;
  1072		}
  1073	
  1074		/* set console flag */
  1075		priv->is_console = is_console;
  1076	
  1077		/* allocate hvc device */
  1078		priv->hvc = hvc_alloc(id, /*		 PAGE_SIZE */
  1079				      id, &hvc_iucv_ops, 256);
  1080		if (IS_ERR(priv->hvc)) {
  1081			rc = PTR_ERR(priv->hvc);
  1082			goto out_error_hvc;
  1083		}
  1084	
  1085		/* notify HVC thread instead of using polling */
  1086		priv->hvc->irq_requested = 1;
  1087	
  1088		/* setup iucv related information */
  1089		snprintf(name, 9, "lnxhvc%-2d", id);
  1090		memcpy(priv->srv_name, name, 8);
  1091		ASCEBC(priv->srv_name, 8);
  1092	
  1093		/* create and setup device */
  1094		priv->dev = kzalloc(sizeof(*priv->dev), GFP_KERNEL);
  1095		if (!priv->dev) {
  1096			rc = -ENOMEM;
  1097			goto out_error_dev;
  1098		}
  1099		dev_set_name(priv->dev, "hvc_iucv%d", id);
  1100		dev_set_drvdata(priv->dev, priv);
  1101		priv->dev->bus = &iucv_bus;
  1102		priv->dev->parent = iucv_root;
  1103		priv->dev->groups = hvc_iucv_dev_attr_groups;
> 1104		priv->dev->release = hvc_iucv_free;
  1105		rc = device_register(priv->dev);
  1106		if (rc) {
  1107			put_device(priv->dev);
  1108			goto out_error_dev;
  1109		}
  1110	
  1111		hvc_iucv_table[id] = priv;
  1112		return 0;
  1113	
  1114	out_error_dev:
  1115		hvc_remove(priv->hvc);
  1116	out_error_hvc:
  1117		free_page((unsigned long) priv->sndbuf);
  1118		kfree(priv);
  1119	
  1120		return rc;
  1121	}
  1122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
