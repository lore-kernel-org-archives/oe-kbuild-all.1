Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B793A1B5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 05:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719983829; cv=none; b=oVOqgQBY2JRi8JnCZV4GROeHvGszqDxpclKmEKN607OaN7mUvXDWHlIC7OqLROj3IyaoJqYrvsP/xPwVGt81sx9eBlLv1Jph3MHL7f+0rddGu2XDA2TYeJAlX6fTrp4CWHtggx/3ZLM4yFeq5BePprx0xzmU8KziWPbNLomvNJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719983829; c=relaxed/simple;
	bh=0pvbqISnxC0JUgSbqTGi7XvgChbFGdIQxt041rIJMdw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qBk69b8lRE7hG57gs6B0PMP2f3kU7DMihcW1KU5af5SrOs+vcevN8o4MvsMSKuWSJrJuyam4FrLm2YzFfn+31XEU1DgtQz8Qgp1EcL7UE8aomQz5Y0hTH2Iir7d1WEUBK9DawjhwQEc3Urh4H0oveuZEJdgZL+BgNeijbd+iFxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C5VR0ASD; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5VR0ASD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719983827; x=1751519827;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0pvbqISnxC0JUgSbqTGi7XvgChbFGdIQxt041rIJMdw=;
  b=C5VR0ASDdKF5YDIswb/vyfzyAzXjwZNttINDNGQmV6nltAEE/U2XmHAq
   Zk5oRVKS9qgp7GzVGNH/XGPfRzBzYQIXDeFERf0Iaw8B6fTln/Hqb4vRU
   GBvoCrSpWRGBoi8xx1prFPidfx0984/LBCuyaHC/P4zgN0cdrvktnlB+7
   Am4GxxgmGKEzMucacMNoODQL7xkJ4I8CIGd2kuO/2FmPfcSuCXQD89dAT
   RLVHPJyIL3tue8RBHB4RJ+cGV4oNhyxKF+wztwNSwlh40hbaz+f3Odziu
   eZnf70iShaE7MDroljnmER+HYxlkQmQWBpFh8khkgJnga+m+7KxBf9Ssb
   w==;
X-CSE-ConnectionGUID: GYQwGEY8ScylhtLAqRX70w==
X-CSE-MsgGUID: HrnaOTWzSO23EhnVUjkWvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="21001764"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="21001764"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 22:17:06 -0700
X-CSE-ConnectionGUID: +BiwgGlCS3S5g3Fl6eSOmg==
X-CSE-MsgGUID: wgssE7nzRBK+QyxATM01kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="45909964"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Jul 2024 22:17:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOsMZ-000PJK-0S;
	Wed, 03 Jul 2024 05:17:03 +0000
Date: Wed, 3 Jul 2024 13:16:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:timestats-hoist 170/296] ld.lld: error: undefined
 symbol: xfs_rtinode_create_path
Message-ID: <202407031347.nrVQHvLu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-hoist
head:   cdef340b918b477040a1837334c73ee13d833ce4
commit: b50bec771c0c06fc04539f5291e849ee844e7ddf [170/296] xfs: scrub the metadir path of rt rmap btree files
config: arm64-randconfig-001-20240703 (https://download.01.org/0day-ci/archive/20240703/202407031347.nrVQHvLu-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407031347.nrVQHvLu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407031347.nrVQHvLu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xfs_rtinode_create_path
   >>> referenced by metapath.c
   >>>               fs/xfs/scrub/metapath.o:(xchk_setup_metapath) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
