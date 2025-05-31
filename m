Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C864413212A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 May 2025 03:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748662531; cv=none; b=pG/+9VD1IQbgBlXQyLQ3ZQfmb0znaEZhm1FeCwJTR0Dk1aTxdo7Z9rWCbIEFv1R9QskMjVJIKHr2Z8fdmZ7cDbRob4BQTYgVzDXQNZW7l/aFdKmFnohhUScXLOgErsmERjlpKO7M5Dhq8QYBEFsZE2/a/pXiUFglECRIL/yq/TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748662531; c=relaxed/simple;
	bh=YBHNriw/hgpq2v8E1D1plVX16UoPj0lAdYIrv+ghtQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ffaNfpNHVN+vdhCpFFctseh73nwS1J+WOaZTnX8L+xuvSOuXcXeEHzuRl3zv6+JCnSotUCrvX7m5aJTXQ6OK87aqelUui0aQlp5mYsskzoweTzGAznPU4McCZ6Nn4p+iNCUfPgRb8hGurD/5ZTlZc9DEU1LMfB9dH0kLBp0k99Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bCAnTmAJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bCAnTmAJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748662529; x=1780198529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YBHNriw/hgpq2v8E1D1plVX16UoPj0lAdYIrv+ghtQ8=;
  b=bCAnTmAJczwmUFnQexoiwGv/aLkXmG54x6clY9Oak35IefKgXRhgGFa0
   VPZ/OVItJlvDm6biYOUgIUm2YdPVEFlUKgMwiC/z/hzvvKVd9iccMpNoq
   8vBpNxMgL3FqW39xl5JtsmZmHGmMIoi4oviJaqaxQN44TZkRAZrEmmT+e
   55sfbLRhBNoUfT5OQafIV8ctvbeuRYZ+iM3/LRP+nM3giVPq1RMA6J8YU
   UzgI6kneZRrX7XqMy/K41m3+thKu25w/1wS/Fn+srwDycP4wi3/TWbtXq
   ypC6Adfcy6jaXk0I2bDHOFWcc/BD+q2ZxrxqFyzjfpSeMqKDkzZGOd4Hz
   A==;
X-CSE-ConnectionGUID: SkkTPnKpS1m1m/YuvNWGfw==
X-CSE-MsgGUID: eOWIqcOsRv2/fCWp9A6pLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="49879772"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="49879772"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 20:35:28 -0700
X-CSE-ConnectionGUID: yLtyE/vPRgKPn6Trs+amjQ==
X-CSE-MsgGUID: Fls3JxXtQLGHXUlvWanlXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="148906666"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 May 2025 20:35:27 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLD0H-000YAe-0M;
	Sat, 31 May 2025 03:35:25 +0000
Date: Sat, 31 May 2025 11:35:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:tdx/dpamt 3/17] include/uapi/linux/const.h:28:33: warning: left
 shift count >= width of type
Message-ID: <202505311117.zrfOgaLQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git tdx/dpamt
head:   ecf8d6a2a90c373eb46868f243c1a69b343ee98e
commit: 24692a8a922bc67731219514f34084df3b876005 [3/17] x86/tdx: Consolidate TDX error handling
config: i386-buildonly-randconfig-002-20250531 (https://download.01.org/0day-ci/archive/20250531/202505311117.zrfOgaLQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505311117.zrfOgaLQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505311117.zrfOgaLQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/list.h:9,
                    from include/linux/swait.h:5,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   arch/x86/include/asm/tdx_errno.h: In function 'tdx_sw_error':
>> include/uapi/linux/const.h:28:33: warning: left shift count >= width of type [-Wshift-count-overflow]
      28 | #define _BITUL(x)       (_UL(1) << (x))
         |                                 ^~
   arch/x86/include/asm/tdx_errno.h:49:49: note: in expansion of macro '_BITUL'
      49 | #define TDX_ERROR                               _BITUL(63)
         |                                                 ^~~~~~
   arch/x86/include/asm/tdx_errno.h:51:50: note: in expansion of macro 'TDX_ERROR'
      51 | #define TDX_SW_ERROR                            (TDX_ERROR | GENMASK_ULL(47, 40))
         |                                                  ^~~~~~~~~
   arch/x86/include/asm/tdx_errno.h:68:23: note: in expansion of macro 'TDX_SW_ERROR'
      68 |         return (err & TDX_SW_ERROR) == TDX_SW_ERROR;
         |                       ^~~~~~~~~~~~
>> include/uapi/linux/const.h:28:33: warning: left shift count >= width of type [-Wshift-count-overflow]
      28 | #define _BITUL(x)       (_UL(1) << (x))
         |                                 ^~
   arch/x86/include/asm/tdx_errno.h:49:49: note: in expansion of macro '_BITUL'
      49 | #define TDX_ERROR                               _BITUL(63)
         |                                                 ^~~~~~
   arch/x86/include/asm/tdx_errno.h:51:50: note: in expansion of macro 'TDX_ERROR'
      51 | #define TDX_SW_ERROR                            (TDX_ERROR | GENMASK_ULL(47, 40))
         |                                                  ^~~~~~~~~
   arch/x86/include/asm/tdx_errno.h:68:40: note: in expansion of macro 'TDX_SW_ERROR'
      68 |         return (err & TDX_SW_ERROR) == TDX_SW_ERROR;
         |                                        ^~~~~~~~~~~~
--
   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/list.h:9,
                    from include/linux/swait.h:5,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   arch/x86/include/asm/tdx_errno.h: In function 'tdx_sw_error':
>> include/uapi/linux/const.h:28:33: warning: left shift count >= width of type [-Wshift-count-overflow]
      28 | #define _BITUL(x)       (_UL(1) << (x))
         |                                 ^~
   arch/x86/include/asm/tdx_errno.h:49:49: note: in expansion of macro '_BITUL'
      49 | #define TDX_ERROR                               _BITUL(63)
         |                                                 ^~~~~~
   arch/x86/include/asm/tdx_errno.h:51:50: note: in expansion of macro 'TDX_ERROR'
      51 | #define TDX_SW_ERROR                            (TDX_ERROR | GENMASK_ULL(47, 40))
         |                                                  ^~~~~~~~~
   arch/x86/include/asm/tdx_errno.h:68:23: note: in expansion of macro 'TDX_SW_ERROR'
      68 |         return (err & TDX_SW_ERROR) == TDX_SW_ERROR;
         |                       ^~~~~~~~~~~~
>> include/uapi/linux/const.h:28:33: warning: left shift count >= width of type [-Wshift-count-overflow]
      28 | #define _BITUL(x)       (_UL(1) << (x))
         |                                 ^~
   arch/x86/include/asm/tdx_errno.h:49:49: note: in expansion of macro '_BITUL'
      49 | #define TDX_ERROR                               _BITUL(63)
         |                                                 ^~~~~~
   arch/x86/include/asm/tdx_errno.h:51:50: note: in expansion of macro 'TDX_ERROR'
      51 | #define TDX_SW_ERROR                            (TDX_ERROR | GENMASK_ULL(47, 40))
         |                                                  ^~~~~~~~~
   arch/x86/include/asm/tdx_errno.h:68:40: note: in expansion of macro 'TDX_SW_ERROR'
      68 |         return (err & TDX_SW_ERROR) == TDX_SW_ERROR;
         |                                        ^~~~~~~~~~~~


vim +28 include/uapi/linux/const.h

2dd8a62c6476911 Masahiro Yamada 2018-04-10  27  
21e7bc600e3b662 Masahiro Yamada 2018-04-10 @28  #define _BITUL(x)	(_UL(1) << (x))
21e7bc600e3b662 Masahiro Yamada 2018-04-10  29  #define _BITULL(x)	(_ULL(1) << (x))
2fc016c5bd8aad2 H. Peter Anvin  2013-04-27  30  

:::::: The code at line 28 was first introduced by commit
:::::: 21e7bc600e3b662020c05fd0749bcf85f16336f7 linux/const.h: refactor _BITUL and _BITULL a bit

:::::: TO: Masahiro Yamada <yamada.masahiro@socionext.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
