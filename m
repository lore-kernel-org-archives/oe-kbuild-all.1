Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1D11FA0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 09:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681811135; x=1713347135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aoEGNjqPPKoeiN2karLWMW4dQZaY6+fBNy0mkw8oP9E=;
  b=HATQByjzIj94O9G7WSnF+Q+w9w0UtRj+UzB6vhnbhAZIfF2la1YP/sAg
   SU9buo3+LzuGOJW7l9YZcYjDPEoBCTUeVfG+z2fj+jwzR4k48M3CRNyrt
   6lOYrGQZYGt/nfVErcgwJzHw5oEgiCgUdFM+fgwZeYxDeryjgS1Hh2Lif
   RNhOuG3VzazQpgJlsCkB5UxdJ0pOk02CmThAV5o3We4vZZfy6A84v0WI8
   GSFy8+BB5jWIj8NIFD4Z+1QlPffn+EOnAy59IsiVTlajuGjQHTqqqXBLA
   mp5aqAy3SwDTbwZ9C98EltMxAXMINNcUurU8UHVL0SNP2H1nnJEdpV5Y0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="431410553"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="431410553"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 02:45:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="693564007"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="693564007"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Apr 2023 02:45:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pohtz-000dDn-2O;
	Tue, 18 Apr 2023 09:45:31 +0000
Date: Tue, 18 Apr 2023 17:45:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:rlist 23/28] include/rdma/ib_verbs.h:4198:58: warning:
 'struct rlist_dma' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <202304181757.lhKaMuIt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux rlist
head:   a7cd9881872ca2566ca744155c307ca414341e04
commit: 0ff1a4c87640438a31f239c61df8aba1dc348d5f [23/28] RDMA: Add IB DMA API wrappers for rlist
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230418/202304181757.lhKaMuIt-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jgunthorpe/linux/commit/0ff1a4c87640438a31f239c61df8aba1dc348d5f
        git remote add jgunthorpe https://github.com/jgunthorpe/linux
        git fetch --no-tags jgunthorpe rlist
        git checkout 0ff1a4c87640438a31f239c61df8aba1dc348d5f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash security/selinux/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181757.lhKaMuIt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/lsm_audit.h:25,
                    from security/selinux/include/avc.h:17,
                    from security/selinux/avc.c:30:
>> include/rdma/ib_verbs.h:4198:58: warning: 'struct rlist_dma' declared inside parameter list will not be visible outside of this definition or declaration
    4198 | int ib_dma_virt_map_rlist(struct rlist_cpu *rcpu, struct rlist_dma *rdma);
         |                                                          ^~~~~~~~~
>> include/rdma/ib_verbs.h:4203:49: warning: 'struct rlist_dma_segmentation' declared inside parameter list will not be visible outside of this definition or declaration
    4203 |                                    const struct rlist_dma_segmentation *segment,
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~
   include/rdma/ib_verbs.h:4202:43: warning: 'struct rlist_dma' declared inside parameter list will not be visible outside of this definition or declaration
    4202 |                                    struct rlist_dma *rdma,
         |                                           ^~~~~~~~~
   include/rdma/ib_verbs.h: In function 'ib_dma_map_rlist':
   include/rdma/ib_verbs.h:4208:52: error: passing argument 2 of 'ib_dma_virt_map_rlist' from incompatible pointer type [-Werror=incompatible-pointer-types]
    4208 |                 return ib_dma_virt_map_rlist(rcpu, rdma);
         |                                                    ^~~~
         |                                                    |
         |                                                    struct rlist_dma *
   include/rdma/ib_verbs.h:4198:69: note: expected 'struct rlist_dma *' but argument is of type 'struct rlist_dma *'
    4198 | int ib_dma_virt_map_rlist(struct rlist_cpu *rcpu, struct rlist_dma *rdma);
         |                                                   ~~~~~~~~~~~~~~~~~~^~~~
   include/rdma/ib_verbs.h:4209:16: error: implicit declaration of function 'dma_map_rlist'; did you mean 'ib_dma_map_rlist'? [-Werror=implicit-function-declaration]
    4209 |         return dma_map_rlist(dev->dma_device, rcpu, rdma, segment, dir, attrs,
         |                ^~~~~~~~~~~~~
         |                ib_dma_map_rlist
   include/rdma/ib_verbs.h: At top level:
   include/rdma/ib_verbs.h:4214:31: warning: 'struct rlist_dma' declared inside parameter list will not be visible outside of this definition or declaration
    4214 | void rlist_dma_destroy(struct rlist_dma *rdma);
         |                               ^~~~~~~~~
   include/rdma/ib_verbs.h:4217:46: warning: 'struct rlist_dma' declared inside parameter list will not be visible outside of this definition or declaration
    4217 |                                       struct rlist_dma *rdma,
         |                                              ^~~~~~~~~
   include/rdma/ib_verbs.h: In function 'ib_dma_unmap_rlist':
   include/rdma/ib_verbs.h:4222:35: error: passing argument 1 of 'rlist_dma_destroy' from incompatible pointer type [-Werror=incompatible-pointer-types]
    4222 |                 rlist_dma_destroy(rdma);
         |                                   ^~~~
         |                                   |
         |                                   struct rlist_dma *
   include/rdma/ib_verbs.h:4214:42: note: expected 'struct rlist_dma *' but argument is of type 'struct rlist_dma *'
    4214 | void rlist_dma_destroy(struct rlist_dma *rdma);
         |                        ~~~~~~~~~~~~~~~~~~^~~~
   include/rdma/ib_verbs.h:4224:24: error: implicit declaration of function 'dma_unmap_rlist'; did you mean 'ib_dma_unmap_rlist'? [-Werror=implicit-function-declaration]
    4224 |                 return dma_unmap_rlist(dev->dma_device, rdma, dir, attrs);
         |                        ^~~~~~~~~~~~~~~
         |                        ib_dma_unmap_rlist
   include/rdma/ib_verbs.h:4224:24: error: 'return' with a value, in function returning void [-Werror=return-type]
    4224 |                 return dma_unmap_rlist(dev->dma_device, rdma, dir, attrs);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/rdma/ib_verbs.h:4216:20: note: declared here
    4216 | static inline void ib_dma_unmap_rlist(struct ib_device *dev,
         |                    ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +4198 include/rdma/ib_verbs.h

  4197	
> 4198	int ib_dma_virt_map_rlist(struct rlist_cpu *rcpu, struct rlist_dma *rdma);
  4199	
  4200	static inline int ib_dma_map_rlist(struct ib_device *dev,
  4201					   struct rlist_cpu *rcpu,
  4202					   struct rlist_dma *rdma,
> 4203					   const struct rlist_dma_segmentation *segment,
  4204					   enum dma_data_direction dir,
  4205					   unsigned long attrs, gfp_t gfp)
  4206	{
  4207		if (ib_uses_virt_dma(dev))
  4208			return ib_dma_virt_map_rlist(rcpu, rdma);
  4209		return dma_map_rlist(dev->dma_device, rcpu, rdma, segment, dir, attrs,
  4210				     gfp);
  4211	}
  4212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
