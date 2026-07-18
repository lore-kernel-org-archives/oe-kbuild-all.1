Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6600633D4E5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 07:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784361203; cv=none; b=Ow8n9Z3dNss34rWXjM226n7UF1+TKC9WZnTBjPZT4CUikgK7h8AEAy0d1J1+K3ptgCs6n4rpYAMAvs77Jnflr5rZYHQOk8+xMyuyX0HvkQTIIUMmZxYiSJs9+VCG7MUN1mKyX/gcjcSbb22D5+pLqLsuXNcunPBYeR3mhLjW4iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784361203; c=relaxed/simple;
	bh=TMbxvp1UvPnyhdYlx+nqiD4lslG8cjSEUik95u2hba8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B3A9Bzo9fll/Fw818YFd/ZAaR/M1kU8e/xeBFzEhYaIANerVMaT3MBJ9DoNJLSKePKP66oKkgqLy0xXPgwkwwOuF0xEl55uNKZCF3iVezaJ4uCJeSJceAwYxdXZ5XOrKcK+RyuA3HyK5fKBE1IgZA+/wN7f/gKdVS2cCFxYOBV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJs/sSU3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJs/sSU3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784361202; x=1815897202;
  h=date:from:to:cc:subject:message-id;
  bh=TMbxvp1UvPnyhdYlx+nqiD4lslG8cjSEUik95u2hba8=;
  b=JJs/sSU3hfvdyg9BtZ77Qt8EFPS5JHg54DJiqPd8XCHOj4Yhj8vAwHnh
   jNkD3AH4YaEGADGc1X8WacmX1EGwVAkxCcV5v9ByMfK9X/1ZHkJGyirw5
   0GGAu99u7ef1eiRw5FDwF+7nfEPCb9JN1NpMFeyMwauEj/yIaND9SAtQd
   6yKWDjIM2c1247WDBRL+dISyfIEH7tiDsSM0Zj6JfI2kf6cDhLYDVBr8Y
   76cPGtiCQt1R2WH0Kls0CQvpcS+qqFhpSv6HH+ed2pZTfxgNlkSDTrLfH
   2xsdxFDcRSwchSNRv/f+9gZtKlQBqxMqVmcclXbfJVGyCKBFJUUzFSQ7z
   g==;
X-CSE-ConnectionGUID: gBcBBAReSf6P9640BITDag==
X-CSE-MsgGUID: N/uiW+cMQyON1NzA6MKfSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="95617192"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="95617192"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 00:53:21 -0700
X-CSE-ConnectionGUID: PQs8wz30R3S1V3OOSk+UNw==
X-CSE-MsgGUID: XEKuTZ2JSAWnc0/u6UQQuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="255808050"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 18 Jul 2026 00:53:19 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkzrG-00000000TYt-1AYg;
	Sat, 18 Jul 2026 07:53:14 +0000
Date: Sat, 18 Jul 2026 15:52:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-09 6/6]
 drivers/virt/gunyah/rsc_mgr.c:194: warning: Function parameter or member
 'pm_nb' not described in 'gh_rm'
Message-ID: <202607181530.sLBbBtSw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-09
head:   3280cd302df134b0017482f1a83de4325885e4b3
commit: 49a4719b693e7a7d3452677b31a1f32228da3887 [6/6] ANDROID: virt: gunyah: Fetch fresh Gunyah information after restore
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260718/202607181530.sLBbBtSw-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607181530.sLBbBtSw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181530.sLBbBtSw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/virt/gunyah/rsc_mgr.c:194: warning: Function parameter or member 'adev' not described in 'gh_rm'
>> drivers/virt/gunyah/rsc_mgr.c:194: warning: Function parameter or member 'pm_nb' not described in 'gh_rm'
   drivers/virt/gunyah/rsc_mgr.c:669: warning: Function parameter or member '_rm' not described in 'gh_rm_call'
   drivers/virt/gunyah/rsc_mgr.c:669: warning: Excess function parameter 'rm' description in 'gh_rm_call'


vim +194 drivers/virt/gunyah/rsc_mgr.c

d5e8df2cc4a170 Elliot Berman           2022-08-10  155  
d5e8df2cc4a170 Elliot Berman           2022-08-10  156  /**
d5e8df2cc4a170 Elliot Berman           2022-08-10  157   * struct gh_rm - private data for communicating w/Gunyah resource manager
705a9b5feb1ba9 Elliot Berman           2023-06-12  158   * @dev: pointer to RM platform device
d5e8df2cc4a170 Elliot Berman           2022-08-10  159   * @tx_ghrsc: message queue resource to TX to RM
d5e8df2cc4a170 Elliot Berman           2022-08-10  160   * @rx_ghrsc: message queue resource to RX from RM
9a9fc8d1b2882c Elliot Berman           2023-04-17  161   * @msgq: mailbox instance of TX/RX resources above
9a9fc8d1b2882c Elliot Berman           2023-04-17  162   * @msgq_client: mailbox client of above msgq
d5e8df2cc4a170 Elliot Berman           2022-08-10  163   * @active_rx_connection: ongoing gh_rm_connection for which we're receiving fragments
d5e8df2cc4a170 Elliot Berman           2022-08-10  164   * @last_tx_ret: return value of last mailbox tx
d5e8df2cc4a170 Elliot Berman           2022-08-10  165   * @call_xarray: xarray to allocate & lookup sequence IDs for Request/Response flows
d5e8df2cc4a170 Elliot Berman           2022-08-10  166   * @next_seq: next ID to allocate (for xa_alloc_cyclic)
d5e8df2cc4a170 Elliot Berman           2022-08-10  167   * @cache: cache for allocating Tx messages
d5e8df2cc4a170 Elliot Berman           2022-08-10  168   * @send_lock: synchronization to allow only one request to be sent at a time
d5e8df2cc4a170 Elliot Berman           2022-08-10  169   * @nh: notifier chain for clients interested in RM notification messages
f251362242ba3e Elliot Berman           2022-10-14  170   * @miscdev: /dev/gunyah
4cf9feacb7e4ba Elliot Berman           2022-12-13  171   * @irq_domain: Domain to translate Gunyah hwirqs to Linux irqs
d5e8df2cc4a170 Elliot Berman           2022-08-10  172   */
d5e8df2cc4a170 Elliot Berman           2022-08-10  173  struct gh_rm {
d5e8df2cc4a170 Elliot Berman           2022-08-10  174  	struct device *dev;
d5e8df2cc4a170 Elliot Berman           2022-08-10  175  	struct gh_resource tx_ghrsc;
d5e8df2cc4a170 Elliot Berman           2022-08-10  176  	struct gh_resource rx_ghrsc;
d5e8df2cc4a170 Elliot Berman           2022-08-10  177  	struct gh_msgq msgq;
d5e8df2cc4a170 Elliot Berman           2022-08-10  178  	struct mbox_client msgq_client;
d5e8df2cc4a170 Elliot Berman           2022-08-10  179  	struct gh_rm_connection *active_rx_connection;
d5e8df2cc4a170 Elliot Berman           2022-08-10  180  	int last_tx_ret;
d5e8df2cc4a170 Elliot Berman           2022-08-10  181  
d5e8df2cc4a170 Elliot Berman           2022-08-10  182  	struct xarray call_xarray;
d5e8df2cc4a170 Elliot Berman           2022-08-10  183  	u32 next_seq;
d5e8df2cc4a170 Elliot Berman           2022-08-10  184  
d5e8df2cc4a170 Elliot Berman           2022-08-10  185  	struct kmem_cache *cache;
d5e8df2cc4a170 Elliot Berman           2022-08-10  186  	struct mutex send_lock;
d5e8df2cc4a170 Elliot Berman           2022-08-10  187  	struct blocking_notifier_head nh;
f251362242ba3e Elliot Berman           2022-10-14  188  
1dce9d7d4deea1 Prakruthi Deepak Heragu 2023-02-27  189  	struct auxiliary_device adev;
f251362242ba3e Elliot Berman           2022-10-14  190  	struct miscdevice miscdev;
4cf9feacb7e4ba Elliot Berman           2022-12-13  191  	struct irq_domain *irq_domain;
49a4719b693e7a Hrishabh Rajput         2025-08-13  192  
49a4719b693e7a Hrishabh Rajput         2025-08-13  193  	struct notifier_block pm_nb;
d5e8df2cc4a170 Elliot Berman           2022-08-10 @194  };
d5e8df2cc4a170 Elliot Berman           2022-08-10  195  

:::::: The code at line 194 was first introduced by commit
:::::: d5e8df2cc4a17063dcebc67a939356ad49a665bd FROMLIST: gunyah: rsc_mgr: Add resource manager RPC core

:::::: TO: Elliot Berman <quic_eberman@quicinc.com>
:::::: CC: Aleksei Vetrov <vvvvvv@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
