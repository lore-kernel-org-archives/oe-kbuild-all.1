Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45CB41E35
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 21:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PGCbD8b0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696539993; x=1728075993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=80tv8dTCH3L4+dUMJNEbr32HGRxtQTeRVAvMsWck15g=;
  b=PGCbD8b0l6gUB6RO4QXND/qwMI9r6IL3KvXYGbK6SvKC4zVbpKpi1+J9
   SfSnsh1j2nhZMezpd/PvV/fHh46bWQRvLzxs7/pbm+HpDE/qO+MlyhJWJ
   e8Y5aytQhFDxlBSsVRlw5NcDL+zAVcBbAvwQxc1ZlZcAHpNsDc+rQPEe8
   hOFInSVCTER+ofRiDxMX/f9qUviBKW8zRrTmvQhZKgVkZy/Ani+cYVvjk
   h2StkZnUOOqvDoCt8aZukQ2vmjwVzmYigJzzaFM02wNdoZ2WuPYDLLgL9
   uVbJ29H89sUF2wa5d/CH+461P1bi6LFvgJkpmbzDHIuEgpT6NiqKpZHrZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="387495733"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="387495733"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 14:06:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="925723529"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="925723529"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 05 Oct 2023 14:06:31 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoVYC-000LuA-0x;
	Thu, 05 Oct 2023 21:06:28 +0000
Date: Fri, 6 Oct 2023 05:05:21 +0800
From: kernel test robot <lkp@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Dave Airlie <airlied@redhat.com>
Subject: [linux-next:master 8675/9984] include/linux/fortify-string.h:59:33:
 warning: '__builtin_memset' writing 16 bytes into a region of size 0
 overflows the destination
Message-ID: <202310060514.FaOb6mZy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7d730f1bf6f39ece2d9f3ae682f12e5b593d534d
commit: caacbdc28f545744770fb2caf347b3c4be9a6299 [8675/9984] Merge tag 'drm-intel-gt-next-2023-09-28' of git://anongit.freedesktop.org/drm/drm-intel into drm-next
config: i386-buildonly-randconfig-002-20231006 (https://download.01.org/0day-ci/archive/20231006/202310060514.FaOb6mZy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310060514.FaOb6mZy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310060514.FaOb6mZy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:254,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/pm_runtime.h:11,
                    from drivers/gpu/drm/i915/gt/intel_rc6.c:6:
   In function 'rc6_res_reg_init',
       inlined from 'intel_rc6_init' at drivers/gpu/drm/i915/gt/intel_rc6.c:610:2:
>> include/linux/fortify-string.h:59:33: warning: '__builtin_memset' writing 16 bytes into a region of size 0 overflows the destination [-Wstringop-overflow=]
      59 | #define __underlying_memset     __builtin_memset
         |                                 ^
   include/linux/fortify-string.h:516:9: note: in expansion of macro '__underlying_memset'
     516 |         __underlying_memset(p, c, __fortify_size);                      \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:524:25: note: in expansion of macro '__fortify_memset_chk'
     524 | #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
         |                         ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/intel_rc6.c:584:9: note: in expansion of macro 'memset'
     584 |         memset(rc6->res_reg, INVALID_MMIO_REG.reg, sizeof(rc6->res_reg));
         |         ^~~~~~


vim +/__builtin_memset +59 include/linux/fortify-string.h

78a498c3a227f2 Alexander Potapenko 2022-10-24  46  
78a498c3a227f2 Alexander Potapenko 2022-10-24  47  #if defined(__SANITIZE_MEMORY__)
78a498c3a227f2 Alexander Potapenko 2022-10-24  48  /*
78a498c3a227f2 Alexander Potapenko 2022-10-24  49   * For KMSAN builds all memcpy/memset/memmove calls should be replaced by the
78a498c3a227f2 Alexander Potapenko 2022-10-24  50   * corresponding __msan_XXX functions.
78a498c3a227f2 Alexander Potapenko 2022-10-24  51   */
78a498c3a227f2 Alexander Potapenko 2022-10-24  52  #include <linux/kmsan_string.h>
78a498c3a227f2 Alexander Potapenko 2022-10-24  53  #define __underlying_memcpy	__msan_memcpy
78a498c3a227f2 Alexander Potapenko 2022-10-24  54  #define __underlying_memmove	__msan_memmove
78a498c3a227f2 Alexander Potapenko 2022-10-24  55  #define __underlying_memset	__msan_memset
78a498c3a227f2 Alexander Potapenko 2022-10-24  56  #else
a28a6e860c6cf2 Francis Laniel      2021-02-25  57  #define __underlying_memcpy	__builtin_memcpy
a28a6e860c6cf2 Francis Laniel      2021-02-25  58  #define __underlying_memmove	__builtin_memmove
a28a6e860c6cf2 Francis Laniel      2021-02-25 @59  #define __underlying_memset	__builtin_memset
78a498c3a227f2 Alexander Potapenko 2022-10-24  60  #endif
78a498c3a227f2 Alexander Potapenko 2022-10-24  61  

:::::: The code at line 59 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified functions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
