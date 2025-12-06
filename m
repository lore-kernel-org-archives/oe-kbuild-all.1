Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792C7199FBA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 14:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765031101; cv=none; b=Vu0BELrJJ0q9zZuIF9M91cjVfp8Hnm9teV45NvfiGyreub9tdcqlekvTH4Cq0tH25VAB1TljaXU0FQJlNxQKJMfOCFBt1r34+QYN1XEsRAGVdG1GzkqccKMxFz+y5QwGNvmOFGE0v8Vgai6h0bH/XhOtRqvYS5U8Npf4QhijJFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765031101; c=relaxed/simple;
	bh=30QQWFnTelswhxwHSvVALLBL3rujFRnszepacxQRCSg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r04xRni6KgC2YlpYZBSDmA0SOE90tPdwbbKSgj56JgkOnC2bMbK9VA3T6QrkOfzS75ZC6Ft5Pg5UwP8PWbfyAUSk9TOsFBNq7r3ywsLqTVL5KSPboHyCZ7zQ9C9U0AmGM3vp/gD68BCNmCnH0nv9M9pOCa6blMR7zz5zZr1nHQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GocrGyqU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GocrGyqU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765031099; x=1796567099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=30QQWFnTelswhxwHSvVALLBL3rujFRnszepacxQRCSg=;
  b=GocrGyqUgMIU2r+fhKSCHrGqywQGbbJ/omUP+T7mG0DshpCrXg3g97FU
   kM8BAOpPuAcl+JtVwrtoqcdZfUhoPxh3awjOXX7qGUSLtRleZ63ee8Iri
   xVA5j7DrApn5eBukaJiJaIvX9BoShGW6WD9lweBsVrBM51gb09l0ClFYC
   m5aTSdAfxybI91tpGkWN24utxa6FK7rrf3NRbzosd2Et2LPZ8ZH1oui+k
   yTV1RqGJc2Wnv0anErtKmQANG73lGQji2x2P2Id27VE61cP3tq7lN08Ql
   ecprCMg1VkUAT7rq9TWynTRgnGu/pSBBAAFSgAAcKqCvCpdRE2aeKaOD7
   Q==;
X-CSE-ConnectionGUID: 91gqbiSZQ+KGaWaCh/fqRw==
X-CSE-MsgGUID: YsS+qqimSDWk3tR3YmfPRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="66041579"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="66041579"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 06:24:59 -0800
X-CSE-ConnectionGUID: m9XgfnISQhKu8q5dDZohdA==
X-CSE-MsgGUID: +QGqPWJOTVKgYTtsL24BLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="199982690"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Dec 2025 06:24:58 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRtDU-00000000IF4-0lpj;
	Sat, 06 Dec 2025 14:24:56 +0000
Date: Sat, 6 Dec 2025 22:24:33 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.2 20/32] mm/oom_kill.c:252:27: warning: unused
 variable 'oom_constraint_names'
Message-ID: <202512062257.f25aoTAe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.3.2
head:   757d46bae762bfc65cab977e0365e3f110f4e300
commit: 87f4eb904747c1edafa64353f98883c560d750cc [20/32] mm: allow specifying custom oom constraint for BPF triggers
config: i386-randconfig-011-20251206 (https://download.01.org/0day-ci/archive/20251206/202512062257.f25aoTAe-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512062257.f25aoTAe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512062257.f25aoTAe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/oom_kill.c:252:27: warning: unused variable 'oom_constraint_names' [-Wunused-const-variable]
     252 | static const char * const oom_constraint_names[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/oom_constraint_names +252 mm/oom_kill.c

   251	
 > 252	static const char * const oom_constraint_names[] = {
   253		[CONSTRAINT_NONE] = "CONSTRAINT_NONE",
   254		[CONSTRAINT_CPUSET] = "CONSTRAINT_CPUSET",
   255		[CONSTRAINT_MEMORY_POLICY] = "CONSTRAINT_MEMORY_POLICY",
   256		[CONSTRAINT_MEMCG] = "CONSTRAINT_MEMCG",
   257	};
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
