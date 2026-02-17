Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220AB332ECF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 15:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771342793; cv=none; b=dU4vTRPlam+YjOb+4CbykirsZe7lWeW+BEbqI5lRfyF8BobSly8GqNetxQ66ZXB334qG3pIYQDrpsr41VPC0wk4qU6vYqcmiQ6zeZ0MHrOX7H+9N88jJMsWvsIpiJVxxdqCFOOfiExybcTRGGorBOGCZEOz0jQ6NtZYn+MZBTdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771342793; c=relaxed/simple;
	bh=Xbs49G7k8YvA7nN0uIwx1fTVvbOrL8TTZ1Jaubhbk5Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EIEczw6Nz2BpElpTZsoVIGuF/DljodOlO+peCO5aFMTX5sHIkXfo75Q6gbB5RLEZECAKZxL3+bUQRBFoRO+tRKoEbmJ7Bb+WwTstwnU7+koevtZhKQkHlQoDb5UhwIVBoMaS4TyxqYST6UD41vtZFwcVKwWXKDELGZO94pIZdCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FKJFRZva; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKJFRZva"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771342792; x=1802878792;
  h=date:from:to:cc:subject:message-id;
  bh=Xbs49G7k8YvA7nN0uIwx1fTVvbOrL8TTZ1Jaubhbk5Y=;
  b=FKJFRZvawnkcKKmWkaMv52r+Lu0rP+9TsXnXSUtRW2Lalm6zpXW8tZ7H
   8pNm4syyMac9QMsM0AAGKRsV/m6zIFFJ6/dXXpxO9qwxen6CBjugDaOHk
   cqxl1Lnb2QuZNLP66Zg5iJKRbMsDJ+sppnVb1v1ldJAYaVC8ZyjkDOLqR
   iXGvHDG9VUHudI0mwWyMVo7pjhdfdrWbN3Ka+rvbSJecWXrorobJXmeHH
   zy95xeYwvPhlYFxEg2Bmy6RS8NvwMu0JhaY38MbtgqRANHnaJiEhG+7JV
   mr9ExmLAnYeTUIHstd3Vh1Re6KCTcAJ7e2NRgy2YkPP5x1Bp3rUKfEDbe
   g==;
X-CSE-ConnectionGUID: spQjDkI9T4+dcOL+lG/XqQ==
X-CSE-MsgGUID: qTzA61GbRFGqzYupDHdOMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="76034104"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="76034104"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 07:39:52 -0800
X-CSE-ConnectionGUID: CIkrJ4rPQ1Ov2jWPj98g6Q==
X-CSE-MsgGUID: cZKtb0hyQZaqlPHFZ0VZLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="213928370"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Feb 2026 07:39:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsNAx-0000000116i-4384;
	Tue, 17 Feb 2026 15:39:47 +0000
Date: Tue, 17 Feb 2026 23:38:49 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:xor-improvements 4/26] scripts/Makefile.build:37:
 lib/raid/Makefile: No such file or directory
Message-ID: <202602172358.MOSvsPun-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git xor-improvements
head:   b135f36339c97daa37d59816d60ba59f9693154f
commit: c3a9a7db4810306290abb2351340c07100920169 [4/26] xor: move to lib/raid/
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260217/202602172358.MOSvsPun-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602172358.MOSvsPun-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602172358.MOSvsPun-lkp@intel.com/

All errors (new ones prefixed by >>):

>> scripts/Makefile.build:37: lib/raid/Makefile: No such file or directory
>> make[5]: *** No rule to make target 'lib/raid/Makefile'.
   scripts/Makefile.build:37: Failed to remake makefile 'lib/raid/Makefile'.
--
>> /kbuild/src/consumer/scripts/Makefile.clean:12: /kbuild/src/consumer/lib/raid/Makefile: No such file or directory
   make[5]: *** No rule to make target '/kbuild/src/consumer/lib/raid/Makefile'.
   /kbuild/src/consumer/scripts/Makefile.clean:12: Failed to remake makefile '/kbuild/src/consumer/lib/raid/Makefile'.
   make[4]: *** [/kbuild/src/consumer/scripts/Makefile.clean:61: lib/raid] Error 2
   make[4]: Target '__clean' not remade because of errors.
   make[3]: *** [/kbuild/src/consumer/scripts/Makefile.clean:61: lib] Error 2
   make[3]: Target '__clean' not remade because of errors.
   make[2]: *** [/kbuild/src/consumer/Makefile:2097: _clean_.] Error 2
   make[2]: Target 'mrproper' not remade because of errors.
   make[1]: *** [/kbuild/src/consumer/Makefile:248: __sub-make] Error 2
   make[1]: Target 'mrproper' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'mrproper' not remade because of errors.


vim +37 scripts/Makefile.build

^1da177e4c3f41 Linus Torvalds  2005-04-16  34  
3204a7fb98a3bc Masahiro Yamada 2021-02-28  35  include $(srctree)/scripts/Kbuild.include
57fd251c789647 Masahiro Yamada 2021-02-28  36  include $(srctree)/scripts/Makefile.compiler
a2430b25c31840 Masahiro Yamada 2022-11-19 @37  include $(kbuild-file)
3204a7fb98a3bc Masahiro Yamada 2021-02-28  38  include $(srctree)/scripts/Makefile.lib
^1da177e4c3f41 Linus Torvalds  2005-04-16  39  

:::::: The code at line 37 was first introduced by commit
:::::: a2430b25c31840a6dcbf95c65415d5fee2984dbc kbuild: add kbuild-file macro

:::::: TO: Masahiro Yamada <masahiroy@kernel.org>
:::::: CC: Masahiro Yamada <masahiroy@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
