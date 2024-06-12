Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C3484A22
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 08:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718181171; cv=none; b=tUuZV+XAUx5AkYcUkEGgCywxis1ja/su73dfafKmN0BVfX16XD1mv0yaDyFJ1DYKiTgJwQWlvEuiZCiYr3zWTzC2+hxkPAvdivmCRgvAIETZJO8FRFmEoDm1bbaIWQChqnmVCAbnyzafSiAR5Y8DMcPm2WL20UNpQH/JXjpyxGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718181171; c=relaxed/simple;
	bh=3+v/jwqxvY4HcsXAGyjvk7XAuLb9Q+MPeMTSwSg3Gjs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XFwp1kIohWgAp8AEIxp4GdThuEDF8gYRTn4eWDV2hYZLQ8wuJ69UDv8YEJebspzbqyxq6vdCMg/TA4u57w4YIkydIDHB8pw5cVRyR/ecMvvqTsxOGVIaWWi5eJnAS6XYpFU4uPNrCuQjljQml18Wrys+xfx0QfP5mikwlbnMPQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CKcOvxKL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CKcOvxKL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718181170; x=1749717170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3+v/jwqxvY4HcsXAGyjvk7XAuLb9Q+MPeMTSwSg3Gjs=;
  b=CKcOvxKLoqjP4S13dTUCSj92YiDep2IFdhIKFtrUDEEprqg8Fh8jSb7K
   q6eoT4mYX5iLRM/v07109fHL/qTG5v7AUKx4bMEfY+XPXxrSSmpIa6xA1
   KogpWtHugVT/9avJQNFksMEcTraOV+RQNZXpNniaMy6lmkEHC5mtPqSOA
   QF1EpzAi5ThhEj+6aNPVDz1lH6WoXidgIdZVNUg2giqyMPbSxRwn8ODUm
   yPU65i04Q9Vag8kH/mqZCafDftC5hLNhqjGs4ShDMWWL1dkwmA9mx4/Be
   CYU4AECKbmcjl6eUZ63zkYC3677iW6dFKrRRYb4OYdmsqq9Sane+qyVqM
   w==;
X-CSE-ConnectionGUID: twkf0oDoT+a0mbKa27Ujpg==
X-CSE-MsgGUID: A7FDfAakTayhsIVBoUJUpw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="18711094"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="18711094"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 01:32:40 -0700
X-CSE-ConnectionGUID: yF0AgN7XTsWbjSOXQWkeUQ==
X-CSE-MsgGUID: dTzdKCsqR/icdYqUwpvYSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="40184564"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Jun 2024 01:32:40 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHJPJ-0001N2-0L;
	Wed, 12 Jun 2024 08:32:37 +0000
Date: Wed, 12 Jun 2024 16:32:27 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 1/3] klp-test-oneline.patch: warning: ignored
 by one of the .gitignore files
Message-ID: <202406121612.dtzNX0iv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   8d7a4a25d5c44f7e03ab4145e1957f0b0cdb8c13
commit: 2b5c0e4bee32aa92e186b0fc146d728f2715d01a [1/3] tests
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240612/202406121612.dtzNX0iv-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406121612.dtzNX0iv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406121612.dtzNX0iv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> klp-test-oneline.patch: warning: ignored by one of the .gitignore files
>> klp-test.patch: warning: ignored by one of the .gitignore files
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
