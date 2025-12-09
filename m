Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A444A2FFFB7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 20:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765313530; cv=none; b=LnmRj3ox6nzuC1KCpNWE1dSkB0kx7k7U1UGoS1K9tAx6UqUTxPB+kDCNc3KWv66jWmoAmHLqHuDk1qu4PMAkyhUsVxqBrmhzebERmvM2a+c2MaIEyPwWw03zsYQMWAGlkcxklc1KGhSLlTFaALvYl1pGGNNtgFk6efmh9tUZI6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765313530; c=relaxed/simple;
	bh=BG4T2rntRba/uuo1M5HQ2jn1LfnE7BdYd8PAlYuMNrw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ADVAmra500CqbcB+W7VxUASoPoOz6lviqVjmJqSlMmZp4iUzxvMsa35RsxsEkgs/UBppxsgtBWtJKcVq4xgbH78EGMeciDK/EmGIyI/5flwxX1UFUtGW4kfoZd0gu6nyZkz7jzfoFnxLCsP9jRwwY7if5gafBZKgU1T/DpxJw+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hTqYdhHZ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hTqYdhHZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765313528; x=1796849528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BG4T2rntRba/uuo1M5HQ2jn1LfnE7BdYd8PAlYuMNrw=;
  b=hTqYdhHZWj+rgHk3HZfgA+I/nRtd/KidLRWPdhs09D0e8/zh3a/1eF2y
   Zf3z3pU0QsnDnh2y4FeolppBte7HuK8qXbjLJwkwJ/59DwLDKT5ruLRTa
   F3hBxWLUfhBJOeKxK0X58kllSsomHdIyI2jjP3QVdL5IQusXE9+zOSnu5
   hfVhN5E7BZnraF9nvBbrvEXCsq95PAddCJ/VDIv8pgibGAUuEhkkiTBJb
   5BIBnfez+qUa+0gWHW2L+HHBpp9oVLDOVU8VSLsoz7Zu5mn8WCMQebWhb
   5oOZzwSz+EMSQxEB5BgsNNsK4AAjrAIYIf5OyYkljpNCv0TKQvf84IIWF
   A==;
X-CSE-ConnectionGUID: lmnZIZQMTsmGH2VSCZ6NyQ==
X-CSE-MsgGUID: FppJn3nHSCKjwQVSnp2FPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67448405"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="67448405"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 12:52:08 -0800
X-CSE-ConnectionGUID: wboJMv9gTkCEvcoLlpPJFg==
X-CSE-MsgGUID: 1eJYVVR3TQSbb3TI1rrfPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="196237216"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Dec 2025 12:52:07 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT4gn-000000002F8-0Xp6;
	Tue, 09 Dec 2025 20:52:05 +0000
Date: Wed, 10 Dec 2025 04:51:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev 26/28] ERROR: modpost:
 "synchronize_rcu_trivial_preempt" [kernel/rcu/rcutorture.ko] undefined!
Message-ID: <202512100414.kBXGXqFk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev
head:   9776d62e236bef99859e9067f540aa6f6683b432
commit: c8afe1ef55afc0eab8eef3eba2a4cd62d88e8bdb [26/28] rcutorture: Add a textbook-style trivial preemptible RCU
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251210/202512100414.kBXGXqFk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512100414.kBXGXqFk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512100414.kBXGXqFk-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "synchronize_rcu_trivial_preempt" [kernel/rcu/rcutorture.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
