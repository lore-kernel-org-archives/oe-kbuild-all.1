Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793235957;
	b=4Qu0Mhs3P/rfB/E0SOJTQuSC5J7unwXnxc9CLWpOjNrn4gI/+rZddvmCZ9OOMe02pcDM
	 tgOyI/mJQw7JAGXo0buskYgXM2tHCjn6Pk7Vxi0j0ULdWD/9CHXffw15N3J+4WLfijFE4
	 1DpaTUVA2Be1SXSS3qPKfl8HwTzqVEdVh2acnSY9awW20Lsgl905LNWamUVikzDnZ0K36
	 YGXRUufmjmYfXN0dOJq+033PBKiiGAQYMi0AQ0q5SzYMHgNy9uoXBmrwgTpIED4JacVGC
	 dbqs2Xx0Sh+cuuTuYVfsXnyQlNSLEIGxMQs1uhe8Tveajisg2ZTl0T/EDSZNzvu5UsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793235957;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ryx9briYBjHi8IQMHbKmA+gFk6kVAae48GME48MIO/0=;
	b=lxAICpsdRqm5HobZFqLYq7V/lFdWKObc1lYYN8GUNU6Oi88eCvxDaD171F1xWlCRzeFu
	 mnJSGO9wZWZpu4o/gd9Ly3WWA/SZlgMPFjjbypRnUU1WGzP7la7pPvb2IcxrnId1MfdQj
	 02I3W3ErDFcQ/UJCZuSCEVhmf58moe1I4MofOr6q2MkfsBL5CVMI/icjiYsOp+JnIHqZC
	 Q2vg9TsuJcxV98b7iMI1HsydubPZRB1Kc+ZUb//S2IA3lu31hTTNvWYMirNd3JlUdXm8N
	 Zsu7Jfb/6q/7JCdjZ++TQVho81ncR7GeXe2VIpZom0ZhnDJ1TY8WcezHslMwzWrdQ0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dbw3tuz1;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA9C606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 01:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDA9C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dbw3tuz1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793235957; x=1824771957;
  h=date:from:to:cc:subject:message-id;
  bh=3NtgCBF4DrZbfEoIs+BH41XvzX1iytaVkP0xpVP2dn4=;
  b=Dbw3tuz1GbttZ0ShBKIUikJeZC047F0JpzqZNbKrNHotWmnEh3Ko4hzj
   a6twdy5E6B/8nHVzd+0npEPtMf8rvkGGV+Od6mN5/oAxKrC3Uiighhjza
   5cgSchw0xsQdydBp1+l0c3/0tmCRrIyeHLAXybPth253ObSIWvaVlkhCa
   ZODiqHK5I3Dj2VvhpuZGKJKA+HeEOIZ5yI9aHn3Pup4UqJJypXMwNBHT7
   0ZjQLSxr/f8YmaXPfVY6iuNJnk7CQIdTYMiOrvW8PJ67TxQvGyqTJGLsI
   hib31Ei637WKl2w9jOfvUHmeZKjDLJZZUSVPR+JclMKKaAzADIdrQWJ8b
   A==;
X-CSE-ConnectionGUID: pNRseTxjRym1KP/Wjirrjw==
X-CSE-MsgGUID: nRRb11W1TISXkwh7Y6RiIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1852650"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1852650"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 18:05:56 -0700
X-CSE-ConnectionGUID: HyrMSuSgRcmyIRYW7aW0FA==
X-CSE-MsgGUID: TaozF6svRoehPWnbs6oH0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5515537"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Oct 2026 18:05:54 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMEaV-00000000ZQi-2j3Y;
	Thu, 29 Oct 2026 01:05:51 +0000
Date: Thu, 29 Oct 2026 09:05:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 374/374]
 lib/maple_tree.c:4736:7: warning: no previous prototype for 'mas_next_slot'
Message-ID: <202610290855.wUnSBLgb-lkp@intel.com>
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
head:   0951885c34a0e48adda08777b026c61fed9613ea
commit: 84719794e06c13fd9a3fd0c547af5bf9d76f7c3b [374/374] FROMGIT: maple_tree: introduce mas_next_slot() interface
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20261029/202610290855.wUnSBLgb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610290855.wUnSBLgb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610290855.wUnSBLgb-lkp@intel.com/

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
