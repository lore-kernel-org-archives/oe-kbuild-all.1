Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AEB386450
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 12:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782993796; cv=none; b=bGwLJZQ35sMZmjUarOhEh651+X1r2a5BqTa/fQ5WYxcLyyaxr7SNjFvQM4+jn3bfwIzBA4oWEelYCeUeRO45KqNoMk+a5Sr8Fy6RWgfcZT0sVuuQdKcjmuUOChx+m/fpeiLYZEX2WqsN6zh5gwcjtGgw+sJ7Z/GHWauNZ4RZr+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782993796; c=relaxed/simple;
	bh=0Wx9LMLU9Q+f7jrviIY1ajFVGxNyT1onDubGHELU9b8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IVNTaYwjPnrvl96sdTZMLhgc1M3Q6ZaDCkPbK6BTlxv5JgrPqN8q7K7/4olVrOWHr4ZCxvwGaAHcnLUAZzqdU25EtWzJtg0MCc1+DD9vc3vYIT0wyFqVQkOgsf52VVCROrhCVgysjzhVrAzjviOVAj1jbOZeYfiexWY8a0dSCX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cIytdAz6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cIytdAz6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782993793; x=1814529793;
  h=date:from:to:cc:subject:message-id;
  bh=0Wx9LMLU9Q+f7jrviIY1ajFVGxNyT1onDubGHELU9b8=;
  b=cIytdAz6VH+C38gFl3kqxI5SRayffY4M8s2haaLRmEM58qDQCsGWKiYd
   ozUNeUntZ/TI28uMHJ1HMCHJtbEmdNmi+Cwi5kNl0pgRjEzRdoTS7wRCP
   AoonTYkrTSTZyxnPPcfN9JnszAjOqBhGFldeXAuzjPhCY+FjZ8HM53M1X
   pOm4wFJHYstV1w2HEALz47L9bjiXLbAK1jLg/xTJ8ZmGhmQnN2JDo+ouC
   m9utAOAW5iBIUR2VeCoogRWcWO3HeHMtg034zqA4ePNaL/+Z0hCS1iRNX
   db23Go9Hb4YzGSZGQMCQfP9pRGRqDCPO35WwW2G9dxcGBbi+lfzWF9is3
   Q==;
X-CSE-ConnectionGUID: R7KgPnI2ToiJho9sH5DaYw==
X-CSE-MsgGUID: 65JcTzLaSbG3WDDm/7GwEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82857919"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="82857919"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 05:03:11 -0700
X-CSE-ConnectionGUID: 8q/beqhhRAOmWVMekcUQLg==
X-CSE-MsgGUID: FOL3a/+jSuGOQXTPzocBeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="290967883"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Jul 2026 05:03:08 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfG8H-00000000AlB-3hbO;
	Thu, 02 Jul 2026 12:03:05 +0000
Date: Thu, 02 Jul 2026 20:02:51 +0800
From: kernel test robot <lkp@intel.com>
To: Taeyang Lee <0wn@theori.io>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:perf/urgent 1/4]
 kernel/events/core.c:13882:24: warning: 'alias' attribute ignored
Message-ID: <202607021921.ggFEwesi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/urgent
head:   91a15888098678641edd3ef4f5d66fa7e77dcc28
commit: f60c8830996ca8e468f96cc3ae79aab1e6fbfb12 [1/4] perf/core: Detach event groups during remove_on_exec
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260702/202607021921.ggFEwesi-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021921.ggFEwesi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021921.ggFEwesi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/syscalls.h:120:35: note: in expansion of macro '__MAP2'
     120 | #define __MAP3(m,t,a,...) m(t,a), __MAP2(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:121:35: note: in expansion of macro '__MAP3'
     121 | #define __MAP4(m,t,a,...) m(t,a), __MAP3(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:122:35: note: in expansion of macro '__MAP4'
     122 | #define __MAP5(m,t,a,...) m(t,a), __MAP4(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:124:22: note: in expansion of macro '__MAP5'
     124 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:183:17: note: in expansion of macro '__MAP'
     183 |                 __MAP(nb,__SC_STR_ADECL,__VA_ARGS__)            \
         |                 ^~~~~
   include/linux/syscalls.h:235:9: note: in expansion of macro 'SYSCALL_METADATA'
     235 |         SYSCALL_METADATA(sname, x, __VA_ARGS__)                 \
         |         ^~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   kernel/events/core.c:13883:8: note: (near initialization for 'args__perf_event_open')
   include/linux/syscalls.h:138:34: note: in definition of macro '__SC_STR_ADECL'
     138 | #define __SC_STR_ADECL(t, a)    #a
         |                                  ^
   include/linux/syscalls.h:119:35: note: in expansion of macro '__MAP1'
     119 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:120:35: note: in expansion of macro '__MAP2'
     120 | #define __MAP3(m,t,a,...) m(t,a), __MAP2(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:121:35: note: in expansion of macro '__MAP3'
     121 | #define __MAP4(m,t,a,...) m(t,a), __MAP3(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:122:35: note: in expansion of macro '__MAP4'
     122 | #define __MAP5(m,t,a,...) m(t,a), __MAP4(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:124:22: note: in expansion of macro '__MAP5'
     124 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:183:17: note: in expansion of macro '__MAP'
     183 |                 __MAP(nb,__SC_STR_ADECL,__VA_ARGS__)            \
         |                 ^~~~~
   include/linux/syscalls.h:235:9: note: in expansion of macro 'SYSCALL_METADATA'
     235 |         SYSCALL_METADATA(sname, x, __VA_ARGS__)                 \
         |         ^~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:147:40: error: storage class specified for parameter '__syscall_meta__perf_event_open'
     147 |         static struct syscall_metadata __syscall_meta_##sname;          \
         |                                        ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:185:9: note: in expansion of macro 'SYSCALL_TRACE_ENTER_EVENT'
     185 |         SYSCALL_TRACE_ENTER_EVENT(sname);                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:9: note: in expansion of macro 'SYSCALL_METADATA'
     235 |         SYSCALL_METADATA(sname, x, __VA_ARGS__)                 \
         |         ^~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:149:11: error: storage class specified for parameter 'event_enter__perf_event_open'
     149 |           event_enter_##sname = {                                       \
         |           ^~~~~~~~~~~~
   include/linux/syscalls.h:185:9: note: in expansion of macro 'SYSCALL_TRACE_ENTER_EVENT'
     185 |         SYSCALL_TRACE_ENTER_EVENT(sname);                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:9: note: in expansion of macro 'SYSCALL_METADATA'
     235 |         SYSCALL_METADATA(sname, x, __VA_ARGS__)                 \
         |         ^~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:148:23: error: parameter 'event_enter__perf_event_open' is initialized
     148 |         static struct trace_event_call __used                           \
         |                       ^~~~~~~~~~~~~~~~
   include/linux/syscalls.h:185:9: note: in expansion of macro 'SYSCALL_TRACE_ENTER_EVENT'
     185 |         SYSCALL_TRACE_ENTER_EVENT(sname);                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:9: note: in expansion of macro 'SYSCALL_METADATA'
     235 |         SYSCALL_METADATA(sname, x, __VA_ARGS__)                 \
         |         ^~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
>> include/linux/syscalls.h:148:23: warning: 'used' attribute ignored [-Wattributes]
   include/linux/syscalls.h:185:9: note: in expansion of macro 'SYSCALL_TRACE_ENTER_EVENT'
     185 |         SYSCALL_TRACE_ENTER_EVENT(sname);                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:9: note: in expansion of macro 'SYSCALL_METADATA'
     235 |         SYSCALL_METADATA(sname, x, __VA_ARGS__)                 \
         |         ^~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:160:11: error: storage class specified for parameter '__event_enter__perf_event_open'
     160 |          *__event_enter_##sname = &event_enter_##sname;
         |           ^~~~~~~~~~~~~~
   include/linux/syscalls.h:185:9: note: in expansion of macro 'SYSCALL_TRACE_ENTER_EVENT'
     185 |         SYSCALL_TRACE_ENTER_EVENT(sname);                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:9: note: in expansion of macro 'SYSCALL_METADATA'
     235 |         SYSCALL_METADATA(sname, x, __VA_ARGS__)                 \
         |         ^~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:158:23: error: parameter '__event_enter__perf_event_open' is initialized
     158 |         static struct trace_event_call __used                           \
         |                       ^~~~~~~~~~~~~~~~
   include/linux/syscalls.h:185:9: note: in expansion of macro 'SYSCALL_TRACE_ENTER_EVENT'
     185 |         SYSCALL_TRACE_ENTER_EVENT(sname);                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:9: note: in expansion of macro 'SYSCALL_METADATA'
     235 |         SYSCALL_METADATA(sname, x, __VA_ARGS__)                 \
         |         ^~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:158:23: warning: 'used' attribute ignored [-Wattributes]
   include/linux/syscalls.h:185:9: note: in expansion of macro 'SYSCALL_TRACE_ENTER_EVENT'
     185 |         SYSCALL_TRACE_ENTER_EVENT(sname);                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:9: note: in expansion of macro 'SYSCALL_METADATA'
     235 |         SYSCALL_METADATA(sname, x, __VA_ARGS__)                 \
         |         ^~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:160:11: error: section attribute not allowed for '__event_enter__perf_event_open'
     160 |          *__event_enter_##sname = &event_enter_##sname;
         |           ^~~~~~~~~~~~~~
   include/linux/syscalls.h:185:9: note: in expansion of macro 'SYSCALL_TRACE_ENTER_EVENT'
     185 |         SYSCALL_TRACE_ENTER_EVENT(sname);                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:9: note: in expansion of macro 'SYSCALL_METADATA'
     235 |         SYSCALL_METADATA(sname, x, __VA_ARGS__)                 \
         |         ^~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:185:41: error: expected declaration specifiers before ';' token
     185 |         SYSCALL_TRACE_ENTER_EVENT(sname);                       \
         |                                         ^
   include/linux/syscalls.h:235:9: note: in expansion of macro 'SYSCALL_METADATA'
     235 |         SYSCALL_METADATA(sname, x, __VA_ARGS__)                 \
         |         ^~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:163:40: error: storage class specified for parameter '__syscall_meta__perf_event_open'
     163 |         static struct syscall_metadata __syscall_meta_##sname;          \
         |                                        ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:186:9: note: in expansion of macro 'SYSCALL_TRACE_EXIT_EVENT'
     186 |         SYSCALL_TRACE_EXIT_EVENT(sname);                        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:9: note: in expansion of macro 'SYSCALL_METADATA'
     235 |         SYSCALL_METADATA(sname, x, __VA_ARGS__)                 \
         |         ^~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:163:40: error: redefinition of parameter '__syscall_meta__perf_event_open'
   include/linux/syscalls.h:186:9: note: in expansion of macro 'SYSCALL_TRACE_EXIT_EVENT'
     186 |         SYSCALL_TRACE_EXIT_EVENT(sname);                        \
--
     198 |         static struct syscall_metadata __used                   \
         |                       ^~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:9: note: in expansion of macro 'SYSCALL_METADATA'
     235 |         SYSCALL_METADATA(sname, x, __VA_ARGS__)                 \
         |         ^~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:198:23: warning: 'used' attribute ignored [-Wattributes]
   include/linux/syscalls.h:235:9: note: in expansion of macro 'SYSCALL_METADATA'
     235 |         SYSCALL_METADATA(sname, x, __VA_ARGS__)                 \
         |         ^~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:200:11: error: section attribute not allowed for '__p_syscall_meta__perf_event_open'
     200 |          *__p_syscall_meta_##sname = &__syscall_meta_##sname;
         |           ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:9: note: in expansion of macro 'SYSCALL_METADATA'
     235 |         SYSCALL_METADATA(sname, x, __VA_ARGS__)                 \
         |         ^~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   In file included from include/linux/compiler_types.h:173:
   include/linux/compiler-gcc.h:118:33: error: expected declaration specifiers before '#pragma'
     118 | #define __diag(s)               _Pragma(__diag_str(GCC diagnostic s))
         |                                 ^~~~~~~
   include/linux/compiler_types.h:721:25: note: in expansion of macro '__diag'
     721 | #define __diag_push()   __diag(push)
         |                         ^~~~~~
   include/linux/syscalls.h:247:9: note: in expansion of macro '__diag_push'
     247 |         __diag_push();                                                  \
         |         ^~~~~~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   include/linux/compiler-gcc.h:118:33: error: expected declaration specifiers before '#pragma'
     118 | #define __diag(s)               _Pragma(__diag_str(GCC diagnostic s))
         |                                 ^~~~~~~
   include/linux/compiler-gcc.h:121:33: note: in expansion of macro '__diag'
     121 | #define __diag_GCC_8(s)         __diag(s)
         |                                 ^~~~~~
   include/linux/compiler-gcc.h:109:9: note: in expansion of macro '__diag_GCC_8'
     109 |         __diag_GCC_ ## version(__diag_GCC_ ## severity s)
         |         ^~~~~~~~~~~
   include/linux/compiler_types.h:725:9: note: in expansion of macro '__diag_GCC'
     725 |         __diag_ ## compiler(version, ignore, option)
         |         ^~~~~~~
   include/linux/syscalls.h:248:9: note: in expansion of macro '__diag_ignore'
     248 |         __diag_ignore(GCC, 8, "-Wattribute-alias",                      \
         |         ^~~~~~~~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:251:75: error: expected declaration specifiers before ';' token
     251 |                       "Avoid breaking versions without -Wattribute-alias");\
     252 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:253:77: error: expected declaration specifiers before ';' token
     253 |                       "Type aliasing is used to sanitize syscall arguments");\
     254 |         asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))       \
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
>> kernel/events/core.c:13882:24: warning: 'alias' attribute ignored [-Wattributes]
   13882 |                 struct perf_event_attr __user *, attr_uptr,
         |                        ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:126:25: note: in definition of macro '__SC_DECL'
     126 | #define __SC_DECL(t, a) t a
         |                         ^
   include/linux/syscalls.h:124:22: note: in expansion of macro '__MAP5'
     124 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:254:35: note: in expansion of macro '__MAP'
     254 |         asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))       \
         |                                   ^~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   In file included from include/linux/error-injection.h:7,
                    from include/linux/module.h:27,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32:
   include/asm-generic/error-injection.h:30:9: error: storage class specified for parameter '_eil_addr_sys_perf_event_open'
      30 |         _eil_addr_##fname = {                                           \
         |         ^~~~~~~~~~
   include/linux/syscalls.h:256:9: note: in expansion of macro 'ALLOW_ERROR_INJECTION'
     256 |         ALLOW_ERROR_INJECTION(sys##name, ERRNO);                        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   include/asm-generic/error-injection.h:28:15: error: parameter '_eil_addr_sys_perf_event_open' is initialized
      28 | static struct error_injection_entry __used                              \
         |               ^~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:256:9: note: in expansion of macro 'ALLOW_ERROR_INJECTION'
     256 |         ALLOW_ERROR_INJECTION(sys##name, ERRNO);                        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
>> include/asm-generic/error-injection.h:28:15: warning: 'used' attribute ignored [-Wattributes]
   include/linux/syscalls.h:256:9: note: in expansion of macro 'ALLOW_ERROR_INJECTION'
     256 |         ALLOW_ERROR_INJECTION(sys##name, ERRNO);                        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   include/asm-generic/error-injection.h:30:9: error: section attribute not allowed for '_eil_addr_sys_perf_event_open'
      30 |         _eil_addr_##fname = {                                           \
         |         ^~~~~~~~~~
   include/linux/syscalls.h:256:9: note: in expansion of macro 'ALLOW_ERROR_INJECTION'
     256 |         ALLOW_ERROR_INJECTION(sys##name, ERRNO);                        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:257:28: error: storage class specified for parameter '__do_sys_perf_event_open'
     257 |         static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));\
         |                            ^~~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
>> include/linux/syscalls.h:257:28: warning: parameter '__do_sys_perf_event_open' declared 'inline'
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   kernel/events/core.c:13882:24: warning: 'gnu_inline' attribute ignored [-Wattributes]
   13882 |                 struct perf_event_attr __user *, attr_uptr,
         |                        ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:126:25: note: in definition of macro '__SC_DECL'
     126 | #define __SC_DECL(t, a) t a
         |                         ^
   include/linux/syscalls.h:124:22: note: in expansion of macro '__MAP5'
     124 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:257:43: note: in expansion of macro '__MAP'
     257 |         static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));\
         |                                           ^~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:257:28: error: 'no_instrument_function' attribute applies only to functions
     257 |         static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));\
         |                            ^~~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:260:9: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     260 |         {                                                               \
         |         ^
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   include/linux/compiler-gcc.h:118:33: error: expected declaration specifiers before '#pragma'
     118 | #define __diag(s)               _Pragma(__diag_str(GCC diagnostic s))
         |                                 ^~~~~~~
   include/linux/compiler_types.h:722:25: note: in expansion of macro '__diag'
     722 | #define __diag_pop()    __diag(pop)
         |                         ^~~~~~
   include/linux/syscalls.h:266:9: note: in expansion of macro '__diag_pop'
     266 |         __diag_pop();                                                   \
         |         ^~~~~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/events/core.c:13881:1: note: in expansion of macro 'SYSCALL_DEFINE5'
   13881 | SYSCALL_DEFINE5(perf_event_open,
         | ^~~~~~~~~~~~~~~
   kernel/events/core.c:13884:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   13884 | {
         | ^
   kernel/events/core.c:14296:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
   14296 | {
         | ^
   kernel/events/core.c:14390:19: error: storage class specified for parameter 'perf_event_create_kernel_counter'
   14390 | EXPORT_SYMBOL_GPL(perf_event_create_kernel_counter);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:76:28: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   kernel/events/core.c:14390:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
   14390 | EXPORT_SYMBOL_GPL(perf_event_create_kernel_counter);
         | ^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:165:17: error: storage class specified for parameter '__UNIQUE_ID_addressable_perf_event_create_kernel_counter_1116'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |                 ^~~~~~~~~~~~
   include/linux/compiler_types.h:15:24: note: in definition of macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   include/linux/compiler.h:165:9: note: in expansion of macro '__PASTE'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^~~~~~~
   include/linux/compiler.h:273:9: note: in expansion of macro '__UNIQUE_ID'


vim +/alias +13882 kernel/events/core.c

b068fc04de10ff kernel/events/core.c  Marco Elver             2021-07-05  13871  
0793a61d4df8da kernel/perf_counter.c Thomas Gleixner         2008-12-04  13872  /**
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  13873   * sys_perf_event_open - open a performance event, associate it to a task/cpu
9f66a3810fe0d4 kernel/perf_counter.c Ingo Molnar             2008-12-10  13874   *
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  13875   * @attr_uptr:	event_id type attributes for monitoring/sampling
0793a61d4df8da kernel/perf_counter.c Thomas Gleixner         2008-12-04  13876   * @pid:		target pid
9f66a3810fe0d4 kernel/perf_counter.c Ingo Molnar             2008-12-10  13877   * @cpu:		target cpu
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  13878   * @group_fd:		group leader event fd
a1ddf5249f2c50 kernel/events/core.c  Haocheng Xie            2021-05-27  13879   * @flags:		perf event open flags
0793a61d4df8da kernel/perf_counter.c Thomas Gleixner         2008-12-04  13880   */
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21 @13881  SYSCALL_DEFINE5(perf_event_open,
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21 @13882  		struct perf_event_attr __user *, attr_uptr,
2743a5b0fa6f30 kernel/perf_counter.c Paul Mackerras          2009-03-04  13883  		pid_t, pid, int, cpu, int, group_fd, unsigned long, flags)
0793a61d4df8da kernel/perf_counter.c Thomas Gleixner         2008-12-04  13884  {
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  13885  	struct perf_event *group_leader = NULL, *output_event = NULL;
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  13886  	struct perf_event_pmu_context *pmu_ctx;
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  13887  	struct perf_event *event, *sibling;
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  13888  	struct perf_event_attr attr;
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  13889  	struct perf_event_context *ctx;
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  13890  	struct file *event_file = NULL;
38a81da2205f94 kernel/perf_event.c   Matt Helsley            2010-09-13  13891  	struct task_struct *task = NULL;
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  13892  	struct pmu *pmu;
ea635c64e00706 kernel/perf_event.c   Al Viro                 2010-05-26  13893  	int event_fd;
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  13894  	int move_group = 0;
dc86cabe4b2424 kernel/perf_counter.c Ingo Molnar             2009-09-03  13895  	int err;
a21b0b354d4ac3 kernel/events/core.c  Yann Droneaud           2014-01-05  13896  	int f_flags = O_RDWR;
79dff51e900fd2 kernel/events/core.c  Matt Fleming            2015-01-23  13897  	int cgroup_fd = -1;
0793a61d4df8da kernel/perf_counter.c Thomas Gleixner         2008-12-04  13898  
2743a5b0fa6f30 kernel/perf_counter.c Paul Mackerras          2009-03-04  13899  	/* for future expandability... */
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  13900  	if (flags & ~PERF_FLAG_ALL)
2743a5b0fa6f30 kernel/perf_counter.c Paul Mackerras          2009-03-04  13901  		return -EINVAL;
2743a5b0fa6f30 kernel/perf_counter.c Paul Mackerras          2009-03-04  13902  
0a041ebca49562 kernel/events/core.c  Namhyung Kim            2022-12-20  13903  	err = perf_copy_attr(attr_uptr, &attr);
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  13904) 	if (err)
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  13905) 		return err;
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  13906) 
0a041ebca49562 kernel/events/core.c  Namhyung Kim            2022-12-20  13907  	/* Do we allow access to perf_event_open(2) ? */
9ec84f79c5a7a6 kernel/events/core.c  Luo Gengkun             2024-12-23  13908  	err = security_perf_event_open(PERF_SECURITY_OPEN);
dc86cabe4b2424 kernel/perf_counter.c Ingo Molnar             2009-09-03  13909  	if (err)
dc86cabe4b2424 kernel/perf_counter.c Ingo Molnar             2009-09-03  13910  		return err;
eab656ae04b9d3 kernel/perf_counter.c Thomas Gleixner         2008-12-08  13911  
0764771dab80d7 kernel/perf_counter.c Peter Zijlstra          2009-06-11  13912  	if (!attr.exclude_kernel) {
9ec84f79c5a7a6 kernel/events/core.c  Luo Gengkun             2024-12-23  13913  		err = perf_allow_kernel();
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  13914) 		if (err)
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  13915) 			return err;
0764771dab80d7 kernel/perf_counter.c Peter Zijlstra          2009-06-11  13916  	}
0764771dab80d7 kernel/perf_counter.c Peter Zijlstra          2009-06-11  13917  
e422267322cd31 kernel/events/core.c  Hari Bathini            2017-03-08  13918  	if (attr.namespaces) {
18aa18566218d4 kernel/events/core.c  Alexey Budankov         2020-04-02  13919  		if (!perfmon_capable())
e422267322cd31 kernel/events/core.c  Hari Bathini            2017-03-08  13920  			return -EACCES;
e422267322cd31 kernel/events/core.c  Hari Bathini            2017-03-08  13921  	}
e422267322cd31 kernel/events/core.c  Hari Bathini            2017-03-08  13922  
df58ab24bf26b1 kernel/perf_counter.c Peter Zijlstra          2009-06-11  13923  	if (attr.freq) {
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  13924  		if (attr.sample_freq > sysctl_perf_event_sample_rate)
df58ab24bf26b1 kernel/perf_counter.c Peter Zijlstra          2009-06-11  13925  			return -EINVAL;
0819b2e30ccb93 kernel/events/core.c  Peter Zijlstra          2014-05-15  13926  	} else {
0819b2e30ccb93 kernel/events/core.c  Peter Zijlstra          2014-05-15  13927  		if (attr.sample_period & (1ULL << 63))
0819b2e30ccb93 kernel/events/core.c  Peter Zijlstra          2014-05-15  13928  			return -EINVAL;
df58ab24bf26b1 kernel/perf_counter.c Peter Zijlstra          2009-06-11  13929  	}
df58ab24bf26b1 kernel/perf_counter.c Peter Zijlstra          2009-06-11  13930  
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang               2017-08-28  13931  	/* Only privileged users can get physical addresses */
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  13932) 	if ((attr.sample_type & PERF_SAMPLE_PHYS_ADDR)) {
9ec84f79c5a7a6 kernel/events/core.c  Luo Gengkun             2024-12-23  13933  		err = perf_allow_kernel();
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  13934) 		if (err)
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  13935) 			return err;
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  13936) 	}
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang               2017-08-28  13937  
b0c8fdc7fdb775 kernel/events/core.c  David Howells           2019-08-19  13938  	/* REGS_INTR can leak data, lockdown must prevent this */
08ef1af4de5fe7 kernel/events/core.c  Ondrej Mosnacek         2021-02-24  13939  	if (attr.sample_type & PERF_SAMPLE_REGS_INTR) {
08ef1af4de5fe7 kernel/events/core.c  Ondrej Mosnacek         2021-02-24  13940  		err = security_locked_down(LOCKDOWN_PERF);
08ef1af4de5fe7 kernel/events/core.c  Ondrej Mosnacek         2021-02-24  13941  		if (err)
b0c8fdc7fdb775 kernel/events/core.c  David Howells           2019-08-19  13942  			return err;
08ef1af4de5fe7 kernel/events/core.c  Ondrej Mosnacek         2021-02-24  13943  	}
b0c8fdc7fdb775 kernel/events/core.c  David Howells           2019-08-19  13944  
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  13945  	/*
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  13946  	 * In cgroup mode, the pid argument is used to pass the fd
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  13947  	 * opened to the cgroup directory in cgroupfs. The cpu argument
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  13948  	 * designates the cpu on which to monitor threads from that
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  13949  	 * cgroup.
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  13950  	 */
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  13951  	if ((flags & PERF_FLAG_PID_CGROUP) && (pid == -1 || cpu == -1))
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  13952  		return -EINVAL;
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  13953  
a21b0b354d4ac3 kernel/events/core.c  Yann Droneaud           2014-01-05  13954  	if (flags & PERF_FLAG_FD_CLOEXEC)
a21b0b354d4ac3 kernel/events/core.c  Yann Droneaud           2014-01-05  13955  		f_flags |= O_CLOEXEC;
a21b0b354d4ac3 kernel/events/core.c  Yann Droneaud           2014-01-05  13956  
a21b0b354d4ac3 kernel/events/core.c  Yann Droneaud           2014-01-05  13957  	event_fd = get_unused_fd_flags(f_flags);
ea635c64e00706 kernel/perf_event.c   Al Viro                 2010-05-26  13958  	if (event_fd < 0)
ea635c64e00706 kernel/perf_event.c   Al Viro                 2010-05-26  13959  		return event_fd;
ea635c64e00706 kernel/perf_event.c   Al Viro                 2010-05-26  13960  
da916e96e2dedc kernel/events/core.c  Peter Zijlstra          2024-10-25  13961  	/*
da916e96e2dedc kernel/events/core.c  Peter Zijlstra          2024-10-25  13962  	 * Event creation should be under SRCU, see perf_pmu_unregister().
da916e96e2dedc kernel/events/core.c  Peter Zijlstra          2024-10-25  13963  	 */
da916e96e2dedc kernel/events/core.c  Peter Zijlstra          2024-10-25  13964  	guard(srcu)(&pmus_srcu);
da916e96e2dedc kernel/events/core.c  Peter Zijlstra          2024-10-25  13965  
4dd53b84ff2342 kernel/events/core.c  Al Viro                 2024-06-02  13966  	CLASS(fd, group)(group_fd);     // group_fd == -1 => empty
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  13967  	if (group_fd != -1) {
4dd53b84ff2342 kernel/events/core.c  Al Viro                 2024-06-02  13968  		if (!is_perf_file(group)) {
4dd53b84ff2342 kernel/events/core.c  Al Viro                 2024-06-02  13969  			err = -EBADF;
d14b12d7adbf21 kernel/perf_event.c   Stephane Eranian        2010-09-17  13970  			goto err_fd;
4dd53b84ff2342 kernel/events/core.c  Al Viro                 2024-06-02  13971  		}
1da91ea87aefe2 kernel/events/core.c  Al Viro                 2024-05-31  13972  		group_leader = fd_file(group)->private_data;
da916e96e2dedc kernel/events/core.c  Peter Zijlstra          2024-10-25  13973  		if (group_leader->state <= PERF_EVENT_STATE_REVOKED) {
da916e96e2dedc kernel/events/core.c  Peter Zijlstra          2024-10-25  13974  			err = -ENODEV;
da916e96e2dedc kernel/events/core.c  Peter Zijlstra          2024-10-25  13975  			goto err_fd;
da916e96e2dedc kernel/events/core.c  Peter Zijlstra          2024-10-25  13976  		}
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  13977  		if (flags & PERF_FLAG_FD_OUTPUT)
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  13978  			output_event = group_leader;
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  13979  		if (flags & PERF_FLAG_FD_NO_GROUP)
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  13980  			group_leader = NULL;
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  13981  	}
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  13982  
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  13983  	if (pid != -1 && !(flags & PERF_FLAG_PID_CGROUP)) {
c6be5a5cb62592 kernel/perf_event.c   Peter Zijlstra          2010-10-14  13984  		task = find_lively_task_by_vpid(pid);
c6be5a5cb62592 kernel/perf_event.c   Peter Zijlstra          2010-10-14  13985  		if (IS_ERR(task)) {
c6be5a5cb62592 kernel/perf_event.c   Peter Zijlstra          2010-10-14  13986  			err = PTR_ERR(task);
4dd53b84ff2342 kernel/events/core.c  Al Viro                 2024-06-02  13987  			goto err_fd;
c6be5a5cb62592 kernel/perf_event.c   Peter Zijlstra          2010-10-14  13988  		}
c6be5a5cb62592 kernel/perf_event.c   Peter Zijlstra          2010-10-14  13989  	}
c6be5a5cb62592 kernel/perf_event.c   Peter Zijlstra          2010-10-14  13990  
1f4ee5038f0c1e kernel/events/core.c  Peter Zijlstra          2014-05-06  13991  	if (task && group_leader &&
1f4ee5038f0c1e kernel/events/core.c  Peter Zijlstra          2014-05-06  13992  	    group_leader->attr.inherit != attr.inherit) {
1f4ee5038f0c1e kernel/events/core.c  Peter Zijlstra          2014-05-06  13993  		err = -EINVAL;
1f4ee5038f0c1e kernel/events/core.c  Peter Zijlstra          2014-05-06  13994  		goto err_task;
1f4ee5038f0c1e kernel/events/core.c  Peter Zijlstra          2014-05-06  13995  	}
1f4ee5038f0c1e kernel/events/core.c  Peter Zijlstra          2014-05-06  13996  
79dff51e900fd2 kernel/events/core.c  Matt Fleming            2015-01-23  13997  	if (flags & PERF_FLAG_PID_CGROUP)
79dff51e900fd2 kernel/events/core.c  Matt Fleming            2015-01-23  13998  		cgroup_fd = pid;
79dff51e900fd2 kernel/events/core.c  Matt Fleming            2015-01-23  13999  
4dc0da86967d54 kernel/events/core.c  Avi Kivity              2011-06-29  14000  	event = perf_event_alloc(&attr, cpu, task, group_leader, NULL,
79dff51e900fd2 kernel/events/core.c  Matt Fleming            2015-01-23  14001  				 NULL, NULL, cgroup_fd);
d14b12d7adbf21 kernel/perf_event.c   Stephane Eranian        2010-09-17  14002  	if (IS_ERR(event)) {
d14b12d7adbf21 kernel/perf_event.c   Stephane Eranian        2010-09-17  14003  		err = PTR_ERR(event);
78af4dc949daaa kernel/events/core.c  peterz@infradead.org    2020-08-28  14004  		goto err_task;
d14b12d7adbf21 kernel/perf_event.c   Stephane Eranian        2010-09-17  14005  	}
d14b12d7adbf21 kernel/perf_event.c   Stephane Eranian        2010-09-17  14006  
53b25335dd6098 kernel/events/core.c  Vince Weaver            2014-05-16  14007  	if (is_sampling_event(event)) {
53b25335dd6098 kernel/events/core.c  Vince Weaver            2014-05-16  14008  		if (event->pmu->capabilities & PERF_PMU_CAP_NO_INTERRUPT) {
a1396555abff9f kernel/events/core.c  Vineet Gupta            2016-05-09  14009  			err = -EOPNOTSUPP;
53b25335dd6098 kernel/events/core.c  Vince Weaver            2014-05-16  14010  			goto err_alloc;
53b25335dd6098 kernel/events/core.c  Vince Weaver            2014-05-16  14011  		}
53b25335dd6098 kernel/events/core.c  Vince Weaver            2014-05-16  14012  	}
53b25335dd6098 kernel/events/core.c  Vince Weaver            2014-05-16  14013  
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  14014  	/*
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  14015  	 * Special case software events and allow them to be part of
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  14016  	 * any hardware group.
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  14017  	 */
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  14018  	pmu = event->pmu;
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  14019  
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  14020  	if (attr.use_clockid) {
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  14021  		err = perf_event_set_clock(event, attr.clockid);
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  14022  		if (err)
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  14023  			goto err_alloc;
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  14024  	}
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  14025  
4ff6a8debf48a7 kernel/events/core.c  David Carrillo-Cisneros 2016-08-17  14026  	if (pmu->task_ctx_nr == perf_sw_context)
4ff6a8debf48a7 kernel/events/core.c  David Carrillo-Cisneros 2016-08-17  14027  		event->event_caps |= PERF_EV_CAP_SOFTWARE;
4ff6a8debf48a7 kernel/events/core.c  David Carrillo-Cisneros 2016-08-17  14028  
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14029  	if (task) {
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14030  		err = down_read_interruptible(&task->signal->exec_update_lock);
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14031  		if (err)
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14032  			goto err_alloc;
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14033  
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  14034  		/*
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14035  		 * We must hold exec_update_lock across this and any potential
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14036  		 * perf_install_in_context() call for this new event to
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14037  		 * serialize against exec() altering our credentials (and the
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14038  		 * perf_event_exit_task() that could imply).
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  14039  		 */
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14040  		err = -EACCES;
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14041  		if (!perf_check_permission(&attr, task))
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14042  			goto err_cred;
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  14043  	}
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  14044  
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  14045  	/*
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  14046  	 * Get the target context (task or percpu):
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  14047  	 */
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14048  	ctx = find_get_context(task, event);
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  14049  	if (IS_ERR(ctx)) {
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  14050  		err = PTR_ERR(ctx);
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14051  		goto err_cred;
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  14052  	}
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  14053  
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14054  	mutex_lock(&ctx->mutex);
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14055  
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14056  	if (ctx->task == TASK_TOMBSTONE) {
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14057  		err = -ESRCH;
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14058  		goto err_locked;
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  14059  	}
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  14060  
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14061  	if (!task) {
ccff286d85098b kernel/perf_counter.c Ingo Molnar             2008-12-11  14062  		/*
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14063  		 * Check if the @cpu we're creating an event for is online.
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14064  		 *
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14065  		 * We use the perf_cpu_context::ctx::mutex to serialize against
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14066  		 * the hotplug notifiers. See perf_event_{init,exit}_cpu().
04289bb9891882 kernel/perf_counter.c Ingo Molnar             2008-12-11  14067  		 */
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14068  		struct perf_cpu_context *cpuctx = per_cpu_ptr(&perf_cpu_context, event->cpu);
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14069  
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14070  		if (!cpuctx->online) {
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14071  			err = -ENODEV;
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14072  			goto err_locked;
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14073  		}
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14074  	}
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14075  
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  14076  	if (group_leader) {
dc86cabe4b2424 kernel/perf_counter.c Ingo Molnar             2009-09-03  14077  		err = -EINVAL;
04289bb9891882 kernel/perf_counter.c Ingo Molnar             2008-12-11  14078  
04289bb9891882 kernel/perf_counter.c Ingo Molnar             2008-12-11  14079  		/*
ccff286d85098b kernel/perf_counter.c Ingo Molnar             2008-12-11  14080  		 * Do not allow a recursive hierarchy (this new sibling
ccff286d85098b kernel/perf_counter.c Ingo Molnar             2008-12-11  14081  		 * becoming part of another group-sibling):
04289bb9891882 kernel/perf_counter.c Ingo Molnar             2008-12-11  14082  		 */
ccff286d85098b kernel/perf_counter.c Ingo Molnar             2008-12-11  14083  		if (group_leader->group_leader != group_leader)
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14084  			goto err_locked;
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  14085  
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  14086  		/* All events in a group should have the same clock */
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  14087  		if (group_leader->clock != event->clock)
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14088  			goto err_locked;
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  14089  
04289bb9891882 kernel/perf_counter.c Ingo Molnar             2008-12-11  14090  		/*
64aee2a965cf29 kernel/events/core.c  Mark Rutland            2017-06-22  14091  		 * Make sure we're both events for the same CPU;
64aee2a965cf29 kernel/events/core.c  Mark Rutland            2017-06-22  14092  		 * grouping events for different CPUs is broken; since
64aee2a965cf29 kernel/events/core.c  Mark Rutland            2017-06-22  14093  		 * you can never concurrently schedule them anyhow.
04289bb9891882 kernel/perf_counter.c Ingo Molnar             2008-12-11  14094  		 */
64aee2a965cf29 kernel/events/core.c  Mark Rutland            2017-06-22  14095  		if (group_leader->cpu != event->cpu)
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14096  			goto err_locked;
c3c87e770458aa kernel/events/core.c  Peter Zijlstra          2015-01-23  14097  
c3c87e770458aa kernel/events/core.c  Peter Zijlstra          2015-01-23  14098  		/*
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14099  		 * Make sure we're both on the same context; either task or cpu.
c3c87e770458aa kernel/events/core.c  Peter Zijlstra          2015-01-23  14100  		 */
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14101  		if (group_leader->ctx != ctx)
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14102  			goto err_locked;
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  14103  
3b6f9e5cb21964 kernel/perf_counter.c Paul Mackerras          2009-01-14  14104  		/*
3b6f9e5cb21964 kernel/perf_counter.c Paul Mackerras          2009-01-14  14105  		 * Only a group leader can be exclusive or pinned
3b6f9e5cb21964 kernel/perf_counter.c Paul Mackerras          2009-01-14  14106  		 */
0d48696f87e361 kernel/perf_counter.c Peter Zijlstra          2009-06-02  14107  		if (attr.exclusive || attr.pinned)
84c4e620d35f49 kernel/events/core.c  Peter Zijlstra          2016-02-24  14108  			goto err_locked;
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  14109  
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14110  		if (is_software_event(event) &&
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14111  		    !in_software_context(group_leader)) {
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  14112  			/*
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14113  			 * If the event is a sw event, but the group_leader
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14114  			 * is on hw context.
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14115  			 *
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14116  			 * Allow the addition of software events to hw
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14117  			 * groups, this is safe because software events
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14118  			 * never fail to schedule.
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14119  			 *
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14120  			 * Note the comment that goes with struct
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14121  			 * perf_event_pmu_context.
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  14122  			 */
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14123  			pmu = group_leader->pmu_ctx->pmu;
bf480f93856673 kernel/events/core.c  Ravi Bangoria           2022-11-22  14124  		} else if (!is_software_event(event)) {
bf480f93856673 kernel/events/core.c  Ravi Bangoria           2022-11-22  14125  			if (is_software_event(group_leader) &&
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14126  			    (group_leader->group_caps & PERF_EV_CAP_SOFTWARE)) {
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  14127  				/*
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14128  				 * In case the group is a pure software group, and we
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14129  				 * try to add a hardware event, move the whole group to
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14130  				 * the hardware context.
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  14131  				 */
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14132  				move_group = 1;
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  14133  			}
8a58ddae23796c kernel/events/core.c  Alexander Shishkin      2019-07-01  14134  
bf480f93856673 kernel/events/core.c  Ravi Bangoria           2022-11-22  14135  			/* Don't allow group of multiple hw events from different pmus */
bf480f93856673 kernel/events/core.c  Ravi Bangoria           2022-11-22  14136  			if (!in_software_context(group_leader) &&
bf480f93856673 kernel/events/core.c  Ravi Bangoria           2022-11-22  14137  			    group_leader->pmu_ctx->pmu != pmu)
8a58ddae23796c kernel/events/core.c  Alexander Shishkin      2019-07-01  14138  				goto err_locked;
8a58ddae23796c kernel/events/core.c  Alexander Shishkin      2019-07-01  14139  		}
8a58ddae23796c kernel/events/core.c  Alexander Shishkin      2019-07-01  14140  	}
3ac6487e584a1e kernel/events/core.c  Peter Zijlstra          2022-05-20  14141  
3ac6487e584a1e kernel/events/core.c  Peter Zijlstra          2022-05-20  14142  	/*
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14143  	 * Now that we're certain of the pmu; find the pmu_ctx.
3ac6487e584a1e kernel/events/core.c  Peter Zijlstra          2022-05-20  14144  	 */
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14145  	pmu_ctx = find_get_pmu_context(pmu, ctx, event);
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14146  	if (IS_ERR(pmu_ctx)) {
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14147  		err = PTR_ERR(pmu_ctx);
3ac6487e584a1e kernel/events/core.c  Peter Zijlstra          2022-05-20  14148  		goto err_locked;
3ac6487e584a1e kernel/events/core.c  Peter Zijlstra          2022-05-20  14149  	}
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14150  	event->pmu_ctx = pmu_ctx;
f63a8daa5812af kernel/events/core.c  Peter Zijlstra          2015-01-23  14151  
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14152  	if (output_event) {
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14153  		err = perf_event_set_output(event, output_event);
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14154  		if (err)
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14155  			goto err_context;
84c4e620d35f49 kernel/events/core.c  Peter Zijlstra          2016-02-24  14156  	}
84c4e620d35f49 kernel/events/core.c  Peter Zijlstra          2016-02-24  14157  
a723968c0ed36d kernel/events/core.c  Peter Zijlstra          2015-09-09  14158  	if (!perf_event_validate_size(event)) {
a723968c0ed36d kernel/events/core.c  Peter Zijlstra          2015-09-09  14159  		err = -E2BIG;
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14160  		goto err_context;
a63fbed776c712 kernel/events/core.c  Thomas Gleixner         2017-05-24  14161  	}
a63fbed776c712 kernel/events/core.c  Thomas Gleixner         2017-05-24  14162  
da9ec3d3dd0f12 kernel/events/core.c  Mark Rutland            2020-01-06  14163  	if (perf_need_aux_event(event) && !perf_get_aux_event(event, group_leader)) {
da9ec3d3dd0f12 kernel/events/core.c  Mark Rutland            2020-01-06  14164  		err = -EINVAL;
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14165  		goto err_context;
da9ec3d3dd0f12 kernel/events/core.c  Mark Rutland            2020-01-06  14166  	}
a63fbed776c712 kernel/events/core.c  Thomas Gleixner         2017-05-24  14167  
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  14168  	/*
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  14169  	 * Must be under the same ctx::mutex as perf_install_in_context(),
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  14170  	 * because we need to serialize with concurrent event creation.
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  14171  	 */
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  14172  	if (!exclusive_event_installable(event, ctx)) {
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  14173  		err = -EBUSY;
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14174  		goto err_context;
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  14175  	}
f63a8daa5812af kernel/events/core.c  Peter Zijlstra          2015-01-23  14176  
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  14177  	WARN_ON_ONCE(ctx->parent_ctx);
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  14178  
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14179  	event_file = anon_inode_getfile("[perf_event]", &perf_fops, event, f_flags);
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14180  	if (IS_ERR(event_file)) {
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14181  		err = PTR_ERR(event_file);
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14182  		event_file = NULL;
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14183  		goto err_context;
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14184  	}
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14185  
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  14186  	/*
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  14187  	 * This is the point on no return; we cannot fail hereafter. This is
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  14188  	 * where we start modifying current state.
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  14189  	 */
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  14190  
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  14191  	if (move_group) {
45a0e07abf4933 kernel/events/core.c  Peter Zijlstra          2016-01-26  14192  		perf_remove_from_context(group_leader, 0);
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14193  		put_pmu_ctx(group_leader->pmu_ctx);
0231bb53367584 kernel/events/core.c  Jiri Olsa               2013-02-01  14194  
edb39592a5877b kernel/events/core.c  Peter Zijlstra          2018-03-15  14195  		for_each_sibling_event(sibling, group_leader) {
45a0e07abf4933 kernel/events/core.c  Peter Zijlstra          2016-01-26  14196  			perf_remove_from_context(sibling, 0);
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14197  			put_pmu_ctx(sibling->pmu_ctx);
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  14198  		}
9b51f66dcb09ac kernel/perf_counter.c Ingo Molnar             2008-12-12  14199  
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  14200) 		/*
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  14201) 		 * Install the group siblings before the group leader.
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  14202) 		 *
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  14203) 		 * Because a group leader will try and install the entire group
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  14204) 		 * (through the sibling list, which is still in-tact), we can
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  14205) 		 * end up with siblings installed in the wrong context.
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  14206) 		 *
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  14207) 		 * By installing siblings first we NO-OP because they're not
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  14208) 		 * reachable through the group lists.
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  14209) 		 */
edb39592a5877b kernel/events/core.c  Peter Zijlstra          2018-03-15  14210  		for_each_sibling_event(sibling, group_leader) {
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14211  			sibling->pmu_ctx = pmu_ctx;
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14212  			get_pmu_ctx(pmu_ctx);
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  14213) 			perf_event__state_init(sibling);
9fc81d87420d0d kernel/events/core.c  Jiri Olsa               2014-12-10  14214  			perf_install_in_context(ctx, sibling, sibling->cpu);
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  14215  		}
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  14216) 
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  14217) 		/*
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  14218) 		 * Removing from the context ends up with disabled
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  14219) 		 * event. What we want here is event in the initial
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  14220) 		 * startup state, ready to be add into new context.
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  14221) 		 */
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14222  		group_leader->pmu_ctx = pmu_ctx;
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14223  		get_pmu_ctx(pmu_ctx);
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  14224) 		perf_event__state_init(group_leader);
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  14225) 		perf_install_in_context(ctx, group_leader, group_leader->cpu);
bed5b25ad9c8a2 kernel/events/core.c  Alexander Shishkin      2015-01-30  14226  	}
bed5b25ad9c8a2 kernel/events/core.c  Alexander Shishkin      2015-01-30  14227  
f73e22ab450140 kernel/events/core.c  Peter Zijlstra          2015-09-09  14228  	/*
f73e22ab450140 kernel/events/core.c  Peter Zijlstra          2015-09-09  14229  	 * Precalculate sample_data sizes; do while holding ctx::mutex such
f73e22ab450140 kernel/events/core.c  Peter Zijlstra          2015-09-09  14230  	 * that we're serialized against further additions and before
f73e22ab450140 kernel/events/core.c  Peter Zijlstra          2015-09-09  14231  	 * perf_install_in_context() which is the point the event is active and
f73e22ab450140 kernel/events/core.c  Peter Zijlstra          2015-09-09  14232  	 * can use these values.
f73e22ab450140 kernel/events/core.c  Peter Zijlstra          2015-09-09  14233  	 */
f73e22ab450140 kernel/events/core.c  Peter Zijlstra          2015-09-09  14234  	perf_event__header_size(event);
f73e22ab450140 kernel/events/core.c  Peter Zijlstra          2015-09-09  14235  	perf_event__id_header_size(event);
f73e22ab450140 kernel/events/core.c  Peter Zijlstra          2015-09-09  14236  
78cd2c748f4597 kernel/events/core.c  Peter Zijlstra          2016-01-25  14237  	event->owner = current;
78cd2c748f4597 kernel/events/core.c  Peter Zijlstra          2016-01-25  14238  
e2d37cd213dcc0 kernel/events/core.c  Yan, Zheng              2012-06-15  14239  	perf_install_in_context(ctx, event, event->cpu);
fe4b04fa31a6dc kernel/perf_event.c   Peter Zijlstra          2011-02-02  14240  	perf_unpin_context(ctx);
f63a8daa5812af kernel/events/core.c  Peter Zijlstra          2015-01-23  14241  
d859e29fe34cb8 kernel/perf_counter.c Paul Mackerras          2009-01-17  14242  	mutex_unlock(&ctx->mutex);
9b51f66dcb09ac kernel/perf_counter.c Ingo Molnar             2008-12-12  14243  
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  14244  	if (task) {
f7cfd871ae0c50 kernel/events/core.c  Eric W. Biederman       2020-12-03  14245  		up_read(&task->signal->exec_update_lock);
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  14246  		put_task_struct(task);
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  14247  	}
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  14248  
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  14249  	mutex_lock(&current->perf_event_mutex);
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  14250  	list_add_tail(&event->owner_entry, &current->perf_event_list);
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  14251  	mutex_unlock(&current->perf_event_mutex);
082ff5a2767a06 kernel/perf_counter.c Peter Zijlstra          2009-05-23  14252  
8a49542c0554af kernel/perf_event.c   Peter Zijlstra          2010-05-27  14253  	/*
4dd53b84ff2342 kernel/events/core.c  Al Viro                 2024-06-02  14254  	 * File reference in group guarantees that group_leader has been
4dd53b84ff2342 kernel/events/core.c  Al Viro                 2024-06-02  14255  	 * kept alive until we place the new event on the sibling_list.
4dd53b84ff2342 kernel/events/core.c  Al Viro                 2024-06-02  14256  	 * This ensures destruction of the group leader will find
4dd53b84ff2342 kernel/events/core.c  Al Viro                 2024-06-02  14257  	 * the pointer to itself in perf_group_detach().
8a49542c0554af kernel/perf_event.c   Peter Zijlstra          2010-05-27  14258  	 */
ea635c64e00706 kernel/perf_event.c   Al Viro                 2010-05-26  14259  	fd_install(event_fd, event_file);
ea635c64e00706 kernel/perf_event.c   Al Viro                 2010-05-26  14260  	return event_fd;
0793a61d4df8da kernel/perf_counter.c Thomas Gleixner         2008-12-04  14261  
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14262  err_context:
a551844e345ba2 kernel/events/core.c  Peter Zijlstra          2022-12-19  14263  	put_pmu_ctx(event->pmu_ctx);
a551844e345ba2 kernel/events/core.c  Peter Zijlstra          2022-12-19  14264  	event->pmu_ctx = NULL; /* _free_event() */
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  14265  err_locked:
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  14266  	mutex_unlock(&ctx->mutex);
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14267  	perf_unpin_context(ctx);
bd27568117664b kernel/events/core.c  Peter Zijlstra          2022-10-08  14268  	put_ctx(ctx);
78af4dc949daaa kernel/events/core.c  peterz@infradead.org    2020-08-28  14269  err_cred:
78af4dc949daaa kernel/events/core.c  peterz@infradead.org    2020-08-28  14270  	if (task)
d01e7f10dae29e kernel/events/core.c  Linus Torvalds          2020-12-15  14271  		up_read(&task->signal->exec_update_lock);
c6be5a5cb62592 kernel/perf_event.c   Peter Zijlstra          2010-10-14  14272  err_alloc:
da916e96e2dedc kernel/events/core.c  Peter Zijlstra          2024-10-25  14273  	put_event(event);
1f4ee5038f0c1e kernel/events/core.c  Peter Zijlstra          2014-05-06  14274  err_task:
e7d0bc047548d7 kernel/perf_event.c   Peter Zijlstra          2010-10-14  14275  	if (task)
e7d0bc047548d7 kernel/perf_event.c   Peter Zijlstra          2010-10-14  14276  		put_task_struct(task);
ea635c64e00706 kernel/perf_event.c   Al Viro                 2010-05-26  14277  err_fd:
ea635c64e00706 kernel/perf_event.c   Al Viro                 2010-05-26  14278  	put_unused_fd(event_fd);
dc86cabe4b2424 kernel/perf_counter.c Ingo Molnar             2009-09-03  14279  	return err;
0793a61d4df8da kernel/perf_counter.c Thomas Gleixner         2008-12-04  14280  }
0793a61d4df8da kernel/perf_counter.c Thomas Gleixner         2008-12-04  14281  

:::::: The code at line 13882 was first introduced by commit
:::::: cdd6c482c9ff9c55475ee7392ec8f672eddb7be6 perf: Do the big rename: Performance Counters -> Performance Events

:::::: TO: Ingo Molnar <mingo@elte.hu>
:::::: CC: Ingo Molnar <mingo@elte.hu>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
