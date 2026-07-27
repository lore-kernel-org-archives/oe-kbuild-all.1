Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B00E373BE6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jul 2026 12:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785154177; cv=none; b=gZBMYDTtwMBiUpeUU+h/FeJiLbN7Z5MmRqzyqoBaSFCv8Fx3Ltz0rtkyvsCiplL8JAlpQ/uwka8HXI4Wg1s/l4df2zW8ad5/YbVgskLPVSAoOiFeKQ4EHO6b6IsflssV+nCPSX4vFLrHzhLEyV1pTN1uky08pNhO41ju5jiAG84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785154177; c=relaxed/simple;
	bh=jNoq6H8W+4ne3POKh+SNOfhrkJaAqiSQCLLspoJTUX4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rR9MdO7A7ZiI3JLNbhrGnkF3fZcRmdNWJxKsAYnxl4iBh7B4z/a06bdOjlP2LUacXkcTwKVj0k98RCxfryzWcdzyUCG6XTbLhBmW3ysIUGQnunKbaGK5hDLLDGz5lT2iHhuE3vG4HbLtb4bUX8+OmF9GqSFuWDY1bukb6GrTuXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+st/d9J; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+st/d9J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785154175; x=1816690175;
  h=date:from:to:cc:subject:message-id;
  bh=jNoq6H8W+4ne3POKh+SNOfhrkJaAqiSQCLLspoJTUX4=;
  b=Q+st/d9JYOCBPupit6EyzpcjI1ZdEVPwjC6OWxTL9uX/Qf2DaUQVzgs9
   RpbU7lVbRZ3ZOrkiGvwyMDC98rPGGHpsgAiH2p64M0KL6PWlQ8QpVSthx
   PgPngj0MSa8cKiJke5VGikEdEuLpKtGBSgmyNqQ7+p7GydSQPGeTrJZs7
   HR2+k2kN2E0BxQIl1pPB9T1dURj2rAbXXW0fva57KW/Ft0jHYKqS3HNxj
   IA8hvWoi6fROFdrfKtHNG4IGvfZEVvb4DezGUjp7BYbqcxPjkNFwd7ujb
   +6P8gCQkfvf9LgrAcuYhfhQzqbI9mPK4fc/yzSaO6k0+LBOJcqb1erHPH
   A==;
X-CSE-ConnectionGUID: l/5yAO3iSbC/0O0Nvb1NEQ==
X-CSE-MsgGUID: IVsG7gz6QCygl4Y0rfzK3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11857"; a="89542549"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="89542549"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 05:09:35 -0700
X-CSE-ConnectionGUID: DkwgjXBTQJmrdqNHii/0NA==
X-CSE-MsgGUID: OojqaY6ySsGD2lirsHanLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="253063018"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 27 Jul 2026 05:09:34 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woK9D-00000000d9m-0GTw;
	Mon, 27 Jul 2026 12:09:31 +0000
Date: Mon, 27 Jul 2026 20:08:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-kminext 5/5]
 mm/mmzone.c:118:47: sparse: sparse: incorrect type in argument 1 (different
 base types)
Message-ID: <202607271937.myLDNLMO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-kminext
head:   6ea6f1d2674f3ee03b932d9813dea9a0590e8a77
commit: aa2fcdf35fade78eec17bdfae208b652f11ab9a1 [5/5] ANDROID: mm: Create hooks for ZONE_MOVABLE allocs
config: i386-randconfig-r131-20260727 (https://download.01.org/0day-ci/archive/20260727/202607271937.myLDNLMO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260727/202607271937.myLDNLMO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607271937.myLDNLMO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/mmzone.c:118:47: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int *flags @@     got restricted gfp_t * @@
   mm/mmzone.c:118:47: sparse:     expected unsigned int *flags
   mm/mmzone.c:118:47: sparse:     got restricted gfp_t *
--
>> mm/readahead.c:158:51: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int *flags @@     got restricted gfp_t * @@
   mm/readahead.c:158:51: sparse:     expected unsigned int *flags
   mm/readahead.c:158:51: sparse:     got restricted gfp_t *

vim +118 mm/mmzone.c

   115	
   116	enum zone_type gfp_zone(gfp_t flags)
   117	{
 > 118		trace_android_rvh_set_gfp_zone_flags(&flags);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
