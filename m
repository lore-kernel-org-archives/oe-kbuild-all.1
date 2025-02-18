Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA71522CBD0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 12:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739880552; cv=none; b=fb8rdraoMYrIhjtB5d9dwX3VyFFc/ejI7E3DWE1YQJLyjhbf1Fuy2boC/7R2iOKrKmUqi2KlB8MVIRoHp3zLv2N1I79FlN6fSVcFSMGeYJMjgJlfzdE3ZgLQ+2pm3byBYT4uMW35stRgHtqziMSEDjFID9LT7D8VkB0/277DqMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739880552; c=relaxed/simple;
	bh=J0W39mN13MuDAIsHd/Osp7pR5uUDxf+hoTk1uQGS3ec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WvYmVauxaSlsC//y7IHyhENDs6OOfim+PMFKXN4vb5RYoIeJ0XKHt6zXK7oH+Dv09FAbxx6ojSO9CNnnuwvX5+cW6h5VYrhvf4ArTSNyEYEuM7BzI0MuDZVSIYP2KxQ9FzSEC8Yaw72oW6Nv9BfdMsaHVQXlfUlSJjXp9+g9zOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NFoxrGST; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NFoxrGST"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739880550; x=1771416550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J0W39mN13MuDAIsHd/Osp7pR5uUDxf+hoTk1uQGS3ec=;
  b=NFoxrGSTMIWXABxFppwg+p9M9uujhVsYFI5rwdgLnWl1/aoSbgAOA7gB
   qGSa41XAdxYguBFZ+/QQuLGwfYORVC5uCMQSs33zhu6s/1pGR2YcbpyT6
   Of0qnhN5dxiwwGaX6ZoBcPYWVE7c5F9yHS/r0uPZkwfqUebvw78uOODpm
   2gzZfYcwRN4c31hdWwDrUQby3y+bhKSCPQyybBU6+15peA3IbGFnuuvt+
   yK3TR4wGAd5XZ7QGdI6GJj2P4FMzc9DU+8SiEVVG8o2k39eWARQnM0ZtM
   Jtvimib+2pVLuCZ9BnsunOCjo9SG+QbLh4zqzk7sFO7TQn+/HCHjpqxBd
   w==;
X-CSE-ConnectionGUID: CQ2eUPyTRt+5RWoMr8H80Q==
X-CSE-MsgGUID: pxoR5iGnThK0HhRYLbZwwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="39806390"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; 
   d="scan'208";a="39806390"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 04:09:09 -0800
X-CSE-ConnectionGUID: 0kcAoeGDSTicGF50sWtAtQ==
X-CSE-MsgGUID: 3C6vvLmgSzmncgxFgqjkMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; 
   d="scan'208";a="114579738"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 18 Feb 2025 04:09:08 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkMPP-0000Ux-0K;
	Tue, 18 Feb 2025 12:09:04 +0000
Date: Tue, 18 Feb 2025 20:08:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1] mm/pgsize_migration.c:22:1:
 sparse: sparse: symbol 'pgsize_migration_enabled' was not declared. Should
 it be static?
Message-ID: <202502181937.5ZuJDhe6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   fab059ac4661e793d04e84d10f1831cbbd835418
commit: 096a5b61301dde0bb343d30ebd4cf1f8631820b1 [0/1] ANDROID: 16K: Introduce /sys/kernel/mm/pgsize_miration/enabled
config: x86_64-randconfig-122-20250218 (https://download.01.org/0day-ci/archive/20250218/202502181937.5ZuJDhe6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502181937.5ZuJDhe6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502181937.5ZuJDhe6-lkp@intel.com/

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
