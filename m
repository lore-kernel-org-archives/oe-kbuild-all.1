Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78D0221546
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 13:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766410143; cv=none; b=NpvMCaCzShW5Fna7XtHlSE4einUO1UYisE/o9v9kK0FD4qvR4aEI4djbD89w8hjkTBNm9OB05z+ViOIiIedPlyIgxkAdmhA0PvfN96dRst5VaWy6Yo1srdIJO9ojLAAVuz6OxJWsvNOr0NjuWPrtfdKJKQ/EMYGc/rIu2QTPiUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766410143; c=relaxed/simple;
	bh=zLszbwHUFBJUOJh1yovjzIRoFEVtAkoWB1FLU5cjZQs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u5GLVEVMZuA30gBRiPtK42ZCIxV9j6JkIHYIkM+k1wuTf15Mdh21T8RgHD7bzCHtqTfIZGk21cJNuavbMmeKPk3yK4qPuABHJRx/4JvOh75Dlp3eiqd+NHac+OaTzzbsu3TgfIVKJQjQcZFtP0aBzWbo8pBHm66ByhsFBEKXMYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b4D42ZKQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b4D42ZKQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766410142; x=1797946142;
  h=date:from:to:cc:subject:message-id;
  bh=zLszbwHUFBJUOJh1yovjzIRoFEVtAkoWB1FLU5cjZQs=;
  b=b4D42ZKQLvbxMBY53w2yeyAqMLYu2x3BpPxLFNye9jueSiczXZ3gpq/M
   3788RTLtP64tc/XT4dimDmrGRxbhdGvkhB2nvedMQr/A+qmveWhs9AEFB
   LH/iTgF1FUcS0NKniKeWBktCoUEat0DwCpdLIXEiQzMoCIQJ/e9HQCh4O
   pO5CmZDKYHLUlrWzKUWPXUz+/RvXHDg2W3NYX0dXH8D660GI4wg2bbcK8
   Qsf/WsuYaN8VICa/rf3VGmuUNWypJmZORWLgjy7ymfI74c8z2+FvS48gV
   CZ8cbMdOSPNRUxajXRPAwSJ/Ti0z7/s5Eabn6COPeE2+moemWEpXcghPZ
   g==;
X-CSE-ConnectionGUID: RA7dvmw0TUKDN0DPfqVIRw==
X-CSE-MsgGUID: npJPHWDNQ3aZIzygpNDXMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68306862"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="68306862"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 05:29:01 -0800
X-CSE-ConnectionGUID: 0+/8+OOAQ2OH9DaoiGuAlw==
X-CSE-MsgGUID: DlQKvOQMSr6Sn18kLkEtaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="204581569"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 22 Dec 2025 05:29:00 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXfy1-000000000cz-2zZl;
	Mon, 22 Dec 2025 13:28:54 +0000
Date: Mon, 22 Dec 2025 21:28:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 458/458]
 drivers/of/unittest.c:131:31: warning: 'unittest_gpio_driver' defined but not
 used
Message-ID: <202512222151.17DigM2T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Frank,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   8cc11e1aa30fd981a8d5bd390a4352c37dfe543e
commit: f6997a2416b028f369af5b859e4115fa6f56e4d5 [458/458] of: unittest: add overlay gpio test to catch gpio hog problem
config: arm64-randconfig-r073-20251216 (https://download.01.org/0day-ci/archive/20251222/202512222151.17DigM2T-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512222151.17DigM2T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512222151.17DigM2T-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/of/unittest.c:131:31: warning: 'unittest_gpio_driver' defined but not used [-Wunused-variable]
     131 | static struct platform_driver unittest_gpio_driver = {
         |                               ^~~~~~~~~~~~~~~~~~~~


vim +/unittest_gpio_driver +131 drivers/of/unittest.c

   130	
 > 131	static struct platform_driver unittest_gpio_driver = {
   132		.probe	= unittest_gpio_probe,
   133		.remove	= unittest_gpio_remove,
   134		.driver	= {
   135			.name		= "unittest-gpio",
   136			.of_match_table	= of_match_ptr(unittest_gpio_id),
   137		},
   138	};
   139	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
