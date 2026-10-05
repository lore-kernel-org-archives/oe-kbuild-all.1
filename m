Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A64371041
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 22:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791237707; cv=none; b=q8+eho+GVekrgX3xgK4IpjJilUgEw4igpsgCOfnWy5qOFn61h2rlKC0MgR9c+abemZKdemRrN4F0m5fRSoy0Y5E3YHujLtNi0tlq60zeQ9zGVjWvlFL1GJNNLCmKqRKWuNXXjkrHJmWUzifnBzL8bvb4qo2rF/wUqM04A6Jr5aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791237707; c=relaxed/simple;
	bh=6snscvBkrlOsUMUZwXcdK4tfLe6169IMhjCw+m7Egog=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iwYDv3xnGtTVY2qGPOjZI96Ya4wOsw+vF4E1ljE4H7H3wz8tI2VYimSJx8HRPvjsRBefouhbUt/jnE9Ga0lpOrGrYhefj4VK0wcSqh8gqkQHhi7AkcrhJ6a3+2YgmaRLLTxpPut0ZBzpyO4rZ0fzHYDC6BUUsUjWdrZEi12In9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=acpS5M2Z; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acpS5M2Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791237706; x=1822773706;
  h=date:from:to:cc:subject:message-id;
  bh=6snscvBkrlOsUMUZwXcdK4tfLe6169IMhjCw+m7Egog=;
  b=acpS5M2Z/TQ+qVOArU7XQE39ZVN7TJeDe474ZTv9XXYSmz2UxzqP4EUJ
   tO+1obUwfNUsIjkYrk7WUpShvohIuv4g9wSO1IEuijxuRcyGSr3syxSXE
   KswTKN/9CvHNN6IIAYchfKOlgq54cOwXka10tAy1ZbJyHUiUy0booxw3D
   kx70JexG/U0Nw2jOT+eDy9EsEXzIibR02OBsfr2OGW58elfzeQV/Pka9z
   SB1shKVkZSibkyXhp3WezwliKKoOPZysDgPkPGX3S6l6vF5OaHzI58E4r
   LZLvGpxHzToxq26Va8eJhXqO/I4SYo8fJq5nouZ7Mu6WoT8/iLQCkRv/0
   A==;
X-CSE-ConnectionGUID: K2VDa7PJQxmvG3GP/VLlug==
X-CSE-MsgGUID: YcPePK4MSZC6ApPzLW44GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="108298061"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="108298061"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 15:01:45 -0700
X-CSE-ConnectionGUID: 4Zpf9KOVRqe1Uu6SirA+HA==
X-CSE-MsgGUID: micZM2xrSomgt5kZmhS7Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="277065577"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 05 Oct 2026 15:01:44 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDqkf-000000000Kp-3TS4;
	Mon, 05 Oct 2026 22:01:41 +0000
Date: Tue, 06 Oct 2026 00:00:44 +0200
From: kernel test robot <lkp@intel.com>
To: Benjamin Coddington <bcodding@hammerspace.com>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <cel@kernel.org>
Subject: [cel:nfsd-testing 295/295] fs/lockd/svcsubs.c:428:5-24:
 WARNING: atomic_dec_and_test variation before object free at line 429.
Message-ID: <202610052357.ZfzEOheQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   56589cdb58819ce54decedbbfddf231d94b5ce41
commit: 56589cdb58819ce54decedbbfddf231d94b5ce41 [295/295] lockd: make the nlm_file reference count atomic
config: x86_64-randconfig-2101-20261005 (https://download.01.org/0day-ci/archive/20261005/202610052357.ZfzEOheQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610052357.ZfzEOheQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/lockd/svcsubs.c:428:5-24: WARNING: atomic_dec_and_test variation before object free at line 429.

vim +428 fs/lockd/svcsubs.c

   408	
   409	/*
   410	 * Release file. If there are no more remote locks on this file,
   411	 * close it and free the handle.
   412	 *
   413	 * Note that we can't do proper reference counting without major
   414	 * contortions because the code in fs/locks.c creates, deletes and
   415	 * splits locks without notification. Our only way is to walk the
   416	 * entire lock list each time we remove a lock.
   417	 */
   418	void
   419	nlm_release_file(struct nlm_file *file)
   420	{
   421		dprintk("lockd: nlm_release_file(%p, ct = %d)\n",
   422					file, atomic_read(&file->f_count));
   423	
   424		/* Lock file table */
   425		mutex_lock(&nlm_file_mutex);
   426	
   427		/* If there are no more locks etc, delete the file */
 > 428		if (atomic_dec_and_test(&file->f_count) && !nlm_file_inuse(file))
 > 429			nlm_delete_file(file);
   430	
   431		mutex_unlock(&nlm_file_mutex);
   432	}
   433	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
