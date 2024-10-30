Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8A2D531
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 02:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730253824; cv=none; b=lgvkr0LXpDKonNqqeomX0XUDP6GKaN3kN5Onu2TVX878C1Sl97kcCfdcx1bxNuTCMtEpoWenuL2XnZbPyfMDDxYhibfjA5CIBlBZSYVU7ZZwb6YfXjtQ4Lu7LI5CJosY9CT+aNKvD/B7ugiwQ1f7snSVC0pqs5onVApKank7E24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730253824; c=relaxed/simple;
	bh=3tJt28rO0HmdSMviP7RvEG/zFrwIsMxQ1fnvI5FlHjA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S2qLZeDBVvg1bCYKjmB2e0S8Cq/dYZX1ERZECoxa126xJBevPhGeESq+BKmRglz2XPExNudSwFHc/AIhFm3jwdAYvjo8R4qEpU3vH1z7yTNC6qBxkt1aW3fb+J+Ops/STJuNTcpurIcYHjBPGlUAUmZEX0hhD/RXHxciJdZlzc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XRasnO5K; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XRasnO5K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730253821; x=1761789821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3tJt28rO0HmdSMviP7RvEG/zFrwIsMxQ1fnvI5FlHjA=;
  b=XRasnO5Kcl5tzcWhjkiJYnXZ4GRHzo09mu8FpuILw1USc38GdhzM3Y1c
   o1kOIstRXhgjBzB+TFAt7eVBLnqTmZiJkVbbcohzkvR85UVLcrJmwQqrM
   C1VDaMBoOqCNWehRiLCBfc5w0kDG/r9ASLsIkzW5K9o4b/p6hYJikYIfG
   IwlxJaEJj/Zg9aWLTUilhN0ylLf6aUfci3iILt6ShROPJCOHzlju8DEqP
   qWE6b9YS+Vue46GzhdLXGgR2VfX1abFUO2JMs1rga4mMDb+lsvhuQs7hP
   e1ZEpPUMJKiXc/wg/W6tEJJBxXnnYdh5/PL69gHyODwAnnR7AZ2U2pQpr
   Q==;
X-CSE-ConnectionGUID: 7e7cTQ/QTRmL7+4tbGYz6Q==
X-CSE-MsgGUID: eGsIDNn1SDyslPeN36HNUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="29382333"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="29382333"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 19:03:41 -0700
X-CSE-ConnectionGUID: CB0jmoLaRJek05KqeXoVbQ==
X-CSE-MsgGUID: DLbSEQDgRBuz2vp3gmzyjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="86105092"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Oct 2024 19:03:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5y3e-000eOe-0D;
	Wed, 30 Oct 2024 02:03:38 +0000
Date: Wed, 30 Oct 2024 10:03:17 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:memblock_align 1/3] drivers/base/memory.c:128:
 warning: cannot understand function prototype: 'size_t
 memory_block_advised_sz; '
Message-ID: <202410300940.zVpIX2Nu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux memblock_align
head:   83696ef201980ac6f4cb2aa078ddaaf6bad39f5d
commit: 352d39387bdbd4fc5daa436afaf2a195aa710247 [1/3] memory: implement memory_block_advise/probe_max_size
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241030/202410300940.zVpIX2Nu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300940.zVpIX2Nu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300940.zVpIX2Nu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/memory.c:128: warning: cannot understand function prototype: 'size_t memory_block_advised_sz; '


vim +128 drivers/base/memory.c

   112	
   113	/**
   114	 * memory_block_advise_max_size() - advise memory hotplug on the max suggested
   115	 *				    block size, usually for alignment.
   116	 * @size: suggestion for maximum block size. must be aligned on power of 2.
   117	 *
   118	 * Early boot software (pre-allocator init) may advise archs on the max block
   119	 * size. This value can only decrease after initialization, as the intent is
   120	 * to identify the largest supported alignment for all sources.
   121	 *
   122	 * Use of this value is arch-defined, as is min/max block size.
   123	 *
   124	 * Return: 0 on success
   125	 *	   -EINVAL if size is 0 or not pow2 aligned
   126	 *	   -EBUSY if value has already been probed
   127	 */
 > 128	static size_t memory_block_advised_sz;
   129	static bool memory_block_advised_size_queried;
   130	int memory_block_advise_max_size(size_t size)
   131	{
   132		if (!size || !is_power_of_2(size))
   133			return -EINVAL;
   134	
   135		if (memory_block_advised_size_queried)
   136			return -EBUSY;
   137	
   138		if (memory_block_advised_sz)
   139			memory_block_advised_sz = min(size, memory_block_advised_sz);
   140		else
   141			memory_block_advised_sz = size;
   142	
   143		return 0;
   144	}
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
