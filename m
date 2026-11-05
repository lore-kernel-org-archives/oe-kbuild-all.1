Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793889803;
	b=ktfdDrCab7PCba/qIIn4SAGb7wHYVdGSLFtAoXOUtbEuYFC0dcUTcwvmLKBWAli/MYPS
	 TCPO2NXR8GQB5UVbJ3AeaVG6uKDmWE9BqmHrURi3MYQ9lgE1V6qW90a5wGk+TU2dOFPMc
	 QFKX629cExSRkGpJf3/L+Kz+IzMmjX2k5/5gQJROEM/7xEVMHU2BeYJiRdkcKrTMuGXhC
	 m6b2R90iikzFq/J+h2ZWoomQLjvWOAUl+GBTlnzyAHbbFTgR2ROdNnsDKyU+iRXF7hUA7
	 z6k1YRWcldauXeA9xrMkfe9Vf0nGBjqeZUpiCv+5O949foN0NAtCjxaAF1Uy4AhaB9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889803;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=bYkKOco1iXTQZdV4WdfU/+KgO85J9FOhky3VLTfGmCs=;
	b=juVBy/ims/lE8T7NvqN5tX7v0n79ETXwVxvN1SiW1HPKVA6aXqasf1YF4eChWST3qppt
	 17JK71yDTbol+eaEmjK1STJzk45jsKSYeFkrFJz7Ie/f20NaofBoD/rJLJs1CfpQgHlvd
	 Uc2WAHQn8rP4FeVmCWJHoO9rVv/1BO5VQgilIsQlibOW1gsN7JEuPJ45pLQltaHUaNlJM
	 tfvF9efAMjAfImYyhW6W7LbjUHr54rmzPnLLQJldOP1Ta6vOXi0RPL6VhnJ9WXDmYmVpW
	 GAR3/ovadUSVDvEidDbYx/9xiWCGMlnHoLgjpeiJJS8OyJ1LzPZ7UhoJtzlz7f2MjiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g7U2eZgk;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC66606A330
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 14:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DC66606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g7U2eZgk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793889797; x=1825425797;
  h=date:from:to:cc:subject:message-id;
  bh=F+W/7yYsQYsnl+7OrtquBl3kKjFxqeQ4HGmpT+18XDA=;
  b=g7U2eZgkdxblBrjq8L/cWYF6/U3AQth8RK+qmO2RLO4usA0qjO/RGnMR
   0D3FGB/IAVbo4K0UFum6aqMtRYUi/Eytd5wQw2Uku3Gg5JBN00gyuz1rz
   9mSxOo9VNR620VbXoRg9d+fo5LEK8urSnvzQh3YN1p1sWxu+A4QQwaECO
   GId3oIraHrC7seXheqy0tjpY0sayj+ys7FcSxRPcvhCWNMQu5nM0MxbLI
   u0i7VoNsRa3tRGH7PqvXxrooPuRcU2tKPHaUdylT5mXuc5qo7UI6otigb
   BsSKkmuLzx53dhBNPtVEgmHimSfMBHFzUd1ZDbC7pHomGw3GCfDWN7AOE
   w==;
X-CSE-ConnectionGUID: +QzuC1mVSHCJ1to3xspD5A==
X-CSE-MsgGUID: DJ8RBrBhT9G/zAcqnpO6wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2581567"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2581567"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 06:43:15 -0800
X-CSE-ConnectionGUID: GtSHgq17ScSsxXENmRLwTg==
X-CSE-MsgGUID: vELUmrXBSp+F5qjpMXgNrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8891871"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 05 Nov 2026 06:43:13 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOygG-000000009ff-2pKP;
	Thu, 05 Nov 2026 14:43:08 +0000
Date: Thu, 05 Nov 2026 15:42:36 +0100
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bpf-next:master 88/105] kernel/bpf/arena.c:1082:13: sparse:
 sparse: cast removes address space '__percpu' of expression
Message-ID: <202611051501.wKTaL6VH-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   a3c8813409f13779fec225468aba7d4067a66468
commit: df664dbd6e98bac9f39f33ef622291dedb32bf58 [88/105] bpf: Add stacks for programs to arena
config: riscv-randconfig-r2304-20261105 (https://download.01.org/0day-ci/archive/20261105/202611051501.wKTaL6VH-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7303edbc6496e00558bf44850d63a99fc376c92)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611051501.wKTaL6VH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611051501.wKTaL6VH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/arena.c:1082:13: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/bpf/arena.c:1251:18: sparse: sparse: symbol 'bpf_arena_alloc_pages' was not declared. Should it be static?
   kernel/bpf/arena.c:1287:18: sparse: sparse: symbol 'bpf_arena_free_pages' was not declared. Should it be static?
   kernel/bpf/arena.c:1307:17: sparse: sparse: symbol 'bpf_arena_reserve_pages' was not declared. Should it be static?

vim +/__percpu +1082 kernel/bpf/arena.c

  1070	
  1071	/* Called when a program that uses BPF_REG_ARENA_SP is loaded */
  1072	int bpf_arena_stack_init(struct bpf_arena *arena)
  1073	{
  1074		struct arena_stacks __percpu *stacks;
  1075	
  1076		if (READ_ONCE(arena->stacks))
  1077			return 0;
  1078		stacks = bpf_map_alloc_percpu(&arena->map, sizeof(*stacks), __alignof__(*stacks),
  1079					      GFP_USER | __GFP_NOWARN);
  1080		if (!stacks)
  1081			return -ENOMEM;
> 1082		if (cmpxchg(&arena->stacks, NULL, stacks))
  1083			free_percpu(stacks);
  1084		return 0;
  1085	}
  1086	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
