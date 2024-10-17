Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F581DFF0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 00:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729125234; cv=none; b=seh6P82uuy4SPHE/f7uBAqSZ/jPhkc1wSDLJpfvFtfZ/NMxL4zp/tQpzgzu2tr/rzNaBXzHtlbyantbfRGQijAHnKKlYffDL+Esqf7y2M+7Tl2YXUqyyQkgfkiTlKj37Ndjmqy5GoWVQ/GflkTZQNLaeWePyl0X3SnaelSSv13c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729125234; c=relaxed/simple;
	bh=EcrnKTBGBN7Mbf5ZYoubgLCgYJckyrI6Jedn2yqoKGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nICvZUewXioOyy6vK4/XsMAkav3wIgCcjtko2UKwhygzcswiFLnN0Xprb0AbUlzo0QHlY1OGSYB4xspcyMaIphShKo0+KXS3rmOPHCxcfGg70Anxhz31/pOis0xJ/9a86E4i7L4+qEhHt0WQJ1JnhYsbegkyfggicNCJHqDs5KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oDt7RHEo; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDt7RHEo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729125231; x=1760661231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EcrnKTBGBN7Mbf5ZYoubgLCgYJckyrI6Jedn2yqoKGs=;
  b=oDt7RHEodvcIY3I5yOkRyY9j3FhoYCEdGvkxoGjbsXTv5enqr5I1bM6x
   c+AwhvroAFxQR3rILwc9B4jmiDaOTMv5x7c9X5r1clkTO7Ry2ihegYOUO
   /Yn4pFlPDvXKwAHNEiXVnDMHbL5+CpuaJkXVsQa2vsFZm9oiRq73ZZPNq
   O3Hvst4yQBqtTdambd5yEH0ClUbBkwmGEh1QMMRNbAGZ5hctrM2xU1rWs
   kw091syR1yggfPOTCd3DgTuh+CxQDlYFJWtCC1HwdrFbcb3uTogw3zx6d
   PejfyC7zDqRYjRsUhMmedVdU4qmLXwRUMGbeAibGcrT4V8DZyhpkhINQw
   w==;
X-CSE-ConnectionGUID: qz7Qc8ueRWaWw0xUmD5btw==
X-CSE-MsgGUID: w9d1mHHkQ5meU/rtlTKllQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28383429"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28383429"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 17:33:51 -0700
X-CSE-ConnectionGUID: kafo9zuZSC2nBqbbTm/okw==
X-CSE-MsgGUID: V5D5E3UUQheqdP8vQwRymg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,209,1725346800"; 
   d="scan'208";a="78817079"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Oct 2024 17:33:51 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1ESZ-000LZ9-2r;
	Thu, 17 Oct 2024 00:33:47 +0000
Date: Thu, 17 Oct 2024 08:33:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/3] mm/workingset.c:198:6: warning:
 no previous prototype for function 'unpack_shadow'
Message-ID: <202410170818.8qqutxne-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   27021bed8099dfb7e28770ebc42a34d1bd0e54dc
commit: 1a3bbc191000a8382db034c86dd4eef905327197 [1/3] ANDROID: mm: export unpack_shadow
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241017/202410170818.8qqutxne-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241017/202410170818.8qqutxne-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410170818.8qqutxne-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/workingset.c:198:6: warning: no previous prototype for function 'unpack_shadow' [-Wmissing-prototypes]
     198 | void unpack_shadow(void *shadow, int *memcgidp, pg_data_t **pgdat,
         |      ^
   mm/workingset.c:198:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     198 | void unpack_shadow(void *shadow, int *memcgidp, pg_data_t **pgdat,
         | ^
         | static 
   1 warning generated.


vim +/unpack_shadow +198 mm/workingset.c

   197	
 > 198	void unpack_shadow(void *shadow, int *memcgidp, pg_data_t **pgdat,
   199				  unsigned long *evictionp, bool *workingsetp)
   200	{
   201		unsigned long entry = xa_to_value(shadow);
   202		int memcgid, nid;
   203		bool workingset;
   204	
   205		workingset = entry & ((1UL << WORKINGSET_SHIFT) - 1);
   206		entry >>= WORKINGSET_SHIFT;
   207		nid = entry & ((1UL << NODES_SHIFT) - 1);
   208		entry >>= NODES_SHIFT;
   209		memcgid = entry & ((1UL << MEM_CGROUP_ID_SHIFT) - 1);
   210		entry >>= MEM_CGROUP_ID_SHIFT;
   211	
   212		*memcgidp = memcgid;
   213		*pgdat = NODE_DATA(nid);
   214		*evictionp = entry;
   215		*workingsetp = workingset;
   216	}
   217	EXPORT_SYMBOL_GPL(unpack_shadow);
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
