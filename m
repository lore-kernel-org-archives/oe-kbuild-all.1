Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF843815CB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 06:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782281604; cv=none; b=dU2rhFukq2tnxBp/zH+ZM8sfDE7UyLrlkfYg5k2cOmTbprjLSt8PfpUmHjnwXlVOXd2DZ6nbX8VAcOaRWeu61t613kiDQSeM5s1dvSvU3nhFBahw0W28I3oYcHUrqcrACVZOXsc+rEdjJiwm7TmrcI1jPXUfUX0wp7jtmcUZb6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782281604; c=relaxed/simple;
	bh=Sqfy7phQQQ3/VB87h2CcGOCN60y4eeWiWKaYQod6Ngg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XtVyWbd6qGO8D9mUBRggeI6B53tlwzsdcyFfOX8bj9Lhp8SmDBdZb50F/Rg2uHrYKRBV4TNTHtcKNkSlR46F2eUfCTpO3rRZj4WzZJ0mUzqELggRv1oY8f7kgMWGdF+09FNM4qLcFAsyaHWzUzGf25gl/+h4MLLU7cIZMnyxXo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S3mbBBsg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S3mbBBsg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782281604; x=1813817604;
  h=date:from:to:cc:subject:message-id;
  bh=Sqfy7phQQQ3/VB87h2CcGOCN60y4eeWiWKaYQod6Ngg=;
  b=S3mbBBsgZMULmgLWaSmXywv5caC4f/WFdVtbAADjNSriLCmU3zCcKEiH
   3iVw6j2lA05HHdILAAdg19cz/iyPHmtBTdqVfksbqWPm9AAhpzq7VRnJi
   tsllYAx3bbEzjPFIxPqpWyT+EN/gIyxVR8ibg7YT+73JLl/sFjBR6Yh8b
   FMBvHVWCQf1EXe3Z2irCDFSYpIjNNNK8yspLYEO+xhvCC1lEmaVOZH8+C
   Yc7KF2gk599kU07tWw5CgxQ8aXYrhqoQAv/XuJCWUOpm+VbRuh6+OIlNb
   04+BOJLWgiymu+MITBp4V5jZ2oRZUrHBEYs7hjd7xyl36B18n2783/JQV
   g==;
X-CSE-ConnectionGUID: y2M0V1byTjOkrV4l81VRlQ==
X-CSE-MsgGUID: 8GLxH5v1RiSp2xefjnutSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82149757"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="82149757"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 23:13:23 -0700
X-CSE-ConnectionGUID: pMucKeOCR9CS5t3SmDiQXw==
X-CSE-MsgGUID: 6QGktpm/Rj6QVeIzF/oR6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="249842637"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 23 Jun 2026 23:13:22 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcGrP-000000003AD-03UV;
	Wed, 24 Jun 2026 06:13:19 +0000
Date: Wed, 24 Jun 2026 14:13:16 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:cleanups 27/36] ERROR: modpost: "get_cycles"
 [crypto/jitterentropy_rng.ko] undefined!
Message-ID: <202606241433.lriZrPZB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git cleanups
head:   759e4e4e18f43902ea6f66c481a45175490cad0c
commit: 40a20664258cea1922057378f1e03c10508a89a4 [27/36] nios2: Select ARCH_HAS_RANDOM_ENTROPY
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260624/202606241433.lriZrPZB-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606241433.lriZrPZB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606241433.lriZrPZB-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "get_cycles" [crypto/jitterentropy_rng.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
