Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F052CCB9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 02:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768876353; cv=none; b=A+0XNuRaL8nymM6rv6OwLnnWO6ryD7+e8xHkB371v5SwqGKUqp4jp6S7+oXei1QQQrqehRNwze/By2hRzZd3txAn747B8yznC/OIT2Dpar4l0fIrhTQAbhB8HUPGMixMyoWLHH3AOGTCs9+K8ABp5GbIvHHvEyj+3zbgHaRGXZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768876353; c=relaxed/simple;
	bh=aqCEEt3IjTGfTTKO+B8gWVRa5oxpr05AlZ45zjgHp8M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a3lC152C2VnEZwT+IvIj9VBzbc7tHtMb0wgBpmP/BGPlzTfMiQTGTg0CFy8OfQlEvkifLEBL/XgSpyGhqVmOD8XTSJkzb6fG2FoFyLIYhHPwpJNoEIXyvhckl6shPlIvDAt6qZNdRuLwcDaqq8hJqngFvK88m176fBzSfM0Fdc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjlATk6b; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjlATk6b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768876352; x=1800412352;
  h=date:from:to:cc:subject:message-id;
  bh=aqCEEt3IjTGfTTKO+B8gWVRa5oxpr05AlZ45zjgHp8M=;
  b=hjlATk6bohdQs+WQsUv2afSyMjYNKtBtju0/MKJjHqxEhFVjWeFuGdc8
   M/RFFPOdCcUTxUSKPK2ohrvpcECy45YqjS7L6WSdjinU0xF+8b0ioT6oC
   hASHRGNt1lUDg1ljCLDmGJWtyimT9CNi4bE8RtggL8FNqmo1SwjDygRls
   pEzWRdKdtex9ykUobP9Q9tszf9dWmm+nLivqjjDcjwaD9F1YIWwr7/6oo
   OYzx1QRX5S+OGr/ikTQ2S4sgBD0rZ1ij93b9ia4IjqZ3+wL2wZzGZzxP4
   6OqYBWLjek8wDBdVj4qop6scDyH5PuIXxGfjgViYp7MpOr3ng8rfnqYYm
   A==;
X-CSE-ConnectionGUID: 42TvfBcuTpaEzIRrnOlWLA==
X-CSE-MsgGUID: 7tuztZOITAugEZD7FOTziQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69978617"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="69978617"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 18:32:31 -0800
X-CSE-ConnectionGUID: mOXruPEPSeyi/83vypT9lw==
X-CSE-MsgGUID: TK35Ocb9Q1++0IwLZkKtQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="210500082"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Jan 2026 18:32:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi1Xf-00000000OU6-3O9E;
	Tue, 20 Jan 2026 02:32:27 +0000
Date: Tue, 20 Jan 2026 10:31:57 +0800
From: kernel test robot <lkp@intel.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 5273/6849] net/sched/bpf_qdisc.c:205:18:
 sparse: sparse: symbol 'bpf_kfree_skb_dtor' was not declared. Should it be
 static?
Message-ID: <202601201013.R0a8Mo1s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
commit: c99d97b46631c4bea0c14b7581b7a59214601e63 [5273/6849] bpf: net_sched: Use the correct destructor kfunc type
config: s390-randconfig-r133-20260115 (https://download.01.org/0day-ci/archive/20260120/202601201013.R0a8Mo1s-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201013.R0a8Mo1s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601201013.R0a8Mo1s-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/sched/bpf_qdisc.c:205:18: sparse: sparse: symbol 'bpf_kfree_skb_dtor' was not declared. Should it be static?
   net/sched/bpf_qdisc.c:234:17: sparse: sparse: symbol 'bpf_qdisc_init_prologue' was not declared. Should it be static?
   net/sched/bpf_qdisc.c:261:18: sparse: sparse: symbol 'bpf_qdisc_reset_destroy_epilogue' was not declared. Should it be static?

vim +/bpf_kfree_skb_dtor +205 net/sched/bpf_qdisc.c

   204	
 > 205	__bpf_kfunc void bpf_kfree_skb_dtor(void *skb)
   206	{
   207		bpf_kfree_skb(skb);
   208	}
   209	CFI_NOSEAL(bpf_kfree_skb_dtor);
   210	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
