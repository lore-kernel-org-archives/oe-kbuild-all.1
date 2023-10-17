Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0D22D02A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 16:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JNznBFs9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697560755; x=1729096755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L36RMN+enFdWDzdAWt7750bmsek9LlwGNYRCeS+PSQs=;
  b=JNznBFs9+/yEgWyniZhft3jviBbsBZsrCe28ZeDak8SViQvfPeNkk3K/
   iEtG4CS/hRPOjKAE+LQ1nGxKkvt11A1g7YGeG10eQ7vkkI2HVOkNCeHhG
   W+R47h9D4XySYbRurpcxkx5ZMEpcX0f/PDY3of7ijSx6obTm5L3IYlhc7
   N86n1yDjb0OyaCn6NJq4bMliITBzIeOPwKB5EGMjxPyQnTKV6gRBlbKbg
   OmQ/5549y+YScb2BPweaSZgRq5Rjbz0F7cQ09H7osTipZZUFdwEQrc4PH
   YpLUkUOCjO+54roubjP+tMV8yrXwPMlbxmTryX38pcY2eSm4l1tdfAFlU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="389693716"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="389693716"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 09:39:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="706068410"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="706068410"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Oct 2023 09:39:10 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsn64-0009pd-1C;
	Tue, 17 Oct 2023 16:39:08 +0000
Date: Wed, 18 Oct 2023 00:39:04 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Lew <quic_clew@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Deepak Kumar Singh <quic_deesin@quicinc.com>,
	Sarannya S <quic_sarannya@quicinc.com>
Subject: drivers/rpmsg/rpmsg_char.c:75: warning: Function parameter or member
 'remote_flow_restricted' not described in 'rpmsg_eptdev'
Message-ID: <202310180054.aikLn1A7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chris,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   213f891525c222e8ed145ce1ce7ae1f47921cb9c
commit: 5550201c0fe26a76c53983bd36a58d4c4395ec22 rpmsg: char: Add RPMSG GET/SET FLOWCONTROL IOCTL support
date:   3 months ago
config: x86_64-buildonly-randconfig-001-20231012 (https://download.01.org/0day-ci/archive/20231018/202310180054.aikLn1A7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310180054.aikLn1A7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180054.aikLn1A7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rpmsg/rpmsg_char.c:75: warning: Function parameter or member 'remote_flow_restricted' not described in 'rpmsg_eptdev'
>> drivers/rpmsg/rpmsg_char.c:75: warning: Function parameter or member 'remote_flow_updated' not described in 'rpmsg_eptdev'


vim +75 drivers/rpmsg/rpmsg_char.c

c0cdc19f84a471 Bjorn Andersson  2017-01-11  41  
c0cdc19f84a471 Bjorn Andersson  2017-01-11  42  /**
c0cdc19f84a471 Bjorn Andersson  2017-01-11  43   * struct rpmsg_eptdev - endpoint device context
c0cdc19f84a471 Bjorn Andersson  2017-01-11  44   * @dev:	endpoint device
c0cdc19f84a471 Bjorn Andersson  2017-01-11  45   * @cdev:	cdev for the endpoint device
c0cdc19f84a471 Bjorn Andersson  2017-01-11  46   * @rpdev:	underlaying rpmsg device
c0cdc19f84a471 Bjorn Andersson  2017-01-11  47   * @chinfo:	info used to open the endpoint
c0cdc19f84a471 Bjorn Andersson  2017-01-11  48   * @ept_lock:	synchronization of @ept modifications
c0cdc19f84a471 Bjorn Andersson  2017-01-11  49   * @ept:	rpmsg endpoint reference, when open
c0cdc19f84a471 Bjorn Andersson  2017-01-11  50   * @queue_lock:	synchronization of @queue operations
c0cdc19f84a471 Bjorn Andersson  2017-01-11  51   * @queue:	incoming message queue
c0cdc19f84a471 Bjorn Andersson  2017-01-11  52   * @readq:	wait object for incoming queue
bea9b79c2d10fe Arnaud Pouliquen 2022-01-24  53   * @default_ept: set to channel default endpoint if the default endpoint should be re-used
bea9b79c2d10fe Arnaud Pouliquen 2022-01-24  54   *              on device open to prevent endpoint address update.
5550201c0fe26a Chris Lew        2023-07-07  55   * remote_flow_restricted: to indicate if the remote has requested for flow to be limited
5550201c0fe26a Chris Lew        2023-07-07  56   * remote_flow_updated: to indicate if the flow control has been requested
c0cdc19f84a471 Bjorn Andersson  2017-01-11  57   */
c0cdc19f84a471 Bjorn Andersson  2017-01-11  58  struct rpmsg_eptdev {
c0cdc19f84a471 Bjorn Andersson  2017-01-11  59  	struct device dev;
c0cdc19f84a471 Bjorn Andersson  2017-01-11  60  	struct cdev cdev;
c0cdc19f84a471 Bjorn Andersson  2017-01-11  61  
c0cdc19f84a471 Bjorn Andersson  2017-01-11  62  	struct rpmsg_device *rpdev;
c0cdc19f84a471 Bjorn Andersson  2017-01-11  63  	struct rpmsg_channel_info chinfo;
c0cdc19f84a471 Bjorn Andersson  2017-01-11  64  
c0cdc19f84a471 Bjorn Andersson  2017-01-11  65  	struct mutex ept_lock;
c0cdc19f84a471 Bjorn Andersson  2017-01-11  66  	struct rpmsg_endpoint *ept;
bea9b79c2d10fe Arnaud Pouliquen 2022-01-24  67  	struct rpmsg_endpoint *default_ept;
c0cdc19f84a471 Bjorn Andersson  2017-01-11  68  
c0cdc19f84a471 Bjorn Andersson  2017-01-11  69  	spinlock_t queue_lock;
c0cdc19f84a471 Bjorn Andersson  2017-01-11  70  	struct sk_buff_head queue;
c0cdc19f84a471 Bjorn Andersson  2017-01-11  71  	wait_queue_head_t readq;
bea9b79c2d10fe Arnaud Pouliquen 2022-01-24  72  
5550201c0fe26a Chris Lew        2023-07-07  73  	bool remote_flow_restricted;
5550201c0fe26a Chris Lew        2023-07-07  74  	bool remote_flow_updated;
c0cdc19f84a471 Bjorn Andersson  2017-01-11 @75  };
c0cdc19f84a471 Bjorn Andersson  2017-01-11  76  

:::::: The code at line 75 was first introduced by commit
:::::: c0cdc19f84a4712cf74888f83af286e3c2e14efd rpmsg: Driver for user space endpoint interface

:::::: TO: Bjorn Andersson <bjorn.andersson@linaro.org>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
