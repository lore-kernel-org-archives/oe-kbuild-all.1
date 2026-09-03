Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B1042E8E7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Sep 2026 10:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788431351; cv=none; b=MojG5R9jSVX7Ude1WU7aa6kzzEnM9OOyXG0BU9BASHyYEAeY4gJXwZBg1Z0bDS1ioktAByvs062760RO8vjwtt7F2YtSqJjYFIv70h1pVIjacSphJ7H+MHmtF9GGQILHO5YiF7mi14L9Yrk32kxzI+EjuTine2O+iDtRv6D8IKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788431351; c=relaxed/simple;
	bh=uLS10mU8eswlmxsNOyl58HE3ZHmtOZr8y92Ys+p7+Kw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pPw5hJfAN/2/StD7XBMudsr9dtfe7k/nRbTmjpcHtqJNSOvLnMLYulyfTDyaUR7mk/0EdK8mSQ3tfOIfIXecfmhJ8g3qnWZxwv9oKFw7tMmqujEPlJHIKbzXA4sRTE049NyW65KrWQ/nxgtwVsUjKpgd5L0NgZe6rt2ZVG56mDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FIKSOxrz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FIKSOxrz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788431339; x=1819967339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uLS10mU8eswlmxsNOyl58HE3ZHmtOZr8y92Ys+p7+Kw=;
  b=FIKSOxrzlzSXJKCqzi7I+4ErJFMT2UrBBHgkN+kyshyGZQgPNVMkrUnU
   d4aw7ictQ5fAp/AGReKmkHBR1F5Ge+b6SdDTEjdv5EvaI72NivaDZ0780
   vCpRk591Z1b4YypeymfM4XEgE6A5G6USuJghCSONv3W3J/jlVxb0zWn5r
   hEcmyPPrf0x0CNeayIvnjxwZGKMjTSSggVNWN0soFxlCa0BYrP6kWOAo5
   bLOb0N/ZG03ZsOaX1dT4oR4AjNck/SVFS30iWrtkqCUZZh3XiDdU7tClB
   3xlqiPTWpWRNRD0WAzebBJ/BWtYzLlxF94pj1GweogdAhjHg5TYeOWxrX
   w==;
X-CSE-ConnectionGUID: AK8rBXReRhagEhzOLsfiAw==
X-CSE-MsgGUID: DeWc1wwgT/y7wBWIq3O9uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="99508816"
X-IronPort-AV: E=Sophos;i="6.25,259,1779174000"; 
   d="scan'208";a="99508816"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 03:28:53 -0700
X-CSE-ConnectionGUID: upF9XlEVTeG2dCqu6U/sAg==
X-CSE-MsgGUID: 3kMA6OATQj2OajmzafOuUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,259,1779174000"; 
   d="scan'208";a="268364373"
Received: from igk-lkp-server01.igk.intel.com (HELO 05545efcfdd3) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 03 Sep 2026 03:28:51 -0700
Received: from kbuild by 05545efcfdd3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x24gb-000000000u0-0WOb;
	Thu, 03 Sep 2026 10:28:49 +0000
Date: Thu, 03 Sep 2026 12:28:47 +0200
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:wk-merge-v8-all 50/50] lib/test_bonsai_tree.c:172:1:
 warning: the frame size of 2208 bytes is larger than 2048 bytes
Message-ID: <202609031243.5YDuUoGo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git wk-merge-v8-all
head:   15fc7b4f50950618237402fdf3a05eb0caaff2cc
commit: 15fc7b4f50950618237402fdf3a05eb0caaff2cc [50/50] foo
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260903/202609031243.5YDuUoGo-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609031243.5YDuUoGo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609031243.5YDuUoGo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/test_bonsai_tree.c: In function 'benchmark_scale':
>> lib/test_bonsai_tree.c:172:1: warning: the frame size of 2208 bytes is larger than 2048 bytes [-Wframe-larger-than=]
     172 | }
         | ^


vim +172 lib/test_bonsai_tree.c

6befb245966f5ab Jim Cromie 2026-09-02   50  
6befb245966f5ab Jim Cromie 2026-09-02   51  static void benchmark_scale(unsigned int num_intervals)
6befb245966f5ab Jim Cromie 2026-09-02   52  {
6befb245966f5ab Jim Cromie 2026-09-02   53  	struct flat_interval *flat_table;
6befb245966f5ab Jim Cromie 2026-09-02   54  	struct bonsai_tree bt;
6befb245966f5ab Jim Cromie 2026-09-02   55  	struct maple_tree mt;
6befb245966f5ab Jim Cromie 2026-09-02   56  	ktime_t t0, t1;
6befb245966f5ab Jim Cromie 2026-09-02   57  	u64 bonsai_build_ns, maple_build_ns;
6befb245966f5ab Jim Cromie 2026-09-02   58  	u64 bonsai_seq_ns, maple_seq_ns, bsearch_seq_ns;
6befb245966f5ab Jim Cromie 2026-09-02   59  	u64 bonsai_rnd_ns, maple_rnd_ns, bsearch_rnd_ns;
6befb245966f5ab Jim Cromie 2026-09-02   60  	unsigned long *rnd_keys;
6befb245966f5ab Jim Cromie 2026-09-02   61  	unsigned int i, step = 16;
6befb245966f5ab Jim Cromie 2026-09-02   62  	volatile void *sink = NULL;
6befb245966f5ab Jim Cromie 2026-09-02   63  	size_t flat_bytes, bonsai_bytes, maple_bytes;
6befb245966f5ab Jim Cromie 2026-09-02   64  
6befb245966f5ab Jim Cromie 2026-09-02   65  	flat_table = kmalloc_array(num_intervals, sizeof(*flat_table), GFP_KERNEL);
6befb245966f5ab Jim Cromie 2026-09-02   66  	rnd_keys = kmalloc_array(1024, sizeof(*rnd_keys), GFP_KERNEL);
6befb245966f5ab Jim Cromie 2026-09-02   67  	if (!flat_table || !rnd_keys) {
6befb245966f5ab Jim Cromie 2026-09-02   68  		kfree(flat_table);
6befb245966f5ab Jim Cromie 2026-09-02   69  		kfree(rnd_keys);
6befb245966f5ab Jim Cromie 2026-09-02   70  		pr_err("failed to allocate test buffers for N=%u\n", num_intervals);
6befb245966f5ab Jim Cromie 2026-09-02   71  		return;
6befb245966f5ab Jim Cromie 2026-09-02   72  	}
6befb245966f5ab Jim Cromie 2026-09-02   73  
6befb245966f5ab Jim Cromie 2026-09-02   74  	for (i = 0; i < num_intervals; i++) {
6befb245966f5ab Jim Cromie 2026-09-02   75  		flat_table[i].start = (unsigned long)i * step;
6befb245966f5ab Jim Cromie 2026-09-02   76  		flat_table[i].end = flat_table[i].start + step - 1;
6befb245966f5ab Jim Cromie 2026-09-02   77  		flat_table[i].val = (void *)(unsigned long)(i + 1);
6befb245966f5ab Jim Cromie 2026-09-02   78  	}
6befb245966f5ab Jim Cromie 2026-09-02   79  	for (i = 0; i < 1024; i++) {
6befb245966f5ab Jim Cromie 2026-09-02   80  		unsigned int idx = get_random_u32_below(num_intervals);
6befb245966f5ab Jim Cromie 2026-09-02   81  		rnd_keys[i] = flat_table[idx].start + get_random_u32_below(step);
6befb245966f5ab Jim Cromie 2026-09-02   82  	}
6befb245966f5ab Jim Cromie 2026-09-02   83  
6befb245966f5ab Jim Cromie 2026-09-02   84  	flat_bytes = num_intervals * sizeof(struct flat_interval);
6befb245966f5ab Jim Cromie 2026-09-02   85  
6befb245966f5ab Jim Cromie 2026-09-02   86  	/* 0. Benchmark Bonsai Tree Build */
6befb245966f5ab Jim Cromie 2026-09-02   87  	bonsai_init(&bt);
6befb245966f5ab Jim Cromie 2026-09-02   88  	bonsai_init_hint(&bt, num_intervals, GFP_KERNEL);
6befb245966f5ab Jim Cromie 2026-09-02   89  	t0 = ktime_get();
6befb245966f5ab Jim Cromie 2026-09-02   90  	for (i = 0; i < num_intervals; i++) {
6befb245966f5ab Jim Cromie 2026-09-02   91  		bonsai_store_range(&bt, flat_table[i].start, flat_table[i].end,
6befb245966f5ab Jim Cromie 2026-09-02   92  				   flat_table[i].val, GFP_KERNEL);
6befb245966f5ab Jim Cromie 2026-09-02   93  	}
6befb245966f5ab Jim Cromie 2026-09-02   94  	bonsai_seal(&bt);
6befb245966f5ab Jim Cromie 2026-09-02   95  	t1 = ktime_get();
6befb245966f5ab Jim Cromie 2026-09-02   96  	bonsai_build_ns = ktime_to_ns(ktime_sub(t1, t0));
6befb245966f5ab Jim Cromie 2026-09-02   97  	bonsai_bytes = bt.node_count * BONSAI_NODE_SIZE;
6befb245966f5ab Jim Cromie 2026-09-02   98  
6befb245966f5ab Jim Cromie 2026-09-02   99  	/* 1. Benchmark Maple Tree Build */
6befb245966f5ab Jim Cromie 2026-09-02  100  	mt_init_flags(&mt, 0);
6befb245966f5ab Jim Cromie 2026-09-02  101  	t0 = ktime_get();
6befb245966f5ab Jim Cromie 2026-09-02  102  	for (i = 0; i < num_intervals; i++) {
6befb245966f5ab Jim Cromie 2026-09-02  103  		mtree_store_range(&mt, flat_table[i].start, flat_table[i].end,
6befb245966f5ab Jim Cromie 2026-09-02  104  				  flat_table[i].val, GFP_KERNEL);
6befb245966f5ab Jim Cromie 2026-09-02  105  	}
6befb245966f5ab Jim Cromie 2026-09-02  106  	t1 = ktime_get();
6befb245966f5ab Jim Cromie 2026-09-02  107  	maple_build_ns = ktime_to_ns(ktime_sub(t1, t0));
6befb245966f5ab Jim Cromie 2026-09-02  108  	maple_bytes = (num_intervals / 10 + 1) * 256;
6befb245966f5ab Jim Cromie 2026-09-02  109  
6befb245966f5ab Jim Cromie 2026-09-02  110  	/* 2. Sequential Lookup Benchmark */
6befb245966f5ab Jim Cromie 2026-09-02  111  	t0 = ktime_get();
6befb245966f5ab Jim Cromie 2026-09-02  112  	for (i = 0; i < NUM_LOOKUPS; i++) {
6befb245966f5ab Jim Cromie 2026-09-02  113  		unsigned long key = (i % num_intervals) * step + 4;
6befb245966f5ab Jim Cromie 2026-09-02  114  		sink = bsearch_lookup(flat_table, num_intervals, key);
6befb245966f5ab Jim Cromie 2026-09-02  115  	}
6befb245966f5ab Jim Cromie 2026-09-02  116  	t1 = ktime_get();
6befb245966f5ab Jim Cromie 2026-09-02  117  	bsearch_seq_ns = ktime_to_ns(ktime_sub(t1, t0));
6befb245966f5ab Jim Cromie 2026-09-02  118  
6befb245966f5ab Jim Cromie 2026-09-02  119  	t0 = ktime_get();
6befb245966f5ab Jim Cromie 2026-09-02  120  	for (i = 0; i < NUM_LOOKUPS; i++) {
6befb245966f5ab Jim Cromie 2026-09-02  121  		unsigned long key = (i % num_intervals) * step + 4;
6befb245966f5ab Jim Cromie 2026-09-02  122  		sink = bonsai_lookup(&bt, key);
6befb245966f5ab Jim Cromie 2026-09-02  123  	}
6befb245966f5ab Jim Cromie 2026-09-02  124  	t1 = ktime_get();
6befb245966f5ab Jim Cromie 2026-09-02  125  	bonsai_seq_ns = ktime_to_ns(ktime_sub(t1, t0));
6befb245966f5ab Jim Cromie 2026-09-02  126  
6befb245966f5ab Jim Cromie 2026-09-02  127  	t0 = ktime_get();
6befb245966f5ab Jim Cromie 2026-09-02  128  	for (i = 0; i < NUM_LOOKUPS; i++) {
6befb245966f5ab Jim Cromie 2026-09-02  129  		unsigned long key = (i % num_intervals) * step + 4;
6befb245966f5ab Jim Cromie 2026-09-02  130  		sink = mtree_load(&mt, key);
6befb245966f5ab Jim Cromie 2026-09-02  131  	}
6befb245966f5ab Jim Cromie 2026-09-02  132  	t1 = ktime_get();
6befb245966f5ab Jim Cromie 2026-09-02  133  	maple_seq_ns = ktime_to_ns(ktime_sub(t1, t0));
6befb245966f5ab Jim Cromie 2026-09-02  134  
6befb245966f5ab Jim Cromie 2026-09-02  135  	/* 3. Random Lookup Benchmark */
6befb245966f5ab Jim Cromie 2026-09-02  136  	t0 = ktime_get();
6befb245966f5ab Jim Cromie 2026-09-02  137  	for (i = 0; i < NUM_LOOKUPS; i++) {
6befb245966f5ab Jim Cromie 2026-09-02  138  		sink = bsearch_lookup(flat_table, num_intervals, rnd_keys[i & 1023]);
6befb245966f5ab Jim Cromie 2026-09-02  139  	}
6befb245966f5ab Jim Cromie 2026-09-02  140  	t1 = ktime_get();
6befb245966f5ab Jim Cromie 2026-09-02  141  	bsearch_rnd_ns = ktime_to_ns(ktime_sub(t1, t0));
6befb245966f5ab Jim Cromie 2026-09-02  142  
6befb245966f5ab Jim Cromie 2026-09-02  143  	t0 = ktime_get();
6befb245966f5ab Jim Cromie 2026-09-02  144  	for (i = 0; i < NUM_LOOKUPS; i++) {
6befb245966f5ab Jim Cromie 2026-09-02  145  		sink = bonsai_lookup(&bt, rnd_keys[i & 1023]);
6befb245966f5ab Jim Cromie 2026-09-02  146  	}
6befb245966f5ab Jim Cromie 2026-09-02  147  	t1 = ktime_get();
6befb245966f5ab Jim Cromie 2026-09-02  148  	bonsai_rnd_ns = ktime_to_ns(ktime_sub(t1, t0));
6befb245966f5ab Jim Cromie 2026-09-02  149  
6befb245966f5ab Jim Cromie 2026-09-02  150  	t0 = ktime_get();
6befb245966f5ab Jim Cromie 2026-09-02  151  	for (i = 0; i < NUM_LOOKUPS; i++) {
6befb245966f5ab Jim Cromie 2026-09-02  152  		sink = mtree_load(&mt, rnd_keys[i & 1023]);
6befb245966f5ab Jim Cromie 2026-09-02  153  	}
6befb245966f5ab Jim Cromie 2026-09-02  154  	t1 = ktime_get();
6befb245966f5ab Jim Cromie 2026-09-02  155  	maple_rnd_ns = ktime_to_ns(ktime_sub(t1, t0));
6befb245966f5ab Jim Cromie 2026-09-02  156  
6befb245966f5ab Jim Cromie 2026-09-02  157  	pr_info("=== Benchmark N = %4u intervals (1M lookups) ===\n", num_intervals);
6befb245966f5ab Jim Cromie 2026-09-02  158  	pr_info("  Memory   : Flat=%zu B | Bonsai=%zu B (nodes=%u, h=%u) | Maple=~%zu B\n",
6befb245966f5ab Jim Cromie 2026-09-02  159  		flat_bytes, bonsai_bytes, bt.node_count, bt.height, maple_bytes);
6befb245966f5ab Jim Cromie 2026-09-02  160  	pr_info("  Build    : Bonsai=%llu us | Maple=%llu us\n",
6befb245966f5ab Jim Cromie 2026-09-02  161  		bonsai_build_ns / 1000, maple_build_ns / 1000);
6befb245966f5ab Jim Cromie 2026-09-02  162  	pr_info("  Seq Look : BSearch=%llu ns/op | Bonsai=%llu ns/op | Maple=%llu ns/op\n",
6befb245966f5ab Jim Cromie 2026-09-02  163  		bsearch_seq_ns / NUM_LOOKUPS, bonsai_seq_ns / NUM_LOOKUPS, maple_seq_ns / NUM_LOOKUPS);
6befb245966f5ab Jim Cromie 2026-09-02  164  	pr_info("  Rnd Look : BSearch=%llu ns/op | Bonsai=%llu ns/op | Maple=%llu ns/op\n",
6befb245966f5ab Jim Cromie 2026-09-02  165  		bsearch_rnd_ns / NUM_LOOKUPS, bonsai_rnd_ns / NUM_LOOKUPS, maple_rnd_ns / NUM_LOOKUPS);
6befb245966f5ab Jim Cromie 2026-09-02  166  
6befb245966f5ab Jim Cromie 2026-09-02  167  	bonsai_destroy(&bt);
6befb245966f5ab Jim Cromie 2026-09-02  168  	mtree_destroy(&mt);
6befb245966f5ab Jim Cromie 2026-09-02  169  	kfree(flat_table);
6befb245966f5ab Jim Cromie 2026-09-02  170  	kfree(rnd_keys);
6befb245966f5ab Jim Cromie 2026-09-02  171  	(void)sink;
6befb245966f5ab Jim Cromie 2026-09-02 @172  }
6befb245966f5ab Jim Cromie 2026-09-02  173  

:::::: The code at line 172 was first introduced by commit
:::::: 6befb245966f5aba1109cfd718a7cf4dd7f13375 lib/test_bonsai_tree: Add benchmark for Bonsai vs Maple vs Binary Search

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
