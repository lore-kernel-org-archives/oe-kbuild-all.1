Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDB21A9FBC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 15:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781363927; cv=none; b=YA0JLCqpSFFh/MCFI9M2znv/WJN0mojNxtSkm0BQ3v6qI8kAAtVpbBKTfwgWcLArEnk7PuTe4/4t60YQOf7f8Q5/d+tukUTJcjxca9Xz44zU6Fb+Sc6jPQg9bN0QupsXLkpfuYCJ298Ranc6t7PGjhR6JW3Vu8CeBPExu9q79Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781363927; c=relaxed/simple;
	bh=MS5zET/erSuQw0fiZgMDUkQjekyuCPMwj9SG2FxK3rg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dy1C+CzpahnBSJvD7qu25GTHbHigXan8EKtEwMuBhOT3QvWFt19HTBKUZCg+z3Y4V9KhC2Ru4m0oWPpb3i7+lS7KlDHBEn52PFUQUZIlz+gS9aO4o4QgXWjje77QZzYDV5i4JJqt5WkAUoLTSxrBJs97W72OlZtzqKOEIcQQizY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ImvIBihw; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ImvIBihw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781363925; x=1812899925;
  h=date:from:to:cc:subject:message-id;
  bh=MS5zET/erSuQw0fiZgMDUkQjekyuCPMwj9SG2FxK3rg=;
  b=ImvIBihw7vjIn13ToFuEuSjlGetFZPfXEjBckoSzvzvzvfGNg9t+6x/Q
   96i1cG3XEnsjBSOlE3IvFfRjK3PXJAezVeMtWopUL4EdzNbkyjdbHgNmT
   0zdjFrt0nFTFnc/vX8BFtTl90xqtnEaz6st/q1bBKs3kMTAFkfo7+QCIQ
   /cjMf53ZoarEco9/izrUYvo8i4tvkGOqMfIcq5R840NgmlxDCAmCgKdpE
   nc6KKhvM7aFuCMwcs05i6yVlgNEMfkxXx+iESWK4W2p5KlO7oOITrNb3+
   1iAt48vYBjIgeK6dthMOYibCjLZk7y/iyrG1LxdnrastCuF1Wj9VInzOM
   g==;
X-CSE-ConnectionGUID: GzhGWia1QUCJx5vR+PeTUA==
X-CSE-MsgGUID: 1a83gTkCRIOiteBA4zdvjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="81185223"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="81185223"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 08:18:45 -0700
X-CSE-ConnectionGUID: s8VIp5qjTUihyLYbQp32Ng==
X-CSE-MsgGUID: rtcmayNOTIOiUPvCptDACQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="242926915"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Jun 2026 08:18:43 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYQ88-00000000PzS-3AjX;
	Sat, 13 Jun 2026 15:18:40 +0000
Date: Sat, 13 Jun 2026 23:18:08 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:config-gpio-legacy-7.2 21/21]
 include/linux/gpio/consumer.h:178:1: warning: control reaches end of non-void
 function
Message-ID: <202606132320.SFaCHD1y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git config-gpio-legacy-7.2
head:   24fae1df029804f4339484870fcdc70fe15fab97
commit: 24fae1df029804f4339484870fcdc70fe15fab97 [21/21] gpiolib: introduce gpio_name() helper
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260613/202606132320.SFaCHD1y-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606132320.SFaCHD1y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606132320.SFaCHD1y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpio/gpio-aggregator.c:30:
   include/linux/gpio/consumer.h: In function 'gpiod_name':
   include/linux/gpio/consumer.h:177:27: error: invalid use of undefined type 'const struct gpio_desc'
     177 |         return desc ? desc->name : "(no gpio)";
         |                           ^~
>> include/linux/gpio/consumer.h:178:1: warning: control reaches end of non-void function [-Wreturn-type]
     178 | }
         | ^


vim +178 include/linux/gpio/consumer.h

   174	
   175	static inline const char *gpiod_name(const struct gpio_desc *desc)
   176	{
   177		return desc ? desc->name : "(no gpio)";
 > 178	}
   179	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
