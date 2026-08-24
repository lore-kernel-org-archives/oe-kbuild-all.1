Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C14E6BB5B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Aug 2026 12:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573825; cv=none; b=RiBi8RbwBDtyhDiTQ2cYI+4u6HpURxkO3udPI3gT9iZqBMQZNGPqvgYTepbLivT58865+mtBZoHjwfXK06k9AmMMa9qsn22pJ4DsF8S6fPQEQNtPrf3WymmEtkXX2eMnxPBFOUw21Dl+CnWFp0JkNToKuy5J7llvZmJ0M1kdHQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573825; c=relaxed/simple;
	bh=KzfEs0p0O/PIqxjVMQdJXWGl6SOQlnrVWwZEs3pMllA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hWarzo/ZaOOwt9qe+vWY+nX16w4PH8dAPuqLCqVDw8YRxnkVPVzX+4oJUisAKqI8OQReaV2ioFXGIkotBdoqNk3EWmiEViuFNsJQMGCFEdKcWI0g8O2FEMQhK8jEbdCQgDJT3BKzaAN8rp9L3RQ1wTmxG/9WQD4afMytn8hKOF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QiTVCf5V; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QiTVCf5V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573823; x=1819109823;
  h=date:from:to:cc:subject:message-id;
  bh=KzfEs0p0O/PIqxjVMQdJXWGl6SOQlnrVWwZEs3pMllA=;
  b=QiTVCf5VIalaKi3+dl4NdiTMzzbD03GSY5jZq7UQBfoME5dYj8+T/K9/
   uyz4kXhcjYrLMfxP3nAE54uAr3lyVBHtb4gIOpa/38mqGfraoUjdp5kE2
   QlSjcj1GxTSgnCQHBMX9DOTI3h+0XS+7nH4sG8qKjiCwcoB4Gm6yPXO4x
   GTCKR1LB8bx+zqx1zf8mhZ6GZd9TfqbqU/t0Y6JpSTftzBz2UEPuUYBSt
   s6XhRhb0n1gqmN7AGCF/MU6dYgINIih1omcQIkFYHtwukIeXrLFQLNb1F
   iN2Q8YbQ7tFwKsuy5sxLAXEZ6+M1gX4ecXt5Ml1/tnWo2HZZaq8WarZ59
   A==;
X-CSE-ConnectionGUID: z5oHWpLER4mA88Tecoxekg==
X-CSE-MsgGUID: cRlbol2gRiK4I9WRrHXf/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="98355807"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="98355807"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:17:03 -0700
X-CSE-ConnectionGUID: nF0YhzcuQiSyJOpBKfUM5w==
X-CSE-MsgGUID: 6Tjr2JpKSFWtNXxwMZ7yWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="266465468"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Aug 2026 05:17:02 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyTbd-000000002zS-3BVv;
	Mon, 24 Aug 2026 12:16:55 +0000
Date: Mon, 24 Aug 2026 20:15:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>
Subject: net/sched/bpf_qdisc.c:205:18: sparse: sparse: symbol
 'bpf_kfree_skb_dtor' was not declared. Should it be static?
Message-ID: <202608242003.4bV3pcoU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0a0d1d55dad570724bf8c7ea83409639cfb4be9b
commit: c99d97b46631c4bea0c14b7581b7a59214601e63 bpf: net_sched: Use the correct destructor kfunc type
date:   7 months ago
config: sparc64-randconfig-r132-20260824 (https://download.01.org/0day-ci/archive/20260824/202608242003.4bV3pcoU-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608242003.4bV3pcoU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c99d97b46631 ("bpf: net_sched: Use the correct destructor kfunc type")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608242003.4bV3pcoU-lkp@intel.com/

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
