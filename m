Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B2A286881
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Aug 2026 17:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787938168; cv=none; b=PhrunHbayG7qxH+gqdWyQh+mBUqBhThEEbrqNNHyCV50ubHvrKSjRaXTAeoUw+LopFQOek7QjPRi2qvmemyy+Zi4iAU/i41fvB2QLwkFxH3pQRUsgKjlhIInpJ3zLKAWr6rXstQ326D7oZ567Fyr45uiS8psbAIqLtGlvKU88qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787938168; c=relaxed/simple;
	bh=zF/V83Ptrh8T8W0dDXFZ3x+pY/XEekkHfT/SSyPAEzI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aHFTW8hEuUsuC2CiDuRt/6CgANFUUcVCwQJg89NCa0hm+ahP3AVWsVnRy7/ZZ9PYe9RHXEHUvm5kbBAmk1eifqTfGi8vnYyXH15fGpRt8bv05l5iUz7OvAn/gZV32o0a1Ne0i63HD2oS5U05LuF1HfCjeXHvk8pIyft7R7xIg3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WIEI5ZLj; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WIEI5ZLj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787938166; x=1819474166;
  h=date:from:to:cc:subject:message-id;
  bh=zF/V83Ptrh8T8W0dDXFZ3x+pY/XEekkHfT/SSyPAEzI=;
  b=WIEI5ZLj5Du82x8rpTQ4yaVdv9ykMy7v0K6qcrl+pFyg11gGd16UmWjM
   vEHeJZXhQEE7VO+GJhtzMFaRNtLc8qJCGU6gzCvmHK6jr1Pe8/WkxDHvz
   waqi2Q22CrdWIH/iZSSIx7yselt1GW42ofEgnNQgbjUhwLLa0RwMtUqRb
   S/rw7iKOkaQEmh85VGXoJC+5JL5RLbhPvECWr5yNXxHEMp4S7Ott1D0Ac
   m6uwR9mY3fCqrmXiY7tI8Vyc1bn0LFessQmP8DCEQIRI8LRwGs+fEMIeD
   Vyk/hZRk8YtPpEJY2E5mpJoB/UDXPcM0u2xATuRdrhVYJoMkwr1gv+31L
   A==;
X-CSE-ConnectionGUID: kWfr2FMEQiehOTTXYXrMkg==
X-CSE-MsgGUID: GXDOwD78Ql+5pLSBmV8oCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="98789089"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="98789089"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 10:29:26 -0700
X-CSE-ConnectionGUID: mC/fe+H6RSabsSF2LuF+kA==
X-CSE-MsgGUID: MJodwnrrSZyaGr14pljE2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="271739886"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Aug 2026 10:29:25 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x00OI-00000000Blk-1uG2;
	Fri, 28 Aug 2026 17:29:22 +0000
Date: Sat, 29 Aug 2026 01:29:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2026-06 22/22]
 include/trace/trace_events.h:27:23: warning: 'str__blk__trace_system_name'
 defined but not used
Message-ID: <202608290148.9DYuR7Gv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Yang,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15-2026-06
head:   0e42d41ff6e0ee8605c48555f92c08788644304b
commit: 610af57e7aa988b6d726c46f0f446f051969702a [22/22] ANDROID: vendor_hooks: select workqueue based on task priority
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260829/202608290148.9DYuR7Gv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260829/202608290148.9DYuR7Gv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608290148.9DYuR7Gv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/skmsg.h:12,
                    from drivers/android/vendor_hooks.c:22:
   include/net/sock.h: In function '__dst_negative_advice':
   include/net/sock.h:2169:35: warning: cast between incompatible function types from 'struct dst_entry * (*)(struct dst_entry *)' to 'void (*)(struct sock *, struct dst_entry *)' [-Wcast-function-type]
    2169 |                 negative_advice = (android_dst_ops_negative_advice_new_t)dst->ops->negative_advice;
         |                                   ^
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/blk.h:26,
                    from drivers/android/vendor_hooks.c:119:
   include/trace/trace_events.h: At top level:
>> include/trace/trace_events.h:27:23: warning: 'str__blk__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/asoc.h:15,
                    from drivers/android/vendor_hooks.c:118:
   include/trace/trace_events.h:27:23: warning: 'str__asoc__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/fuse.h:24,
                    from drivers/android/vendor_hooks.c:117:
   include/trace/trace_events.h:27:23: warning: 'str__fuse__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/tmpfile.h:39,
                    from drivers/android/vendor_hooks.c:116:
   include/trace/trace_events.h:27:23: warning: 'str__tmpfile__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/delayacct.h:65,
                    from drivers/android/vendor_hooks.c:115:
   include/trace/trace_events.h:27:23: warning: 'str__delayacct__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/psi.h:25,
                    from drivers/android/vendor_hooks.c:114:
   include/trace/trace_events.h:27:23: warning: 'str__psi__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |         static const char TRACE_SYSTEM_STRING[] =       \

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRYPTO_CURVE25519_NEON
   Depends on [n]: CRYPTO [=y] && ARM_CRYPTO [=y] && KERNEL_MODE_NEON [=y] && !CPU_BIG_ENDIAN [=y]
   Selected by [y]:
   - WIREGUARD [=y] && NETDEVICES [=y] && NET_CORE [=y] && NET [=y] && INET [=y] && (IPV6 [=y] || !IPV6 [=y]) && ARM [=y] && KERNEL_MODE_NEON [=y]


vim +/str__blk__trace_system_name +27 include/trace/trace_events.h

acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  26) 
acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31 @27) #define __app__(x, y) str__##x##y
acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  28) #define __app(x, y) __app__(x, y)
acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  29) 

:::::: The code at line 27 was first introduced by commit
:::::: acd388fd3af350ab24c6ab6f19b83fc4a4f3aa60 tracing: Give system name a pointer

:::::: TO: Steven Rostedt (Red Hat) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
