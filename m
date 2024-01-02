Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AD314A8A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jan 2024 14:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A5cqKhJE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704207453; x=1735743453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5VzesKxWKOsckXkr93gItJ52xdmgJ5rbjX4n9Mjz9Fg=;
  b=A5cqKhJEZS3gtWrTu6rlBkc1p2eijoY6maNJG65IeenrBZoSJ3BDIsMj
   R8xGR6MZiOv/AqBtPFVdiPhjWjByu0etSqJIBIEk0e03go8Fs6nDUaK/Q
   SjPEY5dj0mzzZ0pwxFTJwEqeqEEckVWmCtRvVOCQe2x8X0LO+Wh9g5NDk
   ho2hlMql5McWW5JlHhQiSbbjLVwTJzxyn9lqAK/TSi0S+Oc4kkTjcfQjR
   5cy48isnb3MAXkKYwqOqjVbpkJB0PWTXP5KwGZjSeh+gaScczvw2fKqQT
   rOix1f17LhdLaUd5aFNYB9fY4Sl3ViD2pZSKZQlQ/7WYFCG8vJdFsuMx5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="395766448"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; 
   d="scan'208";a="395766448"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 06:57:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="808531786"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; 
   d="scan'208";a="808531786"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 02 Jan 2024 06:57:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rKgCt-000LGC-2b;
	Tue, 02 Jan 2024 14:57:27 +0000
Date: Tue, 2 Jan 2024 22:56:32 +0800
From: kernel test robot <lkp@intel.com>
To: Alison Schofield <alison.schofield@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Fan Ni <fan.ni@samsung.com>
Subject: [linux-next:master 10859/12059] drivers/cxl/core/region.c:556:25:
 warning: format '%llx' expects argument of type 'long long unsigned int',
 but argument 5 has type 'resource_size_t' {aka 'unsigned int'}
Message-ID: <202401022246.En9oIBzU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ab0b3e6ef50d305278b1971891cf1d82ab050b35
commit: 7984d22f1315bf30433e11e5010e4ce09ca22037 [10859/12059] cxl/region: Add dev_dbg() detail on failure to allocate HPA space
config: riscv-randconfig-r022-20221204 (https://download.01.org/0day-ci/archive/20240102/202401022246.En9oIBzU-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240102/202401022246.En9oIBzU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401022246.En9oIBzU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from arch/riscv/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/memregion.h:7,
                    from drivers/cxl/core/region.c:3:
   drivers/cxl/core/region.c: In function 'alloc_hpa':
>> drivers/cxl/core/region.c:556:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
     556 |                         "HPA allocation error (%ld) for size:%#llx in %s %pr\n",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/cxl/core/region.c:555:17: note: in expansion of macro 'dev_dbg'
     555 |                 dev_dbg(&cxlr->dev,
         |                 ^~~~~~~
   drivers/cxl/core/region.c:556:66: note: format string is defined here
     556 |                         "HPA allocation error (%ld) for size:%#llx in %s %pr\n",
         |                                                              ~~~~^
         |                                                                  |
         |                                                                  long long unsigned int
         |                                                              %#x


vim +556 drivers/cxl/core/region.c

   522	
   523	static int alloc_hpa(struct cxl_region *cxlr, resource_size_t size)
   524	{
   525		struct cxl_root_decoder *cxlrd = to_cxl_root_decoder(cxlr->dev.parent);
   526		struct cxl_region_params *p = &cxlr->params;
   527		struct resource *res;
   528		u32 remainder = 0;
   529	
   530		lockdep_assert_held_write(&cxl_region_rwsem);
   531	
   532		/* Nothing to do... */
   533		if (p->res && resource_size(p->res) == size)
   534			return 0;
   535	
   536		/* To change size the old size must be freed first */
   537		if (p->res)
   538			return -EBUSY;
   539	
   540		if (p->state >= CXL_CONFIG_INTERLEAVE_ACTIVE)
   541			return -EBUSY;
   542	
   543		/* ways, granularity and uuid (if PMEM) need to be set before HPA */
   544		if (!p->interleave_ways || !p->interleave_granularity ||
   545		    (cxlr->mode == CXL_DECODER_PMEM && uuid_is_null(&p->uuid)))
   546			return -ENXIO;
   547	
   548		div_u64_rem(size, SZ_256M * p->interleave_ways, &remainder);
   549		if (remainder)
   550			return -EINVAL;
   551	
   552		res = alloc_free_mem_region(cxlrd->res, size, SZ_256M,
   553					    dev_name(&cxlr->dev));
   554		if (IS_ERR(res)) {
   555			dev_dbg(&cxlr->dev,
 > 556				"HPA allocation error (%ld) for size:%#llx in %s %pr\n",
   557				PTR_ERR(res), size, cxlrd->res->name, cxlrd->res);
   558			return PTR_ERR(res);
   559		}
   560	
   561		p->res = res;
   562		p->state = CXL_CONFIG_INTERLEAVE_ACTIVE;
   563	
   564		return 0;
   565	}
   566	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
