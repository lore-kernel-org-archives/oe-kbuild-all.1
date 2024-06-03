Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8838429A5
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jun 2024 17:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717436814; cv=none; b=bLeKAvubmTlo3nPUOtxe1mD2z6TmX0g/Qu0eHKyUuIzQs0ExePAhWS7i7wEdwq+151jgxXRT2WD2g6mrRYBoOjcCzLgj9mQN0UUVHvKztLO6Kt0h7lJtVnkyeks9N9/1E1dJKVpewwE9lxxC8HuFJa8aQOkHZv3n/3kJyGhseSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717436814; c=relaxed/simple;
	bh=Sk+YH/PGTg3QF9aqoiTwWmKwMZURVzcTnceIh9/h2FM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=laNXLU2UymuH/+9QQQbi8Kp+aA9XA3UV+/lxqd2jrF6vf0G+MWDP6utKr/4pc6djQgPF0F/lHxCL5V8RIeKapRCkA6F8NV9jMM8bicveK/PMr6N3hjyna3RPQQL81ZFs13OnRSyciVtGsBCFEZr/D1mcl77GuCORDffTd8Esocw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVCvT8+j; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVCvT8+j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717436813; x=1748972813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sk+YH/PGTg3QF9aqoiTwWmKwMZURVzcTnceIh9/h2FM=;
  b=LVCvT8+jxSz17/9bJihpDN0qw5G21nSgAmBrk1Ya876vOV4/+NF6MSU+
   1SZE1EkIEZcN6K10IxLoLkUFtdexsAcfpfQ6GRnhug+eweNFXniMz4144
   /FSkP1uLC0NoA4UadWMJSq8+mLI3r3xNHF8DtvbO1UYbsJT7u/t6HBLw0
   7QXl4O/Wdt/WtDOk/bponfDhAC+nKfTm4XOy0NuIN5ZLFthj6hhyprwE/
   wRGvOsnPb+WqD/gJwEGC0gv1LAUi72oe0ux2OCCvSdPz5QsyrfZXylzlq
   zEwJm0lqux3wTht9t05fouzyC4HdAIj2Y4SRLYXnDsnLMdAGWMaCWw+Q8
   w==;
X-CSE-ConnectionGUID: ydXbRW0RTZSIpca+4btg/w==
X-CSE-MsgGUID: d+3/T30LQiCkpz5axPDvGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="13817750"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="13817750"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 10:46:52 -0700
X-CSE-ConnectionGUID: hX7NOUSRTc+3BUO3dL2JKg==
X-CSE-MsgGUID: zhALZesvQSKH/AUEYGNd+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="37543672"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 03 Jun 2024 10:46:50 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEBlf-000M0t-2F;
	Mon, 03 Jun 2024 17:46:47 +0000
Date: Tue, 4 Jun 2024 01:45:55 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-st-rc 2293/2326]
 arch/parisc/kernel/parisc_ksyms.c:37:15: error: '__cmpxchg_u8' undeclared
 here (not in a function); did you mean '__cmpxchg_u64'?
Message-ID: <202406040124.bb1fF2Lz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st-rc
head:   ecbb82ce18d073400afead62c777e18a6b64ef28
commit: 6ee05c1f18ffe0fb9409cfbb122cc7b2f419b19d [2293/2326] parisc: add missing export of __cmpxchg_u8()
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240604/202406040124.bb1fF2Lz-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406040124.bb1fF2Lz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406040124.bb1fF2Lz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/uapi/linux/stddef.h:1:0,
                    from include/linux/stddef.h:4,
                    from include/uapi/linux/posix_types.h:4,
                    from include/uapi/linux/types.h:13,
                    from include/linux/types.h:5,
                    from include/linux/list.h:4,
                    from include/linux/module.h:9,
                    from arch/parisc/kernel/parisc_ksyms.c:27:
   arch/parisc/include/asm/uaccess.h: In function 'copy_from_user':
   arch/parisc/include/asm/uaccess.h:251:63: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
            if (likely(sz == -1 || !__builtin_constant_p(n) || sz >= n))
                                                                  ^
   include/linux/compiler.h:181:40: note: in definition of macro 'likely'
    # define likely(x) __builtin_expect(!!(x), 1)
                                           ^
   In file included from include/linux/linkage.h:6:0,
                    from include/linux/kernel.h:6,
                    from include/linux/list.h:8,
                    from include/linux/module.h:9,
                    from arch/parisc/kernel/parisc_ksyms.c:27:
   arch/parisc/kernel/parisc_ksyms.c: At top level:
>> arch/parisc/kernel/parisc_ksyms.c:37:15: error: '__cmpxchg_u8' undeclared here (not in a function); did you mean '__cmpxchg_u64'?
    EXPORT_SYMBOL(__cmpxchg_u8);
                  ^
   include/linux/export.h:57:16: note: in definition of macro '__EXPORT_SYMBOL'
     extern typeof(sym) sym;     \
                   ^~~
   arch/parisc/kernel/parisc_ksyms.c:37:1: note: in expansion of macro 'EXPORT_SYMBOL'
    EXPORT_SYMBOL(__cmpxchg_u8);
    ^~~~~~~~~~~~~


vim +37 arch/parisc/kernel/parisc_ksyms.c

  > 27	#include <linux/module.h>
    28	#include <linux/kernel.h>
    29	#include <linux/syscalls.h>
    30	
    31	#include <linux/string.h>
    32	EXPORT_SYMBOL(memset);
    33	
    34	#include <linux/atomic.h>
    35	EXPORT_SYMBOL(__xchg8);
    36	EXPORT_SYMBOL(__xchg32);
  > 37	EXPORT_SYMBOL(__cmpxchg_u8);
    38	EXPORT_SYMBOL(__cmpxchg_u32);
    39	#ifdef CONFIG_SMP
    40	EXPORT_SYMBOL(__atomic_hash);
    41	#endif
    42	#ifdef CONFIG_64BIT
    43	EXPORT_SYMBOL(__xchg64);
    44	EXPORT_SYMBOL(__cmpxchg_u64);
    45	#endif
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
