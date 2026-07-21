Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C7946D0B2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jul 2026 18:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784656951; cv=none; b=fkL0dKFHrWa8czqW+U+ReH0pIrFfZh4R9hee/fYaEyR5retQozCjAeJm9eAeDr8qCdmVB4GElZ8N/ulMYzeEI+4RNLv77p49Sk7ykQ3Vq50BD/z5NFPioKfG85E6KAE6le6wMeA4ejU//uu89TZe45xjG+QN42KLjwJLF0f5XOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784656951; c=relaxed/simple;
	bh=Uqv4pWB6POuafH7u4CYAzGmJyHKjh8asnKm1bTokhzA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nLEp44DgEJt8u+/Lw3PqN5AD4z0CAT/hICH+eK6+bJaa4FNbMcGMyVjWgOKeCX/CTBEvx42gz2qCbIGAs2kWePQNPwl4RGRShln9T4ud65Aofl61yB+Y6orDMIY7PWJVxC8CzeCMhNWbNHwfyVDPmns9j9I8bOQNawMcMuXld2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZduNrMVU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZduNrMVU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784656949; x=1816192949;
  h=date:from:to:cc:subject:message-id;
  bh=Uqv4pWB6POuafH7u4CYAzGmJyHKjh8asnKm1bTokhzA=;
  b=ZduNrMVUnA3icty6IyVI466D98H+sMOJ0Szuiz+scvCt5pPEZ60GUn0k
   W7CFOu93DMR99J45t2xbkF/NeDBveneq5910cmk/kUzGS45n8X3Dxt37T
   iOdfPvrZ/POQW6t62sObK/ibB0uOJFKXHqX5Qqn6bTr2BY+ecr9nw8hUC
   N3zMsKOtGq9aP+obFRY4czOJ8TlfrviTyutFk3f84857yZk8hOUuwm6+R
   8XUnrB+nHwqJfnqiWNDZ6RCE9M+Ai7q3aMrz8+OgJWO5uIYf7ZsDuZ5Yv
   dv4sczpnNVHmxW51I7dvq0JvdwWaCq3Xf0Lf/43d9ixBXmJc+DcowpU4U
   A==;
X-CSE-ConnectionGUID: pI1wPscLT3WYADalNM+jCA==
X-CSE-MsgGUID: JntAUDAEQNC6iWBoahfJxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="102819775"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="102819775"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 11:02:28 -0700
X-CSE-ConnectionGUID: hxf4ebapTIWJKSkVcjlt2A==
X-CSE-MsgGUID: 1tMiv1UqRQmUZoOd6X0/WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="262114167"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 21 Jul 2026 11:02:28 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmEnR-00000000XpO-0XWw;
	Tue, 21 Jul 2026 18:02:25 +0000
Date: Wed, 22 Jul 2026 02:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 192/192]
 lib/maple_tree.c:4736:6: sparse: sparse: symbol 'mas_next_slot' was not
 declared. Should it be static?
Message-ID: <202607220119.JlXyR83b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   b3c531e1677cf574dd7ffc9bfce3a298c74ef2f8
commit: 84719794e06c13fd9a3fd0c547af5bf9d76f7c3b [192/192] FROMGIT: maple_tree: introduce mas_next_slot() interface
config: arm64-randconfig-r123-20260716 (https://download.01.org/0day-ci/archive/20260722/202607220119.JlXyR83b-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260722/202607220119.JlXyR83b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607220119.JlXyR83b-lkp@intel.com/

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
