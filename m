Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0524A923
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jun 2025 04:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751259174; cv=none; b=LadkqiAkbu19BrkqbqCpW271kVwbP1UJWo/HTrrOB5ozSagTARr/Q1HM5TMQR2weL5ncdjHajwgDAckPZwMbFle6qA8vfdOaU8eFPzZUji1NQmSH93YsZdc+ZoZhki/+tOP2/YW3Xb3au7/3ZErIZAo8AjJt94tPvCkaD0ilx+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751259174; c=relaxed/simple;
	bh=LqcgP3gFrwZ1audwAp7WrmXzq0ML9himVFXysxrgZ0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HCKQZLC0mn0W3sk/XeFvXsb6haNjCQ8/5TtbzfS/6qgHEIDGGXaaX+k4V+82Y4QtSUzLB4WU9JVCZK8OT+kIlZUZED4wRG4RJVUB0Knm/YA6a2ggM/KCNJ4gWrnfe6QlxEm42YmOxCXdtky1q/7NxoRRxg/MNNG0hlljWjnQGmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6OSHXKy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6OSHXKy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751259171; x=1782795171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LqcgP3gFrwZ1audwAp7WrmXzq0ML9himVFXysxrgZ0A=;
  b=M6OSHXKyhFyiNVLcDuv0FBXhCL8hXZ4tQOZihA0fkR3zhwR6ecbeEujQ
   XUiXoM2ElLEGZpPxOfvxIT60lPp6+NHPwbCSq9p+WIC+1IH0b7lWli15J
   uK1vIWiMZeFW/BLRNYqh7kW8pEyBXOPtmGnMKZa9dSmt6lGFfi6Vw6tML
   2EysTujnEH0RIKGvRzhxmHWUFru6NenfQRb+/gc4q7msBulyv2bdHJ77b
   IdQR/E5eoFZNx2qUETkwpgJqiLc6+T4a/VB8UggvJYkpRHpK95uVTTAg6
   0XkhlCF8wQobDMxDT47iWzIdAeWaw+ua0ks1JUMAcq9rtXWROtAA6vCgY
   Q==;
X-CSE-ConnectionGUID: FH/OBhoZQjOCNl1/c76dUA==
X-CSE-MsgGUID: qBkCqBvxTNWwMYaP9GaP/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53338173"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53338173"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 21:52:51 -0700
X-CSE-ConnectionGUID: PnzjdBvTT+GlV7jegUEoFg==
X-CSE-MsgGUID: QvJ+aotvTjSybZ1uxetBRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="153089206"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 29 Jun 2025 21:52:50 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uW6Vc-000131-0A;
	Mon, 30 Jun 2025 04:52:48 +0000
Date: Mon, 30 Jun 2025 06:52:02 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 1/1] include/linux/kernel.h:843:43:
 warning: comparison of distinct pointer types lacks a cast
Message-ID: <202506300640.42SWZMFf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   14b655c6b6487670ee48bc9b760aefb4412b0f78
commit: f4b0174e9f18aaba59ee6ffdaf8827a7f94eb606 [1/1] tracing: Fix oob write in trace_seq_to_buffer()
config: i386-randconfig-2001-20250626 (https://download.01.org/0day-ci/archive/20250630/202506300640.42SWZMFf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506300640.42SWZMFf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506300640.42SWZMFf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/trace.c:925:6: warning: no previous prototype for 'tracing_snapshot_instance_cond' [-Wmissing-prototypes]
     925 | void tracing_snapshot_instance_cond(struct trace_array *tr, void *cond_data)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/bug.h:19,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:9,
                    from include/linux/ring_buffer.h:5,
                    from kernel/trace/trace.c:15:
   kernel/trace/trace.c: In function 'tracing_splice_read_pipe':
>> include/linux/kernel.h:843:43: warning: comparison of distinct pointer types lacks a cast
     843 |                 (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                           ^~
   include/linux/kernel.h:857:18: note: in expansion of macro '__typecheck'
     857 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~
   include/linux/kernel.h:867:31: note: in expansion of macro '__safe_cmp'
     867 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~
   include/linux/kernel.h:876:25: note: in expansion of macro '__careful_cmp'
     876 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   kernel/trace/trace.c:6334:43: note: in expansion of macro 'min'
    6334 |                                           min((size_t)trace_seq_used(&iter->seq),
         |                                           ^~~
   kernel/trace/trace.c: At top level:
   kernel/trace/trace.c:8538:21: warning: no previous prototype for 'trace_array_create' [-Wmissing-prototypes]
    8538 | struct trace_array *trace_array_create(const char *name)
         |                     ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:8661:5: warning: no previous prototype for 'trace_array_destroy' [-Wmissing-prototypes]
    8661 | int trace_array_destroy(struct trace_array *this_tr)
         |     ^~~~~~~~~~~~~~~~~~~


vim +843 include/linux/kernel.h

526211bc58c4b3 Ingo Molnar    2009-03-05  829  
^1da177e4c3f41 Linus Torvalds 2005-04-16  830  /*
3c8ba0d61d04ce Kees Cook      2018-03-30  831   * min()/max()/clamp() macros must accomplish three things:
3c8ba0d61d04ce Kees Cook      2018-03-30  832   *
3c8ba0d61d04ce Kees Cook      2018-03-30  833   * - avoid multiple evaluations of the arguments (so side-effects like
3c8ba0d61d04ce Kees Cook      2018-03-30  834   *   "x++" happen only once) when non-constant.
3c8ba0d61d04ce Kees Cook      2018-03-30  835   * - perform strict type-checking (to generate warnings instead of
3c8ba0d61d04ce Kees Cook      2018-03-30  836   *   nasty runtime surprises). See the "unnecessary" pointer comparison
3c8ba0d61d04ce Kees Cook      2018-03-30  837   *   in __typecheck().
3c8ba0d61d04ce Kees Cook      2018-03-30  838   * - retain result as a constant expressions when called with only
3c8ba0d61d04ce Kees Cook      2018-03-30  839   *   constant expressions (to avoid tripping VLA warnings in stack
3c8ba0d61d04ce Kees Cook      2018-03-30  840   *   allocation usage).
3c8ba0d61d04ce Kees Cook      2018-03-30  841   */
3c8ba0d61d04ce Kees Cook      2018-03-30  842  #define __typecheck(x, y) \
3c8ba0d61d04ce Kees Cook      2018-03-30 @843  		(!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
3c8ba0d61d04ce Kees Cook      2018-03-30  844  

:::::: The code at line 843 was first introduced by commit
:::::: 3c8ba0d61d04ced9f8d9ff93977995a9e4e96e91 kernel.h: Retain constant expression output for max()/min()

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
