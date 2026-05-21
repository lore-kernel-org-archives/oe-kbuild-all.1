Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14007228CB0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 22:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779402346; cv=none; b=ICC4tWq6Jwd/8XAnIrouu68uMLw1n5Bu6HU4iHfOdLpq/tNZlpsWoQOi445PQV4ox+1DRya1MbaH6A/p+7J7Fl352losfrrdK2j5Z4KBoCXu8iSwt+8Zr/U64Lx52fX5y8uVmY6syAaq/sGC1wRQfzSPAE5uSNnhPoCDmbQH1Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779402346; c=relaxed/simple;
	bh=m/rTIom7MQaXYfgzvLqOBwI/e3CdKjjbY5DvmTZowXA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DC/r2ex0M9Xo1KeYSqxAZjUO7TsrWm30vK3G26y3MSXavncRxgquwdhRxvlxzqTYiZlM/tNHTmxQVkhdOzN40C9FJ+WbBy5ky678Z/KQFK+NSKjrQzZQu+FoMMO8eZbVxadIYau2FggctZG42tv3zqOv3C94MPHo3h1jwBlV8ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQcDdwvF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQcDdwvF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779402344; x=1810938344;
  h=date:from:to:cc:subject:message-id;
  bh=m/rTIom7MQaXYfgzvLqOBwI/e3CdKjjbY5DvmTZowXA=;
  b=iQcDdwvFaUPxj4wJ16aIGufjeI5Zh37cszpZv/2xUn8CUImmOXewkv1F
   cJxNI3jFm1VATzePXYIQSsMeamtbdMAXBi1qV+Vr4cyyZH5MbFlh9refT
   NX6fHzgcwBp3+IY3cbL+Ii00KzZKc+QPEQabN0Ia5w8P20mmxj34oWybx
   Eg+mQu/m5PZ5pHtWkfumaPzmR+PX0r8jt9RXv+ebhYJXE/l0rSYZk1S9M
   JSI0gRCE08RFCHYInCWCmckk4K5GqoU1HmfyUKHMsGSJ07gBeBKFvs8O5
   sD8UTRujh9nh8uuKwRX5zJFvPZePnrs1qBfELajGXm1Jwb9tid6nsX59K
   w==;
X-CSE-ConnectionGUID: JB9qwYxRTOCYzljBze6PkQ==
X-CSE-MsgGUID: i6A16C+QQn6Cx9iC+dT5Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="105795908"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="105795908"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 15:25:44 -0700
X-CSE-ConnectionGUID: w420dzRSQGOVo3eicEA16g==
X-CSE-MsgGUID: tOKrZGRbQm+B9xeiMgW/Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="264480112"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 May 2026 15:25:42 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQBpj-000000001GL-3iJH;
	Thu, 21 May 2026 22:25:39 +0000
Date: Fri, 22 May 2026 06:25:02 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 460/1130]
 kernel/bpf/syscall.c:6346:9: warning: enumeration value '__MAX_BPF_CMD' not
 handled in switch
Message-ID: <202605220622.P8MTityv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: cdb93591dcfdf1fa3a23036e0da2dc2d54ba76eb [460/1130] [CHERRY-PICK] bpf: compat64: support CHECK_ATTR macro
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260522/202605220622.P8MTityv-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605220622.P8MTityv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605220622.P8MTityv-lkp@intel.com/

All warnings (new ones prefixed by >>):

                    from kernel/bpf/syscall.c:4:
   include/linux/stddef.h:19:33: error: 'union compat_bpf_attr' has no member named 'excl_prog_hash_size'
      19 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:1211:17: note: in expansion of macro 'offsetof'
    1211 |                 offsetof(TYPE, CMD##_LAST_FIELD) - \
         |                 ^~~~~~~~
   kernel/bpf/syscall.c:1216:17: note: in expansion of macro '__CHECK_ATTR'
    1216 |                 __CHECK_ATTR(CMD, union compat_bpf_attr) : \
         |                 ^~~~~~~~~~~~
   kernel/bpf/syscall.c:6348:24: note: in expansion of macro 'CHECK_ATTR'
    6348 |                 return CHECK_ATTR(BPF_MAP_CREATE);
         |                        ^~~~~~~~~~
   kernel/bpf/syscall.c:1212:39: error: 'union compat_bpf_attr' has no member named 'excl_prog_hash_size'
    1212 |                 sizeof(((TYPE *)vattr)->CMD##_LAST_FIELD)) != NULL)
         |                                       ^~
   kernel/bpf/syscall.c:1216:17: note: in expansion of macro '__CHECK_ATTR'
    1216 |                 __CHECK_ATTR(CMD, union compat_bpf_attr) : \
         |                 ^~~~~~~~~~~~
   kernel/bpf/syscall.c:6348:24: note: in expansion of macro 'CHECK_ATTR'
    6348 |                 return CHECK_ATTR(BPF_MAP_CREATE);
         |                        ^~~~~~~~~~
   kernel/bpf/syscall.c:1208:47: error: 'union compat_bpf_attr' has no member named 'keyring_id'
    1208 |         (memchr_inv((void *) &(((TYPE *)vattr)->CMD##_LAST_FIELD) + \
         |                                               ^~
   kernel/bpf/syscall.c:1216:17: note: in expansion of macro '__CHECK_ATTR'
    1216 |                 __CHECK_ATTR(CMD, union compat_bpf_attr) : \
         |                 ^~~~~~~~~~~~
   kernel/bpf/syscall.c:6360:24: note: in expansion of macro 'CHECK_ATTR'
    6360 |                 return CHECK_ATTR(BPF_PROG_LOAD);
         |                        ^~~~~~~~~~
   kernel/bpf/syscall.c:1209:39: error: 'union compat_bpf_attr' has no member named 'keyring_id'
    1209 |                 sizeof(((TYPE *)vattr)->CMD##_LAST_FIELD), 0, \
         |                                       ^~
   kernel/bpf/syscall.c:1216:17: note: in expansion of macro '__CHECK_ATTR'
    1216 |                 __CHECK_ATTR(CMD, union compat_bpf_attr) : \
         |                 ^~~~~~~~~~~~
   kernel/bpf/syscall.c:6360:24: note: in expansion of macro 'CHECK_ATTR'
    6360 |                 return CHECK_ATTR(BPF_PROG_LOAD);
         |                        ^~~~~~~~~~
   include/linux/stddef.h:19:33: error: 'union compat_bpf_attr' has no member named 'keyring_id'
      19 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:1211:17: note: in expansion of macro 'offsetof'
    1211 |                 offsetof(TYPE, CMD##_LAST_FIELD) - \
         |                 ^~~~~~~~
   kernel/bpf/syscall.c:1216:17: note: in expansion of macro '__CHECK_ATTR'
    1216 |                 __CHECK_ATTR(CMD, union compat_bpf_attr) : \
         |                 ^~~~~~~~~~~~
   kernel/bpf/syscall.c:6360:24: note: in expansion of macro 'CHECK_ATTR'
    6360 |                 return CHECK_ATTR(BPF_PROG_LOAD);
         |                        ^~~~~~~~~~
   kernel/bpf/syscall.c:1212:39: error: 'union compat_bpf_attr' has no member named 'keyring_id'
    1212 |                 sizeof(((TYPE *)vattr)->CMD##_LAST_FIELD)) != NULL)
         |                                       ^~
   kernel/bpf/syscall.c:1216:17: note: in expansion of macro '__CHECK_ATTR'
    1216 |                 __CHECK_ATTR(CMD, union compat_bpf_attr) : \
         |                 ^~~~~~~~~~~~
   kernel/bpf/syscall.c:6360:24: note: in expansion of macro 'CHECK_ATTR'
    6360 |                 return CHECK_ATTR(BPF_PROG_LOAD);
         |                        ^~~~~~~~~~
   kernel/bpf/syscall.c:1208:47: error: 'union compat_bpf_attr' has no member named 'prog_stream_read'
    1208 |         (memchr_inv((void *) &(((TYPE *)vattr)->CMD##_LAST_FIELD) + \
         |                                               ^~
   kernel/bpf/syscall.c:1216:17: note: in expansion of macro '__CHECK_ATTR'
    1216 |                 __CHECK_ATTR(CMD, union compat_bpf_attr) : \
         |                 ^~~~~~~~~~~~
   kernel/bpf/syscall.c:6422:24: note: in expansion of macro 'CHECK_ATTR'
    6422 |                 return CHECK_ATTR(BPF_PROG_STREAM_READ_BY_FD);
         |                        ^~~~~~~~~~
   kernel/bpf/syscall.c:1209:39: error: 'union compat_bpf_attr' has no member named 'prog_stream_read'
    1209 |                 sizeof(((TYPE *)vattr)->CMD##_LAST_FIELD), 0, \
         |                                       ^~
   kernel/bpf/syscall.c:1216:17: note: in expansion of macro '__CHECK_ATTR'
    1216 |                 __CHECK_ATTR(CMD, union compat_bpf_attr) : \
         |                 ^~~~~~~~~~~~
   kernel/bpf/syscall.c:6422:24: note: in expansion of macro 'CHECK_ATTR'
    6422 |                 return CHECK_ATTR(BPF_PROG_STREAM_READ_BY_FD);
         |                        ^~~~~~~~~~
   include/linux/stddef.h:19:33: error: 'union compat_bpf_attr' has no member named 'prog_stream_read'
      19 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:1211:17: note: in expansion of macro 'offsetof'
    1211 |                 offsetof(TYPE, CMD##_LAST_FIELD) - \
         |                 ^~~~~~~~
   kernel/bpf/syscall.c:1216:17: note: in expansion of macro '__CHECK_ATTR'
    1216 |                 __CHECK_ATTR(CMD, union compat_bpf_attr) : \
         |                 ^~~~~~~~~~~~
   kernel/bpf/syscall.c:6422:24: note: in expansion of macro 'CHECK_ATTR'
    6422 |                 return CHECK_ATTR(BPF_PROG_STREAM_READ_BY_FD);
         |                        ^~~~~~~~~~
   kernel/bpf/syscall.c:1212:39: error: 'union compat_bpf_attr' has no member named 'prog_stream_read'
    1212 |                 sizeof(((TYPE *)vattr)->CMD##_LAST_FIELD)) != NULL)
         |                                       ^~
   kernel/bpf/syscall.c:1216:17: note: in expansion of macro '__CHECK_ATTR'
    1216 |                 __CHECK_ATTR(CMD, union compat_bpf_attr) : \
         |                 ^~~~~~~~~~~~
   kernel/bpf/syscall.c:6422:24: note: in expansion of macro 'CHECK_ATTR'
    6422 |                 return CHECK_ATTR(BPF_PROG_STREAM_READ_BY_FD);
         |                        ^~~~~~~~~~
>> kernel/bpf/syscall.c:6346:9: warning: enumeration value '__MAX_BPF_CMD' not handled in switch [-Wswitch]
    6346 |         switch (cmd) {
         |         ^~~~~~


vim +/__MAX_BPF_CMD +6346 kernel/bpf/syscall.c

  6343	
  6344	static int check_attr(enum bpf_cmd cmd, void *vattr)
  6345	{
> 6346		switch (cmd) {
  6347		case BPF_MAP_CREATE:
  6348			return CHECK_ATTR(BPF_MAP_CREATE);
  6349		case BPF_MAP_LOOKUP_ELEM:
  6350			return CHECK_ATTR(BPF_MAP_LOOKUP_ELEM);
  6351		case BPF_MAP_UPDATE_ELEM:
  6352			return CHECK_ATTR(BPF_MAP_UPDATE_ELEM);
  6353		case BPF_MAP_DELETE_ELEM:
  6354			return CHECK_ATTR(BPF_MAP_DELETE_ELEM);
  6355		case BPF_MAP_GET_NEXT_KEY:
  6356			return CHECK_ATTR(BPF_MAP_GET_NEXT_KEY);
  6357		case BPF_MAP_FREEZE:
  6358			return CHECK_ATTR(BPF_MAP_FREEZE);
  6359		case BPF_PROG_LOAD:
  6360			return CHECK_ATTR(BPF_PROG_LOAD);
  6361		case BPF_OBJ_PIN:
  6362			return CHECK_ATTR(BPF_OBJ);
  6363		case BPF_OBJ_GET:
  6364			return CHECK_ATTR(BPF_OBJ);
  6365		case BPF_PROG_ATTACH:
  6366			return CHECK_ATTR(BPF_PROG_ATTACH);
  6367		case BPF_PROG_DETACH:
  6368			return CHECK_ATTR(BPF_PROG_DETACH);
  6369		case BPF_PROG_QUERY:
  6370			return CHECK_ATTR(BPF_PROG_QUERY);
  6371		case BPF_PROG_TEST_RUN:
  6372			return CHECK_ATTR(BPF_PROG_TEST_RUN);
  6373		case BPF_PROG_GET_NEXT_ID:
  6374			return CHECK_ATTR(BPF_OBJ_GET_NEXT_ID);
  6375		case BPF_MAP_GET_NEXT_ID:
  6376			return CHECK_ATTR(BPF_OBJ_GET_NEXT_ID);
  6377		case BPF_BTF_GET_NEXT_ID:
  6378			return CHECK_ATTR(BPF_OBJ_GET_NEXT_ID);
  6379		case BPF_PROG_GET_FD_BY_ID:
  6380			return CHECK_ATTR(BPF_PROG_GET_FD_BY_ID);
  6381		case BPF_MAP_GET_FD_BY_ID:
  6382			return CHECK_ATTR(BPF_MAP_GET_FD_BY_ID);
  6383		case BPF_OBJ_GET_INFO_BY_FD:
  6384			return CHECK_ATTR(BPF_OBJ_GET_INFO_BY_FD);
  6385		case BPF_RAW_TRACEPOINT_OPEN:
  6386			return CHECK_ATTR(BPF_RAW_TRACEPOINT_OPEN);
  6387		case BPF_BTF_LOAD:
  6388			return CHECK_ATTR(BPF_BTF_LOAD);
  6389		case BPF_BTF_GET_FD_BY_ID:
  6390			return CHECK_ATTR(BPF_BTF_GET_FD_BY_ID);
  6391		case BPF_TASK_FD_QUERY:
  6392			return CHECK_ATTR(BPF_TASK_FD_QUERY);
  6393		case BPF_MAP_LOOKUP_AND_DELETE_ELEM:
  6394			return CHECK_ATTR(BPF_MAP_LOOKUP_AND_DELETE_ELEM);
  6395		case BPF_MAP_LOOKUP_BATCH:
  6396			return CHECK_ATTR(BPF_MAP_BATCH);
  6397		case BPF_MAP_LOOKUP_AND_DELETE_BATCH:
  6398			return CHECK_ATTR(BPF_MAP_BATCH);
  6399		case BPF_MAP_UPDATE_BATCH:
  6400			return CHECK_ATTR(BPF_MAP_BATCH);
  6401		case BPF_MAP_DELETE_BATCH:
  6402			return CHECK_ATTR(BPF_MAP_BATCH);
  6403		case BPF_LINK_CREATE:
  6404			return CHECK_ATTR(BPF_LINK_CREATE);
  6405		case BPF_LINK_UPDATE:
  6406			return CHECK_ATTR(BPF_LINK_UPDATE);
  6407		case BPF_LINK_GET_FD_BY_ID:
  6408			return CHECK_ATTR(BPF_LINK_GET_FD_BY_ID);
  6409		case BPF_LINK_GET_NEXT_ID:
  6410			return CHECK_ATTR(BPF_OBJ_GET_NEXT_ID);
  6411		case BPF_ENABLE_STATS:
  6412			return CHECK_ATTR(BPF_ENABLE_STATS);
  6413		case BPF_ITER_CREATE:
  6414			return CHECK_ATTR(BPF_ITER_CREATE);
  6415		case BPF_LINK_DETACH:
  6416			return CHECK_ATTR(BPF_LINK_DETACH);
  6417		case BPF_PROG_BIND_MAP:
  6418			return CHECK_ATTR(BPF_PROG_BIND_MAP);
  6419		case BPF_TOKEN_CREATE:
  6420			return CHECK_ATTR(BPF_TOKEN_CREATE);
  6421		case BPF_PROG_STREAM_READ_BY_FD:
  6422			return CHECK_ATTR(BPF_PROG_STREAM_READ_BY_FD);
  6423		/*
  6424		 * no default case so we're warned of unhandled enum bpf_cmd
  6425		 * values by -Wswitch
  6426		 */
  6427		}
  6428	
  6429		return 0;
  6430	}
  6431	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
