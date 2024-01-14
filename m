Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275E2290B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jan 2024 12:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fAJpglwS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705233860; x=1736769860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7kMQ8dH1b0ehnZ7Jm9TW+1v3x9tUEJ5LDNXZ5aPTO7U=;
  b=fAJpglwS51S9G9fy/+TLmObixHdDfMoWpoRgVVSwi4FEWFVtCl5W5ZLd
   QUC2TPL9n1pCG8WSysU8VPTM+wEK/d8QlMKUkdlut1HIt309SP4Rkthka
   y4LxSPxQTtaVeT4yN2g8tm4qJySEMxtqFSFV4J73WPtoV0/fntH9lKqQK
   +mW6NRgdICAPW7cvV+lWUNuqV4alQd2jywVfWUHDAIMotl7uvP+9QCk6O
   bVFuHMYmhLtRCx247OZ6q8Wt7ywshQv0afzkAxwquvPpXMAezk3BnDqxa
   Bu2VBSGwfNQnMB8D5TuR7QTutQAAE/1DHuDEeEW8UwUEnpAl1OiZaJjz6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="6175622"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="6175622"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 04:04:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="776473346"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="776473346"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Jan 2024 04:04:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOzDr-000BTI-06;
	Sun, 14 Jan 2024 12:04:15 +0000
Date: Sun, 14 Jan 2024 20:03:15 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 13240/13245] powerpc-linux-ld: warning: orphan
 section `.bss..Lubsan_data900' from `kernel/ptrace.o' being placed in
 section `.bss..Lubsan_data900'
Message-ID: <202401141909.NROzIUqW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8d04a7e2ee3fd6aabb8096b00c64db0d735bc874
commit: 7511709cfbd438b90467726e4c107edf5b53815c [13240/13245] Merge branch 'bitmap-for-next' of https://github.com/norov/linux.git
config: powerpc-randconfig-r006-20220323 (https://download.01.org/0day-ci/archive/20240114/202401141909.NROzIUqW-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401141909.NROzIUqW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401141909.NROzIUqW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data900' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data900'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data900' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data900'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data900' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data900'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
