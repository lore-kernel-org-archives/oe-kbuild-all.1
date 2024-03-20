Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91616BB21
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Mar 2024 18:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710958644; cv=none; b=GVlbq4+CHy/IftyWsoscXdl+czQuTpMd1J3+zN3W1oLgJeEc/IPk6iHasWsJCYBrNaN7P66MoOh7gHkawXXSWMsuhMu3KdUqcgzXKCY8vTnBaCzelSz9+0RdOzfTzjncwewkZn8mCvQsCRgR4y/Mrstj/7D+p5PlXB9h++5/RH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710958644; c=relaxed/simple;
	bh=HzvseGf2wNoBjrLWumuhPsQdXPRyUdy+RsM9BvpKmJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JVNHH1wHlkFoYdnuPYFg9DJJGwCQzYql1rA3z8N9Pcwla+IMf16lMGsEDta5opLQAwntL6atFa3C+aivH/jzcZ268UJzPQEImy0vhpWPXuC6bOr/NhPo7cfEi7Azb336sb//eniX8sA5sskOVbBAfENO+3X+OT+beKC62Zp2X3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ikRbaiNz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ikRbaiNz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710958642; x=1742494642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HzvseGf2wNoBjrLWumuhPsQdXPRyUdy+RsM9BvpKmJY=;
  b=ikRbaiNzxAM6Vk5cpv+n3IP/pYH7z59ArDOyxdq8d7JR/sbtH/YVE8zg
   cP3DGSBiHuxrJ07aJf1hDyui5lIdxnF85oYlFQi+lbdPJPe5o0OSq/2qz
   FpR9tQaYq0jHBI2HS5KD9SvLHnV09nQ3JLYiSFg7F8spMBCOWKaSoq1oN
   xqXIE8P63d9hLqr7b2zU0r7c09qJJXd68l19UR20SzTOXDbwMsvQ/cx3T
   9mzcxGO/SCKr7rQFTEdKm5y2sRjERRbe8jgwZDy+KzaHBsee/4HY12qIt
   SI3Q8E2movf9iVzz/+YPOjgCEkZOnuPgg8dnX3bjlWwkA2qjVQgQkioxV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="9697742"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="9697742"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 11:17:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="14143981"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Mar 2024 11:17:20 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rn0V3-000Ipv-2c;
	Wed, 20 Mar 2024 18:17:17 +0000
Date: Thu, 21 Mar 2024 02:16:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 9348/9351]
 include/linux/percpu-rwsem.h:70:55: warning: cast from pointer to integer of
 different size
Message-ID: <202403210257.BLECeVcj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   b4f484defd8261509f34368436f0af8c7af79eeb
commit: 51c3760d93e2a3f2e64a65c5875c000180205a23 [9348/9351] ANDROID: vendor_hook: add hooks to protect locking-tsk in cpu scheduler
config: i386-buildonly-randconfig-002-20240320 (https://download.01.org/0day-ci/archive/20240321/202403210257.BLECeVcj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240321/202403210257.BLECeVcj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403210257.BLECeVcj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:1082,
                    from include/linux/mman.h:5,
                    from include/linux/page_size_compat.h:27,
                    from arch/x86/include/asm/elf.h:8,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/crypto/aria.h:22,
                    from arch/x86/kernel/asm-offsets.c:10:
   include/linux/percpu-rwsem.h: In function 'percpu_down_read':
>> include/linux/percpu-rwsem.h:70:55: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      70 |         _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, jiffies);
         |                                                       ^
   include/linux/percpu-rwsem.h: In function 'percpu_down_read_trylock':
   include/linux/percpu-rwsem.h:97:63: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      97 |                 _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, jiffies);
         |                                                               ^
   include/linux/percpu-rwsem.h: In function 'percpu_up_read':
   include/linux/percpu-rwsem.h:128:55: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     128 |         _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, 0);
         |                                                       ^
--
   In file included from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:1082,
                    from include/linux/mman.h:5,
                    from include/linux/page_size_compat.h:27,
                    from arch/x86/include/asm/elf.h:8,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from drivers/power/supply/rt9455_charger.c:8:
   include/linux/percpu-rwsem.h: In function 'percpu_down_read':
>> include/linux/percpu-rwsem.h:70:55: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      70 |         _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, jiffies);
         |                                                       ^
   include/linux/percpu-rwsem.h: In function 'percpu_down_read_trylock':
   include/linux/percpu-rwsem.h:97:63: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      97 |                 _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, jiffies);
         |                                                               ^
   include/linux/percpu-rwsem.h: In function 'percpu_up_read':
   include/linux/percpu-rwsem.h:128:55: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     128 |         _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, 0);
         |                                                       ^
   drivers/power/supply/rt9455_charger.c: At top level:
   drivers/power/supply/rt9455_charger.c:200:18: warning: 'rt9455_boost_voltage_values' defined but not used [-Wunused-const-variable=]
     200 | static const int rt9455_boost_voltage_values[] = {
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:1082,
                    from include/linux/mman.h:5,
                    from include/linux/page_size_compat.h:27,
                    from arch/x86/include/asm/elf.h:8,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/static_call.h:135,
                    from include/linux/tracepoint.h:22,
                    from include/trace/events/lock.h:9,
                    from kernel/locking/rwsem.c:30:
   include/linux/percpu-rwsem.h: In function 'percpu_down_read':
>> include/linux/percpu-rwsem.h:70:55: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      70 |         _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, jiffies);
         |                                                       ^
   include/linux/percpu-rwsem.h: In function 'percpu_down_read_trylock':
   include/linux/percpu-rwsem.h:97:63: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      97 |                 _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, jiffies);
         |                                                               ^
   include/linux/percpu-rwsem.h: In function 'percpu_up_read':
   include/linux/percpu-rwsem.h:128:55: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     128 |         _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, 0);
         |                                                       ^
   kernel/locking/rwsem.c: In function 'rwsem_read_trylock':
>> kernel/locking/rwsem.c:252:62: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     252 |                 trace_android_vh_record_rwsem_lock_starttime((u64)sem, jiffies);
         |                                                              ^
   kernel/locking/rwsem.c: In function 'rwsem_write_trylock':
   kernel/locking/rwsem.c:264:62: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     264 |                 trace_android_vh_record_rwsem_lock_starttime((u64)sem, jiffies);
         |                                                              ^
   kernel/locking/rwsem.c: In function 'rwsem_down_read_slowpath':
   kernel/locking/rwsem.c:1049:62: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1049 |                 trace_android_vh_record_rwsem_lock_starttime((u64)sem, jiffies);
         |                                                              ^
   kernel/locking/rwsem.c:1119:54: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1119 |         trace_android_vh_record_rwsem_lock_starttime((u64)sem, jiffies);
         |                                                      ^
   kernel/locking/rwsem.c: In function 'rwsem_down_write_slowpath':
   kernel/locking/rwsem.c:1144:62: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1144 |                 trace_android_vh_record_rwsem_lock_starttime((u64)sem, jiffies);
         |                                                              ^
   kernel/locking/rwsem.c:1225:54: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1225 |         trace_android_vh_record_rwsem_lock_starttime((u64)sem, jiffies);
         |                                                      ^
   kernel/locking/rwsem.c: In function '__down_read_trylock':
   kernel/locking/rwsem.c:1332:70: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1332 |                         trace_android_vh_record_rwsem_lock_starttime((u64)sem, jiffies);
         |                                                                      ^
   kernel/locking/rwsem.c: In function '__up_read':
   kernel/locking/rwsem.c:1397:54: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1397 |         trace_android_vh_record_rwsem_lock_starttime((u64)sem, 0);
         |                                                      ^
   kernel/locking/rwsem.c: In function '__up_write':
   kernel/locking/rwsem.c:1422:54: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1422 |         trace_android_vh_record_rwsem_lock_starttime((u64) sem, 0);
         |                                                      ^
--
   In file included from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:1082,
                    from include/linux/mman.h:5,
                    from include/linux/page_size_compat.h:27,
                    from arch/x86/include/asm/elf.h:8,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/static_call.h:135,
                    from include/linux/tracepoint.h:22,
                    from include/trace/events/lock.h:9,
                    from kernel/locking/mutex.c:34:
   include/linux/percpu-rwsem.h: In function 'percpu_down_read':
>> include/linux/percpu-rwsem.h:70:55: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      70 |         _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, jiffies);
         |                                                       ^
   include/linux/percpu-rwsem.h: In function 'percpu_down_read_trylock':
   include/linux/percpu-rwsem.h:97:63: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      97 |                 _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, jiffies);
         |                                                               ^
   include/linux/percpu-rwsem.h: In function 'percpu_up_read':
   include/linux/percpu-rwsem.h:128:55: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     128 |         _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, 0);
         |                                                       ^
   kernel/locking/mutex.c: In function 'mutex_unlock':
>> kernel/locking/mutex.c:564:54: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     564 |         trace_android_vh_record_mutex_lock_starttime((u64)lock, 0);
         |                                                      ^
   kernel/locking/mutex.c: In function '__mutex_lock_common':
   kernel/locking/mutex.c:634:62: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     634 |                 trace_android_vh_record_mutex_lock_starttime((u64)lock, jiffies);
         |                                                              ^
   kernel/locking/mutex.c:753:54: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     753 |         trace_android_vh_record_mutex_lock_starttime((u64)lock, jiffies);
         |                                                      ^
   kernel/locking/mutex.c: In function 'mutex_trylock':
   kernel/locking/mutex.c:1116:62: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1116 |                 trace_android_vh_record_mutex_lock_starttime((u64)lock, jiffies);
         |                                                              ^
--
   In file included from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:1082,
                    from include/linux/mman.h:5,
                    from include/linux/page_size_compat.h:27,
                    from arch/x86/include/asm/elf.h:8,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/static_call.h:135,
                    from include/linux/tracepoint.h:22,
                    from include/trace/events/lock.h:9,
                    from kernel/locking/rtmutex.c:27,
                    from kernel/locking/rtmutex_api.c:9:
   include/linux/percpu-rwsem.h: In function 'percpu_down_read':
>> include/linux/percpu-rwsem.h:70:55: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      70 |         _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, jiffies);
         |                                                       ^
   include/linux/percpu-rwsem.h: In function 'percpu_down_read_trylock':
   include/linux/percpu-rwsem.h:97:63: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      97 |                 _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, jiffies);
         |                                                               ^
   include/linux/percpu-rwsem.h: In function 'percpu_up_read':
   include/linux/percpu-rwsem.h:128:55: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     128 |         _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, 0);
         |                                                       ^
   kernel/locking/rtmutex_api.c: In function '__rt_mutex_lock_common':
>> kernel/locking/rtmutex_api.c:35:64: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      35 |                 trace_android_vh_record_rtmutex_lock_starttime((u64)lock, jiffies);
         |                                                                ^
   kernel/locking/rtmutex_api.c: In function 'rt_mutex_trylock':
   kernel/locking/rtmutex_api.c:129:64: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     129 |                 trace_android_vh_record_rtmutex_lock_starttime((u64)lock, jiffies);
         |                                                                ^
   kernel/locking/rtmutex_api.c: In function 'rt_mutex_unlock':
   kernel/locking/rtmutex_api.c:144:56: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     144 |         trace_android_vh_record_rtmutex_lock_starttime((u64)lock, 0);
         |                                                        ^
--
   In file included from kernel/locking/percpu-rwsem.c:6:
   include/linux/percpu-rwsem.h: In function 'percpu_down_read':
>> include/linux/percpu-rwsem.h:70:55: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      70 |         _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, jiffies);
         |                                                       ^
   include/linux/percpu-rwsem.h: In function 'percpu_down_read_trylock':
   include/linux/percpu-rwsem.h:97:63: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      97 |                 _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, jiffies);
         |                                                               ^
   include/linux/percpu-rwsem.h: In function 'percpu_up_read':
   include/linux/percpu-rwsem.h:128:55: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     128 |         _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, 0);
         |                                                       ^
   kernel/locking/percpu-rwsem.c: In function 'percpu_down_write':
>> kernel/locking/percpu-rwsem.c:267:54: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     267 |         trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, jiffies);
         |                                                      ^
   kernel/locking/percpu-rwsem.c: In function 'percpu_up_write':
   kernel/locking/percpu-rwsem.c:298:54: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     298 |         trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, 0);
         |                                                      ^
--
   In file included from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:1082,
                    from include/linux/mman.h:5,
                    from include/linux/page_size_compat.h:27,
                    from arch/x86/include/asm/elf.h:8,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/crypto/aria.h:22,
                    from arch/x86/kernel/asm-offsets.c:10:
   include/linux/percpu-rwsem.h: In function 'percpu_down_read':
>> include/linux/percpu-rwsem.h:70:55: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      70 |         _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, jiffies);
         |                                                       ^
   include/linux/percpu-rwsem.h: In function 'percpu_down_read_trylock':
   include/linux/percpu-rwsem.h:97:63: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      97 |                 _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, jiffies);
         |                                                               ^
   include/linux/percpu-rwsem.h: In function 'percpu_up_read':
   include/linux/percpu-rwsem.h:128:55: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     128 |         _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, 0);
         |                                                       ^


vim +70 include/linux/percpu-rwsem.h

    49	
    50	static inline void percpu_down_read(struct percpu_rw_semaphore *sem)
    51	{
    52		might_sleep();
    53	
    54		rwsem_acquire_read(&sem->dep_map, 0, 0, _RET_IP_);
    55	
    56		preempt_disable();
    57		/*
    58		 * We are in an RCU-sched read-side critical section, so the writer
    59		 * cannot both change sem->state from readers_fast and start checking
    60		 * counters while we are here. So if we see !sem->state, we know that
    61		 * the writer won't be checking until we're past the preempt_enable()
    62		 * and that once the synchronize_rcu() is done, the writer will see
    63		 * anything we did within this RCU-sched read-size critical section.
    64		 */
    65		if (likely(rcu_sync_is_idle(&sem->rss)))
    66			this_cpu_inc(*sem->read_count);
    67		else
    68			__percpu_down_read(sem, false); /* Unconditional memory barrier */
    69	
  > 70		_trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, jiffies);
    71		/*
    72		 * The preempt_enable() prevents the compiler from
    73		 * bleeding the critical section out.
    74		 */
    75		preempt_enable();
    76	}
    77	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
