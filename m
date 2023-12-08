Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5965FDDD0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Dec 2023 08:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wtk4UWt2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702025311; x=1733561311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O6S3FQ9bG/EL/xZU5OaSq12oRoDz1TFodpmZrwbL4NQ=;
  b=Wtk4UWt2MDPiHX2BXR8t74txrpa+Z2oNKVEKqniy5PWerZTYBV1mZCgW
   A+5x7w9K30Fbqqxh+RnKv7BEIYWDoSGVj6hhgKLNDQl9thISnSC+mQVGr
   3Ign2DTPf2+2HJZK5kUU6hhofc0PXI/Es07fVnPN0aTYe+oFp1zxm48EV
   PxYdNVSxXJAVZPgI3M5wNGXgdf8gy86lO1DPRfWcwEzPe5nrA3prF+K7P
   T8V0aTBXJuPq6JxRH4c1MIRuXtjB9BX4lSt2B8p81cG6E96T3Ic1PiH5A
   VjpbVUVejHQo6c1/USwme9sxgXqDdSCsMvBoL6rWcP3ZekTZSm4F7mNbM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="398246976"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="398246976"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 00:48:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="842529744"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="842529744"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 08 Dec 2023 00:48:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBWWk-000DWr-1i;
	Fri, 08 Dec 2023 08:48:06 +0000
Date: Fri, 8 Dec 2023 16:47:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:lukas-v2.1 23/27] lib/dynamic_debug.c:631:6: sparse: sparse:
 symbol '__skip_spaces' was not declared. Should it be static?
Message-ID: <202312081606.8tApvhNF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git lukas-v2.1
head:   66fa2e4cb98993032f58845218e0d527ef9398f0
commit: bdc86387d74ea059d04f301df414ee3d6564634d [23/27] dyndbg: __skip_spaces
config: x86_64-randconfig-122-20231208 (https://download.01.org/0day-ci/archive/20231208/202312081606.8tApvhNF-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231208/202312081606.8tApvhNF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312081606.8tApvhNF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/dynamic_debug.c:207:6: sparse: sparse: symbol 'show_T_args' was not declared. Should it be static?
>> lib/dynamic_debug.c:631:6: sparse: sparse: symbol '__skip_spaces' was not declared. Should it be static?

vim +/__skip_spaces +631 lib/dynamic_debug.c

   630	
 > 631	char *__skip_spaces(const char *str)
   632	{
   633		str = skip_spaces(str);
   634		if (*str == ',')
   635			str = skip_spaces(++str);
   636		return (char *)str;
   637	}
   638	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
