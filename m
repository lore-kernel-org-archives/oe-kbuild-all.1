Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2763ED537
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Dec 2023 11:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l5UshzOY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702036573; x=1733572573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v41Lxbx6rxL2zQPgwuqDiFsBI6dl7smLrpB0KJeIv68=;
  b=l5UshzOYNdilnLyyfetshV7ApLLUWsDw8wP9uHNf1gfLsyoGdLnJyvFv
   /YrByKPHJ/ZUL2Ynmvss20eqroQuwWIP6Tz4wtgLUtcHaPLmjAeHHuEdB
   xMaf5DkwI7zQw8y63ovY00h5hb+iiaRiJzbN1oQkcIFTIxTTIg20HdMvb
   9x8EEPR7BKrQVYtOXWNTBxK0CPShfDSiYhPyNVullH1lAjOg085sBbI5M
   NDxyzcaExgibnuGuUpeWgayUD8eiotG7ue+sxbsf5tEU7Y0zw+SNY3Uj0
   TGXBMEg6eBeEr5xXIOJvORfcdKdGc/Q6oYzrUicG5E6FbsYyzvRWB61zm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373895910"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="373895910"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 03:56:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="915930164"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="915930164"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 08 Dec 2023 03:56:11 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBZSj-000DhN-0L;
	Fri, 08 Dec 2023 11:56:09 +0000
Date: Fri, 8 Dec 2023 19:55:26 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 5610/6165] arch/mips/mm/cache.c:209:undefined
 reference to `r3k_cache_init'
Message-ID: <202312081904.NkusJJO0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc63de6e6ba0b16652c5fb4b9c9916b9e7ca1f23
commit: 13446ee48dac9ce1ef935cbe140534146a0a69a0 [5610/6165] mips: move cache declarations into header
config: mips-randconfig-r021-20230212 (https://download.01.org/0day-ci/archive/20231208/202312081904.NkusJJO0-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231208/202312081904.NkusJJO0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312081904.NkusJJO0-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips64-linux-ld: arch/mips/mm/cache.o: in function `cpu_cache_init':
>> arch/mips/mm/cache.c:209:(.text+0x690): undefined reference to `r3k_cache_init'


vim +209 arch/mips/mm/cache.c

ed2adb74217a40 Thomas Bogendoerfer 2020-11-13  205  
078a55fc824c16 Paul Gortmaker      2013-06-18  206  void cpu_cache_init(void)
^1da177e4c3f41 Linus Torvalds      2005-04-16  207  {
02cf2119684e52 Ralf Baechle        2005-10-01  208  	if (cpu_has_3k_cache) {
02cf2119684e52 Ralf Baechle        2005-10-01 @209  		r3k_cache_init();

:::::: The code at line 209 was first introduced by commit
:::::: 02cf2119684e52e97a8a90bd7630386e0f1a250a Cleanup the mess in cpu_cache_init.

:::::: TO: Ralf Baechle <ralf@linux-mips.org>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
