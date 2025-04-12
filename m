Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6005E134CF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Apr 2025 21:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744493709; cv=none; b=M0foWpD1K1oQYK1COQ9cKytvVzsbmaGOToyckvvqyYHWqabMuMg0eteQgUUoi66wO84Zc0gWph8yv8PzihABtj+MdRCyunV50iuoW5PE65nJgV5AU8JSMT65CqrnvRCblgq73wJoM5CFz0N0HkdtELpwgL3EpK64es3FW4F1yjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744493709; c=relaxed/simple;
	bh=IwpUJ1fLG5nKNxWc7gclTLQrrZE8Ki1ZLY7MKbC+RyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kOO8evR4wAOlGamPxgy6TXX/scqznWDsrVQupnyosHHy8eMCyCUiSS9wBdXlexj8kG5Kg1KzGPsO4iAC9kyHebPOyxENiGE62eibImp745RUPv/j3fYSFhklp7jSp63ZT2oJmMRwKC+vmG3GuK4zVjhJxZ+NrzGI0CoDIp2G2NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EAWyPhN5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EAWyPhN5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744493707; x=1776029707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IwpUJ1fLG5nKNxWc7gclTLQrrZE8Ki1ZLY7MKbC+RyY=;
  b=EAWyPhN5iO1epzAbtFkT5yCpi7RL8UthS5UXGl/lEZY8HrMUO8zSRD/O
   sQjLwy6ZJijlpkuO14SwuL532Uik3huJQ2ahFMKPxKTwtCQ/0IVvmIGFC
   Ygnmwd0q3ObOANSkagLea+Q2l347JFFeCKOMAnjFRuiL+MrIxbdO5RsbX
   hhb8P1zRqV3OsndHnceS/198wBbK0wqy5pPu+zefcl1m/ivJubE5S34Su
   9ePChxyn9zDviPoXnabKjFIYdS+iCoVk4pliCBO3pmxs/aF5wjqPSlGoG
   Dj5NYISD6VUnbW/dogWWWp06HBLNmFXiF8PuJs2ADSffGENpDJGX4sY89
   w==;
X-CSE-ConnectionGUID: Lh7ZwmGNQi2v9VXUPRjofQ==
X-CSE-MsgGUID: PzLEvYo+RGC3v69ugE4XIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="68499763"
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="68499763"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 14:35:06 -0700
X-CSE-ConnectionGUID: eCVgDxwDQNWyZRuJNjwqFQ==
X-CSE-MsgGUID: PVABXEJrSFaUGwTryKOKQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="129484658"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Apr 2025 14:35:05 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3iVD-000C90-0K;
	Sat, 12 Apr 2025 21:35:03 +0000
Date: Sun, 13 Apr 2025 05:34:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:netns-debugfs 2/3] include/linux/kern_levels.h:5:18:
 warning: format '%d' expects argument of type 'int', but argument 2 has type
 'long int'
Message-ID: <202504130520.rX5EVbVq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git netns-debugfs
head:   193510c9521581018efe6f51e0aeddbafc8c103e
commit: ada5a12aae58a77a6d3522609df19a7cba6e053b [2/3] ref_tracker: add a top level debugfs directory for ref_tracker
config: arm64-randconfig-003-20250413 (https://download.01.org/0day-ci/archive/20250413/202504130520.rX5EVbVq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504130520.rX5EVbVq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504130520.rX5EVbVq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22:0,
                    from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/refcount.h:96,
                    from include/linux/ref_tracker.h:4,
                    from lib/ref_tracker.c:7:
   lib/ref_tracker.c: In function 'ref_tracker_debug_init':
>> include/linux/kern_levels.h:5:18: warning: format '%d' expects argument of type 'int', but argument 2 has type 'long int' [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/printk.h:473:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:554:2: note: in expansion of macro 'printk'
     printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   include/linux/kern_levels.h:12:22: note: in expansion of macro 'KERN_SOH'
    #define KERN_WARNING KERN_SOH "4" /* warning conditions */
                         ^~~~~~~~
   include/linux/printk.h:554:9: note: in expansion of macro 'KERN_WARNING'
     printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~~~~~
   lib/ref_tracker.c:286:3: note: in expansion of macro 'pr_warn'
      pr_warn("ref_tracker: unable to create ref_tracker debugfs directory: %d\n",
      ^~~~~~~
   lib/ref_tracker.c:286:74: note: format string is defined here
      pr_warn("ref_tracker: unable to create ref_tracker debugfs directory: %d\n",
                                                                            ~^
                                                                            %ld


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
