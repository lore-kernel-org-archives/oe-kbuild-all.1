Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCAA1E529
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 15:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723649593; cv=none; b=ZQnVLr8BTm/CkomhEk5MJpMdFO8kJhZm29oVrDkJvt1d3kpKg+xy/33SAp88NQsDsMEwam/iAMBfMZIOXB7EH9jzCsJtY0J0o6uFkkMV8xuXNjywvQGH33vmxZ0oVefsFr5e5AMNQCHEz8y7LhNiNx+AMyPocSnqxUj1AQBS/hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723649593; c=relaxed/simple;
	bh=4uAEATNNkxVnCWiOBpe7aGbKKUA1GsoM9hQAic52dIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QpnprvbDmclw9o82YczEo1BX40ahd0mTf0e98f2u9jXpVsB0lbW+lm6yY8MnxWSLtoUU1ygolo+7ZJ5ChxkU+aVmYzIEE1UfeAsh1Gittmtdsd0cnRrusHQHTh73wtEVFLVdw2b68KC/3Xe290TfwoGHB80ud6CsZ07X7hGaGPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J6tqJpUb; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J6tqJpUb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723649591; x=1755185591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4uAEATNNkxVnCWiOBpe7aGbKKUA1GsoM9hQAic52dIg=;
  b=J6tqJpUbMSSTMCcJVg110aaefXZrB4dTiNqYleFoGI5EEPMuhM/R43Uv
   lUUbUX01cqDKdgWzEqBFv7q7J1vLlqUeGOlJy1pkwX6QZQUyZsYtNqKtV
   vGZ/eGGy8H/MsUppCs1IGJZr1RUX6llF1NCGUjRK92EPVvZxmerB8Vi5E
   RDhCHiL8y3jk6F3Ilm5fVeqYcYY3s+frX09OnKX6RSVX7QjrO06oxJ5vx
   3vb/kBQ60WlREwD9ONBye7usNLi1Q2hpYrbWfkYEBnMdvElr5M7cAhyq4
   10g0j8rev6nqryxIDvEeVIHszjextJpj5JaQZ9D2KVCHIcF+xTHizV2KG
   A==;
X-CSE-ConnectionGUID: n0Q5Rpm5SY2ECnO7cHfUGQ==
X-CSE-MsgGUID: ctjrpXrWSEiLI4ADfeWgMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="22014689"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="22014689"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 08:33:10 -0700
X-CSE-ConnectionGUID: FoLDscqbQV2EvRnSP8nyWw==
X-CSE-MsgGUID: uEpdqmg9QJGiPbwx2RvIIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="58730443"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Aug 2024 08:33:09 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seFzn-0002Bw-0X;
	Wed, 14 Aug 2024 15:33:07 +0000
Date: Wed, 14 Aug 2024 23:32:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:hch-wtf 146/253] fs/xfs/scrub/common.h:149:57: error:
 expected expression before 'do'
Message-ID: <202408142305.v4WoIACc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git hch-wtf
head:   dabb7872a6f25b04b590e544cc0f5f3ac560194e
commit: 0c8212b43f2e700349eedd8b080b9389f4748baf [146/253] xfs: allow queued realtime intents to drain before scrubbing
config: x86_64-randconfig-002-20240814 (https://download.01.org/0day-ci/archive/20240814/202408142305.v4WoIACc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408142305.v4WoIACc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408142305.v4WoIACc-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/scrub/bmap.c: In function 'xchk_bmap_rt_iextent_xref':
   fs/xfs/scrub/bmap.c:320:17: error: implicit declaration of function 'xchk_rtgroup_init_existing'; did you mean 'xchk_ag_init_existing'? [-Werror=implicit-function-declaration]
     320 |         error = xchk_rtgroup_init_existing(info->sc,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 xchk_ag_init_existing
   In file included from fs/xfs/scrub/bmap.c:25:
>> fs/xfs/scrub/common.h:149:57: error: expected expression before 'do'
     149 | # define xchk_rtgroup_lock(sc, sr, lockflags)           do { } while (0)
         |                                                         ^~
   fs/xfs/scrub/bmap.c:327:17: note: in expansion of macro 'xchk_rtgroup_lock'
     327 |         error = xchk_rtgroup_lock(info->sc, &info->sc->sr, XCHK_RTGLOCK_ALL);
         |                 ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/do +149 fs/xfs/scrub/common.h

   143	
   144	int xchk_rtgroup_lock(struct xfs_scrub *sc, struct xchk_rt *sr,
   145			unsigned int rtglock_flags);
   146	void xchk_rtgroup_free(struct xfs_scrub *sc, struct xchk_rt *sr);
   147	#else
   148	# define xchk_rtgroup_init(sc, rgno, sr)		(-ENOSYS)
 > 149	# define xchk_rtgroup_lock(sc, sr, lockflags)		do { } while (0)
   150	# define xchk_rtgroup_free(sc, sr)			do { } while (0)
   151	#endif /* CONFIG_XFS_RT */
   152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
