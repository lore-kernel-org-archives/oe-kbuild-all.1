Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D8B3803FC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 21:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991568; cv=none; b=H1rW9FQ3Vx0OKFQWYFedI5+/iNyheCzZ3Z55xP0zGv7nqQNM2HJFNytCl7eia7YQBymzUwAdm2ZJudvrmJjhdmSMkI3z88KDxZLFZ9TJ5a8gzbCGj8ytUP7Bip5LTgNGRUmzmznXP6obF6qvWTkj6IenWtMZzCpaAOrpphE102E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991568; c=relaxed/simple;
	bh=Fl9aAYJ+rmk6fPkPTUk9q3QVqPNVRrCkSKNOOZbCIR4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=huhnnmBMsyt0sNk4Rzqyhg++jNtAtp6npIcRA3hneU4graFR41vHTR344QkyAeg8T8BAs/ZVsP6zajXJpH/P6TfqkJ9e7aXMB+t9U1eTQCPVbnD88NPg5TeI03VUsFG6Hk2d2MLKQTsdjszeIWSjFM7PMoAtiEdwTnYQElyAmZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BvS3cD+n; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BvS3cD+n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774991565; x=1806527565;
  h=date:from:to:cc:subject:message-id;
  bh=Fl9aAYJ+rmk6fPkPTUk9q3QVqPNVRrCkSKNOOZbCIR4=;
  b=BvS3cD+n2Rw8eQDCEz2HqWqNjGUysZoDAC1TkCtmsWq1a6f0W5xu9oeE
   +luJO0PTETjRdLcVcQ+IKfbEjfeW0Z6pJ1qYXYdvRhHY8uAexBmIooDL8
   4VkyYflBTvB6pnIWFeb+oY3n2KSMcPlXmeiDicqda85Qm6xGcb1Xe0ulL
   hWcR10TnO/dsODR3iZHyhyXj6LTAAkjULQpNVLwMQY9Uj5Ak5MWwzdtXK
   onqQ3qfY6lVsNTUEkm3XKIx2p5QNdLiQ2lzCb69KYJf3Ge65Nhv0WMqIC
   aUJIC9wyysZjrP80i4IDglLpNRoorqKbnRf4plyTjkxxRO+S4845RoJ+B
   w==;
X-CSE-ConnectionGUID: x76H4yBeQv2sUAUZKAd6MQ==
X-CSE-MsgGUID: wOf8yDmsTNeepB9L5T6+hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86635161"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="86635161"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 14:12:45 -0700
X-CSE-ConnectionGUID: UGFnHaZoTCyEm9EppTb0ng==
X-CSE-MsgGUID: XRui5lmgR9iKNOwudZ5i6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="219822710"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 31 Mar 2026 14:12:44 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7gO9-000000004Gj-1x5q;
	Tue, 31 Mar 2026 21:12:41 +0000
Date: Wed, 01 Apr 2026 05:11:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2026-03 1/1]
 lib/maple_tree.c:4736:7: warning: no previous prototype for function
 'mas_next_slot'
Message-ID: <202604010546.J7CX96kf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1-2026-03
head:   b1ccc7ba749c4d69ac7e52c690bdcc202de4d298
commit: 84719794e06c13fd9a3fd0c547af5bf9d76f7c3b [1/1] FROMGIT: maple_tree: introduce mas_next_slot() interface
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260401/202604010546.J7CX96kf-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010546.J7CX96kf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010546.J7CX96kf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/maple_tree.c:4736:7: warning: no previous prototype for function 'mas_next_slot' [-Wmissing-prototypes]
    4736 | void *mas_next_slot(struct ma_state *mas, unsigned long max, bool empty)
         |       ^
   lib/maple_tree.c:4736:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4736 | void *mas_next_slot(struct ma_state *mas, unsigned long max, bool empty)
         | ^
         | static 
   lib/maple_tree.c:325:20: warning: unused function 'mte_set_full' [-Wunused-function]
     325 | static inline void mte_set_full(const struct maple_enode *node)
         |                    ^~~~~~~~~~~~
   lib/maple_tree.c:330:20: warning: unused function 'mte_clear_full' [-Wunused-function]
     330 | static inline void mte_clear_full(const struct maple_enode *node)
         |                    ^~~~~~~~~~~~~~
   3 warnings generated.


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
