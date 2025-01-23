Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6FD3DBB6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 21:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737667164; cv=none; b=LJXUPOeTPBHHThNa/DRhlPCO96PQn2LOmYrm8rpS9nLxrcwD6DheV8UhNgqMoTRvNn3rFN325K1WR2m1QqA/V6vlGCPtxkgLvZMehctZsNIiljlQ4riSfVUcNlfQy2ir3/eCtptIqSkx1kP4WaFYPPAmTY3qig7ki4RqXCR2/GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737667164; c=relaxed/simple;
	bh=h4EGFy6xhHtJDa8PmDoWE0qVmcNu1JQtecYCzbjd2PY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g2ersXUvN1R765B2mQG3tZsTZKfm3qNeGVgh3RqJ9GzePNbb4ZRmq0CYzdwkBjbCKWt038ioXwRXGa0KOpW1Z4w0WF/+oVfJXI2ycnwFOQUXcv1Z2i8GhABIZQX2zv+SZDzCXLCdUw4315Qm6upYjY/5PCwy9tkhCGY1OOXSX2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vsiua9E1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vsiua9E1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737667163; x=1769203163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h4EGFy6xhHtJDa8PmDoWE0qVmcNu1JQtecYCzbjd2PY=;
  b=Vsiua9E1/kF/0CiIAWZWjRVkFaAybBRkV9Pex4tK/4zRyynXfM4fGe4s
   XBY6jyBkeQrUju1OnAybTHlNaBl0AsDKcnQnSiOXIm2v1pM/U5bh6wjOh
   OLuQbdMqlmPLWWZnvF8xgVO4BSDoI+EsfAm7GfwPHXR/kl9QHrI+irly7
   0mykRjlgobR5S2hBL+YUb44p8qHQ4IT5Ojtzw61b9Cacv6ohqINGZghrG
   rVLpaFGnvDGd6bnPMd+oGhSxGHVnRjAsKIHy+c56DuIdynoRhff2gCKZj
   W0Kr6fmNK8/SE7qs1bqeHSD+qaJJuMpfJ6XSons0kjwu0NhPMnOsZ6NJJ
   w==;
X-CSE-ConnectionGUID: MiFjA4bVT1i7ibXMwWk7fg==
X-CSE-MsgGUID: /MmfHhtpSMC66Hg6PY/lrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49613324"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49613324"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 13:19:21 -0800
X-CSE-ConnectionGUID: XlelEY3MTzKGprcj7QKm6g==
X-CSE-MsgGUID: vRmkymzLTgWUFoG8tX9OAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108014755"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Jan 2025 13:19:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb4bd-000bil-1P;
	Thu, 23 Jan 2025 21:19:17 +0000
Date: Fri, 24 Jan 2025 05:18:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 drivers/virt/gunyah/rsc_mgr.c:148: warning: Function parameter or struct
 member 'adev' not described in 'gunyah_rm'
Message-ID: <202501240518.5anqZJzl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   a84c03887e4c9929136cc9493017503dd96087e3
commit: 8c11dcc79b79d48d00d84d14ccdd9132dac08176 [1/1] ANDROID: gunyah: Add support for Gunyah vendor modules
config: arm64-randconfig-003-20250124 (https://download.01.org/0day-ci/archive/20250124/202501240518.5anqZJzl-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240518.5anqZJzl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240518.5anqZJzl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/virt/gunyah/rsc_mgr.c:112: warning: Excess struct member 'ret' description in 'gunyah_rm_message'
>> drivers/virt/gunyah/rsc_mgr.c:148: warning: Function parameter or struct member 'adev' not described in 'gunyah_rm'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]


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
