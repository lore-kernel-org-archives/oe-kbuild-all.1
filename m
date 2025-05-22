Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E508E73477
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 10:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747908995; cv=none; b=V+dWhec3PVKpSY5HNNaiTT3rx62s6Z4d5iuLZLSJ4AumHHxKKB20pjm3x4/naLaJSMfxh72VF4WvEXpVJVZ8bTT44ysLv7iuHQsoGt2nlLjcHkPbbUHMGI96CwKeBAcmqs7409iLWWNBllNp1Q3ma4A0m0q9l0mt0ZjjH4ndUVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747908995; c=relaxed/simple;
	bh=lHCZYUvSaKJUE3D/xI/ja6g2dwYsIInnz9ujIe6XbYA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uoL+0hIgBwEz0y8BBDUSEnJo0vR7cEtPnIuZLOSHY/4HcdhhJyZcWVV3ju6sD9uplabHQTty48Tv4ic8s5x3h8fB+9hdZx5+3IZr2ZyS0hLc3PGeKzWPZWz3zQxkMTcxJqUyEvEZ45G7qDREU9rAgRdSZuELnJdzyo/ij4W1Os8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=boZ1h8X6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="boZ1h8X6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747908992; x=1779444992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lHCZYUvSaKJUE3D/xI/ja6g2dwYsIInnz9ujIe6XbYA=;
  b=boZ1h8X6qHRqPGNVJbpvaUJy39aMnC7hqG2ZZWCE1263YjfaKV28LtIR
   iL99aUo84H97np8lrl7VSQnxVocwfPPjSxbU82d3/qBI1Zn//biPRTGWM
   ES3pGZo31nl5aLDfQqd7RiO4YmCKJuIPh7jvo8+C+AkwOXAYSHK+i8Ip0
   gBCFwO381xg9/uILE30Azk+3zBnkbWLjqhj2ssH3Tz7Zxr73wxOMdwkgQ
   2nP4rQOaWlkfPrPnmekoJ2dXbQQ1xiO5sj8QC8KzhNSGjwS03czaaPp9r
   GmsM7XuMCvXUkFtaqkcfbpfdAYMf+PtLFEWJ6UUsv2yUXZsKMLhbXv3aO
   A==;
X-CSE-ConnectionGUID: v6ZxHmBUQq+eFBmOZ0ck+Q==
X-CSE-MsgGUID: 3TZdPiiNS2uJ1TN3zQ7e3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60167657"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="60167657"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 03:16:32 -0700
X-CSE-ConnectionGUID: NKuA3txYSJmG+3eTCCivcw==
X-CSE-MsgGUID: fcq9ob9PQn6kS87ImwR1fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="145679878"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 May 2025 03:16:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI2yT-000PDa-0i;
	Thu, 22 May 2025 10:16:29 +0000
Date: Thu, 22 May 2025 18:15:57 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 11/11] fs/jbd2/journal.c:1529:6:
 warning: no previous prototype for function 'jbd2_proxy_exec_get'
Message-ID: <202505221832.qw5wtL1C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   8c0e5d113e2a8ff250d4973be89da61edcab22d5
commit: e93dbf3bd481cf9c55d08073d8b0865cf274707c [11/11] anolis: sched: introduce simplified proxy execution for jbd2_lock
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250522/202505221832.qw5wtL1C-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221832.qw5wtL1C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221832.qw5wtL1C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/jbd2/journal.c:1529:6: warning: no previous prototype for function 'jbd2_proxy_exec_get' [-Wmissing-prototypes]
    1529 | void jbd2_proxy_exec_get(journal_t *journal)
         |      ^
   fs/jbd2/journal.c:1529:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1529 | void jbd2_proxy_exec_get(journal_t *journal)
         | ^
         | static 
   1 warning generated.


vim +/jbd2_proxy_exec_get +1529 fs/jbd2/journal.c

  1524	
  1525	/*
  1526	 * When we enable proxy exec for journal, we call jbd2_proxy_exec_get().
  1527	 * If we are the first one to enable, we'll also enable __jbd2_proxy_exec_enabled.
  1528	 */
> 1529	void jbd2_proxy_exec_get(journal_t *journal)
  1530	{
  1531		atomic_inc(&journal->proxy_exec_refcount);
  1532	
  1533		if (atomic_inc_not_zero(&jbd2_proxy_exec_count))
  1534			return;
  1535	
  1536		mutex_lock(&jbd2_proxy_exec_mutex);
  1537		if (!atomic_read(&jbd2_proxy_exec_count))
  1538			static_branch_enable(&__jbd2_proxy_exec_enabled);
  1539	
  1540		/* Ensure the static branch is enabled before we increase jbd2_proxy_exec_count. */
  1541		smp_mb__before_atomic();
  1542		atomic_inc(&jbd2_proxy_exec_count);
  1543		mutex_unlock(&jbd2_proxy_exec_mutex);
  1544	}
  1545	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
