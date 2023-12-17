Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1903244383
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 14:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IqEq+xQS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702823361; x=1734359361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O1BpaceVAPlX+jookRHI+1aoxcI08Ps3Vvsedxpjvmk=;
  b=IqEq+xQSYIR81AQ1n2m9vfIQb5tZdg5EZ/axbFEzBLERKUuhGkBYuzFd
   RUZGOMG88QFqJO0/v9hxIsdLFKVNhsa0jK2qTWiNaUwV1zwiC77oA3DoR
   0G1rSC7NX9YN4JadoIu0uv43myng7nu4cNbrs57hIuBvGielCQjkEYX1g
   UIWXz/KawwTIL1+AKPIK4OjIJNgRFG0a86a9j8wZKdlMbr7bP19gpMzVd
   Z6hjSE8F3woY5uN0WpaIsOknN0CBNAotWlFayDZNafwkTnpN4np9wNQdE
   +kfz70MZnLk0r1qz8/N8gIIEG8vzGwGXCs8oJ5c2levZ/G8HK0faoy1mF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="2509311"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="2509311"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 06:29:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="898682828"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="898682828"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 Dec 2023 06:29:19 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEs8r-00036q-1C;
	Sun, 17 Dec 2023 14:29:17 +0000
Date: Sun, 17 Dec 2023 22:29:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 15/50] include/linux/numa.h:39:26: error:
 expected '=', ',', ';', 'asm' or '__attribute__' before 'numa_fill_memblks'
Message-ID: <202312172202.Xcu1kjga-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git header_cleanup
head:   7288b19e061b7aa3f46f685e9944af128f10ffd5
commit: c9154c8d53b5536fb1240020a8e55565d3d169eb [15/50] kernel/numa.c: Move logging out of numa.h
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20231217/202312172202.Xcu1kjga-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312172202.Xcu1kjga-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312172202.Xcu1kjga-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/async.h:13,
                    from kernel/async.c:47:
>> include/linux/numa.h:39:26: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'numa_fill_memblks'
      39 | static inline int __init numa_fill_memblks(u64 start, u64 end)
         |                          ^~~~~~~~~~~~~~~~~


vim +39 include/linux/numa.h

c9154c8d53b553 Kent Overstreet  2023-12-11  37  
8f012db27c9516 Alison Schofield 2023-07-10  38  #ifndef numa_fill_memblks
8f012db27c9516 Alison Schofield 2023-07-10 @39  static inline int __init numa_fill_memblks(u64 start, u64 end)
8f012db27c9516 Alison Schofield 2023-07-10  40  {
8f012db27c9516 Alison Schofield 2023-07-10  41  	return NUMA_NO_MEMBLK;
8f012db27c9516 Alison Schofield 2023-07-10  42  }
8f012db27c9516 Alison Schofield 2023-07-10  43  #endif
c9154c8d53b553 Kent Overstreet  2023-12-11  44  

:::::: The code at line 39 was first introduced by commit
:::::: 8f012db27c9516be1a7aca93ea4a6ca9c75056c9 x86/numa: Introduce numa_fill_memblks()

:::::: TO: Alison Schofield <alison.schofield@intel.com>
:::::: CC: Dave Hansen <dave.hansen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
