Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8502560B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Feb 2024 10:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707300893; cv=none; b=ReB+b1WqZwUW7+mzn/jC9BdvHNLKZ25cKP1psmTJiAp0QJ3xOy+haVur/Os3VH20/h0b5+bMT8u/TcLvPDjMUSWuvzKSGTHKY050OFY8ELqey3JDEcS55Vr7uO4taEssdh1gNIpQAJERHmvhxtvNNuz1HsYPwRlLbB7Eqtx6UHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707300893; c=relaxed/simple;
	bh=LO4FV1lK59kCxd9S/pjHiaa/v0buCQwPT0UotovX7yM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DYhQ8qoqPNa3hjSDRO5hBcLIa5l0r/aJ0MGlNgKtmVliIilmkD1Y+qquODPZ2WzKtaGkMJ02R1aR0hLxr4tyrqJv62FU8H9S8EeweTz8fc++0hx55JvEh4XtO1VZh5tIHrCgYpyLsOwzDrtH162ssSmlLl2R60zsHqWIqKxUvMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WUIS4J4O; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WUIS4J4O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707300891; x=1738836891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LO4FV1lK59kCxd9S/pjHiaa/v0buCQwPT0UotovX7yM=;
  b=WUIS4J4O51v2aWOSLy710eaRfzppvnVj+8K/rMVa8acoQ+ay5o803AFm
   LgkLzvrdruc5xwsZz5SkNqFOXXyO1Vam8wVs8woaUflFifSzvhjYtp9/6
   hF5NgxcXyrdd6l5WuyTslqgzTLP3VTDZ6mwOYk97SJcuzTrZxWuvvQi7X
   FxWSHOBpgcRMfWMEprHWSlGmMeZGjzJ1ZMeWfcgOoNtI8Hj38EEAHnsRJ
   yiP3HbKyDkLiV86b9odz32mSHt4kb8kTx/nY3nonugjQlk4+9XXwY9fsy
   RAUQgDalkLH3S8VytYpc5C2LCPfdBHWp1Q5yA5Bh0QyJzYolskV2323po
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="1232275"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1232275"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 02:14:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="5916023"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Feb 2024 02:14:49 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXex4-0002Tk-36;
	Wed, 07 Feb 2024 10:14:46 +0000
Date: Wed, 7 Feb 2024 18:14:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:djwong-wtf 551/554] fs/xfs/scrub/stats.h:32:49: error:
 implicit declaration of function 'local_clock'; did you mean 'local_lock'?
Message-ID: <202402071857.VU4ieRG9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git djwong-wtf
head:   db62619dd8bf6e12f1c37302dbabfe2f4b64cf08
commit: d14e145142d82a7cddf13ecc157005d12f2622b5 [551/554] xfs: present time stats for scrubbers
config: i386-randconfig-r133-20240206 (https://download.01.org/0day-ci/archive/20240207/202402071857.VU4ieRG9-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402071857.VU4ieRG9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402071857.VU4ieRG9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/xfs/xfs_mount.c:41:
   fs/xfs/scrub/stats.h: In function 'xchk_stats_now':
>> fs/xfs/scrub/stats.h:32:49: error: implicit declaration of function 'local_clock'; did you mean 'local_lock'? [-Werror=implicit-function-declaration]
      32 | static inline u64 xchk_stats_now(void) { return local_clock(); }
         |                                                 ^~~~~~~~~~~
         |                                                 local_lock
   cc1: some warnings being treated as errors


vim +32 fs/xfs/scrub/stats.h

    28	
    29	void xchk_stats_merge(struct xfs_mount *mp, const struct xfs_scrub_metadata *sm,
    30			const struct xchk_stats_run *run);
    31	
  > 32	static inline u64 xchk_stats_now(void) { return local_clock(); }
    33	#else
    34	# define xchk_global_stats_setup(parent)	(0)
    35	# define xchk_global_stats_teardown()		((void)0)
    36	# define xchk_mount_stats_alloc(mp)		(0)
    37	# define xchk_mount_stats_free(mp)		((void)0)
    38	# define xchk_stats_register(cs, parent)	((void)0)
    39	# define xchk_stats_unregister(cs)		((void)0)
    40	# define xchk_stats_now()			(0)
    41	# define xchk_stats_merge(mp, sm, run)		((void)0)
    42	#endif /* CONFIG_XFS_ONLINE_SCRUB_STATS */
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
