Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B71DDC5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 08:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757405194; cv=none; b=GurcfR9XKuv1n6/hdhwzmiejM0zLZlkXRzVCWioVxln1Lu6njIL4wnN9yUQios3GH+bIpsokMiImovQxwm1K4eFjFTKHrOvKoNvqwWQIhkA0MDNxHyFKiB2cybtXUwmQJk9Csx5IEemJ0A9PzjJFP57f7pjH4s1qT2x/7fFnbiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757405194; c=relaxed/simple;
	bh=1zg7YZnQN2aXAs9zdCv5Gjp6sRMM9Qj6f7YdT0z3xcg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X1MXZzEigrS5PhjR5djNv1Ra/mbsSnq+b6RE3Nj7dqxr91+OlRLMOEo/PIqHWXhO7m6/5SYRY+FfFvP3NEv+d4TXoqsW1+MxiXe1GWZhcnEAIDnz5/LlLB9e3gaJnwRZreh1S+NBItqAqErKb22RnFRw73fowGmJj03nuDypAGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N2y1hBsv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N2y1hBsv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757405193; x=1788941193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1zg7YZnQN2aXAs9zdCv5Gjp6sRMM9Qj6f7YdT0z3xcg=;
  b=N2y1hBsvV10dmo90NNltYoyrpI2uPynlaPhOnFtVtqtDW9d7ciDKZgNG
   5VkM32MWtspPm1XluEI2dzZto5yD4qar5pmcJ5j39IdlFqzTPdY1ostda
   CM6o85y4663m/4h1P0Sgi25lHVExHK0BnoqJn9YVmDOxdmuYU49M54P7C
   GB6w+ztHIQPoPPEOpe9L/cjPoNayyXuRfH6GY0oh0A/sFQC7XRB1t0a8W
   Y7CN2y433xLylnkTIuyHvvc8oKWXQsYFiNhgwXRNzNVH9qKm4/kclbOQA
   EA9oj+hS/frQPKShAyqW8QZA3PsB3klznOf4+a/Z7cVcpIWZZPMU7mE1+
   Q==;
X-CSE-ConnectionGUID: frqopyKdQVKbDuM3tWBj/w==
X-CSE-MsgGUID: Bi2LR3WwSleiRicLpmP9Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59616193"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="59616193"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 01:06:29 -0700
X-CSE-ConnectionGUID: NAPHNBaHTQGKiIM4jsKzoA==
X-CSE-MsgGUID: 7EBMTazURoOGp/hBaTye/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="173403042"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Sep 2025 01:06:29 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvtMw-0004cx-2f;
	Tue, 09 Sep 2025 08:06:26 +0000
Date: Tue, 9 Sep 2025 16:06:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 3/3]
 drivers/virt/gunyah/rsc_mgr.c:194: warning: Function parameter or member
 'pm_nb' not described in 'gh_rm'
Message-ID: <202509091807.3A6G5B6Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   8cde8d25c90b1eba83a82ef30f7fab4a2b2bf68c
commit: 8cde8d25c90b1eba83a82ef30f7fab4a2b2bf68c [3/3] ANDROID: virt: gunyah: Fetch fresh Gunyah information after restore
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250909/202509091807.3A6G5B6Z-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509091807.3A6G5B6Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509091807.3A6G5B6Z-lkp@intel.com/

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
8cde8d25c90b1e Hrishabh Rajput         2025-08-13  192  
8cde8d25c90b1e Hrishabh Rajput         2025-08-13  193  	struct notifier_block pm_nb;
d5e8df2cc4a170 Elliot Berman           2022-08-10 @194  };
d5e8df2cc4a170 Elliot Berman           2022-08-10  195  

:::::: The code at line 194 was first introduced by commit
:::::: d5e8df2cc4a17063dcebc67a939356ad49a665bd FROMLIST: gunyah: rsc_mgr: Add resource manager RPC core

:::::: TO: Elliot Berman <quic_eberman@quicinc.com>
:::::: CC: Aleksei Vetrov <vvvvvv@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
