Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BC01F8ADA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 12:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737116920; cv=none; b=V9e70Bb7XHzIcuJoFq0uwo6zRRVpMbzszqxOKRCHNm8+9gOYSLjnDaMkzeeaDXl8GbO2jMju4kH+KMGn3YeKB9l0P/PJKf/+7kB0ZkW3po02SzydJCsE4L7yCEwLe4UH7TD2L33yyfakK2mitrS4k+eW8JRN7P/0TwpTK94mOVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737116920; c=relaxed/simple;
	bh=TGCqJ+mWG6WxDKDnfaZxer7CPbj195qU0tPU+NsFj2c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=knMrBkPGo9/ZOqXBKycJcv5uImD9zKq5w15Ukl3f3xfk2W4Wu5MZ5GDW1kdzmJVvuDD5o4aFuyP//FYDLqKhKBeCpt5rK8miWskTGJDErT9sWd4MHFiWcVZ3/2FWW7FJmNt4F3npIQ8OPoYtnTXT6MYNCucipEIeteKkwvINARI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddq7OuID; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddq7OuID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737116918; x=1768652918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TGCqJ+mWG6WxDKDnfaZxer7CPbj195qU0tPU+NsFj2c=;
  b=ddq7OuIDiagDjuD+ANt3YOacHA/xFN81plguxEUktoD/Xi0knJ45x8zv
   ZWJGDhGv8QJdMbM1fG4yWI/wnLJ637v8LNfLQHETFHvto57AXGZhzfLIn
   eWQQ7mCEWgVXRb92FJ7mSZDXTyw1VtCvAgyBdFp/Rnzgzer5+mTU9iGbm
   DyhpCad1Gjn301TMy9ybSi9D8tyty3ntR37USERlEBy9Y5O5cOxjqpt/p
   oxKSNU9VA9/7B9XcI9PV1pkg/YbbI9BaMrsuOnl4xunbpZEmKNhFvXYJG
   J5kH7l9FiVCBjmwOOqMOS0T3JM5/BjsHiJ6IndDfZe8K7R3PhZ+5Wtc+N
   g==;
X-CSE-ConnectionGUID: PpViajVKQXuEB0ZqRzaT6g==
X-CSE-MsgGUID: P+BbK3y8SVSAYsCvjKeElA==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37703583"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37703583"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 04:28:38 -0800
X-CSE-ConnectionGUID: smM2zdluRHSN35HZnIKg7w==
X-CSE-MsgGUID: er3O3LOCSeazv1nMygcf3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109854690"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Jan 2025 04:28:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYlSk-000TBr-1H;
	Fri, 17 Jan 2025 12:28:34 +0000
Date: Fri, 17 Jan 2025 20:27:31 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jeff Layton <jlayton@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Subject: [linux-next:master 642/9563] include/linux/cred.h:190:51: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202501172036.0qwOTbci-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0907e7fb35756464aa34c35d6abb02998418164b
commit: f905e00904cc5899c89897b93bebfcf6656f608e [642/9563] tree-wide: s/revert_creds()/put_cred(revert_creds_light())/g
config: x86_64-randconfig-121-20250116 (https://download.01.org/0day-ci/archive/20250117/202501172036.0qwOTbci-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501172036.0qwOTbci-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501172036.0qwOTbci-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/target/target_core_configfs.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   drivers/target/target_core_configfs.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   drivers/target/target_core_configfs.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
   include/linux/cred.h:182:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   include/linux/cred.h:182:41: sparse:     expected struct cred const *old
   include/linux/cred.h:182:41: sparse:     got struct cred const [noderef] __rcu *cred
>> include/linux/cred.h:190:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *override_cred @@     got struct cred const [noderef] __rcu *cred @@
   include/linux/cred.h:190:51: sparse:     expected struct cred const *override_cred
   include/linux/cred.h:190:51: sparse:     got struct cred const [noderef] __rcu *cred
   drivers/target/target_core_configfs.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +190 include/linux/cred.h

49dffdfde462c7 Vinicius Costa Gomes 2024-11-06  187  
95c54bc81791c2 Christian Brauner    2024-11-25  188  static inline const struct cred *revert_creds_light(const struct cred *revert_cred)
49dffdfde462c7 Vinicius Costa Gomes 2024-11-06  189  {
95c54bc81791c2 Christian Brauner    2024-11-25 @190  	const struct cred *override_cred = current->cred;
95c54bc81791c2 Christian Brauner    2024-11-25  191  
49dffdfde462c7 Vinicius Costa Gomes 2024-11-06  192  	rcu_assign_pointer(current->cred, revert_cred);
95c54bc81791c2 Christian Brauner    2024-11-25  193  	return override_cred;
49dffdfde462c7 Vinicius Costa Gomes 2024-11-06  194  }
49dffdfde462c7 Vinicius Costa Gomes 2024-11-06  195  

:::::: The code at line 190 was first introduced by commit
:::::: 95c54bc81791c210b131f2b1013942487e74896f cred: return old creds from revert_creds_light()

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
