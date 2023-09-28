Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE2027715
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 08:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695891372; x=1727427372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6di/2lKy//QFeG0ruIdMDgAN1KG7AfhoHE5KSsnXfkI=;
  b=NHaO9O0hVxcmuylfwVgxlM2B/34OIZABEx1amVcxUdY85SppK6v2fk4R
   n7WpHYb2mkxH/96J2QUdU9MtE0DyduV+b5ZIs3yJTIJa05BHux37VXcrV
   jo0F5PXLCAoTaFf3C0caoW4+HWD1HQ2ofSOK6kB+m+eR5ygoEDhfhZefw
   n880BlbG46+82jvt/QvzRp+rPhUv0o+2aQ8UWmg8KagNqMMxI0n91cZh8
   nyb4aOSr1imX584RDnsCs5KvyKym7QU83shkhJ6OFrJmAUwmqwgzOEGx0
   jj0j/Kn+s23hB+p9GpoDA3q6IMWWwjrYfQGGPcYJjxWJzdYTM7lMgPZXR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="623091"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="623091"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 01:56:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="778834273"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="778834273"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 28 Sep 2023 01:56:06 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlmoV-0001I7-0O;
	Thu, 28 Sep 2023 08:56:03 +0000
Date: Thu, 28 Sep 2023 16:55:05 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-6.7-next 252/306]
 drivers/infiniband/ulp/srpt/ib_srpt.c:216: warning: Function parameter or
 member 'ptr' not described in 'srpt_qp_event'
Message-ID: <202309281658.LvfMxa9G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-6.7-next
head:   a126cc9f2f87fe0931a7bf053665560587086082
commit: adbc8aa7902f966626e400ad09b383320a0060c8 [252/306] function casts
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230928/202309281658.LvfMxa9G-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309281658.LvfMxa9G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309281658.LvfMxa9G-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/ulp/srpt/ib_srpt.c:216: warning: Function parameter or member 'ptr' not described in 'srpt_qp_event'
>> drivers/infiniband/ulp/srpt/ib_srpt.c:216: warning: Excess function parameter 'ch' description in 'srpt_qp_event'


vim +216 drivers/infiniband/ulp/srpt/ib_srpt.c

aaf45bd83eba80 Bart Van Assche 2016-02-11  209  
a42d985bd5b234 Bart Van Assche 2011-10-14  210  /**
10eac19bb27241 Bart Van Assche 2018-01-08  211   * srpt_qp_event - QP event callback function
10eac19bb27241 Bart Van Assche 2018-01-08  212   * @event: Description of the event that occurred.
10eac19bb27241 Bart Van Assche 2018-01-08  213   * @ch: SRPT RDMA channel.
a42d985bd5b234 Bart Van Assche 2011-10-14  214   */
adbc8aa7902f96 Arnd Bergmann   2023-06-19  215  static void srpt_qp_event(struct ib_event *event, void *ptr)
a42d985bd5b234 Bart Van Assche 2011-10-14 @216  {
adbc8aa7902f96 Arnd Bergmann   2023-06-19  217  	struct srpt_rdma_ch *ch = ptr;
adbc8aa7902f96 Arnd Bergmann   2023-06-19  218  
d4ee7f3a4445ec Bart Van Assche 2020-05-25  219  	pr_debug("QP event %d on ch=%p sess_name=%s-%d state=%s\n",
d4ee7f3a4445ec Bart Van Assche 2020-05-25  220  		 event->event, ch, ch->sess_name, ch->qp->qp_num,
d4ee7f3a4445ec Bart Van Assche 2020-05-25  221  		 get_ch_state_name(ch->state));
a42d985bd5b234 Bart Van Assche 2011-10-14  222  
a42d985bd5b234 Bart Van Assche 2011-10-14  223  	switch (event->event) {
a42d985bd5b234 Bart Van Assche 2011-10-14  224  	case IB_EVENT_COMM_EST:
63cf1a902c9dd6 Bart Van Assche 2018-03-02  225  		if (ch->using_rdma_cm)
63cf1a902c9dd6 Bart Van Assche 2018-03-02  226  			rdma_notify(ch->rdma_cm.cm_id, event->event);
63cf1a902c9dd6 Bart Van Assche 2018-03-02  227  		else
090fa24bf239ce Bart Van Assche 2018-01-16  228  			ib_cm_notify(ch->ib_cm.cm_id, event->event);
a42d985bd5b234 Bart Van Assche 2011-10-14  229  		break;
a42d985bd5b234 Bart Van Assche 2011-10-14  230  	case IB_EVENT_QP_LAST_WQE_REACHED:
aaf45bd83eba80 Bart Van Assche 2016-02-11  231  		pr_debug("%s-%d, state %s: received Last WQE event.\n",
aaf45bd83eba80 Bart Van Assche 2016-02-11  232  			 ch->sess_name, ch->qp->qp_num,
aaf45bd83eba80 Bart Van Assche 2016-02-11  233  			 get_ch_state_name(ch->state));
a42d985bd5b234 Bart Van Assche 2011-10-14  234  		break;
a42d985bd5b234 Bart Van Assche 2011-10-14  235  	default:
9f5d32af09b9a3 Doug Ledford    2014-10-20  236  		pr_err("received unrecognized IB QP event %d\n", event->event);
a42d985bd5b234 Bart Van Assche 2011-10-14  237  		break;
a42d985bd5b234 Bart Van Assche 2011-10-14  238  	}
a42d985bd5b234 Bart Van Assche 2011-10-14  239  }
a42d985bd5b234 Bart Van Assche 2011-10-14  240  

:::::: The code at line 216 was first introduced by commit
:::::: a42d985bd5b234da8b61347a78dc3057bf7bb94d ib_srpt: Initial SRP Target merge for v3.3-rc1

:::::: TO: Bart Van Assche <bvanassche@acm.org>
:::::: CC: Nicholas Bellinger <nab@linux-iscsi.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
