Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABACB33D4FF
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 17:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772992795; cv=none; b=K/Qltn7RcYZQkFxktBLphlUzf483/4sgdcviSBeQJfNcn+YTbSw7a1qlf+krWpiFdsRvrFWSUfNA8A7VO6lFgoau+0bXbOGR6Vfv0Pvl8n7S6VNX86iY1PH5ACpzXSsLeEcWO1Xf/fYWrNMwj5iSkVCJlfSTCyfBi/t5RKTvIQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772992795; c=relaxed/simple;
	bh=tjZVkUdKo8jnI/mwqd8EXhPYKxdHf0nKYdGZoyzMzPY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ortZqAvSvVBFi/B4qf5IzhtSGyAyHv8C1Q/lgiMqu54hsIJ+cREqTn4IPUZFYs+Xz0yDZcZ6Pi8XnHIW8bfJj/y+227Syut6tPfgC6nLGPYjWBsIqHtHPsUPMsVTrtFhZ1mN189NtY5Lk+K3K9l0Y5h6Sp/jU4snwZA9c0h98T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1iAMAl2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1iAMAl2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772992793; x=1804528793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tjZVkUdKo8jnI/mwqd8EXhPYKxdHf0nKYdGZoyzMzPY=;
  b=I1iAMAl2vUwQWK0bmidKqX/WDn1eCOVAUemOAJ6ugzIkRyIvzDoZcsMb
   GImrY4FLeEldWZf8Z+NoUB/3Rm63yiyP1qxdyLeS9RM1vBcTn+gRvhmgO
   SyidkGjFPty35Lmj8q+qX6ogatlNmhfHqsGv6pJdIeRZSLp1PnyJejXsj
   UACwM8I5XDiE7RWNc0pD6tfHfCYPXifCAkZj8H+udPA4ZFH4Knw/h4z7U
   dPVS3QyfdNcoMG95b1RU5CWyHPgjoinx87+iuFRaH/l0v4ojXrghI36CR
   I+Fd1yPVPr/dr76qL6Ub/RXCIPASDu4UDZ+mNdz0P1gJAhjGE5l1k5kDX
   g==;
X-CSE-ConnectionGUID: Rwk+/g+JSy+9VMdC3HHLKA==
X-CSE-MsgGUID: EIastepzSE6bjXoquJRYgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="84355037"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="84355037"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 10:59:52 -0700
X-CSE-ConnectionGUID: gRvTW/ciT2mPmdIFCc4pYQ==
X-CSE-MsgGUID: p5W6ZJ1rTwOHeTmEW7lZmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="218671373"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Mar 2026 10:59:50 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzIPs-000000003Ig-0i1S;
	Sun, 08 Mar 2026 17:59:48 +0000
Date: Mon, 09 Mar 2026 01:59:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/uapi-ucontext 2/2]
 arch/xtensa/kernel/signal.c:25:10: fatal error: asm/ucontext.h: No such file
 or directory
Message-ID: <202603090118.tEHs1C8Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/uapi-ucontext
head:   8cf410e00cbd455a58c0b306581463883bf7ab19
commit: 8cf410e00cbd455a58c0b306581463883bf7ab19 [2/2] ucontext
config: xtensa-allnoconfig (https://download.01.org/0day-ci/archive/20260309/202603090118.tEHs1C8Z-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603090118.tEHs1C8Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603090118.tEHs1C8Z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/xtensa/kernel/signal.c:25:10: fatal error: asm/ucontext.h: No such file or directory
      25 | #include <asm/ucontext.h>
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.


vim +25 arch/xtensa/kernel/signal.c

29c4dfd92edc26 Chris Zankel   2007-05-31  24  
5a0015d62668e6 Chris Zankel   2005-06-23 @25  #include <asm/ucontext.h>
7c0f6ba682b9c7 Linus Torvalds 2016-12-24  26  #include <linux/uaccess.h>
5a0015d62668e6 Chris Zankel   2005-06-23  27  #include <asm/cacheflush.h>
29c4dfd92edc26 Chris Zankel   2007-05-31  28  #include <asm/coprocessor.h>
4ec4b8b1ec313a Randy Dunlap   2023-09-19  29  #include <asm/processor.h>
4ec4b8b1ec313a Randy Dunlap   2023-09-19  30  #include <asm/syscall.h>
29c4dfd92edc26 Chris Zankel   2007-05-31  31  #include <asm/unistd.h>
5a0015d62668e6 Chris Zankel   2005-06-23  32  

:::::: The code at line 25 was first introduced by commit
:::::: 5a0015d62668e64c8b6e02e360fbbea121bfd5e6 [PATCH] xtensa: Architecture support for Tensilica Xtensa Part 3

:::::: TO: Chris Zankel <czankel@tensilica.com>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
