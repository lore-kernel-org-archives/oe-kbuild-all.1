Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04CC17BA2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 May 2024 03:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716867119; cv=none; b=OpihQXTTH3RyXDXPw2fBQxEDS1suABhSOvF/uR5vLOksD2NIVxyL0Cp2b0vACVddDDeYLfq3aErhuO4k6Zj43qo99rdqWSmgxdJkYl5yYU6y8TDCEsDP/ZXIkMyfO/xHZH6FNTMnrVDQoTzIeqnRSEjnhyYFte2JrtkwePsLzXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716867119; c=relaxed/simple;
	bh=ja5o95YfR7y4Gd6eNhAe0sEpE7Gb0aGFf2n4VZiMaHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OhN/tMvyNSEPcYMYm8L9POvVVNZ/IiH5QceI1rR43ZrGdBq3HleO9iNZyVVO53bI/IWB0d3K9Q+WRh7es1sdvQovaAkMlT/pngGw9f5ICYOQMQNAtvAddap1Yfcar7iHE5jKizQsizTvmGEFAc9ZzHH6xpGsZVlCpz+xbhqKvmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aXAU/VqA; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aXAU/VqA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716867118; x=1748403118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ja5o95YfR7y4Gd6eNhAe0sEpE7Gb0aGFf2n4VZiMaHs=;
  b=aXAU/VqACB6GhS6RUEn/qtKEXD+cMtjh/s6m4CBVe8NBaC5/W+5vURTn
   WV7k8lZcVPQAgj4jr/3ejQM0gLaQJUW62mLKuTXv7nv/kqDfKt3rtjg5b
   55rTVEGVGYrZ4ALwMm6KS589xPTvH61MEpjY+6ZMvPw7xK3zqa3qAAAxU
   Yz9odcJHp7YAGCE8FBOwIxt0IYkNagfQt3a/pMWMUWEp8Bg/gfSIcM9rC
   DYcsHOlhmQzLoHoNCemO/F3vYhKyoOQQt8Zc6xZJb+2PYkmIDsiFvsdNs
   ozTjRRsRo+idGzFsKARCruQNRGVL1cZ6tdT5ayqy86Y6Wf3l6X94M/ETj
   Q==;
X-CSE-ConnectionGUID: yj9K7K+1QIqzlwXf+2XeTw==
X-CSE-MsgGUID: 0QdHpvdYQwSzFO7R8K79qw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="38572895"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="38572895"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 20:31:57 -0700
X-CSE-ConnectionGUID: IKk58jpQQyidMuI92JamQg==
X-CSE-MsgGUID: 2RNCz98CQ52xEc4r2TG2Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="34816514"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 27 May 2024 20:31:56 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBnZ4-000BQ7-07;
	Tue, 28 May 2024 03:31:54 +0000
Date: Tue, 28 May 2024 11:31:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgtime 4/5] fs/inode.c:70:17: error: unknown type name
 'u128'
Message-ID: <202405281107.NtHz6HqI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgtime
head:   05aa6b03b8c3451d4aac5fb47e9e99c6e00ee304
commit: 05ca0fa7e195e028694f41de279dec33ada93d21 [4/5] fs: add infrastructure for multigrain timestamps
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240528/202405281107.NtHz6HqI-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405281107.NtHz6HqI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405281107.NtHz6HqI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/inode.c:70:17: error: unknown type name 'u128'
      70 |                 u128    full;
         |                 ^~~~
   fs/inode.c: In function 'inode_set_ctime_current':
>> fs/inode.c:2605:26: error: void value not ignored as it ought to be
    2605 |                 cur.full = cmpxchg128(&ctime_floor.full, floor.full, new.full);
         |                          ^
   fs/inode.c:2593:45: warning: variable 'new' set but not used [-Wunused-but-set-variable]
    2593 |                 struct ctime_floor_val cur, new;
         |                                             ^~~


vim +/u128 +70 fs/inode.c

    62	
    63	/* Floor value for all ctime stamps */
    64	struct ctime_floor_val {
    65		union {
    66			struct {
    67				ktime_t	coarse;
    68				ktime_t	floor;
    69			};
  > 70			u128	full;
    71		};
    72	};
    73	static struct __cacheline_aligned_in_smp ctime_floor_val ctime_floor;
    74	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
