Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0578813B2B8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 16:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736441863; cv=none; b=Mt8FrkXa9NuQeT1Oh9G0cY7IKwrZsPAVSUHWeORr/1tp9A6ob5iILP380s1gAw+LRok/Iis9f01X4BQHwCsXtqjYmG/sgIcb4uqeAbOEAtfsP/ewKHsZP60JPnqht2Gn1TCfpHxrVLNUSvMC7duz0t7xAkpoP9M2kAf8c+M7vNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736441863; c=relaxed/simple;
	bh=nDPNi3SIy3/cvFiElDJlfX1ylxpZ+7OZNS6RIe4UYzo=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KyOzFypzr9ViIO0p+nmQW92FJh2ufkanmh3zIjeijDX2oOtW18VFBqrJaom/DnrCATLZekksZ4SMP3UM6EIv/nCrZMstNxC1wX1yeFu1GRL610mfnzuc3E0rokpZye26W4sNSdE7Cnr7ZCDv1rcvpGoxyZ2DyYGEzcBkRGVdHNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bNr9Ydxs; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bNr9Ydxs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736441862; x=1767977862;
  h=date:from:cc:subject:message-id:mime-version;
  bh=nDPNi3SIy3/cvFiElDJlfX1ylxpZ+7OZNS6RIe4UYzo=;
  b=bNr9Ydxss6PeIYXnSHOD2hr8RjXtJ+UHWtgbicwFQ2xq/FmVybz7Q7id
   qU39aXq5Fyvb17NkUCKA1Tbgl5jivnTtvo0/THAYYvQbtWXawWiXt6+K/
   sWdhVMT9okYzys9MNjlwB8DWPCUOz8fFStGKCDLbZ9uDCfsF5D+OpwVxP
   91zEaUoH8nny+VtbfAXKPVOXRD5UdT/QSj8T8S3LtIUqbtPs9qI6LqXtY
   nMRfNdXfGbE0puESaz1+UF9BYpT0aXhU0Xu+hS+5P9aqYkDZHVfuytTCe
   MqlV6WdSilJLoUEhNBuuRV6OfqVrkRX07DLbBei9dsiQ5N2MDyzJJHvP5
   w==;
X-CSE-ConnectionGUID: mtmcuAxpSA2lM/jb2gn4kg==
X-CSE-MsgGUID: 6qqRG/qMRI28e8RRAI4hag==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="35940565"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="35940565"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 08:57:39 -0800
X-CSE-ConnectionGUID: E/Jtb/QnRqOwETeqac80RQ==
X-CSE-MsgGUID: urgusgMIQki/bxhn/EQ1RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104341864"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jan 2025 08:57:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVvqh-000Ht1-0x;
	Thu, 09 Jan 2025 16:57:35 +0000
Date: Fri, 10 Jan 2025 00:56:49 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, matttbe@kernel.org
Subject: .b4-config: warning: ignored by one of the .gitignore files
Message-ID: <202501100027.NH8rMARU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/matttbe/net-next.git b4/mptcp-issue-368-selftests-old-kernels
head:   71ffa0bf649c2228f63bcb4633c8b02bb2b266af
commit: 5594e5a006750d92f1e9a508411d6e82bb574ea4 tgupdate: merge net-next into t/DO-NOT-MERGE-git-markup-net-next base
date:   1 year, 10 months ago
config: powerpc64-randconfig-r111-20250109 (https://download.01.org/0day-ci/archive/20250110/202501100027.NH8rMARU-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250110/202501100027.NH8rMARU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501100027.NH8rMARU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .b4-config: warning: ignored by one of the .gitignore files
   .cirrus.yml: warning: ignored by one of the .gitignore files
   .git_markup: warning: ignored by one of the .gitignore files
   .github/workflows/build-validation.yml: warning: ignored by one of the .gitignore files
   .github/workflows/checkpatch.yml: warning: ignored by one of the .gitignore files
   .github/workflows/notif.yml: warning: ignored by one of the .gitignore files
   .github/workflows/update-tg-tree.yml: warning: ignored by one of the .gitignore files
   drivers/clk/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/gpu/drm/tests/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/gpu/drm/vc4/tests/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/hid/.kunitconfig: warning: ignored by one of the .gitignore files
   fs/ext4/.kunitconfig: warning: ignored by one of the .gitignore files
   fs/fat/.kunitconfig: warning: ignored by one of the .gitignore files
   kernel/kcsan/.kunitconfig: warning: ignored by one of the .gitignore files
   lib/kunit/.kunitconfig: warning: ignored by one of the .gitignore files
   mm/kfence/.kunitconfig: warning: ignored by one of the .gitignore files
   net/sunrpc/.kunitconfig: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
