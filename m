Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370CA16BE35
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 11:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724845995; cv=none; b=mB6SBrSS5b76yvDo58x/ofA//Gz0NCC1r31pRjScYq88X91I35xdYVmDjEeNdJ3VgE1g3LQDOPLkhYZ4pR2cyqfB3XWp2flmGlEeBm9e1Sy0IxbGZQ5CmTMk9J7hJEnjTqH7DhOdwQUZYDAU8Actstqyqx85uqxorxSeR89CjEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724845995; c=relaxed/simple;
	bh=iLVLCgJcMlvVZs6WESkTdu63IPLht8F+K54FPKY2JWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ErEEEoecHtRLY7oxCn4Qycpw5j3QFUvkUW+7yJrVFuNhMWG026uyIFQd3dJcC2N6p8wgafsejigc6/JAIzoHOt5lhZk2Qad7RsXTLtx9GHeuQ2nCIxbnjEd8m0ts1vPYKEQu5ox1z4O228u0U5UM6QGqLms/sFu1uTpZfj9rvls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LzckO4F/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LzckO4F/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724845993; x=1756381993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iLVLCgJcMlvVZs6WESkTdu63IPLht8F+K54FPKY2JWA=;
  b=LzckO4F/h8kQYiPxPKB6wSTKmWTu+iNXeHBPHicPsVNBzFOSoTMY8tiS
   eU4Ji5b+OiolCQvgKDEdDT2lvpdIbepGCcfl2D38R9bwMYh2QUSnpXMOu
   eBBEINgxCT1Za3AS47Nk0973Zjqh4j/Jirw5MI4YqD38D1CEdAqLj7Cyf
   +ZGCs8FLJID0/qdqusJEInS6lco2IFiimoKyuLaB3Cbh5XZGaKHueh9nz
   t71s5aM27Nzv2Q20cbKDMFV3nOp4JjDN4Uzs8iHDKjbLD0ufKdnsdhLwS
   ewe7kcbAdYiXoVD+CiBPIunRfEMuPhNYp7i84aYKm2J8+lieol+CSvZL0
   Q==;
X-CSE-ConnectionGUID: 7baaLNHwQ02Uy2yy9l+aIg==
X-CSE-MsgGUID: A6vlyNxcT6SFO19/YgrYfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23176302"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="23176302"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 04:53:13 -0700
X-CSE-ConnectionGUID: sVjM5OwrSsG8ljVIytxmhA==
X-CSE-MsgGUID: XUzVO3eFRvqGGYKKLBZQVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="67352265"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Aug 2024 04:53:11 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjHEb-000Kuk-0T;
	Wed, 28 Aug 2024 11:53:09 +0000
Date: Wed, 28 Aug 2024 19:53:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, JangShui Yang <yangjiangshui@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 26961/30000]
 drivers/ub/urma/ubcore/ubcore_device.c:1329:5: warning: no previous
 prototype for function 'ubcore_dispatch_event'
Message-ID: <202408281931.u9ypTWBv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   cf3b556dcd03b687660affb4acd63c75beab067b
commit: f1753f8b17480bdb750cbd33fbaa358aef5dbb23 [26961/30000] urma: upload kernel patch for 20240219_Spring
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240828/202408281931.u9ypTWBv-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408281931.u9ypTWBv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408281931.u9ypTWBv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/urma/ubcore/ubcore_device.c:352:6: warning: no previous prototype for function 'ubcore_destroy_upi_list' [-Wmissing-prototypes]
     352 | void ubcore_destroy_upi_list(struct ubcore_device *dev)
         |      ^
   drivers/ub/urma/ubcore/ubcore_device.c:352:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     352 | void ubcore_destroy_upi_list(struct ubcore_device *dev)
         | ^
         | static 
   drivers/ub/urma/ubcore/ubcore_device.c:440:23: warning: no previous prototype for function 'ubcore_find_tpf_device_legacy' [-Wmissing-prototypes]
     440 | struct ubcore_device *ubcore_find_tpf_device_legacy(void)
         |                       ^
   drivers/ub/urma/ubcore/ubcore_device.c:440:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     440 | struct ubcore_device *ubcore_find_tpf_device_legacy(void)
         | ^
         | static 
>> drivers/ub/urma/ubcore/ubcore_device.c:1329:5: warning: no previous prototype for function 'ubcore_dispatch_event' [-Wmissing-prototypes]
    1329 | int ubcore_dispatch_event(struct ubcore_event *event)
         |     ^
   drivers/ub/urma/ubcore/ubcore_device.c:1329:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1329 | int ubcore_dispatch_event(struct ubcore_event *event)
         | ^
         | static 
   drivers/ub/urma/ubcore/ubcore_device.c:1454:6: warning: no previous prototype for function 'ubcore_dev_accessible' [-Wmissing-prototypes]
    1454 | bool ubcore_dev_accessible(struct ubcore_device *dev)
         |      ^
   drivers/ub/urma/ubcore/ubcore_device.c:1454:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1454 | bool ubcore_dev_accessible(struct ubcore_device *dev)
         | ^
         | static 
>> drivers/ub/urma/ubcore/ubcore_device.c:2015:6: warning: no previous prototype for function 'ubcore_net_exit' [-Wmissing-prototypes]
    2015 | void ubcore_net_exit(struct net *net)
         |      ^
   drivers/ub/urma/ubcore/ubcore_device.c:2015:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2015 | void ubcore_net_exit(struct net *net)
         | ^
         | static 
   5 warnings generated.
--
>> drivers/ub/urma/ubcore/ubcore_cdev_file.c:690:5: warning: no previous prototype for function 'ubcore_create_port_attr_files' [-Wmissing-prototypes]
     690 | int ubcore_create_port_attr_files(struct ubcore_logic_device *ldev,
         |     ^
   drivers/ub/urma/ubcore/ubcore_cdev_file.c:690:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     690 | int ubcore_create_port_attr_files(struct ubcore_logic_device *ldev,
         | ^
         | static 
   drivers/ub/urma/ubcore/ubcore_cdev_file.c:785:5: warning: no previous prototype for function 'ubcore_create_eid_attr_files' [-Wmissing-prototypes]
     785 | int ubcore_create_eid_attr_files(struct ubcore_logic_device *ldev, uint32_t eid_num)
         |     ^
   drivers/ub/urma/ubcore/ubcore_cdev_file.c:785:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     785 | int ubcore_create_eid_attr_files(struct ubcore_logic_device *ldev, uint32_t eid_num)
         | ^
         | static 
>> drivers/ub/urma/ubcore/ubcore_cdev_file.c:797:5: warning: no previous prototype for function 'ubcore_create_dev_attr_files' [-Wmissing-prototypes]
     797 | int ubcore_create_dev_attr_files(struct ubcore_logic_device *ldev)
         |     ^
   drivers/ub/urma/ubcore/ubcore_cdev_file.c:797:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     797 | int ubcore_create_dev_attr_files(struct ubcore_logic_device *ldev)
         | ^
         | static 
>> drivers/ub/urma/ubcore/ubcore_cdev_file.c:810:6: warning: no previous prototype for function 'ubcore_remove_port_attr_files' [-Wmissing-prototypes]
     810 | void ubcore_remove_port_attr_files(struct ubcore_logic_device *ldev, uint8_t port_id)
         |      ^
   drivers/ub/urma/ubcore/ubcore_cdev_file.c:810:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     810 | void ubcore_remove_port_attr_files(struct ubcore_logic_device *ldev, uint8_t port_id)
         | ^
         | static 
   drivers/ub/urma/ubcore/ubcore_cdev_file.c:815:6: warning: no previous prototype for function 'ubcore_remove_eid_attr_files' [-Wmissing-prototypes]
     815 | void ubcore_remove_eid_attr_files(struct ubcore_logic_device *ldev, uint32_t eid_num)
         |      ^
   drivers/ub/urma/ubcore/ubcore_cdev_file.c:815:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     815 | void ubcore_remove_eid_attr_files(struct ubcore_logic_device *ldev, uint32_t eid_num)
         | ^
         | static 
>> drivers/ub/urma/ubcore/ubcore_cdev_file.c:820:6: warning: no previous prototype for function 'ubcore_remove_dev_attr_files' [-Wmissing-prototypes]
     820 | void ubcore_remove_dev_attr_files(struct ubcore_logic_device *ldev)
         |      ^
   drivers/ub/urma/ubcore/ubcore_cdev_file.c:820:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     820 | void ubcore_remove_dev_attr_files(struct ubcore_logic_device *ldev)
         | ^
         | static 
   6 warnings generated.


vim +/ubcore_dispatch_event +1329 drivers/ub/urma/ubcore/ubcore_device.c

  1328	
> 1329	int ubcore_dispatch_event(struct ubcore_event *event)
  1330	{
  1331		struct ubcore_event_work *l_ubcore_event;
  1332	
  1333		l_ubcore_event = kzalloc(sizeof(*l_ubcore_event), GFP_ATOMIC);
  1334		if (!l_ubcore_event)
  1335			return -ENOMEM;
  1336	
  1337		INIT_WORK(&l_ubcore_event->work, ubcore_dispatch_event_task);
  1338		l_ubcore_event->event = *event;
  1339	
  1340		if (ubcore_queue_work((int)UBCORE_DISPATCH_EVENT_WQ, &l_ubcore_event->work) != 0) {
  1341			kfree(l_ubcore_event);
  1342			ubcore_log_err("Queue work failed");
  1343		}
  1344	
  1345		return 0;
  1346	}
  1347	
  1348	void ubcore_unregister_event_handler(struct ubcore_device *dev,
  1349					     struct ubcore_event_handler *handler)
  1350	{
  1351		if (dev == NULL || handler == NULL) {
  1352			ubcore_log_err("Invalid argument.\n");
  1353			return;
  1354		}
  1355	
  1356		down_write(&dev->event_handler_rwsem);
  1357		list_del(&handler->node);
  1358		up_write(&dev->event_handler_rwsem);
  1359	}
  1360	EXPORT_SYMBOL(ubcore_unregister_event_handler);
  1361	
  1362	static bool ubcore_preprocess_event(struct ubcore_event *event)
  1363	{
  1364		if (event->event_type == UBCORE_EVENT_TP_ERR && event->element.tp != NULL) {
  1365			ubcore_log_info("ubcore detect tp error event");
  1366			if (event->ub_dev->transport_type == UBCORE_TRANSPORT_IB) {
  1367				ubcore_restore_tp(event->ub_dev, event->element.tp);
  1368			} else if (event->ub_dev->transport_type == UBCORE_TRANSPORT_UB) {
  1369				if (event->element.tp->state == UBCORE_TP_STATE_ERR ||
  1370					event->element.tp->state == UBCORE_TP_STATE_RESET) {
  1371					ubcore_log_warn("Tp already in state %d, ignore err event",
  1372						(int32_t)event->element.tp->state);
  1373					return true;
  1374				}
  1375	
  1376				if (ubcore_change_tp_to_err(event->ub_dev, event->element.tp) != 0)
  1377					ubcore_log_info("ubcore change tp to error failed");
  1378			}
  1379			return true;
  1380		} else if (event->event_type == UBCORE_EVENT_TP_SUSPEND && event->element.tp != NULL) {
  1381			ubcore_log_info("ubcore detect tp suspend event");
  1382			ubcore_report_tp_suspend(event->ub_dev, event->element.tp);
  1383			return true;
  1384		} else if (event->event_type == UBCORE_EVENT_MIGRATE_VTP_SWITCH &&
  1385			event->element.vtp != NULL) {
  1386			ubcore_log_info("ubcore detect migrate vtp switch event");
  1387			ubcore_report_migrate_vtp(event->ub_dev, event->element.vtp,
  1388				UBCORE_EVENT_MIGRATE_VTP_SWITCH);
  1389			return true;
  1390		} else if (event->event_type == UBCORE_EVENT_MIGRATE_VTP_ROLLBACK &&
  1391			event->element.vtp != NULL) {
  1392			ubcore_log_info("ubcore detect migrate vtp rollback event");
  1393			ubcore_report_migrate_vtp(event->ub_dev, event->element.vtp,
  1394				UBCORE_EVENT_MIGRATE_VTP_ROLLBACK);
  1395			return true;
  1396		} else if (event->event_type == UBCORE_EVENT_TP_FLUSH_DONE &&
  1397			event->element.tp != NULL) {
  1398			ubcore_log_info("ubcore detect tp flush done event");
  1399			if (event->element.tp->state == UBCORE_TP_STATE_RESET) {
  1400				ubcore_log_warn("Tp already in state %d, ignore flush done event",
  1401					(int32_t)event->element.tp->state);
  1402				return true;
  1403			}
  1404			/* flush done means tp already in error,
  1405			 * and all pkt have been send need uvs to restore
  1406			 */
  1407			if (event->ub_dev->transport_type == UBCORE_TRANSPORT_UB)
  1408				ubcore_report_tp_error(event->ub_dev, event->element.tp);
  1409			return true;
  1410		}
  1411		return false;
  1412	}
  1413	
  1414	void ubcore_dispatch_async_event(struct ubcore_event *event)
  1415	{
  1416		if (event == NULL || event->ub_dev == NULL) {
  1417			ubcore_log_err("Invalid argument.\n");
  1418			return;
  1419		}
  1420	
  1421		if (ubcore_preprocess_event(event))
  1422			return;
  1423	
  1424		if (ubcore_dispatch_event(event) != 0)
  1425			ubcore_log_err("ubcore_dispatch_event failed");
  1426	}
  1427	EXPORT_SYMBOL(ubcore_dispatch_async_event);
  1428	
  1429	static bool ubcore_eid_accessible(struct ubcore_device *dev, uint32_t eid_index)
  1430	{
  1431		struct net *net;
  1432	
  1433		if (eid_index >= dev->eid_table.eid_cnt) {
  1434			ubcore_log_err("eid_indx: %u is over the up limit: %u",
  1435				eid_index, dev->eid_table.eid_cnt);
  1436			return false;
  1437		}
  1438	
  1439		spin_lock(&dev->eid_table.lock);
  1440		if (IS_ERR_OR_NULL(dev->eid_table.eid_entries)) {
  1441			spin_unlock(&dev->eid_table.lock);
  1442			return false;
  1443		}
  1444	
  1445		if (!dev->eid_table.eid_entries[eid_index].valid) {
  1446			spin_unlock(&dev->eid_table.lock);
  1447			return false;
  1448		}
  1449		net = dev->eid_table.eid_entries[eid_index].net;
  1450		spin_unlock(&dev->eid_table.lock);
  1451		return net_eq(net, current->nsproxy->net_ns);
  1452	}
  1453	
> 1454	bool ubcore_dev_accessible(struct ubcore_device *dev)
  1455	{
  1456		return (g_shared_ns || net_eq(current->nsproxy->net_ns, read_pnet(&dev->ldev.net)));
  1457	}
  1458	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
