Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CC51E5B77
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 07:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740383596; cv=none; b=Y/4e8Tcjc396QMh6WMh49IOLDdX5MFF73yyplt+dvZEQiaDMt9oMfu17Js1zbC2P/z6igdhutTgBH17AIUprQuLhMzeYWraNUIvDhOsxObz0qbQPaiVEQgRUd41oPz185DXxybDzo+0ajyNxOFFOGEBc8vsYLi9WUjlr2RJWcZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740383596; c=relaxed/simple;
	bh=z1fNM5dfdugiLgffcTcAE+/TKLemSqJVEyVbNwp1Zwc=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XjpzSjNUvwQFsm/tmUbbEJA0Sb5lKktYr5KVKz7u8oCH6WaMQv1Wv0uxOT4E3FB+vjB3y4Xnh4d0unwZpn2TdxN8W20ko27Pq4895P1HtJKJvMhuCsC1Abv095mdv7/AuI8UMhTf5ddj0jm5tgXIC0/6E54lh2GjCJBDaPcRCyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bkeb8BrK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkeb8BrK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740383594; x=1771919594;
  h=date:from:cc:subject:message-id:mime-version;
  bh=z1fNM5dfdugiLgffcTcAE+/TKLemSqJVEyVbNwp1Zwc=;
  b=bkeb8BrKaZTXGqKzF1tah04CQhig2R8StDeTxObuiaEydvBNDYJ08+i7
   ePJvactSoH1N0BXf0vnHsEciGPCmf1sxZeiIz/dO+ZlKo/7i0lIl8Lk4S
   spqgm1RqKsUNObJBcmfABEmSFS5IlCB5v+Uc91OkM1nVLNz2d4O8EuMMr
   LsLlgZ+M1flHApvV3hUrZ+z2SdevJrGSkYa5CNj7b43UWdh3ZfrEdk/kT
   petOj4vut+79Hcnw20ayrk5M+KXV0cazrL5mNLGl5aWNjJHASK15O0CTB
   pPRtm+Fasumbny5Cnp6hgnA7lHVflILh/47eYUUNNn6Pd8iioK0qBKjHX
   A==;
X-CSE-ConnectionGUID: RdF8ieh+RfS9yHThhWaE2Q==
X-CSE-MsgGUID: iIC2G0ZcQ1eb1lgWpFfGnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="58544436"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="58544436"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 23:53:13 -0800
X-CSE-ConnectionGUID: 9wLlaHDbQMKkw+sRNaQyUA==
X-CSE-MsgGUID: QThLOS9xSYqv8WZpbXzBWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121252780"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 23 Feb 2025 23:53:12 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmTH4-00080x-1i
	for oe-kbuild-all@lists.linux.dev;
	Mon, 24 Feb 2025 07:53:10 +0000
Date: Mon, 24 Feb 2025 15:52:45 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/69 1/1] drivers/nvme/host/rdma.c:1377:3: warning: this
 statement may fall through
Message-ID: <202502241506.tORz3XQ1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/69
head:   f36ea6678b4077d9bbb4644e73977fb91d187ab7
commit: abf87d5e9d57920c7ee1dacdf0929783a6a4c9af [1/1] nvme-rdma: rework rdma connection establishment error path
config: s390-randconfig-001-20250224 (https://download.01.org/0day-ci/archive/20250224/202502241506.tORz3XQ1-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250224/202502241506.tORz3XQ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502241506.tORz3XQ1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/nvme/host/rdma.c: In function 'nvme_rdma_cm_handler':
>> drivers/nvme/host/rdma.c:1377:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
      nvme_rdma_destroy_queue_ib(queue);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/rdma.c:1378:2: note: here
     case RDMA_CM_EVENT_ADDR_ERROR:
     ^~~~


vim +1377 drivers/nvme/host/rdma.c

  1347	
  1348	static int nvme_rdma_cm_handler(struct rdma_cm_id *cm_id,
  1349			struct rdma_cm_event *ev)
  1350	{
  1351		struct nvme_rdma_queue *queue = cm_id->context;
  1352		int cm_error = 0;
  1353	
  1354		dev_dbg(queue->ctrl->ctrl.device, "%s (%d): status %d id %p\n",
  1355			rdma_event_msg(ev->event), ev->event,
  1356			ev->status, cm_id);
  1357	
  1358		switch (ev->event) {
  1359		case RDMA_CM_EVENT_ADDR_RESOLVED:
  1360			cm_error = nvme_rdma_addr_resolved(queue);
  1361			break;
  1362		case RDMA_CM_EVENT_ROUTE_RESOLVED:
  1363			cm_error = nvme_rdma_route_resolved(queue);
  1364			break;
  1365		case RDMA_CM_EVENT_ESTABLISHED:
  1366			queue->cm_error = nvme_rdma_conn_established(queue);
  1367			/* complete cm_done regardless of success/failure */
  1368			complete(&queue->cm_done);
  1369			return 0;
  1370		case RDMA_CM_EVENT_REJECTED:
  1371			nvme_rdma_destroy_queue_ib(queue);
  1372			cm_error = nvme_rdma_conn_rejected(queue, ev);
  1373			break;
  1374		case RDMA_CM_EVENT_ROUTE_ERROR:
  1375		case RDMA_CM_EVENT_CONNECT_ERROR:
  1376		case RDMA_CM_EVENT_UNREACHABLE:
> 1377			nvme_rdma_destroy_queue_ib(queue);
  1378		case RDMA_CM_EVENT_ADDR_ERROR:
  1379			dev_dbg(queue->ctrl->ctrl.device,
  1380				"CM error event %d\n", ev->event);
  1381			cm_error = -ECONNRESET;
  1382			break;
  1383		case RDMA_CM_EVENT_DISCONNECTED:
  1384		case RDMA_CM_EVENT_ADDR_CHANGE:
  1385		case RDMA_CM_EVENT_TIMEWAIT_EXIT:
  1386			dev_dbg(queue->ctrl->ctrl.device,
  1387				"disconnect received - connection closed\n");
  1388			nvme_rdma_error_recovery(queue->ctrl);
  1389			break;
  1390		case RDMA_CM_EVENT_DEVICE_REMOVAL:
  1391			/* device removal is handled via the ib_client API */
  1392			break;
  1393		default:
  1394			dev_err(queue->ctrl->ctrl.device,
  1395				"Unexpected RDMA CM event (%d)\n", ev->event);
  1396			nvme_rdma_error_recovery(queue->ctrl);
  1397			break;
  1398		}
  1399	
  1400		if (cm_error) {
  1401			queue->cm_error = cm_error;
  1402			complete(&queue->cm_done);
  1403		}
  1404	
  1405		return 0;
  1406	}
  1407	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
