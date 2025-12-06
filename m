Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C018C258CD9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 10:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765018435; cv=none; b=ZFcH+10R6zRBYgB5jiqDKs+4x0yqT0lg1DfMcdpSY/UwmVYu2b/2xcXShWJcCZF+HdlsOIVj64n4PMEl6l1r/rROcTIZ3sdc0mQjdf5ZOKtMOQLCS8CvdJlBhBHrzjOUlTJVjh+hW4w0jKt8OK4O2fVYJs9HuxfF6cCX36NoO1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765018435; c=relaxed/simple;
	bh=nusKy5afezp5wGODzFCGvkWmB3NoYtitv0xgEaviGEs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GjeL/Pcbrgmk/5feaqc9RCJZjOfTmu0DniQyzdBrD/IhfY18rivpULmSbms8yN8izf8+dtUhalpeCNplDZFV74ZNKTpVEyB2qfNXB+HyigRSxcWKWEOn2bXv04M93xMS/yrS/pbkNW5/5mJbTrA7G4mZSQJbC2YGyRWUEodY8Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d9HuZnFT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9HuZnFT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765018434; x=1796554434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nusKy5afezp5wGODzFCGvkWmB3NoYtitv0xgEaviGEs=;
  b=d9HuZnFTGI4ynzEfg+GfkwRWhmLhhNSVU/0boG77xlntSBWmbrrHTKr0
   TsDFtp+fpMr91W2koAZZKGgK7Rqs8w/qbLSq/HdBJruichmHMPrqzdt3p
   wNMMRUr4yYC4ai3ZU1uOZbkupjQSOg2+BtI7VEGcl2VYdSbPQOUrqhHAy
   N2+HAqua0xp2sY51QcFIb06KYOM5jDofG0Y4bi04bgb3CVILU3Q8ELnS2
   tScmh6qJ7xcTnwT3GxMOF/lgXXTDX1Y0sr6ElmuBNspIKfjYXryun6qyP
   9VmnCKdd05u/zgpSkkI4k+dcWpPNOmAPP10CH1g4b1dKtBtSbdT0JiO+t
   w==;
X-CSE-ConnectionGUID: /7degiBFRUanGRLrwej/QA==
X-CSE-MsgGUID: xfvyN5D5TRyxarMTA4OtFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66972592"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="66972592"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 02:53:53 -0800
X-CSE-ConnectionGUID: NwnVJfyTT3KofmBo8tKKcw==
X-CSE-MsgGUID: 0Rz1XUb4QyyICYzUh9TMfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="194568585"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Dec 2025 02:53:53 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRpvC-00000000G5x-0wo4;
	Sat, 06 Dec 2025 10:53:50 +0000
Date: Sat, 6 Dec 2025 18:53:10 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.2 20/32] mm/oom_kill.c:252:27: warning:
 'oom_constraint_names' defined but not used
Message-ID: <202512061811.AoTnLCfv-lkp@intel.com>
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
config: x86_64-randconfig-006-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061811.AoTnLCfv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061811.AoTnLCfv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061811.AoTnLCfv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/oom_kill.c:252:27: warning: 'oom_constraint_names' defined but not used [-Wunused-const-variable=]
     252 | static const char * const oom_constraint_names[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~


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
