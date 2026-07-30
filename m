Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D03419304
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 14:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785423577; cv=none; b=W8lRZb56EvrccSOMOwSNl8YVAyloQ4fBxLih0f+oHX1QQnIhQvigk1RRJackr2aPrL0Q6laEVwEEPxWVqUjx63w2TSb6Q+PMU/wgR8DpdLRKtIxo5+Szon6P/cv1WCRUCPBXd1G4MG3UlMbZJfVPwJcPzp1OqNryzcf3DYfilBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785423577; c=relaxed/simple;
	bh=DUvNxK0xicMt0oKNq+4lz950+jRse24clv8nEP7Op6c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U8hv9aOiojTyLevMjvjdfMMsdO9BQOohH6z+/HE9Lmqkqps/B2gjR8+qb0lznMqPBHp/+j2ohFyHwVh1p6LZl+lBiJJ5LDTCRa90lfJ940mO+orZc0wCqnmmr13GXsJVha0Sr10UyXU3LlDNoiTRGXkZ/2zdLZpdmWVpAadbNlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MA9+BbYV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MA9+BbYV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785423576; x=1816959576;
  h=date:from:to:cc:subject:message-id;
  bh=DUvNxK0xicMt0oKNq+4lz950+jRse24clv8nEP7Op6c=;
  b=MA9+BbYV7Qvndii1YcIzu1Uto423QH/olK9nh7MeGUQqL1cunPiVFS8k
   rgeHEAEW4TOo3s4ZXnb9TqluIEeUcyzFpSZish+YOgAvlMTuW6dUXLg1Z
   C1AwI/clsD62mMfDnF6eKjabeju4lIv4TpOe4c3P5JeJthGeo16jcAzUn
   HuEdyssTHt1aYIVCN/JpG679XAq81W5CxiOj0LKrkKpxTMFh/2b1vRRAN
   QOG8gGjVX8JoMs4la7J7/Q2aSh4YGdYVRjwc/0UBy0ey/yUE0jIcOebgF
   ewR0BkXXRcIqzDLnxkwqNprKsf7KCupkYPIzkHDNcWlPT3h9RQF6eAqh7
   w==;
X-CSE-ConnectionGUID: VYTBkj3eSMOD2LywOHz7NQ==
X-CSE-MsgGUID: L2EPmXW+Ssy6xcMcNqyPYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86163310"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="86163310"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 07:59:35 -0700
X-CSE-ConnectionGUID: anYakXIfTXqFLAJYR1ubuA==
X-CSE-MsgGUID: yzVieAr6RBeiMuyE2P0n3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="260929918"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 30 Jul 2026 07:59:34 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpSEN-00000000gqr-3Wgt;
	Thu, 30 Jul 2026 14:59:31 +0000
Date: Thu, 30 Jul 2026 22:59:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev 20/44] include/asm-generic/rwonce.h:44:71:
 error: lvalue required as unary '&' operand
Message-ID: <202607302239.2jZZ5SMJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/paulmckrcu/linux dev
head:   9df1c10e4ddffa50d054112facefa25376c7a219
commit: 5fac52664a4c35c288966854574589a2d08c8107 [20/44] hrtimer: Apply {READ,WRITE}_ONCE() to hrtimer_resolution accesses
config: x86_64-buildonly-randconfig-006-20260730 (https://download.01.org/0day-ci/archive/20260730/202607302239.2jZZ5SMJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607302239.2jZZ5SMJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607302239.2jZZ5SMJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:369,
                    from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from arch/x86/include/asm/cache.h:5,
                    from include/vdso/cache.h:5,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from include/linux/compat.h:10,
                    from kernel/time/posix-timers.c:12:
   kernel/time/posix-timers.c: In function 'posix_get_hrtimer_res':
>> include/asm-generic/rwonce.h:44:71: error: lvalue required as unary '&' operand
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                       ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   kernel/time/posix-timers.c:275:23: note: in expansion of macro 'READ_ONCE'
     275 |         tp->tv_nsec = READ_ONCE(hrtimer_resolution);
         |                       ^~~~~~~~~
--
   In file included from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:369,
                    from include/linux/proc_fs.h:8,
                    from kernel/time/timer_list.c:8:
   kernel/time/timer_list.c: In function 'print_base':
>> include/asm-generic/rwonce.h:44:71: error: lvalue required as unary '&' operand
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                       ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   kernel/time/timer_list.c:102:52: note: in expansion of macro 'READ_ONCE'
     102 |         SEQ_printf(m, "  .resolution: %u nsecs\n", READ_ONCE(hrtimer_resolution));
         |                                                    ^~~~~~~~~
--
   In file included from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:369,
                    from include/linux/dev_printk.h:14,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/time/hrtimer.c:25:
   kernel/time/hrtimer.c: In function 'hrtimer_forward':
>> include/asm-generic/rwonce.h:44:71: error: lvalue required as unary '&' operand
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                       ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   kernel/time/hrtimer.c:1075:15: note: in expansion of macro 'READ_ONCE'
    1075 |         res = READ_ONCE(hrtimer_resolution);
         |               ^~~~~~~~~


vim +44 include/asm-generic/rwonce.h

e506ea451254ab1 Will Deacon 2019-10-15  28  
e506ea451254ab1 Will Deacon 2019-10-15  29  /*
e506ea451254ab1 Will Deacon 2019-10-15  30   * Yes, this permits 64-bit accesses on 32-bit architectures. These will
e506ea451254ab1 Will Deacon 2019-10-15  31   * actually be atomic in some cases (namely Armv7 + LPAE), but for others we
e506ea451254ab1 Will Deacon 2019-10-15  32   * rely on the access being split into 2x32-bit accesses for a 32-bit quantity
e506ea451254ab1 Will Deacon 2019-10-15  33   * (e.g. a virtual address) and a strong prevailing wind.
e506ea451254ab1 Will Deacon 2019-10-15  34   */
e506ea451254ab1 Will Deacon 2019-10-15  35  #define compiletime_assert_rwonce_type(t)					\
e506ea451254ab1 Will Deacon 2019-10-15  36  	compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),	\
e506ea451254ab1 Will Deacon 2019-10-15  37  		"Unsupported access size for {READ,WRITE}_ONCE().")
e506ea451254ab1 Will Deacon 2019-10-15  38  
e506ea451254ab1 Will Deacon 2019-10-15  39  /*
e506ea451254ab1 Will Deacon 2019-10-15  40   * Use __READ_ONCE() instead of READ_ONCE() if you do not require any
3c9184109e78ea2 Will Deacon 2019-10-30  41   * atomicity. Note that this may result in tears!
e506ea451254ab1 Will Deacon 2019-10-15  42   */
b78b331a3f5c077 Will Deacon 2019-10-15  43  #ifndef __READ_ONCE
e506ea451254ab1 Will Deacon 2019-10-15 @44  #define __READ_ONCE(x)	(*(const volatile __unqual_scalar_typeof(x) *)&(x))
b78b331a3f5c077 Will Deacon 2019-10-15  45  #endif
e506ea451254ab1 Will Deacon 2019-10-15  46  

:::::: The code at line 44 was first introduced by commit
:::::: e506ea451254ab17e0bf918ca36232fec2a9b10c compiler.h: Split {READ,WRITE}_ONCE definitions out into rwonce.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
