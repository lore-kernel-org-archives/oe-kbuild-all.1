Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE48322B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 19:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692993486; x=1724529486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1qj8M/WpxfsFU5dXWZvDtDYjNKYkETB0auA3cNPzXs0=;
  b=GB1ljXlegd4N2TJPZPKpd+oONDDLMX0KKqUfEZEtrm5Yj8WyfeGTjEMB
   RBaaoKxCJyalP/afAAN5wqXEqaiYU0sckDQPFIGOv/ffWhvtkRC+oN01n
   rtECNTsr53hNggZssm+v+ArIgL+kL0CVligOMzT0S88nlfCgIhnav5iqM
   aWNcvNtrotC6W0mF9u1PoNJOCUYlLiRdNEGxHQXPUL1Fzmfpz7g+ooIt5
   5ivPEOiOQKeo+5qaPYY+qwK/V+YIMQ8Rwlw1CGG1BPmPyVhVMNGBFyBjh
   wyp8JGSkEgrPxdWS+76XGCNQa8+MDZq+c+VMh8ahXVrtGksBtRVsHrepw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="359789327"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="359789327"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 12:58:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="714453731"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="714453731"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 25 Aug 2023 12:58:03 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZcwU-0003yF-1Q;
	Fri, 25 Aug 2023 19:58:02 +0000
Date: Sat, 26 Aug 2023 03:57:02 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-6.1.y 6680/8877] vmlinux.o: warning: objtool:
 i915_request_get.cold+0x5b: relocation to !ENDBR:
 live_error_interrupt.cold+0x0
Message-ID: <202308260330.1nBGf1cp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.1.y
head:   802aacbbffe2512dce9f8f33ad99d01cfec435de
commit: 4e7f1f6da79e1acda58b738e34ff972821d13072 [6680/8877] drm/i915/selftests: Stop using kthread_stop()
config: x86_64-randconfig-004-20230825 (https://download.01.org/0day-ci/archive/20230826/202308260330.1nBGf1cp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260330.1nBGf1cp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260330.1nBGf1cp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: kasan_report+0x12: call to stackleak_track_stack() with UACCESS enabled
   vmlinux.o: warning: objtool: __intel_wait_for_register_fw.cold+0xb5: relocation to !ENDBR: vlv_allow_gt_wake.cold+0x0
   vmlinux.o: warning: objtool: gen11_emit_fini_breadcrumb_rcs.cold+0x1a8: relocation to !ENDBR: gen12_emit_fini_breadcrumb_xcs.cold+0x0
   vmlinux.o: warning: objtool: gen8_ppgtt_clear.cold+0x217: relocation to !ENDBR: gen8_ppgtt_alloc.cold+0x0
   vmlinux.o: warning: objtool: gen8_ppgtt_alloc.cold+0x217: relocation to !ENDBR: gen8_init_scratch.cold+0x0
   vmlinux.o: warning: objtool: irq_signal_request.cold+0x5b: relocation to !ENDBR: insert_breadcrumb.cold+0x0
   vmlinux.o: warning: objtool: intel_engine_get_hung_entity.cold+0x5b: relocation to !ENDBR: mock_engine.cold+0x0
   vmlinux.o: warning: objtool: heartbeat_commit.cold+0xca: relocation to !ENDBR: __intel_engine_pulse.cold+0x0
   vmlinux.o: warning: objtool: duration.cold+0x5b: relocation to !ENDBR: live_engine_pm.cold+0x0
>> vmlinux.o: warning: objtool: i915_request_get.cold+0x5b: relocation to !ENDBR: live_error_interrupt.cold+0x0
   vmlinux.o: warning: objtool: intel_gt_buffer_pool_mark_used.cold+0x60: relocation to !ENDBR: intel_gt_fini_buffer_pool.cold+0x0
   vmlinux.o: warning: objtool: __px_vaddr.cold+0x60: relocation to !ENDBR: __px_dma.cold+0x0
   vmlinux.o: warning: objtool: __px_dma.cold+0x60: relocation to !ENDBR: __px_page.cold+0x0
   vmlinux.o: warning: objtool: __px_page.cold+0x60: relocation to !ENDBR: setup_private_pat.cold+0x0
   vmlinux.o: warning: objtool: reg_offsets.cold+0x5b: relocation to !ENDBR: set_offsets.cold+0x0
   vmlinux.o: warning: objtool: __lrc_init_regs.cold+0x139: relocation to !ENDBR: live_lrc_layout.cold+0x0
   vmlinux.o: warning: objtool: i915_request_get.cold+0x5b: relocation to !ENDBR: gen12_emit_indirect_ctx_rcs.cold+0x0
   vmlinux.o: warning: objtool: i915_request_get.isra.0.cold+0x5b: relocation to !ENDBR: read_regs.cold+0x0
   vmlinux.o: warning: objtool: vlv_rc6_init.cold+0x5b: relocation to !ENDBR: __live_rc6_ctx.cold+0x0
   vmlinux.o: warning: objtool: i915_request_get.cold+0x5b: relocation to !ENDBR: mark_guilty.cold+0x0
   vmlinux.o: warning: objtool: xcs_resume.cold+0x1bd: relocation to !ENDBR: i915_vma_unpin.cold+0x0
   vmlinux.o: warning: objtool: clflush_release.cold+0xcf: relocation to !ENDBR: __do_clflush.cold+0x0
   vmlinux.o: warning: objtool: __do_clflush.cold+0x60: relocation to !ENDBR: i915_gem_clflush_object.cold+0x0
   vmlinux.o: warning: objtool: __i915_gem_object_flush_map.cold+0xca: relocation to !ENDBR: __i915_gem_object_release_map.cold+0x0
   vmlinux.o: warning: objtool: i915_gem_object_attach_phys.cold+0x60: relocation to !ENDBR: mock_phys_object.cold+0x0
   vmlinux.o: warning: objtool: i915_gem_object_make_shrinkable.cold+0x60: relocation to !ENDBR: i915_gem_object_make_purgeable.cold+0x0
   vmlinux.o: warning: objtool: i915_gem_object_make_purgeable.cold+0x60: relocation to !ENDBR: dbg_poison.cold+0x0
   vmlinux.o: warning: objtool: __i915_ttm_get_pages.cold+0xca: relocation to !ENDBR: i915_ttm_get_pages.cold+0x0
   vmlinux.o: warning: objtool: i915_gem_object_userptr_validate.cold+0xcf: relocation to !ENDBR: i915_gem_object_wait.cold+0x0
   vmlinux.o: warning: objtool: i915_request_get.cold+0x5b: relocation to !ENDBR: cleanup_objects.cold+0x0
   vmlinux.o: warning: objtool: track_vma_bind.cold+0x158: relocation to !ENDBR: i915_vma_unpin.cold+0x0
   vmlinux.o: warning: objtool: to_request.cold+0x5b: relocation to !ENDBR: intel_ring_advance.cold+0x0
   vmlinux.o: warning: objtool: __i915_request_ensure_parallel_ordering.cold+0x139: relocation to !ENDBR: __emit_semaphore_wait.cold+0x0
   vmlinux.o: warning: objtool: i915_fence_signaled.cold+0x5b: relocation to !ENDBR: i915_fence_enable_signaling.cold+0x0
   vmlinux.o: warning: objtool: i915_fence_enable_signaling.cold+0x5b: relocation to !ENDBR: i915_fence_get_driver_name.cold+0x0
   vmlinux.o: warning: objtool: i915_fence_get_driver_name.cold+0x5b: relocation to !ENDBR: i915_request_get.cold+0x0
>> vmlinux.o: warning: objtool: i915_request_get.cold+0x5b: relocation to !ENDBR: __i915_request_await_execution.cold+0x0
>> vmlinux.o: warning: objtool: i915_fence_release.cold+0xca: relocation to !ENDBR: perf_parallel_engines.cold+0x0
   vmlinux.o: warning: objtool: __i915_request_skip.cold+0x5b: relocation to !ENDBR: i915_request_set_error_once.cold+0x0
   vmlinux.o: warning: objtool: i915_fence_wait.cold+0x5b: relocation to !ENDBR: __live_parallel_engine1.cold+0x0
   vmlinux.o: warning: objtool: vma_create.cold+0x286: relocation to !ENDBR: release_references.cold+0x0
   vmlinux.o: warning: objtool: guc_mmio_reg_state_init.cold+0xca: relocation to !ENDBR: guc_capture_prep_lists.cold+0x0
   vmlinux.o: warning: objtool: intel_guc_engine_usage_record_map.cold+0x5b: relocation to !ENDBR: guc_capture_clone_node.cold+0x0
   vmlinux.o: warning: objtool: guc_submission_send_busy_loop.cold+0x5b: relocation to !ENDBR: __guc_action_register_multi_lrc_v70.cold+0x0
   vmlinux.o: warning: objtool: nop_user_request.cold+0x5b: relocation to !ENDBR: intel_guc_steal_guc_ids.cold+0x0
   vmlinux.o: warning: objtool: add_rps_boost_after_vblank.cold+0x5b: relocation to !ENDBR: intel_plane_set_invisible.cold+0x0
   vmlinux.o: warning: objtool: i915_request_get.isra.0.cold+0x5b: relocation to !ENDBR: i915_oa_stream_destroy.cold+0x0


objdump-func vmlinux.o i915_request_get.cold:
0000 00000000001a54e0 <i915_request_get.cold>:
0000   1a54e0:	e8 00 00 00 00       	call   1a54e5 <i915_request_get.cold+0x5>	1a54e1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0005   1a54e5:	31 c9                	xor    %ecx,%ecx
0007   1a54e7:	31 d2                	xor    %edx,%edx
0009   1a54e9:	be 01 00 00 00       	mov    $0x1,%esi
000e   1a54ee:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1a54f1: R_X86_64_32S	_ftrace_annotated_branch+0x23b590
0015   1a54f5:	e8 00 00 00 00       	call   1a54fa <i915_request_get.cold+0x1a>	1a54f6: R_X86_64_PLT32	ftrace_likely_update-0x4
001a   1a54fa:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	1a54fd: R_X86_64_32S	.rodata+0xc69d60
0021   1a5501:	ba 86 01 00 00       	mov    $0x186,%edx
0026   1a5506:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	1a5509: R_X86_64_32S	.rodata+0xc6fc40
002d   1a550d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1a5510: R_X86_64_32S	.rodata+0xc67de0
0034   1a5514:	e8 00 00 00 00       	call   1a5519 <i915_request_get.cold+0x39>	1a5515: R_X86_64_PLT32	_printk-0x4
0039   1a5519:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 1a5520 <i915_request_get.cold+0x40>	1a551c: R_X86_64_PC32	__trace_printk_fmt+0x2024
0040   1a5520:	e8 00 00 00 00       	call   1a5525 <i915_request_get.cold+0x45>	1a5521: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0045   1a5525:	49 c7 c0 00 00 00 00 	mov    $0x0,%r8	1a5528: R_X86_64_32S	.rodata+0xc69d60
004c   1a552c:	b9 86 01 00 00       	mov    $0x186,%ecx
0051   1a5531:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	1a5534: R_X86_64_32S	.rodata+0xc6fc40
0058   1a5538:	48 89 de             	mov    %rbx,%rsi
005b   1a553b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1a553e: R_X86_64_32S	.text.unlikely+0x1a5564
0062   1a5542:	e8 00 00 00 00       	call   1a5547 <i915_request_get.cold+0x67>	1a5543: R_X86_64_PLT32	__trace_bprintk-0x4
0067   1a5547:	e8 00 00 00 00       	call   1a554c <i915_request_get.cold+0x6c>	1a5548: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
006c   1a554c:	bf 01 00 00 00       	mov    $0x1,%edi
0071   1a5551:	e8 00 00 00 00       	call   1a5556 <i915_request_get.cold+0x76>	1a5552: R_X86_64_PLT32	ftrace_dump-0x4
0076   1a5556:	31 f6                	xor    %esi,%esi
0078   1a5558:	bf 09 00 00 00       	mov    $0x9,%edi
007d   1a555d:	e8 00 00 00 00       	call   1a5562 <i915_request_get.cold+0x82>	1a555e: R_X86_64_PLT32	add_taint-0x4
0082   1a5562:	0f 0b                	ud2
0000 00000000001abef6 <i915_request_get.cold>:
0000   1abef6:	e8 00 00 00 00       	call   1abefb <i915_request_get.cold+0x5>	1abef7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0005   1abefb:	31 c9                	xor    %ecx,%ecx
0007   1abefd:	31 d2                	xor    %edx,%edx
0009   1abeff:	be 01 00 00 00       	mov    $0x1,%esi
000e   1abf04:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1abf07: R_X86_64_32S	_ftrace_annotated_branch+0x23fb20
0015   1abf0b:	e8 00 00 00 00       	call   1abf10 <i915_request_get.cold+0x1a>	1abf0c: R_X86_64_PLT32	ftrace_likely_update-0x4
001a   1abf10:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	1abf13: R_X86_64_32S	.rodata+0xc7f0c0
0021   1abf17:	ba 86 01 00 00       	mov    $0x186,%edx
0026   1abf1c:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	1abf1f: R_X86_64_32S	.rodata+0xc803a0
002d   1abf23:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1abf26: R_X86_64_32S	.rodata+0xc7dec0
0034   1abf2a:	e8 00 00 00 00       	call   1abf2f <i915_request_get.cold+0x39>	1abf2b: R_X86_64_PLT32	_printk-0x4
0039   1abf2f:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 1abf36 <i915_request_get.cold+0x40>	1abf32: R_X86_64_PC32	__trace_printk_fmt+0x2784
0040   1abf36:	e8 00 00 00 00       	call   1abf3b <i915_request_get.cold+0x45>	1abf37: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0045   1abf3b:	49 c7 c0 00 00 00 00 	mov    $0x0,%r8	1abf3e: R_X86_64_32S	.rodata+0xc7f0c0
004c   1abf42:	b9 86 01 00 00       	mov    $0x186,%ecx
0051   1abf47:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	1abf4a: R_X86_64_32S	.rodata+0xc803a0
0058   1abf4e:	48 89 de             	mov    %rbx,%rsi
005b   1abf51:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1abf54: R_X86_64_32S	.text.unlikely+0x1abf7a
0062   1abf58:	e8 00 00 00 00       	call   1abf5d <i915_request_get.cold+0x67>	1abf59: R_X86_64_PLT32	__trace_bprintk-0x4
0067   1abf5d:	e8 00 00 00 00       	call   1abf62 <i915_request_get.cold+0x6c>	1abf5e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
006c   1abf62:	bf 01 00 00 00       	mov    $0x1,%edi
0071   1abf67:	e8 00 00 00 00       	call   1abf6c <i915_request_get.cold+0x76>	1abf68: R_X86_64_PLT32	ftrace_dump-0x4
0076   1abf6c:	31 f6                	xor    %esi,%esi
0078   1abf6e:	bf 09 00 00 00       	mov    $0x9,%edi
007d   1abf73:	e8 00 00 00 00       	call   1abf78 <i915_request_get.cold+0x82>	1abf74: R_X86_64_PLT32	add_taint-0x4
0082   1abf78:	0f 0b                	ud2
0000 00000000001aff12 <i915_request_get.cold>:
0000   1aff12:	e8 00 00 00 00       	call   1aff17 <i915_request_get.cold+0x5>	1aff13: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0005   1aff17:	31 c9                	xor    %ecx,%ecx
0007   1aff19:	31 d2                	xor    %edx,%edx
0009   1aff1b:	be 01 00 00 00       	mov    $0x1,%esi
000e   1aff20:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1aff23: R_X86_64_32S	_ftrace_annotated_branch+0x2422b0
0015   1aff27:	e8 00 00 00 00       	call   1aff2c <i915_request_get.cold+0x1a>	1aff28: R_X86_64_PLT32	ftrace_likely_update-0x4
001a   1aff2c:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	1aff2f: R_X86_64_32S	.rodata+0xc88dc0
0021   1aff33:	ba 86 01 00 00       	mov    $0x186,%edx
0026   1aff38:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	1aff3b: R_X86_64_32S	.rodata+0xc8bc00
002d   1aff3f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1aff42: R_X86_64_32S	.rodata+0xc88560
0034   1aff46:	e8 00 00 00 00       	call   1aff4b <i915_request_get.cold+0x39>	1aff47: R_X86_64_PLT32	_printk-0x4
0039   1aff4b:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 1aff52 <i915_request_get.cold+0x40>	1aff4e: R_X86_64_PC32	__trace_printk_fmt+0x2dd4
0040   1aff52:	e8 00 00 00 00       	call   1aff57 <i915_request_get.cold+0x45>	1aff53: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0045   1aff57:	49 c7 c0 00 00 00 00 	mov    $0x0,%r8	1aff5a: R_X86_64_32S	.rodata+0xc88dc0
004c   1aff5e:	b9 86 01 00 00       	mov    $0x186,%ecx
0051   1aff63:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	1aff66: R_X86_64_32S	.rodata+0xc8bc00
0058   1aff6a:	48 89 de             	mov    %rbx,%rsi
005b   1aff6d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1aff70: R_X86_64_32S	.text.unlikely+0x1aff96
0062   1aff74:	e8 00 00 00 00       	call   1aff79 <i915_request_get.cold+0x67>	1aff75: R_X86_64_PLT32	__trace_bprintk-0x4
0067   1aff79:	e8 00 00 00 00       	call   1aff7e <i915_request_get.cold+0x6c>	1aff7a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
006c   1aff7e:	bf 01 00 00 00       	mov    $0x1,%edi
0071   1aff83:	e8 00 00 00 00       	call   1aff88 <i915_request_get.cold+0x76>	1aff84: R_X86_64_PLT32	ftrace_dump-0x4
0076   1aff88:	31 f6                	xor    %esi,%esi
0078   1aff8a:	bf 09 00 00 00       	mov    $0x9,%edi
007d   1aff8f:	e8 00 00 00 00       	call   1aff94 <i915_request_get.cold+0x82>	1aff90: R_X86_64_PLT32	add_taint-0x4
0082   1aff94:	0f 0b                	ud2
0000 00000000001cc3e0 <i915_request_get.cold>:
0000   1cc3e0:	e8 00 00 00 00       	call   1cc3e5 <i915_request_get.cold+0x5>	1cc3e1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0005   1cc3e5:	31 c9                	xor    %ecx,%ecx
0007   1cc3e7:	31 d2                	xor    %edx,%edx
0009   1cc3e9:	be 01 00 00 00       	mov    $0x1,%esi
000e   1cc3ee:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1cc3f1: R_X86_64_32S	_ftrace_annotated_branch+0x254160
0015   1cc3f5:	e8 00 00 00 00       	call   1cc3fa <i915_request_get.cold+0x1a>	1cc3f6: R_X86_64_PLT32	ftrace_likely_update-0x4
001a   1cc3fa:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	1cc3fd: R_X86_64_32S	.rodata+0xcc8d60
0021   1cc401:	ba 86 01 00 00       	mov    $0x186,%edx
0026   1cc406:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	1cc409: R_X86_64_32S	.rodata+0xcc9860
002d   1cc40d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1cc410: R_X86_64_32S	.rodata+0xcc8ac0
0034   1cc414:	e8 00 00 00 00       	call   1cc419 <i915_request_get.cold+0x39>	1cc415: R_X86_64_PLT32	_printk-0x4
0039   1cc419:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 1cc420 <i915_request_get.cold+0x40>	1cc41c: R_X86_64_PC32	__trace_printk_fmt+0x4ba4
0040   1cc420:	e8 00 00 00 00       	call   1cc425 <i915_request_get.cold+0x45>	1cc421: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0045   1cc425:	49 c7 c0 00 00 00 00 	mov    $0x0,%r8	1cc428: R_X86_64_32S	.rodata+0xcc8d60
004c   1cc42c:	b9 86 01 00 00       	mov    $0x186,%ecx
0051   1cc431:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	1cc434: R_X86_64_32S	.rodata+0xcc9860
0058   1cc438:	48 89 de             	mov    %rbx,%rsi
005b   1cc43b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1cc43e: R_X86_64_32S	.text.unlikely+0x1cc464
0062   1cc442:	e8 00 00 00 00       	call   1cc447 <i915_request_get.cold+0x67>	1cc443: R_X86_64_PLT32	__trace_bprintk-0x4
0067   1cc447:	e8 00 00 00 00       	call   1cc44c <i915_request_get.cold+0x6c>	1cc448: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
006c   1cc44c:	bf 01 00 00 00       	mov    $0x1,%edi
0071   1cc451:	e8 00 00 00 00       	call   1cc456 <i915_request_get.cold+0x76>	1cc452: R_X86_64_PLT32	ftrace_dump-0x4
0076   1cc456:	31 f6                	xor    %esi,%esi
0078   1cc458:	bf 09 00 00 00       	mov    $0x9,%edi
007d   1cc45d:	e8 00 00 00 00       	call   1cc462 <i915_request_get.cold+0x82>	1cc45e: R_X86_64_PLT32	add_taint-0x4
0082   1cc462:	0f 0b                	ud2
0000 00000000001d0a32 <i915_request_get.cold>:
0000   1d0a32:	e8 00 00 00 00       	call   1d0a37 <i915_request_get.cold+0x5>	1d0a33: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0005   1d0a37:	31 c9                	xor    %ecx,%ecx
0007   1d0a39:	31 d2                	xor    %edx,%edx
0009   1d0a3b:	be 01 00 00 00       	mov    $0x1,%esi
000e   1d0a40:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1d0a43: R_X86_64_32S	_ftrace_annotated_branch+0x257a30
0015   1d0a47:	e8 00 00 00 00       	call   1d0a4c <i915_request_get.cold+0x1a>	1d0a48: R_X86_64_PLT32	ftrace_likely_update-0x4
001a   1d0a4c:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	1d0a4f: R_X86_64_32S	.rodata+0xccfea0
0021   1d0a53:	ba 86 01 00 00       	mov    $0x186,%edx
0026   1d0a58:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	1d0a5b: R_X86_64_32S	.rodata+0xcd5600
002d   1d0a5f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1d0a62: R_X86_64_32S	.rodata+0xccff00
0034   1d0a66:	e8 00 00 00 00       	call   1d0a6b <i915_request_get.cold+0x39>	1d0a67: R_X86_64_PLT32	_printk-0x4
0039   1d0a6b:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 1d0a72 <i915_request_get.cold+0x40>	1d0a6e: R_X86_64_PC32	__trace_printk_fmt+0x54d4
0040   1d0a72:	e8 00 00 00 00       	call   1d0a77 <i915_request_get.cold+0x45>	1d0a73: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0045   1d0a77:	49 c7 c0 00 00 00 00 	mov    $0x0,%r8	1d0a7a: R_X86_64_32S	.rodata+0xccfea0
004c   1d0a7e:	b9 86 01 00 00       	mov    $0x186,%ecx
0051   1d0a83:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	1d0a86: R_X86_64_32S	.rodata+0xcd5600
0058   1d0a8a:	48 89 de             	mov    %rbx,%rsi
005b   1d0a8d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1d0a90: R_X86_64_32S	.text.unlikely+0x1d0ab6
0062   1d0a94:	e8 00 00 00 00       	call   1d0a99 <i915_request_get.cold+0x67>	1d0a95: R_X86_64_PLT32	__trace_bprintk-0x4
0067   1d0a99:	e8 00 00 00 00       	call   1d0a9e <i915_request_get.cold+0x6c>	1d0a9a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
006c   1d0a9e:	bf 01 00 00 00       	mov    $0x1,%edi
0071   1d0aa3:	e8 00 00 00 00       	call   1d0aa8 <i915_request_get.cold+0x76>	1d0aa4: R_X86_64_PLT32	ftrace_dump-0x4
0076   1d0aa8:	31 f6                	xor    %esi,%esi
0078   1d0aaa:	bf 09 00 00 00       	mov    $0x9,%edi
007d   1d0aaf:	e8 00 00 00 00       	call   1d0ab4 <i915_request_get.cold+0x82>	1d0ab0: R_X86_64_PLT32	add_taint-0x4
0082   1d0ab4:	0f 0b                	ud2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
