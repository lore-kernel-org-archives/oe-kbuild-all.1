Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB21730B52B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 09:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766481089; cv=none; b=kDTuGxKFPGr1KTcB1bMbC2ZpcMvPk4cyMpY1igiJA+0DnhJWGbZ2f/3SQZ8dbu1BEIIwxTT57iBUildBdB7nBM1F2EDdUFvNhXUhRaMNpANblkBX5aZcfgIE2bXm51NUQiF6CgR1eM25CPkBQ2tA+WqTwudtL498HwzZPIIK78A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766481089; c=relaxed/simple;
	bh=heJRkNkDNlsSkJB1Yo2V1tdxLM/91AoUJD3TiFeQbSY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VOH3LUGA+mTDCmclFlYCcqiNax3u3s1URewuptf5ZL7X/SsCVqcTQc/+4g34n+o5Ym22596Jy1mr8gJMRfoCy54fpv5Z8zsVJAthpkg0gkAm6rarm72FJBJLSorhBmomGraZAI+aX+cAXBH3L79Vss0L+D2+XXNdWFPMkOd11sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fGb+JjFK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fGb+JjFK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766481087; x=1798017087;
  h=date:from:to:cc:subject:message-id;
  bh=heJRkNkDNlsSkJB1Yo2V1tdxLM/91AoUJD3TiFeQbSY=;
  b=fGb+JjFKv3M/mLMFdgRSgAo2FRGjxCNLnRXHpEgWOX54iLdHw57xj8CS
   gQ0stODOEaWZc/wpvvFYaxnwjxOKR4Pa3Urm8RCtlJnBcU7sYJ+91XWOV
   +A289apH7yMte8hIMJ4Zb36pthKUA9oSDhdfm7J2gsgQDTFUYO8ZWOleQ
   bpLwUiFSujTsRbRTXOxXYmsJnABPtkM2CHAt0qVL+tY3n0qTN4lqie+ku
   Hd+nwGXYcCBC4HphqnRy1MLOHvNER6d0pWH3VeBbIYkrnjWqo8WTSrQ+W
   RXu+IJ5TNTGSwNlcfgt1ODYLbd3+Fr13lBdOw9Nnx8iJg9UoIWE2Ckgoz
   g==;
X-CSE-ConnectionGUID: j4O6vZNCTjaK9fqSYQFp+A==
X-CSE-MsgGUID: kvFLvolDRv2wJhhjLp67sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79782181"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="79782181"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 01:11:26 -0800
X-CSE-ConnectionGUID: I1M1Oa9LTzOBFR1Ew6eSmQ==
X-CSE-MsgGUID: jm7BepW0R/CmNocr7DQaAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="223219613"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Dec 2025 01:11:25 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXyQM-000000001fd-42x2;
	Tue, 23 Dec 2025 09:11:22 +0000
Date: Tue, 23 Dec 2025 17:10:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/1]
 drivers/virt/gunyah/rsc_mgr.c:194: warning: Function parameter or member
 'pm_nb' not described in 'gh_rm'
Message-ID: <202512231729.g2LI6DtQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Hrishabh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b952cc514e6f0e92951693f5131909bb1264ded3
commit: 8cde8d25c90b1eba83a82ef30f7fab4a2b2bf68c [1/1] ANDROID: virt: gunyah: Fetch fresh Gunyah information after restore
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251223/202512231729.g2LI6DtQ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512231729.g2LI6DtQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512231729.g2LI6DtQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/virt/gunyah/rsc_mgr.c:194: warning: Function parameter or member 'adev' not described in 'gh_rm'
>> drivers/virt/gunyah/rsc_mgr.c:194: warning: Function parameter or member 'pm_nb' not described in 'gh_rm'
   drivers/virt/gunyah/rsc_mgr.c:669: warning: Function parameter or member '_rm' not described in 'gh_rm_call'
   drivers/virt/gunyah/rsc_mgr.c:669: warning: Excess function parameter 'rm' description in 'gh_rm_call'


vim +194 drivers/virt/gunyah/rsc_mgr.c

d5e8df2cc4a1706 Elliot Berman           2022-08-10  155  
d5e8df2cc4a1706 Elliot Berman           2022-08-10  156  /**
d5e8df2cc4a1706 Elliot Berman           2022-08-10  157   * struct gh_rm - private data for communicating w/Gunyah resource manager
705a9b5feb1ba9f Elliot Berman           2023-06-12  158   * @dev: pointer to RM platform device
d5e8df2cc4a1706 Elliot Berman           2022-08-10  159   * @tx_ghrsc: message queue resource to TX to RM
d5e8df2cc4a1706 Elliot Berman           2022-08-10  160   * @rx_ghrsc: message queue resource to RX from RM
9a9fc8d1b2882c3 Elliot Berman           2023-04-17  161   * @msgq: mailbox instance of TX/RX resources above
9a9fc8d1b2882c3 Elliot Berman           2023-04-17  162   * @msgq_client: mailbox client of above msgq
d5e8df2cc4a1706 Elliot Berman           2022-08-10  163   * @active_rx_connection: ongoing gh_rm_connection for which we're receiving fragments
d5e8df2cc4a1706 Elliot Berman           2022-08-10  164   * @last_tx_ret: return value of last mailbox tx
d5e8df2cc4a1706 Elliot Berman           2022-08-10  165   * @call_xarray: xarray to allocate & lookup sequence IDs for Request/Response flows
d5e8df2cc4a1706 Elliot Berman           2022-08-10  166   * @next_seq: next ID to allocate (for xa_alloc_cyclic)
d5e8df2cc4a1706 Elliot Berman           2022-08-10  167   * @cache: cache for allocating Tx messages
d5e8df2cc4a1706 Elliot Berman           2022-08-10  168   * @send_lock: synchronization to allow only one request to be sent at a time
d5e8df2cc4a1706 Elliot Berman           2022-08-10  169   * @nh: notifier chain for clients interested in RM notification messages
f251362242ba3ef Elliot Berman           2022-10-14  170   * @miscdev: /dev/gunyah
4cf9feacb7e4ba2 Elliot Berman           2022-12-13  171   * @irq_domain: Domain to translate Gunyah hwirqs to Linux irqs
d5e8df2cc4a1706 Elliot Berman           2022-08-10  172   */
d5e8df2cc4a1706 Elliot Berman           2022-08-10  173  struct gh_rm {
d5e8df2cc4a1706 Elliot Berman           2022-08-10  174  	struct device *dev;
d5e8df2cc4a1706 Elliot Berman           2022-08-10  175  	struct gh_resource tx_ghrsc;
d5e8df2cc4a1706 Elliot Berman           2022-08-10  176  	struct gh_resource rx_ghrsc;
d5e8df2cc4a1706 Elliot Berman           2022-08-10  177  	struct gh_msgq msgq;
d5e8df2cc4a1706 Elliot Berman           2022-08-10  178  	struct mbox_client msgq_client;
d5e8df2cc4a1706 Elliot Berman           2022-08-10  179  	struct gh_rm_connection *active_rx_connection;
d5e8df2cc4a1706 Elliot Berman           2022-08-10  180  	int last_tx_ret;
d5e8df2cc4a1706 Elliot Berman           2022-08-10  181  
d5e8df2cc4a1706 Elliot Berman           2022-08-10  182  	struct xarray call_xarray;
d5e8df2cc4a1706 Elliot Berman           2022-08-10  183  	u32 next_seq;
d5e8df2cc4a1706 Elliot Berman           2022-08-10  184  
d5e8df2cc4a1706 Elliot Berman           2022-08-10  185  	struct kmem_cache *cache;
d5e8df2cc4a1706 Elliot Berman           2022-08-10  186  	struct mutex send_lock;
d5e8df2cc4a1706 Elliot Berman           2022-08-10  187  	struct blocking_notifier_head nh;
f251362242ba3ef Elliot Berman           2022-10-14  188  
1dce9d7d4deea1d Prakruthi Deepak Heragu 2023-02-27  189  	struct auxiliary_device adev;
f251362242ba3ef Elliot Berman           2022-10-14  190  	struct miscdevice miscdev;
4cf9feacb7e4ba2 Elliot Berman           2022-12-13  191  	struct irq_domain *irq_domain;
8cde8d25c90b1eb Hrishabh Rajput         2025-08-13  192  
8cde8d25c90b1eb Hrishabh Rajput         2025-08-13  193  	struct notifier_block pm_nb;
d5e8df2cc4a1706 Elliot Berman           2022-08-10 @194  };
d5e8df2cc4a1706 Elliot Berman           2022-08-10  195  

:::::: The code at line 194 was first introduced by commit
:::::: d5e8df2cc4a17063dcebc67a939356ad49a665bd FROMLIST: gunyah: rsc_mgr: Add resource manager RPC core

:::::: TO: Elliot Berman <quic_eberman@quicinc.com>
:::::: CC: Aleksei Vetrov <vvvvvv@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
