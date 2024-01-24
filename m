Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E6AC8E1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jan 2024 06:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706077619; cv=none; b=Y3ldj4ybyB8spzYrVDEG1ncSiiIgR96xG3t2NwvNz5mKOy8aLwVvswAusGJozEeB28ANe4c+WXdluU2f7RryNQyWcMa3P45WhnHkcR8I+hsaIefHcrMJWQXsVFsINo70R9/MKuCQgkLTGsm/hZttSmzOloHLKoKreX+eiK/8DVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706077619; c=relaxed/simple;
	bh=IWeNWoQZI6E2YyPkpvicy8ml/pBLpTjt6OX1IT2P/SY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pWHgNGfWrRkQAYfyAwjlTcKB0vzyXbmLHv0IQ9pDOqCk3nVo9YY7niJLjJOgQkQl7H3kQYXcb3j+QRpNbV2VsptewlvqR8ip6JC4Te808FuHSyZ/7yL17CZKBB9+GU0yusXiXmykv46vI9aNLvnSbF95v3P4qTIOkY4QCpQ0cQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U7hVlpzu; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7hVlpzu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706077617; x=1737613617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IWeNWoQZI6E2YyPkpvicy8ml/pBLpTjt6OX1IT2P/SY=;
  b=U7hVlpzuPKTOgxfAASiJwiP070hj6Ww105A7fFz77mrsVhm7M6oF0LxW
   5Z6UNi2htlN6vCTap2CUIxtHF4mUyBnqLhAJbxy0xwl1jsGRwngPM7vvN
   WC0dOU1R/cQkOtfYCD9ASr9HbpxUQ+IWCfpRVUF8v8et8+d+P4wT8bQy+
   ZZ31XhaqD72GStJjvugNbliQ1geDnvqgj6dg3gyy/QqSIcxzC1Q0wjlGW
   6CJQIiUDRkWvH6E3u6dGmFDYBhQrIkNOBFmohDaiHBpB4HRbd2ki8wPNZ
   rySuPdJ0evxOn1tZFpFu/mormTSzmbhlYSJmEOCpLVUS8frQLgG01kEhE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="400617118"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="400617118"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 22:26:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="876584573"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="876584573"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Jan 2024 22:26:55 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSWir-0007wL-0h;
	Wed, 24 Jan 2024 06:26:53 +0000
Date: Wed, 24 Jan 2024 14:26:31 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:kasan/dev 3/4] arch/sparc/include/asm/string.h:15:25:
 warning: '__builtin_memcpy' specified bound 18446744073709551615 exceeds
 maximum object size 9223372036854775807
Message-ID: <202401241433.vy9UEJkV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git kasan/dev
head:   22932cc8492a23ace6b45731717767b3cad35a2b
commit: 2467f2e4963fe6816b3549ffd5da27e749108b21 [3/4] stackdepot: use variable size records for non-evictable entries
config: sparc-randconfig-001-20240124 (https://download.01.org/0day-ci/archive/20240124/202401241433.vy9UEJkV-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240124/202401241433.vy9UEJkV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401241433.vy9UEJkV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:61,
                    from include/linux/bitmap.h:12,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/debugfs.h:15,
                    from lib/stackdepot.c:17:
   lib/stackdepot.c: In function 'depot_alloc_stack':
>> arch/sparc/include/asm/string.h:15:25: warning: '__builtin_memcpy' specified bound 18446744073709551615 exceeds maximum object size 9223372036854775807 [-Wstringop-overflow=]
      15 | #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackdepot.c:465:9: note: in expansion of macro 'memcpy'
     465 |         memcpy(stack->entries, entries, flex_array_size(stack, entries, nr_entries));
         |         ^~~~~~


vim +/__builtin_memcpy +15 arch/sparc/include/asm/string.h

70a6fcf3283a0a Al Viro 2016-01-17  13  
70a6fcf3283a0a Al Viro 2016-01-17  14  #define __HAVE_ARCH_MEMCPY
70a6fcf3283a0a Al Viro 2016-01-17 @15  #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
70a6fcf3283a0a Al Viro 2016-01-17  16  

:::::: The code at line 15 was first introduced by commit
:::::: 70a6fcf3283a0ac1e11737c6d90c0753f9824e9d [sparc] unify 32bit and 64bit string.h

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
