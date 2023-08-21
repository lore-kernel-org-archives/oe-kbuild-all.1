Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B02411737
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 20:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692651335; x=1724187335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tE4Ffp7QU0mTN0SxHfM5hIGl3Xst2sOD697wBBjsgWM=;
  b=DVzTjvSVYI1ln9IWpRgDJ1qsSiT/BlqRqiAwMWu91ukMuLsRT/0gqCUS
   hV2VqvwhUjlkmYAobGv6ZofMEXWQnp53GmG+3wCig0S081+QdCMBe7yfN
   CF/WtCfa+uVPcWtrCSskaS/0hs4vRmVOIW4P0DTojRftMkJu/av1TXMAD
   QjpJYIjIKT7Dj4b1WhKjYMOPjzCuOFfsqFmRSd3FE8ruTFHo10AEhpVgE
   jSgr37gpRFBvEPN8H6Ioa1KPPyG5zuoEuboHfkxlBc+cXJsR61MuRploh
   96vxpHKPpr2Wbh7dqK9gbVRM/Ne+fKJW4JcXh7X6UjTijC85LKU+dKqQZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="373673720"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="373673720"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 13:55:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="771094331"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="771094331"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 21 Aug 2023 13:55:28 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYBvL-0000v1-2f;
	Mon, 21 Aug 2023 20:55:06 +0000
Date: Tue, 22 Aug 2023 04:53:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 14026/30000]
 mm/page_alloc.c:133:40: sparse: sparse: restricted gfp_t degrades to integer
Message-ID: <202308220459.MdbB9LVT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   a89c7b9715e2d482a08b58b698f0cf37da373070
commit: c29070e5b92b5505f5a13291c443a68309f72c4c [14026/30000] ANDROID: GKI: cma: redirect page allocation to CMA
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20230822/202308220459.MdbB9LVT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220459.MdbB9LVT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220459.MdbB9LVT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> init/main.c:1150:28: sparse: sparse: restricted gfp_t degrades to integer
>> init/main.c:1150:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted gfp_t extern [addressable] [toplevel] [usertype] gfp_allowed_mask @@     got unsigned int @@
   init/main.c:1150:26: sparse:     expected restricted gfp_t extern [addressable] [toplevel] [usertype] gfp_allowed_mask
   init/main.c:1150:26: sparse:     got unsigned int
   init/main.c:484:20: warning: no previous prototype for 'arch_post_acpi_subsys_init' [-Wmissing-prototypes]
     484 | void __init __weak arch_post_acpi_subsys_init(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   init/main.c:496:20: warning: no previous prototype for 'mem_encrypt_init' [-Wmissing-prototypes]
     496 | void __init __weak mem_encrypt_init(void) { }
         |                    ^~~~~~~~~~~~~~~~
--
>> mm/slub.c:1675:13: sparse: sparse: restricted gfp_t degrades to integer
>> mm/slub.c:1675:13: sparse: sparse: restricted gfp_t degrades to integer
>> mm/slub.c:1675:13: sparse: sparse: restricted gfp_t degrades to integer
   mm/slub.c:1676:46: sparse: sparse: restricted gfp_t degrades to integer
   mm/slub.c:1676:46: sparse: sparse: restricted gfp_t degrades to integer
   mm/slub.c:1676:38: sparse: sparse: restricted gfp_t degrades to integer
>> mm/slub.c:1676:44: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted gfp_t [usertype] invalid_mask @@     got unsigned int @@
   mm/slub.c:1676:44: sparse:     expected restricted gfp_t [usertype] invalid_mask
   mm/slub.c:1676:44: sparse:     got unsigned int
   mm/slub.c:1677:27: sparse: sparse: restricted gfp_t degrades to integer
   mm/slub.c:1677:27: sparse: sparse: restricted gfp_t degrades to integer
>> mm/slub.c:1677:23: sparse: sparse: invalid assignment: &=
>> mm/slub.c:1677:23: sparse:    left side has type restricted gfp_t
>> mm/slub.c:1677:23: sparse:    right side has type unsigned int
   mm/slub.c:3662:52: sparse: sparse: cast from restricted slab_flags_t
   mm/slub.c:2151:28: sparse: sparse: context imbalance in 'deactivate_slab' - unexpected unlock
   mm/slub.c:2731:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2731:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2731:21: sparse:     got void ***
   mm/slub.c:2731:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2731:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2731:21: sparse:     got unsigned long *
   mm/slub.c:2731:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2731:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2731:21: sparse:     got void ***
   mm/slub.c:2731:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2731:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2731:21: sparse:     got unsigned long *
   mm/slub.c:2731:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2731:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2731:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2731:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2731:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2731:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2731:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2731:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2838:47: sparse: sparse: context imbalance in '__slab_free' - unexpected unlock
   mm/slub.c:2973:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2973:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2973:21: sparse:     got void ***
   mm/slub.c:2973:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2973:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2973:21: sparse:     got unsigned long *
   mm/slub.c:2973:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2973:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2973:21: sparse:     got void ***
   mm/slub.c:2973:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2973:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2973:21: sparse:     got unsigned long *
   mm/slub.c:2973:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2973:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2973:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2973:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2973:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2973:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2973:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2973:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2973:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2973:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2973:21: sparse:     got void ***
   mm/slub.c:2973:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2973:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2973:21: sparse:     got unsigned long *
   mm/slub.c:2973:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2973:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2973:21: sparse:     got void ***
   mm/slub.c:2973:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2973:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2973:21: sparse:     got unsigned long *
   mm/slub.c:2973:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2973:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2973:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2973:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2973:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2973:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2973:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2973:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2731:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2731:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2731:21: sparse:     got void ***
   mm/slub.c:2731:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2731:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2731:21: sparse:     got unsigned long *
   mm/slub.c:2731:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2731:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2731:21: sparse:     got void ***
   mm/slub.c:2731:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2731:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2731:21: sparse:     got unsigned long *
   mm/slub.c:2731:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2731:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2731:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2731:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2731:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2731:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2731:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2731:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2973:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2973:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2973:21: sparse:     got void ***
   mm/slub.c:2973:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2973:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2973:21: sparse:     got unsigned long *
   mm/slub.c:2973:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2973:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2973:21: sparse:     got void ***
   mm/slub.c:2973:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2973:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2973:21: sparse:     got unsigned long *
   mm/slub.c:2973:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2973:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2973:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2973:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2973:21: sparse: sparse: dereference of noderef expression
--
   mm/page_alloc.c:100:1: sparse: sparse: symbol 'pcpu_drain_mutex' was not declared. Should it be static?
>> mm/page_alloc.c:133:40: sparse: sparse: restricted gfp_t degrades to integer
>> mm/page_alloc.c:133:40: sparse: sparse: restricted gfp_t degrades to integer
>> mm/page_alloc.c:133:40: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted gfp_t [addressable] [toplevel] [usertype] gfp_allowed_mask @@     got unsigned int @@
   mm/page_alloc.c:133:40: sparse:     expected restricted gfp_t [addressable] [toplevel] [usertype] gfp_allowed_mask
   mm/page_alloc.c:133:40: sparse:     got unsigned int
   mm/page_alloc.c:2594:29: sparse: sparse: Using plain integer as NULL pointer
   mm/page_alloc.c:2604:50: sparse: sparse: not enough arguments for function __rmqueue_fallback
   mm/page_alloc.c:3097:51: sparse: sparse: incorrect type in argument 7 (different base types) @@     expected int cma @@     got restricted gfp_t @@
   mm/page_alloc.c:3097:51: sparse:     expected int cma
   mm/page_alloc.c:3097:51: sparse:     got restricted gfp_t
   mm/page_alloc.c: note: in included file (through include/linux/mm.h):
   include/linux/gfp.h:325:27: sparse: sparse: restricted gfp_t degrades to integer
   mm/page_alloc.c:1485:6: warning: no previous prototype for 'set_zone_contiguous' [-Wmissing-prototypes]
    1485 | void set_zone_contiguous(struct zone *zone)
         |      ^~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:1506:6: warning: no previous prototype for 'clear_zone_contiguous' [-Wmissing-prototypes]
    1506 | void clear_zone_contiguous(struct zone *zone)
         |      ^~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:2330:5: warning: no previous prototype for 'find_suitable_fallback' [-Wmissing-prototypes]
    2330 | int find_suitable_fallback(struct free_area *area, unsigned int order,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c: In function '__rmqueue_cma':
   mm/page_alloc.c:2604:32: error: too few arguments to function '__rmqueue_fallback'
    2604 |         if (unlikely(!page) && __rmqueue_fallback(zone, order, migratetype))
         |                                ^~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:2492:1: note: declared here
    2492 | __rmqueue_fallback(struct zone *zone, int order, int start_migratetype,
         | ^~~~~~~~~~~~~~~~~~
   mm/page_alloc.c: In function 'mem_init_print_info':
   mm/page_alloc.c:7326:27: warning: comparison between two arrays [-Warray-compare]
    7326 |                 if (start <= pos && pos < end && size > adj) 41-      |                           ^~
   mm/page_alloc.c:7330:9: note: in expansion of macro 'adj_init_size'
    7330 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7326:27: note: use '&__init_begin[0] <= &_sinittext[0]' to compare the addresses
    7326 |                 if (start <= pos && pos < end && size > adj) 47-      |                           ^~
   mm/page_alloc.c:7330:9: note: in expansion of macro 'adj_init_size'
    7330 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7326:41: warning: comparison between two arrays [-Warray-compare]
    7326 |                 if (start <= pos && pos < end && size > adj) 53-      |                                         ^
   mm/page_alloc.c:7330:9: note: in expansion of macro 'adj_init_size'
    7330 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7326:41: note: use '&_sinittext[0] < &__init_end[0]' to compare the addresses
    7326 |                 if (start <= pos && pos < end && size > adj) 59-      |                                         ^
   mm/page_alloc.c:7330:9: note: in expansion of macro 'adj_init_size'
    7330 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7326:27: warning: comparison between two arrays [-Warray-compare]
    7326 |                 if (start <= pos && pos < end && size > adj) 65-      |                           ^~
   mm/page_alloc.c:7332:9: note: in expansion of macro 'adj_init_size'
    7332 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7326:27: note: use '&_stext[0] <= &_sinittext[0]' to compare the addresses
    7326 |                 if (start <= pos && pos < end && size > adj) 71-      |                           ^~
   mm/page_alloc.c:7332:9: note: in expansion of macro 'adj_init_size'
    7332 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7326:41: warning: comparison between two arrays [-Warray-compare]
    7326 |                 if (start <= pos && pos < end && size > adj) 77-      |                                         ^
   mm/page_alloc.c:7332:9: note: in expansion of macro 'adj_init_size'
    7332 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7326:41: note: use '&_sinittext[0] < &_etext[0]' to compare the addresses
    7326 |                 if (start <= pos && pos < end && size > adj) 83-      |                                         ^
   mm/page_alloc.c:7332:9: note: in expansion of macro 'adj_init_size'
    7332 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7326:27: warning: comparison between two arrays [-Warray-compare]
    7326 |                 if (start <= pos && pos < end && size > adj) 89-      |                           ^~
   mm/page_alloc.c:7333:9: note: in expansion of macro 'adj_init_size'
    7333 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7326:27: note: use '&_sdata[0] <= &__init_begin[0]' to compare the addresses
    7326 |                 if (start <= pos && pos < end && size > adj) 95-      |                           ^~
   mm/page_alloc.c:7333:9: note: in expansion of macro 'adj_init_size'
    7333 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7326:41: warning: comparison between two arrays [-Warray-compare]
    7326 |                 if (start <= pos && pos < end && size > adj) 101-      |                                         ^
   mm/page_alloc.c:7333:9: note: in expansion of macro 'adj_init_size'
    7333 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7326:41: note: use '&__init_begin[0] < &_edata[0]' to compare the addresses
    7326 |                 if (start <= pos && pos < end && size > adj) 107-      |                                         ^
   mm/page_alloc.c:7333:9: note: in expansion of macro 'adj_init_size'
--
   lib/radix-tree.c:182:24: sparse: sparse: invalid assignment: &=
   lib/radix-tree.c:182:24: sparse:    left side has type restricted gfp_t
   lib/radix-tree.c:182:24: sparse:    right side has type int
>> lib/radix-tree.c:149:34: sparse: sparse: restricted gfp_t degrades to integer
   lib/radix-tree.c:149:52: sparse: sparse: restricted gfp_t degrades to integer
   lib/radix-tree.c:149:20: sparse: sparse: restricted gfp_t degrades to integer
>> lib/radix-tree.c:149:31: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted gfp_t @@     got unsigned int @@
   lib/radix-tree.c:149:31: sparse:     expected restricted gfp_t
   lib/radix-tree.c:149:31: sparse:     got unsigned int
   lib/radix-tree.c:182:24: sparse: sparse: invalid assignment: &=
   lib/radix-tree.c:182:24: sparse:    left side has type restricted gfp_t
   lib/radix-tree.c:182:24: sparse:    right side has type int
   lib/radix-tree.c: In function 'set_iter_tags':
   lib/radix-tree.c:1601:22: warning: comparison is always false due to limited range of data type [-Wtype-limits]
    1601 |         if (tag_long < RADIX_TREE_TAG_LONGS - 1) {
         |                      ^
   lib/radix-tree.c:234: warning: Function parameter or member 'node' not described in 'radix_tree_find_next_bit'
   lib/radix-tree.c:234: warning: Function parameter or member 'tag' not described in 'radix_tree_find_next_bit'
   lib/radix-tree.c:234: warning: Excess function parameter 'addr' description in 'radix_tree_find_next_bit'
   lib/radix-tree.c:234: warning: Excess function parameter 'size' description in 'radix_tree_find_next_bit'
   lib/radix-tree.c:682: warning: Function parameter or member 'root' not described in 'radix_tree_shrink'
   lib/radix-tree.c:682: warning: Function parameter or member 'update_node' not described in 'radix_tree_shrink'
   lib/radix-tree.c:1243: warning: Function parameter or member 'iter' not described in 'radix_tree_iter_replace'
   lib/radix-tree.o: warning: objtool: missing symbol for section .init.text

vim +133 mm/page_alloc.c

ab8fabd46f811d Johannes Weiner        2012-01-10  131  
1b76b02f15c70d Hugh Dickins           2012-05-11  132  int percpu_pagelist_fraction;
dcce284a259373 Benjamin Herrenschmidt 2009-06-18 @133  gfp_t gfp_allowed_mask __read_mostly = GFP_BOOT_MASK;
a5587d8fce365c Alexander Potapenko    2019-07-11  134  #ifdef CONFIG_INIT_ON_ALLOC_DEFAULT_ON
a5587d8fce365c Alexander Potapenko    2019-07-11  135  DEFINE_STATIC_KEY_TRUE(init_on_alloc);
a5587d8fce365c Alexander Potapenko    2019-07-11  136  #else
a5587d8fce365c Alexander Potapenko    2019-07-11  137  DEFINE_STATIC_KEY_FALSE(init_on_alloc);
a5587d8fce365c Alexander Potapenko    2019-07-11  138  #endif
a5587d8fce365c Alexander Potapenko    2019-07-11  139  EXPORT_SYMBOL(init_on_alloc);
a5587d8fce365c Alexander Potapenko    2019-07-11  140  

:::::: The code at line 133 was first introduced by commit
:::::: dcce284a259373f9e5570f2e33f79eca84fcf565 mm: Extend gfp masking to the page allocator

:::::: TO: Benjamin Herrenschmidt <benh@kernel.crashing.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
