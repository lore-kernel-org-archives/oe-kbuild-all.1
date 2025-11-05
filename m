Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129671EB195
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 02:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762310930; cv=none; b=NmQe/vOt9jeoJ2WG/27/hI8+BOWNGoOB41Rby/9k5h1PQval0cJSzigHd1trpVax6kCAjvLpyGy2pP41JGEHEmHD0Mkvs8fhicZqq/lWrKDyWfGymW5WXWR4cRBRUpvxC26V8G6nMCTb45KTrR/GWgjUkyaGrnnoLUPRVDON+T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762310930; c=relaxed/simple;
	bh=WcUaXhvksu5nWyqjPFSuMLjR6b41p0a2DfMR4W4CupM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ftXnzoP0WKV06wHpGvmqW5QQmve7VerMrOc2q5VfpcuyKJxcFdFy4FNrzE60cIVySJ37IWehLt7KaetwAfqviolNwYBjTDmmwmyTXAG6Cv2vAWa8XtImuYFF/kZyJcKv0Tiyf6Vjh591p0vvAJfyaP0Fdph+xzoaVfB6IfXbPiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GuZR2cYr; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GuZR2cYr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762310928; x=1793846928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WcUaXhvksu5nWyqjPFSuMLjR6b41p0a2DfMR4W4CupM=;
  b=GuZR2cYrNomO62h10eldVvJHUEyA0WcAzHcREry6K+TK+bpzHLrgXzAi
   6FLsZvIt9Zv82AFZEN0FkJAlafBwKhesF7h9l4mqrAYoVkvBPJHQkcqf1
   qryG3Kz7OP26oAS30GKI7a3pHjA50OfaItx/RvGvQR/xy3IoDNqXx9r8b
   C3FCwTbbnKrWZtfFGxbsDk+mQSncjL8162Ogl+AZ/m2xD9Qasfu5teeaN
   Fo1Vp8dE0qcKXs5aVFCcR3kwFb8p915NOH8MEc8J+GU13rwf5HqlrDJgw
   uVyyWHQ81Bu1cZmFZqEHECGYvbFrkMkSu9sYQVuZYicA1zVyJNtyY83WY
   Q==;
X-CSE-ConnectionGUID: NlAOAXM2T++oDZezHpXzgw==
X-CSE-MsgGUID: xzmVSCxXQd6IAamAFEd+aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68256077"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68256077"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 18:48:46 -0800
X-CSE-ConnectionGUID: Pr4Qgd8hTeCODoxgl29Nwg==
X-CSE-MsgGUID: 4Z81KzVWSMGi8+3UVMq1UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="191424359"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 04 Nov 2025 18:48:45 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGTZi-000S5e-1y;
	Wed, 05 Nov 2025 02:48:42 +0000
Date: Wed, 5 Nov 2025 10:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.1 17/27] mm/oom_kill.c:252:27: warning: unused
 variable 'oom_constraint_names'
Message-ID: <202511051043.W7leUz3z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.3.1
head:   176f3f07db49e29a193bd0b986301486bc19a5a1
commit: 1de15690efff0a4668efe386cf2b9bacab17e0ee [17/27] mm: allow specifying custom oom constraint for BPF triggers
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20251105/202511051043.W7leUz3z-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511051043.W7leUz3z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511051043.W7leUz3z-lkp@intel.com/

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
