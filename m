Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27281BA50
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 20:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736539803; cv=none; b=o839Zx1Lpanpy+/XQP2eyK0NdujrqjWDvslKIiRCp4prc4q8GdReujlAYgsaw64PIUnAL7WGA6CVIqW4Tj++usv3TQGGFKuUVhTn63mxdk2+MUO8dg91jQQBB+FgYCMoFr0J9M4f6ESkgvnbieivqFL9om8BiW6mnr7oxO/1CM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736539803; c=relaxed/simple;
	bh=swUya38COzE+ldBnWP9OHJ3sEm+97Z4EIyRrFklKBNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N9+LPPpqvPymMgtnJzlPQGdTb5rooRBR+Njf1lg+RqMTutUlE9HfrdN2rUzlhoHrQ40nGL7JwRnkGpuT9ZlOfE2mmstNAcZ5ECpUEzqjGRcNHRuOkRa6zh9KOpe24WCtrYEgIN8A8SnBYUCoH+tV2WcP1qSwWCEoZpMGpVm7aBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k2Towey/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2Towey/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736539801; x=1768075801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=swUya38COzE+ldBnWP9OHJ3sEm+97Z4EIyRrFklKBNg=;
  b=k2Towey/ACpIzalWU1tH312tGCXQNrxGdKa3wzmOeXwPXc4SJYQr/tuI
   sI2rLmlWkVCaYdYhZgsaLtLKGo9k//2yEoHsH1dmFkX+l1NXsij2mpECY
   VhLj5xu/75MgxDGWRRpEM+HE8rr01dlyK0c4mo1YOHGvHei/CbPtlC38E
   lx/4VlHkLL/VP3dHFkWKi3/TU9FoBUfGR7AgaiB6PNL276/2cA3lQKhro
   OxHN64Xb2eTPyiCZY64uqi9oXwzFo5nWBbmj9nlOqdphD1Ltx3r7C8Uub
   xyIxyaqBi3rKyLLtWpSopeNItZVQGsWmh9/h1VJ/Zz3xozCacbmd6IHI2
   Q==;
X-CSE-ConnectionGUID: XSw1qsOAQ0uVP1+UsP84Nw==
X-CSE-MsgGUID: JuQTEJQyTL2WWFiAJfz+qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36749473"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="36749473"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 12:10:00 -0800
X-CSE-ConnectionGUID: kNJT4tPUTaqqKBX6Zzf7Yw==
X-CSE-MsgGUID: a/7qBSk7RAWhXjcuoyflaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134736416"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Jan 2025 12:09:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWLKP-000Jho-1C;
	Fri, 10 Jan 2025 20:09:57 +0000
Date: Sat, 11 Jan 2025 04:09:18 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>
Subject: [peterz-queue:sched/core 44/45] build_policy.c:undefined reference
 to `__setparam_fair'
Message-ID: <202501110427.EB45CCCm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vincent,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   82563deef777b32ef169230d5cdf4e37ba9e9bde
commit: 12ef9ed8faba2301620ce093e2f5b5e3ca886ae0 [44/45] sched/fair: Encapsulate set custom slice in a __setparam_fair() function
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20250111/202501110427.EB45CCCm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110427.EB45CCCm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110427.EB45CCCm-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/sched/build_policy.o: in function `__sched_setscheduler':
>> build_policy.c:(.text+0x48e5): undefined reference to `__setparam_fair'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
