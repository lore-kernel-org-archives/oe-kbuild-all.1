Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1810A3BB4A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 22:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765664499; cv=none; b=MbVSdZyIFQnf34t4+y/xKrbVD0yW8mML9j3GKfPiuNeOe2gy8XQtah7g303h5UFXf6x7o93lUuWUT0tqcXsbz6/GW+ppjK566vWhTTMn5dJo+jj+3NcGefypyjQr5WrFuh/Aam5nGFcumBCXsHvNqTLf5uI5eX+pNdu9BqsMeZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765664499; c=relaxed/simple;
	bh=1rkmLnnzLaIGbTi+x54WlO3ize1fINmungLN5vHxCOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IbVMhn0BhL7tfIhWnOZcbPCtAyxC+SKgf9ZKzMAbIE0hCZsz8SW2VKh7+VCbj5j7WvE6WDqRdela+Pk5/M2Z3mgq3glT+rAf5h6LLJM2AnDY8OfRbPK6uZSHyVbV/ZIJ3+7+TZEfA7G96ejABGyt245WzFaTfJRYhck94VrngTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g+QQL0Dx; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+QQL0Dx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765664498; x=1797200498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1rkmLnnzLaIGbTi+x54WlO3ize1fINmungLN5vHxCOY=;
  b=g+QQL0DxAhPGnI6Id+Y/a4SyrKx7Tp6PVhYaelw3+xm8h/EmXNnsdL6G
   KlR3pSelsQPNtsAFl+XaxbxG1g5m+jq7vO5hkBE1IUAu8zvOpPKecuAyy
   N4IMSuwM/Nihk/kIeLveJKsrp6/5Ys+IrIGY6MGz2VVVVsOCcfYXWH+dT
   eIjYDkvppADZzwYRW0QWB6aAI/jhJgBtks60XZXZIdozp09/bIDVJpPYx
   ECTsBdmXpogX0tp3+TRbmbeqkizGnRws+ehDJMNfG344j7JGX1mCFDkuO
   35HiRug+7pY/cIu81XrMFVGcgVVGHVfOJDARZQi8HzIBM+5GGCoIygQZ7
   A==;
X-CSE-ConnectionGUID: lEvJbjslQnSNLATfe/7gnw==
X-CSE-MsgGUID: tnUS0zA3RDetfFBenZGrOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="71480992"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="71480992"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 14:21:38 -0800
X-CSE-ConnectionGUID: VIhD1BLrR82yHjKmBkXFYQ==
X-CSE-MsgGUID: xCXAJ4B5SRqUn7TvEmy5MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="201887101"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 13 Dec 2025 14:21:37 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUXza-000000002CK-28Nh;
	Sat, 13 Dec 2025 22:21:34 +0000
Date: Sat, 13 Dec 2025 23:20:58 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 50/50] fs/jbd2/journal.c:1508:6:
 warning: no previous prototype for 'jbd2_proxy_exec_get'
Message-ID: <202512132342.TbUX2bvG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   7c285f40a964b427534f3dab33b104ee9cab6245
commit: abd67b878ec2ea7ac5446e95b7f27258eba37e41 [50/50] anolis: sched: introduce simplified proxy execution for jbd2_lock
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251213/202512132342.TbUX2bvG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132342.TbUX2bvG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132342.TbUX2bvG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/jbd2/journal.c:1508:6: warning: no previous prototype for 'jbd2_proxy_exec_get' [-Wmissing-prototypes]
    1508 | void jbd2_proxy_exec_get(journal_t *journal)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/jbd2_proxy_exec_get +1508 fs/jbd2/journal.c

  1503	
  1504	/*
  1505	 * When we enable proxy exec for journal, we call jbd2_proxy_exec_get().
  1506	 * If we are the first one to enable, we'll also enable __jbd2_proxy_exec_enabled.
  1507	 */
> 1508	void jbd2_proxy_exec_get(journal_t *journal)
  1509	{
  1510		atomic_inc(&journal->proxy_exec_refcount);
  1511	
  1512		if (atomic_inc_not_zero(&jbd2_proxy_exec_count))
  1513			return;
  1514	
  1515		mutex_lock(&jbd2_proxy_exec_mutex);
  1516		if (!atomic_read(&jbd2_proxy_exec_count))
  1517			static_branch_enable(&__jbd2_proxy_exec_enabled);
  1518	
  1519		/* Ensure the static branch is enabled before we increase jbd2_proxy_exec_count. */
  1520		smp_mb__before_atomic();
  1521		atomic_inc(&jbd2_proxy_exec_count);
  1522		mutex_unlock(&jbd2_proxy_exec_mutex);
  1523	}
  1524	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
