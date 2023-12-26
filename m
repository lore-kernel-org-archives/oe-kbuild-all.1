Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A034B5AC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Dec 2023 04:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SZthPzvr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703566511; x=1735102511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SOzSgAsjQhziTkFVN1KVdOz7LgQA0nHRCD/+UNTTXOI=;
  b=SZthPzvr854aDL3CzRG9DtovYaxQ15Jm75FnUCvlI3TODiu8SzZbIhq9
   xrGQdkwwXNU/ME/xFVJXZrmAiK9ewZCcGOS6Vr0O/QNZypLfUoZt40Wls
   ZWNwaquvyyW0pfrRopxezCyhG/fNZT+c24s0VEumZutj7n5VOLIp+c7ly
   Y5vVsihWjiiuHpeBG1dbhgp31HPVpScghpDI3lt6KIDoh2MAYsPprG1aV
   6eH/Xg7uWsZexb+Di3U0I6BLAM6KmVfVtTNSVmcYCyc9qRb5QdMsv5pjX
   4KLUThninhCVAyZvafwipig0cxLO25tNIkYaqj/pnncHd/Yg+TwsOecjD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="3405026"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="3405026"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2023 20:54:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="843791205"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="843791205"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 25 Dec 2023 20:54:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHzSx-000E0y-0t;
	Tue, 26 Dec 2023 04:54:55 +0000
Date: Tue, 26 Dec 2023 12:53:56 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:group_cpus 9/9] include/linux/stddef.h:8:14: warning: return
 makes integer from pointer without a cast
Message-ID: <202312261218.nZkqEhnX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux group_cpus
head:   bacb9a1af23372460cafc24678b4cd4fe081f2b6
commit: bacb9a1af23372460cafc24678b4cd4fe081f2b6 [9/9] lib/group_cpus: simplify group_cpus_evenly() for more
config: i386-buildonly-randconfig-003-20231226 (https://download.01.org/0day-ci/archive/20231226/202312261218.nZkqEhnX-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231226/202312261218.nZkqEhnX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312261218.nZkqEhnX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/posix_types.h:5:0,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:251,
                    from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from lib/group_cpus.c:6:
   lib/group_cpus.c: In function '__group_cpus_evenly':
>> include/linux/stddef.h:8:14: warning: return makes integer from pointer without a cast [-Wint-conversion]
    #define NULL ((void *)0)
                 ^
   lib/group_cpus.c:264:10: note: in expansion of macro 'NULL'
      return NULL;
             ^~~~


vim +8 include/linux/stddef.h

^1da177e4c3f41 Linus Torvalds   2005-04-16  6  
^1da177e4c3f41 Linus Torvalds   2005-04-16  7  #undef NULL
^1da177e4c3f41 Linus Torvalds   2005-04-16 @8  #define NULL ((void *)0)
6e218287432472 Richard Knutsson 2006-09-30  9  

:::::: The code at line 8 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
