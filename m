Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EB033DED9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 19:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774555147; cv=none; b=XHE0ReZCf+/p2AceM4BllG0C2tKcj00HYIvK6QuO2JFBG0oZmwaQeTbh2BBc+xYpab4qBN7leE+sXq3HSEHIsnf03jJD/3z+wUUPPxD3UJTzdrccMBsXYOMm18VMGXAyTkhsJLPSp1Y3+SJF9mmhXL7lrUkg2wLjnuPa0WdL9s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774555147; c=relaxed/simple;
	bh=lIH7vk8g5jbkR4Ot58n8AKU3NA3AI4lSPNiCj4nDubI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hf6RzSH5SJkTyFS/skthuq8zodR/QbkCQv2SrTgw8Faf2Y93UHxzuJ4hLSLBvukK48jHIc9RuuoFcfJrcLUbN4X/BMPK7MwH7tp8FW7tBapGkOq5EbGziK645+ZWydq8fsZt/pYEll0rHnr1MmRhHd+QZnBgdo2VR/ykuVatlPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q/Iy7W8I; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q/Iy7W8I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774555144; x=1806091144;
  h=date:from:to:cc:subject:message-id;
  bh=lIH7vk8g5jbkR4Ot58n8AKU3NA3AI4lSPNiCj4nDubI=;
  b=Q/Iy7W8IVqHX9YpAnmqGspamOGE4zNLuI77xfB/SK6FbimBNc+UlTv4U
   dXuZH4Epgjox+VJ/gTUTqWYDiLefM3olHDC91csroZiYkTwsz0pB05uGo
   9IkDrqcnH7ZOnYd0nuThiu6lv+yBmmKMVAMhwn916ggKXMY5gamD/APib
   QEno6eriO4++4Kwkyd5P3CmBs6EwpLyAQfPAUnMlxWMXITN0c54pBPH4k
   6oYQuqREac0553zk04SoWsMYDz0DilMmILOGompH6peuJoisCascfUHB1
   YrswZTIhGP8jKYmJdAtveGJFDBLyFWlBQL6T4bTZs1TJNH/VX4rGAur5a
   g==;
X-CSE-ConnectionGUID: v/KMl+CDQHiwF8g9oh/srg==
X-CSE-MsgGUID: emiVbbMdSF+hYXUwrQ2CaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="78223453"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="78223453"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 12:59:02 -0700
X-CSE-ConnectionGUID: G9BwAr4NQoeDEmVg3NlqHQ==
X-CSE-MsgGUID: /u4BJ6fBS2S6DCdlkmApZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="263017289"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Mar 2026 12:59:00 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5qr4-000000009IZ-0eSr;
	Thu, 26 Mar 2026 19:58:58 +0000
Date: Fri, 27 Mar 2026 03:58:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/virt/gunyah/rsc_mgr.c:148: warning: Function parameter or struct
 member 'adev' not described in 'gunyah_rm'
Message-ID: <202603270323.f8uhzYOJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sreenad,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   d73a8ddf419e5ee819fff624cf35bfedd85b5609
commit: 8c11dcc79b79d48d00d84d14ccdd9132dac08176 [1/1] ANDROID: gunyah: Add support for Gunyah vendor modules
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260327/202603270323.f8uhzYOJ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603270323.f8uhzYOJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603270323.f8uhzYOJ-lkp@intel.com/

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

4c11c572f413d0 Elliot Berman 2024-02-22   80  
4c11c572f413d0 Elliot Berman 2024-02-22   81  /**
4c11c572f413d0 Elliot Berman 2024-02-22   82   * struct gunyah_rm_message - Represents a complete message from resource manager
4c11c572f413d0 Elliot Berman 2024-02-22   83   * @payload: Combined payload of all the fragments (msg headers stripped off).
4c11c572f413d0 Elliot Berman 2024-02-22   84   * @size: Size of the payload received so far.
4c11c572f413d0 Elliot Berman 2024-02-22   85   * @msg_id: Message ID from the header.
4c11c572f413d0 Elliot Berman 2024-02-22   86   * @type: RM_RPC_TYPE_REPLY or RM_RPC_TYPE_NOTIF.
4c11c572f413d0 Elliot Berman 2024-02-22   87   * @num_fragments: total number of fragments expected to be received.
4c11c572f413d0 Elliot Berman 2024-02-22   88   * @fragments_received: fragments received so far.
4c11c572f413d0 Elliot Berman 2024-02-22   89   * @reply: Fields used for request/reply sequences
4c11c572f413d0 Elliot Berman 2024-02-22   90   */
4c11c572f413d0 Elliot Berman 2024-02-22   91  struct gunyah_rm_message {
4c11c572f413d0 Elliot Berman 2024-02-22   92  	void *payload;
4c11c572f413d0 Elliot Berman 2024-02-22   93  	size_t size;
4c11c572f413d0 Elliot Berman 2024-02-22   94  	u32 msg_id;
4c11c572f413d0 Elliot Berman 2024-02-22   95  	u8 type;
4c11c572f413d0 Elliot Berman 2024-02-22   96  
4c11c572f413d0 Elliot Berman 2024-02-22   97  	u8 num_fragments;
4c11c572f413d0 Elliot Berman 2024-02-22   98  	u8 fragments_received;
4c11c572f413d0 Elliot Berman 2024-02-22   99  
4c11c572f413d0 Elliot Berman 2024-02-22  100  	/**
4c11c572f413d0 Elliot Berman 2024-02-22  101  	 * @ret: Linux return code, there was an error processing message
4c11c572f413d0 Elliot Berman 2024-02-22  102  	 * @seq: Sequence ID for the main message.
4c11c572f413d0 Elliot Berman 2024-02-22  103  	 * @rm_error: For request/reply sequences with standard replies
4c11c572f413d0 Elliot Berman 2024-02-22  104  	 * @seq_done: Signals caller that the RM reply has been received
4c11c572f413d0 Elliot Berman 2024-02-22  105  	 */
4c11c572f413d0 Elliot Berman 2024-02-22  106  	struct {
4c11c572f413d0 Elliot Berman 2024-02-22  107  		int ret;
4c11c572f413d0 Elliot Berman 2024-02-22  108  		u16 seq;
4c11c572f413d0 Elliot Berman 2024-02-22  109  		enum gunyah_rm_error rm_error;
4c11c572f413d0 Elliot Berman 2024-02-22  110  		struct completion seq_done;
4c11c572f413d0 Elliot Berman 2024-02-22  111  	} reply;
4c11c572f413d0 Elliot Berman 2024-02-22 @112  };
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
