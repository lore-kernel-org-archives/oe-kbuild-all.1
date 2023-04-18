Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2B410EA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 00:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681777884; x=1713313884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=//EJMZxRId8akbAyPz6jjbtkHwbtJ5CNzJM0j+LkP4M=;
  b=Nly1QLI3xxO/ymbZw/to4aFc1hwwXROINYfUCyzKqgF+m/CnalSeolQW
   DLV1TimOZ4Y9GMGVe8Fm9bsBUNx5BOamS9ld4FHNSflsTLNYpK099TCx4
   UEcWm04yDcRZBS9pzdzk4owtMMOBRx+DNLiNRLDrVdrVatFfb847j9K8V
   FXpi6kTn6I0366j6fzi03630nsji/MQE1WzWZw0ZMlzCGQM2LmwvvrsH0
   SRgqloNgQ/ilkLMpxcoqmpphhnjSAknQ/SJvUChVcJncW9IkKG5wOt9Gv
   cAmlfZiJZLf8NQQCm71c8eyVGujBmZlGm/L8MXM4Tp3B/A4XlsHxDCmkM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="345037592"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="345037592"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 17:31:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="723436521"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="723436521"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Apr 2023 17:31:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poZFU-000cm3-0M;
	Tue, 18 Apr 2023 00:31:08 +0000
Date: Tue, 18 Apr 2023 08:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:rlist 8/28] kernel/dma/direct.c:677:5: warning: no
 previous prototype for 'dma_direct_map_rlist_slow'
Message-ID: <202304180814.enJWS2It-lkp@intel.com>
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
commit: c065bc60b255f1829a9c562593730015c4e314df [8/28] dma: Add DMA direct support for rlist mapping
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230418/202304180814.enJWS2It-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jgunthorpe/linux/commit/c065bc60b255f1829a9c562593730015c4e314df
        git remote add jgunthorpe https://github.com/jgunthorpe/linux
        git fetch --no-tags jgunthorpe rlist
        git checkout c065bc60b255f1829a9c562593730015c4e314df
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash kernel/dma/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304180814.enJWS2It-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/dma/direct.c:20:
   kernel/dma/direct.h: In function 'dma_direct_unmap_rlist':
   kernel/dma/direct.h:80:1: error: no return statement in function returning non-void [-Werror=return-type]
      80 | }
         | ^
   kernel/dma/direct.c: At top level:
>> kernel/dma/direct.c:677:5: warning: no previous prototype for 'dma_direct_map_rlist_slow' [-Wmissing-prototypes]
     677 | int dma_direct_map_rlist_slow(struct device *dev, struct rlist_cpu *rcpu,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/dma_direct_map_rlist_slow +677 kernel/dma/direct.c

   676	
 > 677	int dma_direct_map_rlist_slow(struct device *dev, struct rlist_cpu *rcpu,
   678				      struct rlist_dma *rdma,
   679				      const struct rlist_dma_segmentation *segment,
   680				      enum dma_data_direction dir, unsigned long attrs,
   681				      gfp_t gfp)
   682	{
   683		struct p2pdma_provider_map_cache cache = {};
   684		RLIST_DMA_STATE_APPEND(rlsa, rdma);
   685		struct rlist_cpu_entry entry;
   686		RLIST_CPU_STATE(rls, rcpu);
   687		int ret;
   688	
   689		ret = rlsdma_append_begin(&rlsa);
   690		if (ret)
   691			return ret;
   692	
   693		rlist_cpu_for_each_entry(&rls, &entry) {
   694			unsigned int priv;
   695			dma_addr_t dma;
   696	
   697			switch (entry.type) {
   698			case RLIST_CPU_MEM_FOLIO:
   699				priv = DMA_DIRECT_PRIV_PAGE;
   700				dma = dma_direct_map_page(
   701					dev,
   702					folio_page(entry.folio,
   703						   entry.folio_offset / PAGE_SIZE),
   704					entry.folio_offset % PAGE_SIZE, entry.length,
   705					dir, attrs);
   706				break;
   707	
   708			case RLIST_CPU_MEM_PHYSICAL: {
   709				struct p2pdma_provider *provider =
   710					p2pdma_provider_from_id(entry.provider_index);
   711	
   712				ret = p2pdma_provider_map(dev, provider, entry.phys,
   713							  &dma, &cache);
   714				if (ret) {
   715					if (ret == P2P_MAP_FILLED_DMA) {
   716						priv = DMA_DIRECT_PRIV_P2P;
   717						break;
   718					}
   719					goto err;
   720				}
   721	
   722				priv = DMA_DIRECT_PRIV_RESOURCE;
   723				dma = dma_direct_map_resource(dev, entry.phys,
   724							      entry.length, dir, attrs);
   725				break;
   726			}
   727	
   728			default:
   729				WARN(true, "Corrupt rlist_cpu");
   730				ret = -EINVAL;
   731				goto err;
   732			}
   733	
   734			if (dma == DMA_MAPPING_ERROR) {
   735				ret = -EIO;
   736				goto err;
   737			}
   738	
   739			ret = rlsdma_append(&rlsa, dma, entry.length, priv, gfp);
   740			if (ret)
   741				goto err;
   742		}
   743		rlsdma_append_end(&rlsa);
   744		return 0;
   745	
   746	err:
   747		rlsdma_append_destroy_rlist(&rlsa);
   748		return ret;
   749	}
   750	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
