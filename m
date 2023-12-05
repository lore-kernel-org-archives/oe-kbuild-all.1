Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80856DDA1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 06:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iAvt1MfC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701756883; x=1733292883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CQ8/M5cNdmaAMEcBvSTDvIkYpsw5dAMN0Ya3dKgZjvM=;
  b=iAvt1MfCW8Ny8GlVUUDgu9hmvwk7Kvu2j6Lo3JdLSzEe+2WumSg4/AUD
   W2v0QpTV9NkxTsx+FUsuKAXQKG6B7BeoRJm96+cCQjasG50UXNR9uY+IW
   kXZq728QPFEgAEl3NwlsgHjk8w4KwcHTM7vJYL3KBiAdwcTygwsJap82w
   1Uu1rtvv+WDBeIqQLKzk0sq8n3ptk2d6M2OC+StcImY3H8MpT3+v54m2W
   ZDZe86Kh4KgLS0dPMiiEbVhlCxJ+h7Y1uRhI4eJlUwHgbLBSVRvUgxvgS
   IjEc144Y7VGRo3pmBWuxHNKq4nYqmTMfvKnwCotDwD1EDatiKgBxLVxHG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="480043032"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="480043032"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 22:14:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="914699330"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="914699330"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 04 Dec 2023 22:14:41 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAOha-0008Pz-23;
	Tue, 05 Dec 2023 06:14:39 +0000
Date: Tue, 5 Dec 2023 14:13:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 1/2]
 drivers/misc/uid_sys_stats.c:38:12: sparse: sparse: symbol 'uid_lock' was
 not declared. Should it be static?
Message-ID: <202312051457.rhClc8qh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   a311190c255a5d2b1b6e3ccf6bd253fcccfb85e3
commit: 12a9da385ea1aa9eac634160c84c7b2285225da9 [1/2] ANDROID: uid_sys_stat: split the global lock uid_lock to the fine-grained locks for each hlist in hash_table.
config: i386-randconfig-r131-20231205 (https://download.01.org/0day-ci/archive/20231205/202312051457.rhClc8qh-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051457.rhClc8qh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051457.rhClc8qh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/misc/uid_sys_stats.c:38:12: sparse: sparse: symbol 'uid_lock' was not declared. Should it be static?

vim +/uid_lock +38 drivers/misc/uid_sys_stats.c

    31	
    32	#define UID_HASH_BITS	10
    33	#define UID_HASH_NUMS	(1 << UID_HASH_BITS)
  > 34	DECLARE_HASHTABLE(hash_table, UID_HASH_BITS);
    35	/*
    36	 * uid_lock[bkt] ensure consistency of hash_table[bkt]
    37	 */
  > 38	spinlock_t uid_lock[UID_HASH_NUMS];
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
