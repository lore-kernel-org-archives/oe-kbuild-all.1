Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F0B410D15
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Sep 2026 08:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376196; cv=none; b=deYwveSWnG4+9D3YvLUKD31MU1gkaZQE8FFiC+M7YrLgPSGkmIFx5G3bdKuwpaWRtKFSUS5bhdO944uc0eVcMqCQiiw+WyPUURaFU+5yli/AHsjgIVsTEagpp83Zjy1FTPCJXOhowfz8Pf+CbIup/ib07rtQ3NkN0JmCotMgxHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376196; c=relaxed/simple;
	bh=SSLyMBuCkpiG5Hm+d3F+w7+8VA5JZHIf1pz8ld0+5uY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kRwbudZIFhfy6W8r4eVpsIn+wO3J5spZ2jO7nLFNPJdV64kpKWSz1GPSeQsLenDl3AGjLKCKcvg4BwKhjRXknkwKZKcPv0BW0w+e6MMtux7k30gFk6AxqrJq1iY3EnySy2GLLe0l3I+ZBdZtnPhxcmuagEWKj2mLfrPWf7OXPLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CF7jrqAu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CF7jrqAu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789376191; x=1820912191;
  h=date:from:to:cc:subject:message-id;
  bh=SSLyMBuCkpiG5Hm+d3F+w7+8VA5JZHIf1pz8ld0+5uY=;
  b=CF7jrqAudTwmTi93nbcwNwWBYJmM0Rt7gCEZHOgJMpY588iCqkW+17Tz
   sW/heChhb8D8mZr0bOPLJqMciWleK7ztXDFlsx1PF2rarSaEb4WqNzZGJ
   NWeydtSuIF0wqQr81xjTTU4cNY6Vrfaa+hNJ4CbQiewaz2ga2Ggi+BR53
   jnpSeutlc2NX90dv4JIzFk2+o5U1bhUxsjUZ2bYbUxh10UMrwInGyqGNA
   /zOcOAFfCy8iSeZnVFfQJHqd16iJttEYAWslduCKkjdMwrBncsnNh/eLe
   sp36KmTvZ8tl4hmNEvSkagmnmw3M8nCtIo9jBC8c2im42dc5RSPFXoS71
   Q==;
X-CSE-ConnectionGUID: lVR7JuJjRcyf53BKBqlfiQ==
X-CSE-MsgGUID: YoBpKFmxSNKhkvQPKFq8sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="93549888"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="93549888"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 01:56:28 -0700
X-CSE-ConnectionGUID: 0XW/kOLcRU2nuyJx7FEEjQ==
X-CSE-MsgGUID: t1kcsGeCRYWfDtLBWq8GZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="302471960"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Sep 2026 01:56:26 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x62UC-000000002hH-0Fkh;
	Mon, 14 Sep 2026 08:56:24 +0000
Date: Mon, 14 Sep 2026 16:56:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <liam@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [liam:maple_marks_v4 9/16] lib/test_maple_tree.c:359:8:
 error: implicit declaration of function 'mas_data_end'
Message-ID: <202609141637.Bn7wqzBf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/liam/linux.git maple_marks_v4
head:   de1ab7ba20a1402fb09d82f56c37732e65e1b0f7
commit: 59685a5ddca1208bbdcbb990f5cacabb224b369f [9/16] maple_tree: Testing code update for triple split
config: csky-randconfig-002-20260914 (https://download.01.org/0day-ci/archive/20260914/202609141637.Bn7wqzBf-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609141637.Bn7wqzBf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609141637.Bn7wqzBf-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   lib/test_maple_tree.c: In function 'mas_node_fill':
   lib/test_maple_tree.c:356:29: error: implicit declaration of function 'mt_slot_count' [-Werror=implicit-function-declaration]
     356 |  if (mas->max - mas->min <= mt_slot_count(mas->node))
         |                             ^~~~~~~~~~~~~
>> lib/test_maple_tree.c:359:8: error: implicit declaration of function 'mas_data_end' [-Werror=implicit-function-declaration]
     359 |  val = mas_data_end(mas) + 1;
         |        ^~~~~~~~~~~~
   lib/test_maple_tree.c: In function 'test_mas_node_depth':
>> lib/test_maple_tree.c:420:2: error: implicit declaration of function 'mas_start'; did you mean 'mas_store'? [-Werror=implicit-function-declaration]
     420 |  mas_start(mas);
         |  ^~~~~~~~~
         |  mas_store
>> lib/test_maple_tree.c:426:9: error: implicit declaration of function 'ma_pivots' [-Werror=implicit-function-declaration]
     426 |   piv = ma_pivots(mas_mn(mas), mte_node_type(mas->node));
         |         ^~~~~~~~~
   lib/test_maple_tree.c:426:19: error: implicit declaration of function 'mas_mn' [-Werror=implicit-function-declaration]
     426 |   piv = ma_pivots(mas_mn(mas), mte_node_type(mas->node));
         |                   ^~~~~~
>> lib/test_maple_tree.c:426:32: error: implicit declaration of function 'mte_node_type' [-Werror=implicit-function-declaration]
     426 |   piv = ma_pivots(mas_mn(mas), mte_node_type(mas->node));
         |                                ^~~~~~~~~~~~~
>> lib/test_maple_tree.c:426:7: warning: assignment to 'long unsigned int *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     426 |   piv = ma_pivots(mas_mn(mas), mte_node_type(mas->node));
         |       ^
   lib/test_maple_tree.c:432:3: error: implicit declaration of function 'mas_descend'; did you mean 'mas_reset'? [-Werror=implicit-function-declaration]
     432 |   mas_descend(mas);
         |   ^~~~~~~~~~~
         |   mas_reset
   lib/test_maple_tree.c: In function 'mas_internal_node_fill':
   lib/test_maple_tree.c:443:23: error: implicit declaration of function 'mte_is_leaf' [-Werror=implicit-function-declaration]
     443 |  MT_BUG_ON(mas->tree, mte_is_leaf(mas->node));
         |                       ^~~~~~~~~~~
   lib/test_maple_tree.c:30:6: note: in definition of macro 'MT_BUG_ON'
      30 |  if (__x) {       \
         |      ^~~
   lib/test_maple_tree.c: In function 'check_ranges':
>> lib/test_maple_tree.c:1528:58: error: subscripted value is neither array nor pointer nor vector
    1528 |  index = ma_pivots(mas_mn(&mas), mte_node_type(mas.node))[7] + 1;
         |                                                          ^
   lib/test_maple_tree.c:1535:58: error: subscripted value is neither array nor pointer nor vector
    1535 |  index = ma_pivots(mas_mn(&mas), mte_node_type(mas.node))[8] + 1;
         |                                                          ^
   cc1: some warnings being treated as errors


vim +/mas_data_end +359 lib/test_maple_tree.c

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
   356		if (mas->max - mas->min <= mt_slot_count(mas->node))
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
   432			mas_descend(mas);
   433			mas->depth++;
   434		}
   435	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
