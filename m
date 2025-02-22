Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05032A1CF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 19:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740251107; cv=none; b=ZSSBJeqiuQuhrE2JD1WstwYF6yzbq3WpnWoffXRmgioN4qsuac3ot9BCdlCRA/gZFWagB9zYI7qa7CcRP5wq0JFwbdJcbFrJM7pUBijDR7kFrnnrYMKq6B6FVjuen0DstJFcBDwycxWExGzswyopr/2cI7O5yTplDnEMa/PjY/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740251107; c=relaxed/simple;
	bh=e0GEuN9YijG44MjHuQKFZvHognh/UbIi0xsvsl2SjGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RDwr/WpdSa3Y3R5OuHLkRGO4lLZp8KHvLlpFcGF4Dc01CL/AF5O00tigUq3C1E7U3Hjoqsyq2vTKecNaQpBzIpvHnkoJWPUsuNgIQMxEWu4VaRH6Eu8ceJRXlw73eJMRb92z/HGmsTGcW9GqeVtiPHBpytofHY6+Q4QnuFeEF6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bT+iZwu4; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bT+iZwu4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740251105; x=1771787105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e0GEuN9YijG44MjHuQKFZvHognh/UbIi0xsvsl2SjGM=;
  b=bT+iZwu4ui/pr9ou0+UIPtXMjPkpUEyz6xHVHVT/9++hNatYOoOTIhDq
   ah7kh8pyjD2w4HRPEVUVP5Kcthgne7ukswHB5c6On6v2LWQ8/UgvWN0qG
   ndg8tV1lhq1tV8Fpsw+djQE0kENHE/LHwvqZXfVokbQTwQ5xOWeWQOs+S
   oFmEt0vVOP+KXazVmf9jLz4ldWvnCYemzO76GIE8dZg4JDdW/wl2E653Z
   9dECLraSnDmVuVUJMPefxJRFwKzzwf2At+ITde53JjSHoVJcbobbFybYa
   w3Nu6WJFO7jkU6BAk8cuCTDGnlrZbOuANprWRl1w0FGbT60ju6aWoVN4S
   Q==;
X-CSE-ConnectionGUID: tijs5/xLQqqv385tBtmedQ==
X-CSE-MsgGUID: NmfeazfcS++MuXGxGxTGMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="66422593"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="66422593"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 11:05:04 -0800
X-CSE-ConnectionGUID: hEcs3s+aTtGHovOnX416qA==
X-CSE-MsgGUID: jziaeZrKRumhrycSaGrzyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="115377832"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 22 Feb 2025 11:05:02 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tluo8-0006p1-2Z;
	Sat, 22 Feb 2025 19:05:00 +0000
Date: Sun, 23 Feb 2025 03:04:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 422/422]
 include/linux/overflow.h:60:22: warning: comparison of distinct pointer
 types lacks a cast
Message-ID: <202502230250.42VJrMyQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   e7df0e6776f0469d11ef3e42afbf2f5c16ea5530
commit: 1497a4484cdb2cf6c37960d788fb6ba67567bdb7 [422/422] udf: Avoid excessive partition lengths
config: x86_64-buildonly-randconfig-002-20250222 (https://download.01.org/0day-ci/archive/20250223/202502230250.42VJrMyQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502230250.42VJrMyQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502230250.42VJrMyQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/vmalloc.h:11,
                    from include/asm-generic/io.h:887,
                    from arch/x86/include/asm/io.h:380,
                    from arch/x86/include/asm/realmode.h:15,
                    from arch/x86/include/asm/acpi.h:16,
                    from arch/x86/include/asm/fixmap.h:29,
                    from arch/x86/include/asm/apic.h:11,
                    from arch/x86/include/asm/smp.h:13,
                    from include/linux/smp.h:68,
                    from include/linux/percpu.h:7,
                    from include/linux/arch_topology.h:9,
                    from include/linux/topology.h:30,
                    from include/linux/gfp.h:9,
                    from include/linux/xarray.h:14,
                    from include/linux/radix-tree.h:18,
                    from include/linux/fs.h:15,
                    from fs/udf/udfdecl.h:10,
                    from fs/udf/super.c:41:
   fs/udf/super.c: In function 'udf_fill_partdesc_info':
>> include/linux/overflow.h:60:22: warning: comparison of distinct pointer types lacks a cast
      60 |         (void) (&__a == &__b);                  \
         |                      ^~
   fs/udf/super.c:1162:21: note: in expansion of macro 'check_add_overflow'
    1162 |                 if (check_add_overflow(map->s_partition_len,
         |                     ^~~~~~~~~~~~~~~~~~


vim +60 include/linux/overflow.h

f0907827a8a915 Rasmus Villemoes 2018-05-08  46  
f0907827a8a915 Rasmus Villemoes 2018-05-08  47  #ifdef COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW
f0907827a8a915 Rasmus Villemoes 2018-05-08  48  /*
f0907827a8a915 Rasmus Villemoes 2018-05-08  49   * For simplicity and code hygiene, the fallback code below insists on
f0907827a8a915 Rasmus Villemoes 2018-05-08  50   * a, b and *d having the same type (similar to the min() and max()
f0907827a8a915 Rasmus Villemoes 2018-05-08  51   * macros), whereas gcc's type-generic overflow checkers accept
f0907827a8a915 Rasmus Villemoes 2018-05-08  52   * different types. Hence we don't just make check_add_overflow an
f0907827a8a915 Rasmus Villemoes 2018-05-08  53   * alias for __builtin_add_overflow, but add type checks similar to
f0907827a8a915 Rasmus Villemoes 2018-05-08  54   * below.
f0907827a8a915 Rasmus Villemoes 2018-05-08  55   */
f0907827a8a915 Rasmus Villemoes 2018-05-08  56  #define check_add_overflow(a, b, d) ({		\
f0907827a8a915 Rasmus Villemoes 2018-05-08  57  	typeof(a) __a = (a);			\
f0907827a8a915 Rasmus Villemoes 2018-05-08  58  	typeof(b) __b = (b);			\
f0907827a8a915 Rasmus Villemoes 2018-05-08  59  	typeof(d) __d = (d);			\
f0907827a8a915 Rasmus Villemoes 2018-05-08 @60  	(void) (&__a == &__b);			\
f0907827a8a915 Rasmus Villemoes 2018-05-08  61  	(void) (&__a == __d);			\
f0907827a8a915 Rasmus Villemoes 2018-05-08  62  	__builtin_add_overflow(__a, __b, __d);	\
f0907827a8a915 Rasmus Villemoes 2018-05-08  63  })
f0907827a8a915 Rasmus Villemoes 2018-05-08  64  

:::::: The code at line 60 was first introduced by commit
:::::: f0907827a8a9152aedac2833ed1b674a7b2a44f2 compiler.h: enable builtin overflow checkers and add fallback code

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
