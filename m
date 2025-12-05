Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB9B18DB1E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 11:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764933167; cv=none; b=dxPMO6hzTo4Xm6mrjFplEgbviWmfKvZUhwXbWQEjQjBlrmLXBZLYBrOHKj0jaiFyqjgPiLqZaZq5kJr0g81Vy8FZ8dzlc35pU2x7wTmDeUf3e8SBMz8+tgEyaJsibSDiH+GyGStADFTqJwzpApgHnIuV2GaT3mX31JdKoPglybk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764933167; c=relaxed/simple;
	bh=EZfWHrN/L9KuL0UdPR79cZSglSHestMFGpIqy2Ncl3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qFHDGaK8hzHlbdDlcn5TBfCBBTZFVUU9UqPLKRFql7URcr3VPxY8jmPxmrkS03cnlrerzw9eiZmOLfq1QGVj/erftZCMMpXxaayKLY76K8sJD70mEVmV78eThSod35IzAU478E0mkBc1XRixEFIV3YWcq3KJnWb6UtRqnrU4b+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G1wVGQ5B; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G1wVGQ5B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764933164; x=1796469164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EZfWHrN/L9KuL0UdPR79cZSglSHestMFGpIqy2Ncl3I=;
  b=G1wVGQ5BKtdhSXm3UPW38MOpABw61frdTy5yOnk6yrL222/sYxTwlItj
   pR3cCeiXbkmNNWl9/YPT9eq66dNpxBX1cucok0/d8YfIv3qR6iCAJ8C6F
   whMPS/6J9KpzKpM7GBmOjYquLZ1/UEQ1m16IEcjyTwieW3x+TlDdB2Wz9
   fAUOH0HwnjTCqm08r62/Nw58iybqxDrYKAoEC1V3pLGB2FcmmZU1nOdUE
   KOBCw1I707mkxbd80oQwsHg0zhGQ/2ZwPzqTj6hHhnY8uPhraUpmtArWy
   w6/6nS/yBQEjBUotp5Pin59stSCfUFyGuUnvdhZcbKbJTwVoaX5rZ+Rwv
   w==;
X-CSE-ConnectionGUID: SPpZM/HWRl+Jws5QmcPEKQ==
X-CSE-MsgGUID: IW3xXwXUSWWEUuTgj3Ap8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66860283"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="66860283"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 03:12:43 -0800
X-CSE-ConnectionGUID: pA4ewmxHS66QvxVQDz3EWw==
X-CSE-MsgGUID: irlfK72TRNya7N16m8xHwg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Dec 2025 03:12:41 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRTjr-00000000Euj-1pAn;
	Fri, 05 Dec 2025 11:12:39 +0000
Date: Fri, 5 Dec 2025 19:12:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Guo <guoyongqiang12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3479/3479]
 drivers/ub/urma/ubcore/ubcore_device.c:1101:6: warning: no previous
 prototype for 'ubcore_stop_requests'
Message-ID: <202512051906.P1qE1lcs-lkp@intel.com>
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
commit: 4023540b983eda09c4397401ac6a5a037d17a9c0 [3479/3479] ubcore: implement support for UVS commands
config: arm64-randconfig-r061-20251205 (https://download.01.org/0day-ci/archive/20251205/202512051906.P1qE1lcs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051906.P1qE1lcs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512051906.P1qE1lcs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/urma/ubcore/ubcore_device.c:994:5: warning: no previous prototype for 'ubcore_register_device' [-Wmissing-prototypes]
     994 | int ubcore_register_device(struct ubcore_device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:1061:6: warning: no previous prototype for 'ubcore_unregister_device' [-Wmissing-prototypes]
    1061 | void ubcore_unregister_device(struct ubcore_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_device.c:1101:6: warning: no previous prototype for 'ubcore_stop_requests' [-Wmissing-prototypes]
    1101 | void ubcore_stop_requests(struct ubcore_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:1154:5: warning: no previous prototype for 'ubcore_dispatch_event' [-Wmissing-prototypes]
    1154 | int ubcore_dispatch_event(struct ubcore_event *event)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_device.c:1228:6: warning: no previous prototype for 'ubcore_dispatch_async_event' [-Wmissing-prototypes]
    1228 | void ubcore_dispatch_async_event(struct ubcore_event *event)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_device.c:1663:25: warning: no previous prototype for 'ubcore_get_eid_list' [-Wmissing-prototypes]
    1663 | struct ubcore_eid_info *ubcore_get_eid_list(struct ubcore_device *dev,
         |                         ^~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_device.c:1715:6: warning: no previous prototype for 'ubcore_free_eid_list' [-Wmissing-prototypes]
    1715 | void ubcore_free_eid_list(struct ubcore_eid_info *eid_list)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:1853:6: warning: no previous prototype for 'ubcore_net_exit' [-Wmissing-prototypes]
    1853 | void ubcore_net_exit(struct net *net)
         |      ^~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_device.c:1954:6: warning: no previous prototype for 'ubcore_dispatch_mgmt_event' [-Wmissing-prototypes]
    1954 | void ubcore_dispatch_mgmt_event(struct ubcore_mgmt_event *event)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c: In function 'init_ubcore_device':
   drivers/ub/urma/ubcore/ubcore_device.c:375:35: warning: array subscript 4 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     375 |      cap->max_tp_cnt < g_ht_params[UBCORE_HT_TP].size)
         |                        ~~~~~~~~~~~^~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:316:31: note: while referencing 'g_ht_params'
     316 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:376:14: warning: array subscript 4 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     376 |   g_ht_params[UBCORE_HT_TP].size = cap->max_tp_cnt;
         |   ~~~~~~~~~~~^~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:316:31: note: while referencing 'g_ht_params'
     316 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:378:36: warning: array subscript 5 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     378 |      cap->max_tpg_cnt < g_ht_params[UBCORE_HT_TPG].size)
         |                         ~~~~~~~~~~~^~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:316:31: note: while referencing 'g_ht_params'
     316 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:379:14: warning: array subscript 5 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     379 |   g_ht_params[UBCORE_HT_TPG].size = cap->max_tpg_cnt;
         |   ~~~~~~~~~~~^~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:316:31: note: while referencing 'g_ht_params'
     316 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:347:13: warning: array subscript 6 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     347 |  g_ht_params[UBCORE_HT_RM_VTP].size = vtp_size;
         |  ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:316:31: note: while referencing 'g_ht_params'
     316 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:348:13: warning: array subscript 7 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     348 |  g_ht_params[UBCORE_HT_RC_VTP].size = vtp_size;
         |  ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:316:31: note: while referencing 'g_ht_params'
     316 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:349:13: warning: array subscript 8 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     349 |  g_ht_params[UBCORE_HT_UM_VTP].size = vtp_size;
         |  ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:316:31: note: while referencing 'g_ht_params'
     316 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:356:13: warning: array subscript 9 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     356 |  g_ht_params[UBCORE_HT_RM_VTPN].size = vtpn_size;
         |  ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:316:31: note: while referencing 'g_ht_params'
     316 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:357:13: warning: array subscript 10 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     357 |  g_ht_params[UBCORE_HT_RC_VTPN].size = vtpn_size;
         |  ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:316:31: note: while referencing 'g_ht_params'
     316 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:358:13: warning: array subscript 11 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     358 |  g_ht_params[UBCORE_HT_UM_VTPN].size = vtpn_size;
         |  ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:316:31: note: while referencing 'g_ht_params'
     316 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:359:13: warning: array subscript 12 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     359 |  g_ht_params[UBCORE_HT_CP_VTPN].size = vtpn_size;
         |  ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:316:31: note: while referencing 'g_ht_params'
     316 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:360:13: warning: array subscript 14 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     360 |  g_ht_params[UBCORE_HT_VTPN].size = vtpn_size;
         |  ~~~~~~~~~~~^~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:316:31: note: while referencing 'g_ht_params'
     316 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:387:36: warning: array subscript 13 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     387 |      cap->max_utp_cnt < g_ht_params[UBCORE_HT_UTP].size)
         |                         ~~~~~~~~~~~^~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:316:31: note: while referencing 'g_ht_params'
     316 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:388:14: warning: array subscript 13 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     388 |   g_ht_params[UBCORE_HT_UTP].size = cap->max_utp_cnt;
         |   ~~~~~~~~~~~^~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:316:31: note: while referencing 'g_ht_params'
     316 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:391:35: warning: array subscript 15 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     391 |      cap->max_tp_cnt < g_ht_params[UBCORE_HT_CTP].size)
         |                        ~~~~~~~~~~~^~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:316:31: note: while referencing 'g_ht_params'
     316 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:392:14: warning: array subscript 15 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     392 |   g_ht_params[UBCORE_HT_CTP].size = cap->max_tp_cnt;
         |   ~~~~~~~~~~~^~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:316:31: note: while referencing 'g_ht_params'
     316 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
--
>> drivers/ub/urma/ubcore/ubcore_cmd_tlv.c:228:5: warning: no previous prototype for 'ubcore_tlv_parse' [-Wmissing-prototypes]
     228 | int ubcore_tlv_parse(ubcore_fill_spec_func fill_spec, size_t spec_size,
         |     ^~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_cmd_tlv.c:262:5: warning: no previous prototype for 'ubcore_tlv_append' [-Wmissing-prototypes]
     262 | int ubcore_tlv_append(ubcore_fill_spec_func fill_spec, size_t spec_size,
         |     ^~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +/ubcore_stop_requests +1101 drivers/ub/urma/ubcore/ubcore_device.c

  1100	
> 1101	void ubcore_stop_requests(struct ubcore_device *dev)
  1102	{
  1103		struct ubcore_client_ctx *ctx, *tmp;
  1104	
  1105		if (dev == NULL || strnlen(dev->dev_name, UBCORE_MAX_DEV_NAME) >=
  1106					   UBCORE_MAX_DEV_NAME) {
  1107			ubcore_log_err("Invalid parameter");
  1108			return;
  1109		}
  1110		down_read(&dev->client_ctx_rwsem);
  1111		list_for_each_entry_safe(ctx, tmp, &dev->client_ctx_list, list_node) {
  1112			if (ctx->client && ctx->client->stop)
  1113				ctx->client->stop(dev, ctx->data);
  1114		}
  1115		up_read(&dev->client_ctx_rwsem);
  1116		ubcore_log_info("ubcore device: %s stop success.\n", dev->dev_name);
  1117	}
  1118	EXPORT_SYMBOL(ubcore_stop_requests);
  1119	
  1120	void ubcore_register_event_handler(struct ubcore_device *dev,
  1121					   struct ubcore_event_handler *handler)
  1122	{
  1123		if (dev == NULL || handler == NULL) {
  1124			ubcore_log_err("Invalid argument.\n");
  1125			return;
  1126		}
  1127	
  1128		down_write(&dev->event_handler_rwsem);
  1129		list_add_tail(&handler->node, &dev->event_handler_list);
  1130		up_write(&dev->event_handler_rwsem);
  1131	}
  1132	EXPORT_SYMBOL(ubcore_register_event_handler);
  1133	
  1134	static void ubcore_dispatch_event_clients(struct ubcore_event *event)
  1135	{
  1136		struct ubcore_event_handler *handler;
  1137		struct ubcore_device *dev = event->ub_dev;
  1138	
  1139		down_read(&dev->event_handler_rwsem);
  1140		list_for_each_entry(handler, &dev->event_handler_list, node)
  1141			handler->event_callback(event, handler);
  1142		up_read(&dev->event_handler_rwsem);
  1143	}
  1144	
  1145	static void ubcore_dispatch_event_task(struct work_struct *work)
  1146	{
  1147		struct ubcore_event_work *l_ubcore_event =
  1148			container_of(work, struct ubcore_event_work, work);
  1149	
  1150		ubcore_dispatch_event_clients(&l_ubcore_event->event);
  1151		kfree(l_ubcore_event);
  1152	}
  1153	
  1154	int ubcore_dispatch_event(struct ubcore_event *event)
  1155	{
  1156		struct ubcore_event_work *l_ubcore_event;
  1157	
  1158		l_ubcore_event = kzalloc(sizeof(*l_ubcore_event), GFP_ATOMIC);
  1159		if (!l_ubcore_event)
  1160			return -ENOMEM;
  1161	
  1162		INIT_WORK(&l_ubcore_event->work, ubcore_dispatch_event_task);
  1163		l_ubcore_event->event = *event;
  1164	
  1165		if (ubcore_queue_work((int)UBCORE_DISPATCH_EVENT_WQ,
  1166				      &l_ubcore_event->work) != 0) {
  1167			kfree(l_ubcore_event);
  1168			ubcore_log_err("Queue work failed");
  1169		}
  1170	
  1171		return 0;
  1172	}
  1173	
  1174	void ubcore_unregister_event_handler(struct ubcore_device *dev,
  1175					     struct ubcore_event_handler *handler)
  1176	{
  1177		if (dev == NULL || handler == NULL) {
  1178			ubcore_log_err("Invalid argument.\n");
  1179			return;
  1180		}
  1181	
  1182		down_write(&dev->event_handler_rwsem);
  1183		list_del(&handler->node);
  1184		up_write(&dev->event_handler_rwsem);
  1185	}
  1186	EXPORT_SYMBOL(ubcore_unregister_event_handler);
  1187	
  1188	static bool ubcore_preprocess_event(struct ubcore_event *event)
  1189	{
  1190		if (event->event_type == UBCORE_EVENT_TP_ERR &&
  1191		    event->element.tp != NULL) {
  1192			ubcore_log_info("ubcore detect tp error event with tpn %u",
  1193					event->element.tp->tpn);
  1194			if (event->ub_dev->transport_type == UBCORE_TRANSPORT_UB) {
  1195				if (event->element.tp->state == UBCORE_TP_STATE_ERR ||
  1196				    event->element.tp->state == UBCORE_TP_STATE_RESET) {
  1197					ubcore_log_warn(
  1198						"Tp %u already in state %d, ignore err event",
  1199						event->element.tp->tpn,
  1200						(int32_t)event->element.tp->state);
  1201					return true;
  1202				}
  1203			}
  1204			return true;
  1205		} else if (event->event_type == UBCORE_EVENT_TP_FLUSH_DONE &&
  1206			   event->element.tp != NULL) {
  1207			/* Scenarios of flush done
  1208			 * 1. tp err: ubcore informs lower layer change tp to ERR when tp err.
  1209			 * It triggers udma to flush after udma change tp to ERR.
  1210			 * udma reports flush done event after flush done.
  1211			 * 2. qpc err: udma senses qpc err, flushes and reports flush done event.
  1212			 * tp has not been changed to ERR in this case.
  1213			 * ubcore needs to change tp to ERR before change it to RESET.
  1214			 */
  1215			ubcore_log_info("ubcore detect tp %u flush done event",
  1216					event->element.tp->tpn);
  1217			if (event->element.tp->state == UBCORE_TP_STATE_RESET) {
  1218				ubcore_log_warn(
  1219					"Tp %u already in state %d, ignore flush done event",
  1220					event->element.tp->tpn,
  1221					(int32_t)event->element.tp->state);
  1222				return true;
  1223			}
  1224		}
  1225		return false;
  1226	}
  1227	
> 1228	void ubcore_dispatch_async_event(struct ubcore_event *event)
  1229	{
  1230		if (event == NULL || event->ub_dev == NULL) {
  1231			ubcore_log_err("Invalid argument.\n");
  1232			return;
  1233		}
  1234	
  1235		if (ubcore_preprocess_event(event))
  1236			return;
  1237	
  1238		if (ubcore_dispatch_event(event) != 0)
  1239			ubcore_log_err("ubcore_dispatch_event failed");
  1240	}
  1241	EXPORT_SYMBOL(ubcore_dispatch_async_event);
  1242	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
