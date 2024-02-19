Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EBC810
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Feb 2024 02:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708308122; cv=none; b=TEoe8rbDOtIcydqNYuEj0pb8isdGBRme4AGGWHDmTg6XeUwWrWBoJqTbKSduRA70E5/bEAnBR4lvRR19h18ZPEtQ+/goMiExPPtKRGFYdQVmQX0u7ksuwAtZAy2PXmVRMHSop3YsFCkXEFfHS0SyaR3cZauJUPYtE4IXl5TtWJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708308122; c=relaxed/simple;
	bh=/rjUvOlGwhlRsDCJ/j19W9zbG2DtcxxdV3Dy1aY7nFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JTCMZoW3jOn4+p8Q3KlI71vAKkzH+PYCNyLUt/4nwD0VmsjPMbRTdLvXD2ChJ4uupYei3uS1FyaCxfh9mQI1SxRasTyxkXMfZZ4gisVNtoO07vofDLBodQT6wH4vZgrEb7Ye55ZvBqJcbsEU1pG5YgUUw30sfjNTULQ7cnjrZiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f2FW/qqr; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f2FW/qqr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708308120; x=1739844120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/rjUvOlGwhlRsDCJ/j19W9zbG2DtcxxdV3Dy1aY7nFk=;
  b=f2FW/qqrhvQHSy8VmqwDrjWnCfpsISLBsnSTMDo/83X68xLBFW/AFbj4
   qjx57kDRn9lnYkIjhpRYKWuEgdc9qKElLBuYH9S6SWddLaXoC9IllzJSy
   0iRA4XzM5yFnA+4Z6zgck6oQ+EdGi3XAjg1p32weD5PEePVaqdcxrNzpa
   aUvE45lm0uMH2mFDWdD2sZYw9uhVc0rHnAKlngA8jed0ropGY4wk9uRTJ
   nLxyz2RYgy8kTnwupSqYtaxD31T9ikq81SabwQA+tFwQmYFun6j31hT+c
   a88ZbZveEHvOoMuA+K1c57Hfe7rObquLsP9PK06hou3+ys5lPLLWZhO64
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="12921713"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="12921713"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 18:01:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="35388995"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 18 Feb 2024 18:01:57 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbsyh-0003Qg-1m;
	Mon, 19 Feb 2024 02:01:55 +0000
Date: Mon, 19 Feb 2024 10:01:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:twf-hoist 551/561] fs/xfs/scrub/stats.h:32:49: error:
 call to undeclared function 'local_clock'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202402190947.tfMRbrXU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git twf-hoist
head:   26669ffc901c13541672ce006a7c2f6124dabed9
commit: 5cff920ec7f1c82650a4ea3618b09ebc2d2d9e80 [551/561] xfs: present time stats for scrubbers
config: arm64-randconfig-004-20240219 (https://download.01.org/0day-ci/archive/20240219/202402190947.tfMRbrXU-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240219/202402190947.tfMRbrXU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402190947.tfMRbrXU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/xfs/scrub/stats.c:17:
>> fs/xfs/scrub/stats.h:32:49: error: call to undeclared function 'local_clock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      32 | static inline u64 xchk_stats_now(void) { return local_clock(); }
         |                                                 ^
   1 error generated.


vim +/local_clock +32 fs/xfs/scrub/stats.h

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
