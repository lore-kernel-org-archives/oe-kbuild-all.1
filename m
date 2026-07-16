Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB813B4E9F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jul 2026 08:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784191206; cv=none; b=LC46Ng/mhUCHjYpA86s8SBMoybwTx1iRKkHhFFH0mNTuM35aImwM3IGNYBmb5piltE6GZV6xyGb/T/XpfpOzocFCzqZcYxN3TLBtn/QhxbwnGDk3s6HDRxAVrz6+VE4IcRNGOb6mW8ERDMvxUV0ltOxmaJRway5VollKWhyz3bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784191206; c=relaxed/simple;
	bh=3Q8Axt/JWeMwaw8L2ArJl15vTqpglKFUlXAIBtlkAMM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ccicYR5GYQFKReS2/UBw6E/YF7FbrDq5CVsQnM3LtT250cx26CSrzgNmCd6L/1yOI4lcSDXMZRmGPOT3dCokZhY1Hq64xCjgBKP6CM6FWuUVNe+UVx5tNiTImoP2xrLCVQLOfbJMwBYuaElb/NksW1d6LYvA7+bOx2kAEBrqUMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jjODNSqQ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jjODNSqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784191205; x=1815727205;
  h=date:from:to:cc:subject:message-id;
  bh=3Q8Axt/JWeMwaw8L2ArJl15vTqpglKFUlXAIBtlkAMM=;
  b=jjODNSqQskNSWCdegRpoj3dafGbW1UxJYp6KgDiR2mT+6f73XT90vIOZ
   Q9+lgakKzezapurUEsXpT5di2tYsnQbjh7nh+hAOT7lKRr1ZkiqeNNH3i
   1txcLEULa4sb1DIANIBpVw++QWIbII+KsOAi4LaA/FYHy+2RDTW7PQGal
   oaDj8UPKXRQibKjCx7AGKYdSrwJOo+lkYFY+VqWT+udoeiqkPwsyKZMbC
   d6JwpFuPMm3axasBbqUza5UkOpGHeTr4WfaI3g4MerAGxbRyXS2Mz7WwR
   6x4GW0/H+lt+9UkAguQnt/KmuTHDhO9e9AFxyWthMNXoV5C1VuPB0XdxC
   w==;
X-CSE-ConnectionGUID: l6KILWSrQzWZu/HDVlm7HQ==
X-CSE-MsgGUID: dDLD6JGhQaubZiqmKkgr7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84883880"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="84883880"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 01:40:05 -0700
X-CSE-ConnectionGUID: oYk9AsCkQ4q33FldGu8PjA==
X-CSE-MsgGUID: n7XLXNIPSxGFQKF6rXpDoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="252009655"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 16 Jul 2026 01:40:03 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkHdQ-00000000OYH-3vjX;
	Thu, 16 Jul 2026 08:40:00 +0000
Date: Thu, 16 Jul 2026 16:38:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/1] lib/maple_tree.c:4736:7:
 warning: no previous prototype for 'mas_next_slot'
Message-ID: <202607161650.Yy9vLvqb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Liam,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   ef982285df9625b742a6fe0b9f967d533e0f52f2
commit: 84719794e06c13fd9a3fd0c547af5bf9d76f7c3b [1/1] FROMGIT: maple_tree: introduce mas_next_slot() interface
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260716/202607161650.Yy9vLvqb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607161650.Yy9vLvqb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607161650.Yy9vLvqb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/maple_tree.c:4736:7: warning: no previous prototype for 'mas_next_slot' [-Wmissing-prototypes]
    4736 | void *mas_next_slot(struct ma_state *mas, unsigned long max, bool empty)
         |       ^~~~~~~~~~~~~
   lib/maple_tree.c: In function 'mas_wr_spanning_store':
   lib/maple_tree.c:4103:1: warning: the frame size of 1304 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    4103 | }
         | ^


vim +/mas_next_slot +4736 lib/maple_tree.c

  4726	
  4727	/*
  4728	 * mas_next_slot() - Get the entry in the next slot
  4729	 *
  4730	 * @mas: The maple state
  4731	 * @max: The maximum starting range
  4732	 * @empty: Can be empty
  4733	 *
  4734	 * Return: The entry in the next slot which is possibly NULL
  4735	 */
> 4736	void *mas_next_slot(struct ma_state *mas, unsigned long max, bool empty)
  4737	{
  4738		void __rcu **slots;
  4739		unsigned long *pivots;
  4740		unsigned long pivot;
  4741		enum maple_type type;
  4742		struct maple_node *node;
  4743		unsigned char data_end;
  4744		unsigned long save_point = mas->last;
  4745		void *entry;
  4746	
  4747	retry:
  4748		node = mas_mn(mas);
  4749		type = mte_node_type(mas->node);
  4750		pivots = ma_pivots(node, type);
  4751		data_end = ma_data_end(node, type, pivots, mas->max);
  4752		if (unlikely(mas_rewalk_if_dead(mas, node, save_point)))
  4753			goto retry;
  4754	
  4755	again:
  4756		if (mas->max >= max) {
  4757			if (likely(mas->offset < data_end))
  4758				pivot = pivots[mas->offset];
  4759			else
  4760				return NULL; /* must be mas->max */
  4761	
  4762			if (unlikely(mas_rewalk_if_dead(mas, node, save_point)))
  4763				goto retry;
  4764	
  4765			if (pivot >= max)
  4766				return NULL;
  4767		}
  4768	
  4769		if (likely(mas->offset < data_end)) {
  4770			mas->index = pivots[mas->offset] + 1;
  4771			mas->offset++;
  4772			if (likely(mas->offset < data_end))
  4773				mas->last = pivots[mas->offset];
  4774			else
  4775				mas->last = mas->max;
  4776		} else  {
  4777			if (mas_next_node(mas, node, max)) {
  4778				mas_rewalk(mas, save_point);
  4779				goto retry;
  4780			}
  4781	
  4782			if (mas_is_none(mas))
  4783				return NULL;
  4784	
  4785			mas->offset = 0;
  4786			mas->index = mas->min;
  4787			node = mas_mn(mas);
  4788			type = mte_node_type(mas->node);
  4789			pivots = ma_pivots(node, type);
  4790			mas->last = pivots[0];
  4791		}
  4792	
  4793		slots = ma_slots(node, type);
  4794		entry = mt_slot(mas->tree, slots, mas->offset);
  4795		if (unlikely(mas_rewalk_if_dead(mas, node, save_point)))
  4796			goto retry;
  4797	
  4798		if (entry)
  4799			return entry;
  4800	
  4801		if (!empty) {
  4802			if (!mas->offset)
  4803				data_end = 2;
  4804			goto again;
  4805		}
  4806	
  4807		return entry;
  4808	}
  4809	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
