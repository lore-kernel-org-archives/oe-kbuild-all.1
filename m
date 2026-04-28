Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E65630B529
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Apr 2026 02:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777341806; cv=none; b=Cza19XpXpfDhsf+1CNLnHaBdeceIZzEqvn8xpDBuK1VHVVWJHFPGry7rmyuVQl0vBTumEPaxSmRAuxYMSqyIzOF4DB+iuFG0DfqgXpr78A2VRKSNLt+oRhYPodf85mI+2Rd9/tkFe38WV+weZXTjsFAjt+6yYUFpoVM27dozCuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777341806; c=relaxed/simple;
	bh=yZc2qa1InM6QGm5q5EuQRuuf4VR0Hb58rdn0g0ZKgt8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YXBS30F/VBOqjamTpQXqUffGTdpyI3G1gA1B4JQjMaYBSb4S+532FlrQaZMPwXa36Nia8XyEX055gtInJne6dJPVPK95AGKdEEStE5agNdXmhHtgR2NI/9kcM30xNZrRe8xIt6AtDGJ4qhiLV1z/J4CFAkYHKfjNCrlbD3LjV7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mHE+OAOX; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mHE+OAOX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777341802; x=1808877802;
  h=date:from:to:cc:subject:message-id;
  bh=yZc2qa1InM6QGm5q5EuQRuuf4VR0Hb58rdn0g0ZKgt8=;
  b=mHE+OAOXRh1FMcbaqgpWz4O+sxMrRsyS8lN1mRWO2hmk2DcArwzuZlBW
   zlEcVtMseCGpj38+TnupzG/jdc1YtMSHRHI5pSkr3szNVXsWtNSnvM2kB
   f5dhCNUJtDAaqLKK9410/IJiYPy2RlwQtfEsxuewZfu4K5DmpU+3bqc0c
   l05i3E+P7lwuYy0xs1luiS1bjrTIr1TNuolFcyLdQrwt2B47f4f/2dRTb
   ZPjY8tB2d2cMq15ooFiX0UJcqYbvAOPy+g4zgUOAN4AwIB9JYeTLwhwAx
   ZI/MEWdmWj9HMjIFjXmXsKfc4bBvRpG+uH6yEpGwargOLvZpsNgP2loi+
   A==;
X-CSE-ConnectionGUID: RqXM3C6JQwGr9EdlZgivhw==
X-CSE-MsgGUID: e3vt2zujT3OH5G1D43INMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78305079"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="78305079"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 19:03:21 -0700
X-CSE-ConnectionGUID: /zuP0ImmRbO58BshpJgx4w==
X-CSE-MsgGUID: 08vcGo7hQlqw4cVQenneVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="229246558"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Apr 2026 19:03:19 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHXnA-000000009Ou-477L;
	Tue, 28 Apr 2026 02:03:16 +0000
Date: Tue, 28 Apr 2026 10:02:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 3/3] fs/kernfs/dir.c:481:
 warning: Function parameter or struct member 'drop_supers' not described in
 'kernfs_drain'
Message-ID: <202604280923.1wyk0jkC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c0e06fe2fe2382104e8fc0af29079c3f5c0087ed
commit: b34d8a3a3a256046c35ed5a28173fe0686d34460 [3/3] UPSTREAM: kernfs: Send IN_DELETE_SELF and IN_IGNORED
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260428/202604280923.1wyk0jkC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260428/202604280923.1wyk0jkC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604280923.1wyk0jkC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/kernfs/dir.c:481: warning: Function parameter or struct member 'drop_supers' not described in 'kernfs_drain'


vim +481 fs/kernfs/dir.c

fd7b9f7b9776b1 Tejun Heo    2013-11-28  469  
fd7b9f7b9776b1 Tejun Heo    2013-11-28  470  /**
81c173cb5e87fb Tejun Heo    2014-02-03  471   * kernfs_drain - drain kernfs_node
81c173cb5e87fb Tejun Heo    2014-02-03  472   * @kn: kernfs_node to drain
fd7b9f7b9776b1 Tejun Heo    2013-11-28  473   *
24b3e3dd9c9c74 Randy Dunlap 2022-11-11  474   * Drain existing usages and nuke all existing mmaps of @kn.  Multiple
81c173cb5e87fb Tejun Heo    2014-02-03  475   * removers may invoke this function concurrently on @kn and all will
81c173cb5e87fb Tejun Heo    2014-02-03  476   * return after draining is complete.
fd7b9f7b9776b1 Tejun Heo    2013-11-28  477   */
b34d8a3a3a2560 T.J. Mercier 2026-02-25  478  static void kernfs_drain(struct kernfs_node *kn, bool drop_supers)
393c3714081a53 Minchan Kim  2021-11-18  479  	__releases(&kernfs_root(kn)->kernfs_rwsem)
393c3714081a53 Minchan Kim  2021-11-18  480  	__acquires(&kernfs_root(kn)->kernfs_rwsem)
fd7b9f7b9776b1 Tejun Heo    2013-11-28 @481  {
abd54f028ec309 Tejun Heo    2014-02-03  482  	struct kernfs_root *root = kernfs_root(kn);
fd7b9f7b9776b1 Tejun Heo    2013-11-28  483  
393c3714081a53 Minchan Kim  2021-11-18  484  	lockdep_assert_held_write(&root->kernfs_rwsem);
81c173cb5e87fb Tejun Heo    2014-02-03  485  	WARN_ON_ONCE(kernfs_active(kn));
abd54f028ec309 Tejun Heo    2014-02-03  486  
2d7f9f8c181570 Tejun Heo    2022-08-27  487  	/*
2d7f9f8c181570 Tejun Heo    2022-08-27  488  	 * Skip draining if already fully drained. This avoids draining and its
2d7f9f8c181570 Tejun Heo    2022-08-27  489  	 * lockdep annotations for nodes which have never been activated
2d7f9f8c181570 Tejun Heo    2022-08-27  490  	 * allowing embedding kernfs_remove() in create error paths without
2d7f9f8c181570 Tejun Heo    2022-08-27  491  	 * worrying about draining.
2d7f9f8c181570 Tejun Heo    2022-08-27  492  	 */
2d7f9f8c181570 Tejun Heo    2022-08-27  493  	if (atomic_read(&kn->active) == KN_DEACTIVATED_BIAS &&
2d7f9f8c181570 Tejun Heo    2022-08-27  494  	    !kernfs_should_drain_open_files(kn))
2d7f9f8c181570 Tejun Heo    2022-08-27  495  		return;
2d7f9f8c181570 Tejun Heo    2022-08-27  496  
393c3714081a53 Minchan Kim  2021-11-18  497  	up_write(&root->kernfs_rwsem);
b34d8a3a3a2560 T.J. Mercier 2026-02-25  498  	if (drop_supers)
b34d8a3a3a2560 T.J. Mercier 2026-02-25  499  		up_read(&root->kernfs_supers_rwsem);
35beab0635f3cd Tejun Heo    2014-02-03  500  
182fd64b663422 Tejun Heo    2014-02-03  501  	if (kernfs_lockdep(kn)) {
35beab0635f3cd Tejun Heo    2014-02-03  502  		rwsem_acquire(&kn->dep_map, 0, 0, _RET_IP_);
35beab0635f3cd Tejun Heo    2014-02-03  503  		if (atomic_read(&kn->active) != KN_DEACTIVATED_BIAS)
324a56e16e44ba Tejun Heo    2013-12-11  504  			lock_contended(&kn->dep_map, _RET_IP_);
35beab0635f3cd Tejun Heo    2014-02-03  505  	}
abd54f028ec309 Tejun Heo    2014-02-03  506  
abd54f028ec309 Tejun Heo    2014-02-03  507  	wait_event(root->deactivate_waitq,
abd54f028ec309 Tejun Heo    2014-02-03  508  		   atomic_read(&kn->active) == KN_DEACTIVATED_BIAS);
fd7b9f7b9776b1 Tejun Heo    2013-11-28  509  
182fd64b663422 Tejun Heo    2014-02-03  510  	if (kernfs_lockdep(kn)) {
324a56e16e44ba Tejun Heo    2013-12-11  511  		lock_acquired(&kn->dep_map, _RET_IP_);
5facae4f3549b5 Qian Cai     2019-09-19  512  		rwsem_release(&kn->dep_map, _RET_IP_);
fd7b9f7b9776b1 Tejun Heo    2013-11-28  513  	}
35beab0635f3cd Tejun Heo    2014-02-03  514  
bdb2fd7fc56e19 Tejun Heo    2022-08-27  515  	if (kernfs_should_drain_open_files(kn))
0e67db2f9fe919 Tejun Heo    2016-12-27  516  		kernfs_drain_open_files(kn);
ccf02aaf8167bb Tejun Heo    2014-02-03  517  
b34d8a3a3a2560 T.J. Mercier 2026-02-25  518  	if (drop_supers)
b34d8a3a3a2560 T.J. Mercier 2026-02-25  519  		down_read(&root->kernfs_supers_rwsem);
393c3714081a53 Minchan Kim  2021-11-18  520  	down_write(&root->kernfs_rwsem);
a6607930b6cd82 Tejun Heo    2014-02-03  521  }
fd7b9f7b9776b1 Tejun Heo    2013-11-28  522  

:::::: The code at line 481 was first introduced by commit
:::::: fd7b9f7b9776b11df629e9dd3865320bf57ce588 sysfs, kernfs: move dir core code to fs/kernfs/dir.c

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
