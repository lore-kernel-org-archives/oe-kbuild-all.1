Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74B83BC680
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 13:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357517; cv=none; b=mLcVu/f9ey8fgjbEmE7fVFIOLooff6n3GXWMge6p0vcCDztZyr0y15uBiShUzZyRj/RJ0KHJqTrtoMNwk+GvBB1QMGswykJAlafx8j0FqnKGf//CpcuUS5uvIyT/O1bNMnBDz4MnjN17R7A5LpvaD+RyDufJbsh027QmwueGa9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357517; c=relaxed/simple;
	bh=U+EVYy/nC6iK++7lfrJUfFtHGWFIORftXfy2rBb7ybo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ibr9/Tblp61/VA84oVMxQ9NRt8MuZg+VNN2DUrYN1WTb4HgFortenZ9bg10QxX0cXWxcoWIcGEmSPIG26mpVzpdTdpvTvIbeHxi6GZPZ3bcsEIdbuKNPIXMPZg+CNu4XqkWr/YlHJ72uUugnWj4xZZZN2/hnO7iJ92ob8Gk2zok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hj4eoz03; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hj4eoz03"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774357516; x=1805893516;
  h=date:from:to:cc:subject:message-id;
  bh=U+EVYy/nC6iK++7lfrJUfFtHGWFIORftXfy2rBb7ybo=;
  b=Hj4eoz0355ccNmXYX9hwAT/7bHkxuuiz5RW9g/9XMXvGM/qmwmPOYEmq
   4jZX3QtceuZguOccQc+sS5b0mLuVRh2OuwgCDCOo7VDRWIBk351FhfioK
   gw9mV7dE3ZtW/3uTurImxt2s7wI05C8YVMAzlr3TAH0AXsTKXtteTxFta
   be27nL0pyL1OkMUPBDFSgIbMaFOxAcOganfoB/8+bJ3GqWvruO7vBiIql
   XUaKKYOtgtczlcykV6qZBLsVRuM7lRV4IjL1u6+SDgJNk2m/81FrM7Fg+
   8d2gyZvizLPsrJq90ahP7F53f+3+PIsi3NBxoXQKDyliH8iOT2aDYBCSp
   w==;
X-CSE-ConnectionGUID: MjgPt70nSumHWjVACM7ZnQ==
X-CSE-MsgGUID: cAopgMh5SGWY5f3QFjRsYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="77975393"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="77975393"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 06:05:14 -0700
X-CSE-ConnectionGUID: ebhJKdNqSHKhuLXMW/pbkw==
X-CSE-MsgGUID: aKldYKZORm2oX8i8LtDOOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="229095423"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Mar 2026 06:05:12 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w51RV-000000004ah-2MVy;
	Tue, 24 Mar 2026 13:05:09 +0000
Date: Tue, 24 Mar 2026 21:04:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 36/36]
 drivers/virt/gunyah/rsc_mgr.c:162: warning: Function parameter or struct
 member 'pm_nb' not described in 'gunyah_rm'
Message-ID: <202603242012.8jAkuvin-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Hrishabh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2d13a0e00b4d9cf3601b0e0d2c1838ec962f4e88
commit: 7d9fe864dc6289d8c10246453b0c7d3cb3f983f6 [36/36] ANDROID: virt: gunyah: Fetch fresh Gunyah information after restore
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260324/202603242012.8jAkuvin-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603242012.8jAkuvin-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603242012.8jAkuvin-lkp@intel.com/

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

4c11c572f413d00 Elliot Berman   2024-02-22  127  
4c11c572f413d00 Elliot Berman   2024-02-22  128  /**
4c11c572f413d00 Elliot Berman   2024-02-22  129   * struct gunyah_rm - private data for communicating w/Gunyah resource manager
4c11c572f413d00 Elliot Berman   2024-02-22  130   * @tx_ghrsc: message queue resource to TX to RM
4c11c572f413d00 Elliot Berman   2024-02-22  131   * @rx_ghrsc: message queue resource to RX from RM
4c11c572f413d00 Elliot Berman   2024-02-22  132   * @active_rx_message: ongoing gunyah_rm_message for which we're receiving fragments
4c11c572f413d00 Elliot Berman   2024-02-22  133   * @call_xarray: xarray to allocate & lookup sequence IDs for Request/Response flows
4c11c572f413d00 Elliot Berman   2024-02-22  134   * @next_seq: next ID to allocate (for xa_alloc_cyclic)
4c11c572f413d00 Elliot Berman   2024-02-22  135   * @recv_msg: cached allocation for Rx messages
4c11c572f413d00 Elliot Berman   2024-02-22  136   * @send_msg: cached allocation for Tx messages. Must hold @send_lock to manipulate.
4c11c572f413d00 Elliot Berman   2024-02-22  137   * @send_lock: synchronization to allow only one request to be sent at a time
4c11c572f413d00 Elliot Berman   2024-02-22  138   * @send_ready: completed when we know Tx message queue can take more messages
4c11c572f413d00 Elliot Berman   2024-02-22  139   * @nh: notifier chain for clients interested in RM notification messages
b387fa408e4054a Elliot Berman   2024-02-22  140   * @miscdev: /dev/gunyah
9281f214814eb6f Elliot Berman   2024-02-22  141   * @parent_fwnode: Parent IRQ fwnode to translate Gunyah hwirqs to Linux irqs
4c11c572f413d00 Elliot Berman   2024-02-22  142   */
4c11c572f413d00 Elliot Berman   2024-02-22  143  struct gunyah_rm {
4c11c572f413d00 Elliot Berman   2024-02-22  144  	struct gunyah_resource tx_ghrsc;
4c11c572f413d00 Elliot Berman   2024-02-22  145  	struct gunyah_resource rx_ghrsc;
4c11c572f413d00 Elliot Berman   2024-02-22  146  	struct gunyah_rm_message *active_rx_message;
4c11c572f413d00 Elliot Berman   2024-02-22  147  
4c11c572f413d00 Elliot Berman   2024-02-22  148  	struct xarray call_xarray;
4c11c572f413d00 Elliot Berman   2024-02-22  149  	u32 next_seq;
4c11c572f413d00 Elliot Berman   2024-02-22  150  
4c11c572f413d00 Elliot Berman   2024-02-22  151  	unsigned char recv_msg[GUNYAH_RM_MSGQ_MSG_SIZE];
4c11c572f413d00 Elliot Berman   2024-02-22  152  	unsigned char send_msg[GUNYAH_RM_MSGQ_MSG_SIZE];
4c11c572f413d00 Elliot Berman   2024-02-22  153  	struct mutex send_lock;
4c11c572f413d00 Elliot Berman   2024-02-22  154  	struct completion send_ready;
4c11c572f413d00 Elliot Berman   2024-02-22  155  	struct blocking_notifier_head nh;
b387fa408e4054a Elliot Berman   2024-02-22  156  
8c11dcc79b79d48 Sreenad Menon   2024-05-02  157  	struct auxiliary_device adev;
b387fa408e4054a Elliot Berman   2024-02-22  158  	struct miscdevice miscdev;
9281f214814eb6f Elliot Berman   2024-02-22  159  	struct fwnode_handle *parent_fwnode;
7d9fe864dc6289d Hrishabh Rajput 2025-08-13  160  
7d9fe864dc6289d Hrishabh Rajput 2025-08-13  161  	struct notifier_block pm_nb;
4c11c572f413d00 Elliot Berman   2024-02-22 @162  };
4c11c572f413d00 Elliot Berman   2024-02-22  163  

:::::: The code at line 162 was first introduced by commit
:::::: 4c11c572f413d00b06538a5b8c1ab6c5267232ea FROMLIST: gunyah: rsc_mgr: Add resource manager RPC core

:::::: TO: Elliot Berman <quic_eberman@quicinc.com>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
