Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01A819ADBA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Aug 2025 01:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756343317; cv=none; b=ZDJ0DSLR5H1wi0EsA85+sMGryErzP+7XqZOEI+ABSowKaO8sel124OpHxj0mBuC3OZEg/JGAHVhbNip4DCurlkbamcOTxxkaAumHY9SIWGTBnvAmEgOgvXEoPmU37zaHzhz2VJ8ZDSUZC+ZVKv9OGYCrkhY8iSxmQ8mOUnXyxmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756343317; c=relaxed/simple;
	bh=NSdire3UR2+Q0eMFdDkevjuWRVRqvyA8Ux6XWvteQU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ftCsM1y5vJshtmxAm5yElXxhglbiOqMIpI1XeYmI2o2i6TibJNIWGMF+iXy0OdRSdAjrGgd6HBQ0INvcKuM+/fvLR0ufzaZVqLnXTj1qnzmtHXJKXbcU/H0efuHHTKTg1L/UC57QSTeuByRACUwFm/BOUcp2jsjTHFf8WiWR9oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SYvWVdq3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SYvWVdq3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756343316; x=1787879316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NSdire3UR2+Q0eMFdDkevjuWRVRqvyA8Ux6XWvteQU8=;
  b=SYvWVdq3upb85ne6ibVDz7lQ5YI2CvCAPoodxj+daK0HU65+cCdNr+NH
   iPpnmEL7t2xo+lFho5ZmhUGclASM76SuJ0AJVKCB3gOnAgeW4snWbn+6M
   9tT4tnlUyLEqx+TXCo0tOZOrxvSxH7RfMfbiyf7XcoETGTNETkd7ikstu
   IDXDhdLwd08Ua5J0z1adHUdumYL/2JOtdEd6zVcD6poEyOMUmpeTvI1+M
   6zQZbhD3mS+Zyw4UaJWEfGDIveCD0ngBa8r3xkEm3KmNpJ8lKjwpePWDV
   bOMyVpcGQ3HBuNorbIDAzKqotg6fVTB0HaMuzsgOsus0DmfrZPAbEqbcP
   Q==;
X-CSE-ConnectionGUID: e+RIR6VOT0aUF7AbP4u7rw==
X-CSE-MsgGUID: VGz2lHE6RROBsC9+M/R0cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="46179650"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="46179650"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 18:08:32 -0700
X-CSE-ConnectionGUID: 5f6CyO6mSp2wvgQMXNYzgg==
X-CSE-MsgGUID: g8diqHxISpa6EXn2f1jUww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="200875165"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 27 Aug 2025 18:08:31 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urR7t-000TJb-1u;
	Thu, 28 Aug 2025 01:08:29 +0000
Date: Thu, 28 Aug 2025 09:07:51 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 1/1] kernel/sched/fair.c:9181:6:
 warning: no previous prototype for 'id_can_stop_tick'
Message-ID: <202508280933.lcbEO7u2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   3fe510ec8500eb78ffe2c1a747db0c27d2257130
commit: 3fe510ec8500eb78ffe2c1a747db0c27d2257130 [1/1] anolis: sched: push expellee tasks to a runnable cpu when expel starts
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250828/202508280933.lcbEO7u2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250828/202508280933.lcbEO7u2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508280933.lcbEO7u2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:9181:6: warning: no previous prototype for 'id_can_stop_tick' [-Wmissing-prototypes]
    9181 | bool id_can_stop_tick(struct rq *rq)
         |      ^~~~~~~~~~~~~~~~
   kernel/sched/fair.c:14175:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
   14175 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:14177:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
   14177 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:14182:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
   14182 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:14184:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
   14184 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/id_can_stop_tick +9181 kernel/sched/fair.c

  9172	
  9173	#if defined(CONFIG_NO_HZ_FULL) && defined(CONFIG_SMP)
  9174	bool id_can_stop_tick(struct rq *rq)
  9175	{
  9176		if (!sched_feat(ID_PUSH_EXPELLEE))
  9177			return true;
  9178		return !sched_idle_rq(rq);
  9179	}
  9180	#else
> 9181	bool id_can_stop_tick(struct rq *rq)
  9182	{
  9183		return true;
  9184	}
  9185	#endif
  9186	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
