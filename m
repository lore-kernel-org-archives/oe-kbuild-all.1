Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1F76131
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 07:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aq1rbJcr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697270115; x=1728806115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8YWHVOvsPbuM+zEZJBov7YSi5f1XRkrm6Wmx+SLQpFs=;
  b=Aq1rbJcrejMLEGBaIqfBlO5ubFVg4WjJgQasoJEW0QefTq2Skq2bbNv6
   rdCb6cWepI27Tl55cFYBRnOmXDx5KvvFdoDGsOito/q3d4WLQLSns/Tj0
   1tBG7I7//xR3iNaY9x8aQY+oI8hw6jkUUR5RAAt/NWTIOlNnmDYEEHwEl
   1MmwIGMXI8hR1lepsLSY91IusHpEIhqJ79KiwV699aDBlE1aTtV4AfxJz
   dAAT043ogYGgN5VIckYL6J1WZHUibeufKECInm2ElfN1AmNc6ajiyWzcu
   sYF+ZaGflB70LQefS0SIh8XXczFSgvND4ALo4gSqIb1jtiPQhxIGtz2a4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="365576881"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="365576881"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 00:55:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="898828466"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="898828466"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 14 Oct 2023 00:53:17 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrZUJ-0005qF-2w;
	Sat, 14 Oct 2023 07:55:07 +0000
Date: Sat, 14 Oct 2023 15:54:38 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2336/30000] m68k-linux-gcc: error:
 unrecognized argument in option '-march=armv7-a'
Message-ID: <202310141538.kN0274DZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: b3d472cf0c23afeb4f383c8eb89345481d3a71b6 [2336/30000] Merge branch 'mxc/next' into next
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310141538.kN0274DZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141538.kN0274DZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141538.kN0274DZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> m68k-linux-gcc: error: unrecognized argument in option '-march=armv7-a'
   m68k-linux-gcc: note: valid arguments to '-march=' are: 68000 68010 68020 68030 68040 68060 cpu32 isaa isaaplus isab isac
>> m68k-linux-gcc: error: unrecognized argument in option '-mtune=cortex-a9'
   m68k-linux-gcc: note: valid arguments to '-mtune=' are: 68000 68010 68020 68020-40 68020-60 68030 68040 68060 cfv1 cfv2 cfv3 cfv4 cfv4e cpu32
>> m68k-linux-gcc: error: unrecognized command-line option '-mfpu=neon'
>> m68k-linux-gcc: error: unrecognized command-line option '-mfloat-abi=softfp'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NEED_MULTIPLE_NODES
   Depends on [n]: DISCONTIGMEM [=n] || NUMA
   Selected by [y]:
   - SINGLE_MEMORY_CHUNK [=y] && MMU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
