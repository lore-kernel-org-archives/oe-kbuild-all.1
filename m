Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7536D1D88D0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jun 2025 06:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751264598; cv=none; b=ga9U6OnfyYQhI/YQwY8Nyd7i1IFIsmxC5252+Z6DnIOkIZg51DOT1kwpmtdQcvV7VUqi+u7xdUqoUrgQsQlt3iRdfP7OUIoTpN4EARDVfZKQhAGC0PHyvyHg6ddyenBSEkezaeYsJEcilZJJ9T6HEJACftXbFlRixK5Ugw/aLS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751264598; c=relaxed/simple;
	bh=2aQsb/iwD3oJc0g73nBnDu2yzNiO/qTm+B8fKCAVc54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OcMTylNhnNiZUHlLIr5bdPmWlrllmhli2wQl37kFLEJagpxgW0GoQSpiQxA59q0azW4uy/VRfWaa2pMZgXzPg82aMiyriRvEc31o04NvkzrIx1QeOZBodU1b+glrlyqesGC2n3QNfagyEZ7klVOCU2igDg68uGd8pl613hxVFYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Opa40dk6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Opa40dk6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751264597; x=1782800597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2aQsb/iwD3oJc0g73nBnDu2yzNiO/qTm+B8fKCAVc54=;
  b=Opa40dk6ZxpdCyPqR0Hpeb4EgPrJINMmUWz8UqM2yf+mhOP6j2rtgHSE
   HakUhwbF7gyXu9iP+Cf5wLw547T92AlDeLaGeDzWcjOPHFAA6nXuOlATB
   qBQUZYVoczfGyTz7kKKN2StRn1O52zwyG5DgR/icx3Z2jOmmqITMGGHZ1
   wMYdd9A4yAxELkvPyR1wocpzOK/laRR0k2l4Qjp/vmvaIs6e5GANw0vXe
   NlZHjBQEjeVLPj44pKy0ZwZOXXiAiOc+hkAjVE9UtZpgTfbz/re0Kxofw
   Nvs0LLLmMHbTYIQrZDNYt4L9RGkEJDT1mfQyFlKO7Z0LESSRxWyBjSn1y
   g==;
X-CSE-ConnectionGUID: JtfcPWnnSPCkv601dJkWLQ==
X-CSE-MsgGUID: K2dEnMhFQPeWTNz2AWnhdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53604391"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53604391"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 23:23:14 -0700
X-CSE-ConnectionGUID: yAZL09xkSF+l8YdWOvxP9Q==
X-CSE-MsgGUID: N07yaJ1PQeChmUHz5N/kyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="159096579"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Jun 2025 23:23:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uW7v4-000YVo-2P;
	Mon, 30 Jun 2025 06:23:10 +0000
Date: Mon, 30 Jun 2025 14:22:17 +0800
From: kernel test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tzungbi-chrome-platform:dev 4/12] lib/kunit/ftrace_stub.c: warning:
 EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
Message-ID: <202506301403.ljuJccEQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tzungbi/chrome-platform.git dev
head:   4ae189ef8cd04f4ceb3a0fa77ed83bf0f68b28a9
commit: 3940801cba225ba84e58489090232bfdb477bd59 [4/12] kunit: expose ftrace-based API for stubbing out functions during tests
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20250630/202506301403.ljuJccEQ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506301403.ljuJccEQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506301403.ljuJccEQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   lib/crypto/aes.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crypto/aescfb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crypto/aesgcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crypto/arc4.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crypto/blake2s-generic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crypto/blake2s.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crypto/chacha20poly1305.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crypto/curve25519-generic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crypto/des.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crypto/gf128mul.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crypto/memneq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crypto/mpi/mpi-add.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crypto/mpi/mpi-bit.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crypto/mpi/mpi-cmp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crypto/mpi/mpi-mul.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crypto/mpi/mpi-pow.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crypto/mpi/mpi-sub-ui.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crypto/mpi/mpicoder.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crypto/mpi/mpiutil.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crypto/poly1305-donna32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crypto/poly1305-donna64.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crypto/poly1305-generic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crypto/poly1305.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crypto/sha256-generic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crypto/sha256.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crypto/sm3.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   lib/crypto/utils.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
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
>> lib/kunit/ftrace_stub.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
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
   mm/page_alloc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/page_poison.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/page_table_check.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/percpu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/show_mem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/shrinker.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/shrinker_debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/slab_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/slub.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/usercopy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/vmalloc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/vmscan.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/vmstat.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/zpool.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   mm/zsmalloc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   net/6lowpan/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
