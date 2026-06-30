Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA8F3769FF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 07:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782803337; cv=none; b=gC0GL9S6ufc1b7a2Yf39LhwcqWm2K6MFB+avcT2vtsYTPSYWbGs63tIy+TIhEo/RjWIYHfE6s8zoYZOp7dxB5iXVxYTe7kF2eMRZPg72Q7ufv6eU04U8MGaKdQmhLRmiRS9QrGXibcRD6Zb+h/jeP8hRZA0MEIXPq4hytF1HI4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782803337; c=relaxed/simple;
	bh=DNuLdEzEZv/57GzFLkpcYczFDZ3v+QDDREZ4xpF3bqI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t6oH5urxbgYp3RKE5LPg29Ox3n74wJMjYrHTbxC5sYr38OMHntu4h4m/ZESLITjgkM6+H9Lvf0fy1c185dO95xQP1TKW9R9g85Y3UpG5PG0HQEIyQd6sYatFPbbso5/kGSCwLYV9HIw7VDtcbOWO9D6kM4x1cQiGlaQ5Ry5FC40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lC525kXl; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lC525kXl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782803335; x=1814339335;
  h=date:from:to:cc:subject:message-id;
  bh=DNuLdEzEZv/57GzFLkpcYczFDZ3v+QDDREZ4xpF3bqI=;
  b=lC525kXlbNYLb1vH5S/VOftZTkwqfyucesoSzSwf0iolUN5m6Fu69iKm
   v9d4k7avKpEbSRBG+Z2B0DjA1OTPm8vhybuE2i9iBHIMgwrtDxDboLKsd
   0wTOH1KnkJKA7gm/hNF6TE7tnqpSnwnv29VWCvCLZcUdRbjs9sDGsT0C+
   pZhXxXz0VnwVdoXmYZuCgSF9mhWJsS8CiC5J32kH9lW54vVxbyeejRWur
   zXoFNgJ3zf+v7xlrB/OL3T3OwFh5h7y1ir7Ya4tgxJlq7JbIppLvEqyJv
   hAdCzjWP++HXku6XOUrzAcNmSyRcppZiKzgP7O5rmZc8TAsXOyGf5bxkc
   A==;
X-CSE-ConnectionGUID: ftuJUCReT+CCxmEvdwSyMg==
X-CSE-MsgGUID: YSW+PJV2SBaSJF8xJeBIQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="94891312"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="94891312"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 00:08:54 -0700
X-CSE-ConnectionGUID: ra7aQtVsTFSZqN1hBvMmyA==
X-CSE-MsgGUID: laRbu43rRUex6PCN62gYlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="255780360"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 30 Jun 2026 00:08:52 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weSaP-0000000084T-3JLc;
	Tue, 30 Jun 2026 07:08:49 +0000
Date: Tue, 30 Jun 2026 15:08:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:pool-mode 6/6] net/sunrpc/svc.c:235:39: sparse:
 sparse: dereference of noderef expression
Message-ID: <202606301410.EvwcD3VP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git pool-mode
head:   cdfad06a7ec5f3b374eac6e7614134474ca39c2b
commit: cdfad06a7ec5f3b374eac6e7614134474ca39c2b [6/6] sunrpc: protect the svc_pool_map pool_to[] array with RCU
config: sparc-randconfig-r132-20260630 (https://download.01.org/0day-ci/archive/20260630/202606301410.EvwcD3VP-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606301410.EvwcD3VP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606301410.EvwcD3VP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/sunrpc/svc.c:235:39: sparse: sparse: dereference of noderef expression

vim +235 net/sunrpc/svc.c

d8903ab12c8e90 Jeff Layton           2026-04-23  226  
bfd241600a3b0d Greg Banks            2006-10-02  227  /*
9867d76ca16b3f Jeff Layton           2008-06-10  228   * Set the given thread's cpus_allowed mask so that it
bfd241600a3b0d Greg Banks            2006-10-02  229   * will only run on cpus in the given pool.
bfd241600a3b0d Greg Banks            2006-10-02  230   */
9867d76ca16b3f Jeff Layton           2008-06-10  231  static inline void
9867d76ca16b3f Jeff Layton           2008-06-10  232  svc_pool_map_set_cpumask(struct task_struct *task, unsigned int pidx)
bfd241600a3b0d Greg Banks            2006-10-02  233  {
bfd241600a3b0d Greg Banks            2006-10-02  234  	struct svc_pool_map *m = &svc_pool_map;
9867d76ca16b3f Jeff Layton           2008-06-10 @235  	unsigned int node = m->pool_to[pidx];
bfd241600a3b0d Greg Banks            2006-10-02  236  
bfd241600a3b0d Greg Banks            2006-10-02  237  	/*
bfd241600a3b0d Greg Banks            2006-10-02  238  	 * The caller checks for sv_nrpools > 1, which
42a7fc4a659822 Greg Banks            2007-03-06  239  	 * implies that we've been initialized.
bfd241600a3b0d Greg Banks            2006-10-02  240  	 */
1bd58aaff44485 Weston Andros Adamson 2012-10-23  241  	WARN_ON_ONCE(m->count == 0);
1bd58aaff44485 Weston Andros Adamson 2012-10-23  242  	if (m->count == 0)
1bd58aaff44485 Weston Andros Adamson 2012-10-23  243  		return;
bfd241600a3b0d Greg Banks            2006-10-02  244  
a70f730282019f Rusty Russell         2009-03-13  245  	set_cpus_allowed_ptr(task, cpumask_of_node(node));
c5f59f0833df94 Mike Travis           2008-04-04  246  }
bfd241600a3b0d Greg Banks            2006-10-02  247  

:::::: The code at line 235 was first introduced by commit
:::::: 9867d76ca16b3f455f9ca83861f4ce5c94a25928 knfsd: convert knfsd to kthread API

:::::: TO: Jeff Layton <jlayton@redhat.com>
:::::: CC: J. Bruce Fields <bfields@citi.umich.edu>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
