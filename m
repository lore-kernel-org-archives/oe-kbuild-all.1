Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA161E500C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Jul 2025 17:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752339846; cv=none; b=WXAjfYh1jgH8pFOF2WjQw6srsB7Y1chAMVJI7lw9e3PwqBJcfV5Znrmuxk7nheZqmtLB8el87i/VRQbIOXVJ0rJ2tP2p4SJ6Z5yQPrLSAW+vS4ESk1ioqidxD35LrrCTwQYQl0uxnSjcAwRxjEWaZxMssEGA9ivO84ICYGbdPBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752339846; c=relaxed/simple;
	bh=75zheCtF5gGC8y3x1rxTuh/HJ9yYUkJDD9tBsfxfeoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJxklXPHB+FlHnl548L0HmYfiv8p/E2Ly953aHcA12Z2OxvzhSlTlXaLwHEu4RUi3snNBU+35vZsGCNIMwawFaiD20QKAVZszmx6Rf4l7SlO98+81Jj5qHRKNmA41Oaw5bzAFUgrtuPe/wrWm5OYDlugumt8advgGCmU3Ekaf+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AHtEaYQk; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AHtEaYQk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752339844; x=1783875844;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=75zheCtF5gGC8y3x1rxTuh/HJ9yYUkJDD9tBsfxfeoI=;
  b=AHtEaYQk7UyCtJmc8EdcK+4mZS3ExHw5bi+X8uUozl2IBmDUz7saA05o
   nQ4pPlEVqpq01QkG2HcuNEauPGiz839VSzbd0P7tinYsjtjxPEDONdBzl
   efI125EYINvZkiMebgyTFwEBWZf/jYRryYbRpGVK245R5IN2R06PuxPjC
   uihypPFZM7abU4KCsqq1WgKe33lPALepZHawrgWekDR9cReumTSyA8foR
   ir7byBTk5tpfsBOwryN8Lo1EebidvhHmF48n3MVa2IRlDk9MpP58hC8Lz
   dU44yBkD9BTb1m8IweJaIweEbD2lnUV6pTTXxJ/XUGGDBXsAcEhuLinI1
   w==;
X-CSE-ConnectionGUID: FOyw9m3rRFy0IPY8QAQbng==
X-CSE-MsgGUID: 0PA1iS/yRhuKNhY6dFVHsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="57215729"
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="57215729"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 10:04:03 -0700
X-CSE-ConnectionGUID: xXdCFdKUQD65fgWEZhbRfQ==
X-CSE-MsgGUID: +U9XjDozRZSzWjIDWchB2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="162171317"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Jul 2025 10:04:02 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaddo-0007Wd-0z;
	Sat, 12 Jul 2025 17:04:00 +0000
Date: Sun, 13 Jul 2025 01:03:59 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v3 1/4] kernel/api: introduce kernel API specification
 framework
Message-ID: <202507130048.BzMDUyub-lkp@intel.com>
References: <20250711114248.2288591-2-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711114248.2288591-2-sashal@kernel.org>

Hi Sasha,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on uml/next]
[also build test WARNING on uml/fixes tip/x86/core akpm-mm/mm-everything tip/sched/core linus/master v6.16-rc5 next-20250711]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sasha-Levin/kernel-api-introduce-kernel-API-specification-framework/20250711-194622
base:   https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux next
patch link:    https://lore.kernel.org/r/20250711114248.2288591-2-sashal%40kernel.org
patch subject: [RFC v3 1/4] kernel/api: introduce kernel API specification framework
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250713/202507130048.BzMDUyub-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250713/202507130048.BzMDUyub-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507130048.BzMDUyub-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:45:
   io_uring/io_uring.c: In function '__do_kapi_sys_io_uring_enter':
>> include/linux/syscalls.h:136:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     136 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:119:27: note: in expansion of macro '__SC_CAST_TO_S64'
     119 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                           ^
   include/linux/syscalls.h:120:35: note: in expansion of macro '__MAP2'
     120 | #define __MAP3(m,t,a,...) m(t,a), __MAP2(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:121:35: note: in expansion of macro '__MAP3'
     121 | #define __MAP4(m,t,a,...) m(t,a), __MAP3(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:122:35: note: in expansion of macro '__MAP4'
     122 | #define __MAP5(m,t,a,...) m(t,a), __MAP4(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:123:35: note: in expansion of macro '__MAP5'
     123 | #define __MAP6(m,t,a,...) m(t,a), __MAP5(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:124:22: note: in expansion of macro '__MAP6'
     124 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:270:45: note: in expansion of macro '__MAP'
     270 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:237:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     237 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:231:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     231 | #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   io_uring/io_uring.c:3338:1: note: in expansion of macro 'SYSCALL_DEFINE6'
    3338 | SYSCALL_DEFINE6(io_uring_enter, unsigned int, fd, u32, to_submit,
         | ^~~~~~~~~~~~~~~
   io_uring/io_uring.c: In function '__do_kapi_sys_io_uring_setup':
>> include/linux/syscalls.h:136:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     136 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:118:27: note: in expansion of macro '__SC_CAST_TO_S64'
     118 | #define __MAP1(m,t,a,...) m(t,a)
         |                           ^
   include/linux/syscalls.h:119:35: note: in expansion of macro '__MAP1'
     119 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:124:22: note: in expansion of macro '__MAP2'
     124 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:270:45: note: in expansion of macro '__MAP'
     270 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:237:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     237 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:227:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     227 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   io_uring/io_uring.c:3855:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    3855 | SYSCALL_DEFINE2(io_uring_setup, u32, entries,
         | ^~~~~~~~~~~~~~~
--
   In file included from io_uring/register.c:9:
   io_uring/register.c: In function '__do_kapi_sys_io_uring_register':
>> include/linux/syscalls.h:136:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     136 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:119:27: note: in expansion of macro '__SC_CAST_TO_S64'
     119 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                           ^
   include/linux/syscalls.h:120:35: note: in expansion of macro '__MAP2'
     120 | #define __MAP3(m,t,a,...) m(t,a), __MAP2(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:121:35: note: in expansion of macro '__MAP3'
     121 | #define __MAP4(m,t,a,...) m(t,a), __MAP3(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:124:22: note: in expansion of macro '__MAP4'
     124 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:270:45: note: in expansion of macro '__MAP'
     270 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:237:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     237 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   io_uring/register.c:906:1: note: in expansion of macro 'SYSCALL_DEFINE4'
     906 | SYSCALL_DEFINE4(io_uring_register, unsigned int, fd, unsigned int, opcode,
         | ^~~~~~~~~~~~~~~
--
   kernel/api/kernel_api_spec.c: In function 'kapi_validate_param':
>> kernel/api/kernel_api_spec.c:668:42: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     668 |                 const void __user *ptr = (const void __user *)value;
         |                                          ^
   kernel/api/kernel_api_spec.c:687:43: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     687 |                 const char __user *path = (const char __user *)value;
         |                                           ^
   kernel/api/kernel_api_spec.c: In function 'kapi_validate_param_with_context':
   kernel/api/kernel_api_spec.c:753:42: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     753 |                 const void __user *ptr = (const void __user *)value;
         |                                          ^


vim +136 include/linux/syscalls.h

   125	
   126	#define __SC_DECL(t, a)	t a
   127	#define __TYPE_AS(t, v)	__same_type((__force t)0, v)
   128	#define __TYPE_IS_L(t)	(__TYPE_AS(t, 0L))
   129	#define __TYPE_IS_UL(t)	(__TYPE_AS(t, 0UL))
   130	#define __TYPE_IS_LL(t) (__TYPE_AS(t, 0LL) || __TYPE_AS(t, 0ULL))
   131	#define __SC_LONG(t, a) __typeof(__builtin_choose_expr(__TYPE_IS_LL(t), 0LL, 0L)) a
   132	#define __SC_CAST(t, a)	(__force t) a
   133	#define __SC_TYPE(t, a)	t
   134	#define __SC_ARGS(t, a)	a
   135	#define __SC_TEST(t, a) (void)BUILD_BUG_ON_ZERO(!__TYPE_IS_LL(t) && sizeof(t) > sizeof(long))
 > 136	#define __SC_CAST_TO_S64(t, a)	(s64)(a)
   137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
