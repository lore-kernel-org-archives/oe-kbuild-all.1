Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D9A33ADA3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 07:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783497208; cv=none; b=Vd6Ofrb3T6oDXTVjsmLE7ol/qDIaT1FvyTdHAC/8coyyQkxhEUNLQwMplJ32HP8CXMww/JZPVxpXJiwBTWx0a/m6n6T98sXjQBenGMTAcJi1k0O5gyI8tfb+5UEP9ZrZ5OgD98DsxiEvYvksdkdlg8Wh7b+kKfbvl7GkC9I5wYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783497208; c=relaxed/simple;
	bh=nDMVfRlgPnfk00q9T6S45AKbv387mxE87gkFRtO422A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bxLzkw5GBw0zntUcVYsHoFs9aiISePSOXKW8s6YZEDnUrEBeRN1gyMNZRwHTRbrMjseMUHgO8dRwxZyxU54+QN0b/ey8brIiymyJ4hM6LHgT/2punKW/q8zxU33Bz/TCoaVmsQUiqhKVuz5Z8jNiKZCfW+OJa29Id3i2jKYMsAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZFpyQIKf; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFpyQIKf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783497194; x=1815033194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nDMVfRlgPnfk00q9T6S45AKbv387mxE87gkFRtO422A=;
  b=ZFpyQIKfJPW/yBTwhJyGmc560wnEjwoPiSbuMWy67DbZrEZTtTBb6lvO
   PTH0mbd2mPwP7kUSAi8YefMOcPIl/B1chzQIXKjmcc4zMzkte+eKHi/jU
   MOBKuv0CtkxyTX975cze570RBTvIC6cFTDkB9Frg7msI3ByYh7RUXetGH
   ByOykwNsPy/69E48LDqnbdU5PtAP4Evw5hhW8di+0dQVA1B/X9btsLxHa
   EB+FruV2iYF2i0fNNLbRkuQSyBSxf4GVm+Qq8k487xvtH3DynxgG5c5E+
   JQrd/uCt2RC6I/hDUAADIxBKkhVkDrEw3uLBeW0wmZwjGdFDZ7IYRnv0x
   Q==;
X-CSE-ConnectionGUID: 9uycwzW5TVCtCQnaId0NOw==
X-CSE-MsgGUID: 10SmQRc5QQe4JbTBmYRwGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83130199"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83130199"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 00:53:07 -0700
X-CSE-ConnectionGUID: 1P8/Qt+WQgOel6PSYaEKeg==
X-CSE-MsgGUID: 6NM4e064TcaHuTrooMe/AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="249773407"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 08 Jul 2026 00:53:05 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whN5a-00000000G8x-37ST;
	Wed, 08 Jul 2026 07:53:02 +0000
Date: Wed, 08 Jul 2026 15:52:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-ratelimit 40/81] lib/dynamic_debug.c:88: Warning:
 missing closing `"'
Message-ID: <202607081550.uT962LDo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-ratelimit
head:   cbb49cd4279ef7137b7931337dbbc47d7f9532d0
commit: 21454fc4dd9a744fe59cb7fd70b5e24f3b3f45f0 [40/81] dyndbg: add +c flag to demonstrate advantage of classmaps for DRM
config: s390-randconfig-r054-20260708 (https://download.01.org/0day-ci/archive/20260708/202607081550.uT962LDo-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607081550.uT962LDo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607081550.uT962LDo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/dynamic_debug.c: Assembler messages:
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'


vim +88 lib/dynamic_debug.c

21454fc4dd9a74 Jim Cromie  2026-04-15  82  
e9d376f0fa66bd Jason Baron 2009-02-05  83  static DEFINE_MUTEX(ddebug_lock);
e9d376f0fa66bd Jason Baron 2009-02-05  84  static LIST_HEAD(ddebug_tables);
f657fd21e16e3a Joe Perches 2012-12-05  85  static int verbose;
74df138d508eb3 Jim Cromie  2011-12-19  86  module_param(verbose, int, 0644);
09ee10ff804ec4 Jim Cromie  2021-10-19  87  MODULE_PARM_DESC(verbose, " dynamic_debug/control processing "
09ee10ff804ec4 Jim Cromie  2021-10-19 @88  		 "( 0 = off (default), 1 = module add/rm, 2 = >control summary, 3 = parsing, 4 = per-site changes)");
e9d376f0fa66bd Jason Baron 2009-02-05  89  

:::::: The code at line 88 was first introduced by commit
:::::: 09ee10ff804ec4bc58eb9849226312ff1c4d7e7b dyndbg: refine verbosity 1-4 summary-detail

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
