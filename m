Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4550114006
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 15:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720105255; cv=none; b=mp/jPgqsG3VugSJ3tvxsKLOiv3M1RJLQzRlP5IYjI4atX6X8cBmJpJzC67LNlp7v0lsX3JhrEOoVkwq6Pvg1ccHFjahzArDKpsKzmNUnJL/6TKkhiCTUb1wVaFT60n9oyy0Nm17a5P54mPYUtgF64gGI2urEFdHSEzddBwgMXdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720105255; c=relaxed/simple;
	bh=WuubeadbRkrv+14uW3n9rtSwX48DsYFNmhHzr15AxBY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mzAVOmyBr2JGWdWGvhPLTxAv9eUm0kym2gJxbo29PuOCAEEqYlXS2CDMuavc1axNle17vzR71oxCP798jhViUxPFT6a4sdPhGtXGv/mVCAaBU9NqZ5Wa0L7BoaaD+gyWdQLyNCJhn0uGSTjExQXCqMPmRTtoJk7NFXTyBgIisQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=POiim9j2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="POiim9j2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720105253; x=1751641253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WuubeadbRkrv+14uW3n9rtSwX48DsYFNmhHzr15AxBY=;
  b=POiim9j2/IUtZdmXiH8RoW/pr08Mf57Moglvjr2x8Hh3azLTmvcBlVDl
   tQpgxmnh3w9198JEoRjL2VfnWOFzo2Zyj5AosGQ8QsPu8CD0USlHgXfbv
   NTyqymwFAnBjga0G8RuZHH2Pc562EYPZGhp7mjJIQmAmQ4WMy/IMn32uZ
   fpmEKGVMVSKgy5b3IMxZreZ2bh6rGik+oodtVU8TItBq7EWqNrBLBc4lL
   XdEzWxtZiwyeUJIPX11+6wpze5L+9sQew6a/XAywGDMBGtehR4N8XGXwD
   j8dAfEMZjYTaLdYA4biMqb/CJAAwTQejqR7nFiKoSImf5gMH1Gn7KE2Ba
   A==;
X-CSE-ConnectionGUID: yd8g2JFyRvuPjFqD6A39Vw==
X-CSE-MsgGUID: mZKzKUJfTKqKcePU/dOKrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="28783043"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="28783043"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 08:00:52 -0700
X-CSE-ConnectionGUID: 46m0ixuwRwqKIW7KTc8Ftw==
X-CSE-MsgGUID: AsbHkA3YTq2LaJkwy0hbTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="46560156"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Jul 2024 08:00:52 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPNx3-000R7W-1Y;
	Thu, 04 Jul 2024 15:00:49 +0000
Date: Thu, 4 Jul 2024 23:00:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-lts 44/49]
 include/linux/page-flags-layout.h:106:2: error: #error "Not enough bits in
 page flags"
Message-ID: <202407042259.oWWXWZDS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-lts
head:   f67208a12e3d8847845fd12d9d8641d3274fff15
commit: c1ff6dcf209e4abc23584d2cd117f725421bccac [44/49] FROMLIST: BACKPORT: THP zones: the use cases of policy zones
config: i386-randconfig-052-20240704 (https://download.01.org/0day-ci/archive/20240704/202407042259.oWWXWZDS-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407042259.oWWXWZDS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407042259.oWWXWZDS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:20,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/crypto.h:17,
                    from arch/x86/kernel/asm-offsets.c:9:
>> include/linux/page-flags-layout.h:106:2: error: #error "Not enough bits in page flags"
     106 | #error "Not enough bits in page flags"
         |  ^~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:252: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:252: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +106 include/linux/page-flags-layout.h

bbeae5b05ef6e4 Peter Zijlstra 2013-02-22  103  
ec1c86b25f4bdd Yu Zhao        2022-09-18  104  #if ZONES_WIDTH + LRU_GEN_WIDTH + SECTIONS_WIDTH + NODES_WIDTH + \
ec1c86b25f4bdd Yu Zhao        2022-09-18  105  	KASAN_TAG_WIDTH + LAST_CPUPID_WIDTH > BITS_PER_LONG - NR_PAGEFLAGS
1587db62d8c0db Yu Zhao        2021-04-29 @106  #error "Not enough bits in page flags"
75980e97daccfc Peter Zijlstra 2013-02-22  107  #endif
75980e97daccfc Peter Zijlstra 2013-02-22  108  

:::::: The code at line 106 was first introduced by commit
:::::: 1587db62d8c0dbd943752f657b452213e1c4d8d4 include/linux/page-flags-layout.h: cleanups

:::::: TO: Yu Zhao <yuzhao@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
