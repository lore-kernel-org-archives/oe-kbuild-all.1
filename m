Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336E019066D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 19:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737661811; cv=none; b=DB6e1J5uNj9YnYjsupduKVMOKQIi6neMP8vO/KCz5Sa7rGnHiFRZV6f51BGRNAiA5oLo4KwzJSV48afw6F2jbV63g2C//+nJCvffvX1mymX1/IhNlgH0w8GBBua1CHob9ywKFbyBzGfN1ZKYNKx5vQISa0NAelRN+2BwSfAg6oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737661811; c=relaxed/simple;
	bh=yUpR1mlwoaRoPibbGWszSH6vd2NhgC9gB1PnOJHXU8c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PWeC+xH3fxVIYfrMwmeV6N8qz8SDBDfKiNl6vrmlr43M2NYKnxZOa8sdN722BKoGuTHGRU8Qm7Gd9l1iV1gRSPBvuxv6eQiQuXmc2ajzS7RYtGJk/J6TEEgHiry0aFyFl2UIClwR2IuPJVkubaC+d7TwXpHGVWY88mHV37jeGtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LR5ONIc4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LR5ONIc4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737661809; x=1769197809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yUpR1mlwoaRoPibbGWszSH6vd2NhgC9gB1PnOJHXU8c=;
  b=LR5ONIc4P28d8MDbwtOknbzoFgEWq+cu10Y828gv9Vzv24R3vqcM3Zq3
   cioeulbDhQfyULiV7dR9oskcIZpbwi5cBklGUGoNQKVUWUbSb0PNZyHQ/
   MqMWEq1hdeABrFvUWQ2e7Z3xs7vjoh5eVV71yXpfaGqKpmA0CgkJroNad
   gx3/0PGpYjUnszePomtMsjEftDlx62q+3dcL9FaIePAcXcfesk3wUczoQ
   o9UYi9VGHEIYVlqf3pdT/H3erd7/+m3zj6yisEhim+v1HS02WfBNr6+2s
   p3vvElWhFWTfp+o38EGPCo2f2sNK3FOYiRoaxN9dqTPrAXzXnUsJCOaZ3
   w==;
X-CSE-ConnectionGUID: ryGhLv7MQLi+dz+A1mJenw==
X-CSE-MsgGUID: BC4Rm1SfSHKjCNORDPh3AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="55596856"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="55596856"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 11:50:08 -0800
X-CSE-ConnectionGUID: p8I5wnV0Q6+/djY2Cpn9Qw==
X-CSE-MsgGUID: anxwZp0qRQG2o5otZ2e4RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144803889"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Jan 2025 11:50:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb3DJ-000bbW-1M;
	Thu, 23 Jan 2025 19:50:05 +0000
Date: Fri, 24 Jan 2025 03:49:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 drivers/virt/gunyah/rsc_mgr.c:106: warning: Excess struct member 'ret'
 description in 'gunyah_rm_message'
Message-ID: <202501240305.5w94dyyE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   4bfb357e381f9442b97ecfe70c9013617dceaefc
commit: 4c11c572f413d00b06538a5b8c1ab6c5267232ea [1/1] FROMLIST: gunyah: rsc_mgr: Add resource manager RPC core
config: arm64-randconfig-003-20250124 (https://download.01.org/0day-ci/archive/20250124/202501240305.5w94dyyE-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240305.5w94dyyE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240305.5w94dyyE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/gunyah/rsc_mgr.c:106: warning: Excess struct member 'ret' description in 'gunyah_rm_message'

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


vim +106 drivers/virt/gunyah/rsc_mgr.c

    74	
    75	/**
    76	 * struct gunyah_rm_message - Represents a complete message from resource manager
    77	 * @payload: Combined payload of all the fragments (msg headers stripped off).
    78	 * @size: Size of the payload received so far.
    79	 * @msg_id: Message ID from the header.
    80	 * @type: RM_RPC_TYPE_REPLY or RM_RPC_TYPE_NOTIF.
    81	 * @num_fragments: total number of fragments expected to be received.
    82	 * @fragments_received: fragments received so far.
    83	 * @reply: Fields used for request/reply sequences
    84	 */
    85	struct gunyah_rm_message {
    86		void *payload;
    87		size_t size;
    88		u32 msg_id;
    89		u8 type;
    90	
    91		u8 num_fragments;
    92		u8 fragments_received;
    93	
    94		/**
    95		 * @ret: Linux return code, there was an error processing message
    96		 * @seq: Sequence ID for the main message.
    97		 * @rm_error: For request/reply sequences with standard replies
    98		 * @seq_done: Signals caller that the RM reply has been received
    99		 */
   100		struct {
   101			int ret;
   102			u16 seq;
   103			enum gunyah_rm_error rm_error;
   104			struct completion seq_done;
   105		} reply;
 > 106	};
   107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
