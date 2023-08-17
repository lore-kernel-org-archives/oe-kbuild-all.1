Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810B813AD7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 14:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692284016; x=1723820016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Si6iLxJ+ZT0qfgeJa3xRj/0pxS2l5Ylbz4DPWAuGJsM=;
  b=m22U2+iULQF8VoRc1r3mUK8UPd53YQILlvBKQ4bQh2yoKf5TOCMzuS4K
   t0mthRX6dOJiV2qOqw4BQg3ZrBAiMji9LLlWvgEJCFOyXsrvMgk2ol41h
   RIISmGrabDiHGfsHgnMqsGGyZy7GVhiQjCI6fnikz6TVNIqVNXwasiufd
   XXkzuXFTASzcVZ729hb2TC2Ve3s+yWayQLMke4dRNmkBXXVqkQrNxnDdk
   FTNSfWeqHYfNcKPzHs/V8jW7Cy9DaMyDyGbtvG6NHJd3uhAPejx+ug7NI
   dB9G8047IzxnxHtCDKj5f9zVrLXdOqDZMN2Um1ZXZylQFyVB3E73PVB1w
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="376588000"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="376588000"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 07:53:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="728166709"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="728166709"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Aug 2023 07:53:30 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWeMU-0001Ej-2o;
	Thu, 17 Aug 2023 14:52:50 +0000
Date: Thu, 17 Aug 2023 22:52:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kashyap Desai <kashyap.desai@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Selvin Xavier <selvin.xavier@broadcom.com>,
	Leon Romanovsky <leon@kernel.org>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-6.4.y 1489/2026]
 drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:105: warning: Function parameter
 or member 'opcode' not described in '__wait_for_resp'
Message-ID: <202308172216.o9z1rA51-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.4.y
head:   eb3cdb587879a7794c7f649011c565d7a94f3e2e
commit: 4e5c10167e724aa46319b9c26eda7b66b810891d [1489/2026] RDMA/bnxt_re: Avoid the command wait if firmware is inactive
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230817/202308172216.o9z1rA51-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308172216.o9z1rA51-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308172216.o9z1rA51-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:73: warning: Function parameter or member 'opcode' not described in 'bnxt_qplib_map_rc'
   drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:105: warning: Function parameter or member 'rcfw' not described in '__wait_for_resp'
   drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:105: warning: Function parameter or member 'cookie' not described in '__wait_for_resp'
>> drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:105: warning: Function parameter or member 'opcode' not described in '__wait_for_resp'
   drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:147: warning: Function parameter or member 'rcfw' not described in '__block_for_resp'
   drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:147: warning: Function parameter or member 'cookie' not described in '__block_for_resp'
>> drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:147: warning: Function parameter or member 'opcode' not described in '__block_for_resp'


vim +105 drivers/infiniband/hw/bnxt_re/qplib_rcfw.c

4e5c10167e724a Kashyap Desai 2023-06-09   91  
973d3fa70af791 Kashyap Desai 2023-06-09   92  /**
973d3fa70af791 Kashyap Desai 2023-06-09   93   * __wait_for_resp   -	Don't hold the cpu context and wait for response
973d3fa70af791 Kashyap Desai 2023-06-09   94   * @rcfw      -   rcfw channel instance of rdev
973d3fa70af791 Kashyap Desai 2023-06-09   95   * @cookie    -   cookie to track the command
4e5c10167e724a Kashyap Desai 2023-06-09   96   * @opcode    -   rcfw submitted for given opcode
973d3fa70af791 Kashyap Desai 2023-06-09   97   *
973d3fa70af791 Kashyap Desai 2023-06-09   98   * Wait for command completion in sleepable context.
973d3fa70af791 Kashyap Desai 2023-06-09   99   *
973d3fa70af791 Kashyap Desai 2023-06-09  100   * Returns:
973d3fa70af791 Kashyap Desai 2023-06-09  101   * 0 if command is completed by firmware.
973d3fa70af791 Kashyap Desai 2023-06-09  102   * Non zero error code for rest of the case.
973d3fa70af791 Kashyap Desai 2023-06-09  103   */
4e5c10167e724a Kashyap Desai 2023-06-09  104  static int __wait_for_resp(struct bnxt_qplib_rcfw *rcfw, u16 cookie, u8 opcode)
1ac5a404797523 Selvin Xavier 2017-02-10 @105  {
cee0c7bba48691 Devesh Sharma 2020-02-15  106  	struct bnxt_qplib_cmdq_ctx *cmdq;
1ac5a404797523 Selvin Xavier 2017-02-10  107  	u16 cbit;
973d3fa70af791 Kashyap Desai 2023-06-09  108  	int ret;
1ac5a404797523 Selvin Xavier 2017-02-10  109  
cee0c7bba48691 Devesh Sharma 2020-02-15  110  	cmdq = &rcfw->cmdq;
bd1c24ccf9eb07 Devesh Sharma 2018-12-12  111  	cbit = cookie % rcfw->cmdq_depth;
973d3fa70af791 Kashyap Desai 2023-06-09  112  
973d3fa70af791 Kashyap Desai 2023-06-09  113  	do {
4e5c10167e724a Kashyap Desai 2023-06-09  114  		if (test_bit(ERR_DEVICE_DETACHED, &cmdq->flags))
4e5c10167e724a Kashyap Desai 2023-06-09  115  			return bnxt_qplib_map_rc(opcode);
4e5c10167e724a Kashyap Desai 2023-06-09  116  
973d3fa70af791 Kashyap Desai 2023-06-09  117  		/* Non zero means command completed */
973d3fa70af791 Kashyap Desai 2023-06-09  118  		ret = wait_event_timeout(cmdq->waitq,
cee0c7bba48691 Devesh Sharma 2020-02-15  119  					 !test_bit(cbit, cmdq->cmdq_bitmap),
973d3fa70af791 Kashyap Desai 2023-06-09  120  					 msecs_to_jiffies(10000));
973d3fa70af791 Kashyap Desai 2023-06-09  121  
973d3fa70af791 Kashyap Desai 2023-06-09  122  		if (!test_bit(cbit, cmdq->cmdq_bitmap))
973d3fa70af791 Kashyap Desai 2023-06-09  123  			return 0;
973d3fa70af791 Kashyap Desai 2023-06-09  124  
973d3fa70af791 Kashyap Desai 2023-06-09  125  		bnxt_qplib_service_creq(&rcfw->creq.creq_tasklet);
973d3fa70af791 Kashyap Desai 2023-06-09  126  
973d3fa70af791 Kashyap Desai 2023-06-09  127  		if (!test_bit(cbit, cmdq->cmdq_bitmap))
973d3fa70af791 Kashyap Desai 2023-06-09  128  			return 0;
973d3fa70af791 Kashyap Desai 2023-06-09  129  
973d3fa70af791 Kashyap Desai 2023-06-09  130  	} while (true);
1ac5a404797523 Selvin Xavier 2017-02-10  131  };
1ac5a404797523 Selvin Xavier 2017-02-10  132  
973d3fa70af791 Kashyap Desai 2023-06-09  133  /**
973d3fa70af791 Kashyap Desai 2023-06-09  134   * __block_for_resp   -	hold the cpu context and wait for response
973d3fa70af791 Kashyap Desai 2023-06-09  135   * @rcfw      -   rcfw channel instance of rdev
973d3fa70af791 Kashyap Desai 2023-06-09  136   * @cookie    -   cookie to track the command
4e5c10167e724a Kashyap Desai 2023-06-09  137   * @opcode    -   rcfw submitted for given opcode
973d3fa70af791 Kashyap Desai 2023-06-09  138   *
973d3fa70af791 Kashyap Desai 2023-06-09  139   * This function will hold the cpu (non-sleepable context) and
973d3fa70af791 Kashyap Desai 2023-06-09  140   * wait for command completion. Maximum holding interval is 8 second.
973d3fa70af791 Kashyap Desai 2023-06-09  141   *
973d3fa70af791 Kashyap Desai 2023-06-09  142   * Returns:
973d3fa70af791 Kashyap Desai 2023-06-09  143   * -ETIMEOUT if command is not completed in specific time interval.
973d3fa70af791 Kashyap Desai 2023-06-09  144   * 0 if command is completed by firmware.
973d3fa70af791 Kashyap Desai 2023-06-09  145   */
4e5c10167e724a Kashyap Desai 2023-06-09  146  static int __block_for_resp(struct bnxt_qplib_rcfw *rcfw, u16 cookie, u8 opcode)
1ac5a404797523 Selvin Xavier 2017-02-10 @147  {
973d3fa70af791 Kashyap Desai 2023-06-09  148  	struct bnxt_qplib_cmdq_ctx *cmdq = &rcfw->cmdq;
973d3fa70af791 Kashyap Desai 2023-06-09  149  	unsigned long issue_time = 0;
1ac5a404797523 Selvin Xavier 2017-02-10  150  	u16 cbit;
1ac5a404797523 Selvin Xavier 2017-02-10  151  
bd1c24ccf9eb07 Devesh Sharma 2018-12-12  152  	cbit = cookie % rcfw->cmdq_depth;
973d3fa70af791 Kashyap Desai 2023-06-09  153  	issue_time = jiffies;
973d3fa70af791 Kashyap Desai 2023-06-09  154  
1ac5a404797523 Selvin Xavier 2017-02-10  155  	do {
4e5c10167e724a Kashyap Desai 2023-06-09  156  		if (test_bit(ERR_DEVICE_DETACHED, &cmdq->flags))
4e5c10167e724a Kashyap Desai 2023-06-09  157  			return bnxt_qplib_map_rc(opcode);
4e5c10167e724a Kashyap Desai 2023-06-09  158  
b9b43ad3ce883f Selvin Xavier 2021-09-15  159  		udelay(1);
973d3fa70af791 Kashyap Desai 2023-06-09  160  
53c2a706ae7858 Allen Pais    2020-09-03  161  		bnxt_qplib_service_creq(&rcfw->creq.creq_tasklet);
973d3fa70af791 Kashyap Desai 2023-06-09  162  		if (!test_bit(cbit, cmdq->cmdq_bitmap))
973d3fa70af791 Kashyap Desai 2023-06-09  163  			return 0;
973d3fa70af791 Kashyap Desai 2023-06-09  164  
973d3fa70af791 Kashyap Desai 2023-06-09  165  	} while (time_before(jiffies, issue_time + (8 * HZ)));
973d3fa70af791 Kashyap Desai 2023-06-09  166  
973d3fa70af791 Kashyap Desai 2023-06-09  167  	return -ETIMEDOUT;
1ac5a404797523 Selvin Xavier 2017-02-10  168  };
1ac5a404797523 Selvin Xavier 2017-02-10  169  

:::::: The code at line 105 was first introduced by commit
:::::: 1ac5a404797523cedaf424a3aaa3cf8f9548dff8 RDMA/bnxt_re: Add bnxt_re RoCE driver

:::::: TO: Selvin Xavier <selvin.xavier@broadcom.com>
:::::: CC: Doug Ledford <dledford@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
