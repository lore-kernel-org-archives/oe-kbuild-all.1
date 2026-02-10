Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562EC2D0601
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 03:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770694700; cv=none; b=tyxhzyxLfskOd/PNkSum8EpevTubC0Ej6hW3aE6Zj/1r9TAL1qN86U+gkaKg7D1oWF8v2ZMBIEoL9P6ERp3uQNTIAxZCI0zrsXhGHn9DzXMGq+KI1ESwK46ovs97HHAXHbwNphYhK9MoX9/Fgv8EtkFLGT/+u56Hg/EU+w4w1VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770694700; c=relaxed/simple;
	bh=VcwMFoPyz5s+M3CLBHcy6PR1fqtMCG9/+oATAr28kSY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jTCzOZwvHMDiabLlXAUkSmqYgq+Jp+axxxniyxXq0s20KXL+nl6KEDflekIWXY7QBTOBpwmlW1leNhZGf4+YrWwbiCwsfDCBqbaAWwl4Sh170qPlZ4fNe9OuZgyNyV9iR0FKzpZA3EIeIivwBCxrIAnjAYy+PCQs6g+wU6uOFko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SX3WpqtK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SX3WpqtK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770694700; x=1802230700;
  h=date:from:to:cc:subject:message-id;
  bh=VcwMFoPyz5s+M3CLBHcy6PR1fqtMCG9/+oATAr28kSY=;
  b=SX3WpqtKoIbTznXMUiMNi9Z1Dr1aVeqUytzhmTXqu5oO2ImppxTU05EA
   LruTHvX3dXnEBlcn68iPg5BhaRGL9a8UZDrOlC5cYMuHccHh2Q0pvXCeo
   hNUmq74U4MUuPguU9Ooe5tmRT669PH6rCNHjVmcUS9udXUeQB5zKnpuGE
   XL6vSv+x8Dq8Ix1YpXQsvoPVTkn3fGo7RBTvuSXZf1DjLgdFTJT03Nbh8
   mJU1Eopxr70jkXmFVKFXrv9aGxSF7aZdzou5GRBGD/gbfiaK5f489dMr1
   opPse4gs3zYSSM+ps8RO0nKakZYn+fZzz/ZvUNKUqZFjIBvJJuEHEE0xf
   Q==;
X-CSE-ConnectionGUID: LhaFwhuLTcuL4Bdp/XJdcQ==
X-CSE-MsgGUID: JEzmAO2rSPK6YPjZdJrUpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="75440719"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="75440719"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 19:38:19 -0800
X-CSE-ConnectionGUID: NiAWjiQ1R7SwGP6/XIWalQ==
X-CSE-MsgGUID: NNAbH7sOR9u6N8D+lWaCcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211465305"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Feb 2026 19:38:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpeZr-00000000oaj-2Z43;
	Tue, 10 Feb 2026 03:38:15 +0000
Date: Tue, 10 Feb 2026 11:37:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 include/trace/hooks/dmabuf.h:15:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202602101123.TbQMbX3B-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   3b54985e12634723f50be663b001e0f03e8643e1
commit: 0d385a5b58ead06f4a2b6565cb1ce02b922863ce [2/2] ANDROID: dma-buf: Add vendor hook for deferred dmabuf sysfs stats release
config: x86_64-randconfig-123-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101123.TbQMbX3B-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101123.TbQMbX3B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101123.TbQMbX3B-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/dma-buf/dma-buf-sysfs-stats.c: note: in included file:
>> include/trace/hooks/dmabuf.h:15:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/dmabuf.h:15:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/dmabuf.h:15:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +15 include/trace/hooks/dmabuf.h

    13	
    14	struct dma_buf_sysfs_entry;
  > 15	DECLARE_RESTRICTED_HOOK(android_rvh_dma_buf_stats_teardown,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
