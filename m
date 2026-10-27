Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793079618;
	b=JXBPQfsc2olDxR1V/WSpdVVRtAvxMGLZ5uAdNPzB+1ydUFOOlpHT4TWMi1tc5y4Wsc/y
	 lCNigAKoeqQ2MdJothp5IVRHqBA60GncfDgcSItNtRKsTZ1OVhi8ffoqUyRMVJrNBWmRf
	 DnOriPjo7IXOdw6fM3QLJn3n6l3eNJHssrGH0shB0LLYn0YZOigQ6zVK3yhfddCsRznhP
	 9NW95mnMHY2dhUc9JSDSBz3wHay+GMopR040KP51rvxsDyvUNnGjX+C3B+GqtJwlvNFk1
	 Hsv4RPX74YvkHZnAPIxwbWjVTXOwPXRs1LpZ2CEh9n/YVBftM65WdNXf5EfOb6t6l+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793079618;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=CBkqcXepXyeEolMpDK8yLJBbyeFO4x2td//q1WISnvk=;
	b=wdIF8IHvtpaKESOyl6Rlbu2R+ZYKTJR8QEx0KqELWZIoJdA/8aqSA1wZn+qpMnWV+mnP
	 JKQrvddv0P/oSoiQqYmTvSWkuREGTFLtK1SIzTcsKThi72DYD9yNl7AVE0r4VzvAF9XC/
	 +o+u0quGI7TzxAEYpbJRtgCcBisWshkTi4jOgw7zIYkoR8/vocbc4wffzmj+ANhd/zPpu
	 QHXE/0ytq9TuSDvLtOl0fqEryaQFu1JPDncO2C54hoPWoexgZIPrwIqNjg9SwZRUsC6JD
	 yo13Zwng/woa0/Ego3AWLKFW24snGlzJB2XX7llGW0uPsFyjlZI7Ju0BwmQuolCCneQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TkfXIV0s;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10008606A31A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 05:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10008606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TkfXIV0s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793079617; x=1824615617;
  h=date:from:to:cc:subject:message-id;
  bh=sQzFDrUNrDkH18PBEWLyy30KVc1FqbUH+MCkOsN1Ing=;
  b=TkfXIV0smQrU6MESVV18CQ2t8Uzd6sBLrMxDzVOIlN0JBA/CgW2E1Twu
   zPuKfRxvhnH3fqU14g3VTzHqPMwt0Vw10JqJ5D70SfDv+A+9kJ0k2PULt
   UyolvJzVR6q0RWsiUoQgxw4h9JuXNWlg2vlJ31jQmHQVKzQGlpG62g0rs
   XSmyqs5t382rnTnq4dwc0hOXNIJL+Pf/3NSRTsTyyjTAeU8xxtt1h6XK9
   +hERy/ZNhSfeSL8mQsV39QAzFNXu+mQfAY4PQr5uxSQsEli22Xe6q4xkF
   ztjhRrzA8+0NaVAAe8ND4axcSWMR5cH/CIMRBQPL+JcPYp7GfStnnYnYw
   w==;
X-CSE-ConnectionGUID: YkIfzcdKTDqNnjScia026w==
X-CSE-MsgGUID: DUlw32y3SvO6AnZjHdPMKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1860217"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1860217"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 22:40:16 -0700
X-CSE-ConnectionGUID: 7BbIxTJvTnqvMutoHspzhQ==
X-CSE-MsgGUID: iDMWTudDSNWj81po+uqeGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4542371"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 26 Oct 2026 22:40:16 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLZuv-000000004Ot-0hQA;
	Tue, 27 Oct 2026 05:40:13 +0000
Date: Tue, 27 Oct 2026 06:40:10 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 353/353]
 lib/maple_tree.c:4736:7: warning: no previous prototype for 'mas_next_slot'
Message-ID: <202610270650.FCnpQWic-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Liam,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   6b915aa34a0d468d55e46535173b0d946dfcf9a5
commit: 84719794e06c13fd9a3fd0c547af5bf9d76f7c3b [353/353] FROMGIT: maple_tree: introduce mas_next_slot() interface
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261027/202610270650.FCnpQWic-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610270650.FCnpQWic-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610270650.FCnpQWic-lkp@intel.com/

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
