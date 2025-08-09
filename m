Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C86B2222A9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Aug 2025 05:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754717392; cv=none; b=NH4xvkTGWhNfyIZ1ZaT9AJ3dMUpHY5C9kQJG9tQoKLaI7UhcY+CBHNQo/0RnLFD3blFrGVBl9jpHtu3/8vqHyJ1QYr7iolLd6qHq0CI4sGYgmkr3fV9vJ8fBYYFAl1uEshZHVa2PVvydLvWcmfUBAIzs6z6fFd15Ehqw4CqPdQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754717392; c=relaxed/simple;
	bh=weAJDFmiIuG5+67t7bbRk3GK/PsacIQ08RW1+O426fI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nROLyTR+U3fZLEaRv2li6pFHRGEYmiz+mZy1MsWHFyNWQklcTrEcDnE//IndIiGLW52gUYAiWF/f7G85sYc/ZJhOFBEgl1rW/D67TZKjO5aOE3yTG47DqQkBUTVUupWdB2/O76bMXbBa2iw1KneZJR0cd5D4yhC1zFAZ4vIhF0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E+jDq9oG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E+jDq9oG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754717391; x=1786253391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=weAJDFmiIuG5+67t7bbRk3GK/PsacIQ08RW1+O426fI=;
  b=E+jDq9oGYmbAn6CQhtaRt9MmK9FhnRr1Egx/Su7kTfbd9ZwUrMxoa+uS
   PcYcI1tseuFrJsulPIiWgLjHse5qQdixHB7jtyKWPvrSX9+VfPxLm1tTR
   8ZhvBGxnuV1UIBn6TfkDj+E5R9GZFqLutf9xdDPHF5ErGKWNpPzvDgyyY
   MK9znL24X+foEu34TkH6Lh6LE8cqOwFLVkzAi8CN/XwbRNsldgM94mTsk
   wnLiWQGtTjFXZgtjUeuvv75WKG0jiP5o7Qa8iJgtqW9Axx0k0ncY9uV4N
   7SSP5MYiJ9vUx5GmBi23hv/R+XysaF/HyxNt+wm+pKM5ZKmIiq0bT6y49
   g==;
X-CSE-ConnectionGUID: DK/xndsgSmi73zHYQi7w5g==
X-CSE-MsgGUID: pDlQ/IpyS7Gzt9pMqMg6mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="57203790"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57203790"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 22:29:50 -0700
X-CSE-ConnectionGUID: 6U0W4QHBTgKv9KvptI5KUA==
X-CSE-MsgGUID: DC0ItqBJTGGjI0+cCV46Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="164981717"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 08 Aug 2025 22:29:49 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukc9K-0002jn-0G;
	Sat, 09 Aug 2025 05:29:46 +0000
Date: Sat, 9 Aug 2025 07:29:10 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1753/1753]
 include/linux/string.h:249:16: warning: '__builtin_strncpy' accessing 80
 bytes at offsets 100 and 36 may overlap up to 0 bytes at offset
 [9223372036854775807, -9223372036854775808]
Message-ID: <202508090752.oTu2Do8L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   748957057cef2d3b3e35d749c9a1ade66e2b5e73
commit: a24ec7d8d3462ba48b4bd932960c397d92de8782 [1753/1753] ASoC: dmaengine: Make the pcm->name equal to pcm->id if the name is not set
config: x86_64-buildonly-randconfig-2002-20250806 (https://download.01.org/0day-ci/archive/20250809/202508090752.oTu2Do8L-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508090752.oTu2Do8L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508090752.oTu2Do8L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bitmap.h:9,
                    from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/processor.h:21,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:38,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:81,
                    from include/linux/spinlock.h:51,
                    from include/linux/seqlock.h:36,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:11,
                    from sound/soc/soc-generic-dmaengine-pcm.c:6:
   In function 'strncpy',
       inlined from 'dmaengine_pcm_new' at sound/soc/soc-generic-dmaengine-pcm.c:318:4:
>> include/linux/string.h:249:16: warning: '__builtin_strncpy' accessing 80 bytes at offsets 100 and 36 may overlap up to 0 bytes at offset [9223372036854775807, -9223372036854775808] [-Wrestrict]
     249 |         return __builtin_strncpy(p, q, size);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__builtin_strncpy +249 include/linux/string.h

6974f0c4555e28 Daniel Micay 2017-07-12  240  
6974f0c4555e28 Daniel Micay 2017-07-12  241  #if !defined(__NO_FORTIFY) && defined(__OPTIMIZE__) && defined(CONFIG_FORTIFY_SOURCE)
6974f0c4555e28 Daniel Micay 2017-07-12  242  __FORTIFY_INLINE char *strncpy(char *p, const char *q, __kernel_size_t size)
6974f0c4555e28 Daniel Micay 2017-07-12  243  {
6974f0c4555e28 Daniel Micay 2017-07-12  244  	size_t p_size = __builtin_object_size(p, 0);
6974f0c4555e28 Daniel Micay 2017-07-12  245  	if (__builtin_constant_p(size) && p_size < size)
6974f0c4555e28 Daniel Micay 2017-07-12  246  		__write_overflow();
6974f0c4555e28 Daniel Micay 2017-07-12  247  	if (p_size < size)
6974f0c4555e28 Daniel Micay 2017-07-12  248  		fortify_panic(__func__);
6974f0c4555e28 Daniel Micay 2017-07-12 @249  	return __builtin_strncpy(p, q, size);
6974f0c4555e28 Daniel Micay 2017-07-12  250  }
6974f0c4555e28 Daniel Micay 2017-07-12  251  

:::::: The code at line 249 was first introduced by commit
:::::: 6974f0c4555e285ab217cee58b6e874f776ff409 include/linux/string.h: add the option of fortified string.h functions

:::::: TO: Daniel Micay <danielmicay@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
