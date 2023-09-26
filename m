Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD920273C3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 12:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695729764; x=1727265764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rZrLTv1N0fnJ3i/PkJ43R5P4WXZq6VlrtB4/CSk2yzk=;
  b=VKif+mQfuffIwUle3P1w7SEn8P1zVv1O4XxAqY9sifhu8YLCFCb/X5TW
   tXT74GRSIGyhlneoUMfrztU1x6d8pFy3aNPfF+QdzFL2TU2uWW3nyBhkq
   SzrHRajFD/+ba9dNW7ykhWUai40izpvbgQZ45K4oFzUQdJurXdza2r1dG
   DlmgKvYXG8k7NGEE2XKDwZILcufJeU64rsctjSW4l00hRPmB7bkYHV3hq
   73kEamHloKDQTL/qjeqzUWlgI7FIZqycE1p11Qz9XMWs4Wqf5WL/bGlgf
   MTylb2OZo5CHfLA2/DPL8A3GpKyFEe6vBPc7Lj7lCEBUl086UJVvJ2cMV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="381448584"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="381448584"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 05:02:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="752153508"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="752153508"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 26 Sep 2023 05:02:32 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ql6lq-0002mr-29;
	Tue, 26 Sep 2023 12:02:30 +0000
Date: Tue, 26 Sep 2023 20:02:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 27/32]
 drivers/virt/gunyah/rsc_mgr.c:159: warning: Function parameter or member
 'adev' not described in 'gh_rm'
Message-ID: <202309261952.QTG34QLU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b548c046c7de4c427ac5a0d5008a995d5e304f9b
commit: 1dce9d7d4deea1d677677ba5dc6e0879679e5b38 [27/32] ANDROID: gunyah: Add support for Gunyah vendor modules
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20230926/202309261952.QTG34QLU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309261952.QTG34QLU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309261952.QTG34QLU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/virt/gunyah/rsc_mgr.c:159: warning: Function parameter or member 'msgq_client' not described in 'gh_rm'
>> drivers/virt/gunyah/rsc_mgr.c:159: warning: Function parameter or member 'adev' not described in 'gh_rm'
   drivers/virt/gunyah/rsc_mgr.c:166: warning: Function parameter or member 'rm_error' not described in 'gh_rm_remap_error'
   drivers/virt/gunyah/rsc_mgr.c:166: warning: Excess function parameter 'gh_error' description in 'gh_rm_remap_error'


vim +159 drivers/virt/gunyah/rsc_mgr.c

d5e8df2cc4a170 Elliot Berman           2022-08-10  123  
d5e8df2cc4a170 Elliot Berman           2022-08-10  124  /**
d5e8df2cc4a170 Elliot Berman           2022-08-10  125   * struct gh_rm - private data for communicating w/Gunyah resource manager
d5e8df2cc4a170 Elliot Berman           2022-08-10  126   * @dev: pointer to device
d5e8df2cc4a170 Elliot Berman           2022-08-10  127   * @tx_ghrsc: message queue resource to TX to RM
d5e8df2cc4a170 Elliot Berman           2022-08-10  128   * @rx_ghrsc: message queue resource to RX from RM
d5e8df2cc4a170 Elliot Berman           2022-08-10  129   * @msgq: mailbox instance of above
d5e8df2cc4a170 Elliot Berman           2022-08-10  130   * @active_rx_connection: ongoing gh_rm_connection for which we're receiving fragments
d5e8df2cc4a170 Elliot Berman           2022-08-10  131   * @last_tx_ret: return value of last mailbox tx
d5e8df2cc4a170 Elliot Berman           2022-08-10  132   * @call_xarray: xarray to allocate & lookup sequence IDs for Request/Response flows
d5e8df2cc4a170 Elliot Berman           2022-08-10  133   * @next_seq: next ID to allocate (for xa_alloc_cyclic)
d5e8df2cc4a170 Elliot Berman           2022-08-10  134   * @cache: cache for allocating Tx messages
d5e8df2cc4a170 Elliot Berman           2022-08-10  135   * @send_lock: synchronization to allow only one request to be sent at a time
d5e8df2cc4a170 Elliot Berman           2022-08-10  136   * @nh: notifier chain for clients interested in RM notification messages
f251362242ba3e Elliot Berman           2022-10-14  137   * @miscdev: /dev/gunyah
4cf9feacb7e4ba Elliot Berman           2022-12-13  138   * @irq_domain: Domain to translate Gunyah hwirqs to Linux irqs
d5e8df2cc4a170 Elliot Berman           2022-08-10  139   */
d5e8df2cc4a170 Elliot Berman           2022-08-10  140  struct gh_rm {
d5e8df2cc4a170 Elliot Berman           2022-08-10  141  	struct device *dev;
d5e8df2cc4a170 Elliot Berman           2022-08-10  142  	struct gh_resource tx_ghrsc;
d5e8df2cc4a170 Elliot Berman           2022-08-10  143  	struct gh_resource rx_ghrsc;
d5e8df2cc4a170 Elliot Berman           2022-08-10  144  	struct gh_msgq msgq;
d5e8df2cc4a170 Elliot Berman           2022-08-10  145  	struct mbox_client msgq_client;
d5e8df2cc4a170 Elliot Berman           2022-08-10  146  	struct gh_rm_connection *active_rx_connection;
d5e8df2cc4a170 Elliot Berman           2022-08-10  147  	int last_tx_ret;
d5e8df2cc4a170 Elliot Berman           2022-08-10  148  
d5e8df2cc4a170 Elliot Berman           2022-08-10  149  	struct xarray call_xarray;
d5e8df2cc4a170 Elliot Berman           2022-08-10  150  	u32 next_seq;
d5e8df2cc4a170 Elliot Berman           2022-08-10  151  
d5e8df2cc4a170 Elliot Berman           2022-08-10  152  	struct kmem_cache *cache;
d5e8df2cc4a170 Elliot Berman           2022-08-10  153  	struct mutex send_lock;
d5e8df2cc4a170 Elliot Berman           2022-08-10  154  	struct blocking_notifier_head nh;
f251362242ba3e Elliot Berman           2022-10-14  155  
1dce9d7d4deea1 Prakruthi Deepak Heragu 2023-02-27  156  	struct auxiliary_device adev;
f251362242ba3e Elliot Berman           2022-10-14  157  	struct miscdevice miscdev;
4cf9feacb7e4ba Elliot Berman           2022-12-13  158  	struct irq_domain *irq_domain;
d5e8df2cc4a170 Elliot Berman           2022-08-10 @159  };
d5e8df2cc4a170 Elliot Berman           2022-08-10  160  

:::::: The code at line 159 was first introduced by commit
:::::: d5e8df2cc4a17063dcebc67a939356ad49a665bd FROMLIST: gunyah: rsc_mgr: Add resource manager RPC core

:::::: TO: Elliot Berman <quic_eberman@quicinc.com>
:::::: CC: Aleksei Vetrov <vvvvvv@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
