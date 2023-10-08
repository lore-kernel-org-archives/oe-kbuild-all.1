Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5782C9C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Oct 2023 20:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L1qq7OBV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696797678; x=1728333678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fhl0DdZgqLA2lQkeWTSzVhD12rEI+DM+nzWuLdD3gaU=;
  b=L1qq7OBVAZCBO7VR0dIZmCkOATeeDK9V6iY9AtLL2Xd4LDqnLvU4TLVa
   LpFd6kYf7OjagFbxaCEp+166i8xZOsW1mU24nILJ0aR+3g6E5RvtYKCAD
   qWm5wErf/L+A7iFAn6pjFdVtSeTDHBs+pacPspm3n4eK1Z+r9xUPKJ4PE
   8cUeaggYXsmfqXm0EPAAbYVFzI8p6wOnaSqqBg8m+iQaAowiTCadUQ7qA
   I12os1eHcDLrbZN94Qoo0L2VM3JKjMjPreu2ddp5zzlra1xOjfIBsgc0I
   hJZKjjaMCvz8JqgrO+EBHMRbMgioh/r8YSZPw06KThkCI7KQ5JLeGbzsx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="383911894"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="383911894"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2023 13:41:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="752808228"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="752808228"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Oct 2023 13:41:14 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpaaP-0005k5-2G;
	Sun, 08 Oct 2023 20:41:13 +0000
Date: Mon, 9 Oct 2023 04:40:31 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 27/28] hppa-linux-ld:
 fs/xfs/xfs_trace.o(.text+0x42da0): cannot reach 0000a892_bpf_trace_run2+0,
 recompile with -ffunction-sections
Message-ID: <202310090405.GXbIXpan-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   b51b81a2d623ddeda365270f24748bea23a93a2f
commit: 8a198cce537de4f58f1cd791cd05347320a025b3 [27/28] mm/damon/sysfs: avoid empty scheme tried regions for large apply interval
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20231009/202310090405.GXbIXpan-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231009/202310090405.GXbIXpan-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310090405.GXbIXpan-lkp@intel.com/

All errors (new ones prefixed by >>):

>> hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x42da0): cannot reach 0000a892_bpf_trace_run2+0, recompile with -ffunction-sections
   hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x42da0): cannot handle R_PARISC_PCREL17F for bpf_trace_run2
   hppa-linux-ld: final link failed: bad value

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
