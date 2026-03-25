Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379A23976A2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 10:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774434383; cv=none; b=Rt+l1JdepopDWFeDisSeZjNgPYq4yOldoITiiFprnGE8WPk7PISeA0WEN+tcMtvO6Vkzt2cnuTw2jgUcpHG+FKlX3hjQJaWrktEftXhWASHQQYC2xrqncEpUr8SHC8MRDX4xBjjkXKf3GmA/MyUa4tu8Wuwolmmyh+i0WfVWXSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774434383; c=relaxed/simple;
	bh=eSQoXGg8XHxhOenRUCmlgfcq6Mbr9yZsvCZuomz8OhQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gTKK1oEfy76o9dc3DbDlo4dLSvCrYnRi52wWEZ67kFYjVjau2qaJEwKnaZC9+OTHqxvf15LNZf7Jn5NPC8xvAxcaJb8WH9OVW3VZj/4qcDL5K3KLrNiae6I54HNR3fxw8iITfkRmAr3y10L/d30COJGLLaStMXVhVGxtC4GOpxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZSSXQHfO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSSXQHfO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774434380; x=1805970380;
  h=date:from:to:cc:subject:message-id;
  bh=eSQoXGg8XHxhOenRUCmlgfcq6Mbr9yZsvCZuomz8OhQ=;
  b=ZSSXQHfOazM2WbuKEKi8dWWY0Euq/jgsn+CZ1eVA12ScJotZxeRCXKUo
   si/NhNvJV6Hnp+22moi+tykkdtEdsx1rYuNNY5+gDt9qCaKtOwX9n+6i+
   s/D2GTbcg71dMIIoUs9uhehqdfi0y5xXX/VjIISBVmuAVi6JR8J9TJYrC
   8BBFJ/RJlBExW1GWLyRuzGYhkuzBYCpODfPA94rTUJDB0eEU277OiaKSw
   4PtyUDlrOPIP4N2CliV8f2nGiM+0LTJcEgd9SPT9p3gCcv1hf+Kjn2ojQ
   CV0ZqhdMrpf2e/UAPnq7C7SCNMdL1MXlKB57tz7O0cXaGbhGJ7btRbfvp
   g==;
X-CSE-ConnectionGUID: D0TBtTKTTteWEtto7QmL3g==
X-CSE-MsgGUID: a0Jf9zaNSce/OryKfFRX0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86544948"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="86544948"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:26:20 -0700
X-CSE-ConnectionGUID: ORUxYG5mTtaOi4/qQNpyDw==
X-CSE-MsgGUID: 2U4Lxb4rSOiSW7cwm0aUWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="226277110"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Mar 2026 03:26:19 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5LRI-000000006dR-3WHf;
	Wed, 25 Mar 2026 10:26:16 +0000
Date: Wed, 25 Mar 2026 18:25:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 drivers/virt/gunyah/rsc_mgr.c:148: warning: Function parameter or member
 'adev' not described in 'gunyah_rm'
Message-ID: <202603251837.CW21Im0X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sreenad,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   36e33448be90aea3d2e98da271b35aac511b8dc6
commit: d96d06cd8636a6dff462afe06607473036967d1c [1/1] ANDROID: gunyah: Add support for Gunyah vendor modules
config: arm64-randconfig-r054-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251837.CW21Im0X-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251837.CW21Im0X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251837.CW21Im0X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/gunyah/rsc_mgr.c:148: warning: Function parameter or member 'adev' not described in 'gunyah_rm'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]


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
