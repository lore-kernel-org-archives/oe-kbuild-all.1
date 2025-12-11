Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D0982899
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 04:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765427795; cv=none; b=iRWU36/TEealgBG+P8B9hYmPPQL4gX8q8YA7ZrjQZ4A5h9+7qpmXhMbs79elvqMi6t+Fke9RznwnnZT1zPeAZ3SVnK8c5QSZdIpqHhO6XOXnZx9pSXTP77p629uLUUlhe7bLKa6uDPSfJ/d/nvu1aUNEbTuMaa54lTTKbGG8lL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765427795; c=relaxed/simple;
	bh=O3u6V86vgh0ds1903CPtnBdqCIrrAGllbBjpETG/JF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TjhlHgDQZAVfGGrVhPLCIro909Be9YxTUaYvNilgCFakdDvufEkVnKCdAs9c0jUEKWF9uK+GuzxzJIuHoDAJYpPbzJgD72k9LKUCJ2SGt2UYjR8S4oGOYTYzIjC5LINl9klRtPsHFIlNh2bYqj0LKkCepBK8fB33dyI4OY2Z28A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hg2K2Ph7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hg2K2Ph7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765427795; x=1796963795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O3u6V86vgh0ds1903CPtnBdqCIrrAGllbBjpETG/JF4=;
  b=hg2K2Ph7fq5iPh6A7FsZFW6cJaQEJ6M5TEWbjh3HqJ0WapEN0xcv2R9O
   yJBDU24bfwFrkjqSwJVSvMKDL6qZyFbvU4st/tYO666lX+Xulpb0TX5T0
   PsFNACbSsbLxdx1PecR/007bHgAvPMxuiZQ8WNtZ11tRDfm4H9h0M0TOJ
   mz0m38Nl5rR/UWK8qTCLn8uvZgLkzvCT+Gsip4qWiWXges1npoXX2tC9u
   l4GgwqfMXDIKoJyghfFT9j7JuZ/SUDV8Kw3tKFrimJLou3Usj8LR3AHVa
   4ANzG1ZuM7sBYABn9sxRhRfJI37pPWNAptdzzeE0DERvGHqz6LsvLJXPH
   g==;
X-CSE-ConnectionGUID: 8ZtOSHrNSS2YM/6EcsGh9A==
X-CSE-MsgGUID: cUcUTgoISKi0zqtuO61wIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78518724"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78518724"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 20:36:34 -0800
X-CSE-ConnectionGUID: NF3Z4lxkTS2h5Z4oE6eaTQ==
X-CSE-MsgGUID: /XHVhPQcQ0GFMOmDFdecAw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Dec 2025 20:36:33 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTYPm-0000000049V-2nxu;
	Thu, 11 Dec 2025 04:36:30 +0000
Date: Thu, 11 Dec 2025 12:35:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 3/3]
 drivers/virt/gunyah/rsc_mgr.c:162: warning: Function parameter or struct
 member 'pm_nb' not described in 'gunyah_rm'
Message-ID: <202512111248.jbyj7uHb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   405ed60b15acc04aab6cd29b7850c168bb02aa7e
commit: 7d9fe864dc6289d8c10246453b0c7d3cb3f983f6 [3/3] ANDROID: virt: gunyah: Fetch fresh Gunyah information after restore
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251211/202512111248.jbyj7uHb-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111248.jbyj7uHb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111248.jbyj7uHb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/virt/gunyah/rsc_mgr.c:126: warning: Excess struct member 'ret' description in 'gunyah_rm_message'
   drivers/virt/gunyah/rsc_mgr.c:162: warning: Function parameter or struct member 'adev' not described in 'gunyah_rm'
>> drivers/virt/gunyah/rsc_mgr.c:162: warning: Function parameter or struct member 'pm_nb' not described in 'gunyah_rm'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +162 drivers/virt/gunyah/rsc_mgr.c

4c11c572f413d0 Elliot Berman   2024-02-22  127  
4c11c572f413d0 Elliot Berman   2024-02-22  128  /**
4c11c572f413d0 Elliot Berman   2024-02-22  129   * struct gunyah_rm - private data for communicating w/Gunyah resource manager
4c11c572f413d0 Elliot Berman   2024-02-22  130   * @tx_ghrsc: message queue resource to TX to RM
4c11c572f413d0 Elliot Berman   2024-02-22  131   * @rx_ghrsc: message queue resource to RX from RM
4c11c572f413d0 Elliot Berman   2024-02-22  132   * @active_rx_message: ongoing gunyah_rm_message for which we're receiving fragments
4c11c572f413d0 Elliot Berman   2024-02-22  133   * @call_xarray: xarray to allocate & lookup sequence IDs for Request/Response flows
4c11c572f413d0 Elliot Berman   2024-02-22  134   * @next_seq: next ID to allocate (for xa_alloc_cyclic)
4c11c572f413d0 Elliot Berman   2024-02-22  135   * @recv_msg: cached allocation for Rx messages
4c11c572f413d0 Elliot Berman   2024-02-22  136   * @send_msg: cached allocation for Tx messages. Must hold @send_lock to manipulate.
4c11c572f413d0 Elliot Berman   2024-02-22  137   * @send_lock: synchronization to allow only one request to be sent at a time
4c11c572f413d0 Elliot Berman   2024-02-22  138   * @send_ready: completed when we know Tx message queue can take more messages
4c11c572f413d0 Elliot Berman   2024-02-22  139   * @nh: notifier chain for clients interested in RM notification messages
b387fa408e4054 Elliot Berman   2024-02-22  140   * @miscdev: /dev/gunyah
9281f214814eb6 Elliot Berman   2024-02-22  141   * @parent_fwnode: Parent IRQ fwnode to translate Gunyah hwirqs to Linux irqs
4c11c572f413d0 Elliot Berman   2024-02-22  142   */
4c11c572f413d0 Elliot Berman   2024-02-22  143  struct gunyah_rm {
4c11c572f413d0 Elliot Berman   2024-02-22  144  	struct gunyah_resource tx_ghrsc;
4c11c572f413d0 Elliot Berman   2024-02-22  145  	struct gunyah_resource rx_ghrsc;
4c11c572f413d0 Elliot Berman   2024-02-22  146  	struct gunyah_rm_message *active_rx_message;
4c11c572f413d0 Elliot Berman   2024-02-22  147  
4c11c572f413d0 Elliot Berman   2024-02-22  148  	struct xarray call_xarray;
4c11c572f413d0 Elliot Berman   2024-02-22  149  	u32 next_seq;
4c11c572f413d0 Elliot Berman   2024-02-22  150  
4c11c572f413d0 Elliot Berman   2024-02-22  151  	unsigned char recv_msg[GUNYAH_RM_MSGQ_MSG_SIZE];
4c11c572f413d0 Elliot Berman   2024-02-22  152  	unsigned char send_msg[GUNYAH_RM_MSGQ_MSG_SIZE];
4c11c572f413d0 Elliot Berman   2024-02-22  153  	struct mutex send_lock;
4c11c572f413d0 Elliot Berman   2024-02-22  154  	struct completion send_ready;
4c11c572f413d0 Elliot Berman   2024-02-22  155  	struct blocking_notifier_head nh;
b387fa408e4054 Elliot Berman   2024-02-22  156  
8c11dcc79b79d4 Sreenad Menon   2024-05-02  157  	struct auxiliary_device adev;
b387fa408e4054 Elliot Berman   2024-02-22  158  	struct miscdevice miscdev;
9281f214814eb6 Elliot Berman   2024-02-22  159  	struct fwnode_handle *parent_fwnode;
7d9fe864dc6289 Hrishabh Rajput 2025-08-13  160  
7d9fe864dc6289 Hrishabh Rajput 2025-08-13  161  	struct notifier_block pm_nb;
4c11c572f413d0 Elliot Berman   2024-02-22 @162  };
4c11c572f413d0 Elliot Berman   2024-02-22  163  

:::::: The code at line 162 was first introduced by commit
:::::: 4c11c572f413d00b06538a5b8c1ab6c5267232ea FROMLIST: gunyah: rsc_mgr: Add resource manager RPC core

:::::: TO: Elliot Berman <quic_eberman@quicinc.com>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
