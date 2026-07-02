Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA9C4A3405
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 13:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783000630; cv=none; b=Vxjyqh3n3Iv55M8oc2i2Y9/pH3mXF1YyKiTwp0JkKKv1//kh4bpA4zqTFowvTbVsATfvJ8GwoGqgLZwVutK58kcu02zC9XOd57bWkAIssxiY0PgFvvz7ePs81rHKckr9mzmPvmnVXigpjl0jWxexpHL+u4hYr0MpYLhTJJW+LPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783000630; c=relaxed/simple;
	bh=px/uXrOb02slpuBu1iIWsbDpPx7WXlYybNe5Zk6yYUU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eHNwcJIn2DUlPeZk4nSSvktuT6ERlIZlV9UDqJAWJy0Q6MhL795KgfWWK4isLgVbqWtxn4Ql09depn4COTHnQSkrDdzzNxq9Fsz9VU1Az3+qGm+p5UWqp32VHVsp1P5P784VVf1m2GhkzMv9ww9tEBw2GDstNYNy2S+fM/y16ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CH2+D7QX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CH2+D7QX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783000629; x=1814536629;
  h=date:from:to:cc:subject:message-id;
  bh=px/uXrOb02slpuBu1iIWsbDpPx7WXlYybNe5Zk6yYUU=;
  b=CH2+D7QXIRLKJTzRoovWM2591RehYLS/aTyJyeGysNPJxwCxnxxbXXks
   poXIQ/ozZwnD2BA/Si6URHWTOpMD5HxFjFj/55gJMvYlmdsQAEXF0l9WY
   h5S8uJ6EFbIng6l6en4VAWDbtgcPEzaX0+kzRWaQJBHQQC0KzHH59tGE4
   9KdcqW50Mn7cFZOuQ2avBGxb2jJOE2XmxDHHR+sIZ/kSSgAFgI2BgGCS2
   500tpjLgHcMi7dhJZj3K6FBPxYZ1aZzSAPZlaXFuZIfN93y8f6Kn68cA7
   JHVuRbdHE23tknTb0VnAmTpWTNcX4O47oJwp+w9Yi2FSOeafkDy0KPxFd
   g==;
X-CSE-ConnectionGUID: +ZTbie/ZSaSQeEnWKdMHNA==
X-CSE-MsgGUID: RxQLRoqqRL62Ns40fZZApQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="71277353"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="71277353"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 06:57:08 -0700
X-CSE-ConnectionGUID: PLnZt5EZQgevM7B8fetZIg==
X-CSE-MsgGUID: /66F3KZUSyKfU/CEFyctqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="276076523"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 02 Jul 2026 06:57:06 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfHua-000000001FV-0QLi;
	Thu, 02 Jul 2026 13:57:04 +0000
Date: Thu, 02 Jul 2026 15:56:48 +0200
From: kernel test robot <lkp@intel.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: mm/memcontrol.c:2236:13: warning: 'is_memcg_drain_needed'
 defined but not used
Message-ID: <202607021504.Zvzp7DZ4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Joshua-Hahn/mm-page_counter-introduce-per-page_counter-stock/20260624-020302
head:   e0d3c5d206653c4cdfc0afccbacf2ea7b39cdb8e
commit: 1e8017bb42651bb1dc84917b7864ae6159866b1d mm/memcontrol: convert memcg to use page_counter_stock
date:   9 days ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260702/202607021504.Zvzp7DZ4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021504.Zvzp7DZ4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021504.Zvzp7DZ4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcontrol.c:2236:13: warning: 'is_memcg_drain_needed' defined but not used [-Wunused-function]
    2236 | static bool is_memcg_drain_needed(struct memcg_stock_pcp *stock,
         |             ^~~~~~~~~~~~~~~~~~~~~
>> mm/memcontrol.c:2177:13: warning: 'refill_stock' defined but not used [-Wunused-function]
    2177 | static void refill_stock(struct mem_cgroup *memcg, unsigned int nr_pages)
         |             ^~~~~~~~~~~~
>> mm/memcontrol.c:2145:13: warning: 'drain_local_memcg_stock' defined but not used [-Wunused-function]
    2145 | static void drain_local_memcg_stock(struct work_struct *dummy)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
>> mm/memcontrol.c:2079:13: warning: 'consume_stock' defined but not used [-Wunused-function]
    2079 | static bool consume_stock(struct mem_cgroup *memcg, unsigned int nr_pages)
         |             ^~~~~~~~~~~~~


vim +/is_memcg_drain_needed +2236 mm/memcontrol.c

cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2062  
29a1ea41456b79 Shakeel Butt       2026-05-25  2063  static void drain_obj_stock_slot(struct obj_stock_pcp *stock, int i);
c80509ef65e4e4 Shakeel Butt       2025-05-06  2064  static void drain_obj_stock(struct obj_stock_pcp *stock);
c80509ef65e4e4 Shakeel Butt       2025-05-06  2065  static bool obj_stock_flush_required(struct obj_stock_pcp *stock,
bf4f059954dcb2 Roman Gushchin     2020-08-06  2066  				     struct mem_cgroup *root_memcg);
bf4f059954dcb2 Roman Gushchin     2020-08-06  2067  
a0956d54492eb7 Suleiman Souhlal   2012-12-18  2068  /**
a0956d54492eb7 Suleiman Souhlal   2012-12-18  2069   * consume_stock: Try to consume stocked charge on this cpu.
a0956d54492eb7 Suleiman Souhlal   2012-12-18  2070   * @memcg: memcg to consume from.
a0956d54492eb7 Suleiman Souhlal   2012-12-18  2071   * @nr_pages: how many pages to charge.
a0956d54492eb7 Suleiman Souhlal   2012-12-18  2072   *
2fba5961c64c56 Shakeel Butt       2025-05-06  2073   * Consume the cached charge if enough nr_pages are present otherwise return
2fba5961c64c56 Shakeel Butt       2025-05-06  2074   * failure. Also return failure for charge request larger than
2fba5961c64c56 Shakeel Butt       2025-05-06  2075   * MEMCG_CHARGE_BATCH or if the local lock is already taken.
a0956d54492eb7 Suleiman Souhlal   2012-12-18  2076   *
a0956d54492eb7 Suleiman Souhlal   2012-12-18  2077   * returns true if successful, false otherwise.
cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2078   */
2fba5961c64c56 Shakeel Butt       2025-05-06 @2079  static bool consume_stock(struct mem_cgroup *memcg, unsigned int nr_pages)
cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2080  {
cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2081  	struct memcg_stock_pcp *stock;
f735eebe55f8f6 Shakeel Butt       2025-04-16  2082  	uint8_t stock_pages;
3e32cb2e0a12b6 Johannes Weiner    2014-12-10  2083  	bool ret = false;
f735eebe55f8f6 Shakeel Butt       2025-04-16  2084  	int i;
cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2085  
2fba5961c64c56 Shakeel Butt       2025-05-06  2086  	if (nr_pages > MEMCG_CHARGE_BATCH ||
9e619cd4fefd19 Shakeel Butt       2025-05-06  2087  	    !local_trylock(&memcg_stock.lock))
01d37228d33104 Alexei Starovoitov 2025-02-21  2088  		return ret;
db2ba40c277dc5 Johannes Weiner    2016-09-19  2089  
db2ba40c277dc5 Johannes Weiner    2016-09-19  2090  	stock = this_cpu_ptr(&memcg_stock);
f735eebe55f8f6 Shakeel Butt       2025-04-16  2091  
f735eebe55f8f6 Shakeel Butt       2025-04-16  2092  	for (i = 0; i < NR_MEMCG_STOCK; ++i) {
f735eebe55f8f6 Shakeel Butt       2025-04-16  2093  		if (memcg != READ_ONCE(stock->cached[i]))
f735eebe55f8f6 Shakeel Butt       2025-04-16  2094  			continue;
f735eebe55f8f6 Shakeel Butt       2025-04-16  2095  
f735eebe55f8f6 Shakeel Butt       2025-04-16  2096  		stock_pages = READ_ONCE(stock->nr_pages[i]);
f735eebe55f8f6 Shakeel Butt       2025-04-16  2097  		if (stock_pages >= nr_pages) {
f735eebe55f8f6 Shakeel Butt       2025-04-16  2098  			WRITE_ONCE(stock->nr_pages[i], stock_pages - nr_pages);
3e32cb2e0a12b6 Johannes Weiner    2014-12-10  2099  			ret = true;
3e32cb2e0a12b6 Johannes Weiner    2014-12-10  2100  		}
f735eebe55f8f6 Shakeel Butt       2025-04-16  2101  		break;
f735eebe55f8f6 Shakeel Butt       2025-04-16  2102  	}
db2ba40c277dc5 Johannes Weiner    2016-09-19  2103  
9e619cd4fefd19 Shakeel Butt       2025-05-06  2104  	local_unlock(&memcg_stock.lock);
db2ba40c277dc5 Johannes Weiner    2016-09-19  2105  
cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2106  	return ret;
cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2107  }
cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2108  
89f342af660332 Shakeel Butt       2025-04-03  2109  static void memcg_uncharge(struct mem_cgroup *memcg, unsigned int nr_pages)
89f342af660332 Shakeel Butt       2025-04-03  2110  {
89f342af660332 Shakeel Butt       2025-04-03  2111  	page_counter_uncharge(&memcg->memory, nr_pages);
89f342af660332 Shakeel Butt       2025-04-03  2112  	if (do_memsw_account())
89f342af660332 Shakeel Butt       2025-04-03  2113  		page_counter_uncharge(&memcg->memsw, nr_pages);
89f342af660332 Shakeel Butt       2025-04-03  2114  }
89f342af660332 Shakeel Butt       2025-04-03  2115  
cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2116  /*
3e32cb2e0a12b6 Johannes Weiner    2014-12-10  2117   * Returns stocks cached in percpu and reset cached information.
cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2118   */
f735eebe55f8f6 Shakeel Butt       2025-04-16  2119  static void drain_stock(struct memcg_stock_pcp *stock, int i)
cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2120  {
f735eebe55f8f6 Shakeel Butt       2025-04-16  2121  	struct mem_cgroup *old = READ_ONCE(stock->cached[i]);
f735eebe55f8f6 Shakeel Butt       2025-04-16  2122  	uint8_t stock_pages;
cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2123  
1a3e1f40962c44 Johannes Weiner    2020-08-06  2124  	if (!old)
1a3e1f40962c44 Johannes Weiner    2020-08-06  2125  		return;
1a3e1f40962c44 Johannes Weiner    2020-08-06  2126  
f735eebe55f8f6 Shakeel Butt       2025-04-16  2127  	stock_pages = READ_ONCE(stock->nr_pages[i]);
1872b3bcd5874b Breno Leitao       2024-05-01  2128  	if (stock_pages) {
89f342af660332 Shakeel Butt       2025-04-03  2129  		memcg_uncharge(old, stock_pages);
f735eebe55f8f6 Shakeel Butt       2025-04-16  2130  		WRITE_ONCE(stock->nr_pages[i], 0);
cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2131  	}
1a3e1f40962c44 Johannes Weiner    2020-08-06  2132  
1a3e1f40962c44 Johannes Weiner    2020-08-06  2133  	css_put(&old->css);
f735eebe55f8f6 Shakeel Butt       2025-04-16  2134  	WRITE_ONCE(stock->cached[i], NULL);
cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2135  }
cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2136  
f735eebe55f8f6 Shakeel Butt       2025-04-16  2137  static void drain_stock_fully(struct memcg_stock_pcp *stock)
f735eebe55f8f6 Shakeel Butt       2025-04-16  2138  {
f735eebe55f8f6 Shakeel Butt       2025-04-16  2139  	int i;
f735eebe55f8f6 Shakeel Butt       2025-04-16  2140  
f735eebe55f8f6 Shakeel Butt       2025-04-16  2141  	for (i = 0; i < NR_MEMCG_STOCK; ++i)
f735eebe55f8f6 Shakeel Butt       2025-04-16  2142  		drain_stock(stock, i);
cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2143  }
cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2144  
c80509ef65e4e4 Shakeel Butt       2025-05-06 @2145  static void drain_local_memcg_stock(struct work_struct *dummy)
cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2146  {
db2ba40c277dc5 Johannes Weiner    2016-09-19  2147  	struct memcg_stock_pcp *stock;
db2ba40c277dc5 Johannes Weiner    2016-09-19  2148  
3523dd7af41363 Shakeel Butt       2025-05-06  2149  	if (WARN_ONCE(!in_task(), "drain in non-task context"))
3523dd7af41363 Shakeel Butt       2025-05-06  2150  		return;
db2ba40c277dc5 Johannes Weiner    2016-09-19  2151  
9e619cd4fefd19 Shakeel Butt       2025-05-06  2152  	local_lock(&memcg_stock.lock);
db2ba40c277dc5 Johannes Weiner    2016-09-19  2153  
db2ba40c277dc5 Johannes Weiner    2016-09-19  2154  	stock = this_cpu_ptr(&memcg_stock);
f735eebe55f8f6 Shakeel Butt       2025-04-16  2155  	drain_stock_fully(stock);
26fe616844491a KAMEZAWA Hiroyuki  2011-06-15  2156  	clear_bit(FLUSHING_CACHED_CHARGE, &stock->flags);
db2ba40c277dc5 Johannes Weiner    2016-09-19  2157  
9e619cd4fefd19 Shakeel Butt       2025-05-06  2158  	local_unlock(&memcg_stock.lock);
cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2159  }
cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2160  
c80509ef65e4e4 Shakeel Butt       2025-05-06  2161  static void drain_local_obj_stock(struct work_struct *dummy)
cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2162  {
c80509ef65e4e4 Shakeel Butt       2025-05-06  2163  	struct obj_stock_pcp *stock;
cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2164  
c80509ef65e4e4 Shakeel Butt       2025-05-06  2165  	if (WARN_ONCE(!in_task(), "drain in non-task context"))
c80509ef65e4e4 Shakeel Butt       2025-05-06  2166  		return;
db2ba40c277dc5 Johannes Weiner    2016-09-19  2167  
200577f69f29a5 Shakeel Butt       2025-05-14  2168  	local_lock(&obj_stock.lock);
c80509ef65e4e4 Shakeel Butt       2025-05-06  2169  
c80509ef65e4e4 Shakeel Butt       2025-05-06  2170  	stock = this_cpu_ptr(&obj_stock);
c80509ef65e4e4 Shakeel Butt       2025-05-06  2171  	drain_obj_stock(stock);
c80509ef65e4e4 Shakeel Butt       2025-05-06  2172  	clear_bit(FLUSHING_CACHED_CHARGE, &stock->flags);
c80509ef65e4e4 Shakeel Butt       2025-05-06  2173  
200577f69f29a5 Shakeel Butt       2025-05-14  2174  	local_unlock(&obj_stock.lock);
af9a3b69e84bef Johannes Weiner    2022-03-22  2175  }
af9a3b69e84bef Johannes Weiner    2022-03-22  2176  
af9a3b69e84bef Johannes Weiner    2022-03-22 @2177  static void refill_stock(struct mem_cgroup *memcg, unsigned int nr_pages)
af9a3b69e84bef Johannes Weiner    2022-03-22  2178  {
db2ba40c277dc5 Johannes Weiner    2016-09-19  2179  	struct memcg_stock_pcp *stock;
f735eebe55f8f6 Shakeel Butt       2025-04-16  2180  	struct mem_cgroup *cached;
f735eebe55f8f6 Shakeel Butt       2025-04-16  2181  	uint8_t stock_pages;
f735eebe55f8f6 Shakeel Butt       2025-04-16  2182  	bool success = false;
f735eebe55f8f6 Shakeel Butt       2025-04-16  2183  	int empty_slot = -1;
f735eebe55f8f6 Shakeel Butt       2025-04-16  2184  	int i;
475d0487a2adb1 Roman Gushchin     2017-09-08  2185  
01d37228d33104 Alexei Starovoitov 2025-02-21  2186  	/*
f735eebe55f8f6 Shakeel Butt       2025-04-16  2187  	 * For now limit MEMCG_CHARGE_BATCH to 127 and less. In future if we
f735eebe55f8f6 Shakeel Butt       2025-04-16  2188  	 * decide to increase it more than 127 then we will need more careful
f735eebe55f8f6 Shakeel Butt       2025-04-16  2189  	 * handling of nr_pages[] in struct memcg_stock_pcp.
01d37228d33104 Alexei Starovoitov 2025-02-21  2190  	 */
f735eebe55f8f6 Shakeel Butt       2025-04-16  2191  	BUILD_BUG_ON(MEMCG_CHARGE_BATCH > S8_MAX);
cbc091441d3adc Shakeel Butt       2025-04-03  2192  
cbc091441d3adc Shakeel Butt       2025-04-03  2193  	VM_WARN_ON_ONCE(mem_cgroup_is_root(memcg));
cbc091441d3adc Shakeel Butt       2025-04-03  2194  
f735eebe55f8f6 Shakeel Butt       2025-04-16  2195  	if (nr_pages > MEMCG_CHARGE_BATCH ||
9e619cd4fefd19 Shakeel Butt       2025-05-06  2196  	    !local_trylock(&memcg_stock.lock)) {
cbc091441d3adc Shakeel Butt       2025-04-03  2197  		/*
f735eebe55f8f6 Shakeel Butt       2025-04-16  2198  		 * In case of larger than batch refill or unlikely failure to
c80509ef65e4e4 Shakeel Butt       2025-05-06  2199  		 * lock the percpu memcg_stock.lock, uncharge memcg directly.
cbc091441d3adc Shakeel Butt       2025-04-03  2200  		 */
cbc091441d3adc Shakeel Butt       2025-04-03  2201  		memcg_uncharge(memcg, nr_pages);
01d37228d33104 Alexei Starovoitov 2025-02-21  2202  		return;
01d37228d33104 Alexei Starovoitov 2025-02-21  2203  	}
cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2204  
db2ba40c277dc5 Johannes Weiner    2016-09-19  2205  	stock = this_cpu_ptr(&memcg_stock);
f735eebe55f8f6 Shakeel Butt       2025-04-16  2206  	for (i = 0; i < NR_MEMCG_STOCK; ++i) {
f735eebe55f8f6 Shakeel Butt       2025-04-16  2207  		cached = READ_ONCE(stock->cached[i]);
f735eebe55f8f6 Shakeel Butt       2025-04-16  2208  		if (!cached && empty_slot == -1)
f735eebe55f8f6 Shakeel Butt       2025-04-16  2209  			empty_slot = i;
f735eebe55f8f6 Shakeel Butt       2025-04-16  2210  		if (memcg == READ_ONCE(stock->cached[i])) {
f735eebe55f8f6 Shakeel Butt       2025-04-16  2211  			stock_pages = READ_ONCE(stock->nr_pages[i]) + nr_pages;
f735eebe55f8f6 Shakeel Butt       2025-04-16  2212  			WRITE_ONCE(stock->nr_pages[i], stock_pages);
f735eebe55f8f6 Shakeel Butt       2025-04-16  2213  			if (stock_pages > MEMCG_CHARGE_BATCH)
f735eebe55f8f6 Shakeel Butt       2025-04-16  2214  				drain_stock(stock, i);
f735eebe55f8f6 Shakeel Butt       2025-04-16  2215  			success = true;
f735eebe55f8f6 Shakeel Butt       2025-04-16  2216  			break;
f735eebe55f8f6 Shakeel Butt       2025-04-16  2217  		}
cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2218  	}
db2ba40c277dc5 Johannes Weiner    2016-09-19  2219  
f735eebe55f8f6 Shakeel Butt       2025-04-16  2220  	if (!success) {
f735eebe55f8f6 Shakeel Butt       2025-04-16  2221  		i = empty_slot;
f735eebe55f8f6 Shakeel Butt       2025-04-16  2222  		if (i == -1) {
c0cafe24d3f653 Shakeel Butt       2026-05-21  2223  			i = stock->drain_idx++;
c0cafe24d3f653 Shakeel Butt       2026-05-21  2224  			if (stock->drain_idx == NR_MEMCG_STOCK)
c0cafe24d3f653 Shakeel Butt       2026-05-21  2225  				stock->drain_idx = 0;
f735eebe55f8f6 Shakeel Butt       2025-04-16  2226  			drain_stock(stock, i);
f735eebe55f8f6 Shakeel Butt       2025-04-16  2227  		}
f735eebe55f8f6 Shakeel Butt       2025-04-16  2228  		css_get(&memcg->css);
f735eebe55f8f6 Shakeel Butt       2025-04-16  2229  		WRITE_ONCE(stock->cached[i], memcg);
f735eebe55f8f6 Shakeel Butt       2025-04-16  2230  		WRITE_ONCE(stock->nr_pages[i], nr_pages);
f735eebe55f8f6 Shakeel Butt       2025-04-16  2231  	}
e56fa8f5e10867 Shakeel Butt       2025-04-03  2232  
9e619cd4fefd19 Shakeel Butt       2025-05-06  2233  	local_unlock(&memcg_stock.lock);
cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2234  }
cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2235  
c80509ef65e4e4 Shakeel Butt       2025-05-06 @2236  static bool is_memcg_drain_needed(struct memcg_stock_pcp *stock,
f735eebe55f8f6 Shakeel Butt       2025-04-16  2237  				  struct mem_cgroup *root_memcg)
f735eebe55f8f6 Shakeel Butt       2025-04-16  2238  {
f735eebe55f8f6 Shakeel Butt       2025-04-16  2239  	struct mem_cgroup *memcg;
f735eebe55f8f6 Shakeel Butt       2025-04-16  2240  	bool flush = false;
f735eebe55f8f6 Shakeel Butt       2025-04-16  2241  	int i;
f735eebe55f8f6 Shakeel Butt       2025-04-16  2242  
f735eebe55f8f6 Shakeel Butt       2025-04-16  2243  	rcu_read_lock();
f735eebe55f8f6 Shakeel Butt       2025-04-16  2244  	for (i = 0; i < NR_MEMCG_STOCK; ++i) {
f735eebe55f8f6 Shakeel Butt       2025-04-16  2245  		memcg = READ_ONCE(stock->cached[i]);
f735eebe55f8f6 Shakeel Butt       2025-04-16  2246  		if (!memcg)
f735eebe55f8f6 Shakeel Butt       2025-04-16  2247  			continue;
f735eebe55f8f6 Shakeel Butt       2025-04-16  2248  
f735eebe55f8f6 Shakeel Butt       2025-04-16  2249  		if (READ_ONCE(stock->nr_pages[i]) &&
f735eebe55f8f6 Shakeel Butt       2025-04-16  2250  		    mem_cgroup_is_descendant(memcg, root_memcg)) {
f735eebe55f8f6 Shakeel Butt       2025-04-16  2251  			flush = true;
f735eebe55f8f6 Shakeel Butt       2025-04-16  2252  			break;
f735eebe55f8f6 Shakeel Butt       2025-04-16  2253  		}
f735eebe55f8f6 Shakeel Butt       2025-04-16  2254  	}
f735eebe55f8f6 Shakeel Butt       2025-04-16  2255  	rcu_read_unlock();
f735eebe55f8f6 Shakeel Butt       2025-04-16  2256  	return flush;
cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2257  }
cdec2e4265dfa0 KAMEZAWA Hiroyuki  2009-12-15  2258  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
