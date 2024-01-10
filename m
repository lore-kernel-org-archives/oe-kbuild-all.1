Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0454BAAD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jan 2024 13:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FBMXcV1B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704893574; x=1736429574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3d9rLTojZlidvZLCTYOThbWszgEe0t9rm5ZLnCidD+E=;
  b=FBMXcV1B/fV/RdVLqjL6n2xrufuIqzKYgKAU1vQJ5QCrqTut0kieMoHC
   FG+qIU7TRP96y7644mkPJM+0gztb5dE2MuB5P71J+RPxegiXoM2n93Fi8
   +yY6PhF0vmAKPHRbnOCIQqTQt7qRPUyBi5jWpyNQdt4aALcOPEb8Tum4c
   f0SQfnJhcBcuVVyx9Pmo4n68T86TYKoTOyiuksS/Rvj0G82Iaxwx+ltj6
   I45frWFy4pWilRbvPEla7RqOAYWCZahlyEFuhf/FJS6koYN919SNJRHAx
   ebOIFEi8Sv7kPVdcEO5KBHTLhDOB7QLhb+dqJw6VvSXpiD9CtwSbr0u+1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="11862074"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="11862074"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 05:32:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="24268924"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 10 Jan 2024 05:32:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNYhN-00074M-31;
	Wed, 10 Jan 2024 13:32:49 +0000
Date: Wed, 10 Jan 2024 21:32:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:lukas-v3.2 18/35] lib/dynamic_debug.c:621:7: warning: no
 previous prototype for function 'skip_spaces_and_comma'
Message-ID: <202401102135.K8rctNL8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git lukas-v3.2
head:   c438921c4424913334b3622bf725bddc3db724e8
commit: 0c25952b3398e024b22ba55879ba074ca617865c [18/35] dyndbg: treat comma as a token separator
config: x86_64-buildonly-randconfig-002-20240110 (https://download.01.org/0day-ci/archive/20240110/202401102135.K8rctNL8-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401102135.K8rctNL8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401102135.K8rctNL8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:621:7: warning: no previous prototype for function 'skip_spaces_and_comma' [-Wmissing-prototypes]
     621 | char *skip_spaces_and_comma(const char *str)
         |       ^
   lib/dynamic_debug.c:621:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     621 | char *skip_spaces_and_comma(const char *str)
         | ^
         | static 
   1 warning generated.


vim +/skip_spaces_and_comma +621 lib/dynamic_debug.c

   620	
 > 621	char *skip_spaces_and_comma(const char *str)
   622	{
   623		str = skip_spaces(str);
   624		if (*str == ',')
   625			str = skip_spaces(++str);
   626		return (char *)str;
   627	}
   628	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
