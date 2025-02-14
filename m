Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C058525EFAA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 11:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739531823; cv=none; b=kaa28En2VreROnODd0i83kpZjpFDlaiSo9mGQ+rIhbfXNiu9O4/RNslsMoe2FVXNysj8ffS8mFK9IJyRZJWnp4YOTVOd4Ry+R/LlSBe9hwSdy4bdpsa7Txkr0yGjErukVVv7LgxZqGH3lG0pQdsoHjhIz8GVZzhjIPN2maF3aAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739531823; c=relaxed/simple;
	bh=GLrQ9qJxhpOAfQEoER9G/qv8+xDNG3F/8Ej69Gp732E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TZ8ZU9VdWxia4kiK7yzDhDXsT0VKGLAcyphB6KuW7mAFNimbtCTDpY5t9FxDhYg1GLH7nkKTrtBdaPvVsrJk7OydZEtJViM5et+tMNQCl+AY9Wwwu4MJ8vp36eLqwTThFVte+fUGpW8zca++dNvy8jOJUxKxp/rqqA7nu6ATuQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ncUj4X7x; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ncUj4X7x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739531821; x=1771067821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GLrQ9qJxhpOAfQEoER9G/qv8+xDNG3F/8Ej69Gp732E=;
  b=ncUj4X7xUpzoIOoBY7R121iZCCS1EB4y4bRkFTytACwBcRVyMgIpFZiX
   roiBeR256jcOVnxhdift9CJVI4+ZRSmEnodlwBuGISOZbmcuUqG0EBnHv
   RUiIjr8fTWSA3vp7h7HFG9KcdVpsL8Zpx3Bue6bLVeVV+2QbBBYwt31lb
   YH0k/4sZ9xCqsJIMi3Qyy+dXG/RDxtCeoCXMmiqPjwfYXL/9+eweg37GF
   qoNk71cyXZueWHnGNXyCfwajFrDWoqhAIbJURqUFpdi2Rglj6C0LiIg2t
   RhdsmCgCZR1vTWxHSMyFa/0D9IXYcgPkJ+xS3nFT2LGdydk+3EMxZR4YR
   Q==;
X-CSE-ConnectionGUID: mhjw8Et8RoOFPh9uPQr8Vw==
X-CSE-MsgGUID: fb/KmXFARimWXbLQBZHrvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40200021"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="40200021"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 03:17:01 -0800
X-CSE-ConnectionGUID: WarLhZHMTs65GKeLiNHSvQ==
X-CSE-MsgGUID: Jg4FCowPTsaNIWt+K7o0TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118054702"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Feb 2025 03:17:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1titgo-0019R9-14;
	Fri, 14 Feb 2025 11:16:58 +0000
Date: Fri, 14 Feb 2025 19:16:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 249/249] mm/workingset.c:198:6:
 warning: no previous prototype for 'unpack_shadow'
Message-ID: <202502141906.Kog5uC0M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d2ae202da688a9a795c238142e01da921b3e4b81
commit: 1a3bbc191000a8382db034c86dd4eef905327197 [249/249] ANDROID: mm: export unpack_shadow
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250214/202502141906.Kog5uC0M-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502141906.Kog5uC0M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502141906.Kog5uC0M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/workingset.c:198:6: warning: no previous prototype for 'unpack_shadow' [-Wmissing-prototypes]
     198 | void unpack_shadow(void *shadow, int *memcgidp, pg_data_t **pgdat,
         |      ^~~~~~~~~~~~~


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
