Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6881A8F84
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 08:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766131270; cv=none; b=ni5/WaW1Ib44M6aLHmkIeo5pOOUQd6ye4E2EOW2Sfp4fjg0MyO7/UJG/9sSzlxJqV0IuPmoY0V+wbda6cLJVnGpRouQid8aI7FBfzAEbklfPe24rb5H8/7cE5Cp6VI8aCinkCkcT24s2qO8uI8IKuhLE76Bz/eduIYcmIwY8KZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766131270; c=relaxed/simple;
	bh=GvM5ZPwwSBbt1OMe+MrmiNBennC+6nwIgtfJnoIv4JU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cbVutI9wAiX1X12m4c+ULwRISXGTf1XaHDudC2Q+btgLWnbxj1axfCAZclOANyi2zyv7RforI3EtCee2MpndYXdeieXKawbQ82ZeIYlEyh7TxowP+fzOEM36bu9nWIBww7StZSl7dKmp1J08Ao2lb2OH9oboEN0NE20jQyTVLFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PUQfQOnB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PUQfQOnB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766131268; x=1797667268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GvM5ZPwwSBbt1OMe+MrmiNBennC+6nwIgtfJnoIv4JU=;
  b=PUQfQOnB49wkX+z630Wm9JDP0D3znOiiHLZLyU7kcHXMtvtZVkfiJDsk
   JmmNzo+/gtMEawE5s8zz88eNa29kFSIRzkDeB6FpFW1y+0jGGL3vgo0gG
   dhlkKalq75SOcTF0qbgyMADwEqf2VCfcF3c+WU+mIeKF713TIeyjFnMub
   2U+UwTrC+qvJdPqUGTqnFlFKzsrf8HNbe7cLcS1U0YGREi5QGz7QrH1DE
   s9dsHX+VLKIRNX85fQm16YEB0YgJuCi8ONdb14TwwmFeaa3iGNetuQ99K
   5ZZSo9iOP6H8wBZ/Yuj7jFDKd23nltNIrJHiYRMVa4hSyQIvOT3ZZ7yn5
   g==;
X-CSE-ConnectionGUID: MYLp0xcuQ6uM6whiUfimuA==
X-CSE-MsgGUID: lBTTB5oARf6RFIzEv6pCyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="55667238"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="55667238"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 00:01:06 -0800
X-CSE-ConnectionGUID: BqulijgdS82IMr1EO4u20w==
X-CSE-MsgGUID: W3R64uB4TZ+sxDIffCsnFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="202968686"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Dec 2025 00:01:05 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWVQ5-000000003FH-1a1e;
	Fri, 19 Dec 2025 08:01:01 +0000
Date: Fri, 19 Dec 2025 16:00:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 43/43] lib/maple_tree.c:4736:6:
 sparse: sparse: symbol 'mas_next_slot' was not declared. Should it be
 static?
Message-ID: <202512191522.6aAaehcQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d13a7e3b3e0f1ca9e8faea93fbebfed911c2588d
commit: 84719794e06c13fd9a3fd0c547af5bf9d76f7c3b [43/43] FROMGIT: maple_tree: introduce mas_next_slot() interface
config: arm64-randconfig-r123-20251217 (https://download.01.org/0day-ci/archive/20251219/202512191522.6aAaehcQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191522.6aAaehcQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191522.6aAaehcQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/maple_tree.c:4736:6: sparse: sparse: symbol 'mas_next_slot' was not declared. Should it be static?

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
