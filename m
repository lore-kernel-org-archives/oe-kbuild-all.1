Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682CB17E8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Apr 2023 12:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682772905; x=1714308905;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xsl9oTJA5IW/dPTMyV2knW7iPHakWVgayUxQ+sH/ASE=;
  b=NlgmESA/wavstUznzzQofQf7WN8thlc3R9W8xmimuMvRlcnozf1pRxPB
   dEji30BxYUPvLeC1jTpLfky0x5IhPreHI2APtpL1ijOc1cK9c72w+HyHC
   8UnG8udG7rxaDvHywve1qiJ3AAF27yPqLfFv4FdgnCkrX319cuySBweFK
   pgwZTGhQs6WLmp4vJx6GVbLRNpNqtqp1A6m6Oeyr8iceTawUPSmHpwq2l
   rU4HJr+2yJT/pv4i2a6/EGEKmjFNiegvelAOyHQjkbsAqUNsBQAvSNP54
   r3z7+rl+dIgNIpIXy2l66+fOV1grrqRndTdDMoKWJEAtprTXyGwg0BiPY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="413346320"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="413346320"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 05:55:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="697920694"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="697920694"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 Apr 2023 05:55:03 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psk6Q-00019V-31;
	Sat, 29 Apr 2023 12:55:02 +0000
Date: Sat, 29 Apr 2023 20:54:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kanchan Joshi <joshi.k@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 12/12] pci: implement submission/completion for rawq
 commands
Message-ID: <202304292003.uwEZSENw-lkp@intel.com>
References: <20230429093925.133327-13-joshi.k@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230429093925.133327-13-joshi.k@samsung.com>

Hi Kanchan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master next-20230428]
[cannot apply to v6.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kanchan-Joshi/pci-enable-raw_queues-N-module-parameter/20230429-183933
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230429093925.133327-13-joshi.k%40samsung.com
patch subject: [RFC PATCH 12/12] pci: implement submission/completion for rawq commands
config: csky-randconfig-r013-20230429 (https://download.01.org/0day-ci/archive/20230429/202304292003.uwEZSENw-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5e9295340fad52984048c267b4b4c422c9556c86
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kanchan-Joshi/pci-enable-raw_queues-N-module-parameter/20230429-183933
        git checkout 5e9295340fad52984048c267b4b4c422c9556c86
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash drivers/nvme/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304292003.uwEZSENw-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/host/pci.c:2021:10: error: 'const struct blk_mq_ops' has no member named 'register_queue'
    2021 |         .register_queue = nvme_pci_register_queue,
         |          ^~~~~~~~~~~~~~
   drivers/nvme/host/pci.c:2021:27: error: initialization of 'void (*)(struct request *)' from incompatible pointer type 'int (*)(void *)' [-Werror=incompatible-pointer-types]
    2021 |         .register_queue = nvme_pci_register_queue,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/pci.c:2021:27: note: (near initialization for 'nvme_mq_ops.complete')
   drivers/nvme/host/pci.c:2021:27: warning: initialized field overwritten [-Woverride-init]
   drivers/nvme/host/pci.c:2021:27: note: (near initialization for 'nvme_mq_ops.complete')
   drivers/nvme/host/pci.c:2022:10: error: 'const struct blk_mq_ops' has no member named 'unregister_queue'
    2022 |         .unregister_queue =  nvme_pci_unregister_queue,
         |          ^~~~~~~~~~~~~~~~
   drivers/nvme/host/pci.c:2022:30: error: initialization of 'int (*)(struct blk_mq_hw_ctx *, void *, unsigned int)' from incompatible pointer type 'int (*)(void *, int)' [-Werror=incompatible-pointer-types]
    2022 |         .unregister_queue =  nvme_pci_unregister_queue,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/pci.c:2022:30: note: (near initialization for 'nvme_mq_ops.init_hctx')
   drivers/nvme/host/pci.c:2022:30: warning: initialized field overwritten [-Woverride-init]
   drivers/nvme/host/pci.c:2022:30: note: (near initialization for 'nvme_mq_ops.init_hctx')
>> drivers/nvme/host/pci.c:2023:10: error: 'const struct blk_mq_ops' has no member named 'queue_uring_cmd'
    2023 |         .queue_uring_cmd = nvme_pci_queue_ucmd,
         |          ^~~~~~~~~~~~~~~
>> drivers/nvme/host/pci.c:2023:28: error: initialization of 'void (*)(struct blk_mq_hw_ctx *, unsigned int)' from incompatible pointer type 'int (*)(struct io_uring_cmd *, int)' [-Werror=incompatible-pointer-types]
    2023 |         .queue_uring_cmd = nvme_pci_queue_ucmd,
         |                            ^~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/pci.c:2023:28: note: (near initialization for 'nvme_mq_ops.exit_hctx')
>> drivers/nvme/host/pci.c:2024:10: error: 'const struct blk_mq_ops' has no member named 'poll_uring_cmd'
    2024 |         .poll_uring_cmd = nvme_poll_uring_cmd,
         |          ^~~~~~~~~~~~~~
>> drivers/nvme/host/pci.c:2024:27: error: initialization of 'int (*)(struct blk_mq_tag_set *, struct request *, unsigned int,  unsigned int)' from incompatible pointer type 'int (*)(struct io_uring_cmd *, int,  struct io_comp_batch *)' [-Werror=incompatible-pointer-types]
    2024 |         .poll_uring_cmd = nvme_poll_uring_cmd,
         |                           ^~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/pci.c:2024:27: note: (near initialization for 'nvme_mq_ops.init_request')
   drivers/nvme/host/pci.c:2024:27: warning: initialized field overwritten [-Woverride-init]
   drivers/nvme/host/pci.c:2024:27: note: (near initialization for 'nvme_mq_ops.init_request')
   cc1: some warnings being treated as errors


vim +2023 drivers/nvme/host/pci.c

  2010	
  2011	static const struct blk_mq_ops nvme_mq_ops = {
  2012		.queue_rq	= nvme_queue_rq,
  2013		.queue_rqs	= nvme_queue_rqs,
  2014		.complete	= nvme_pci_complete_rq,
  2015		.commit_rqs	= nvme_commit_rqs,
  2016		.init_hctx	= nvme_init_hctx,
  2017		.init_request	= nvme_pci_init_request,
  2018		.map_queues	= nvme_pci_map_queues,
  2019		.timeout	= nvme_timeout,
  2020		.poll		= nvme_poll,
  2021		.register_queue	= nvme_pci_register_queue,
> 2022		.unregister_queue =  nvme_pci_unregister_queue,
> 2023		.queue_uring_cmd = nvme_pci_queue_ucmd,
> 2024		.poll_uring_cmd	= nvme_poll_uring_cmd,
  2025	};
  2026	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
