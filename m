Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B58F23AD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Apr 2025 03:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744945314; cv=none; b=ipL9yXSZfLGhRQDCi0/AvIHBi2k+GBkcWom9VZLXRjuqZXk9RHKvhejNVtigNog0uIbo990o9qzlVufnA5f9VU6axGSngDu8wtnmrsFroYZ/F9T25zCwkKE+GVFpClKzavX3aJX/LtIxnmxKdSNoVcpBM40c8V4SLahPkpjpQ3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744945314; c=relaxed/simple;
	bh=t5xgiUfTo4Okl+DeZ5PMnh/Hog/7g9lymJbJfejwY+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FjdV2QnInUerXzVxBq8jQxE4sIk8Ew4GbTn4UHaxvgRylVfURiayTehvQliu6ZY+731QsPLDNTx9MZFqCy4rLMTKFrp//E0OlBBxPG+ymHfk9uOaB+d2/Wconk3WeuZe3zDjsLDLGYydJ6o5uWUinxvA8nCsxnzROPpaoptIBOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a36DKtk7; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a36DKtk7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744945312; x=1776481312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t5xgiUfTo4Okl+DeZ5PMnh/Hog/7g9lymJbJfejwY+Q=;
  b=a36DKtk7s6jZacX+0kJsPmypuHHQT2DSeiV1fAr+mvWpm9yrNPNNRkuC
   MU0eoYQJdIPB2mpAchtZjd+IplYKj4b6jhmlW/YnwyJzAhAOXNti19RT+
   qIvP0oeRWhwrsjUW2XuD5qehgqTbLNYqCyRSj6GV4YB/eeW9A8CYViGYa
   FnAkcxl5m54Ehso9HnQwjdXxsro7p+e0Xw7E4jRWCBWyHioJumBJfgYC+
   Vhe5I6GeMh+hHfo4iimu4zs4viAht8LCum5DWsfvT2ztwdy6f4JK7eoN4
   42Whb4VDRRSzCjaBibR7e13c25OYxVRt2LvN16equDRoyD/Yr7hLWLjSP
   A==;
X-CSE-ConnectionGUID: UZx5WDaDR36Mez94ZVujAA==
X-CSE-MsgGUID: D/qZDg28QbKqGQuK4Ki7Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="50404925"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="50404925"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 20:01:51 -0700
X-CSE-ConnectionGUID: H60h+bQoTsGVWVltlDSnUA==
X-CSE-MsgGUID: RlBE+YRNRGeXXqC4XG772g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="162050123"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Apr 2025 20:01:50 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5bz9-0002Pt-2l;
	Fri, 18 Apr 2025 03:01:47 +0000
Date: Fri, 18 Apr 2025 11:01:20 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 4/4] fs/jbd2/journal.c:1529:6:
 warning: no previous prototype for 'jbd2_proxy_exec_get'
Message-ID: <202504181024.tHso9v5K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   e93dbf3bd481cf9c55d08073d8b0865cf274707c
commit: e93dbf3bd481cf9c55d08073d8b0865cf274707c [4/4] anolis: sched: introduce simplified proxy execution for jbd2_lock
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250418/202504181024.tHso9v5K-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250418/202504181024.tHso9v5K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504181024.tHso9v5K-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/jbd2/journal.c:1529:6: warning: no previous prototype for 'jbd2_proxy_exec_get' [-Wmissing-prototypes]
    1529 | void jbd2_proxy_exec_get(journal_t *journal)
         |      ^~~~~~~~~~~~~~~~~~~


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
