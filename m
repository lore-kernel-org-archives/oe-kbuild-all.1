Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46FD34DB40
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 19:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763665629; cv=none; b=OgqFeWOt5QSD6CZMqwL555UWVidLyo9XAHsdF4OEjJhF4MQgmxk8nJA9xAFPzHKh7ggm47b4M2FvuWhHsK27xnK/0UkIGm3TXsMjaFU6h/03S9aHlWk7SXSLHkhYO4f1xbDkZOQ0UBo2zz+vaqXJWBa6d+OVlFIa4wHboT6Tpj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763665629; c=relaxed/simple;
	bh=gxq0WZABIvgM57+JAaaRj5krk1KaHwtpn2X0SrPxuv8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XKYVTHRpP3ETVd029CsdYkwCvRYWRwhO9WDMFF1JfJ5dLAJyRgQE2klNiphi5ZjcNv3om0Pq1VaQvZjchPQi+5T9uKd48fLqGw9mJ7omSiJ/A9VsgD0PwVXcVE/bmXHuxlyHiEuxrV/vM1TIbLBDS68ODcJc4MbhEWn2qRQEuLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=elGQ3epH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="elGQ3epH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763665628; x=1795201628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gxq0WZABIvgM57+JAaaRj5krk1KaHwtpn2X0SrPxuv8=;
  b=elGQ3epH8Pf0AtEDKgp890mqJRIuM3OyIe/Vp3bz1ANahyLwIdVkf/J+
   Mqq9grpl2y8MffN6DVpVOgNfU2fGRFwWztqD2m0LoQj8e2YkJCtwvv2WQ
   pmP2tecNBU8MkKFKcdMwkIYlNbrx5H9whP+SUgfy6hoo/nmgL/QKh0hn8
   HHV2FC43K31dP1KfT3Tfn3D2Cs0p9/iG565rz2u9wwR6GOLc+IOJFI/ga
   +JholO0895/RStcYO3yyfTEC7sggA1IXgweUwYKcxozYNdydA4cX4n96Z
   u8Xgcs+ysqCFGaEydzvZ1tI9fQ1aL3EkwbbSW+lNBWvLDVUf5dDB1Tnl5
   A==;
X-CSE-ConnectionGUID: JJFAeJRmQPeFShPGeF9ucg==
X-CSE-MsgGUID: laweXMBqTraZPT1gXTjQcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="83371145"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="83371145"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 11:07:05 -0800
X-CSE-ConnectionGUID: aAknz6tBR2ic0ED6QBp/vA==
X-CSE-MsgGUID: aLv5+90kS7Gla9TrjxiWow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="191561614"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Nov 2025 11:07:03 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vM9zh-0004QJ-0X;
	Thu, 20 Nov 2025 19:07:01 +0000
Date: Fri, 21 Nov 2025 03:06:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 3/3]
 include/linux/static_call_types.h:15:41: error:
 '__SCT__tp_func_rcu_stall_warning' undeclared here (not in a function); did
 you mean '__SCK__tp_func_rcu_stall_warning'?
Message-ID: <202511210255.xXv2kLQZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   c44656175b42290d0fca41fa16d6002fc65ad1ee
commit: d35bd9468fc35137ce63aff26dcb4bb3856d1657 [3/3] ANDROID: rcu: allow hooks into rcu stall warning
config: x86_64-randconfig-6001-20251120 (https://download.01.org/0day-ci/archive/20251121/202511210255.xXv2kLQZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511210255.xXv2kLQZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511210255.xXv2kLQZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:8,
                    from kernel/rcu/update.c:21:
   include/linux/tracepoint.h:328:27: error: '__tracepoint_rcu_stall_warning' undeclared here (not in a function); did you mean '__tracepoint_rcu_utilization'?
     328 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^~~~~~~~~~~~~
   include/linux/export.h:100:23: note: in definition of macro '___EXPORT_SYMBOL'
     100 |         extern typeof(sym) sym;                                                 \
         |                       ^~~
   include/linux/export.h:161:41: note: in expansion of macro '__EXPORT_SYMBOL'
     161 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:165:41: note: in expansion of macro '_EXPORT_SYMBOL'
     165 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "_gpl")
         |                                         ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:328:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     328 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |         ^~~~~~~~~~~~~~~~~
   kernel/rcu/update.c:52:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
      52 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:329:27: error: '__traceiter_rcu_stall_warning' undeclared here (not in a function); did you mean '__tracepoint_rcu_stall_warning'?
     329 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^~~~~~~~~~~~
   include/linux/export.h:100:23: note: in definition of macro '___EXPORT_SYMBOL'
     100 |         extern typeof(sym) sym;                                                 \
         |                       ^~~
   include/linux/export.h:161:41: note: in expansion of macro '__EXPORT_SYMBOL'
     161 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:165:41: note: in expansion of macro '_EXPORT_SYMBOL'
     165 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "_gpl")
         |                                         ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:329:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     329 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |         ^~~~~~~~~~~~~~~~~
   kernel/rcu/update.c:52:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
      52 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:9:41: error: '__SCK__tp_func_rcu_stall_warning' undeclared here (not in a function); did you mean '__SCK__tp_func_rcu_utilization'?
       9 | #define STATIC_CALL_KEY_PREFIX          __SCK__
         |                                         ^~~~~~~
   include/linux/export.h:100:23: note: in definition of macro '___EXPORT_SYMBOL'
     100 |         extern typeof(sym) sym;                                                 \
         |                       ^~~
   include/linux/export.h:161:41: note: in expansion of macro '__EXPORT_SYMBOL'
     161 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:165:41: note: in expansion of macro '_EXPORT_SYMBOL'
     165 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "_gpl")
         |                                         ^~~~~~~~~~~~~~
   include/linux/static_call.h:207:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     207 |         EXPORT_SYMBOL_GPL(STATIC_CALL_KEY(name));                       \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:60:22: note: in expansion of macro '___PASTE'
      60 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/static_call_types.h:12:41: note: in expansion of macro '__PASTE'
      12 | #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:12:49: note: in expansion of macro 'STATIC_CALL_KEY_PREFIX'
      12 | #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:207:27: note: in expansion of macro 'STATIC_CALL_KEY'
     207 |         EXPORT_SYMBOL_GPL(STATIC_CALL_KEY(name));                       \
         |                           ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:330:9: note: in expansion of macro 'EXPORT_STATIC_CALL_GPL'
     330 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/update.c:52:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
      52 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/static_call_types.h:15:41: error: '__SCT__tp_func_rcu_stall_warning' undeclared here (not in a function); did you mean '__SCK__tp_func_rcu_stall_warning'?
      15 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/export.h:100:23: note: in definition of macro '___EXPORT_SYMBOL'
     100 |         extern typeof(sym) sym;                                                 \
         |                       ^~~
   include/linux/export.h:161:41: note: in expansion of macro '__EXPORT_SYMBOL'
     161 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:165:41: note: in expansion of macro '_EXPORT_SYMBOL'
     165 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "_gpl")
         |                                         ^~~~~~~~~~~~~~
   include/linux/static_call.h:208:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     208 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:60:22: note: in expansion of macro '___PASTE'
      60 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/static_call_types.h:18:41: note: in expansion of macro '__PASTE'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:18:49: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:208:27: note: in expansion of macro 'STATIC_CALL_TRAMP'
     208 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
         |                           ^~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:330:9: note: in expansion of macro 'EXPORT_STATIC_CALL_GPL'
     330 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/update.c:52:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
      52 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +15 include/linux/static_call_types.h

115284d89a436e Josh Poimboeuf 2020-08-18  14  
115284d89a436e Josh Poimboeuf 2020-08-18 @15  #define STATIC_CALL_TRAMP_PREFIX	__SCT__
115284d89a436e Josh Poimboeuf 2020-08-18  16  #define STATIC_CALL_TRAMP_PREFIX_STR	__stringify(STATIC_CALL_TRAMP_PREFIX)
9183c3f9ed710a Josh Poimboeuf 2020-08-18  17  #define STATIC_CALL_TRAMP_PREFIX_LEN	(sizeof(STATIC_CALL_TRAMP_PREFIX_STR) - 1)
115284d89a436e Josh Poimboeuf 2020-08-18  18  #define STATIC_CALL_TRAMP(name)		__PASTE(STATIC_CALL_TRAMP_PREFIX, name)
115284d89a436e Josh Poimboeuf 2020-08-18  19  #define STATIC_CALL_TRAMP_STR(name)	__stringify(STATIC_CALL_TRAMP(name))
115284d89a436e Josh Poimboeuf 2020-08-18  20  

:::::: The code at line 15 was first introduced by commit
:::::: 115284d89a436e9b66da0c6c4f6efded806874b2 static_call: Add basic static call infrastructure

:::::: TO: Josh Poimboeuf <jpoimboe@redhat.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
