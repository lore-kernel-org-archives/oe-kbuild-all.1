Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B88023B7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 10:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681814796; x=1713350796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sXE+MgxeaEIIME/QU8N+I4yw1WtgZDFcZsRT42tdQbc=;
  b=bLFaDOLdmbImc3rHIExZIsMg1bST5duOw3uMb67ZfdJELHkqEhW6YQ9q
   TeV5t4bR6DC/Ih2Rt51boNg4yg2eDssDkvjfzuLMI3AUhrcw0DrsedlzM
   griKonw4z1RjJN8fI/az5w2xzG358BvukhbpB2hJyKCCo8RurgD8i7SPl
   Xv8nVsuu4oMKxtI9dZpFiPfSbGuU0m8ObvqSwCfNffT9Zr1Gm/gBsIH7Y
   nquZdExETD7FLFe1fiYXQu2KesNGrYwUk3IFvpaaLm5uSdoHHQPZ48Oap
   38M8iL5BFUWwG4EUxfXinN7WQblrLTQ8yV8dMMElRAWUy+tEdpZ1jqJNK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="325474034"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="325474034"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 03:46:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="760313944"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="760313944"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Apr 2023 03:46:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poir4-000dHN-00;
	Tue, 18 Apr 2023 10:46:34 +0000
Date: Tue, 18 Apr 2023 18:46:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:rlist 23/28] include/rdma/ib_verbs.h:4208:52: error:
 passing argument 2 of 'ib_dma_virt_map_rlist' from incompatible pointer type
Message-ID: <202304181842.0QpIgcuY-lkp@intel.com>
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
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230418/202304181842.0QpIgcuY-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash security/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181842.0QpIgcuY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/lsm_audit.h:25,
                    from security/lsm_audit.c:29:
   include/rdma/ib_verbs.h:4198:58: warning: 'struct rlist_dma' declared inside parameter list will not be visible outside of this definition or declaration
    4198 | int ib_dma_virt_map_rlist(struct rlist_cpu *rcpu, struct rlist_dma *rdma);
         |                                                          ^~~~~~~~~
   include/rdma/ib_verbs.h:4203:49: warning: 'struct rlist_dma_segmentation' declared inside parameter list will not be visible outside of this definition or declaration
    4203 |                                    const struct rlist_dma_segmentation *segment,
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~
   include/rdma/ib_verbs.h:4202:43: warning: 'struct rlist_dma' declared inside parameter list will not be visible outside of this definition or declaration
    4202 |                                    struct rlist_dma *rdma,
         |                                           ^~~~~~~~~
   include/rdma/ib_verbs.h: In function 'ib_dma_map_rlist':
>> include/rdma/ib_verbs.h:4208:52: error: passing argument 2 of 'ib_dma_virt_map_rlist' from incompatible pointer type [-Werror=incompatible-pointer-types]
    4208 |                 return ib_dma_virt_map_rlist(rcpu, rdma);
         |                                                    ^~~~
         |                                                    |
         |                                                    struct rlist_dma *
   include/rdma/ib_verbs.h:4198:69: note: expected 'struct rlist_dma *' but argument is of type 'struct rlist_dma *'
    4198 | int ib_dma_virt_map_rlist(struct rlist_cpu *rcpu, struct rlist_dma *rdma);
         |                                                   ~~~~~~~~~~~~~~~~~~^~~~
>> include/rdma/ib_verbs.h:4209:16: error: implicit declaration of function 'dma_map_rlist'; did you mean 'ib_dma_map_rlist'? [-Werror=implicit-function-declaration]
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
>> include/rdma/ib_verbs.h:4222:35: error: passing argument 1 of 'rlist_dma_destroy' from incompatible pointer type [-Werror=incompatible-pointer-types]
    4222 |                 rlist_dma_destroy(rdma);
         |                                   ^~~~
         |                                   |
         |                                   struct rlist_dma *
   include/rdma/ib_verbs.h:4214:42: note: expected 'struct rlist_dma *' but argument is of type 'struct rlist_dma *'
    4214 | void rlist_dma_destroy(struct rlist_dma *rdma);
         |                        ~~~~~~~~~~~~~~~~~~^~~~
>> include/rdma/ib_verbs.h:4224:24: error: implicit declaration of function 'dma_unmap_rlist'; did you mean 'ib_dma_unmap_rlist'? [-Werror=implicit-function-declaration]
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


vim +/ib_dma_virt_map_rlist +4208 include/rdma/ib_verbs.h

  4199	
  4200	static inline int ib_dma_map_rlist(struct ib_device *dev,
  4201					   struct rlist_cpu *rcpu,
  4202					   struct rlist_dma *rdma,
> 4203					   const struct rlist_dma_segmentation *segment,
  4204					   enum dma_data_direction dir,
  4205					   unsigned long attrs, gfp_t gfp)
  4206	{
  4207		if (ib_uses_virt_dma(dev))
> 4208			return ib_dma_virt_map_rlist(rcpu, rdma);
> 4209		return dma_map_rlist(dev->dma_device, rcpu, rdma, segment, dir, attrs,
  4210				     gfp);
  4211	}
  4212	
  4213	/* Prevent include explosion */
> 4214	void rlist_dma_destroy(struct rlist_dma *rdma);
  4215	
  4216	static inline void ib_dma_unmap_rlist(struct ib_device *dev,
  4217					      struct rlist_dma *rdma,
  4218					      enum dma_data_direction dir,
  4219					      unsigned long attrs)
  4220	{
  4221		if (ib_uses_virt_dma(dev))
> 4222			rlist_dma_destroy(rdma);
  4223		else
> 4224			return dma_unmap_rlist(dev->dma_device, rdma, dir, attrs);
  4225	}
  4226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
