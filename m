Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F7D4949F1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 23:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786576119; cv=none; b=cDjJKW8nzrNZzYVXqlfH2kq8uZ0iwuTpkAjq57BD3atj6Xuu92QoX5EuZqImkNICWz3/KjRLnVwMyPB/Ax627eqkLBhXUNUwXywPl6w2a/mTQnO3YRvvha9kNeHhm5YoyEvP6xe9FKikgMvtjmL697/r/YLUkDFk6bxhWZNgBuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786576119; c=relaxed/simple;
	bh=EPFPR/TtRmwBadnC3ywZMq/w6i8zwicbXP9/SNECr4s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iqdrpp/8whTbT+ZmhqhlnZlrSJhNfJVOaIx5FAvwyXz5dbL5VPobmO+fJbZvo32JBT03evNJQEp79bc6OfcES1bbKsMLoyERtHcPU9ujRu3FoFRt32Aionn+zWU8FDx8wiSfCZ+BN8qsfEfpkrViiverKmek7uxunIeKTouV984=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FLNW6QW/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FLNW6QW/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786576118; x=1818112118;
  h=date:from:to:cc:subject:message-id;
  bh=EPFPR/TtRmwBadnC3ywZMq/w6i8zwicbXP9/SNECr4s=;
  b=FLNW6QW/33TwVVWweADP5ZW/X41nW5NPxGy41jqYLI2MbXhrEbC9nd0I
   MgGT14+1z5KzUccWiLCHDAN/NdeiV5AusrnBwugMFIXx3BT+MzkiaGpSR
   rMs9H3mqhHRE1sovtBPEOVtGMaH09HZQAnCeewur1jxGM83VUi0SdHW4R
   7p3BZop2cukXFrcT0ytV97R8tgzx7SSHyzcvObftkk0OIZs8oruLkqQAO
   2+AwD4TBy69i5y+MH+SYqizcqTmcFRwGZQ4+S6qEESaxs2ydCXR1FkpZv
   pPpspk7nLM81i9dk7CZykKb2cQF1/8Qt8yEkBY6QzFAPJhS9xBLB6Sylz
   g==;
X-CSE-ConnectionGUID: BMf1Hq/CTNiacoB8K08epQ==
X-CSE-MsgGUID: 2oT0XZ7LSvqPXhK0JTrHrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="109933863"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="109933863"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 16:08:37 -0700
X-CSE-ConnectionGUID: ZSTludncRX+4OSDnLu7amg==
X-CSE-MsgGUID: jXTXgXqyRAGpSrtig35tqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="287228075"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Aug 2026 16:07:09 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuI2M-00000000S1Q-3LU9;
	Wed, 12 Aug 2026 23:07:06 +0000
Date: Thu, 13 Aug 2026 07:06:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1] fs/kernfs/dir.c:481:
 warning: Function parameter or struct member 'drop_supers' not described in
 'kernfs_drain'
Message-ID: <202608130748.cf7KffjL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mercier,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   2993266692b6531d84c4459a60d4312d9e3b3b30
commit: b34d8a3a3a256046c35ed5a28173fe0686d34460 [0/1] UPSTREAM: kernfs: Send IN_DELETE_SELF and IN_IGNORED
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260813/202608130748.cf7KffjL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130748.cf7KffjL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130748.cf7KffjL-lkp@intel.com/

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
