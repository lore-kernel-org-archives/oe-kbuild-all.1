Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793126561;
	b=vVN3uGS94vmEWvx/iKdDqt+6jqdkjIq4XT7ivmvPQ+GlRWJ1eJdjt/oXOYoT+n/LPwGW
	 w6jhmzHIY2wAc5kpaRTIYEx5Um9Irsu60tj2ydnxVbU2YkYQj5V39FktRgUmk3bI1vCU3
	 uCKy6aUOML2CTol7PVPRZJvC+Ac3DEhFlm4l54BInX+S8jwy0L6qMbEsRrzmq9/u+VVmE
	 SFbb+QWR887bsbfKVCB3v8KyoraqM0rqXZSjEwEebK42zPQUZji1nFwSHJbFDO3vk8f9A
	 sKJjp7QmOt1K9eongyKPa02qIEXlg1CVOvhYPLoxfrJXaYLI+G5Nawuh1Nmr3IfOF3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126561;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=U1xI26g3x8/oTa8heG6G+V9z4rrp9wJYw0NrPGum4qE=;
	b=kZbWKP/2+4FqKcVhSZg7WsIeDTnfBUelZT/DvJXmAZAHTDwVfLul6v8970waUGBJW6ds
	 6SE5zFLRwkklbD9RckeJjNOecs8RWBM4Crnir/g9jRzyoIhariNAhzdl7SfwKpA5REQ53
	 +p4FeCXpkqf+K9p1w8kLAL1j52XT3jISiVOw0EqEXZCGXWR0nllGurAqbg0nfGsTFIoGm
	 I1BIbfxhFFsRwnK18n9Gq3HxwQwdy6uScxAZ/2gEJ6iz7Nouzpy5yjwI1m9AE5MrsRDR2
	 lRIEOLdQ6IYQU7RKbxdRz15UCCjLm0JSfVHJ8S3qnl4U6D4SnlEaHwOM8vPgRkiifig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lh7vlNmS;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBB5606A31A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 18:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DBB5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lh7vlNmS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793126559; x=1824662559;
  h=date:from:to:cc:subject:message-id;
  bh=4yvzv0z2cp5bJlvyfQbs79B6KR1P9hp2mEG/MnnEjhw=;
  b=lh7vlNmStHK4dr7N+iVVEFCaCkmGlc6NDcxt3YyylVdL2DNQiU/lMkzL
   M/CBb8jfUDp/DZJ3juZ0zpliGULg42c1cplMa9qLCRuSPioBqd3qQWDdg
   7dodj9bm5HK0qZ1evCNG5ptHtRkp2++Anq08hPYvZlWpMj1bg5f5G2E3r
   WM14Y93ov2BnBNMG+6jvWJL7rUv3IKx8EvhiG10SWwvbW+qCjKJrkgSYP
   YlINDXmNdQh7erPO5lTMlXRINBVNqyt5oq6TCLdPTSkFjM9Fka/5T/4FN
   7jlWNw0ej51re2nALqYYrOQ6A5nVxfbyNRyQRtQVXqJG05xwdtu2Lantg
   A==;
X-CSE-ConnectionGUID: wKE/u4VZRT2cz0e2/VI1Pg==
X-CSE-MsgGUID: L+6aYbZOSZOXjGaZh0nt+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1944137"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1944137"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 11:42:39 -0700
X-CSE-ConnectionGUID: qMA24fmJQCqfZ9V3Wu1awQ==
X-CSE-MsgGUID: w2ClP2euSnuK0ndcBafTOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="5007417"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 27 Oct 2026 11:42:38 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLm83-000000004at-2VoK;
	Tue, 27 Oct 2026 18:42:35 +0000
Date: Tue, 27 Oct 2026 19:41:43 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 20/20] fs/kernfs/dir.c:482:
 warning: Excess function parameter 'drop_supers' description in
 'kernfs_drain'
Message-ID: <202610271913.8BhjHDtU-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b83ca11f560a414ae30f680b4c212094f6abdf19
commit: d9c80a173a8ce60e5b86601a231209002e313be6 [20/20] UPSTREAM: kernfs: Add missing documentation for kernfs_put_active's drop_supers argument
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261027/202610271913.8BhjHDtU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271913.8BhjHDtU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271913.8BhjHDtU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/kernfs/dir.c:482: warning: Excess function parameter 'drop_supers' description in 'kernfs_drain'


vim +482 fs/kernfs/dir.c

fd7b9f7b9776b11 Tejun Heo    2013-11-28  468  
fd7b9f7b9776b11 Tejun Heo    2013-11-28  469  /**
81c173cb5e87fbb Tejun Heo    2014-02-03  470   * kernfs_drain - drain kernfs_node
81c173cb5e87fbb Tejun Heo    2014-02-03  471   * @kn: kernfs_node to drain
d9c80a173a8ce60 T.J. Mercier 2026-03-13  472   * @drop_supers: Set to true if this function is called with the
d9c80a173a8ce60 T.J. Mercier 2026-03-13  473   *               kernfs_supers_rwsem locked.
fd7b9f7b9776b11 Tejun Heo    2013-11-28  474   *
2b052bf46e870da Randy Dunlap 2022-11-11  475   * Drain existing usages and nuke all existing mmaps of @kn.  Multiple
81c173cb5e87fbb Tejun Heo    2014-02-03  476   * removers may invoke this function concurrently on @kn and all will
81c173cb5e87fbb Tejun Heo    2014-02-03  477   * return after draining is complete.
fd7b9f7b9776b11 Tejun Heo    2013-11-28  478   */
81c173cb5e87fbb Tejun Heo    2014-02-03  479  static void kernfs_drain(struct kernfs_node *kn)
393c3714081a537 Minchan Kim  2021-11-18  480  	__releases(&kernfs_root(kn)->kernfs_rwsem)
393c3714081a537 Minchan Kim  2021-11-18  481  	__acquires(&kernfs_root(kn)->kernfs_rwsem)
fd7b9f7b9776b11 Tejun Heo    2013-11-28 @482  {
abd54f028ec3097 Tejun Heo    2014-02-03  483  	struct kernfs_root *root = kernfs_root(kn);
fd7b9f7b9776b11 Tejun Heo    2013-11-28  484  
393c3714081a537 Minchan Kim  2021-11-18  485  	lockdep_assert_held_write(&root->kernfs_rwsem);
81c173cb5e87fbb Tejun Heo    2014-02-03  486  	WARN_ON_ONCE(kernfs_active(kn));
abd54f028ec3097 Tejun Heo    2014-02-03  487  
2d7f9f8c1815707 Tejun Heo    2022-08-27  488  	/*
2d7f9f8c1815707 Tejun Heo    2022-08-27  489  	 * Skip draining if already fully drained. This avoids draining and its
2d7f9f8c1815707 Tejun Heo    2022-08-27  490  	 * lockdep annotations for nodes which have never been activated
2d7f9f8c1815707 Tejun Heo    2022-08-27  491  	 * allowing embedding kernfs_remove() in create error paths without
2d7f9f8c1815707 Tejun Heo    2022-08-27  492  	 * worrying about draining.
2d7f9f8c1815707 Tejun Heo    2022-08-27  493  	 */
2d7f9f8c1815707 Tejun Heo    2022-08-27  494  	if (atomic_read(&kn->active) == KN_DEACTIVATED_BIAS &&
2d7f9f8c1815707 Tejun Heo    2022-08-27  495  	    !kernfs_should_drain_open_files(kn))
2d7f9f8c1815707 Tejun Heo    2022-08-27  496  		return;
2d7f9f8c1815707 Tejun Heo    2022-08-27  497  
393c3714081a537 Minchan Kim  2021-11-18  498  	up_write(&root->kernfs_rwsem);
35beab0635f3cdd Tejun Heo    2014-02-03  499  
182fd64b6634221 Tejun Heo    2014-02-03  500  	if (kernfs_lockdep(kn)) {
35beab0635f3cdd Tejun Heo    2014-02-03  501  		rwsem_acquire(&kn->dep_map, 0, 0, _RET_IP_);
35beab0635f3cdd Tejun Heo    2014-02-03  502  		if (atomic_read(&kn->active) != KN_DEACTIVATED_BIAS)
324a56e16e44bae Tejun Heo    2013-12-11  503  			lock_contended(&kn->dep_map, _RET_IP_);
35beab0635f3cdd Tejun Heo    2014-02-03  504  	}
abd54f028ec3097 Tejun Heo    2014-02-03  505  
abd54f028ec3097 Tejun Heo    2014-02-03  506  	wait_event(root->deactivate_waitq,
abd54f028ec3097 Tejun Heo    2014-02-03  507  		   atomic_read(&kn->active) == KN_DEACTIVATED_BIAS);
fd7b9f7b9776b11 Tejun Heo    2013-11-28  508  
182fd64b6634221 Tejun Heo    2014-02-03  509  	if (kernfs_lockdep(kn)) {
324a56e16e44bae Tejun Heo    2013-12-11  510  		lock_acquired(&kn->dep_map, _RET_IP_);
5facae4f3549b5c Qian Cai     2019-09-19  511  		rwsem_release(&kn->dep_map, _RET_IP_);
fd7b9f7b9776b11 Tejun Heo    2013-11-28  512  	}
35beab0635f3cdd Tejun Heo    2014-02-03  513  
bdb2fd7fc56e197 Tejun Heo    2022-08-27  514  	if (kernfs_should_drain_open_files(kn))
0e67db2f9fe9193 Tejun Heo    2016-12-27  515  		kernfs_drain_open_files(kn);
ccf02aaf8167bb8 Tejun Heo    2014-02-03  516  
393c3714081a537 Minchan Kim  2021-11-18  517  	down_write(&root->kernfs_rwsem);
a6607930b6cd829 Tejun Heo    2014-02-03  518  }
fd7b9f7b9776b11 Tejun Heo    2013-11-28  519  

:::::: The code at line 482 was first introduced by commit
:::::: fd7b9f7b9776b11df629e9dd3865320bf57ce588 sysfs, kernfs: move dir core code to fs/kernfs/dir.c

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
