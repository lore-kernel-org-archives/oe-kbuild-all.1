Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CDD81ACA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 01:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774314391; cv=none; b=elh65xEL5e0cbTdVn7dd0A3RbXEWyvMgfrpaIGhhrdIa7hM9jCtchOWzgp+KroeILwn1CCx35Ap59goJSw9kLjLQfehrIAjmTO3jTLRdCSwsBnyT5eNw+k6n10YaYQAnfUTz9hOIMBj3VlRNNUuQBMx93miPYaW8+w19LIIdQcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774314391; c=relaxed/simple;
	bh=Ku+tKOWjqAw4kfc8muj9gqz6+SAUjLYhhBUj+mkOz0U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s/AJjMOtF1yb+DeGuyIw2CO1EgQfQuVW2qeJa6DceDeh9klJ8hTEMNeG7ILOFhErLi18Q8Jw1VzOTg29CzOr2ISBhkeHp6cwGbptm5vVlghmOLutEScO/PQKMZbD61sQi6FsnngSx7RQTwe8ZxrJYV39qlHm9i5Wvk1s3k/us28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ftgkGKWv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ftgkGKWv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774314390; x=1805850390;
  h=date:from:to:cc:subject:message-id;
  bh=Ku+tKOWjqAw4kfc8muj9gqz6+SAUjLYhhBUj+mkOz0U=;
  b=ftgkGKWv3ZNPTRuDCuM2UI/xgXKM5GgolHdH3+c3EAXFWJ5DhfYT4Tuz
   7zhBH2HFSGqfIKB1Hl+naLmHe03BzNUeT6TMq32mqO0+U+jDBrvvZOK15
   9FaNRAdRHTUsEIQ/PGypePw/CtQ9uxyIoPeevlYf4rkIi6/AYJocgKLCI
   E+a+m1qD7V1+80iOG2anAlIzSgIkcYmZJkFB+SoO2ZXHU7DO96rN/Ce6J
   mN2UuXqzzzVyBxv8Pqzf1hswMqROELH5XBEmso8WOVJhU32TYFn6LxMls
   n8GqBfbmRZcWa9QlvaUiF0Hu6vpVtA948+vv7IqT6CVwJi3B4H2e7/fcA
   Q==;
X-CSE-ConnectionGUID: Eaq0a9P2RDm/Ul+Ti0Hm2Q==
X-CSE-MsgGUID: 7lN29sjuQqi5oCn6rhAwlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="74508964"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="74508964"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 18:06:30 -0700
X-CSE-ConnectionGUID: XCUO21nhSHSv4Nhbal8tbg==
X-CSE-MsgGUID: /0ZNKMm7QNyWjCAgFEQ4zg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Mar 2026 18:06:28 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4qDy-000000003U5-0Vur;
	Tue, 24 Mar 2026 01:06:26 +0000
Date: Tue, 24 Mar 2026 09:06:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1]
 kernel/time/tick-sched.c:212:6: warning: variable 'tick_cpu' is uninitialized
 when used here
Message-ID: <202603240847.bwVm3Qqb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   3a8949cdc45bfeb1a68ac0e70e90909c13d3910e
commit: a94ba5ab288780f141d741107751b4866bc24be3 [0/1] BACKPORT: timekeeping: Use READ/WRITE_ONCE() for tick_do_timer_cpu
config: i386-buildonly-randconfig-005-20260324 (https://download.01.org/0day-ci/archive/20260324/202603240847.bwVm3Qqb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240847.bwVm3Qqb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240847.bwVm3Qqb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/time/tick-sched.c:11:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:8:
   In file included from include/linux/page_size_compat.h:33:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:2229:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/time/tick-sched.c:212:6: warning: variable 'tick_cpu' is uninitialized when used here [-Wuninitialized]
     212 |         if (tick_cpu == cpu) {
         |             ^~~~~~~~
   kernel/time/tick-sched.c:188:14: note: initialize the variable 'tick_cpu' to silence this warning
     188 |         int tick_cpu, cpu = smp_processor_id();
         |                     ^
         |                      = 0
   2 warnings generated.


vim +/tick_cpu +212 kernel/time/tick-sched.c

   210	
   211		/* Check, if the jiffies need an update */
 > 212		if (tick_cpu == cpu) {
   213			tick_do_update_jiffies64(now);
   214			trace_android_vh_jiffies_update(NULL);
   215		}
   216	
   217		/*
   218		 * If jiffies update stalled for too long (timekeeper in stop_machine()
   219		 * or VMEXIT'ed for several msecs), force an update.
   220		 */
   221		if (ts->last_tick_jiffies != jiffies) {
   222			ts->stalled_jiffies = 0;
   223			ts->last_tick_jiffies = READ_ONCE(jiffies);
   224		} else {
   225			if (++ts->stalled_jiffies == MAX_STALLED_JIFFIES) {
   226				tick_do_update_jiffies64(now);
   227				ts->stalled_jiffies = 0;
   228				ts->last_tick_jiffies = READ_ONCE(jiffies);
   229			}
   230		}
   231	
   232		if (ts->inidle)
   233			ts->got_idle_tick = 1;
   234	}
   235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
