Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DD82163BD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 20:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754339318; cv=none; b=jvLd7xEiTYfpLWZGIYT7VCLLHv/9eGPcZOIlBGBRuty2xeYBzLlKXnBjMU7qpi1berUSgHECAhAVDP5TuwCfZumG7MFeFrpnPB1FiTMiOfU4mcsNhpg+kDu+QRgZ27b5s2XlVxeUK7dZxwjAdUHQZvjagmyV1ZaGMx6kLCeN0rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754339318; c=relaxed/simple;
	bh=IZzL1P2tdxAHWa5DqZ00FLaf5leD/ZHR+G750USlPNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k6rUBZ4cdYx9B7d2sfdOYuFf3Cjd8sM/WaCxZPWSrMSFudDbHkMXnI5vHXbrak3K2VvRr68GCx826q8zHZkUqfhwVRV4fY5wQPBPyHWTNtaHN79QEO8LIq6pBCoBjMAA3FGyqcDge0o4TPo1MBKng1EeuLzB0bnkPRVRgX3wZDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GyDva0WP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GyDva0WP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754339317; x=1785875317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IZzL1P2tdxAHWa5DqZ00FLaf5leD/ZHR+G750USlPNM=;
  b=GyDva0WPbO4T2PX+3a+tbS/QYfWkxXnN5E/fvt0XI3P6O+/8m4U5mmzO
   Ksg/tu49+PuyZuCQ6oLQXOqSiefJRgu9x9F8lolbi+4ltA/mAiCf0oTS3
   fY6Sq6lKJHA04Rb5BVsHwnA2jqukMQVTqq/FpMo1ZGa5j3VszPytum/XI
   8f/1MeAUu46boI9l/I/u+v2wLt1HsS5zRvJLV4sIc7urpthUuIwruLmHa
   5RRFubCTHYtbgdI0HMucBsprAvAQyzpuROre0ZLyhPEldgJ+UvcvYAWtt
   vsBOtYlytTTRzhaE/a9I9waEJD5UTLuUa2BQ5KS0O/ygJTabMkQeILrJh
   A==;
X-CSE-ConnectionGUID: HXuMRZ11THiXFMGE7eykwg==
X-CSE-MsgGUID: vpeFa297SxitIw3LcY+bsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56755397"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="56755397"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 13:28:37 -0700
X-CSE-ConnectionGUID: ADFyeaolS4enYUYhzJzNvA==
X-CSE-MsgGUID: v5K/K1WHT2W+/8oV7t0U2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="164182028"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 04 Aug 2025 13:28:35 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uj1nM-0001qT-2x;
	Mon, 04 Aug 2025 20:28:32 +0000
Date: Mon, 4 Aug 2025 22:28:02 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1743/1743]
 drivers/nvme/host/pci.c:1174:26: warning: this statement may fall through
Message-ID: <202508042248.qt1mRSJK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ba07135cf74b1424e2f7f0c60e59c5b206ab320c
commit: 699b7dcfd1ed2f3b930ad3c4712ac9d685591e4a [1743/1743] nvme-pci: shutdown on timeout during deletion
config: x86_64-buildonly-randconfig-2004-20250802 (https://download.01.org/0day-ci/archive/20250804/202508042248.qt1mRSJK-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508042248.qt1mRSJK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508042248.qt1mRSJK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/nvme/host/pci.c:25:
   include/linux/module.h:140:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'nvme_exit': 'cold' [-Wmissing-attributes]
     140 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   drivers/nvme/host/pci.c:2768:1: note: in expansion of macro 'module_exit'
    2768 | module_exit(nvme_exit);
         | ^~~~~~~~~~~
   drivers/nvme/host/pci.c:2757:20: note: 'cleanup_module' target declared here
    2757 | static void __exit nvme_exit(void)
         |                    ^~~~~~~~~
   In file included from drivers/nvme/host/pci.c:25:
   include/linux/module.h:134:13: warning: 'init_module' specifies less restrictive attribute than its target 'nvme_init': 'cold' [-Wmissing-attributes]
     134 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   drivers/nvme/host/pci.c:2767:1: note: in expansion of macro 'module_init'
    2767 | module_init(nvme_init);
         | ^~~~~~~~~~~
   drivers/nvme/host/pci.c:2752:19: note: 'init_module' target declared here
    2752 | static int __init nvme_init(void)
         |                   ^~~~~~~~~
   drivers/nvme/host/pci.c: In function 'nvme_timeout':
>> drivers/nvme/host/pci.c:1174:26: warning: this statement may fall through [-Wimplicit-fallthrough=]
    1174 |                 shutdown = true;
         |                 ~~~~~~~~~^~~~~~
   drivers/nvme/host/pci.c:1175:9: note: here
    1175 |         case NVME_CTRL_CONNECTING:
         |         ^~~~
   drivers/nvme/host/pci.c:1261: warning: Function parameter or member 'nvmeq' not described in 'nvme_suspend_queue'


vim +1174 drivers/nvme/host/pci.c

  1128	
  1129	static enum blk_eh_timer_return nvme_timeout(struct request *req, bool reserved)
  1130	{
  1131		struct nvme_iod *iod = blk_mq_rq_to_pdu(req);
  1132		struct nvme_queue *nvmeq = iod->nvmeq;
  1133		struct nvme_dev *dev = nvmeq->dev;
  1134		struct request *abort_req;
  1135		struct nvme_command cmd;
  1136		bool shutdown = false;
  1137		u32 csts = readl(dev->bar + NVME_REG_CSTS);
  1138	
  1139		/* If PCI error recovery process is happening, we cannot reset or
  1140		 * the recovery mechanism will surely fail.
  1141		 */
  1142		mb();
  1143		if (pci_channel_offline(to_pci_dev(dev->dev)))
  1144			return BLK_EH_RESET_TIMER;
  1145	
  1146		/*
  1147		 * Reset immediately if the controller is failed
  1148		 */
  1149		if (nvme_should_reset(dev, csts)) {
  1150			nvme_warn_reset(dev, csts);
  1151			nvme_dev_disable(dev, false);
  1152			nvme_reset_ctrl(&dev->ctrl);
  1153			return BLK_EH_DONE;
  1154		}
  1155	
  1156		/*
  1157		 * Did we miss an interrupt?
  1158		 */
  1159		if (__nvme_poll(nvmeq, req->tag)) {
  1160			dev_warn(dev->ctrl.device,
  1161				 "I/O %d QID %d timeout, completion polled\n",
  1162				 req->tag, nvmeq->qid);
  1163			return BLK_EH_DONE;
  1164		}
  1165	
  1166		/*
  1167		 * Shutdown immediately if controller times out while starting. The
  1168		 * reset work will see the pci device disabled when it gets the forced
  1169		 * cancellation error. All outstanding requests are completed on
  1170		 * shutdown, so we return BLK_EH_DONE.
  1171		 */
  1172		switch (dev->ctrl.state) {
  1173		case NVME_CTRL_DELETING:
> 1174			shutdown = true;
  1175		case NVME_CTRL_CONNECTING:
  1176		case NVME_CTRL_RESETTING:
  1177			dev_warn_ratelimited(dev->ctrl.device,
  1178				 "I/O %d QID %d timeout, disable controller\n",
  1179				 req->tag, nvmeq->qid);
  1180			nvme_dev_disable(dev, shutdown);
  1181			nvme_req(req)->flags |= NVME_REQ_CANCELLED;
  1182			return BLK_EH_DONE;
  1183		default:
  1184			break;
  1185		}
  1186	
  1187		/*
  1188	 	 * Shutdown the controller immediately and schedule a reset if the
  1189	 	 * command was already aborted once before and still hasn't been
  1190	 	 * returned to the driver, or if this is the admin queue.
  1191		 */
  1192		if (!nvmeq->qid || iod->aborted) {
  1193			dev_warn(dev->ctrl.device,
  1194				 "I/O %d QID %d timeout, reset controller\n",
  1195				 req->tag, nvmeq->qid);
  1196			nvme_dev_disable(dev, false);
  1197			nvme_reset_ctrl(&dev->ctrl);
  1198	
  1199			nvme_req(req)->flags |= NVME_REQ_CANCELLED;
  1200			return BLK_EH_DONE;
  1201		}
  1202	
  1203		if (atomic_dec_return(&dev->ctrl.abort_limit) < 0) {
  1204			atomic_inc(&dev->ctrl.abort_limit);
  1205			return BLK_EH_RESET_TIMER;
  1206		}
  1207		iod->aborted = 1;
  1208	
  1209		memset(&cmd, 0, sizeof(cmd));
  1210		cmd.abort.opcode = nvme_admin_abort_cmd;
  1211		cmd.abort.cid = req->tag;
  1212		cmd.abort.sqid = cpu_to_le16(nvmeq->qid);
  1213	
  1214		dev_warn(nvmeq->dev->ctrl.device,
  1215			"I/O %d QID %d timeout, aborting\n",
  1216			 req->tag, nvmeq->qid);
  1217	
  1218		abort_req = nvme_alloc_request(dev->ctrl.admin_q, &cmd,
  1219				BLK_MQ_REQ_NOWAIT, NVME_QID_ANY);
  1220		if (IS_ERR(abort_req)) {
  1221			atomic_inc(&dev->ctrl.abort_limit);
  1222			return BLK_EH_RESET_TIMER;
  1223		}
  1224	
  1225		abort_req->timeout = ADMIN_TIMEOUT;
  1226		abort_req->end_io_data = NULL;
  1227		blk_execute_rq_nowait(abort_req->q, NULL, abort_req, 0, abort_endio);
  1228	
  1229		/*
  1230		 * The aborted req will be completed on receiving the abort req.
  1231		 * We enable the timer again. If hit twice, it'll cause a device reset,
  1232		 * as the device then is in a faulty state.
  1233		 */
  1234		return BLK_EH_RESET_TIMER;
  1235	}
  1236	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
