Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F9917CB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Apr 2023 12:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682770448; x=1714306448;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a1DW/kaiVnNLQKW+/jrJjiFLE8UKzq7HtrR8pNoYir0=;
  b=LFOvHYHZRqTuH9F1C0hwAx9qK9hS7QU1yqsHenWiY5WSO6lRcSIxiARv
   3MIBQ+Oqkbw9XnkE4nDt60t1u6MFbhzICz8S+JHmvoUM74+vkqy4LbRXt
   3DUdAjSsFsnUmj+WPxGm1U6ThxaSGrX56mJ9c6vjg9sltRUd9YifIjvBP
   zEKZkdgscZI2LX8oTyfzN5NNM5dTVDw6PR8KzK3+jTAOs8c4P9o0cV/Hq
   iElV1g1nM4CFmDV0y/9WfmKeiXlyngENmUbcuYxcg0jgXymtxd677UuIK
   oioDHf3MwDy/SlO9WgPxSJpHK2ruO9kYNp+N9AFBKhK5bHqxRPJu+VUfX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="345391906"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="345391906"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 05:14:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="819368913"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="819368913"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 29 Apr 2023 05:14:02 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psjSj-00017l-2p;
	Sat, 29 Apr 2023 12:14:01 +0000
Date: Sat, 29 Apr 2023 20:13:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kanchan Joshi <joshi.k@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 06/12] pci: implement register/unregister
 functionality
Message-ID: <202304292023.jmgnfrZF-lkp@intel.com>
References: <20230429093925.133327-7-joshi.k@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230429093925.133327-7-joshi.k@samsung.com>

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
patch link:    https://lore.kernel.org/r/20230429093925.133327-7-joshi.k%40samsung.com
patch subject: [RFC PATCH 06/12] pci: implement register/unregister functionality
config: csky-randconfig-r013-20230429 (https://download.01.org/0day-ci/archive/20230429/202304292023.jmgnfrZF-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6b117fabad0d77551dee34c2b3335dde220e057a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kanchan-Joshi/pci-enable-raw_queues-N-module-parameter/20230429-183933
        git checkout 6b117fabad0d77551dee34c2b3335dde220e057a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash drivers/nvme/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304292023.jmgnfrZF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvme/host/pci.c:1832:10: error: 'const struct blk_mq_ops' has no member named 'register_queue'
    1832 |         .register_queue = nvme_pci_register_queue,
         |          ^~~~~~~~~~~~~~
>> drivers/nvme/host/pci.c:1832:27: error: initialization of 'void (*)(struct request *)' from incompatible pointer type 'int (*)(void *)' [-Werror=incompatible-pointer-types]
    1832 |         .register_queue = nvme_pci_register_queue,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/pci.c:1832:27: note: (near initialization for 'nvme_mq_ops.complete')
   drivers/nvme/host/pci.c:1832:27: warning: initialized field overwritten [-Woverride-init]
   drivers/nvme/host/pci.c:1832:27: note: (near initialization for 'nvme_mq_ops.complete')
>> drivers/nvme/host/pci.c:1833:10: error: 'const struct blk_mq_ops' has no member named 'unregister_queue'
    1833 |         .unregister_queue =  nvme_pci_unregister_queue,
         |          ^~~~~~~~~~~~~~~~
>> drivers/nvme/host/pci.c:1833:30: error: initialization of 'int (*)(struct blk_mq_hw_ctx *, void *, unsigned int)' from incompatible pointer type 'int (*)(void *, int)' [-Werror=incompatible-pointer-types]
    1833 |         .unregister_queue =  nvme_pci_unregister_queue,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/pci.c:1833:30: note: (near initialization for 'nvme_mq_ops.init_hctx')
   drivers/nvme/host/pci.c:1833:30: warning: initialized field overwritten [-Woverride-init]
   drivers/nvme/host/pci.c:1833:30: note: (near initialization for 'nvme_mq_ops.init_hctx')
   cc1: some warnings being treated as errors


vim +1832 drivers/nvme/host/pci.c

  1821	
  1822	static const struct blk_mq_ops nvme_mq_ops = {
  1823		.queue_rq	= nvme_queue_rq,
  1824		.queue_rqs	= nvme_queue_rqs,
  1825		.complete	= nvme_pci_complete_rq,
  1826		.commit_rqs	= nvme_commit_rqs,
  1827		.init_hctx	= nvme_init_hctx,
  1828		.init_request	= nvme_pci_init_request,
  1829		.map_queues	= nvme_pci_map_queues,
  1830		.timeout	= nvme_timeout,
  1831		.poll		= nvme_poll,
> 1832		.register_queue	= nvme_pci_register_queue,
> 1833		.unregister_queue =  nvme_pci_unregister_queue,
  1834	};
  1835	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
