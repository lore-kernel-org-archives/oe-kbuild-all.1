Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C4C179BF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 14:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731768636; cv=none; b=s/cNMsViereD7sO3lUTJmulyTx52A9051f4udOEfVVR8Jq6s6wDfqAzWGUv+7NEFXDkfCpT3Br95erkJ0HDy7bZt4avTr7jjZR7qOxIKGXUFxsogOPYZFxu2DEmHbJHINonEmeOWYr916STZKYTWl0ZbUCN/z6SmnKpdqGBZoec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731768636; c=relaxed/simple;
	bh=UbnQBVI4zKoG2WT62JJDDuaEa5FF4/VB6bysrsYvW/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e0Ek1BiRP4jr6r8pKEOpZLctpPkfRp9CK/9cRBRHInSUvWQkkPSjZH8XU6N13ZVvL5V3Sn5fT9OztaL23qXRAJzkbxC8wqSjgHxLu1HoZMlVYkr23MvEL0hq59bttFJF5dbhJwgS6lmOonnhhbVt3iMvVL6SHOcVbDwd4zweRWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PGA+uiN0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PGA+uiN0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731768634; x=1763304634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UbnQBVI4zKoG2WT62JJDDuaEa5FF4/VB6bysrsYvW/A=;
  b=PGA+uiN0VcHVZqlvBqFoafq3NFkN1SpC1niz+orQTIA1e/IbjwZviYHn
   kC/Cde5znEhVJ6jF6rM2wZsL34xYofW1PIRuxEcse1Wnuy9Tz2/eXX8L/
   zieXUiqbfPFqGbUAi0e1PxTIvgpOomz7jSP5QXuN0Q75LnMyendC6C9dm
   xTMVjsX93LGWGic1XCMV8QyNwDgis54wjpT5qjN964tYKAAB8YZdZDsYm
   TrV13gyrTNsdmybAKTU/GHypC3jLo7qLqat6DAIwpnccb4Mk/ZDW5u1lH
   8Ezmfw7AZZvlqs36hLFfOMm1+YFhTCOOZJorTBILy8Csoi3WgK7Ups1nd
   g==;
X-CSE-ConnectionGUID: E3s7vGAFRn+MnttxX+qyRA==
X-CSE-MsgGUID: mZZQnl5mRImwCTstHfbBXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="49197533"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="49197533"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 06:50:33 -0800
X-CSE-ConnectionGUID: /gUC7QobQ+u5UNq0A23G4g==
X-CSE-MsgGUID: 4DHiOXLMTL2Z7ze6qr+wQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="88711492"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Nov 2024 06:50:33 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCK85-0000ib-38;
	Sat, 16 Nov 2024 14:50:29 +0000
Date: Sat, 16 Nov 2024 22:49:31 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?unknown-8bit?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-bin_attr-group 2/3]
 drivers/perf/arm-ni.c:248:63: warning: missing braces around initializer
Message-ID: <202411161406.eK0iAbV4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-bin_attr-group
head:   315538f2d9277d8f786f5c756aedff389fc09195
commit: e4b00ba70c2569fa2c00eb354c97543a94cc9f64 [2/3] sysfs: attribute_group: allow registration of const bin_attribute
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241116/202411161406.eK0iAbV4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241116/202411161406.eK0iAbV4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411161406.eK0iAbV4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/perf/arm-ni.c:248:63: warning: missing braces around initializer [-Wmissing-braces]
     248 | static const struct attribute_group arm_ni_other_attr_group = {
         |                                                               ^


vim +248 drivers/perf/arm-ni.c

4d5a7680f2b4d0 Robin Murphy 2024-09-04  247  
4d5a7680f2b4d0 Robin Murphy 2024-09-04 @248  static const struct attribute_group arm_ni_other_attr_group = {
4d5a7680f2b4d0 Robin Murphy 2024-09-04  249  	.attrs = arm_ni_other_attrs,
4d5a7680f2b4d0 Robin Murphy 2024-09-04  250  	NULL
4d5a7680f2b4d0 Robin Murphy 2024-09-04  251  };
4d5a7680f2b4d0 Robin Murphy 2024-09-04  252  

:::::: The code at line 248 was first introduced by commit
:::::: 4d5a7680f2b4d0c2955e1d9f9a594b050d637436 perf: Add driver for Arm NI-700 interconnect PMU

:::::: TO: Robin Murphy <robin.murphy@arm.com>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
