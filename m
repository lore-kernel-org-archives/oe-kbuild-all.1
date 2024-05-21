Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F41220EB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 05:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716270998; cv=none; b=lOBwxbmyLQyVLmryuZGIwVyIH9kvuzhMKkQdjCKGXBMd0jKGRGYWo2LBFsjbjzUpXuUY7+YBsh+Oq8GuE5nW3e2v/WX469oLmh6BMppNhHR3y39nYajyEsVVTb8YDPVr09YETDoHqQUtJs7TDh/SDZki1LZfLM3hymSgMbBh9DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716270998; c=relaxed/simple;
	bh=OZZ3S1Z3GnHJRxV/jPM320cD0GdMfzrOrQKyQZBTJAY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uUhJodubqpWnoxgp4aL38z6dhjUj3ZEQ+0SQATlxUJnkPn4/4sT8BBsIeJr/VSEDfcKbrCO6aB8zRbdDD332eaCzvw06jtoSFU8hJeLU/PDxW6TKjCJyWRKawSNv1nRJVBtpG/UWZodBsRKHev8dgJeALUpK+1bmVzlEgWS1BHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oIG12oEk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oIG12oEk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716270995; x=1747806995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OZZ3S1Z3GnHJRxV/jPM320cD0GdMfzrOrQKyQZBTJAY=;
  b=oIG12oEkSzhnlE97JybvzXH+du6RZM2F07WcpEYahgGRdP+jbfVOAHAY
   Bs5/9qyCkDmgmPoEy7YWXGriOdFqGZIeT9EgInv3iC0S8yuZVflU3PKao
   h0db0jODoCwmGg/D2IKvuqulLyA0+pbxqDNq+u1SybxFjPIQ+pc9UZ8Es
   qz6efa6lgjWpDtxqLRjFil0/QqGyblxfUas+QsyOqpq+yALUg+v4qG9GD
   q56YDeo2HxOLRB0xCKJnlwb1WQ+SNmdpDjOIHd7od/FYx5z+Oebsvm+af
   3z+J1zTFQ+QY8AxQPY7dv1d94+UrzHFJ0vr8ENUs1kp+S0XpPHbJPoaOZ
   g==;
X-CSE-ConnectionGUID: QjzgbM2dQPGstuAR7/Neww==
X-CSE-MsgGUID: v3S90/mfSOm2rzlgZZQvSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12623932"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="12623932"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 22:56:34 -0700
X-CSE-ConnectionGUID: 0+TvJQQtT8yg+fux5k4LDA==
X-CSE-MsgGUID: 71nnIZ6ERgKS8pyPvUKZgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="37560185"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 20 May 2024 22:56:34 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9IUB-0005x2-1M;
	Tue, 21 May 2024 05:56:31 +0000
Date: Tue, 21 May 2024 13:55:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 42/44]
 drivers/virt/gunyah/rsc_mgr.c:148: warning: Function parameter or member
 'adev' not described in 'gunyah_rm'
Message-ID: <202405211359.Qs6URgh1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   833aa73663421306198d4b3ea83ef44087c9fe19
commit: d96d06cd8636a6dff462afe06607473036967d1c [42/44] ANDROID: gunyah: Add support for Gunyah vendor modules
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240521/202405211359.Qs6URgh1-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fa9b1be45088dce1e4b602d451f118128b94237b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405211359.Qs6URgh1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405211359.Qs6URgh1-lkp@intel.com/

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
