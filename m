Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FE82D021
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 16:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="TSbHzaEs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:subject:message-id:mime-version;
  bh=b0pWc1wISIKwaYr0AeIPUmnRuU1To0P4VSl9jMcXGY0=;
  b=TSbHzaEsSdWM4AvoAvpTL/L8IHD6Y4oWmd/NNEcA+hMpTYMxIowXa6rd
   FpjylXjr0LThE9xdzcpJW3IMoaHTF82a9o3p57mxWz1c+ftt1El6VtqBw
   DIX6f2g8ZQYwYRU5TUV7wAE7ziPZUz6x/xwffGyoFfJi8QD9/qSINrCVF
   E=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.03,232,1694728800"; 
   d="scan'208";a="131743112"
Received: from unknown (HELO hadrien) ([87.129.180.234])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 18:33:31 +0200
Date: Tue, 17 Oct 2023 18:33:27 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Vishal Verma <vishal.l.verma@intel.com>, 
    Dan Williams <dan.j.williams@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: [vishal:vv/kmem_memmap 9/10] mm/memory_hotplug.c:2222:47-53: ERROR:
 reference preceded by free on line 2227 (fwd)
Message-ID: <50574151-4ff0-72fb-3f17-2e2ffc9efc2e@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hello,

On line 2222 there is a reference to altmap.  It is not clear to me that
the variable altmap has been defined on the current iteration of the loop.
If it comes from the previous iteration, it might have been freed.  Maybe
there is an if or a return that is missing?

julia

---------- Forwarded message ----------
Date: Wed, 18 Oct 2023 00:06:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [vishal:vv/kmem_memmap 9/10] mm/memory_hotplug.c:2222:47-53: ERROR:
    reference preceded by free on line 2227

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Vishal Verma <vishal.l.verma@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vishal/linux.git vv/kmem_memmap
head:   f5df6ac59f4892cfe6652e6ea6ed4a215c876167
commit: 9ee1af799da9d50227164305de8427a973e6c9dc [9/10] mm/memory_hotplug: split memmap_on_memory requests across memblocks
:::::: branch date: 11 hours ago
:::::: commit date: 22 hours ago
config: x86_64-randconfig-103-20231017 (https://download.01.org/0day-ci/archive/20231017/202310172338.PnRN2B8y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310172338.PnRN2B8y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202310172338.PnRN2B8y-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/memory_hotplug.c:2222:47-53: ERROR: reference preceded by free on line 2227

vim +2222 mm/memory_hotplug.c

60a5a19e7419ba0 Tang Chen         2013-02-22  2189
9ee1af799da9d50 Vishal Verma      2023-08-01  2190  static void __ref remove_memory_blocks_and_altmaps(u64 start, u64 size)
bbc76be67c2c0c1 Wen Congyang      2013-02-22  2191  {
9ee1af799da9d50 Vishal Verma      2023-08-01  2192  	unsigned long memblock_size = memory_block_size_bytes();
25b5b1a0646c3d3 Aneesh Kumar K.V  2023-08-08  2193  	struct vmem_altmap *altmap = NULL;
9ee1af799da9d50 Vishal Verma      2023-08-01  2194  	struct memory_block *mem;
9ee1af799da9d50 Vishal Verma      2023-08-01  2195  	u64 cur_start;
9ee1af799da9d50 Vishal Verma      2023-08-01  2196  	int rc;
6677e3eaf4d78ab Yasuaki Ishimatsu 2013-02-22  2197
a08a2ae3461383c Oscar Salvador    2021-05-04  2198  	/*
9ee1af799da9d50 Vishal Verma      2023-08-01  2199  	 * For memmap_on_memory, the altmaps could have been added on
9ee1af799da9d50 Vishal Verma      2023-08-01  2200  	 * a per-memblock basis. Loop through the entire range if so,
9ee1af799da9d50 Vishal Verma      2023-08-01  2201  	 * and remove each memblock and its altmap.
a08a2ae3461383c Oscar Salvador    2021-05-04  2202  	 */
9ee1af799da9d50 Vishal Verma      2023-08-01  2203  	for (cur_start = start; cur_start < start + size;
9ee1af799da9d50 Vishal Verma      2023-08-01  2204  	     cur_start += memblock_size) {
9ee1af799da9d50 Vishal Verma      2023-08-01  2205  		rc = walk_memory_blocks(cur_start, memblock_size, &mem,
9ee1af799da9d50 Vishal Verma      2023-08-01  2206  					test_has_altmap_cb);
25b5b1a0646c3d3 Aneesh Kumar K.V  2023-08-08  2207  		if (rc) {
25b5b1a0646c3d3 Aneesh Kumar K.V  2023-08-08  2208  			altmap = mem->altmap;
a08a2ae3461383c Oscar Salvador    2021-05-04  2209  			/*
25b5b1a0646c3d3 Aneesh Kumar K.V  2023-08-08  2210  			 * Mark altmap NULL so that we can add a debug
25b5b1a0646c3d3 Aneesh Kumar K.V  2023-08-08  2211  			 * check on memblock free.
a08a2ae3461383c Oscar Salvador    2021-05-04  2212  			 */
25b5b1a0646c3d3 Aneesh Kumar K.V  2023-08-08  2213  			mem->altmap = NULL;
a08a2ae3461383c Oscar Salvador    2021-05-04  2214  		}
4c4b7f9ba9486c5 David Hildenbrand 2019-07-18  2215
f1037ec0cc8ac1a Dan Williams      2020-01-30  2216  		/*
f1037ec0cc8ac1a Dan Williams      2020-01-30  2217  		 * Memory block device removal under the device_hotplug_lock is
f1037ec0cc8ac1a Dan Williams      2020-01-30  2218  		 * a barrier against racing online attempts.
f1037ec0cc8ac1a Dan Williams      2020-01-30  2219  		 */
9ee1af799da9d50 Vishal Verma      2023-08-01  2220  		remove_memory_block_devices(cur_start, memblock_size);
f1037ec0cc8ac1a Dan Williams      2020-01-30  2221
9ee1af799da9d50 Vishal Verma      2023-08-01 @2222  		arch_remove_memory(cur_start, memblock_size, altmap);
52219aeaf2dc6f7 David Hildenbrand 2020-06-04  2223
25b5b1a0646c3d3 Aneesh Kumar K.V  2023-08-08  2224  		/* Verify that all vmemmap pages have actually been freed. */
25b5b1a0646c3d3 Aneesh Kumar K.V  2023-08-08  2225  		if (altmap) {
25b5b1a0646c3d3 Aneesh Kumar K.V  2023-08-08  2226  			WARN(altmap->alloc, "Altmap not fully unmapped");
25b5b1a0646c3d3 Aneesh Kumar K.V  2023-08-08 @2227  			kfree(altmap);
25b5b1a0646c3d3 Aneesh Kumar K.V  2023-08-08  2228  		}
9ee1af799da9d50 Vishal Verma      2023-08-01  2229  	}
9ee1af799da9d50 Vishal Verma      2023-08-01  2230  }
9ee1af799da9d50 Vishal Verma      2023-08-01  2231

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
