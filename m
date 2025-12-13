Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8181433A0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 17:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765648598; cv=none; b=ZGTU9xkdl4fL2SwjimttWZfTgzucUyEEZN0/neeNpuF8fiuFDdHcFzGuN6cmUtxwZaM95uftyQU4b0gk8yuvJeIh52Dx++ffTEVBzs/chHCt6R/PUOAL+Ja8Ephl5190IT++pQTuojxS/MZRlYmszfYfpVkYrKhtQAHd/E54Og8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765648598; c=relaxed/simple;
	bh=qQxuArpX2oNLv3HcwjG+X6eL5Mih+8CASngEbonKLcs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cCSiFffoXh994iy7SqJB9C7AkyxKDx2iBiSBVcNs0uQcU7TQ3YVUZRYX+xaE3pXxGryqT9AKoUxjWdpKWQ8+hfpgKjrd0XdOWWeTvBYy4se0JYX/CWoa7MUymwJd/m8P/iSFBh28nbRp4aozjjY3GaAY5fWPTHhT6iaT0dAvUwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pyra9ZqR; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pyra9ZqR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765648596; x=1797184596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qQxuArpX2oNLv3HcwjG+X6eL5Mih+8CASngEbonKLcs=;
  b=Pyra9ZqR+A7u2oRgwKIaYG/CdYVEN3gPPJutw6kJjmymQx2HKIondXdg
   MWDlIyV9Zbwjey/6i4Hm7WAnu82ekZPW1LPZKpipGjGTVFK6C+FMVhu6k
   Vtp88a8uhZ4ZqKwaUUF2uoJZHj6jmBolZMHnbA+9fU0YNUevkQgVL2QqT
   qnOZUucBCO3PrQulx77zBA5poKz+aNAQlm2ZWUxASfhsoqFg5ny5G9RBG
   pnIJB03ObLKKJdVdlZstv9kXtBTwiUw6JoyFm/kDrEy3KMJlu260YQOgX
   POCX8h+MZyXB8tbBW6WyTDeCZb0hHc6yjBZLf0IrVaRQx1cNiFLXWSG5j
   g==;
X-CSE-ConnectionGUID: 8xB6j0RUTvCzh/vY/20PZw==
X-CSE-MsgGUID: gN4vU+YKSOi/pi6+Sr9nKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67500216"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67500216"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 09:56:35 -0800
X-CSE-ConnectionGUID: XkuffashSRGubdkOyYEQrw==
X-CSE-MsgGUID: tYz4+F/iRo2WbCAZYJh2Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="201763698"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 13 Dec 2025 09:56:34 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUTr5-0000000028y-47pV;
	Sat, 13 Dec 2025 17:56:31 +0000
Date: Sat, 13 Dec 2025 18:56:11 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 40/40] lib/maple_tree.c:4736:7:
 warning: no previous prototype for 'mas_next_slot'
Message-ID: <202512131843.p1EMQoEu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ebacb5ab3a1e5bf8dc788a29244f0e68d00a5bd6
commit: 84719794e06c13fd9a3fd0c547af5bf9d76f7c3b [40/40] FROMGIT: maple_tree: introduce mas_next_slot() interface
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251213/202512131843.p1EMQoEu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131843.p1EMQoEu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131843.p1EMQoEu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/maple_tree.c:4736:7: warning: no previous prototype for 'mas_next_slot' [-Wmissing-prototypes]
    4736 | void *mas_next_slot(struct ma_state *mas, unsigned long max, bool empty)
         |       ^~~~~~~~~~~~~


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
