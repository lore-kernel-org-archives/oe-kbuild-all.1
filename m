Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F472F9C1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 09:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760175764; cv=none; b=Rc2M0b32EodtrQ/QBPbrngRpn78fW4WH4xkF76FNumLPaKIvgMGKV9psdShCh62CDf7zj9abAQfBX/mE+D6ejz01txzZWJaOxdi1ojQX+q8T0jbYnzSW8Las4PmxZCU7vzuQPAvJ84HiVxFqmQphsTVkWSZlFZD/tdQBqiFX0SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760175764; c=relaxed/simple;
	bh=LB5w1Sibc+BzrvEHm28xnJ/wEj4F6S4aBrvN+OtVu+w=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ljk4PhGSZRg84k7P+OhfgwhpqELifNX3aWZpzw6ahi6xDM7yPXe++MZpxPwtP9HQIaDPV8GAZQzvSh6eHqgSvG1Pics20Q1ZJgEE6CSEAq822uCbyholRwg3vG27UYW6lGLFyYaKRbXd8Qmvkc5N8abjdATU7kTR0zGNc1xRrSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aoeSOiZm; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aoeSOiZm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760175759; x=1791711759;
  h=date:from:cc:subject:message-id:mime-version;
  bh=LB5w1Sibc+BzrvEHm28xnJ/wEj4F6S4aBrvN+OtVu+w=;
  b=aoeSOiZmiRJHiXFMVA7rUeyez1KJocZ7UWqefinSX5UL33V6xYJMLbCy
   gxzoxSHzWzF8a7dBis1Y5myLcZRZe1t2LNy/sn1k1iilNCD9ombtTcPxO
   MzKw78cxLgrAfKdchy3nrFsqq0t1vX/Yte3fN10l4ZDGJd0Qp3ttpYaoB
   tYSJxw/6+vQbCMF0TcyvqHfSPVzdr7xF0BlbO2ERHMF/qU17SRf9M80Qn
   9CJA7h5Qb8WgzfFOH1VE02MY3GoTAORtQ6vdeLLE3gN9mZr0yDhcAZqkO
   KB+q3bhVHBFM4zJf6jXcmiSqQMlB6LD6D3qeGeXaHQbw3jWqQQrh1dmT1
   A==;
X-CSE-ConnectionGUID: Qa8C4L70SIWqeilAgkW4dA==
X-CSE-MsgGUID: eDomEntfTAqBy+ng6cWpeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="73486865"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="73486865"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 02:42:39 -0700
X-CSE-ConnectionGUID: jnCtZps2SpO2h4gFRTt4SA==
X-CSE-MsgGUID: qnXKtEx7SGuf5tn8ihoF9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="185426382"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Oct 2025 02:42:37 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7W7W-0003gN-2b;
	Sat, 11 Oct 2025 09:42:34 +0000
Date: Sat, 11 Oct 2025 17:42:02 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jeff Layton <jlayton@kernel.org>
Subject: [jlayton:kdevops 1/3] fs/nfsd/nfsfh.c:699:23: warning: unused
 variable 'inode'
Message-ID: <202510111741.4tkN0Uzm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   111666a803b9733b5c590aec6312443ad3dac2f5
commit: 177818f176ef904fb18d237d1dbba00c2643aaf2 [1/3] Merge branch 'mrchuck/nfsd-next'
config: m68k-mac_defconfig (https://download.01.org/0day-ci/archive/20251011/202510111741.4tkN0Uzm-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510111741.4tkN0Uzm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510111741.4tkN0Uzm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/nfsd/nfsfh.c: In function 'fh_getattr':
>> fs/nfsd/nfsfh.c:699:23: warning: unused variable 'inode' [-Wunused-variable]
     699 |         struct inode *inode = d_inode(p.dentry);
         |                       ^~~~~


vim +/inode +699 fs/nfsd/nfsfh.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  684  
c1f203e46c55ac0 Chuck Lever    2025-07-02  685  /**
c1f203e46c55ac0 Chuck Lever    2025-07-02  686   * fh_getattr - Retrieve attributes on a local file
c1f203e46c55ac0 Chuck Lever    2025-07-02  687   * @fhp: File handle of target file
c1f203e46c55ac0 Chuck Lever    2025-07-02  688   * @stat: Caller-supplied kstat buffer to be filled in
c1f203e46c55ac0 Chuck Lever    2025-07-02  689   *
c1f203e46c55ac0 Chuck Lever    2025-07-02  690   * Returns nfs_ok on success, otherwise an NFS status code is
c1f203e46c55ac0 Chuck Lever    2025-07-02  691   * returned.
c1f203e46c55ac0 Chuck Lever    2025-07-02  692   */
c1f203e46c55ac0 Chuck Lever    2025-07-02  693  __be32 fh_getattr(const struct svc_fh *fhp, struct kstat *stat)
c1f203e46c55ac0 Chuck Lever    2025-07-02  694  {
c1f203e46c55ac0 Chuck Lever    2025-07-02  695  	struct path p = {
c1f203e46c55ac0 Chuck Lever    2025-07-02  696  		.mnt		= fhp->fh_export->ex_path.mnt,
c1f203e46c55ac0 Chuck Lever    2025-07-02  697  		.dentry		= fhp->fh_dentry,
c1f203e46c55ac0 Chuck Lever    2025-07-02  698  	};
81538c8e42806ee Linus Torvalds 2025-10-06 @699  	struct inode *inode = d_inode(p.dentry);
c1f203e46c55ac0 Chuck Lever    2025-07-02  700  	u32 request_mask = STATX_BASIC_STATS;
c1f203e46c55ac0 Chuck Lever    2025-07-02  701  
737a72eed2e5058 Chuck Lever    2025-09-29  702  	if (d_is_reg(p.dentry))
6f322e6110a6281 Mike Snitzer   2025-09-29  703  		request_mask |= (STATX_DIOALIGN | STATX_DIO_READ_ALIGN);
6f322e6110a6281 Mike Snitzer   2025-09-29  704  
c1f203e46c55ac0 Chuck Lever    2025-07-02  705  	if (fhp->fh_maxsize == NFS4_FHSIZE)
c1f203e46c55ac0 Chuck Lever    2025-07-02  706  		request_mask |= (STATX_BTIME | STATX_CHANGE_COOKIE);
c1f203e46c55ac0 Chuck Lever    2025-07-02  707  
c1f203e46c55ac0 Chuck Lever    2025-07-02  708  	return nfserrno(vfs_getattr(&p, stat, request_mask,
c1f203e46c55ac0 Chuck Lever    2025-07-02  709  				    AT_STATX_SYNC_AS_STAT));
c1f203e46c55ac0 Chuck Lever    2025-07-02  710  }
c1f203e46c55ac0 Chuck Lever    2025-07-02  711  

:::::: The code at line 699 was first introduced by commit
:::::: 81538c8e42806eed71ce125723877a7c2307370c Merge tag 'nfsd-6.18' of git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
