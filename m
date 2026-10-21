Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792547019;
	b=xIb82//rnxd+SDlRhlcSFqTn0AITLUpW/eGmnKIiuz/Q0h1w9nEuJIGXgde35YtvjuyL
	 uXdd1JeCUu8TFcxKlrh0YrhE6OjK1L4axKpzgbTFzP1hKJXwA5fPUZ7grTN9oMB/WYOJa
	 gd0Fb9/+okI+CFtX6jTAp98M38i83OMqc4pHhgpqr/PwnYKjd4Um9w039qyj5R89QeYGQ
	 NtLUQ7qhfhWX9nzCfotpasfjWssoooBm50M/u7TTfEtfEkr9Uwb7HGAJIxDUGJVMAfiHT
	 ffO1OEgJv8WinL0eEb4GPFNtE2gKgFGtW66dt9RbVcosmriaIzTDRjsaUwk19+cDTSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792547019;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=yDkHy9wlIDyHUu5qxd3nM4pdzPpVLYAwwZXpJUHky7Q=;
	b=ReoV4Yh05OIYqxkMnoYNjt1wXJM8lXIafQD1pXnZ7eYOU5LgaFk5TsxEKiBn3T00/9Fv
	 wE3lUtDl+zhqzmR7m5Vz2PQog5pg3zjR+v+VVUf+9Xdx9rpyiGNg4La2T/35vlwcK2ijR
	 BjR1RT4XdZhVlXkOyyrpm9YRiZgQMOXvy+Bi5ZIMoqTtZU1m6+Og44+y+pra4E8hZyY/r
	 ygF5odFXTi0v6iDRsnGA8y87cPc66zgFubyosnbNLYePzp2oOkdpoeL8Gz57UlrN6FEVY
	 jE6dJEdcJ6MLzkPDIzmW1f1uzz/kO8fNEDYMEBJ4lFeCW4bGvRpKwdV40ZEt2lCA1mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=joL3Xy7F;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D99606A31B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Oct 2026 01:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28D99606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=joL3Xy7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792547017; x=1824083017;
  h=date:from:to:cc:subject:message-id;
  bh=yXfZWlm5iokFaU75rsO7R42NY0mF2SWGtdL04XUsHGE=;
  b=joL3Xy7F6OTi5wXzeeMeeNKYYNzNyIwW/zSUsl78zkWxbLW4uSliYFoI
   NZZ9WiKQ7EgFyScmZnv7U54k5+wHRJrdMClIam1lvOghPzcvlq9hlIdWd
   VPEbGpQY2vVr7ppqjUdbe6eOmseYPCV2HGKgGF0pEkPe3Bvo363vmduN0
   bYQFk/DxJ43qe9B9bB9d4pkRfbOBaygSnnR9jXdivgehKLx5uYavRXP3V
   70tKN9cT7ZhhxrfJbt7MZgSwthL+Ygcy5Se5Qf+tajPaurjxpWixAqOVV
   OcoTiayOJZIx1ImiE04OMPWtDQs+ONHr3dEW5XAqPLKXfmxx+PDSk/zy0
   w==;
X-CSE-ConnectionGUID: HQBUQfpRQ/SN7yB3zubX6Q==
X-CSE-MsgGUID: 1VoslhWxT/m8sW44DUFnDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1142693"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1142693"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 18:43:36 -0700
X-CSE-ConnectionGUID: RUcgiiOxRY2t+cj0dWP8NA==
X-CSE-MsgGUID: Vewk1RRwQCyfiWTaXo5UyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3364653"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 20 Oct 2026 18:43:36 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJLMb-000000006aB-1obQ;
	Wed, 21 Oct 2026 01:43:33 +0000
Date: Wed, 21 Oct 2026 03:43:10 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 17/146] kernel/bpf/arraymap.c:827:17:
 sparse: sparse: non size-preserving pointer to integer cast
Message-ID: <202610210323.U5vqxig4-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux fermata
head:   7b45e27f0f0faaa13da429815b6143b99eaa232c
commit: a664b63f784e6d51674acc16c5ad6e1776c8ffd9 [17/146] bpf: Call the callback of bpf_for_each_map_elem with a pad
config: nios2-randconfig-r2308-20261021 (https://download.01.org/0day-ci/archive/20261021/202610210323.U5vqxig4-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261021/202610210323.U5vqxig4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610210323.U5vqxig4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/arraymap.c:827:17: sparse: sparse: non size-preserving pointer to integer cast
>> kernel/bpf/arraymap.c:827:17: sparse: sparse: non size-preserving pointer to integer cast
--
>> kernel/bpf/hashtab.c:2541:25: sparse: sparse: non size-preserving pointer to integer cast
   kernel/bpf/hashtab.c:3442:17: sparse: sparse: non size-preserving pointer to integer cast
   kernel/bpf/hashtab.c:3442:17: sparse: sparse: non size-preserving pointer to integer cast

vim +827 kernel/bpf/arraymap.c

   803	
   804	static long bpf_for_each_array_elem(struct bpf_map *map, bpf_callback_t callback_fn,
   805					    void *callback_ctx, u64 flags)
   806	{
   807		u32 i, key, num_elems = 0;
   808		struct bpf_array *array;
   809		bool is_percpu;
   810		u64 ret = 0;
   811		void *val;
   812	
   813		cant_migrate();
   814	
   815		if (flags != 0)
   816			return -EINVAL;
   817	
   818		is_percpu = map->map_type == BPF_MAP_TYPE_PERCPU_ARRAY;
   819		array = container_of(map, struct bpf_array, map);
   820		for (i = 0; i < map->max_entries; i++) {
   821			if (is_percpu)
   822				val = this_cpu_ptr(array->pptrs[i]);
   823			else
   824				val = array_map_elem_ptr(array, i);
   825			num_elems++;
   826			key = i;
 > 827			bpf_call_cb(callback_fn, map, &key, val, callback_ctx, 0, ret, unwound);
   828			/* return value: 0 - continue, 1 - stop and return */
   829			if (ret)
   830				break;
   831		}
   832	
   833		return num_elems;
   834	
   835	unwound:
   836		/* The callback left with unwind_exit: nothing to drop here */
   837		bpf_unwind_leave();
   838		return 0;
   839	}
   840	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
