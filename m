Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF329DDB7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 10:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ncGr8tMs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702549086; x=1734085086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FG36IZ0CUBEJ7HKckG1JJuVEJrZ68djb+uR3rqD8EJI=;
  b=ncGr8tMs30iJBYnlCFZx9jfV6SsLlRGL4UjXvSoBV3NUhmntj4kWjPLd
   Lb0mqdBWSAf5DWJdC8kNL0fxa3uZa0bO178egW4Zd9ZpfXiVvvJ1j/cIf
   MrmGylENfJXOl6W+VryYcZAgViO0JoygWVlIRnhT8RCE7fcmGJIubPGPV
   0w75nvvbh3AE1PKIBUMwpSabwRgH+joc9vhU/pGf3/U0BF3p08sKgHKcX
   L3QHqxXvLv3q1QUdr0zvTW9C4VA+RqF9j/ZbcY74wwHr8TCwSYRxrU4ZL
   hHt3sxg1uygwQlH2wISmcg3dIavNjLKzBlNW3OaWkIeD8jZ7jhLEv2qkv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="13795477"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="13795477"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 02:18:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="15793696"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 14 Dec 2023 02:18:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDin1-000Lu9-2B;
	Thu, 14 Dec 2023 10:18:00 +0000
Date: Thu, 14 Dec 2023 18:17:23 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 7233/7300] powerpc64-linux-ld: warning: orphan
 section `.bss..Lubsan_data241' from `kernel/ptrace.o' being placed in
 section `.bss..Lubsan_data241'
Message-ID: <202312141833.S4yneu0F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   11651f8cb2e88372d4ed523d909514dc9a613ea3
commit: 95ca4d1292211cbd4b3ec04a0603f1d0f858c785 [7233/7300] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
config: powerpc64-randconfig-r001-20220603 (https://download.01.org/0day-ci/archive/20231214/202312141833.S4yneu0F-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312141833.S4yneu0F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312141833.S4yneu0F-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data241' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data241'
>> powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data241' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data241'
>> powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data241' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data241'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
