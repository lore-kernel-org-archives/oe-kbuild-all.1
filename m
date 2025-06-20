Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFE87464
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 09:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750413179; cv=none; b=a/h50BqdzDcxSnQN2Aib1lY/uq/DJPaYwLKa/hqMNlBtMvBv+hQXdD+cV5bVBjBKWbY8Qfw6rcPTysV/7hZMOG216Hxi/8dehLbrwLtNBFrh9FXMOHO0NxFGjngLx4f6eUpeI8oJIGce+HyBIX04ZaIzXPxU7PWeEhr7OX2GDKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750413179; c=relaxed/simple;
	bh=et1/P7/tS7nx7RCaYt0rzZrh38C15uZljSZJVyQWzgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I9XCSnkmqvwOevAD/w5zfaBKvTpPVtfP/bUagzFTdIK5uHsHbEulD7hYD2Q+5X2WjPC8C1/W2yyE8V95FKkvoO9O1GFTeNMMNsLNuoi++RuLoZSykVhMAtW0ANI7gY+DufIizcsB7643bd8Tt7rre7xBagYlBVXlYX0ztxbHQLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PUz0rsXz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PUz0rsXz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750413177; x=1781949177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=et1/P7/tS7nx7RCaYt0rzZrh38C15uZljSZJVyQWzgA=;
  b=PUz0rsXzQym5HfF0t89BO19Aakw7MEQNIqnnGkZc4FnFjzZTfwBH7MMz
   U4YhsvAAFDbmAVnmq7tMQqayCJ9UDAsC7B0lvZsRnX6BONZODt6Xh01Pl
   JiVbLZ1yncczaPPqrUYi+KKtkPyoDnXiN0V6uZYidnnUNsZ9nhXvCns6p
   L6RWsiQk4g60EHT20gxZvyPxWNxG1Few0Rj3CSWBApvvU19XTUTgHlTNX
   WcCgNxWHoQSFbKUjDLBUvUMPpG53fw00GjssddfeuWxRe/Dgpp/DfwgeK
   Pw/Q1IuPmU0fRPV4v1aSjeilDAkpHNbwS2Ld2UPkbE6tN7A2b6gCAFtQg
   g==;
X-CSE-ConnectionGUID: Hi82LkloRd2LiGIYzRq8Uw==
X-CSE-MsgGUID: b++KZ6lxS6mF2uZldwNugg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63276373"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="63276373"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 02:52:57 -0700
X-CSE-ConnectionGUID: ru+Q7Jq8QJyo15JCYBoxTg==
X-CSE-MsgGUID: Sj0grMm1RBWxkzrbv4jh0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="151079404"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Jun 2025 02:52:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSYQX-000LaQ-0Y;
	Fri, 20 Jun 2025 09:52:53 +0000
Date: Fri, 20 Jun 2025 17:52:18 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:arch-to-lib-crypto-v2 17/25]
 lib/crypto/arm/blake2s-glue.c: warning: EXPORT_SYMBOL() is used, but
 #include <linux/export.h> is missing
Message-ID: <202506201700.rIbux2U0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git arch-to-lib-crypto-v2
head:   0af26eef55472415a67f8ad99ba11c9ac1ba43db
commit: ae0b456298365eac1e5938d4efbf4d6b9117a125 [17/25] lib/crypto: arm: move arch/arm/lib/crypto/ into lib/crypto/
config: x86_64-buildonly-randconfig-004-20250620 (https://download.01.org/0day-ci/archive/20250620/202506201700.rIbux2U0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506201700.rIbux2U0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506201700.rIbux2U0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/irq/msi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/irq/resend.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/jump_label.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/kallsyms.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/kexec_handover.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/livepatch/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/livepatch/shadow.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/livepatch/state.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/locking/lockdep.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/locking/percpu-rwsem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/locking/qrwlock.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/locking/qspinlock.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/module/kmod.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/module/signing.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/module/version.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/panic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/params.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/power/console.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/power/energy_model.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/printk/printk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/printk/printk_safe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/rcu/tasks.h: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/rcu/tree_exp.h: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/rcu/tree_nocb.h: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/rcu/tree_plugin.h: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/rcu/tree_stall.h: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/sched/autogroup.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/sched/clock.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/sched/completion.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/sched/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/sched/cpufreq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/sched/cputime.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/sched/fair.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/sched/idle.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/sched/isolation.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/sched/loadavg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/sched/psi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/sched/swait.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/sched/syscalls.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/sched/topology.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/sched/wait.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/sched/wait_bit.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/stackleak.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/static_call.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/static_call_inline.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/sysctl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/time/alarmtimer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/time/clockevents.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/time/clocksource.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/time/jiffies.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/time/sleep_timeout.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/time/tick-broadcast.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/time/tick-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/time/tick-sched.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/time/timeconv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/time/timekeeping.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/torture.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/trace/bpf_trace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/trace/fprobe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/trace/ftrace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/trace/ring_buffer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/trace/trace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/trace/trace_branch.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/trace/trace_clock.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/trace/trace_dynevent.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/trace/trace_event_perf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/trace/trace_events.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/trace/trace_events_filter.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/trace/trace_events_synth.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/trace/trace_events_trigger.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/trace/trace_irqsoff.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/trace/trace_kprobe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/trace/trace_output.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/trace/trace_preemptirq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/trace/trace_printk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/trace/trace_recursion_record.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/trace/trace_seq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/tracepoint.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/umh.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/usermode_driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/vhost_task.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/vmcore_info.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/watch_queue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   kernel/watchdog.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/842/842_compress.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/842/842_decompress.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/alloc_tag.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/asn1_encoder.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/bch.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/bitrev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/btree.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crc-ccitt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crc-itu-t.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crc-t10dif.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crc16.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crc32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crc4.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crc64.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crc7.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crc8.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> lib/crypto/arm/blake2s-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> lib/crypto/arm/chacha-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> lib/crypto/arm/poly1305-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> lib/crypto/arm/sha256.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/debugobjects.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/digsig.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/dim/dim.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/dim/net_dim.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/dim/rdma_dim.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/dynamic_debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/errname.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/errseq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/fault-inject-usercopy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/fonts/font_8x16.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/fonts/fonts.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/glob.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/group_cpus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/irq_poll.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/kunit/assert.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/kunit/device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/kunit/hooks.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/kunit/platform.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/kunit/resource.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/kunit/static_stub.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/kunit/test.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/kunit/try-catch.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/kunit/user_alloc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/logic_iomem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/logic_pio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/lru_cache.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/lshrdi3.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/lwq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/lz4/lz4_compress.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/lz4/lz4_decompress.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/lz4/lz4hc_compress.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/lzo/lzo1x_compress.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/lzo/lzo1x_decompress_safe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/math/cordic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/math/prime_numbers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/memcat_p.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/memregion.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/notifier-error-inject.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/objagg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/objpool.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/once.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/packing.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/percpu-refcount.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/percpu_counter.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/pldmfw/pldmfw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/polynomial.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/raid6/algos.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/reed_solomon/reed_solomon.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/refcount.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/sbitmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/sg_pool.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/sg_split.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/siphash.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/stackdepot.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/string.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/test_static_key_base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/textsearch.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/trace_readwrite.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/ubsan.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/ucmpdi2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/ucs2_string.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/vsprintf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/win_minmax.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/xxhash.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/xz/xz_dec_syms.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/zlib_deflate/deflate_syms.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/zlib_inflate/inflate_syms.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/zstd/zstd_common_module.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/zstd/zstd_compress_module.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/zstd/zstd_decompress_module.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/backing-dev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/compaction.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/debug_page_alloc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/debug_page_ref.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/fadvise.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/folio-compat.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/gup.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/hmm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/huge_memory.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/hugetlb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/hugetlb_vmemmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/io-mapping.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/kasan/hw_tags.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/kasan/report_generic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/kasan/shadow.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/kfence/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/kmsan/hooks.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/kmsan/instrumentation.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/kmsan/report.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/kmsan/shadow.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/ksm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/list_lru.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/mapping_dirty_helpers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/memblock.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/memory-tiers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/memremap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/mmap_lock.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/numa.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/numa_memblks.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
