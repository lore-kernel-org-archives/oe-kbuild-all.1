Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8670D3B7B79
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jun 2026 21:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782509284; cv=none; b=BS4hQSpAV+lZu1Xv7De8JmXg1HXSxi6PlVb47SIIrXOMZgxpN8WvCN9LMHoMdttDt/yaV2wMU3esGA+mcSEeq2UQCC6T1M9Y3QaQHqVuu+iYQ8lb/CmJZnBYRszhQ8qIos2nmMobCOVOnsXJtcxfhi+ipweD1ar50y5sR7vBlbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782509284; c=relaxed/simple;
	bh=LCUdyxLTdGaB3iMP8KZwbUoNeB3L7nWU7BhNy0JnozE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=URGqkPbOgxgRItjqeb+5v/c09rBGC0QE+6PK5lIUeZECK1tQfu+hPllx2ZDxjKS8d8zDUWnVUyjoMR8YRi4lJjJysPycUMdvaaKshALk+yQGtXfi31TCN0/lk7J4ZROOjGPvc0mNIcAhGBss+pF1vzkmGJbD5FCXv5D/e0gSHX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f5XWLSNM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f5XWLSNM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782509281; x=1814045281;
  h=date:from:to:cc:subject:message-id;
  bh=LCUdyxLTdGaB3iMP8KZwbUoNeB3L7nWU7BhNy0JnozE=;
  b=f5XWLSNMbKg6x9nQyO708EIyOqg0EwWiJLKF8OCeDLrlQWnQAnpjJDJC
   1xlPVgB4pbTE14eXFcKtvnO0jtAmFmD5G+mLjbS9DXwvt4r/bO9MUyIsq
   nb6s2oNqqtZrQ9xsTmg+cyq3OM157QcY1Kv38ficggpjR49HqeMcTyTuU
   P6SVZZ3CMiLjcDSJTNFNskv9EcjkxhiB55k6NEjfXVOLpWtV8l9OOkyTr
   PwONKUjH4+MMDbSvkxUI3sgfjjR7Bl4PEt6AaJYaNRcSRsSR8NvpCVnSz
   r82eO1FF971SqJ2XbLpayO8yW4pFfuqsS614NueYqsiQtxQVzfUJTwApq
   A==;
X-CSE-ConnectionGUID: XOp7zC5JTC2mpsW2uD0cQQ==
X-CSE-MsgGUID: U98zxBdrQueLVmx7OhrT9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="85853943"
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="85853943"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 14:28:01 -0700
X-CSE-ConnectionGUID: hzMQqsTKTaKR9ppE9MgXNQ==
X-CSE-MsgGUID: sIQHX60dQ3yovG+w0bWPhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="251030109"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 26 Jun 2026 14:27:59 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdE5a-000000005RZ-33lI;
	Fri, 26 Jun 2026 21:27:55 +0000
Date: Sat, 27 Jun 2026 05:27:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <liam@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [liam:maple_marks_v7.2 28/31] lib/test_maple_tree.c:299:17:
 error: implicit declaration of function 'mas_next_slot'
Message-ID: <202606270535.N9AKWzY0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/liam/linux.git maple_marks_v7.2
head:   be119ad50e9c87a4a975871d84614f7c6aeaf0de
commit: d4eb0ef8b516c8492a60a066c467f580ae9c0074 [28/31] maple_tree: Testing code update for triple split
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260627/202606270535.N9AKWzY0-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260627/202606270535.N9AKWzY0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606270535.N9AKWzY0-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/test_maple_tree.c: In function 'test_mas_next_node':
>> lib/test_maple_tree.c:299:17: error: implicit declaration of function 'mas_next_slot' [-Wimplicit-function-declaration]
     299 |                 mas_next_slot(mas, ULONG_MAX, true);
         |                 ^~~~~~~~~~~~~
   lib/test_maple_tree.c: In function 'test_mas_prev_node':
>> lib/test_maple_tree.c:314:17: error: implicit declaration of function 'mas_prev_slot'; did you mean 'mas_reset'? [-Wimplicit-function-declaration]
     314 |                 mas_prev_slot(mas, 0, true);
         |                 ^~~~~~~~~~~~~
         |                 mas_reset
   lib/test_maple_tree.c: In function 'mas_node_fill':
>> lib/test_maple_tree.c:356:36: error: implicit declaration of function 'mt_slot_count' [-Wimplicit-function-declaration]
     356 |         if (mas->max - mas->min <= mt_slot_count(mas->node))
         |                                    ^~~~~~~~~~~~~
>> lib/test_maple_tree.c:359:15: error: implicit declaration of function 'mas_data_end' [-Wimplicit-function-declaration]
     359 |         val = mas_data_end(mas) + 1;
         |               ^~~~~~~~~~~~
   lib/test_maple_tree.c: In function 'test_mas_node_depth':
>> lib/test_maple_tree.c:420:9: error: implicit declaration of function 'mas_start'; did you mean 'mas_store'? [-Wimplicit-function-declaration]
     420 |         mas_start(mas);
         |         ^~~~~~~~~
         |         mas_store
>> lib/test_maple_tree.c:426:23: error: implicit declaration of function 'ma_pivots' [-Wimplicit-function-declaration]
     426 |                 piv = ma_pivots(mas_mn(mas), mte_node_type(mas->node));
         |                       ^~~~~~~~~
>> lib/test_maple_tree.c:426:33: error: implicit declaration of function 'mas_mn' [-Wimplicit-function-declaration]
     426 |                 piv = ma_pivots(mas_mn(mas), mte_node_type(mas->node));
         |                                 ^~~~~~
>> lib/test_maple_tree.c:426:46: error: implicit declaration of function 'mte_node_type' [-Wimplicit-function-declaration]
     426 |                 piv = ma_pivots(mas_mn(mas), mte_node_type(mas->node));
         |                                              ^~~~~~~~~~~~~
>> lib/test_maple_tree.c:426:21: error: assignment to 'long unsigned int *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     426 |                 piv = ma_pivots(mas_mn(mas), mte_node_type(mas->node));
         |                     ^
>> lib/test_maple_tree.c:432:17: error: implicit declaration of function 'mas_descend'; did you mean 'mas_reset'? [-Wimplicit-function-declaration]
     432 |                 mas_descend(mas);
         |                 ^~~~~~~~~~~
         |                 mas_reset
   In file included from lib/test_maple_tree.c:10:
   lib/test_maple_tree.c: In function 'mas_internal_node_fill':
>> lib/test_maple_tree.c:443:30: error: implicit declaration of function 'mte_is_leaf' [-Wimplicit-function-declaration]
     443 |         MT_BUG_ON(mas->tree, mte_is_leaf(mas->node));
         |                              ^~~~~~~~~~~
   include/linux/maple_tree.h:758:13: note: in definition of macro 'MT_BUG_ON'
     758 |         if (__x) {                                                      \
         |             ^~~
   lib/test_maple_tree.c: In function 'check_ranges':
>> lib/test_maple_tree.c:1528:65: error: subscripted value is neither array nor pointer nor vector
    1528 |         index = ma_pivots(mas_mn(&mas), mte_node_type(mas.node))[7] + 1;
         |                                                                 ^
   lib/test_maple_tree.c:1535:65: error: subscripted value is neither array nor pointer nor vector
    1535 |         index = ma_pivots(mas_mn(&mas), mte_node_type(mas.node))[8] + 1;
         |                                                                 ^


vim +/mas_next_slot +299 lib/test_maple_tree.c

   289	
   290	static noinline void __init test_mas_next_node(struct ma_state *mas)
   291	{
   292		struct maple_enode *this_node;
   293	
   294		MT_BUG_ON(mas->tree, !mas_is_active(mas));
   295	
   296		this_node = mas->node;
   297	
   298		while(this_node == mas->node) {
 > 299			mas_next_slot(mas, ULONG_MAX, true);
   300			MT_BUG_ON(mas->tree, !mas_is_active(mas));
   301		}
   302	
   303	}
   304	
   305	static noinline void __init test_mas_prev_node(struct ma_state *mas)
   306	{
   307		struct maple_enode *this_node;
   308	
   309		MT_BUG_ON(mas->tree, !mas_is_active(mas));
   310	
   311		this_node = mas->node;
   312	
   313		while(this_node == mas->node) {
 > 314			mas_prev_slot(mas, 0, true);
   315			MT_BUG_ON(mas->tree, !mas_is_active(mas));
   316		}
   317	
   318	}
   319	
   320	static noinline void __init __maybe_unused test_mas_node_last_slot(struct ma_state *mas)
   321	{
   322		test_mas_next_node(mas);
   323		mas_prev_range(mas, 0);
   324	}
   325	
   326	
   327	static noinline bool __init mas_node_first_split_offset(struct ma_state *mas)
   328	{
   329		struct maple_enode *node = mas->node;
   330		unsigned long high = mas->max;
   331	
   332		while (mas_is_active(mas) && node == mas->node) {
   333			if (mas->index != mas->last)
   334				return true;
   335	
   336			if (mas->last >= high)
   337				break;
   338			mas_next_range(mas, high);
   339		}
   340	
   341		return false;
   342	}
   343	
   344	static noinline bool __init mas_node_fill(struct ma_state *mas)
   345	{
   346		int target, val;
   347		void *fill = (void*)0x11111111;
   348		unsigned long high;
   349	
   350		if (!mas_is_active(mas))
   351			mas_walk(mas);
   352	
   353		if (!mas_is_active(mas))
   354			return false;
   355	
 > 356		if (mas->max - mas->min <= mt_slot_count(mas->node))
   357			goto done;
   358	
 > 359		val = mas_data_end(mas) + 1;
   360		target = mt_slot_count(mas->node);
   361		if (val == target)
   362			goto full;
   363	
   364		mas_walk(mas);
   365		high = mas->max;
   366		while (target > val && mas_is_active(mas)) {
   367			unsigned long old_last = mas->last;
   368			unsigned long new_last;
   369	
   370			if (old_last > mas->index) {
   371				new_last = mas->index + 1;
   372				if (new_last <= mas->index || new_last > old_last)
   373					new_last = old_last;
   374				mas->last = new_last;
   375				mas_store(mas, fill);
   376				val = mas_data_end(mas) + 1;
   377				if (target <= val)
   378					break;
   379			}
   380			mas_next_range(mas, high);
   381			if (!mas_is_active(mas))
   382				break;
   383		}
   384		return mas_node_first_split_offset(mas);
   385	
   386	full:
   387		if (mas->max - mas->min > mt_slot_count(mas->node))
   388			return mas_node_first_split_offset(mas);
   389	done:
   390		mas_set(mas, mas->max);
   391		mas_walk(mas);
   392		return false;
   393	}
   394	
   395	static noinline bool __init mas_node_split(struct ma_state *mas)
   396	{
   397		void *fill = (void*)0x22222222;
   398		unsigned long old_last, new_last;
   399	
   400		if (mas_node_fill(mas)) {
   401			old_last = mas->last;
   402			if (old_last <= mas->index)
   403				return false;
   404	
   405			new_last = mas->index + 1;
   406			if (new_last <= mas->index || new_last > old_last)
   407				new_last = old_last;
   408			mas->last = new_last;
   409			mas_store(mas, fill);
   410			return true;
   411		}
   412	
   413		return false;
   414	}
   415	
   416	static noinline void __init test_mas_node_depth(struct ma_state *mas,
   417			int depth)
   418	{
   419		mas_reset(mas);
 > 420		mas_start(mas);
   421		while (mas->depth < depth) {
   422			unsigned long *piv;
   423			int count, offset;
   424	
   425			count = mas_data_end(mas);
 > 426			piv = ma_pivots(mas_mn(mas), mte_node_type(mas->node));
   427			offset = 0;
   428			while (offset < count && mas->index > piv[offset]) {
   429				offset++;
   430			}
   431			mas->offset = offset;
 > 432			mas_descend(mas);
   433			mas->depth++;
   434		}
   435	
   436	}
   437	
   438	static noinline void __init mas_internal_node_fill(struct ma_state *mas)
   439	{
   440		int val, target, depth;
   441		unsigned long high, next;
   442	
 > 443		MT_BUG_ON(mas->tree, mte_is_leaf(mas->node));
   444		val = mas_data_end(mas) + 1;
   445		target = mt_slot_count(mas->node);
   446		if (val == target)
   447			return;
   448	
   449		high = mas->max;
   450		depth = mas->depth;
   451		while (mas_data_end(mas) + 1 < target) {
   452			mas_walk(mas);
   453			if (mas_node_split(mas)) {
   454				next = mas->last + 1;
   455			} else {
   456				next = mas->max + 1;
   457			}
   458			if (!next || next > high)
   459				return;
   460	
   461			mas->index = next;
   462			test_mas_node_depth(mas, depth);
   463		}
   464	
   465	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
