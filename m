Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFFE35B642
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775533884; cv=none; b=pCgDeOFqCZ/Me21yHPBquhrWXs/BzdRxs0mrLb4qUjll3VweHqW10AX1irR5CEHrSNCM1HhLIIGZOnUkvqfyTgrDJKy/WDpVc58UdbVYuoUU3YgybcR6Z2PuiqocVRfEctcyeChEe3R9VO6M1L9xBr/8DqVlf7aI3TzeQOBLK1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775533884; c=relaxed/simple;
	bh=eHZnpVWiZnQzjz6puDh3GNzs2yWyJJiIJOkupovNBmY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fs+Abr5xDRQbca9kwGNcx5oMuEEDlgDbiN/43JuBJ/VE2T3z2/LmdDFBky3uJ6iUi+AShMOo2E0Qby2tRInOgEo0CT6mknynG1jk6KtZWcPzFpjXVzWgP/gmSMYlsxMrWq7Lmo1m7fDEWUS+RbI0zTZ1cDMAxClxPNLCIkd44/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jqb+TTIh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jqb+TTIh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775533883; x=1807069883;
  h=date:from:to:cc:subject:message-id;
  bh=eHZnpVWiZnQzjz6puDh3GNzs2yWyJJiIJOkupovNBmY=;
  b=jqb+TTIh9XWTCk/OWyfu9p/8ULCeKBft2j54pG/oRJAqvAtZKOKsxkDr
   1ELBydfOjykeeeMShQpYhvdz/tLZyzxR3K/DcCSYOHlOl7AlZ1XIE9n00
   HCAWHSA3fzrPfVA96fc42/nzyRAzcFxsTINJ0LlyMFk+c/Zm7VjKsTsal
   mbv41AOteOJvZrBz4hvr7MxEyDWGHYLaV3S1zcKnp8z9UJGN1fyEDut+O
   aTJrglFo8+LJIpvmjB1MHkXqj10cjEsqbO5ng3J/fDNL544mowiDXJkqG
   U0YqMnxrVvZl1EzN6/g5Kq88zzc0g6CNxyEjkGnvtlcESDdgpgM50irM0
   Q==;
X-CSE-ConnectionGUID: lflY6eR4QXC+u+GOLgDktA==
X-CSE-MsgGUID: C3Dhx2CKTSeig38F9lX0mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87942000"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87942000"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:51:22 -0700
X-CSE-ConnectionGUID: C1YFsMTWTsuJmxv2ZHo7wA==
X-CSE-MsgGUID: ifBcmfA+TTeOWZMWnQ9pKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="221477971"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 Apr 2026 20:51:20 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xTC-0000000002F-2CRp;
	Tue, 07 Apr 2026 03:51:18 +0000
Date: Tue, 07 Apr 2026 11:50:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 30/30]
 drivers/virt/gunyah/rsc_mgr.c:194: warning: Function parameter or member
 'pm_nb' not described in 'gh_rm'
Message-ID: <202604040454.LjfYSw0G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Hrishabh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   2ae5f5ed1b2f5c49e06cf1e40ed7d7249cf74aa0
commit: 8cde8d25c90b1eba83a82ef30f7fab4a2b2bf68c [30/30] ANDROID: virt: gunyah: Fetch fresh Gunyah information after restore
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260404/202604040454.LjfYSw0G-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604040454.LjfYSw0G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604040454.LjfYSw0G-lkp@intel.com/

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
