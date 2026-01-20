Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5567A2EFDBB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 05:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768887163; cv=none; b=qppdr0UCk3SqAnidvWwvyEHvWm+TeIk1F1dGkQMQbFNyVH3atKwptFp6L/p70p0QY1Yds7JlJm5rV0l7phEwRgT/YtvPb9E8rpZdub1rHhFEcadOuJiEX36EH3iTyVsZsFYx798okysh8MfiJPkgN10QYZJ6mDKGdbpWAPmg0kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768887163; c=relaxed/simple;
	bh=Qv5CtptDiIUKi0fw3b8JGmi/ObJ6DuXAQsO7RmP7DNg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nTj2iAKUt4cMqwqxbP639+zMVUHPGziOcOzIhCNDDMh+qO7XBdpo/xb+2Mcfv3epGuybUrwfpH7Vo6m2ev0nuZ5HLXB+o/DueZ0rez6YDoOGu+Cc83gpzDuzAZRaLPYQspJZ3GeYupfhXuY4Pjw0LWmFu58cIxYEgyiPNlAcmxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VbXUpkyq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VbXUpkyq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768887161; x=1800423161;
  h=date:from:to:cc:subject:message-id;
  bh=Qv5CtptDiIUKi0fw3b8JGmi/ObJ6DuXAQsO7RmP7DNg=;
  b=VbXUpkyqOePmB3KhrbNNHTWFOq5VWV9pvzbGmHSk+yD2HntTuuNlPZz6
   I/3eJ0iXNAStwKSmJAaoT7GJhgHv3wOGKFNKG00H/ABFhTZkG7PNK2RZK
   5tuG3GlS7aU0K4ampdznEOASWR9eE4+dJSdSnfqqzhzR1LZNgmTUkOryZ
   Wqh7krvYEqIKYQCsjUP7U4IQnjHOngLC2jOeNa1eXDHVk8j3x4Mi2UoP2
   sa67VWqbasDs61RggYrQHxgr+DtCD4VO8zPw2cShArvnJhMrdl0bqJeWV
   E0SPFR5jQSGkB/jReM2oUcgs01DPle+ee7wVU0zPleFPNc9GVz2rj5Xc3
   Q==;
X-CSE-ConnectionGUID: v18P6UkORpO+tef9zRE4Qw==
X-CSE-MsgGUID: BRA8TaiLS6qXMXH9/8ng1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73944421"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="73944421"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 21:32:40 -0800
X-CSE-ConnectionGUID: S7HTKvdpQ5ixP4bZJRk+pQ==
X-CSE-MsgGUID: c5XJGEJUS72pSchcb9uX8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="210162890"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Jan 2026 21:32:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi4M0-00000000Obd-0iIP;
	Tue, 20 Jan 2026 05:32:36 +0000
Date: Tue, 20 Jan 2026 13:31:42 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: [akpm-mm:mm-unstable 319/345] mm/balloon.c:19:33: warning:
 'balloon_page_device' defined but not used
Message-ID: <202601201338.4muFmFHV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   bd361423f30912263920dd83326dcf142c16ce31
commit: f100e6eee69ff5746c327bc88a7fa6f43dbdf92c [319/345] mm: rename balloon_compaction.(c|h) to balloon.(c|h)
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260120/202601201338.4muFmFHV-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201338.4muFmFHV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601201338.4muFmFHV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/balloon.c:19:33: warning: 'balloon_page_device' defined but not used [-Wunused-function]
      19 | static struct balloon_dev_info *balloon_page_device(struct page *page)
         |                                 ^~~~~~~~~~~~~~~~~~~


vim +/balloon_page_device +19 mm/balloon.c

50fe4326e833f0 mm/balloon_compaction.c David Hildenbrand (Red Hat  2026-01-20  18) 
ecc7c3359cb476 mm/balloon_compaction.c David Hildenbrand (Red Hat  2026-01-20 @19) static struct balloon_dev_info *balloon_page_device(struct page *page)
ecc7c3359cb476 mm/balloon_compaction.c David Hildenbrand (Red Hat  2026-01-20  20) {
ecc7c3359cb476 mm/balloon_compaction.c David Hildenbrand (Red Hat  2026-01-20  21) 	return (struct balloon_dev_info *)page_private(page);
ecc7c3359cb476 mm/balloon_compaction.c David Hildenbrand (Red Hat  2026-01-20  22) }
ecc7c3359cb476 mm/balloon_compaction.c David Hildenbrand (Red Hat  2026-01-20  23) 

:::::: The code at line 19 was first introduced by commit
:::::: ecc7c3359cb47658444833b09785c2ceb8459a78 mm/balloon_compaction: move internal helpers to balloon_compaction.c

:::::: TO: David Hildenbrand (Red Hat) <david@kernel.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
