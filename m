Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244882500B7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Nov 2024 16:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732464338; cv=none; b=IjFjzToLtT+oBFHT2ggjKLz1AMLMrc4V/qb79QAuIGQUTflO+qhkp/tW7nYe+Ex+IfIiSeGFb/VLzLEuyRawbooBn7Np/LpqErhcGQgnfmc+MXTYhtATK8h7LWD60PY7HaRKbA6rJjot3ohb9TAg9aP5hq9jChr68SCCAdWcHs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732464338; c=relaxed/simple;
	bh=qtQsA2QGg21baIG0Rkj9l9pJvdzRLQ3M5WLWovSeYlw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eihhdhXT8AY1L1SMSNSI6kINj+7DZzxELkbBWuypDW5NzkZ6WC57MnqMmTpwhChQF1G3lZ/b6UzTrXzTgwgIz67lVmRx9rLJhCTqrM/sxeexAHLhuajcDxgELzqzLLn0cnqiNxxQQ1iGiQlRANuXZtmS9UsKDeFZsk6l6maL9ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wb+qPqZ9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wb+qPqZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732464338; x=1764000338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qtQsA2QGg21baIG0Rkj9l9pJvdzRLQ3M5WLWovSeYlw=;
  b=Wb+qPqZ96GDUJTCzHmkZeEPyTVCeMsrdEuciIlliL35RZ/vmT+JdNsmI
   4Ou5wLIkdEe6fa+1mKz3+uVv2mmeBu9uq5sL04+0g+MgvIGmrHNMRhosu
   QLTykFS8ey526+5DDnHbsh2/d46QDNn4ovPM1CNFnVoxdnYIpfnu6tMX2
   EO/6zwy2mERFav4Hsm88wV04frWSc6hleoSaDLcC/GK5GC70n0sv7esUQ
   UmbWNUuxgF52iTiCotis/qf7ia14oYDmDXVs1omvJLLFdD74Rra7oLV/l
   mBAbhSaB+6Mk6cD43VBNvD7FBgPkpzM2PHte15M0CXn8XKS29KWOvbwvi
   g==;
X-CSE-ConnectionGUID: 5BVOhCQbSgeSbnu2Y7uQwA==
X-CSE-MsgGUID: qJ0rnGw1Reyu++e+JLs66w==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="32721787"
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="32721787"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 08:05:37 -0800
X-CSE-ConnectionGUID: Uk4h0ZAmQRqFCgAlP9mM3w==
X-CSE-MsgGUID: UNiMgMO+R4KvuWlGd5Sqxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="95810390"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Nov 2024 08:05:35 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFF77-00055E-0h;
	Sun, 24 Nov 2024 16:05:33 +0000
Date: Mon, 25 Nov 2024 00:05:00 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.cred 17/27] fs/open.c:405:28: warning: unused
 variable 'old_cred'
Message-ID: <202411250002.Dv9nSuQd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.cred
head:   eaee4c1ebd9bef7809c4f4a6d23206278d1719c1
commit: ff4785391d063fc4dc1d87152f6c686a6673b678 [17/27] open: avoid pointless cred reference count bump
config: sh-dreamcast_defconfig (https://download.01.org/0day-ci/archive/20241125/202411250002.Dv9nSuQd-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411250002.Dv9nSuQd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411250002.Dv9nSuQd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/open.c: In function 'access_override_creds':
>> fs/open.c:405:28: warning: unused variable 'old_cred' [-Wunused-variable]
     405 |         const struct cred *old_cred;
         |                            ^~~~~~~~


vim +/old_cred +405 fs/open.c

981ee95cc1f590 Mateusz Guzik     2023-01-25  402  
9470451505efbc Miklos Szeredi    2020-05-14  403  static const struct cred *access_override_creds(void)
^1da177e4c3f41 Linus Torvalds    2005-04-16  404  {
d84f4f992cbd76 David Howells     2008-11-14 @405  	const struct cred *old_cred;
d84f4f992cbd76 David Howells     2008-11-14  406  	struct cred *override_cred;
^1da177e4c3f41 Linus Torvalds    2005-04-16  407  
d84f4f992cbd76 David Howells     2008-11-14  408  	override_cred = prepare_creds();
d84f4f992cbd76 David Howells     2008-11-14  409  	if (!override_cred)
9470451505efbc Miklos Szeredi    2020-05-14  410  		return NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  411  
981ee95cc1f590 Mateusz Guzik     2023-01-25  412  	/*
981ee95cc1f590 Mateusz Guzik     2023-01-25  413  	 * XXX access_need_override_creds performs checks in hopes of skipping
981ee95cc1f590 Mateusz Guzik     2023-01-25  414  	 * this work. Make sure it stays in sync if making any changes in this
981ee95cc1f590 Mateusz Guzik     2023-01-25  415  	 * routine.
981ee95cc1f590 Mateusz Guzik     2023-01-25  416  	 */
981ee95cc1f590 Mateusz Guzik     2023-01-25  417  
d84f4f992cbd76 David Howells     2008-11-14  418  	override_cred->fsuid = override_cred->uid;
d84f4f992cbd76 David Howells     2008-11-14  419  	override_cred->fsgid = override_cred->gid;
^1da177e4c3f41 Linus Torvalds    2005-04-16  420  
086f7316f0d400 Andrew G. Morgan  2008-07-04  421  	if (!issecure(SECURE_NO_SETUID_FIXUP)) {
1cdcbec1a3372c David Howells     2008-11-14  422  		/* Clear the capabilities if we switch to a non-root user */
18815a18085364 Eric W. Biederman 2012-02-07  423  		kuid_t root_uid = make_kuid(override_cred->user_ns, 0);
18815a18085364 Eric W. Biederman 2012-02-07  424  		if (!uid_eq(override_cred->uid, root_uid))
d84f4f992cbd76 David Howells     2008-11-14  425  			cap_clear(override_cred->cap_effective);
^1da177e4c3f41 Linus Torvalds    2005-04-16  426  		else
d84f4f992cbd76 David Howells     2008-11-14  427  			override_cred->cap_effective =
d84f4f992cbd76 David Howells     2008-11-14  428  				override_cred->cap_permitted;
086f7316f0d400 Andrew G. Morgan  2008-07-04  429  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  430  
d7852fbd0f0423 Linus Torvalds    2019-07-11  431  	/*
d7852fbd0f0423 Linus Torvalds    2019-07-11  432  	 * The new set of credentials can *only* be used in
d7852fbd0f0423 Linus Torvalds    2019-07-11  433  	 * task-synchronous circumstances, and does not need
d7852fbd0f0423 Linus Torvalds    2019-07-11  434  	 * RCU freeing, unless somebody then takes a separate
d7852fbd0f0423 Linus Torvalds    2019-07-11  435  	 * reference to it.
d7852fbd0f0423 Linus Torvalds    2019-07-11  436  	 *
d7852fbd0f0423 Linus Torvalds    2019-07-11  437  	 * NOTE! This is _only_ true because this credential
d7852fbd0f0423 Linus Torvalds    2019-07-11  438  	 * is used purely for override_creds() that installs
d7852fbd0f0423 Linus Torvalds    2019-07-11  439  	 * it as the subjective cred. Other threads will be
d7852fbd0f0423 Linus Torvalds    2019-07-11  440  	 * accessing ->real_cred, not the subjective cred.
d7852fbd0f0423 Linus Torvalds    2019-07-11  441  	 *
d7852fbd0f0423 Linus Torvalds    2019-07-11  442  	 * If somebody _does_ make a copy of this (using the
d7852fbd0f0423 Linus Torvalds    2019-07-11  443  	 * 'get_current_cred()' function), that will clear the
d7852fbd0f0423 Linus Torvalds    2019-07-11  444  	 * non_rcu field, because now that other user may be
d7852fbd0f0423 Linus Torvalds    2019-07-11  445  	 * expecting RCU freeing. But normal thread-synchronous
d218569004b6f8 Bagas Sanjaya     2023-10-31  446  	 * cred accesses will keep things non-racy to avoid RCU
d218569004b6f8 Bagas Sanjaya     2023-10-31  447  	 * freeing.
d7852fbd0f0423 Linus Torvalds    2019-07-11  448  	 */
d7852fbd0f0423 Linus Torvalds    2019-07-11  449  	override_cred->non_rcu = 1;
ff4785391d063f Christian Brauner 2024-11-24  450  	return override_creds(override_cred);
9470451505efbc Miklos Szeredi    2020-05-14  451  }
9470451505efbc Miklos Szeredi    2020-05-14  452  

:::::: The code at line 405 was first introduced by commit
:::::: d84f4f992cbd76e8f39c488cf0c5d123843923b1 CRED: Inaugurate COW credentials

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: James Morris <jmorris@namei.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
