Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2368033D4E8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 14:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894361; cv=none; b=SJfeJ4z78rbrxGuvi29D8EPb1W9YRp8T17w2XAdDUQEoi/D6i7gZBkFcRMpQfmF4LuDT51G68KWyGB4zGKTgINuq0aL/IeBqS6MlEJMR5FjdDGQzAJ+mpOzWe5vXoy4KN4KX6roQoKMelJ6e+OUg6c39kpk5YiuRyhToBkIyyCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894361; c=relaxed/simple;
	bh=cmnlVztpG2WRJ812BhYdPt2qZ5FlPCM9WAPkyCXfYRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IMvA6Sg1ZszDDDxex90V5PO9lVTd4tLEgdENYf0y8q7gRAeLtbm/hrlVp3DT1ElWDNaOU/+LhP4mlsFTlZn+Kt0EkCZCzqyo+fmoiTV7ZfU8h0+2KtvdaduqRXYQ25iQ2RKF7izuF/Aa8GyAKZIKrmoam5eI5kzhin1fjvezo1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wz2lH5fA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wz2lH5fA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765894359; x=1797430359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cmnlVztpG2WRJ812BhYdPt2qZ5FlPCM9WAPkyCXfYRI=;
  b=Wz2lH5fA3Cyw7Rxx3B8gPX2P1OatBfDxiqQIWeJa1IeCDBIsfhpw8rgK
   OzOeU9stwcrAJI6x1ToczrpYgxrJ+7aISCR7dmIHiCwYDczMJ87333TNS
   xosmurtNWjj4bRxa8KPKJg4GE+snGGh2xItImuiVphrmDFahp/BaA4Z8H
   o1hu98eWYqXXhXHg7IpzQR1LPUw5ApGUKKoRwM+RDM9i4yzl0ZR8dimNp
   Ams/lp8xnkZiHcfRbCpV0cyGJGk6F0YB+Vhdkw21cw51rASWVUTcbcvLv
   T6UIMWqY4jkig1XWNq1QlqH3/ZLigVSX3FUDd3cSRtz8j0e/si7ZnLoKo
   A==;
X-CSE-ConnectionGUID: 43O7h9VVQSeOTbvCRirOVA==
X-CSE-MsgGUID: /g6BFu6KQkCvBJtqJlzREw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="71666666"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="71666666"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 06:12:38 -0800
X-CSE-ConnectionGUID: IF0UMZd4RTiTMEWlqnlMiw==
X-CSE-MsgGUID: Nv2Np6TJTfmvTJBXbcgMxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="202213538"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 16 Dec 2025 06:12:38 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVVn0-000000003HY-3Yrj;
	Tue, 16 Dec 2025 14:12:34 +0000
Date: Tue, 16 Dec 2025 22:12:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 drivers/virt/gunyah/rsc_mgr.c:148: warning: Function parameter or member
 'adev' not described in 'gunyah_rm'
Message-ID: <202512162243.byUP43KG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sreenad,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e48fbb6a53e582d8881d31d6b3de0405f7543cfd
commit: d96d06cd8636a6dff462afe06607473036967d1c [2/2] ANDROID: gunyah: Add support for Gunyah vendor modules
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251216/202512162243.byUP43KG-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512162243.byUP43KG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512162243.byUP43KG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/gunyah/rsc_mgr.c:148: warning: Function parameter or member 'adev' not described in 'gunyah_rm'


vim +148 drivers/virt/gunyah/rsc_mgr.c

01e1f18752ebb9 Elliot Berman 2024-02-22  113  
01e1f18752ebb9 Elliot Berman 2024-02-22  114  /**
01e1f18752ebb9 Elliot Berman 2024-02-22  115   * struct gunyah_rm - private data for communicating w/Gunyah resource manager
01e1f18752ebb9 Elliot Berman 2024-02-22  116   * @dev: pointer to RM platform device
01e1f18752ebb9 Elliot Berman 2024-02-22  117   * @tx_ghrsc: message queue resource to TX to RM
01e1f18752ebb9 Elliot Berman 2024-02-22  118   * @rx_ghrsc: message queue resource to RX from RM
01e1f18752ebb9 Elliot Berman 2024-02-22  119   * @active_rx_message: ongoing gunyah_rm_message for which we're receiving fragments
01e1f18752ebb9 Elliot Berman 2024-02-22  120   * @call_xarray: xarray to allocate & lookup sequence IDs for Request/Response flows
01e1f18752ebb9 Elliot Berman 2024-02-22  121   * @next_seq: next ID to allocate (for xa_alloc_cyclic)
01e1f18752ebb9 Elliot Berman 2024-02-22  122   * @recv_msg: cached allocation for Rx messages
01e1f18752ebb9 Elliot Berman 2024-02-22  123   * @send_msg: cached allocation for Tx messages. Must hold @send_lock to manipulate.
01e1f18752ebb9 Elliot Berman 2024-02-22  124   * @send_lock: synchronization to allow only one request to be sent at a time
01e1f18752ebb9 Elliot Berman 2024-02-22  125   * @send_ready: completed when we know Tx message queue can take more messages
01e1f18752ebb9 Elliot Berman 2024-02-22  126   * @nh: notifier chain for clients interested in RM notification messages
66d92ddac000a3 Elliot Berman 2024-02-22  127   * @miscdev: /dev/gunyah
d1ebd178ce81bd Elliot Berman 2024-02-22  128   * @parent_fwnode: Parent IRQ fwnode to translate Gunyah hwirqs to Linux irqs
01e1f18752ebb9 Elliot Berman 2024-02-22  129   */
01e1f18752ebb9 Elliot Berman 2024-02-22  130  struct gunyah_rm {
01e1f18752ebb9 Elliot Berman 2024-02-22  131  	struct device *dev;
01e1f18752ebb9 Elliot Berman 2024-02-22  132  	struct gunyah_resource tx_ghrsc;
01e1f18752ebb9 Elliot Berman 2024-02-22  133  	struct gunyah_resource rx_ghrsc;
01e1f18752ebb9 Elliot Berman 2024-02-22  134  	struct gunyah_rm_message *active_rx_message;
01e1f18752ebb9 Elliot Berman 2024-02-22  135  
01e1f18752ebb9 Elliot Berman 2024-02-22  136  	struct xarray call_xarray;
01e1f18752ebb9 Elliot Berman 2024-02-22  137  	u32 next_seq;
01e1f18752ebb9 Elliot Berman 2024-02-22  138  
01e1f18752ebb9 Elliot Berman 2024-02-22  139  	unsigned char recv_msg[GUNYAH_RM_MSGQ_MSG_SIZE];
01e1f18752ebb9 Elliot Berman 2024-02-22  140  	unsigned char send_msg[GUNYAH_RM_MSGQ_MSG_SIZE];
01e1f18752ebb9 Elliot Berman 2024-02-22  141  	struct mutex send_lock;
01e1f18752ebb9 Elliot Berman 2024-02-22  142  	struct completion send_ready;
01e1f18752ebb9 Elliot Berman 2024-02-22  143  	struct blocking_notifier_head nh;
66d92ddac000a3 Elliot Berman 2024-02-22  144  
d96d06cd8636a6 Sreenad Menon 2024-05-02  145  	struct auxiliary_device adev;
66d92ddac000a3 Elliot Berman 2024-02-22  146  	struct miscdevice miscdev;
d1ebd178ce81bd Elliot Berman 2024-02-22  147  	struct fwnode_handle *parent_fwnode;
01e1f18752ebb9 Elliot Berman 2024-02-22 @148  };
01e1f18752ebb9 Elliot Berman 2024-02-22  149  

:::::: The code at line 148 was first introduced by commit
:::::: 01e1f18752ebb91f6670592de463d5a2d66bbe7b FROMLIST: gunyah: rsc_mgr: Add resource manager RPC core

:::::: TO: Elliot Berman <quic_eberman@quicinc.com>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
