Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA59140E5F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 09:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764926570; cv=none; b=vByJ+q9TU+Yo1r/nOO4kDcTE136oeG3f+dx3yQvBv9KEywKQRHVilBtDAs9/ET8kFxdLRDm7/J/GpwJcGgOCckt5vsEM7CayyQ/gV7zouK4X9l65IUxtKgdxb9IzhykTT+OAzrA03ELSf1cF5WPEdWp5Ovdr5dQ0KgESF+2/v+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764926570; c=relaxed/simple;
	bh=mZt9VBNfKFhBE3QgSd3omnJOJBJFoDG5REq+Osx/IE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YI5lF5CBT3w8VKOuCIKluqRr3UWqIOIPs1l6tZ0Pn6HhM4F16+oRaA1XdctouUHNpl3+Oya4Pyt39KNMt9GNWCSslYvuD5vMnpR2iHBLn3AKP6GQOZ8PJscZa9xcJH/ds+2DqxO+N078zsk04czqiqlitG2CnVXmvUsRJU20uUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IrE9TDm9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IrE9TDm9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764926563; x=1796462563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mZt9VBNfKFhBE3QgSd3omnJOJBJFoDG5REq+Osx/IE0=;
  b=IrE9TDm9FAzODZ9D5yuMrISFG2Py4o9NIeSWgLI58gao3Q50WIDkcnJF
   UzHaN1JW0/uU/BUb2/SnkMKye2CeBAUmFcN2keiYUd8NLEXujImVDg+5Q
   lBB+sB/vSPlYdAxUXf37+ttb5QZi9rqaaloixxPp9HSJHq/LsM8PaQ4dV
   lEJ297s/VqOwPUF7pAwaOYrOnCH+mVmSWe9SHFleETJemk3McKpwyubDr
   D4bn779aTjjRfMJdXcuSFLHXAy6qOY/VRObIOfpXk4L5Efz7/spS1GX71
   o8k2u5+vqlrsV04wpsvn4/WPRE/bMd1Ndfnh39Eo5Jhj7mUb9VBCIpT0d
   A==;
X-CSE-ConnectionGUID: tvAdV6/DSuWpkUcWKyWUzQ==
X-CSE-MsgGUID: WtxhaIpiRTqYeLytag1fyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66999708"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="66999708"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 01:22:38 -0800
X-CSE-ConnectionGUID: xTAP2iccSdOH0sEQU1x2Lw==
X-CSE-MsgGUID: limE46mZT267IGHdoM7PfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="195151624"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Dec 2025 01:22:37 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRS1K-00000000Eon-1yLN;
	Fri, 05 Dec 2025 09:22:34 +0000
Date: Fri, 5 Dec 2025 17:21:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Guo <guoyongqiang12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3479/3479]
 drivers/ub/urma/ubcore/ubcore_device.c:940:5: warning: no previous prototype
 for 'ubcore_register_device'
Message-ID: <202512051717.zlmADxcV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4b48fa45408a2757255bdd0c640c1f693b424fe4
commit: 05337ccf75c6e16dd9b88583e02d0ea1ce32bf28 [3479/3479] ubcore: implement device registration and jetty management
config: arm64-randconfig-r061-20251205 (https://download.01.org/0day-ci/archive/20251205/202512051717.zlmADxcV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051717.zlmADxcV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512051717.zlmADxcV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/urma/ubcore/ubcore_device.c:600:6: warning: no previous prototype for 'ubcore_set_client_ctx_data' [-Wmissing-prototypes]
     600 | void ubcore_set_client_ctx_data(struct ubcore_device *dev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:653:7: warning: no previous prototype for 'ubcore_get_client_ctx_data' [-Wmissing-prototypes]
     653 | void *ubcore_get_client_ctx_data(struct ubcore_device *dev,
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:716:5: warning: no previous prototype for 'ubcore_register_client' [-Wmissing-prototypes]
     716 | int ubcore_register_client(struct ubcore_client *new_client)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:751:6: warning: no previous prototype for 'ubcore_unregister_client' [-Wmissing-prototypes]
     751 | void ubcore_unregister_client(struct ubcore_client *rm_client)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_device.c:940:5: warning: no previous prototype for 'ubcore_register_device' [-Wmissing-prototypes]
     940 | int ubcore_register_device(struct ubcore_device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_device.c:1004:6: warning: no previous prototype for 'ubcore_unregister_device' [-Wmissing-prototypes]
    1004 | void ubcore_unregister_device(struct ubcore_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:1044:5: warning: no previous prototype for 'ubcore_query_device_attr' [-Wmissing-prototypes]
    1044 | int ubcore_query_device_attr(struct ubcore_device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:1064:5: warning: no previous prototype for 'ubcore_query_device_status' [-Wmissing-prototypes]
    1064 | int ubcore_query_device_status(struct ubcore_device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:1085:5: warning: no previous prototype for 'ubcore_query_resource' [-Wmissing-prototypes]
    1085 | int ubcore_query_resource(struct ubcore_device *dev, struct ubcore_res_key *key,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:1104:5: warning: no previous prototype for 'ubcore_config_device' [-Wmissing-prototypes]
    1104 | int ubcore_config_device(struct ubcore_device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:1124:5: warning: no previous prototype for 'ubcore_user_control' [-Wmissing-prototypes]
    1124 | int ubcore_user_control(struct ubcore_device *dev,
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:1149:5: warning: no previous prototype for 'ubcore_query_stats' [-Wmissing-prototypes]
    1149 | int ubcore_query_stats(struct ubcore_device *dev, struct ubcore_stats_key *key,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c: In function 'init_ubcore_device':
   drivers/ub/urma/ubcore/ubcore_device.c:358:35: warning: array subscript 4 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     358 |      cap->max_tp_cnt < g_ht_params[UBCORE_HT_TP].size)
         |                        ~~~~~~~~~~~^~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:299:31: note: while referencing 'g_ht_params'
     299 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:359:14: warning: array subscript 4 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     359 |   g_ht_params[UBCORE_HT_TP].size = cap->max_tp_cnt;
         |   ~~~~~~~~~~~^~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:299:31: note: while referencing 'g_ht_params'
     299 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:361:36: warning: array subscript 5 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     361 |      cap->max_tpg_cnt < g_ht_params[UBCORE_HT_TPG].size)
         |                         ~~~~~~~~~~~^~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:299:31: note: while referencing 'g_ht_params'
     299 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:362:14: warning: array subscript 5 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     362 |   g_ht_params[UBCORE_HT_TPG].size = cap->max_tpg_cnt;
         |   ~~~~~~~~~~~^~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:299:31: note: while referencing 'g_ht_params'
     299 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:330:13: warning: array subscript 6 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     330 |  g_ht_params[UBCORE_HT_RM_VTP].size = vtp_size;
         |  ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:299:31: note: while referencing 'g_ht_params'
     299 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:331:13: warning: array subscript 7 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     331 |  g_ht_params[UBCORE_HT_RC_VTP].size = vtp_size;
         |  ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:299:31: note: while referencing 'g_ht_params'
     299 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:332:13: warning: array subscript 8 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     332 |  g_ht_params[UBCORE_HT_UM_VTP].size = vtp_size;
         |  ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:299:31: note: while referencing 'g_ht_params'
     299 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:339:13: warning: array subscript 9 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     339 |  g_ht_params[UBCORE_HT_RM_VTPN].size = vtpn_size;
         |  ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:299:31: note: while referencing 'g_ht_params'
     299 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:340:13: warning: array subscript 10 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     340 |  g_ht_params[UBCORE_HT_RC_VTPN].size = vtpn_size;
         |  ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:299:31: note: while referencing 'g_ht_params'
     299 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:341:13: warning: array subscript 11 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     341 |  g_ht_params[UBCORE_HT_UM_VTPN].size = vtpn_size;
         |  ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:299:31: note: while referencing 'g_ht_params'
     299 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:342:13: warning: array subscript 12 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     342 |  g_ht_params[UBCORE_HT_CP_VTPN].size = vtpn_size;
         |  ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:299:31: note: while referencing 'g_ht_params'
     299 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:343:13: warning: array subscript 14 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     343 |  g_ht_params[UBCORE_HT_VTPN].size = vtpn_size;
         |  ~~~~~~~~~~~^~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:299:31: note: while referencing 'g_ht_params'
     299 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:370:36: warning: array subscript 13 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     370 |      cap->max_utp_cnt < g_ht_params[UBCORE_HT_UTP].size)
         |                         ~~~~~~~~~~~^~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:299:31: note: while referencing 'g_ht_params'
     299 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:371:14: warning: array subscript 13 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +/ubcore_register_device +940 drivers/ub/urma/ubcore/ubcore_device.c

   939	
 > 940	int ubcore_register_device(struct ubcore_device *dev)
   941	{
   942		struct ubcore_device *find_dev = NULL;
   943		int ret;
   944	
   945		if (dev == NULL || dev->ops == NULL ||
   946		    strnlen(dev->dev_name, UBCORE_MAX_DEV_NAME) == 0 ||
   947		    strnlen(dev->dev_name, UBCORE_MAX_DEV_NAME) >=
   948			    UBCORE_MAX_DEV_NAME) {
   949			ubcore_log_err("Invalid parameter.\n");
   950			return -EINVAL;
   951		}
   952	
   953		find_dev = ubcore_find_device_with_name(dev->dev_name);
   954		if (find_dev != NULL) {
   955			ubcore_log_err("Duplicate device name %s.\n", dev->dev_name);
   956			ubcore_put_device(find_dev);
   957			return -EEXIST;
   958		}
   959	
   960		if (init_ubcore_device(dev) != 0) {
   961			ubcore_log_err("failed to init ubcore device.\n");
   962			return -EINVAL;
   963		}
   964	
   965		ret = ubcore_create_main_device(dev);
   966		if (ret) {
   967			uninit_ubcore_device(dev);
   968			ubcore_log_err("create main device failed.\n");
   969			return ret;
   970		}
   971	
   972		if (ubcore_config_device_in_register(dev) != 0) {
   973			ubcore_log_err("failed to config ubcore device.\n");
   974			ret = -EPERM;
   975			goto destroy_mdev;
   976		}
   977	
   978		down_write(&g_device_rwsem);
   979		ubcore_clients_add(dev);
   980		ret = ubcore_copy_logic_devices(dev);
   981		if (ret) {
   982			ubcore_clients_remove(dev);
   983			up_write(&g_device_rwsem);
   984	
   985			ubcore_log_err("copy logic device failed, device:%s.\n",
   986				       dev->dev_name);
   987			goto destroy_mdev;
   988		}
   989	
   990		list_add_tail(&dev->list_node, &g_device_list);
   991		up_write(&g_device_rwsem);
   992	
   993		ubcore_log_info_rl("ubcore device: %s register success.\n",
   994				   dev->dev_name);
   995		return 0;
   996	
   997	destroy_mdev:
   998		ubcore_destroy_main_device(dev);
   999		uninit_ubcore_device(dev);
  1000		return ret;
  1001	}
  1002	EXPORT_SYMBOL(ubcore_register_device);
  1003	
> 1004	void ubcore_unregister_device(struct ubcore_device *dev)
  1005	{
  1006		if (dev == NULL || strnlen(dev->dev_name, UBCORE_MAX_DEV_NAME) >=
  1007					   UBCORE_MAX_DEV_NAME) {
  1008			ubcore_log_warn("Invalid input dev is null ptr.\n");
  1009			return;
  1010		}
  1011		down_write(&g_device_rwsem);
  1012	
  1013		/* Remove device from g_device_list */
  1014		list_del(&dev->list_node);
  1015	
  1016		/* Destroy uburma device, may be scheduled.
  1017		 * This should not be done within a spin_lock_irqsave
  1018		 */
  1019		up_write(&g_device_rwsem);
  1020		ubcore_clients_remove(dev);
  1021	
  1022		ubcore_flush_workqueue((int)UBCORE_DISPATCH_EVENT_WQ);
  1023		ubcore_flush_workqueue((int)UBCORE_SIP_NOTIFY_WQ);
  1024	
  1025		down_read(&g_device_rwsem);
  1026		// ubcore_cgroup_unreg_dev(dev);
  1027	
  1028		ubcore_remove_logic_devices(dev);
  1029		ubcore_destroy_main_device(dev);
  1030		up_read(&g_device_rwsem);
  1031	
  1032		/* Pair with set use_cnt = 1 when init device */
  1033		ubcore_put_device(dev);
  1034		/* Wait for use cnt == 0 */
  1035		wait_for_completion(&dev->comp);
  1036		uninit_ubcore_device(
  1037			dev); /* Protect eid table access security based on ref cnt */
  1038	
  1039		ubcore_log_info_rl("ubcore device: %s unregister success.\n",
  1040				   dev->dev_name);
  1041	}
  1042	EXPORT_SYMBOL(ubcore_unregister_device);
  1043	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
