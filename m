Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B24C1429B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 08:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693296774; x=1724832774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FOfEB2SktciJpNOXwRhf2i0GkCjj68615sSjxJjI8rw=;
  b=aD1gPv0Zv6JoIW4fmoJDaMsb5WKmSLtMm3Zw5n8qjCPhd9Jafvxpsrio
   o9CQ3uuPyVs05wPTPFuS69PQ4SZMXdSOI2mCy6jHhHHGKCWAtRyKDa8jg
   qe8YrbBJflq1c4Thj9qj7H7NKkMMWbKUoLpMBWErcgmhQ5iyMO9nRanZX
   XaQHoseKXfLpWCmiDvWI/Ptc5wMxnCj7/rNt2LfqN6E4dONcaL2TzAeWQ
   csYdxfuWsnQ8lMoOGRad0GAssp4o58Y8WuMXXl2qpmUzKmBboKKbx2zoV
   AueHa93OfvmFuo2ywHAi+1LoSrf1sqzzbgLejDxPr+Sbh4dydxOMdyU21
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="439261187"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="439261187"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 01:12:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="862151837"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="862151837"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 29 Aug 2023 01:12:52 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qatqF-0008YJ-1F;
	Tue, 29 Aug 2023 08:12:51 +0000
Date: Tue, 29 Aug 2023 16:12:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Navneet Singh <navneet.singh@intel.com>
Subject: [weiny2:dcd-v2-2023-08-28 24/36] drivers/cxl/core/hdm.c:430:38:
 warning: format '%llx' expects argument of type 'long long unsigned int',
 but argument 6 has type 'resource_size_t' {aka 'unsigned int'}
Message-ID: <202308291630.KXcO03Nt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-v2-2023-08-28
head:   4e8d6c7176cb59f986a4365a6c6bd7d3610c229e
commit: 7331cb03643ce725e68eaaec47bcacd02b208ee1 [24/36] cxl/port: Add Dynamic Capacity size support to endpoint decoders
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230829/202308291630.KXcO03Nt-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291630.KXcO03Nt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291630.KXcO03Nt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:564,
                    from include/linux/kernel.h:30,
                    from arch/parisc/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/seq_file.h:8,
                    from drivers/cxl/core/hdm.c:3:
   drivers/cxl/core/hdm.c: In function '__cxl_dpa_reserve':
>> drivers/cxl/core/hdm.c:430:38: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 6 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
     430 |                         dev_dbg(dev, "decoder%d.%d: failed to reserve skipped space; %#llx - %#llx\n",
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:222:29: note: in definition of macro '__dynamic_func_call_cls'
     222 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '_dynamic_func_call_cls'
     248 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:271:9: note: in expansion of macro '_dynamic_func_call'
     271 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/cxl/core/hdm.c:430:25: note: in expansion of macro 'dev_dbg'
     430 |                         dev_dbg(dev, "decoder%d.%d: failed to reserve skipped space; %#llx - %#llx\n",
         |                         ^~~~~~~
   drivers/cxl/core/hdm.c:430:90: note: format string is defined here
     430 |                         dev_dbg(dev, "decoder%d.%d: failed to reserve skipped space; %#llx - %#llx\n",
         |                                                                                      ~~~~^
         |                                                                                          |
         |                                                                                          long long unsigned int
         |                                                                                      %#x
   drivers/cxl/core/hdm.c:430:38: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 7 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
     430 |                         dev_dbg(dev, "decoder%d.%d: failed to reserve skipped space; %#llx - %#llx\n",
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:222:29: note: in definition of macro '__dynamic_func_call_cls'
     222 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '_dynamic_func_call_cls'
     248 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:271:9: note: in expansion of macro '_dynamic_func_call'
     271 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/cxl/core/hdm.c:430:25: note: in expansion of macro 'dev_dbg'
     430 |                         dev_dbg(dev, "decoder%d.%d: failed to reserve skipped space; %#llx - %#llx\n",
         |                         ^~~~~~~
   drivers/cxl/core/hdm.c:430:98: note: format string is defined here
     430 |                         dev_dbg(dev, "decoder%d.%d: failed to reserve skipped space; %#llx - %#llx\n",
         |                                                                                              ~~~~^
         |                                                                                                  |
         |                                                                                                  long long unsigned int
         |                                                                                              %#x
   drivers/cxl/core/hdm.c: In function 'cxl_dpa_alloc':
   drivers/cxl/core/hdm.c:729:22: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
     729 |         dev_dbg(dev, "DPA Allocation start: %llx len: %llx Skip: %llx\n",
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:222:29: note: in definition of macro '__dynamic_func_call_cls'
     222 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '_dynamic_func_call_cls'
     248 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:271:9: note: in expansion of macro '_dynamic_func_call'
     271 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/cxl/core/hdm.c:729:9: note: in expansion of macro 'dev_dbg'
     729 |         dev_dbg(dev, "DPA Allocation start: %llx len: %llx Skip: %llx\n",
         |         ^~~~~~~
   drivers/cxl/core/hdm.c:729:48: note: format string is defined here
     729 |         dev_dbg(dev, "DPA Allocation start: %llx len: %llx Skip: %llx\n",
         |                                             ~~~^
         |                                                |
         |                                                long long unsigned int
         |                                             %x
   drivers/cxl/core/hdm.c:729:22: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 6 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
     729 |         dev_dbg(dev, "DPA Allocation start: %llx len: %llx Skip: %llx\n",
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:222:29: note: in definition of macro '__dynamic_func_call_cls'
     222 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '_dynamic_func_call_cls'
     248 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:271:9: note: in expansion of macro '_dynamic_func_call'
     271 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/cxl/core/hdm.c:729:9: note: in expansion of macro 'dev_dbg'


vim +430 drivers/cxl/core/hdm.c

   389	
   390	static int __cxl_dpa_reserve(struct cxl_endpoint_decoder *cxled,
   391				     resource_size_t base, resource_size_t len,
   392				     resource_size_t skipped)
   393	{
   394		struct cxl_memdev *cxlmd = cxled_to_memdev(cxled);
   395		struct cxl_port *port = cxled_to_port(cxled);
   396		struct cxl_dev_state *cxlds = cxlmd->cxlds;
   397		struct device *dev = &port->dev;
   398		struct resource *res;
   399	
   400		lockdep_assert_held_write(&cxl_dpa_rwsem);
   401	
   402		if (!len) {
   403			dev_warn(dev, "decoder%d.%d: empty reservation attempted\n",
   404				 port->id, cxled->cxld.id);
   405			return -EINVAL;
   406		}
   407	
   408		if (cxled->dpa_res) {
   409			dev_dbg(dev, "decoder%d.%d: existing allocation %pr assigned\n",
   410				port->id, cxled->cxld.id, cxled->dpa_res);
   411			return -EBUSY;
   412		}
   413	
   414		if (port->hdm_end + 1 != cxled->cxld.id) {
   415			/*
   416			 * Assumes alloc and commit order is always in hardware instance
   417			 * order per expectations from 8.2.5.12.20 Committing Decoder
   418			 * Programming that enforce decoder[m] committed before
   419			 * decoder[m+1] commit start.
   420			 */
   421			dev_dbg(dev, "decoder%d.%d: expected decoder%d.%d\n", port->id,
   422				cxled->cxld.id, port->id, port->hdm_end + 1);
   423			return -EBUSY;
   424		}
   425	
   426		if (skipped) {
   427			int rc = cxl_reserve_dpa_skip(cxled, base, skipped);
   428	
   429			if (rc) {
 > 430				dev_dbg(dev, "decoder%d.%d: failed to reserve skipped space; %#llx - %#llx\n",
   431					port->id, cxled->cxld.id, base, skipped);
   432				return rc;
   433			}
   434		}
   435		res = __request_region(&cxlds->dpa_res, base, len,
   436				       dev_name(&cxled->cxld.dev), 0);
   437		if (!res) {
   438			dev_dbg(dev, "decoder%d.%d: failed to reserve allocation\n",
   439				port->id, cxled->cxld.id);
   440			cxl_skip_release(cxled);
   441			return -EBUSY;
   442		}
   443		cxled->dpa_res = res;
   444		cxled->skip = skipped;
   445	
   446		for (int mode = CXL_DECODER_DC0; mode <= CXL_DECODER_DC7; mode++) {
   447			int index = dc_mode_to_region_index(mode);
   448	
   449			if (resource_contains(&cxlds->dc_res[index], res)) {
   450				cxled->mode = mode;
   451				goto success;
   452			}
   453		}
   454		if (resource_contains(&cxlds->pmem_res, res))
   455			cxled->mode = CXL_DECODER_PMEM;
   456		else if (resource_contains(&cxlds->ram_res, res))
   457			cxled->mode = CXL_DECODER_RAM;
   458		else {
   459			dev_dbg(dev, "decoder%d.%d: %pr mixed\n", port->id,
   460				cxled->cxld.id, cxled->dpa_res);
   461			cxled->mode = CXL_DECODER_MIXED;
   462		}
   463	
   464	success:
   465		dev_dbg(dev, "decoder%d.%d: %pr mode: %d\n", port->id, cxled->cxld.id,
   466			cxled->dpa_res, cxled->mode);
   467		port->hdm_end++;
   468		get_device(&cxled->cxld.dev);
   469		return 0;
   470	}
   471	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
