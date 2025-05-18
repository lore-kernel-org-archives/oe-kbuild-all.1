Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C0E1FF7C5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 12:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747570710; cv=none; b=i8iMXIdqSE7FMilAaRlrVOHgURtJXVRMrpsS7jAisKevUNpt7IPOILDsNPM6j+p9U2QIEjwF4VqrjHGodHXsNWaXrA5zNl/60alY5tNVUzI8hru+4ZKFV7aa9mYbhRV1CC3ylmFahTVDKlOZju0wjr6GY9gBl6llIKIkXZ1yOvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747570710; c=relaxed/simple;
	bh=PHOLDTUXh8IV1F3H9yP8DDt9W/KplcOHe9W54A4NtZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O19dCYnsCAu+tcBkCcW1BgRFuaawmv/+Ul9KyOVtNt1fBtZx1TrztYJ4RImLoUongyTaFTNbYPRVnlkyeaOm1bmK2QBd54VeyGG9ZDekNFqMB6TSsZqTsF+sUx4fwoBhLWthcbFwwyfJqXqBSxi641aeUJf8YmCEKoS4I90Z3kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TeONqDDK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TeONqDDK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747570709; x=1779106709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PHOLDTUXh8IV1F3H9yP8DDt9W/KplcOHe9W54A4NtZg=;
  b=TeONqDDKRlZ7D7fqfticx7TezjIMiqd4vQSIw//X/94FnU7iFAKlk7ho
   jg5sQrFJy6Nnz+CIHOAi4po6jErui5HjpsxVAmbMjf5fhjSgjc10PnYaI
   B9WJney0YnusTsPM3v3MGrWaNcCyD8paBnHeTCVOOox24My8JmcmflqDQ
   3kuk2PYjx+nWEny7E9i7Vk+3I/GRUfLBnjOw+llLqVHIR2gn/nPfOivKv
   LPvcVb6UhFQoUlSmSUxMjRocNye4R62vzQdp4e28s69rCg0mCLUWwrurj
   C2R+bciMggf+Hx1pdufaOc8+KycYno+Sr6z91Bz/RGYcdpB5nnZaFRXP2
   g==;
X-CSE-ConnectionGUID: KO+LOzuRSCG8VUes/EDYWA==
X-CSE-MsgGUID: kD4jdJzoRreCNsG7HBJeGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="48591403"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="48591403"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 05:18:28 -0700
X-CSE-ConnectionGUID: lzEr+A2sSYG98Bf8vOlZkw==
X-CSE-MsgGUID: WsEIirHdToiX9Z0p7EETrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="139038771"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 May 2025 05:18:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGcyG-000Kn5-1q;
	Sun, 18 May 2025 12:18:24 +0000
Date: Sun, 18 May 2025 20:17:36 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 11/11] kernel/sched/fair.c:1155:6:
 warning: no previous prototype for function 'group_identity_get'
Message-ID: <202505182019.kfhpRFfy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Cruz,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   950b90b563b8c87ae35bb6edc4775609bc9471c2
commit: 31ec2541ea6607ba496f567250bb652cda0a34a6 [11/11] anolis: sched/fair: Introduce sysctl interface to enable group identity
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250518/202505182019.kfhpRFfy-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505182019.kfhpRFfy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505182019.kfhpRFfy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:1155:6: warning: no previous prototype for function 'group_identity_get' [-Wmissing-prototypes]
    1155 | void group_identity_get(void)
         |      ^
   kernel/sched/fair.c:1155:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1155 | void group_identity_get(void)
         | ^
         | static 
>> kernel/sched/fair.c:1161:6: warning: no previous prototype for function 'group_identity_put' [-Wmissing-prototypes]
    1161 | void group_identity_put(void)
         |      ^
   kernel/sched/fair.c:1161:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1161 | void group_identity_put(void)
         | ^
         | static 
   kernel/sched/fair.c:2030:22: warning: no previous prototype for function '__pick_first_entity' [-Wmissing-prototypes]
    2030 | struct sched_entity *__pick_first_entity(struct cfs_rq *cfs_rq)
         |                      ^
   kernel/sched/fair.c:2030:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2030 | struct sched_entity *__pick_first_entity(struct cfs_rq *cfs_rq)
         | ^
         | static 
   kernel/sched/fair.c:8472:7: warning: variable 'min_vruntime' set but not used [-Wunused-but-set-variable]
    8472 |                 u64 min_vruntime;
         |                     ^
   4 warnings generated.


vim +/group_identity_get +1155 kernel/sched/fair.c

  1150	
  1151	/* Before we call group_identity_get() and group_identity_put(), we have hold
  1152	 * the lock identity_mutex, so the atomicity of enable/disable group identity
  1153	 * can be guaranteed.
  1154	 */
> 1155	void group_identity_get(void)
  1156	{
  1157		lockdep_assert_held(&identity_mutex);
  1158		atomic_inc(&group_identity_count);
  1159	}
  1160	
> 1161	void group_identity_put(void)
  1162	{
  1163		lockdep_assert_held(&identity_mutex);
  1164		atomic_dec(&group_identity_count);
  1165	}
  1166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
