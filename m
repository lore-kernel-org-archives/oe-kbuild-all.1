Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0605D331203
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 18:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786645140; cv=none; b=AIN365/5pX6413Wjg54faQT8RIlMd3Ut0sVdQET92MzKlEgxGxJr0i7NWhYk0vVC7xWLDqzwYk8etWAUne3UpJl+M3kaBNOcFJpIlJ0NDmFuBeVjxsmvNNtkSvxcmLIl0a8Qwg1Z0lQgkSjXpRrOFZ8+b6o7HVQvWcyo0b67dvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786645140; c=relaxed/simple;
	bh=LfmNs524CCL6umQbqrC3GGsG3bH+xWpP3Y4ISbposMU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mVPM1MbBeqbz55cx5vogRofrltt1lS0mhXH7ZwOAORUHeydjqxzusaWQJyRvjSidJM2Le+/CUTJLWvBUSaioIBhodwFmifx50tKxxAN3fIxt/QfkegiQa7baVAOUEvFPI/GSvvbuU9IkowXcxq2zckesuQsTp87/5WB/FrgNNhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZYDqsJ7S; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZYDqsJ7S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786645139; x=1818181139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LfmNs524CCL6umQbqrC3GGsG3bH+xWpP3Y4ISbposMU=;
  b=ZYDqsJ7SpPMSfnxZJwjZOsHOZxcZWV0UolyrTCWVOduFZgdMDu5AriKT
   swkrp3lj57Qqvnp7M4FybzxkCQmfE7T2W5aWVqrG1Po4zu74LvrCOnEIs
   lpCCa119JOmk8yNjErL2jYPwDr1AZHdawM4a1aT6VPelYIGfpfhe48egk
   yJ/P2I+iN/Uh+X84w79lPLg3WZNHZyFku2fwIxsXVBqI036vRzgzEYO0l
   3TF8debQAJWTWlHvAa+UEyzQ3blwfrUPVdP3crAdfAS5XASvZSdBk/g1e
   GMs/uRro/NHafyfqMK5zWOlfHiYARK36Vevhfa0jm3ey85duSUFC1BfFe
   g==;
X-CSE-ConnectionGUID: OeJ/EQoUTiGMEzW+dmw5Zw==
X-CSE-MsgGUID: 9uRksxYdRA63pTFWbQLb8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="91102125"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="91102125"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 11:18:56 -0700
X-CSE-ConnectionGUID: mMG9MlBxQzKKpnzm6WB63Q==
X-CSE-MsgGUID: C9RThVJfSrGCEdsu7rum2g==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Aug 2026 11:18:55 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wua0y-00000000WAk-2dBv;
	Thu, 13 Aug 2026 18:18:52 +0000
Date: Fri, 14 Aug 2026 02:18:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:m-4 143/145] kernel/locking/lockdep.c:65:27: warning:
 'lockdep_arena' defined but not used
Message-ID: <202608140205.wenSg6xq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git m-4
head:   0036927f87d51d733bf100cae4e407fa21a2c3a6
commit: 42d80a3bc4214d8c2da60cf229926307ce4d78a4 [143/145] include/linux/folio_arena.h: Add !CONFIG_DYNAMIC_DEBUG_CORE stubs
config: sparc-randconfig-r073-20260813 (https://download.01.org/0day-ci/archive/20260814/202608140205.wenSg6xq-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608140205.wenSg6xq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608140205.wenSg6xq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/locking/lockdep.c:65:27: warning: 'lockdep_arena' defined but not used [-Wunused-variable]
      65 | static struct folio_arena lockdep_arena =
         |                           ^~~~~~~~~~~~~


vim +/lockdep_arena +65 kernel/locking/lockdep.c

fbb9ce9530fd9b kernel/lockdep.c         Ingo Molnar 2006-07-03  64  
9bf38cbfe77419 kernel/locking/lockdep.c Jim Cromie  2026-08-11 @65  static struct folio_arena lockdep_arena =
9bf38cbfe77419 kernel/locking/lockdep.c Jim Cromie  2026-08-11  66  	FOLIO_ARENA_INIT(lockdep_arena, sizeof(struct lock_list), 4);
9bf38cbfe77419 kernel/locking/lockdep.c Jim Cromie  2026-08-11  67  

:::::: The code at line 65 was first introduced by commit
:::::: 9bf38cbfe7741920b9ff7383eb840f7a70254f2c locking/lockdep: Fallback to folio_arena in alloc_list_entry when static pool is full

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
