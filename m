Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666B81624DF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 16:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765642502; cv=none; b=Sx/0LdzAzsanNIQc1scc5MrfyYcRItKsEaBJya3RbItsvlhmt/wTFNH6Uz9Vzp8Ar8yLCLJ5hkQvwN5cc8XG+UJuyndACnH2d94CsTt8n9LbefCGdJ71/QH85MbyyBvXWrgQrtPkuSVqu0m/RBKcE7z7EyfEygHjRiyOYdZWa9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765642502; c=relaxed/simple;
	bh=27psO2YQcpSVDKJs7e7ld6W9qTm95nbZaX25ikOwNoE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W/0KYjNWSTuZ1SI0AQiooyoV3sZmmZ+lU53218soptQTcbBnTmTJ9FDX0g+Xuc6yQ9A4K2PoKA8xykf9LXWNV3Qvrkr+2ln9UUjH1sybqLjqZjxsqdYiwuG+leDXLlyFSQRQBnKqevV/H1yJHl0BKSE1Kaih2BehYOjSiZ/0H6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jN97sVsQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jN97sVsQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765642501; x=1797178501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=27psO2YQcpSVDKJs7e7ld6W9qTm95nbZaX25ikOwNoE=;
  b=jN97sVsQS85EsHmiDX5lc3uKiv+/861t4zgTmYcSFBdx6auDZlxGU+hY
   mDZ1lVAnbKDiVldGPYg8QOZtQOcLwrkGF+JkPTTISu5oziY9vCnLLCZVR
   D1Uuyq62T5s4CB2V3lSqBLudHi/ms8Immb66JcvfBqTbQSCPwmflffB3x
   1HQMN28W94pTa9pm5sYYp8wBYBM5GHBOjv4lYL+4OAYAkU0rVlJn6dF/4
   mdCQNcYx4iLZr7r+Z4qTAo3SCxaP0k0dN8VsGhz8ASMy4hmvnOnwXN6o+
   +Y2JfWl2X9cVRR2CkIfxuaJ6nZ0WefHi6wFJgjdLMmJnZcQ6Q7elKoEer
   A==;
X-CSE-ConnectionGUID: beUsJaFHRbO2Fkcpnq/3qw==
X-CSE-MsgGUID: ZMhwnViSTXyUDTqTPTngXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67556153"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67556153"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 08:15:00 -0800
X-CSE-ConnectionGUID: jeAI1DvZQNe7N3Qg6toySg==
X-CSE-MsgGUID: h4iF9kPUTu+ABfdylTquDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="196952017"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Dec 2025 08:14:59 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUSGm-000000007so-2znT;
	Sat, 13 Dec 2025 16:14:56 +0000
Date: Sun, 14 Dec 2025 00:14:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 18/18]
 drivers/virt/gunyah/rsc_mgr.c:148: warning: Function parameter or struct
 member 'adev' not described in 'gunyah_rm'
Message-ID: <202512140037.Bww35WhB-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   da2da0badf05a4631edf06f9a37e822b20875663
commit: 8c11dcc79b79d48d00d84d14ccdd9132dac08176 [18/18] ANDROID: gunyah: Add support for Gunyah vendor modules
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251214/202512140037.Bww35WhB-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140037.Bww35WhB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140037.Bww35WhB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/virt/gunyah/rsc_mgr.c:112: warning: Excess struct member 'ret' description in 'gunyah_rm_message'
>> drivers/virt/gunyah/rsc_mgr.c:148: warning: Function parameter or struct member 'adev' not described in 'gunyah_rm'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +148 drivers/virt/gunyah/rsc_mgr.c

4c11c572f413d0 Elliot Berman 2024-02-22  113  
4c11c572f413d0 Elliot Berman 2024-02-22  114  /**
4c11c572f413d0 Elliot Berman 2024-02-22  115   * struct gunyah_rm - private data for communicating w/Gunyah resource manager
4c11c572f413d0 Elliot Berman 2024-02-22  116   * @dev: pointer to RM platform device
4c11c572f413d0 Elliot Berman 2024-02-22  117   * @tx_ghrsc: message queue resource to TX to RM
4c11c572f413d0 Elliot Berman 2024-02-22  118   * @rx_ghrsc: message queue resource to RX from RM
4c11c572f413d0 Elliot Berman 2024-02-22  119   * @active_rx_message: ongoing gunyah_rm_message for which we're receiving fragments
4c11c572f413d0 Elliot Berman 2024-02-22  120   * @call_xarray: xarray to allocate & lookup sequence IDs for Request/Response flows
4c11c572f413d0 Elliot Berman 2024-02-22  121   * @next_seq: next ID to allocate (for xa_alloc_cyclic)
4c11c572f413d0 Elliot Berman 2024-02-22  122   * @recv_msg: cached allocation for Rx messages
4c11c572f413d0 Elliot Berman 2024-02-22  123   * @send_msg: cached allocation for Tx messages. Must hold @send_lock to manipulate.
4c11c572f413d0 Elliot Berman 2024-02-22  124   * @send_lock: synchronization to allow only one request to be sent at a time
4c11c572f413d0 Elliot Berman 2024-02-22  125   * @send_ready: completed when we know Tx message queue can take more messages
4c11c572f413d0 Elliot Berman 2024-02-22  126   * @nh: notifier chain for clients interested in RM notification messages
b387fa408e4054 Elliot Berman 2024-02-22  127   * @miscdev: /dev/gunyah
9281f214814eb6 Elliot Berman 2024-02-22  128   * @parent_fwnode: Parent IRQ fwnode to translate Gunyah hwirqs to Linux irqs
4c11c572f413d0 Elliot Berman 2024-02-22  129   */
4c11c572f413d0 Elliot Berman 2024-02-22  130  struct gunyah_rm {
4c11c572f413d0 Elliot Berman 2024-02-22  131  	struct device *dev;
4c11c572f413d0 Elliot Berman 2024-02-22  132  	struct gunyah_resource tx_ghrsc;
4c11c572f413d0 Elliot Berman 2024-02-22  133  	struct gunyah_resource rx_ghrsc;
4c11c572f413d0 Elliot Berman 2024-02-22  134  	struct gunyah_rm_message *active_rx_message;
4c11c572f413d0 Elliot Berman 2024-02-22  135  
4c11c572f413d0 Elliot Berman 2024-02-22  136  	struct xarray call_xarray;
4c11c572f413d0 Elliot Berman 2024-02-22  137  	u32 next_seq;
4c11c572f413d0 Elliot Berman 2024-02-22  138  
4c11c572f413d0 Elliot Berman 2024-02-22  139  	unsigned char recv_msg[GUNYAH_RM_MSGQ_MSG_SIZE];
4c11c572f413d0 Elliot Berman 2024-02-22  140  	unsigned char send_msg[GUNYAH_RM_MSGQ_MSG_SIZE];
4c11c572f413d0 Elliot Berman 2024-02-22  141  	struct mutex send_lock;
4c11c572f413d0 Elliot Berman 2024-02-22  142  	struct completion send_ready;
4c11c572f413d0 Elliot Berman 2024-02-22  143  	struct blocking_notifier_head nh;
b387fa408e4054 Elliot Berman 2024-02-22  144  
8c11dcc79b79d4 Sreenad Menon 2024-05-02  145  	struct auxiliary_device adev;
b387fa408e4054 Elliot Berman 2024-02-22  146  	struct miscdevice miscdev;
9281f214814eb6 Elliot Berman 2024-02-22  147  	struct fwnode_handle *parent_fwnode;
4c11c572f413d0 Elliot Berman 2024-02-22 @148  };
4c11c572f413d0 Elliot Berman 2024-02-22  149  

:::::: The code at line 148 was first introduced by commit
:::::: 4c11c572f413d00b06538a5b8c1ab6c5267232ea FROMLIST: gunyah: rsc_mgr: Add resource manager RPC core

:::::: TO: Elliot Berman <quic_eberman@quicinc.com>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
