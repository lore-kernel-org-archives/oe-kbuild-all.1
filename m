Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E33322C8A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 12:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757419739; cv=none; b=NfxOZaOMJRGVlXHD/2eH26VIyIip/EXJrN8jf+DKmp6oH+cgocWmS/fD7PGDsHjyGujUKfjFFd1HeICn0Vni+SvGScUnLoBJ4Bu97BN0mVyJoW02sT2adl/fbZ6JbbwgIAmOrtmnujqgNhADFtQICKpvjCpjQhCYis3WgxcTUdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757419739; c=relaxed/simple;
	bh=FXgAMa4exZLe/n7RCZHxEBtCaLpdTjO3imYa9gTIlqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tl9Ib+gsvyzldvFWc7Eu7TrjqFasGJ1amdMvnZ3VxjQR0zOP7tSWKxxKud5Pk5NRX35kJtD0qIc9bmUOSQLHQ5mx64TlSLKxeIB7oLTT8AxS3hSG4ZttHbrxqwJZwBblzHNuGw9MhwJTsi0DrPJypnNV7CopPhFogT/fxUSa/nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lAbkIHMp; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lAbkIHMp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757419737; x=1788955737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FXgAMa4exZLe/n7RCZHxEBtCaLpdTjO3imYa9gTIlqo=;
  b=lAbkIHMpcTdAUk9tVC/Z8TSvKJ8k5q9t7tL3PRYW8mu2zy3ZuhcqKZm8
   CxJSZrd0Zt3j1RhGvPUQ68eJUCkqBD4ycSu8a3gHTF1P6mPyET/m22z9o
   fb07AXX2wHKjg128wm/b2yQa4C8gD8zUI5ERzfGIWhOvMx5wWxZ7XAbRi
   3/MNGxEifoTe3Lp5sY2B0O5k/vGQK8nyGe1oI+e+JiR3B9pnhKwL4qRP7
   YJ2ehnDa/3+FVwxY8NtqdSIzkxI5cjDjeEWTgxkk86azGFyB1fzfNHtxa
   RyFh1DFQUc9dx8Rx8W1pCG2UJwkhFrdAhO8006O5wn1ZG2m6OHZ3EmHRa
   Q==;
X-CSE-ConnectionGUID: UVFxrc70Rg6FTTwruBoggw==
X-CSE-MsgGUID: aCl/WTc6Sc2HKfeFmnARfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="70396702"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="70396702"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 05:08:56 -0700
X-CSE-ConnectionGUID: RQ402RsNQzeiMgzfO1SG/g==
X-CSE-MsgGUID: fTvef/m0STethjLciPbQJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="172238227"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Sep 2025 05:08:55 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvx9Y-0004pD-2c;
	Tue, 09 Sep 2025 12:08:52 +0000
Date: Tue, 9 Sep 2025 20:08:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-08 1/1] mm/workingset.c:210:6:
 warning: no previous prototype for 'unpack_shadow'
Message-ID: <202509092059.O33dfcQY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-08
head:   e5ca12a6dfac2997e107a215c8858781eb5177b7
commit: 4a1bc937ccaba9f3623e72baf8b33c3b63bf2a22 [1/1] ANDROID: mm: export unpack_shadow
config: i386-randconfig-r111-20250909 (https://download.01.org/0day-ci/archive/20250909/202509092059.O33dfcQY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509092059.O33dfcQY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509092059.O33dfcQY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/workingset.c:210:6: warning: no previous prototype for 'unpack_shadow' [-Wmissing-prototypes]
     210 | void unpack_shadow(void *shadow, int *memcgidp, pg_data_t **pgdat,
         |      ^~~~~~~~~~~~~


vim +/unpack_shadow +210 mm/workingset.c

   209	
 > 210	void unpack_shadow(void *shadow, int *memcgidp, pg_data_t **pgdat,
   211				  unsigned long *evictionp, bool *workingsetp)
   212	{
   213		unsigned long entry = xa_to_value(shadow);
   214		int memcgid, nid;
   215		bool workingset;
   216	
   217		workingset = entry & ((1UL << WORKINGSET_SHIFT) - 1);
   218		entry >>= WORKINGSET_SHIFT;
   219		nid = entry & ((1UL << NODES_SHIFT) - 1);
   220		entry >>= NODES_SHIFT;
   221		memcgid = entry & ((1UL << MEM_CGROUP_ID_SHIFT) - 1);
   222		entry >>= MEM_CGROUP_ID_SHIFT;
   223	
   224		*memcgidp = memcgid;
   225		*pgdat = NODE_DATA(nid);
   226		*evictionp = entry;
   227		*workingsetp = workingset;
   228	}
   229	EXPORT_SYMBOL_GPL(unpack_shadow);
   230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
