Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E03049C4B3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 14:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790950776; cv=none; b=ochwHPkbamwp17PlZcCeypTFZT4TZuouhSt3eyvDi4TqjcJYm4RCiP4PXR9KcGrgkeEJbvuAco0uW2Xy8tDN/uw60q9VHOKnVe5WJmds0K+hBHKgxnk2cwRcNL515txZhOgQK3bn0mLEz5HZ9V7CTpkR1VosgrSyLEUM7NWgURQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790950776; c=relaxed/simple;
	bh=3qxtCv99K1I9RBz9/AMEpl42sODIDvyjdro5zIHEJSo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qUi46F/nO1aZvXZgRU0FSD6N817OLkn5i6rh9ehabBmwhGjAwvPUFsNPGCxQ8r5SfxwNWLoktNh1rlZ3bOokYUx9FVEaPpj871B292OxUc/VOe2rQ4Nz1bvWuFhnwcUxPTGOpajlLSk0Nin/D5uFHQEh/Moy4BcrqPie9kx202I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yq80g71r; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yq80g71r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790950774; x=1822486774;
  h=date:from:to:cc:subject:message-id;
  bh=3qxtCv99K1I9RBz9/AMEpl42sODIDvyjdro5zIHEJSo=;
  b=Yq80g71rUeb7u6IQGQVqzNrUWnwMfG2v2UXsEi2vXBG0iYZjmsPGwLEF
   UEV1PhDt9ev94z+DJWhJy9RmtAczyWRqosEJVMWrkr/5EzXTO1XehtkrJ
   DnsVtPLvUfnBEx3XvZO56RsHOU9rKHPXBK2j9H8dQIehtjsMV7BGg+tP8
   6ndj0voOiSWl9NtxPUvZyu950hbQaD28EqV/u4cQeR0anXy4qzycbnCqw
   yzCqr8hEooYcNUY1YL5DNkLV3yVhNOUwPtjapcXqY7Qh5vJe+NSibbbNa
   zuh81DBV+CHYl6BvL/0Y+vay4dtoo2ebWg2rOC96KMetfgwlICDPiL5Qn
   w==;
X-CSE-ConnectionGUID: soWLzYc/TfuiH1pJtOXilQ==
X-CSE-MsgGUID: RKM6OtJWS8SGg0PMWnvHFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="95530501"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="95530501"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 07:19:33 -0700
X-CSE-ConnectionGUID: Pp4xrnDDTlaubgCpCevhyA==
X-CSE-MsgGUID: MFAgZ3pVQpq35Y18XHVUrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="280999135"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 02 Oct 2026 07:19:32 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCe6k-000000000ZT-1mIJ;
	Fri, 02 Oct 2026 14:19:30 +0000
Date: Fri, 02 Oct 2026 16:18:42 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15-2026-10 0/3]
 mm/pgsize_migration.c:22:1: sparse: sparse: symbol 'pgsize_migration_enabled'
 was not declared. Should it be static?
Message-ID: <202610021646.jVE59uJS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-5.15-2026-10
head:   afaaa030ccf44c4ee1b97f22b8e463db7257ee7c
commit: 9274c308d8469e26a5f3fb8b598000edcff6b135 [0/3] ANDROID: 16K: Introduce /sys/kernel/mm/pgsize_miration/enabled
config: x86_64-randconfig-2301-20261002 (https://download.01.org/0day-ci/archive/20261002/202610021646.jVE59uJS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021646.jVE59uJS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021646.jVE59uJS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/pgsize_migration.c:22:1: sparse: sparse: symbol 'pgsize_migration_enabled' was not declared. Should it be static?

vim +/pgsize_migration_enabled +22 mm/pgsize_migration.c

    19	
    20	#ifdef CONFIG_64BIT
    21	#if PAGE_SIZE == SZ_4K
  > 22	DEFINE_STATIC_KEY_TRUE(pgsize_migration_enabled);
    23	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
