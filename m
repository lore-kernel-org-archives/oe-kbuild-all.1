Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA3E1FF1A1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 18:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754331030; cv=none; b=j7TXuThiJ4U4chda8svk5TSQEXFRN5B33vKMfM7ZY2gFwfglSyDmKkwvGpUqi5WpMyEcOtWK2hxKyXXEO0PlK1FX1OPmTvZYzXzaGSNj8vIYfzj85UOs4KOdGnZtGZB8Bg16yIWHWwEO5wvGKzJSjjvddGE55etqH7vPeQ2EJ4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754331030; c=relaxed/simple;
	bh=FAB+//jvolR8PNCCiS+fItBj6kQ2DNyuzu/ZP3S6VbM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UCv4HYowUAdEbK0mjH2BZuf1l2fKDWpSdZPYAqWn/HEf4i6ziWW5x7q4LGTuJpSd7a4Macggw5IY8WrqjYZeiNvAeQz/CgVxpNRRbncYlDpQy0HU0Mw9nTElti4rY4y/Ph40Wk1cyCaThJVPEvVWtToLJjzVsiAyOJ1reHUEyCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=neb5Kb1A; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="neb5Kb1A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754331029; x=1785867029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FAB+//jvolR8PNCCiS+fItBj6kQ2DNyuzu/ZP3S6VbM=;
  b=neb5Kb1AoN2d7KkULGY16GQfHOAKk/CYFYH6byKL8gQrYq/VB6bOZf++
   /kPYodqArGu7q1N+KyD8E7fLD3/yRnvjPslBkqGlB1YPyGJHflZkbr83b
   EMtVwDTL5Gk0q3LfpfXRXw7+SqqYEwSbbVReHXM22l1Ou69wmrxUhrHjg
   SQJQPO9cRAa+an+r53y/Kw06wFDsh9CSB5GwLjPozazAbEMFBU2nntbkR
   EZnj+DUYJQf7r83cTSGigCN751auKe8lPpAK/Ev/T7n4X04RzGgUOUvHR
   nBQBaHsv1nTqOUuKUuL22jd/WDdteOirHWJzak1j0fC8NhxZdw1UmXB8K
   g==;
X-CSE-ConnectionGUID: zrA35Mw3R82i+/md1CmmMw==
X-CSE-MsgGUID: 9PiiEZOuQouTLgrkWnY5UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="59220780"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="59220780"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 11:10:28 -0700
X-CSE-ConnectionGUID: THrQKq52RGa5Dxusvv/89w==
X-CSE-MsgGUID: AjSPrpgtTXuisguzHYP9aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164228110"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 04 Aug 2025 11:10:27 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uizdg-0001pP-2e;
	Mon, 04 Aug 2025 18:10:24 +0000
Date: Mon, 4 Aug 2025 20:09:36 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1743/1743]
 drivers/md/bcache/journal.c:320:6: warning: no previous prototype for
 'is_discard_enabled'
Message-ID: <202508042020.dTIoVoFF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ba07135cf74b1424e2f7f0c60e59c5b206ab320c
commit: 70e6748c08ab45df178269e4e3ae6da56c33af54 [1743/1743] bcache: fix failure in journal relplay
config: x86_64-buildonly-randconfig-2004-20250802 (https://download.01.org/0day-ci/archive/20250804/202508042020.dTIoVoFF-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508042020.dTIoVoFF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508042020.dTIoVoFF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/bcache/journal.c:320:6: warning: no previous prototype for 'is_discard_enabled' [-Wmissing-prototypes]
     320 | bool is_discard_enabled(struct cache_set *s)
         |      ^~~~~~~~~~~~~~~~~~


vim +/is_discard_enabled +320 drivers/md/bcache/journal.c

   319	
 > 320	bool is_discard_enabled(struct cache_set *s)
   321	{
   322		struct cache *ca;
   323		unsigned int i;
   324	
   325		for_each_cache(ca, s, i)
   326			if (ca->discard)
   327				return true;
   328	
   329		return false;
   330	}
   331	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
