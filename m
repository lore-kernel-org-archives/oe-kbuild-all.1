Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7461A0BE0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 14:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747837451; cv=none; b=rYDqrDpdvrtsTHMYNbHRunJNCRfo3hXSvcj/Iitw8/iMGH9fmitx8ebfooeC1r8jUX5Asi7CsxAIxrmPXDqBdAXvT2qjpMCN0v280+ecVz1b8q8IA8bQoyHXvURRKf2DRl/Iv8/zqUAx21h4tzaYC1nKAgUPqVagBnTCgghes2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747837451; c=relaxed/simple;
	bh=Omiq+kSHJu3vkZDweRhnwl8W1fqd4xLSollEH80BquU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LbSeDhvVl8/8JpOkbIlIK6iS6OzoZyuk8CNaV2lmuHECit/GQd3jX5EWvnHlLBeAXAEfbppumCWDss7Xf6s+rm0Ue25AxDMvQbNScRXyaLNp0TBAme/+tpAmqwydjFPrt4cmmKE1sV2S067h6PPsn5DMXi7e8+Qgwc9JtWrkSAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1DV/wzT; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1DV/wzT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747837449; x=1779373449;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Omiq+kSHJu3vkZDweRhnwl8W1fqd4xLSollEH80BquU=;
  b=M1DV/wzTWe8o9C3++WjXeJDxxn2WIYSh3Q71sS3yX5C6ywqO0Qj0L/IL
   pgIOfTVUaq9nsFoU3QVGjAsJKwlA4MZxWGlvIfHqDWB72X7lKW2tGe38F
   sa0saPi/204GZQdRSL6+uBNBjEIM65G3xFGXYpnugiiRlof8DjsyPY+Qq
   a4vW8MYLtArBaR45z+S8jIFQzQURH78/n39qnJKodQ8pUBHTzLwOm2ujU
   YqgS/EMzYGJil97taI86OX32dWNkZYPEtisRZZdl3zu65wgzwc8Q/T+CU
   Gvp/UMjP8czC3O94UPxLFTcwiDk8TwexW6Rc624OHicoeWWgAh+vG04Nl
   g==;
X-CSE-ConnectionGUID: VuLMVI/sSM2YVvHT9N41lA==
X-CSE-MsgGUID: UXRwoVWKRoW+e1TdsXC5dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49879910"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49879910"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 07:24:09 -0700
X-CSE-ConnectionGUID: xfW88s29S5OD0oYkxiY4Cw==
X-CSE-MsgGUID: KanNj7hoSKyQ4WvLdgJEVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="171102152"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 May 2025 07:24:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHkMX-000OLu-2h;
	Wed, 21 May 2025 14:24:05 +0000
Date: Wed, 21 May 2025 22:24:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 12122/12618] include/linux/string.h:398:9: error:
 expected expression before 'do'
Message-ID: <202505212215.XbPaLuZ0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7bac2c97af4078d7a627500c9bcdd5b033f97718
commit: 723dc57027a797f88423922ae029d17652888c39 [12122/12618] string.h: Provide basic sanity checks for fallback memcpy()
config: microblaze-allnoconfig (https://download.01.org/0day-ci/archive/20250521/202505212215.XbPaLuZ0-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505212215.XbPaLuZ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505212215.XbPaLuZ0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from include/uapi/linux/aio_abi.h:31,
                    from include/linux/syscalls.h:83,
                    from fs/d_path.c:2:
   fs/d_path.c: In function 'dynamic_dname':
>> include/linux/string.h:398:9: error: expected expression before 'do'
     398 |         do {                                                    \
         |         ^~
   fs/d_path.c:315:16: note: in expansion of macro 'memcpy'
     315 |         return memcpy(buffer, temp, sz);
         |                ^~~~~~
>> fs/d_path.c:316:1: warning: control reaches end of non-void function [-Wreturn-type]
     316 | }
         | ^
--
   In file included from lib/string.c:25:
>> include/linux/string.h:398:9: error: expected identifier or '(' before 'do'
     398 |         do {                                                    \
         |         ^~
   lib/string.c:621:7: note: in expansion of macro 'memcpy'
     621 | void *memcpy(void *dest, const void *src, size_t count)
         |       ^~~~~~
>> include/linux/string.h:403:11: error: expected identifier or '(' before 'while'
     403 |         } while (0)
         |           ^~~~~
   lib/string.c:621:7: note: in expansion of macro 'memcpy'
     621 | void *memcpy(void *dest, const void *src, size_t count)
         |       ^~~~~~


vim +/do +398 include/linux/string.h

   391	
   392	#if !defined(__NO_FORTIFY) && defined(__OPTIMIZE__) && defined(CONFIG_FORTIFY_SOURCE)
   393	#include <linux/fortify-string.h>
   394	#else
   395	/* Basic sanity checking even without FORTIFY_SOURCE */
   396	# ifndef __HAVE_ARCH_MEMCPY
   397	#  define memcpy(t, f, n)					\
 > 398		do {							\
   399			typeof(n) __n = (n);				\
   400			/* Skip impossible sizes. */			\
   401			if (!WARN_ON(__n < 0 || __n == SIZE_MAX))	\
   402				__builtin_memcpy(t, f, __n);		\
 > 403		} while (0)
   404	# endif
   405	#endif
   406	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
