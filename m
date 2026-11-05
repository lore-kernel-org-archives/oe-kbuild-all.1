Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793859517;
	b=Ig7eIZFpUmHXBUjpRYuVwqmVFeqJHhThLSX1oF0VUSA1MhRKiZlrIfIl8udAm27X2nsj
	 D0Jb5w03ZqZwymyGTnm3Ixw62yzVJgM42XGZ1bqntvB+R/4m7R+a7fWPzIvVZNFQbrkKL
	 U8PVOgNDMB+4o5L1Evq+eFtoAjEf85R6Dl4h0u4dGLK9425SYLEz5hAEHjfyPfViTlJJw
	 BxZpyBoASVetxNmVkUet+cBRXWW/0QizVMQj/dgQBRwwgVlnjM+MzOfZBO8vIGPmhDoHM
	 OyP41Vp0meWQDgZGXw2ob/Uebr6k3Pl7Q3DxHl6ZyGtDRkUQPezavDXfFii3Oursbnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793859517;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=dNsmF23/McPvTLU1dv7XTz0ooIKp0P39EAIUB7LSTB8=;
	b=3emElRe84zThmCEbS73Kit6vOB8JbYTte5o1MwVJ4Be16gYT3GFr8CG5fU8IdsHDYSmI
	 sgue0K+X9wuV4NCA+8Pd1Za4Gy2gaj7+QXA0eXfq9J9BI+xjOHAbePmDHhhQZfBsJoEz2
	 nxL2ZUEZ3MIl2Yu91iQCzfiF1YeAlX6iSt8knm9uGVC7r7+LfgEQE59U51Jd6RQPXDoHo
	 RUdkWFqWpehD4qEZClnIG+0QErqu9tDVLBQABBb1M3EWWYRPgg1+hKwgcRW0c2Mf8wS58
	 uoM0uFzNzq5wj4koOFR/doloay+GUtB8WLyuZncNNJzgkK0kDh9iFyGcQ4zk1kGb0XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kZk6HMxF;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415D1606A326
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 06:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 415D1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kZk6HMxF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793859516; x=1825395516;
  h=date:from:to:cc:subject:message-id;
  bh=3JyO6HdlJqJG0JWzTo6neb+9udcFeGlvkA8g2nifCv4=;
  b=kZk6HMxF6E4uOG0dgyDeZZ2dGrrkK7cyb2sWazIVYdMYIT8kSJRd5LOO
   fHovCp6/Dm2r/dkBubrj1eTgUQQv7YFMxkizsG/M3G20+KijVIqZfxcGK
   86zPjL5Utz4disTFY9DBjOkkQyW1GiPT8ND7NFnfS1TdXpUiz2S2tkUWA
   6REzlNmlhKCas+YgoVYpyXwgMmq2uvdS5KRxdCvGp/QwklNxQKa3mclLr
   M1Yroovv18DOZc8HxoiOD+bUEWb5auHMTLSC4lcuNzBOI/RHtBgaWVH3a
   E6janLCYgZeEDfRvIyur/ei7yIjldbY+hYsU1O7OXvxMKocv59FZJtdRn
   g==;
X-CSE-ConnectionGUID: BHNLGCdcQ92sGT2n51lvGA==
X-CSE-MsgGUID: eKUDpatSSpOER3HxWYtLyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2629586"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2629586"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 22:18:35 -0800
X-CSE-ConnectionGUID: u9yXi/MfQj67I/ZIuwBqEA==
X-CSE-MsgGUID: fKC76WdeR826VTdAwmSQ8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6921773"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 04 Nov 2026 22:18:34 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOqnv-000000009Yz-2wFo;
	Thu, 05 Nov 2026 06:18:31 +0000
Date: Thu, 05 Nov 2026 07:17:52 +0100
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.procfs.cleanup 1/172]
 mm/alloc_tag.c:620:13: warning: 'shutdown_mem_profiling_async' defined but
 not used
Message-ID: <202611050729.27M8JGpq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.procfs.cleanup
head:   f445e4492022fee8fcf28abe412e5011f62fa08a
commit: 29c0244f3e0154917d89e4390a61b46b8b181ffc [1/172] alloc_tag: don't remove /proc/allocinfo under the codetag module lock
config: mips-randconfig-2000-20261105 (https://download.01.org/0day-ci/archive/20261105/202611050729.27M8JGpq-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050729.27M8JGpq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611050729.27M8JGpq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/alloc_tag.c:620:13: warning: 'shutdown_mem_profiling_async' defined but not used [-Wunused-function]
     620 | static void shutdown_mem_profiling_async(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/shutdown_mem_profiling_async +620 mm/alloc_tag.c

   613	
   614	/*
   615	 * A module's tags are reserved with the codetag module lock held for
   616	 * writing, and a reader of /proc/allocinfo takes that lock with the entry
   617	 * pinned. Removing the entry there would wait for that reader for good, so
   618	 * let a work item do it.
   619	 */
 > 620	static void shutdown_mem_profiling_async(void)
   621	{
   622		if (!mem_profiling_support)
   623			return;
   624		shutdown_mem_profiling(false);
   625		schedule_work(&remove_allocinfo_work);
   626	}
   627	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
