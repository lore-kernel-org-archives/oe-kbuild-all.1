Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAE9C8C6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 02:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KwBdFhRn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701310804; x=1732846804;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lc3gyjPMKLnrqmh9I06oWLTkanKG9sxC4tAcv4cP1q4=;
  b=KwBdFhRnZlOkxaGtcMBf/y8pCsp/ennLZ4WE/+FYgZ9U41ajjWvXHf/U
   7H4Zr2oWJKnGe/8bAKIj9EbXM3bd1oqJuljQCjCY06n040J2PUGrYqI+D
   4axDWBf0fHg6iR7/gpIWsD7TRTgixrJ1Ibs2L0XiSEd0Broj4rxjuBmQS
   jPTkU/szqSVr3iw3r2qOO8sgSalfz3lg1n5v3g4B+RCAHDmZ4pRHKXDo2
   tXVo2Q8IReQSymE+quyDrxpxoTAhp3lN/HmCVKcma2zVzZ0k/suhm3nN/
   f4eCCDP7ZehzlWUmXLzAR+3ux4ialAe3sLrizpbKahVtP+ef+I6hl40rJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="390415357"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="390415357"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 18:20:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745470950"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="745470950"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 29 Nov 2023 18:20:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8Wel-0001FG-2f;
	Thu, 30 Nov 2023 02:19:59 +0000
Date: Thu, 30 Nov 2023 10:18:56 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2336/30000] m68k-linux-gcc: error:
 unrecognized argument in option '-march=armv7-a'
Message-ID: <202311300654.X99uScAW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: b3d472cf0c23afeb4f383c8eb89345481d3a71b6 [2336/30000] Merge branch 'mxc/next' into next
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231130/202311300654.X99uScAW-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311300654.X99uScAW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311300654.X99uScAW-lkp@intel.com/

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
