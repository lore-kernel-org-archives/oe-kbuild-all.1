Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EB112B8E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 11:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692271927; x=1723807927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8ldCf/GhcC35kMUaDggHwmhy8XZAlBqMEKna+HAfhRs=;
  b=GL+4Cdor+1A3w9dKeVbkeVcj8GXC46LR9P9aPupfk/yAjsluU1BP64ZE
   49z9Iw0r2cgo9W7Sr7CVAK0oGD0x2rxyUppg0nTlScZhQuQmey6Mq4D+l
   al9MI5B1LyPn9Wd7VqTbZ52oZYvOo8ZLCz++fWjXGrNJDZ0TnYE0VLYJN
   D2oiN/d1eoPtqfZDYZY+u+TZotYCQJhn9J2zjGv/t0aLmr3SSeSkN7QKw
   YOEu1agoETRON/V7cXyZ5B2iY4EKJtsYcmLYucllrXiX+vJ6yPNIyzUF9
   goeS7B17PLzOw/TcoxMFnbkPMBx6MZzDnPqFdXbsdDE34k1M9GO/k3fJd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="459140009"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="459140009"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 04:31:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="908374590"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="908374590"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Aug 2023 04:31:46 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWbE9-00015X-1q;
	Thu, 17 Aug 2023 11:31:45 +0000
Date: Thu, 17 Aug 2023 19:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: Luo bin <luobin9@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [stable:linux-4.19.y 1121/9999]
 drivers/net/ethernet/huawei/hinic/hinic_hw_mgmt.c:253: warning: Function
 parameter or member 'timeout' not described in 'msg_to_mgmt_sync'
Message-ID: <202308171909.1n7ER8lr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   4e5e7fa94ee0ff378b268679d51feb1fd2a04756
commit: 2afbedce318458d6eed6f0cf6cf0857215f3c3af [1121/9999] hinic: fix a bug of ndo_stop
config: x86_64-randconfig-x002-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171909.1n7ER8lr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171909.1n7ER8lr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171909.1n7ER8lr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/huawei/hinic/hinic_hw_mgmt.c:253: warning: Function parameter or member 'timeout' not described in 'msg_to_mgmt_sync'


vim +253 drivers/net/ethernet/huawei/hinic/hinic_hw_mgmt.c

6dd8b68214f4af Aviad Krawczyk 2017-08-21  232  
6dd8b68214f4af Aviad Krawczyk 2017-08-21  233  /**
6dd8b68214f4af Aviad Krawczyk 2017-08-21  234   * msg_to_mgmt_sync - send sync message to mgmt
6dd8b68214f4af Aviad Krawczyk 2017-08-21  235   * @pf_to_mgmt: PF to MGMT channel
6dd8b68214f4af Aviad Krawczyk 2017-08-21  236   * @mod: module in the chip that will get the message
6dd8b68214f4af Aviad Krawczyk 2017-08-21  237   * @cmd: command of the message
6dd8b68214f4af Aviad Krawczyk 2017-08-21  238   * @buf_in: the msg data
6dd8b68214f4af Aviad Krawczyk 2017-08-21  239   * @in_size: the msg data length
6dd8b68214f4af Aviad Krawczyk 2017-08-21  240   * @buf_out: response
6dd8b68214f4af Aviad Krawczyk 2017-08-21  241   * @out_size: response length
6dd8b68214f4af Aviad Krawczyk 2017-08-21  242   * @direction: the direction of the original message
6dd8b68214f4af Aviad Krawczyk 2017-08-21  243   * @resp_msg_id: msg id to response for
6dd8b68214f4af Aviad Krawczyk 2017-08-21  244   *
6dd8b68214f4af Aviad Krawczyk 2017-08-21  245   * Return 0 - Success, negative - Failure
6dd8b68214f4af Aviad Krawczyk 2017-08-21  246   **/
6dd8b68214f4af Aviad Krawczyk 2017-08-21  247  static int msg_to_mgmt_sync(struct hinic_pf_to_mgmt *pf_to_mgmt,
6dd8b68214f4af Aviad Krawczyk 2017-08-21  248  			    enum hinic_mod_type mod, u8 cmd,
6dd8b68214f4af Aviad Krawczyk 2017-08-21  249  			    u8 *buf_in, u16 in_size,
6dd8b68214f4af Aviad Krawczyk 2017-08-21  250  			    u8 *buf_out, u16 *out_size,
6dd8b68214f4af Aviad Krawczyk 2017-08-21  251  			    enum mgmt_direction_type direction,
2afbedce318458 Luo bin        2020-05-10  252  			    u16 resp_msg_id, u32 timeout)
6dd8b68214f4af Aviad Krawczyk 2017-08-21 @253  {
6dd8b68214f4af Aviad Krawczyk 2017-08-21  254  	struct hinic_hwif *hwif = pf_to_mgmt->hwif;
6dd8b68214f4af Aviad Krawczyk 2017-08-21  255  	struct pci_dev *pdev = hwif->pdev;
6dd8b68214f4af Aviad Krawczyk 2017-08-21  256  	struct hinic_recv_msg *recv_msg;
6dd8b68214f4af Aviad Krawczyk 2017-08-21  257  	struct completion *recv_done;
2afbedce318458 Luo bin        2020-05-10  258  	unsigned long timeo;
6dd8b68214f4af Aviad Krawczyk 2017-08-21  259  	u16 msg_id;
6dd8b68214f4af Aviad Krawczyk 2017-08-21  260  	int err;
6dd8b68214f4af Aviad Krawczyk 2017-08-21  261  
6dd8b68214f4af Aviad Krawczyk 2017-08-21  262  	/* Lock the sync_msg_buf */
6dd8b68214f4af Aviad Krawczyk 2017-08-21  263  	down(&pf_to_mgmt->sync_msg_lock);
6dd8b68214f4af Aviad Krawczyk 2017-08-21  264  
6dd8b68214f4af Aviad Krawczyk 2017-08-21  265  	recv_msg = &pf_to_mgmt->recv_resp_msg_from_mgmt;
6dd8b68214f4af Aviad Krawczyk 2017-08-21  266  	recv_done = &recv_msg->recv_done;
6dd8b68214f4af Aviad Krawczyk 2017-08-21  267  
6dd8b68214f4af Aviad Krawczyk 2017-08-21  268  	if (resp_msg_id == MSG_NOT_RESP)
6dd8b68214f4af Aviad Krawczyk 2017-08-21  269  		msg_id = SYNC_MSG_ID(pf_to_mgmt);
6dd8b68214f4af Aviad Krawczyk 2017-08-21  270  	else
6dd8b68214f4af Aviad Krawczyk 2017-08-21  271  		msg_id = resp_msg_id;
6dd8b68214f4af Aviad Krawczyk 2017-08-21  272  
6dd8b68214f4af Aviad Krawczyk 2017-08-21  273  	init_completion(recv_done);
6dd8b68214f4af Aviad Krawczyk 2017-08-21  274  
6dd8b68214f4af Aviad Krawczyk 2017-08-21  275  	err = send_msg_to_mgmt(pf_to_mgmt, mod, cmd, buf_in, in_size,
6dd8b68214f4af Aviad Krawczyk 2017-08-21  276  			       MSG_ACK, direction, resp_msg_id);
6dd8b68214f4af Aviad Krawczyk 2017-08-21  277  	if (err) {
6dd8b68214f4af Aviad Krawczyk 2017-08-21  278  		dev_err(&pdev->dev, "Failed to send sync msg to mgmt\n");
6dd8b68214f4af Aviad Krawczyk 2017-08-21  279  		goto unlock_sync_msg;
6dd8b68214f4af Aviad Krawczyk 2017-08-21  280  	}
6dd8b68214f4af Aviad Krawczyk 2017-08-21  281  
2afbedce318458 Luo bin        2020-05-10  282  	timeo = msecs_to_jiffies(timeout ? timeout : MGMT_MSG_TIMEOUT);
2afbedce318458 Luo bin        2020-05-10  283  
2afbedce318458 Luo bin        2020-05-10  284  	if (!wait_for_completion_timeout(recv_done, timeo)) {
6dd8b68214f4af Aviad Krawczyk 2017-08-21  285  		dev_err(&pdev->dev, "MGMT timeout, MSG id = %d\n", msg_id);
6dd8b68214f4af Aviad Krawczyk 2017-08-21  286  		err = -ETIMEDOUT;
6dd8b68214f4af Aviad Krawczyk 2017-08-21  287  		goto unlock_sync_msg;
6dd8b68214f4af Aviad Krawczyk 2017-08-21  288  	}
6dd8b68214f4af Aviad Krawczyk 2017-08-21  289  
6dd8b68214f4af Aviad Krawczyk 2017-08-21  290  	smp_rmb();      /* verify reading after completion */
6dd8b68214f4af Aviad Krawczyk 2017-08-21  291  
6dd8b68214f4af Aviad Krawczyk 2017-08-21  292  	if (recv_msg->msg_id != msg_id) {
6dd8b68214f4af Aviad Krawczyk 2017-08-21  293  		dev_err(&pdev->dev, "incorrect MSG for id = %d\n", msg_id);
6dd8b68214f4af Aviad Krawczyk 2017-08-21  294  		err = -EFAULT;
6dd8b68214f4af Aviad Krawczyk 2017-08-21  295  		goto unlock_sync_msg;
6dd8b68214f4af Aviad Krawczyk 2017-08-21  296  	}
6dd8b68214f4af Aviad Krawczyk 2017-08-21  297  
6dd8b68214f4af Aviad Krawczyk 2017-08-21  298  	if ((buf_out) && (recv_msg->msg_len <= MAX_PF_MGMT_BUF_SIZE)) {
6dd8b68214f4af Aviad Krawczyk 2017-08-21  299  		memcpy(buf_out, recv_msg->msg, recv_msg->msg_len);
6dd8b68214f4af Aviad Krawczyk 2017-08-21  300  		*out_size = recv_msg->msg_len;
6dd8b68214f4af Aviad Krawczyk 2017-08-21  301  	}
6dd8b68214f4af Aviad Krawczyk 2017-08-21  302  
6dd8b68214f4af Aviad Krawczyk 2017-08-21  303  unlock_sync_msg:
6dd8b68214f4af Aviad Krawczyk 2017-08-21  304  	up(&pf_to_mgmt->sync_msg_lock);
6dd8b68214f4af Aviad Krawczyk 2017-08-21  305  	return err;
6dd8b68214f4af Aviad Krawczyk 2017-08-21  306  }
6dd8b68214f4af Aviad Krawczyk 2017-08-21  307  

:::::: The code at line 253 was first introduced by commit
:::::: 6dd8b68214f4af663faec507169a123222dfa7e7 net-next/hinic: Add management messages

:::::: TO: Aviad Krawczyk <aviad.krawczyk@huawei.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
