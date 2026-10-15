Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F903BCD37
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Oct 2026 09:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055012; cv=none; b=T+lhusmmqUIryYLGGsxzGS+WbtPYacoDWqQ82P9I+5zrKSN2R0HsRA2kBtQS4UEyWWQ0fn3jEoZJJkPAspSUY5pKs9f7u2BIiqKdykenvJ8cAMRoVGKvUIvuHjiEqKOe4NxqO/z0KcvZc85H2rJYfx1D452HWQB/RTLLNyrbVFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055012; c=relaxed/simple;
	bh=xYna53P2iCJvDvTGf/+dXdx3CV16aj7+LTwxMeTlGZc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gmUavyalnPuixd0JJiLWOEaRUHF9nDOPN+8a5CPg2azBwb/m6hMkyqYo0OMQyXLuS1KVWrVpOM+TJEcXPBUqp7haCv6RcPLef5HwgUJqDSjYijsdD957YIyzHTGEo0SVKH183QqiOBLTOPWNGqAbMjIrv2V9TLHJ1vCzya81h7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MuDs8ppO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MuDs8ppO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792055009; x=1823591009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xYna53P2iCJvDvTGf/+dXdx3CV16aj7+LTwxMeTlGZc=;
  b=MuDs8ppO8mYwoZKcYn+6rhaX9v292/M0eW6G5lrLLSDE18DmleXNuPYV
   RGdn2v91GkeLgVKsG0gbNiyGc5Bi4LQWCMsNxVjpbuvkVhGiXb/KPVN3Q
   y/uEBOQJ8d8lQEh+3rcb0JVS6FKGob9hV80108Y9YKWz2bFDv5rzmD0fq
   PHYNT57O3bIYQdjFuNAMpD5V6UjnwQfDlzNbFiI69rhpDjSVmFeJBb0Sd
   YKv5y3G2UwvHQUulbSf8+CUywFZfmGvAwLzVRhUrj3KBAAwwo1uir5zh/
   3xeCaQWv6zqfd8w+xjb5elL1MBvwjOUIsm/Uo24o/Uo8BrDsTNkWJot3g
   A==;
X-CSE-ConnectionGUID: AKvLke9FSQyqhBcJre9+hw==
X-CSE-MsgGUID: 5SnPswCNTBelejUZWr8t+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="704155"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="704155"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 02:03:29 -0700
X-CSE-ConnectionGUID: +HFrD/ryQCagEx6lIiv27A==
X-CSE-MsgGUID: Xuxe9gFPTr210dbQdayDcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1604366"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 15 Oct 2026 02:03:27 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHHMy-00000000BfP-2ziT;
	Thu, 15 Oct 2026 09:03:24 +0000
Date: Thu, 15 Oct 2026 11:02:44 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kbuild-error-propagation 3/3] WARNING:
 modpost: vmlinux: EXPORT symbol 'memremap' version generation failed, symbol
 will not be versioned.
Message-ID: <202610151001.3yxJcs0c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kbuild-error-propagation
head:   4243eb1d190a56f570d636ae78f64714b61d39f4
commit: 4243eb1d190a56f570d636ae78f64714b61d39f4 [3/3] kbuild: try to enable set -e pipefail for commands
config: x86_64-randconfig-2200-20261014 (https://download.01.org/0day-ci/archive/20261015/202610151001.3yxJcs0c-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610151001.3yxJcs0c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610151001.3yxJcs0c-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: EXPORT symbol 'dma_alloc_noncontiguous' version generation failed, symbol will not be versioned.
Is 'dma_alloc_noncontiguous' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'dma_free_noncontiguous' version generation failed, symbol will not be versioned.
Is 'dma_free_noncontiguous' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'dma_vmap_noncontiguous' version generation failed, symbol will not be versioned.
Is 'dma_vmap_noncontiguous' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'dma_vunmap_noncontiguous' version generation failed, symbol will not be versioned.
Is 'dma_vunmap_noncontiguous' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'dma_mmap_noncontiguous' version generation failed, symbol will not be versioned.
Is 'dma_mmap_noncontiguous' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'dma_set_mask' version generation failed, symbol will not be versioned.
Is 'dma_set_mask' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'dma_set_coherent_mask' version generation failed, symbol will not be versioned.
Is 'dma_set_coherent_mask' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'dma_max_mapping_size' version generation failed, symbol will not be versioned.
Is 'dma_max_mapping_size' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'dma_opt_mapping_size' version generation failed, symbol will not be versioned.
Is 'dma_opt_mapping_size' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'sys_tz' version generation failed, symbol will not be versioned.
Is 'sys_tz' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'ns_to_kernel_old_timeval' version generation failed, symbol will not be versioned.
Is 'ns_to_kernel_old_timeval' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'set_normalized_timespec64' version generation failed, symbol will not be versioned.
Is 'set_normalized_timespec64' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'ns_to_timespec64' version generation failed, symbol will not be versioned.
Is 'ns_to_timespec64' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__msecs_to_jiffies' version generation failed, symbol will not be versioned.
Is '__msecs_to_jiffies' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__usecs_to_jiffies' version generation failed, symbol will not be versioned.
Is '__usecs_to_jiffies' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'timespec64_to_jiffies' version generation failed, symbol will not be versioned.
Is 'timespec64_to_jiffies' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'jiffies_to_timespec64' version generation failed, symbol will not be versioned.
Is 'jiffies_to_timespec64' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'jiffies_to_clock_t' version generation failed, symbol will not be versioned.
Is 'jiffies_to_clock_t' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'clock_t_to_jiffies' version generation failed, symbol will not be versioned.
Is 'clock_t_to_jiffies' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'nsecs_to_jiffies' version generation failed, symbol will not be versioned.
Is 'nsecs_to_jiffies' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'trace_print_flags_seq' version generation failed, symbol will not be versioned.
Is 'trace_print_flags_seq' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'trace_print_symbols_seq' version generation failed, symbol will not be versioned.
Is 'trace_print_symbols_seq' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'trace_print_hex_seq' version generation failed, symbol will not be versioned.
Is 'trace_print_hex_seq' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'trace_raw_output_prep' version generation failed, symbol will not be versioned.
Is 'trace_raw_output_prep' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'trace_event_printf' version generation failed, symbol will not be versioned.
Is 'trace_event_printf' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'trace_output_call' version generation failed, symbol will not be versioned.
Is 'trace_output_call' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__trace_bprintk' version generation failed, symbol will not be versioned.
Is '__trace_bprintk' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__trace_printk' version generation failed, symbol will not be versioned.
Is '__trace_printk' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__trace_puts' version generation failed, symbol will not be versioned.
Is '__trace_puts' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__trace_bputs' version generation failed, symbol will not be versioned.
Is '__trace_bputs' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'trace_array_printk' version generation failed, symbol will not be versioned.
Is 'trace_array_printk' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'trace_array_init_printk' version generation failed, symbol will not be versioned.
Is 'trace_array_init_printk' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'trace_event_raw_init' version generation failed, symbol will not be versioned.
Is 'trace_event_raw_init' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'trace_event_buffer_reserve' version generation failed, symbol will not be versioned.
Is 'trace_event_buffer_reserve' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'trace_event_reg' version generation failed, symbol will not be versioned.
Is 'trace_event_reg' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'trace_array_set_clr_event' version generation failed, symbol will not be versioned.
Is 'trace_array_set_clr_event' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'bpf_stats_enabled_key' version generation failed, symbol will not be versioned.
Is 'bpf_stats_enabled_key' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__tracepoint_xdp_exception' version generation failed, symbol will not be versioned.
Is '__tracepoint_xdp_exception' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__SCK__tp_func_xdp_exception' version generation failed, symbol will not be versioned.
Is '__SCK__tp_func_xdp_exception' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__SCT__tp_func_xdp_exception' version generation failed, symbol will not be versioned.
Is '__SCT__tp_func_xdp_exception' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'perf_event_update_userpage' version generation failed, symbol will not be versioned.
Is 'perf_event_update_userpage' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'perf_trace_run_bpf_submit' version generation failed, symbol will not be versioned.
Is 'perf_trace_run_bpf_submit' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'perf_pmu_register' version generation failed, symbol will not be versioned.
Is 'perf_pmu_register' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'perf_pmu_unregister' version generation failed, symbol will not be versioned.
Is 'perf_pmu_unregister' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'perf_pmu_migrate_context' version generation failed, symbol will not be versioned.
Is 'perf_pmu_migrate_context' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'perf_event_sysfs_show' version generation failed, symbol will not be versioned.
Is 'perf_event_sysfs_show' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'static_key_count' version generation failed, symbol will not be versioned.
Is 'static_key_count' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'static_key_slow_inc' version generation failed, symbol will not be versioned.
Is 'static_key_slow_inc' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'static_key_enable' version generation failed, symbol will not be versioned.
Is 'static_key_enable' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'static_key_slow_dec' version generation failed, symbol will not be versioned.
Is 'static_key_slow_dec' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'memremap' version generation failed, symbol will not be versioned.
Is 'memremap' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'memunmap' version generation failed, symbol will not be versioned.
Is 'memunmap' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'devm_memremap' version generation failed, symbol will not be versioned.
Is 'devm_memremap' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'devm_memunmap' version generation failed, symbol will not be versioned.
Is 'devm_memunmap' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'filemap_check_errors' version generation failed, symbol will not be versioned.
Is 'filemap_check_errors' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'filemap_fdatawrite_range' version generation failed, symbol will not be versioned.
Is 'filemap_fdatawrite_range' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'filemap_fdatawrite' version generation failed, symbol will not be versioned.
Is 'filemap_fdatawrite' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'filemap_flush' version generation failed, symbol will not be versioned.
Is 'filemap_flush' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'filemap_flush_nr' version generation failed, symbol will not be versioned.
Is 'filemap_flush_nr' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'filemap_range_has_page' version generation failed, symbol will not be versioned.
Is 'filemap_range_has_page' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'filemap_fdatawait_range' version generation failed, symbol will not be versioned.
Is 'filemap_fdatawait_range' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'filemap_fdatawait_keep_errors' version generation failed, symbol will not be versioned.
Is 'filemap_fdatawait_keep_errors' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'filemap_range_has_writeback' version generation failed, symbol will not be versioned.
Is 'filemap_range_has_writeback' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'filemap_write_and_wait_range' version generation failed, symbol will not be versioned.
Is 'filemap_write_and_wait_range' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__filemap_set_wb_err' version generation failed, symbol will not be versioned.
Is '__filemap_set_wb_err' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'file_check_and_advance_wb_err' version generation failed, symbol will not be versioned.
Is 'file_check_and_advance_wb_err' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'file_write_and_wait_range' version generation failed, symbol will not be versioned.
Is 'file_write_and_wait_range' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'filemap_add_folio' version generation failed, symbol will not be versioned.
Is 'filemap_add_folio' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'filemap_invalidate_lock_two' version generation failed, symbol will not be versioned.
Is 'filemap_invalidate_lock_two' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'filemap_invalidate_unlock_two' version generation failed, symbol will not be versioned.
Is 'filemap_invalidate_unlock_two' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'folio_wait_bit' version generation failed, symbol will not be versioned.
Is 'folio_wait_bit' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'folio_unlock' version generation failed, symbol will not be versioned.
Is 'folio_unlock' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'folio_end_read' version generation failed, symbol will not be versioned.
Is 'folio_end_read' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'folio_end_writeback' version generation failed, symbol will not be versioned.
Is 'folio_end_writeback' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__folio_lock' version generation failed, symbol will not be versioned.
Is '__folio_lock' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'page_cache_next_miss' version generation failed, symbol will not be versioned.
Is 'page_cache_next_miss' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__filemap_get_folio_mpol' version generation failed, symbol will not be versioned.
Is '__filemap_get_folio_mpol' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'filemap_get_folios' version generation failed, symbol will not be versioned.
Is 'filemap_get_folios' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'filemap_get_folios_contig' version generation failed, symbol will not be versioned.
Is 'filemap_get_folios_contig' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'filemap_get_folios_tag' version generation failed, symbol will not be versioned.
Is 'filemap_get_folios_tag' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'filemap_read' version generation failed, symbol will not be versioned.
Is 'filemap_read' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'kiocb_write_and_wait' version generation failed, symbol will not be versioned.
Is 'kiocb_write_and_wait' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'generic_file_read_iter' version generation failed, symbol will not be versioned.
Is 'generic_file_read_iter' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'filemap_splice_read' version generation failed, symbol will not be versioned.
Is 'filemap_splice_read' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'filemap_fault' version generation failed, symbol will not be versioned.
Is 'filemap_fault' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'filemap_map_pages' version generation failed, symbol will not be versioned.
Is 'filemap_map_pages' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'filemap_page_mkwrite' version generation failed, symbol will not be versioned.
Is 'filemap_page_mkwrite' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'generic_file_mmap_prepare' version generation failed, symbol will not be versioned.
Is 'generic_file_mmap_prepare' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'read_cache_folio' version generation failed, symbol will not be versioned.
Is 'read_cache_folio' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'read_cache_page' version generation failed, symbol will not be versioned.
Is 'read_cache_page' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'read_cache_page_gfp' version generation failed, symbol will not be versioned.
Is 'read_cache_page_gfp' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'generic_file_write_iter' version generation failed, symbol will not be versioned.
Is 'generic_file_write_iter' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'filemap_release_folio' version generation failed, symbol will not be versioned.
Is 'filemap_release_folio' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'filemap_invalidate_inode' version generation failed, symbol will not be versioned.
Is 'filemap_invalidate_inode' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'register_oom_notifier' version generation failed, symbol will not be versioned.
Is 'register_oom_notifier' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'unregister_oom_notifier' version generation failed, symbol will not be versioned.
Is 'unregister_oom_notifier' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'balance_dirty_pages_ratelimited_flags' version generation failed, symbol will not be versioned.
Is 'balance_dirty_pages_ratelimited_flags' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'balance_dirty_pages_ratelimited' version generation failed, symbol will not be versioned.
Is 'balance_dirty_pages_ratelimited' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'tag_pages_for_writeback' version generation failed, symbol will not be versioned.
Is 'tag_pages_for_writeback' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'writeback_iter' version generation failed, symbol will not be versioned.
Is 'writeback_iter' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'noop_dirty_folio' version generation failed, symbol will not be versioned.
Is 'noop_dirty_folio' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'filemap_dirty_folio' version generation failed, symbol will not be versioned.
Is 'filemap_dirty_folio' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'folio_redirty_for_writepage' version generation failed, symbol will not be versioned.
Is 'folio_redirty_for_writepage' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'folio_mark_dirty' version generation failed, symbol will not be versioned.
--
WARNING: modpost: vmlinux: EXPORT symbol 'zs_pool_stats' version generation failed, symbol will not be versioned.
Is 'zs_pool_stats' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'zs_create_pool' version generation failed, symbol will not be versioned.
Is 'zs_create_pool' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'zs_destroy_pool' version generation failed, symbol will not be versioned.
Is 'zs_destroy_pool' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__page_ref_mod' version generation failed, symbol will not be versioned.
Is '__page_ref_mod' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__tracepoint_page_ref_mod' version generation failed, symbol will not be versioned.
Is '__tracepoint_page_ref_mod' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__page_ref_mod_and_test' version generation failed, symbol will not be versioned.
Is '__page_ref_mod_and_test' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__tracepoint_page_ref_mod_and_test' version generation failed, symbol will not be versioned.
Is '__tracepoint_page_ref_mod_and_test' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'validate_usercopy_range' version generation failed, symbol will not be versioned.
Is 'validate_usercopy_range' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__check_object_size' version generation failed, symbol will not be versioned.
Is '__check_object_size' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'vfs_truncate' version generation failed, symbol will not be versioned.
Is 'vfs_truncate' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'vfs_fallocate' version generation failed, symbol will not be versioned.
Is 'vfs_fallocate' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'finish_open' version generation failed, symbol will not be versioned.
Is 'finish_open' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'finish_no_open' version generation failed, symbol will not be versioned.
Is 'finish_no_open' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'dentry_open' version generation failed, symbol will not be versioned.
Is 'dentry_open' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'kernel_file_open' version generation failed, symbol will not be versioned.
Is 'kernel_file_open' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'filp_open' version generation failed, symbol will not be versioned.
Is 'filp_open' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'generic_file_open' version generation failed, symbol will not be versioned.
Is 'generic_file_open' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'nonseekable_open' version generation failed, symbol will not be versioned.
Is 'nonseekable_open' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'stream_open' version generation failed, symbol will not be versioned.
Is 'stream_open' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'vfs_setpos' version generation failed, symbol will not be versioned.
Is 'vfs_setpos' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'generic_file_llseek_size' version generation failed, symbol will not be versioned.
Is 'generic_file_llseek_size' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'generic_file_llseek' version generation failed, symbol will not be versioned.
Is 'generic_file_llseek' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'fixed_size_llseek' version generation failed, symbol will not be versioned.
Is 'fixed_size_llseek' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'no_seek_end_llseek' version generation failed, symbol will not be versioned.
Is 'no_seek_end_llseek' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'noop_llseek' version generation failed, symbol will not be versioned.
Is 'noop_llseek' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'default_llseek' version generation failed, symbol will not be versioned.
Is 'default_llseek' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'vfs_llseek' version generation failed, symbol will not be versioned.
Is 'vfs_llseek' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'rw_verify_area' version generation failed, symbol will not be versioned.
Is 'rw_verify_area' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'kernel_write' version generation failed, symbol will not be versioned.
Is 'kernel_write' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'vfs_iocb_iter_read' version generation failed, symbol will not be versioned.
Is 'vfs_iocb_iter_read' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'vfs_iocb_iter_write' version generation failed, symbol will not be versioned.
Is 'vfs_iocb_iter_write' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'generic_write_check_limits' version generation failed, symbol will not be versioned.
Is 'generic_write_check_limits' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'generic_write_checks_count' version generation failed, symbol will not be versioned.
Is 'generic_write_checks_count' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'generic_write_checks' version generation failed, symbol will not be versioned.
Is 'generic_write_checks' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'generic_atomic_write_valid' version generation failed, symbol will not be versioned.
Is 'generic_atomic_write_valid' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'register_chrdev_region' version generation failed, symbol will not be versioned.
Is 'register_chrdev_region' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'unregister_chrdev_region' version generation failed, symbol will not be versioned.
Is 'unregister_chrdev_region' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'alloc_chrdev_region' version generation failed, symbol will not be versioned.
Is 'alloc_chrdev_region' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'cdev_init' version generation failed, symbol will not be versioned.
Is 'cdev_init' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'cdev_alloc' version generation failed, symbol will not be versioned.
Is 'cdev_alloc' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'cdev_del' version generation failed, symbol will not be versioned.
Is 'cdev_del' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'cdev_add' version generation failed, symbol will not be versioned.
Is 'cdev_add' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'cdev_set_parent' version generation failed, symbol will not be versioned.
Is 'cdev_set_parent' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'cdev_device_add' version generation failed, symbol will not be versioned.
Is 'cdev_device_add' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'cdev_device_del' version generation failed, symbol will not be versioned.
Is 'cdev_device_del' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__register_chrdev' version generation failed, symbol will not be versioned.
Is '__register_chrdev' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol '__unregister_chrdev' version generation failed, symbol will not be versioned.
Is '__unregister_chrdev' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'fiemap_fill_next_extent' version generation failed, symbol will not be versioned.
Is 'fiemap_fill_next_extent' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'fiemap_prep' version generation failed, symbol will not be versioned.
Is 'fiemap_prep' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'compat_ptr_ioctl' version generation failed, symbol will not be versioned.
Is 'compat_ptr_ioctl' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'make_bad_inode' version generation failed, symbol will not be versioned.
Is 'make_bad_inode' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'is_bad_inode' version generation failed, symbol will not be versioned.
Is 'is_bad_inode' prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: vmlinux: EXPORT symbol 'iget_failed' version generation failed, symbol will not be versioned.
Is 'iget_failed' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'get_unused_fd_flags' version generation failed, symbol will not be versioned.
Is 'get_unused_fd_flags' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'put_unused_fd' version generation failed, symbol will not be versioned.
Is 'put_unused_fd' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'fd_install' version generation failed, symbol will not be versioned.
Is 'fd_install' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'fget' version generation failed, symbol will not be versioned.
Is 'fget' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'fdget' version generation failed, symbol will not be versioned.
Is 'fdget' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'register_filesystem' version generation failed, symbol will not be versioned.
Is 'register_filesystem' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'unregister_filesystem' version generation failed, symbol will not be versioned.
Is 'unregister_filesystem' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'fs_kobj' version generation failed, symbol will not be versioned.
Is 'fs_kobj' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'mnt_want_write' version generation failed, symbol will not be versioned.
Is 'mnt_want_write' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'mnt_want_write_file' version generation failed, symbol will not be versioned.
Is 'mnt_want_write_file' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'mnt_drop_write' version generation failed, symbol will not be versioned.
Is 'mnt_drop_write' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'mnt_drop_write_file' version generation failed, symbol will not be versioned.
Is 'mnt_drop_write_file' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'vfs_create_mount' version generation failed, symbol will not be versioned.
Is 'vfs_create_mount' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'fc_mount' version generation failed, symbol will not be versioned.
Is 'fc_mount' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'mntput' version generation failed, symbol will not be versioned.
Is 'mntput' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'mntget' version generation failed, symbol will not be versioned.
Is 'mntget' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'mnt_set_expiry' version generation failed, symbol will not be versioned.
Is 'mnt_set_expiry' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'mark_mounts_for_expiry' version generation failed, symbol will not be versioned.
Is 'mark_mounts_for_expiry' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'mount_subtree' version generation failed, symbol will not be versioned.
Is 'mount_subtree' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'kern_mount' version generation failed, symbol will not be versioned.
Is 'kern_mount' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'kern_unmount' version generation failed, symbol will not be versioned.
Is 'kern_unmount' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'vfs_setxattr' version generation failed, symbol will not be versioned.
Is 'vfs_setxattr' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'vfs_getxattr' version generation failed, symbol will not be versioned.
Is 'vfs_getxattr' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'vfs_removexattr' version generation failed, symbol will not be versioned.
Is 'vfs_removexattr' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'generic_listxattr' version generation failed, symbol will not be versioned.
Is 'generic_listxattr' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'xattr_full_name' version generation failed, symbol will not be versioned.
Is 'xattr_full_name' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'simple_statfs' version generation failed, symbol will not be versioned.
Is 'simple_statfs' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'generic_read_dir' version generation failed, symbol will not be versioned.
Is 'generic_read_dir' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'simple_dir_operations' version generation failed, symbol will not be versioned.
Is 'simple_dir_operations' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'simple_dir_inode_operations' version generation failed, symbol will not be versioned.
Is 'simple_dir_inode_operations' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'init_pseudo' version generation failed, symbol will not be versioned.
Is 'init_pseudo' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'simple_open' version generation failed, symbol will not be versioned.
Is 'simple_open' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'simple_rename_timestamp' version generation failed, symbol will not be versioned.
Is 'simple_rename_timestamp' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'simple_read_from_buffer' version generation failed, symbol will not be versioned.
Is 'simple_read_from_buffer' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'simple_write_to_buffer' version generation failed, symbol will not be versioned.
Is 'simple_write_to_buffer' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'memory_read_from_buffer' version generation failed, symbol will not be versioned.
Is 'memory_read_from_buffer' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'simple_attr_open' version generation failed, symbol will not be versioned.
Is 'simple_attr_open' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'simple_attr_release' version generation failed, symbol will not be versioned.
Is 'simple_attr_release' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'simple_attr_read' version generation failed, symbol will not be versioned.
Is 'simple_attr_read' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'simple_attr_write_signed' version generation failed, symbol will not be versioned.
Is 'simple_attr_write_signed' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'generic_encode_ino32_fh' version generation failed, symbol will not be versioned.
Is 'generic_encode_ino32_fh' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'generic_fh_to_dentry' version generation failed, symbol will not be versioned.
Is 'generic_fh_to_dentry' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'generic_fh_to_parent' version generation failed, symbol will not be versioned.
Is 'generic_fh_to_parent' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'simple_fsync_noflush' version generation failed, symbol will not be versioned.
Is 'simple_fsync_noflush' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'noop_direct_IO' version generation failed, symbol will not be versioned.
Is 'noop_direct_IO' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'kfree_link' version generation failed, symbol will not be versioned.
Is 'kfree_link' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'simple_get_link' version generation failed, symbol will not be versioned.
Is 'simple_get_link' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'inode_maybe_inc_iversion' version generation failed, symbol will not be versioned.
Is 'inode_maybe_inc_iversion' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'inode_query_iversion' version generation failed, symbol will not be versioned.
Is 'inode_query_iversion' prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: vmlinux: EXPORT symbol 'simple_inode_init_ts' version generation failed, symbol will not be versioned.
..

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
