Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BFB184
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 07:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733297868; cv=none; b=KyEFbFn3kJSP2ETNfnHbzPUvIo5B8PuTu7euObADLdP658lLGr+a1Z34cQXr1Fh8lDqBYkJp5Fd6SKPK5W5MyOuVH+lvVVZacdPlJ1euIObFcWoIw2AdkdeK/1Z4LHDI6MdOHUjwWsCNyYTXt6dqYpu4dB9yVdX0GyrQRga5PN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733297868; c=relaxed/simple;
	bh=3B+8G+kIJ/ToRwRUoLuHDZ3ivQQyrFSy1r8fOfPibqU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EMk9PQM1LcNzP7quoHlxC1XZq/a352ZQsH51vtNtqtUc7JYsYNxUMa6+leOejVwaewYZowT5DCkjsKYOgpUoBbfH0H1EJ4S1YciS4cCx3F7+9un1SDOnAq1lkILPcx2LToDsXO7YxN0DX4pu+MqEuFHZ0Wb0HUw3LgVQVf7UwZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oEiZa3ww; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oEiZa3ww"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733297867; x=1764833867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3B+8G+kIJ/ToRwRUoLuHDZ3ivQQyrFSy1r8fOfPibqU=;
  b=oEiZa3wwAfTg+2XGWOIQx56btnhNBPrkuzTyRwEyAMJQ05Uv7xeCI+CD
   /AbqbUnMAerADwtgGiInyjwlOe42NPUt/j8TQj2XyR75bF3WIkghIElqB
   2CObfSKZD37InqvWGX+yE1IVBdvvkirv+I7nLOhOaG6vgnuNHLpAsuiKB
   HMm7Xtn6Xt1o8HxwuaSjVz0PZQBAB7iSI11vy6TzaOKYZpiG1Z+Mkf+c9
   zeLZmAK8xMDwMZ2Hp/ASzJmLdjAZbYSsS+TbdQWQPdamZK//c5NiYaf5t
   NMuSQUfwamzkH7mLjGhdtXk/o75aFY9BSW/s7Wx+R0+QIi3GBBYk0ydJa
   w==;
X-CSE-ConnectionGUID: UZ7vaO8ISbSsYCrnOfUJEg==
X-CSE-MsgGUID: O6zAVORVQYuLDkvabSsAUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44027726"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44027726"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 23:37:46 -0800
X-CSE-ConnectionGUID: kLgTuVMqR92so6TFXwzXqg==
X-CSE-MsgGUID: p4bqXQ1GR+efbiL966zZNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="98488778"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 03 Dec 2024 23:37:44 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIjx8-0002iB-0g;
	Wed, 04 Dec 2024 07:37:42 +0000
Date: Wed, 4 Dec 2024 15:36:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/1]
 drivers/misc/uid_sys_stats.c:38:12: sparse: sparse: symbol 'uid_lock' was
 not declared. Should it be static?
Message-ID: <202412041557.2jyvt6y3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Neill,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   a9c2663f637f0f7668e4cb0dd065db13025b33fe
commit: 4a5826e549a3bd3bc3d81e19a1e2420f5f2070ef [1/1] Revert "ANDROID: disble the UID_SYS_STATS driver"
config: x86_64-randconfig-123 (https://download.01.org/0day-ci/archive/20241204/202412041557.2jyvt6y3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041557.2jyvt6y3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041557.2jyvt6y3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/misc/uid_sys_stats.c:38:12: sparse: sparse: symbol 'uid_lock' was not declared. Should it be static?

vim +/uid_lock +38 drivers/misc/uid_sys_stats.c

3669a3205af35a5 Neill Kapron 2023-05-08  31  
12788836b1f36ef Jin Qian     2015-03-11  32  #define UID_HASH_BITS	10
b6115e140102a29 Peifeng Li   2023-04-13  33  #define UID_HASH_NUMS	(1 << UID_HASH_BITS)
12788836b1f36ef Jin Qian     2015-03-11  34  DECLARE_HASHTABLE(hash_table, UID_HASH_BITS);
b6115e140102a29 Peifeng Li   2023-04-13  35  /*
b6115e140102a29 Peifeng Li   2023-04-13  36   * uid_lock[bkt] ensure consistency of hash_table[bkt]
b6115e140102a29 Peifeng Li   2023-04-13  37   */
b6115e140102a29 Peifeng Li   2023-04-13 @38  spinlock_t uid_lock[UID_HASH_NUMS];
12788836b1f36ef Jin Qian     2015-03-11  39  

:::::: The code at line 38 was first introduced by commit
:::::: b6115e140102a290143ec02a3a2b3d5aec506b3a ANDROID: uid_sys_stat: split the global lock uid_lock to the fine-grained locks for each hlist in hash_table.

:::::: TO: Peifeng Li <lipeifeng@oppo.com>
:::::: CC: Neill Kapron <nkapron@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
