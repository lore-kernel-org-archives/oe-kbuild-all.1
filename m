Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C53D45D5ED
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Aug 2026 21:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786139945; cv=none; b=XWNBw2yM1Ws27mBsd7Nc3KR5tvUdamAzwZvShy7+tTRnjHXNZlohgtwddIluQMW9ootgEJHm+Xab1/KL5sDxUEEv+WvMSTtktJAbXwyfhqWliyNSd3WIQUSUdOgdEarWNvapBRvk6zdtg0HlsCtFVTlHohR8oy8uBK8qJQiU92A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786139945; c=relaxed/simple;
	bh=BtAFuGCw5uALWXuwYluPReHM4j9g1JccktriCiuQJDk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mzc+etYFnXHsYWP8CFjgAf5I+nEhOqmGIWd5KHs7ZzA5lNaeNzX+QGCfP1B2FexGwDIJOGNMAv0r3gV363FbNjfUfy2Xmdh18T3DEVZGTjVbIqUBLI22KDvTUs4yn0svqQ83fXH2IbJ0qpMLqxDOmVbZF383a/05QbSBbo0cWCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lqh0ukPh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lqh0ukPh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786139944; x=1817675944;
  h=date:from:to:cc:subject:message-id;
  bh=BtAFuGCw5uALWXuwYluPReHM4j9g1JccktriCiuQJDk=;
  b=lqh0ukPhm8SDpSUIpuKz2NwzpgOIBRQvkzXuSubuo3uatnHgzUkBGWq0
   K8Xj4+NmJU2VCrWpXhygzAOxfPD/xBozUZL2m5W3+ELSsNflksaC8zraa
   1HOsCP6cYOTvnvBvVijXqKm7X3rR0mFFPsYl2mfoKREM9e0MoyMMVKmP8
   JcUotgiQFaXuMYLW/zuLcLreEsjcvh8kOuYJEYvVkKyHVvM3LeKq2yYZ3
   KyoJbIJAK2hKETA8P1GKVXXJBRE5+7RtxF/3F59uYUIqb6ZvrydtQOp5C
   YNGzultKUNgDA/L6YQWtB0QPsu2f+RAHnF8/99ND0OT3VL1h1GPve8UY4
   Q==;
X-CSE-ConnectionGUID: DME3ryPGS2GJQRBBNJtxjA==
X-CSE-MsgGUID: BZXNiwwHRDqEirmyA4kNxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="112302719"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="112302719"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 14:59:03 -0700
X-CSE-ConnectionGUID: qUV6FrwjS/e8R3YoLEinaA==
X-CSE-MsgGUID: lgOznmo+RayxMCLUVwJC3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="287198454"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Aug 2026 14:59:02 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsSai-00000000JM0-10s8;
	Fri, 07 Aug 2026 21:59:00 +0000
Date: Sat, 08 Aug 2026 05:58:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2025-12 34/34]
 drivers/misc/uid_sys_stats.c:38:12: sparse: sparse: symbol 'uid_lock' was not
 declared. Should it be static?
Message-ID: <202608080514.zkrswq93-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.15-2025-12
head:   2da3fa4adb2e7336d7e5a095c67b42582d4e54af
commit: c949fbdce0bc792dea206c709d909094be579c3a [34/34] ANDROID: uid_sys_stat: split the global lock uid_lock to the fine-grained locks for each hlist in hash_table.
config: arm64-randconfig-r122-20260807 (https://download.01.org/0day-ci/archive/20260808/202608080514.zkrswq93-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 12df34b8469b8095359de8c249cb1b2753fadeea)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260808/202608080514.zkrswq93-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608080514.zkrswq93-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/misc/uid_sys_stats.c:38:12: sparse: sparse: symbol 'uid_lock' was not declared. Should it be static?

vim +/uid_lock +38 drivers/misc/uid_sys_stats.c

    31	
    32	#define UID_HASH_BITS	10
    33	#define UID_HASH_NUMS	(1 << UID_HASH_BITS)
    34	DECLARE_HASHTABLE(hash_table, UID_HASH_BITS);
    35	/*
    36	 * uid_lock[bkt] ensure consistency of hash_table[bkt]
    37	 */
  > 38	spinlock_t uid_lock[UID_HASH_NUMS];
    39	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
