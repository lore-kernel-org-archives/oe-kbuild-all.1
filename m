Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661A12BDC25
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 14:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766241316; cv=none; b=YcQ5iiONdKVj/mSi4hJmw4ra4Zp0LwR0Kw4GTggwLKnJQAAE3dUMV4ePuU/3LoDmk2TpE+HQn0tj5iQuo2xaWT44cdw+v9ke2aEpXIW52bwqfGPdYqAnSLg86LhJr/NiZTBTGnWUxrYk7qfP2J604T8HQhwWu3EQAcQZwcYaa9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766241316; c=relaxed/simple;
	bh=IukjTI+dcrzcu2l55JOD4msEs2H9sqjNqfIDlcKrcks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H+P2lkLmwuVqrvhZ+Q4z+NUzytVEkdVOSuJRPioLqZyWkm5V38gxRYyTHjnGx7yZ6unN6lTqIBXsgu7upBnxoYzx5XxVHdhFKVItkzeGuTwFLqC/FCc/kRtCs0DUzdC0jNkOMToNlu9rKdEce3RJLjk3d6Gpimz++9YyAuZOlGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NzQLCYn9; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NzQLCYn9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766241312; x=1797777312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IukjTI+dcrzcu2l55JOD4msEs2H9sqjNqfIDlcKrcks=;
  b=NzQLCYn9EbXrEGnUVLSwqzskcz8uP80WP1wdbaafa5Ve3oCXa7psT5rx
   yqPf+pas28WelKlvFyACBKg7oTKC/8+gFscsiR0nwHvONv61T983gNRkF
   sy06r7V2tNcPFQmKwvt3IPsDblbsdFuWyc/j/clu5ifaQxiuvJCatY3M4
   s/kY/mrpUfVNhXme6uzymTNIbziOFKjcLE/g7uBKvmzeGITA3H9TIke30
   s/tuFCOIY9OUuGGf3lMNutlOLvvg8wq5I1d+9CO8hbel2HS4HFW3nsMun
   MLslTzsEJPxScZJ3jVGtOb7sQizs6NQpSn9qVAL8WFsDkx0rtTtPU+w7N
   g==;
X-CSE-ConnectionGUID: lP9PRf9PQ9KhpcB74tan7g==
X-CSE-MsgGUID: ZmGyJlNTQLCqo0MgCqDJFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="85760156"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="85760156"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:35:09 -0800
X-CSE-ConnectionGUID: /SQDb3LYTd6NFMyJ3VcP0g==
X-CSE-MsgGUID: MqgJ2DRQR2e0t3QfwLZl3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="236526235"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Dec 2025 06:35:07 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWy2z-000000004ep-2aIg;
	Sat, 20 Dec 2025 14:35:05 +0000
Date: Sat, 20 Dec 2025 22:34:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal:spec 1/131] kernel/api/kernel_api_spec.c:795:42: warning:
 cast to pointer from integer of different size
Message-ID: <202512202222.oFjqNfxa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git spec
head:   d34c22a9d280338fc8a0f12fd5577e62f345503e
commit: 0255afb0b87746723affbefad17b2caa26d29180 [1/131] kernel/api: introduce kernel API specification framework
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20251220/202512202222.oFjqNfxa-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202222.oFjqNfxa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202222.oFjqNfxa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/api/kernel_api_spec.c: In function 'kapi_validate_param':
>> kernel/api/kernel_api_spec.c:795:42: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     795 |                 const void __user *ptr = (const void __user *)value;
         |                                          ^
   kernel/api/kernel_api_spec.c:811:43: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     811 |                 const char __user *path = (const char __user *)value;
         |                                           ^
   kernel/api/kernel_api_spec.c:889:50: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     889 |                 return kapi_validate_user_string((const char __user *)value, param_spec);
         |                                                  ^
   kernel/api/kernel_api_spec.c:892:43: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     892 |                 return kapi_validate_path((const char __user *)value, param_spec);
         |                                           ^
   kernel/api/kernel_api_spec.c:895:58: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     895 |                 return kapi_validate_user_ptr_constraint((const void __user *)value, param_spec);
         |                                                          ^
   kernel/api/kernel_api_spec.c: In function 'kapi_validate_param_with_context':
   kernel/api/kernel_api_spec.c:922:42: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     922 |                 const void __user *ptr = (const void __user *)value;
         |                                          ^
--
   In file included from kernel/bpf/syscall.c:12:
   kernel/bpf/syscall.c: In function '__do_kapi_sys_bpf':
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:121:27: note: in expansion of macro '__SC_CAST_TO_S64'
     121 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                           ^
   include/linux/syscalls.h:122:35: note: in expansion of macro '__MAP2'
     122 | #define __MAP3(m,t,a,...) m(t,a), __MAP2(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP3'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:230:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     230 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:6272:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    6272 | SYSCALL_DEFINE3(bpf, int, cmd, union bpf_attr __user *, uattr, unsigned int, size)
         | ^~~~~~~~~~~~~~~
--
   In file included from kernel/time/time.c:33:
   kernel/time/time.c: In function '__do_kapi_sys_gettimeofday':
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:121:27: note: in expansion of macro '__SC_CAST_TO_S64'
     121 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                           ^
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP2'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/time/time.c:140:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     140 | SYSCALL_DEFINE2(gettimeofday, struct __kernel_old_timeval __user *, tv,
         | ^~~~~~~~~~~~~~~
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:120:27: note: in expansion of macro '__SC_CAST_TO_S64'
     120 | #define __MAP1(m,t,a,...) m(t,a)
         |                           ^
   include/linux/syscalls.h:121:35: note: in expansion of macro '__MAP1'
     121 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP2'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/time/time.c:140:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     140 | SYSCALL_DEFINE2(gettimeofday, struct __kernel_old_timeval __user *, tv,
         | ^~~~~~~~~~~~~~~
   kernel/time/time.c: In function '__do_kapi_sys_settimeofday':
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:121:27: note: in expansion of macro '__SC_CAST_TO_S64'
     121 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                           ^
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP2'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/time/time.c:199:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     199 | SYSCALL_DEFINE2(settimeofday, struct __kernel_old_timeval __user *, tv,
         | ^~~~~~~~~~~~~~~
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:120:27: note: in expansion of macro '__SC_CAST_TO_S64'
     120 | #define __MAP1(m,t,a,...) m(t,a)
         |                           ^
   include/linux/syscalls.h:121:35: note: in expansion of macro '__MAP1'
     121 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP2'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/time/time.c:199:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     199 | SYSCALL_DEFINE2(settimeofday, struct __kernel_old_timeval __user *, tv,
         | ^~~~~~~~~~~~~~~
   kernel/time/time.c: In function '__do_kapi_sys_adjtimex_time32':
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:120:27: note: in expansion of macro '__SC_CAST_TO_S64'
     120 | #define __MAP1(m,t,a,...) m(t,a)
         |                           ^
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP1'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     228 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/time/time.c:349:1: note: in expansion of macro 'SYSCALL_DEFINE1'
     349 | SYSCALL_DEFINE1(adjtimex_time32, struct old_timex32 __user *, utp)
         | ^~~~~~~~~~~~~~~
--
   In file included from kernel/time/hrtimer.c:30:
   kernel/time/hrtimer.c: In function '__do_kapi_sys_nanosleep_time32':
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:121:27: note: in expansion of macro '__SC_CAST_TO_S64'
     121 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                           ^
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP2'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:2206:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    2206 | SYSCALL_DEFINE2(nanosleep_time32, struct old_timespec32 __user *, rqtp,
         | ^~~~~~~~~~~~~~~
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:120:27: note: in expansion of macro '__SC_CAST_TO_S64'
     120 | #define __MAP1(m,t,a,...) m(t,a)
         |                           ^
   include/linux/syscalls.h:121:35: note: in expansion of macro '__MAP1'
     121 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP2'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:2206:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    2206 | SYSCALL_DEFINE2(nanosleep_time32, struct old_timespec32 __user *, rqtp,
         | ^~~~~~~~~~~~~~~
--
   In file included from kernel/time/posix-timers.c:25:
   kernel/time/posix-timers.c: In function '__do_kapi_sys_timer_create':
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:121:27: note: in expansion of macro '__SC_CAST_TO_S64'
     121 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                           ^
   include/linux/syscalls.h:122:35: note: in expansion of macro '__MAP2'
     122 | #define __MAP3(m,t,a,...) m(t,a), __MAP2(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP3'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:230:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     230 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c:573:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     573 | SYSCALL_DEFINE3(timer_create, const clockid_t, which_clock,
         | ^~~~~~~~~~~~~~~
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:120:27: note: in expansion of macro '__SC_CAST_TO_S64'
     120 | #define __MAP1(m,t,a,...) m(t,a)
         |                           ^
   include/linux/syscalls.h:121:35: note: in expansion of macro '__MAP1'
     121 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:122:35: note: in expansion of macro '__MAP2'
     122 | #define __MAP3(m,t,a,...) m(t,a), __MAP2(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP3'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:230:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     230 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c:573:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     573 | SYSCALL_DEFINE3(timer_create, const clockid_t, which_clock,
         | ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c: In function '__do_kapi_sys_timer_gettime':
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:120:27: note: in expansion of macro '__SC_CAST_TO_S64'
     120 | #define __MAP1(m,t,a,...) m(t,a)
         |                           ^
   include/linux/syscalls.h:121:35: note: in expansion of macro '__MAP1'
     121 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP2'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c:751:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     751 | SYSCALL_DEFINE2(timer_gettime, timer_t, timer_id,
         | ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c: In function '__do_kapi_sys_timer_gettime32':
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:120:27: note: in expansion of macro '__SC_CAST_TO_S64'
     120 | #define __MAP1(m,t,a,...) m(t,a)
         |                           ^
   include/linux/syscalls.h:121:35: note: in expansion of macro '__MAP1'
     121 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP2'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c:766:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     766 | SYSCALL_DEFINE2(timer_gettime32, timer_t, timer_id,
         | ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c: In function '__do_kapi_sys_timer_settime':
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:121:27: note: in expansion of macro '__SC_CAST_TO_S64'
     121 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                           ^
   include/linux/syscalls.h:122:35: note: in expansion of macro '__MAP2'
     122 | #define __MAP3(m,t,a,...) m(t,a), __MAP2(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:123:35: note: in expansion of macro '__MAP3'
     123 | #define __MAP4(m,t,a,...) m(t,a), __MAP3(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP4'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:231:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     231 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c:954:1: note: in expansion of macro 'SYSCALL_DEFINE4'
     954 | SYSCALL_DEFINE4(timer_settime, timer_t, timer_id, int, flags,
         | ^~~~~~~~~~~~~~~
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:120:27: note: in expansion of macro '__SC_CAST_TO_S64'
     120 | #define __MAP1(m,t,a,...) m(t,a)
         |                           ^
   include/linux/syscalls.h:121:35: note: in expansion of macro '__MAP1'
     121 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:122:35: note: in expansion of macro '__MAP2'
     122 | #define __MAP3(m,t,a,...) m(t,a), __MAP2(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:123:35: note: in expansion of macro '__MAP3'
     123 | #define __MAP4(m,t,a,...) m(t,a), __MAP3(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP4'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:231:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     231 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c:954:1: note: in expansion of macro 'SYSCALL_DEFINE4'
     954 | SYSCALL_DEFINE4(timer_settime, timer_t, timer_id, int, flags,
         | ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c: In function '__do_kapi_sys_timer_settime32':
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:121:27: note: in expansion of macro '__SC_CAST_TO_S64'
     121 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                           ^
   include/linux/syscalls.h:122:35: note: in expansion of macro '__MAP2'
     122 | #define __MAP3(m,t,a,...) m(t,a), __MAP2(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:123:35: note: in expansion of macro '__MAP3'
     123 | #define __MAP4(m,t,a,...) m(t,a), __MAP3(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP4'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:231:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     231 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c:977:1: note: in expansion of macro 'SYSCALL_DEFINE4'
     977 | SYSCALL_DEFINE4(timer_settime32, timer_t, timer_id, int, flags,
         | ^~~~~~~~~~~~~~~
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:120:27: note: in expansion of macro '__SC_CAST_TO_S64'
     120 | #define __MAP1(m,t,a,...) m(t,a)
         |                           ^
   include/linux/syscalls.h:121:35: note: in expansion of macro '__MAP1'
     121 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:122:35: note: in expansion of macro '__MAP2'
     122 | #define __MAP3(m,t,a,...) m(t,a), __MAP2(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:123:35: note: in expansion of macro '__MAP3'
     123 | #define __MAP4(m,t,a,...) m(t,a), __MAP3(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP4'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:231:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     231 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c:977:1: note: in expansion of macro 'SYSCALL_DEFINE4'
     977 | SYSCALL_DEFINE4(timer_settime32, timer_t, timer_id, int, flags,
         | ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c: In function '__do_kapi_sys_clock_settime':
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:120:27: note: in expansion of macro '__SC_CAST_TO_S64'
     120 | #define __MAP1(m,t,a,...) m(t,a)
         |                           ^
   include/linux/syscalls.h:121:35: note: in expansion of macro '__MAP1'
     121 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP2'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c:1115:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    1115 | SYSCALL_DEFINE2(clock_settime, const clockid_t, which_clock,
         | ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c: In function '__do_kapi_sys_clock_gettime':
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:120:27: note: in expansion of macro '__SC_CAST_TO_S64'
     120 | #define __MAP1(m,t,a,...) m(t,a)
         |                           ^
   include/linux/syscalls.h:121:35: note: in expansion of macro '__MAP1'
     121 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP2'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c:1134:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    1134 | SYSCALL_DEFINE2(clock_gettime, const clockid_t, which_clock,
         | ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c: In function '__do_kapi_sys_clock_adjtime':
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:120:27: note: in expansion of macro '__SC_CAST_TO_S64'
     120 | #define __MAP1(m,t,a,...) m(t,a)
         |                           ^
   include/linux/syscalls.h:121:35: note: in expansion of macro '__MAP1'
     121 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP2'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c:1164:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    1164 | SYSCALL_DEFINE2(clock_adjtime, const clockid_t, which_clock,
         | ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c: In function '__do_kapi_sys_clock_getres':
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:120:27: note: in expansion of macro '__SC_CAST_TO_S64'
     120 | #define __MAP1(m,t,a,...) m(t,a)
         |                           ^
   include/linux/syscalls.h:121:35: note: in expansion of macro '__MAP1'
     121 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP2'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c:1254:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    1254 | SYSCALL_DEFINE2(clock_getres, const clockid_t, which_clock,
         | ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c: In function '__do_kapi_sys_clock_settime32':
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:120:27: note: in expansion of macro '__SC_CAST_TO_S64'
     120 | #define __MAP1(m,t,a,...) m(t,a)
         |                           ^
   include/linux/syscalls.h:121:35: note: in expansion of macro '__MAP1'
     121 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP2'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c:1274:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    1274 | SYSCALL_DEFINE2(clock_settime32, clockid_t, which_clock,
         | ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c: In function '__do_kapi_sys_clock_gettime32':
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:120:27: note: in expansion of macro '__SC_CAST_TO_S64'
     120 | #define __MAP1(m,t,a,...) m(t,a)
         |                           ^
   include/linux/syscalls.h:121:35: note: in expansion of macro '__MAP1'
     121 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP2'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c:1289:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    1289 | SYSCALL_DEFINE2(clock_gettime32, clockid_t, which_clock,
         | ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c: In function '__do_kapi_sys_clock_adjtime32':
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:120:27: note: in expansion of macro '__SC_CAST_TO_S64'
     120 | #define __MAP1(m,t,a,...) m(t,a)
         |                           ^
   include/linux/syscalls.h:121:35: note: in expansion of macro '__MAP1'
     121 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP2'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c:1307:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    1307 | SYSCALL_DEFINE2(clock_adjtime32, clockid_t, which_clock,
         | ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c: In function '__do_kapi_sys_clock_getres_time32':
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:120:27: note: in expansion of macro '__SC_CAST_TO_S64'
     120 | #define __MAP1(m,t,a,...) m(t,a)
         |                           ^
   include/linux/syscalls.h:121:35: note: in expansion of macro '__MAP1'
     121 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP2'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c:1325:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    1325 | SYSCALL_DEFINE2(clock_getres_time32, clockid_t, which_clock,
         | ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c: In function '__do_kapi_sys_clock_nanosleep':
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:121:27: note: in expansion of macro '__SC_CAST_TO_S64'
     121 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                           ^
   include/linux/syscalls.h:122:35: note: in expansion of macro '__MAP2'
     122 | #define __MAP3(m,t,a,...) m(t,a), __MAP2(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:123:35: note: in expansion of macro '__MAP3'
     123 | #define __MAP4(m,t,a,...) m(t,a), __MAP3(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP4'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:231:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     231 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c:1375:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    1375 | SYSCALL_DEFINE4(clock_nanosleep, const clockid_t, which_clock, int, flags,
         | ^~~~~~~~~~~~~~~
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:120:27: note: in expansion of macro '__SC_CAST_TO_S64'
     120 | #define __MAP1(m,t,a,...) m(t,a)
         |                           ^
   include/linux/syscalls.h:121:35: note: in expansion of macro '__MAP1'
     121 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:122:35: note: in expansion of macro '__MAP2'
     122 | #define __MAP3(m,t,a,...) m(t,a), __MAP2(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:123:35: note: in expansion of macro '__MAP3'
     123 | #define __MAP4(m,t,a,...) m(t,a), __MAP3(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP4'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:231:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     231 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c:1375:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    1375 | SYSCALL_DEFINE4(clock_nanosleep, const clockid_t, which_clock, int, flags,
         | ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c: In function '__do_kapi_sys_clock_nanosleep_time32':
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:121:27: note: in expansion of macro '__SC_CAST_TO_S64'
     121 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                           ^
   include/linux/syscalls.h:122:35: note: in expansion of macro '__MAP2'
     122 | #define __MAP3(m,t,a,...) m(t,a), __MAP2(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:123:35: note: in expansion of macro '__MAP3'
     123 | #define __MAP4(m,t,a,...) m(t,a), __MAP3(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP4'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:231:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     231 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c:1403:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    1403 | SYSCALL_DEFINE4(clock_nanosleep_time32, clockid_t, which_clock, int, flags,
         | ^~~~~~~~~~~~~~~
>> include/linux/syscalls.h:138:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     138 | #define __SC_CAST_TO_S64(t, a)  (s64)(a)
         |                                 ^
   include/linux/syscalls.h:120:27: note: in expansion of macro '__SC_CAST_TO_S64'
     120 | #define __MAP1(m,t,a,...) m(t,a)
         |                           ^
   include/linux/syscalls.h:121:35: note: in expansion of macro '__MAP1'
     121 | #define __MAP2(m,t,a,...) m(t,a), __MAP1(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:122:35: note: in expansion of macro '__MAP2'
     122 | #define __MAP3(m,t,a,...) m(t,a), __MAP2(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:123:35: note: in expansion of macro '__MAP3'
     123 | #define __MAP4(m,t,a,...) m(t,a), __MAP3(m,__VA_ARGS__)
         |                                   ^~~~~~
   include/linux/syscalls.h:126:22: note: in expansion of macro '__MAP4'
     126 | #define __MAP(n,...) __MAP##n(__VA_ARGS__)
         |                      ^~~~~
   include/linux/syscalls.h:272:45: note: in expansion of macro '__MAP'
     272 |                         s64 __params[x] = { __MAP(x,__SC_CAST_TO_S64,__VA_ARGS__) }; \
         |                                             ^~~~~
   include/linux/syscalls.h:239:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     239 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:231:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     231 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/time/posix-timers.c:1403:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    1403 | SYSCALL_DEFINE4(clock_nanosleep_time32, clockid_t, which_clock, int, flags,
         | ^~~~~~~~~~~~~~~
..


vim +795 kernel/api/kernel_api_spec.c

   771	
   772	/**
   773	 * kapi_validate_param - Validate a parameter against its specification
   774	 * @param_spec: Parameter specification
   775	 * @value: Parameter value to validate
   776	 *
   777	 * Return: true if valid, false otherwise
   778	 */
   779	bool kapi_validate_param(const struct kapi_param_spec *param_spec, s64 value)
   780	{
   781		int i;
   782	
   783		/* Special handling for file descriptor type */
   784		if (param_spec->type == KAPI_TYPE_FD) {
   785			if (!kapi_validate_fd((int)value)) {
   786				pr_warn("Parameter %s: invalid file descriptor %lld\n",
   787					param_spec->name, value);
   788				return false;
   789			}
   790			/* Continue with additional constraint checks if needed */
   791		}
   792	
   793		/* Special handling for user pointer type */
   794		if (param_spec->type == KAPI_TYPE_USER_PTR) {
 > 795			const void __user *ptr = (const void __user *)value;
   796	
   797			/* NULL is allowed for optional parameters */
   798			if (!ptr && (param_spec->flags & KAPI_PARAM_OPTIONAL))
   799				return true;
   800	
   801			if (!kapi_validate_user_ptr(ptr, param_spec->size)) {
   802				pr_warn("Parameter %s: invalid user pointer %p (size: %zu)\n",
   803					param_spec->name, ptr, param_spec->size);
   804				return false;
   805			}
   806			/* Continue with additional constraint checks if needed */
   807		}
   808	
   809		/* Special handling for path type */
   810		if (param_spec->type == KAPI_TYPE_PATH) {
   811			const char __user *path = (const char __user *)value;
   812	
   813			if (!kapi_validate_path(path, param_spec)) {
   814				return false;
   815			}
   816			/* Continue with additional constraint checks if needed */
   817		}
   818	
   819		switch (param_spec->constraint_type) {
   820		case KAPI_CONSTRAINT_NONE:
   821			return true;
   822	
   823		case KAPI_CONSTRAINT_RANGE:
   824			if (value < param_spec->min_value || value > param_spec->max_value) {
   825				pr_warn("Parameter %s value %lld out of range [%lld, %lld]\n",
   826					param_spec->name, value,
   827					param_spec->min_value, param_spec->max_value);
   828				return false;
   829			}
   830			return true;
   831	
   832		case KAPI_CONSTRAINT_MASK:
   833			if (value & ~param_spec->valid_mask) {
   834				pr_warn("Parameter %s value 0x%llx contains invalid bits (valid mask: 0x%llx)\n",
   835					param_spec->name, value, param_spec->valid_mask);
   836				return false;
   837			}
   838			return true;
   839	
   840		case KAPI_CONSTRAINT_ENUM:
   841			if (!param_spec->enum_values || param_spec->enum_count == 0)
   842				return true;
   843	
   844			for (i = 0; i < param_spec->enum_count; i++) {
   845				if (value == param_spec->enum_values[i])
   846					return true;
   847			}
   848			pr_warn("Parameter %s value %lld not in valid enumeration\n",
   849				param_spec->name, value);
   850			return false;
   851	
   852		case KAPI_CONSTRAINT_ALIGNMENT:
   853			if (param_spec->alignment == 0) {
   854				pr_warn("Parameter %s: alignment constraint specified but alignment is 0\n",
   855					param_spec->name);
   856				return false;
   857			}
   858			if (value & (param_spec->alignment - 1)) {
   859				pr_warn("Parameter %s value 0x%llx not aligned to %zu boundary\n",
   860					param_spec->name, value, param_spec->alignment);
   861				return false;
   862			}
   863			return true;
   864	
   865		case KAPI_CONSTRAINT_POWER_OF_TWO:
   866			if (value == 0 || (value & (value - 1))) {
   867				pr_warn("Parameter %s value %lld is not a power of two\n",
   868					param_spec->name, value);
   869				return false;
   870			}
   871			return true;
   872	
   873		case KAPI_CONSTRAINT_PAGE_ALIGNED:
   874			if (value & (PAGE_SIZE - 1)) {
   875				pr_warn("Parameter %s value 0x%llx not page-aligned (PAGE_SIZE=%ld)\n",
   876					param_spec->name, value, PAGE_SIZE);
   877				return false;
   878			}
   879			return true;
   880	
   881		case KAPI_CONSTRAINT_NONZERO:
   882			if (value == 0) {
   883				pr_warn("Parameter %s must be non-zero\n", param_spec->name);
   884				return false;
   885			}
   886			return true;
   887	
   888		case KAPI_CONSTRAINT_USER_STRING:
   889			return kapi_validate_user_string((const char __user *)value, param_spec);
   890	
   891		case KAPI_CONSTRAINT_USER_PATH:
   892			return kapi_validate_path((const char __user *)value, param_spec);
   893	
   894		case KAPI_CONSTRAINT_USER_PTR:
   895			return kapi_validate_user_ptr_constraint((const void __user *)value, param_spec);
   896	
   897		case KAPI_CONSTRAINT_CUSTOM:
   898			if (param_spec->validate)
   899				return param_spec->validate(value);
   900			return true;
   901	
   902		default:
   903			return true;
   904		}
   905	}
   906	EXPORT_SYMBOL_GPL(kapi_validate_param);
   907	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
