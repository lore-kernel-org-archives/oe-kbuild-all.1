Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C5115B132
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 12:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725797414; cv=none; b=F4YCtHo+wazCAq+zKdwmqxi6p+jXD9aaAxDH6PIJUML++JvVcKhoWeT0O5+WeH5NoMkaXLval9BARMXFvO/Zb9dPsUAOi6HgwkpNL/DqlBxJs9Wh/O4Y1HdNZ8vTU4rTKM4u06ELJMyYEsh7szieYl4RYBdSJrP1SPrzQcHjUy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725797414; c=relaxed/simple;
	bh=54FCAd9vTfP6SmF2jqC2wmIMiPrl4HEzTaIuYKOICyw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CXu7/s5B++O6RdBtq4ypoU2l0u8hoBgQSenqdPvXb2nadZsxA7D+2MEjnHP/jprj7ByDkRVqnFg6QfO2vmzOKBNqX0kxaqSUhZeBBoSaQxNEe9HraOEJhCZy673OZwDrjk0mPJ9iOAlyXdB+vQJeoJb8KLVr+OBgSwd/XNySYe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RMgdLUQ/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RMgdLUQ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725797413; x=1757333413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=54FCAd9vTfP6SmF2jqC2wmIMiPrl4HEzTaIuYKOICyw=;
  b=RMgdLUQ/h+GijpL5Ey/1iXJXY8om+bbvM/IKIqKb0GRq3lKEdAwNFPSF
   lXRGRYcyegfpLR1gyYxew4vpDDeDo2UQxAYV4Whpb7aLHQ4L2R40va5ih
   VAe9sv/APM9ITcYWk/5ZSOwiSgxVmq1SN/7KVTuodnSi1aKFUGPYVYFGw
   0brbSDgIy0cYyklM2q7zmpqMMtSxhx8AkikOG6yPQLfv4NfGkmnFht4xG
   hHWZbrlqFTrcSKgl2lyNE/05dS+nnor6JLt2dABKHwJMBJ7RsUhA18U55
   Hz1cvVR3xrkVY3Ij5E6nA2ji0BTvPo6Mo52LJ03zJ0ttvGKbDL0FQD5pM
   Q==;
X-CSE-ConnectionGUID: MojCWl51SrWJ9HzwxIc3Bw==
X-CSE-MsgGUID: 58yMt2GQSBmfiJs5VtiP0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="27419471"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="27419471"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 05:10:11 -0700
X-CSE-ConnectionGUID: UAxH+v+MQ+SnzqiceeFntg==
X-CSE-MsgGUID: Wx7uOKM9RZKU4ErfaQ/D8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="103860739"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Sep 2024 05:10:10 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snGk3-000DVR-2G;
	Sun, 08 Sep 2024 12:10:07 +0000
Date: Sun, 8 Sep 2024 20:09:08 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Hill <daniel@enemyplanet.geek.nz>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [koverstreet-bcachefs:bcachefs-garbage 224/258]
 .github/ISSUE_TEMPLATE/bug_report.md: warning: ignored by one of the
 .gitignore files
Message-ID: <202409082013.gB3LnMm3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-garbage
head:   c88c2220b6b527cec382f06a0ba3feab2a593b37
commit: cf0f2c4230f6e50e764c848635688c41f3a954f3 [224/258] Update issue templates
config: x86_64-sof-customedconfig-atom-defconfig (https://download.01.org/0day-ci/archive/20240908/202409082013.gB3LnMm3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409082013.gB3LnMm3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409082013.gB3LnMm3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .github/ISSUE_TEMPLATE/bug_report.md: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
