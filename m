Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA1E10A12
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 12:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ez6hfqc3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700398040; x=1731934040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uzlTuKd21t7sMxeiDuStSgCvI85mVQtd2+rBd9jAUf0=;
  b=Ez6hfqc30HRafA1yBHnE2vlBfj8uo+2jxq8IWoZ7q73WZpg9KAeEu2/o
   B3UfSVRpZSkU2npEbUQuX5xEdMgS5Dnodd2gWM+/tW7esFIGW2WepVpJw
   CbFR4b593uX48pCCZsKcP6sqMXjA75DPbzaekIbFGazNIhzzUYyYRDYvu
   S4ZbfO5zbiwCVMtSoPlkdHzP0ebVgBKEG46PXQUDBCXZqCFHxWGUzzEhl
   1HTKW1MCwELVMuQ15zRx4xraSLwbqevK/MRkthDzPqnoE6mAXCxnvLWEt
   7UiDmNk9in0xpWVQKSdEF+OKQemwDQptBqngEA2WjhNZPFOaW40y2GVF+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="422582900"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="422582900"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 04:47:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="795224076"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="795224076"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 19 Nov 2023 04:47:17 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4hCk-00056Z-36;
	Sun, 19 Nov 2023 12:47:14 +0000
Date: Sun, 19 Nov 2023 20:46:57 +0800
From: kernel test robot <lkp@intel.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>, Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-linux-6.1.y-wip 6/10]
 drivers/net/ethernet/ti/cpsw-proxy-client.c:436:13: warning: variable
 'response_status' set but not used
Message-ID: <202311192041.0XB36bvR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.1.y-wip
head:   da9bbd5b8e9256096f5e068401df1bd53cc2e897
commit: 9343810f28a1291f0276af43af820220abae9dcd [6/10] net: ethernet: ti: Add CPSW Proxy Client driver
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231119/202311192041.0XB36bvR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311192041.0XB36bvR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311192041.0XB36bvR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/ti/cpsw-proxy-client.c: In function 'cpsw_proxy_client_cb':
>> drivers/net/ethernet/ti/cpsw-proxy-client.c:436:13: warning: variable 'response_status' set but not used [-Wunused-but-set-variable]
     436 |         int response_status, ret = 0;
         |             ^~~~~~~~~~~~~~~


vim +/response_status +436 drivers/net/ethernet/ti/cpsw-proxy-client.c

   424	
   425	static int cpsw_proxy_client_cb(struct rpmsg_device *rpdev, void *data,
   426					int len, void *priv, u32 src)
   427	{
   428		struct cpsw_proxy_common *common = dev_get_drvdata(&rpdev->dev);
   429		struct response_message_header *response_msg_hdr;
   430		struct notify_message_header *notify_msg_hdr;
   431		struct message *msg = (struct message *)data;
   432		struct task_struct *server_notify_handler;
   433		u32 msg_type = msg->msg_hdr.msg_type;
   434		u32 notify_type, response_id, token;
   435		struct cpsw_virt_port *virt_port;
 > 436		int response_status, ret = 0;
   437	
   438		switch (msg_type) {
   439		case ETHREMOTECFG_MSG_NOTIFY:
   440			notify_msg_hdr = (struct notify_message_header *)msg;
   441			notify_type = notify_msg_hdr->notify_type;
   442			token = notify_msg_hdr->msg_hdr.token;
   443	
   444			switch (notify_type) {
   445			case ETHREMOTECFG_NOTIFYTYPE_HWERROR:
   446				common->in_recovery = 1;
   447				virt_port = get_virt_port_from_token(common, token);
   448				if (!virt_port) {
   449					dev_err(common->dev, "invalid notification received\n");
   450					return -EINVAL;
   451				}
   452	
   453				server_notify_handler =
   454						kthread_run(&cpsw_proxy_client_server_error_notify_handler,
   455							    virt_port, "hwerr_handler");
   456	
   457				if (IS_ERR(server_notify_handler))
   458					ret = PTR_ERR(server_notify_handler);
   459				break;
   460	
   461			case ETHREMOTECFG_NOTIFYTYPE_HWRECOVERY_COMPLETE:
   462				common->error_handled = 0;
   463				virt_port = get_virt_port_from_token(common, token);
   464				if (!virt_port) {
   465					dev_err(common->dev, "invalid notification received\n");
   466					return -EINVAL;
   467				}
   468	
   469				server_notify_handler =
   470					kthread_run(&cpsw_proxy_client_server_recovery_notify_handler,
   471						    virt_port, "recovery_handler");
   472	
   473				if (IS_ERR(server_notify_handler))
   474					ret = PTR_ERR(server_notify_handler);
   475				break;
   476	
   477			default:
   478				break;
   479			}
   480	
   481			break;
   482	
   483		case ETHREMOTECFG_MSG_RESPONSE:
   484			response_msg_hdr = (struct response_message_header *)msg;
   485			response_id = response_msg_hdr->response_id;
   486			response_status = response_msg_hdr->response_status;
   487	
   488			if (response_id == common->request_id - 1) {
   489				dev_info(common->dev, "ignoring delayed response for request: %u\n",
   490					 response_id);
   491				return 0;
   492			}
   493	
   494			if (response_id != common->request_id) {
   495				dev_err(common->dev, "expected response id: %u but received %u\n",
   496					common->request_id, response_id);
   497				return -EINVAL;
   498			}
   499	
   500			memcpy(&common->recv_msg, msg, len);
   501			common->recv_msg_len = len;
   502			complete(&common->wait_for_response);
   503			break;
   504	
   505		default:
   506			dev_err(common->dev, "invalid message received\n");
   507			return -EOPNOTSUPP;
   508		}
   509	
   510		return ret;
   511	}
   512	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
