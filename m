Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529EB313520
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 08:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765874167; cv=none; b=pLO7OMiYPLrksW03p18ilGWEG2KHA1l69dEeykvFwPCSXD8ZL+AW8HeBFNKqDr65AEt6iNHOKnfE51opGo4LpCte7xM2b/E/tduaP62SQ5AslQ1lDZuKMm+i4f+bz0x+DfujM3CphGxya1H4OlNFQgvyJdJfwFNGWVzpU1m7u3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765874167; c=relaxed/simple;
	bh=J6wuqC7DKPJz2UYM5qU2ujatwUjEJxhYR9sBznlFpZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gRMFwVvGhnMWGpjUMD6RJJGrOc+LQ886yLoG0tLGw2VFz4Q+wXxj9h7blQcBesngeyYLuuQEC+IM8iQa7o8HU75RipJjU8Edg0xywrd4/J4xeEGc4OZIWHbSG5YojduDDufS74xv/oky9pHIg6WWBmiJy/Jo16nXRJiPjyESmpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SNQ3V+Pu; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SNQ3V+Pu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765874162; x=1797410162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J6wuqC7DKPJz2UYM5qU2ujatwUjEJxhYR9sBznlFpZ4=;
  b=SNQ3V+Pu/Gy+HuMwL3q7RrF7xWygmukzvX6Ff2fMpgsUciiXCFJcyz0h
   R2He8q8hamon12+fsf1mLyjkO3lCj1JoEZL29XUgjfg8ugbjZ3SQK04+j
   mFDYTdDGlBCBopbxmT0zQXQAXyNaY5K3QZGhmeFGgOeMJDrmareWgssSJ
   UvTJwSvc9+jKY13PCXDJ1F78bPfpX9fcHNl7QxdtavzbDHUj0pSNpprqQ
   cypu50fyOWJh7V9TLL3O4bRALGCPM76DGi16UH9Y9bxXo6Z0rguT5SIjc
   zG+B0FwPAeQa6F9iBMPFxKn6PDc9gU6uKgxQnAT4hKgfBvhRDe8aGStIS
   g==;
X-CSE-ConnectionGUID: SNpVFSMgRsu6YmM8wIonZA==
X-CSE-MsgGUID: sMY8ZD9ZToOECvNR3INNcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67541745"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="67541745"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 00:35:59 -0800
X-CSE-ConnectionGUID: BIYb9IwIT3eG7N8UMpQiZQ==
X-CSE-MsgGUID: M+jO/XO/TMG3yCtdZVlIow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="202871371"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 16 Dec 2025 00:35:58 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVQVl-000000001My-0rTj;
	Tue, 16 Dec 2025 08:34:38 +0000
Date: Tue, 16 Dec 2025 16:32:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 2/2]
 drivers/virt/gunyah/rsc_mgr.c:159: warning: Function parameter or member
 'adev' not described in 'gh_rm'
Message-ID: <202512161652.8WRF3wUz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Prakruthi,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   6f1c2f8fd8c80fa50c9be0270d8474d6fa7412f2
commit: 1dce9d7d4deea1d677677ba5dc6e0879679e5b38 [2/2] ANDROID: gunyah: Add support for Gunyah vendor modules
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251216/202512161652.8WRF3wUz-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161652.8WRF3wUz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161652.8WRF3wUz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/virt/gunyah/rsc_mgr.c:159: warning: Function parameter or member 'msgq_client' not described in 'gh_rm'
>> drivers/virt/gunyah/rsc_mgr.c:159: warning: Function parameter or member 'adev' not described in 'gh_rm'
   drivers/virt/gunyah/rsc_mgr.c:166: warning: Function parameter or member 'rm_error' not described in 'gh_rm_remap_error'
   drivers/virt/gunyah/rsc_mgr.c:166: warning: Excess function parameter 'gh_error' description in 'gh_rm_remap_error'


vim +159 drivers/virt/gunyah/rsc_mgr.c

d5e8df2cc4a170 Elliot Berman           2022-08-10  123  
d5e8df2cc4a170 Elliot Berman           2022-08-10  124  /**
d5e8df2cc4a170 Elliot Berman           2022-08-10  125   * struct gh_rm - private data for communicating w/Gunyah resource manager
d5e8df2cc4a170 Elliot Berman           2022-08-10  126   * @dev: pointer to device
d5e8df2cc4a170 Elliot Berman           2022-08-10  127   * @tx_ghrsc: message queue resource to TX to RM
d5e8df2cc4a170 Elliot Berman           2022-08-10  128   * @rx_ghrsc: message queue resource to RX from RM
d5e8df2cc4a170 Elliot Berman           2022-08-10  129   * @msgq: mailbox instance of above
d5e8df2cc4a170 Elliot Berman           2022-08-10  130   * @active_rx_connection: ongoing gh_rm_connection for which we're receiving fragments
d5e8df2cc4a170 Elliot Berman           2022-08-10  131   * @last_tx_ret: return value of last mailbox tx
d5e8df2cc4a170 Elliot Berman           2022-08-10  132   * @call_xarray: xarray to allocate & lookup sequence IDs for Request/Response flows
d5e8df2cc4a170 Elliot Berman           2022-08-10  133   * @next_seq: next ID to allocate (for xa_alloc_cyclic)
d5e8df2cc4a170 Elliot Berman           2022-08-10  134   * @cache: cache for allocating Tx messages
d5e8df2cc4a170 Elliot Berman           2022-08-10  135   * @send_lock: synchronization to allow only one request to be sent at a time
d5e8df2cc4a170 Elliot Berman           2022-08-10  136   * @nh: notifier chain for clients interested in RM notification messages
f251362242ba3e Elliot Berman           2022-10-14  137   * @miscdev: /dev/gunyah
4cf9feacb7e4ba Elliot Berman           2022-12-13  138   * @irq_domain: Domain to translate Gunyah hwirqs to Linux irqs
d5e8df2cc4a170 Elliot Berman           2022-08-10  139   */
d5e8df2cc4a170 Elliot Berman           2022-08-10  140  struct gh_rm {
d5e8df2cc4a170 Elliot Berman           2022-08-10  141  	struct device *dev;
d5e8df2cc4a170 Elliot Berman           2022-08-10  142  	struct gh_resource tx_ghrsc;
d5e8df2cc4a170 Elliot Berman           2022-08-10  143  	struct gh_resource rx_ghrsc;
d5e8df2cc4a170 Elliot Berman           2022-08-10  144  	struct gh_msgq msgq;
d5e8df2cc4a170 Elliot Berman           2022-08-10  145  	struct mbox_client msgq_client;
d5e8df2cc4a170 Elliot Berman           2022-08-10  146  	struct gh_rm_connection *active_rx_connection;
d5e8df2cc4a170 Elliot Berman           2022-08-10  147  	int last_tx_ret;
d5e8df2cc4a170 Elliot Berman           2022-08-10  148  
d5e8df2cc4a170 Elliot Berman           2022-08-10  149  	struct xarray call_xarray;
d5e8df2cc4a170 Elliot Berman           2022-08-10  150  	u32 next_seq;
d5e8df2cc4a170 Elliot Berman           2022-08-10  151  
d5e8df2cc4a170 Elliot Berman           2022-08-10  152  	struct kmem_cache *cache;
d5e8df2cc4a170 Elliot Berman           2022-08-10  153  	struct mutex send_lock;
d5e8df2cc4a170 Elliot Berman           2022-08-10  154  	struct blocking_notifier_head nh;
f251362242ba3e Elliot Berman           2022-10-14  155  
1dce9d7d4deea1 Prakruthi Deepak Heragu 2023-02-27  156  	struct auxiliary_device adev;
f251362242ba3e Elliot Berman           2022-10-14  157  	struct miscdevice miscdev;
4cf9feacb7e4ba Elliot Berman           2022-12-13  158  	struct irq_domain *irq_domain;
d5e8df2cc4a170 Elliot Berman           2022-08-10 @159  };
d5e8df2cc4a170 Elliot Berman           2022-08-10  160  

:::::: The code at line 159 was first introduced by commit
:::::: d5e8df2cc4a17063dcebc67a939356ad49a665bd FROMLIST: gunyah: rsc_mgr: Add resource manager RPC core

:::::: TO: Elliot Berman <quic_eberman@quicinc.com>
:::::: CC: Aleksei Vetrov <vvvvvv@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
