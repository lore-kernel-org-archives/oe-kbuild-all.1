Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A9315B9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Sep 2023 06:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694933184; x=1726469184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5V9KjaOkDA5St2bF17LayMmj7dduUiWlMExVeNg7Kug=;
  b=JQzqc22pknxWhpA6MGxsCyAptuaaWR8qhAYpRLHGN4e7mMWnxIZuAi/m
   FquL21653eZN5pBtGYP3XdDZpOlMso0AVd680kpVtl4ioJf6W44EazUzC
   lJCU4hC63GvbJvtWK/uP1+ZuWPy0b/M9ESrXuBR+M1kYZHEL6bnLjFpnr
   2nqnQVy6XWbzFABVgfVkX0CbJWMrzL+XJWTEwLPZb2A6kDibWffjAWWo0
   QXZwqZwtsql2gycf0rTqd9PaLMzu9e0rvUu8wb3IMpxJPW6ZqtSv471ik
   gMrx7dsHAAfjbGbnDhbVznCVPYZNN5F+cz2jL/wBsd7Ks69ntL2wQRSbj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="359725096"
X-IronPort-AV: E=Sophos;i="6.02,153,1688454000"; 
   d="scan'208";a="359725096"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 23:46:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="815655836"
X-IronPort-AV: E=Sophos;i="6.02,153,1688454000"; 
   d="scan'208";a="815655836"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Sep 2023 23:46:19 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhlXt-000526-2Z;
	Sun, 17 Sep 2023 06:46:17 +0000
Date: Sun, 17 Sep 2023 14:45:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/18] vmlinux.o: warning: objtool:
 __i915_gem_object_create_region.cold+0x20f: relocation to !ENDBR:
 i915_gem_object_create_region_at.cold+0x0
Message-ID: <202309171420.dKiZzWo9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   d3212c2dbababf849d940f5f7001f4fde222b888
commit: 467d3baa5d70bb17784aae9e88ccc623cf2c88f9 [1/18] BACKPORT: overflow: Introduce overflows_type() and castable_to_type()
config: x86_64-randconfig-005-20230916 (https://download.01.org/0day-ci/archive/20230917/202309171420.dKiZzWo9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230917/202309171420.dKiZzWo9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309171420.dKiZzWo9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: mptctl_timeout_expired+0x250: unreachable instruction
   vmlinux.o: warning: objtool: gen6_emit_breadcrumb_xcs.cold+0x1b1: relocation to !ENDBR: gen7_emit_breadcrumb_xcs.cold+0x0
   vmlinux.o: warning: objtool: gen12_emit_fini_breadcrumb_xcs.cold+0x1b1: relocation to !ENDBR: gen12_emit_fini_breadcrumb_rcs.cold+0x0
   vmlinux.o: warning: objtool: gen8_ppgtt_clear.cold+0x1b1: relocation to !ENDBR: gen8_ppgtt_insert_huge.cold+0x0
   vmlinux.o: warning: objtool: gen8_ppgtt_alloc.cold+0x1b1: relocation to !ENDBR: gen8_ppgtt_create.cold+0x0
   vmlinux.o: warning: objtool: insert_breadcrumb.cold+0xf5: relocation to !ENDBR: intel_breadcrumbs_free.cold+0x0
   vmlinux.o: warning: objtool: virtual_submission_tasklet.cold+0x39: relocation to !ENDBR: live_suppress_self_preempt.cold+0x0
   vmlinux.o: warning: objtool: intel_gt_buffer_pool_mark_used.cold+0x39: relocation to !ENDBR: intel_gt_fini_buffer_pool.cold+0x0
   vmlinux.o: warning: objtool: create_result_vma.constprop.0.cold+0x97: relocation to !ENDBR: compare_isolation.cold+0x0
   vmlinux.o: warning: objtool: load_context.cold+0x1c3: relocation to !ENDBR: __live_lrc_state.cold+0x0
   vmlinux.o: warning: objtool: lrc_update_regs.cold+0xf5: relocation to !ENDBR: lrc_reset.cold+0x0
   vmlinux.o: warning: objtool: vlv_rc6_init.cold+0x39: relocation to !ENDBR: gen6_rc6_enable.cold+0x0
   vmlinux.o: warning: objtool: hang_create_request.cold+0x97: relocation to !ENDBR: __i915_request_reset.cold+0x0
   vmlinux.o: warning: objtool: i9xx_submit_request.cold+0x97: relocation to !ENDBR: gen6_bsd_submit_request.cold+0x0
   vmlinux.o: warning: objtool: __i915_gem_object_create_user_ext.cold+0xf5: relocation to !ENDBR: i915_gem_object_get_pages_dmabuf.cold+0x0
   vmlinux.o: warning: objtool: i915_gem_object_set_to_gtt_domain.cold+0x153: relocation to !ENDBR: i915_gem_object_set_to_cpu_domain.cold+0x0
   vmlinux.o: warning: objtool: i915_gem_set_domain_ioctl.cold+0x97: relocation to !ENDBR: i915_gem_object_prepare_read.cold+0x0
   vmlinux.o: warning: objtool: i915_gem_object_prepare_read.cold+0x97: relocation to !ENDBR: i915_gem_object_prepare_write.cold+0x0
   vmlinux.o: warning: objtool: i915_gem_object_prepare_write.cold+0x97: relocation to !ENDBR: eb_create.cold+0x0
   vmlinux.o: warning: objtool: eb_move_to_gpu.cold+0x39: relocation to !ENDBR: i915_reset_gen7_sol_offsets.cold+0x0
   vmlinux.o: warning: objtool: igt_mmap_offset_exhaustion.cold+0x14b: relocation to !ENDBR: vm_access.cold+0x0
   vmlinux.o: warning: objtool: __i915_gem_object_release_mmap_gtt.cold+0x97: relocation to !ENDBR: i915_gem_object_runtime_pm_release_mmap_offset.cold+0x0
   vmlinux.o: warning: objtool: __i915_gem_object_flush_map.cold+0x97: relocation to !ENDBR: __i915_gem_object_release_map.cold+0x0
>> vmlinux.o: warning: objtool: __i915_gem_object_create_region.cold+0x20f: relocation to !ENDBR: i915_gem_object_create_region_at.cold+0x0
   vmlinux.o: warning: objtool: shmem_pwrite.cold+0x39: relocation to !ENDBR: shmem_sg_alloc_table.cold+0x0
   vmlinux.o: warning: objtool: intel_engine_cmd_parser.cold+0x26d: relocation to !ENDBR: intel_gt_is_wedged.cold+0x0
   vmlinux.o: warning: objtool: fake_dma_object.cold+0x153: relocation to !ENDBR: fill_hole.cold+0x0
   vmlinux.o: warning: objtool: i915_gem_shmem_pwrite.cold+0x20f: relocation to !ENDBR: i915_gem_shmem_pread.cold+0x0
   vmlinux.o: warning: objtool: i915_gem_shmem_pread.cold+0x20f: relocation to !ENDBR: i915_gem_runtime_suspend.cold+0x0
   vmlinux.o: warning: objtool: __i915_request_skip.cold+0x39: relocation to !ENDBR: i915_request_set_error_once.cold+0x0
   vmlinux.o: warning: objtool: __i915_schedule.cold+0x153: relocation to !ENDBR: i915_sched_node_reinit.cold+0x0
   vmlinux.o: warning: objtool: vma_create.cold+0x26d: relocation to !ENDBR: __vma_put_pages.cold+0x0
   vmlinux.o: warning: objtool: i915_vma_misplaced.cold+0x39: relocation to !ENDBR: __i915_vma_set_map_and_fenceable.cold+0x0
   vmlinux.o: warning: objtool: i915_vma_get_pages.cold+0x97: relocation to !ENDBR: i915_vma_pin_ww.cold+0x0
   vmlinux.o: warning: objtool: __guc_context_destroy.cold+0x97: relocation to !ENDBR: guc_flush_destroyed_contexts.cold+0x0
   vmlinux.o: warning: objtool: emit_bb_start_child_no_preempt_mid_batch.cold+0x2cb: relocation to !ENDBR: __guc_add_request.cold+0x0
   vmlinux.o: warning: objtool: guc_dequeue_one_context.cold+0x1b1: relocation to !ENDBR: intel_guc_steal_guc_ids.cold+0x0


objdump-func vmlinux.o __i915_gem_object_create_region.cold:
0000 00000000001eab29 <__i915_gem_object_create_region.cold>:
0000   1eab29:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	1eab2c: R_X86_64_32S	.rodata+0xb77b00
0007   1eab30:	ba 40 00 00 00       	mov    $0x40,%edx
000c   1eab35:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	1eab38: R_X86_64_32S	.rodata+0xb782c0
0013   1eab3c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1eab3f: R_X86_64_32S	.rodata+0xb77a60
001a   1eab43:	e8 00 00 00 00       	call   1eab48 <__i915_gem_object_create_region.cold+0x1f>	1eab44: R_X86_64_PLT32	_printk-0x4
001f   1eab48:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 1eab4f <__i915_gem_object_create_region.cold+0x26>	1eab4b: R_X86_64_PC32	__trace_printk_fmt+0x4364
0026   1eab4f:	49 c7 c0 00 00 00 00 	mov    $0x0,%r8	1eab52: R_X86_64_32S	.rodata+0xb77b00
002d   1eab56:	b9 40 00 00 00       	mov    $0x40,%ecx
0032   1eab5b:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	1eab5e: R_X86_64_32S	.rodata+0xb782c0
0039   1eab62:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1eab65: R_X86_64_32S	.text.unlikely+0x1eab29
0040   1eab69:	e8 00 00 00 00       	call   1eab6e <__i915_gem_object_create_region.cold+0x45>	1eab6a: R_X86_64_PLT32	__trace_bprintk-0x4
0045   1eab6e:	bf 01 00 00 00       	mov    $0x1,%edi
004a   1eab73:	e8 00 00 00 00       	call   1eab78 <__i915_gem_object_create_region.cold+0x4f>	1eab74: R_X86_64_PLT32	ftrace_dump-0x4
004f   1eab78:	31 f6                	xor    %esi,%esi
0051   1eab7a:	bf 09 00 00 00       	mov    $0x9,%edi
0056   1eab7f:	e8 00 00 00 00       	call   1eab84 <__i915_gem_object_create_region.cold+0x5b>	1eab80: R_X86_64_PLT32	add_taint-0x4
005b   1eab84:	90                   	nop
005c   1eab85:	0f 0b                	ud2
005e   1eab87:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	1eab8a: R_X86_64_32S	.rodata+0xb77980
0065   1eab8e:	ba 31 00 00 00       	mov    $0x31,%edx
006a   1eab93:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	1eab96: R_X86_64_32S	.rodata+0xb782c0
0071   1eab9a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1eab9d: R_X86_64_32S	.rodata+0xb77a60
0078   1eaba1:	e8 00 00 00 00       	call   1eaba6 <__i915_gem_object_create_region.cold+0x7d>	1eaba2: R_X86_64_PLT32	_printk-0x4
007d   1eaba6:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 1eabad <__i915_gem_object_create_region.cold+0x84>	1eaba9: R_X86_64_PC32	__trace_printk_fmt+0x4374
0084   1eabad:	49 c7 c0 00 00 00 00 	mov    $0x0,%r8	1eabb0: R_X86_64_32S	.rodata+0xb77980
008b   1eabb4:	b9 31 00 00 00       	mov    $0x31,%ecx
0090   1eabb9:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	1eabbc: R_X86_64_32S	.rodata+0xb782c0
0097   1eabc0:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1eabc3: R_X86_64_32S	.text.unlikely+0x1eab87
009e   1eabc7:	e8 00 00 00 00       	call   1eabcc <__i915_gem_object_create_region.cold+0xa3>	1eabc8: R_X86_64_PLT32	__trace_bprintk-0x4
00a3   1eabcc:	bf 01 00 00 00       	mov    $0x1,%edi
00a8   1eabd1:	e8 00 00 00 00       	call   1eabd6 <__i915_gem_object_create_region.cold+0xad>	1eabd2: R_X86_64_PLT32	ftrace_dump-0x4
00ad   1eabd6:	31 f6                	xor    %esi,%esi
00af   1eabd8:	bf 09 00 00 00       	mov    $0x9,%edi
00b4   1eabdd:	e8 00 00 00 00       	call   1eabe2 <__i915_gem_object_create_region.cold+0xb9>	1eabde: R_X86_64_PLT32	add_taint-0x4
00b9   1eabe2:	90                   	nop
00ba   1eabe3:	0f 0b                	ud2
00bc   1eabe5:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	1eabe8: R_X86_64_32S	.rodata+0xb780c0
00c3   1eabec:	ba 42 00 00 00       	mov    $0x42,%edx
00c8   1eabf1:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	1eabf4: R_X86_64_32S	.rodata+0xb782c0
00cf   1eabf8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1eabfb: R_X86_64_32S	.rodata+0xb77a60
00d6   1eabff:	e8 00 00 00 00       	call   1eac04 <__i915_gem_object_create_region.cold+0xdb>	1eac00: R_X86_64_PLT32	_printk-0x4
00db   1eac04:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 1eac0b <__i915_gem_object_create_region.cold+0xe2>	1eac07: R_X86_64_PC32	__trace_printk_fmt+0x4344
00e2   1eac0b:	49 c7 c0 00 00 00 00 	mov    $0x0,%r8	1eac0e: R_X86_64_32S	.rodata+0xb780c0
00e9   1eac12:	b9 42 00 00 00       	mov    $0x42,%ecx
00ee   1eac17:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	1eac1a: R_X86_64_32S	.rodata+0xb782c0
00f5   1eac1e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1eac21: R_X86_64_32S	.text.unlikely+0x1eabe5
00fc   1eac25:	e8 00 00 00 00       	call   1eac2a <__i915_gem_object_create_region.cold+0x101>	1eac26: R_X86_64_PLT32	__trace_bprintk-0x4
0101   1eac2a:	bf 01 00 00 00       	mov    $0x1,%edi
0106   1eac2f:	e8 00 00 00 00       	call   1eac34 <__i915_gem_object_create_region.cold+0x10b>	1eac30: R_X86_64_PLT32	ftrace_dump-0x4
010b   1eac34:	31 f6                	xor    %esi,%esi
010d   1eac36:	bf 09 00 00 00       	mov    $0x9,%edi
0112   1eac3b:	e8 00 00 00 00       	call   1eac40 <__i915_gem_object_create_region.cold+0x117>	1eac3c: R_X86_64_PLT32	add_taint-0x4
0117   1eac40:	90                   	nop
0118   1eac41:	0f 0b                	ud2
011a   1eac43:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	1eac46: R_X86_64_32S	.rodata+0xb78120
0121   1eac4a:	ba 49 00 00 00       	mov    $0x49,%edx
0126   1eac4f:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	1eac52: R_X86_64_32S	.rodata+0xb782c0
012d   1eac56:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1eac59: R_X86_64_32S	.rodata+0xb77a60
0134   1eac5d:	e8 00 00 00 00       	call   1eac62 <__i915_gem_object_create_region.cold+0x139>	1eac5e: R_X86_64_PLT32	_printk-0x4
0139   1eac62:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 1eac69 <__i915_gem_object_create_region.cold+0x140>	1eac65: R_X86_64_PC32	__trace_printk_fmt+0x4334
0140   1eac69:	49 c7 c0 00 00 00 00 	mov    $0x0,%r8	1eac6c: R_X86_64_32S	.rodata+0xb78120
0147   1eac70:	b9 49 00 00 00       	mov    $0x49,%ecx
014c   1eac75:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	1eac78: R_X86_64_32S	.rodata+0xb782c0
0153   1eac7c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1eac7f: R_X86_64_32S	.text.unlikely+0x1eac43
015a   1eac83:	e8 00 00 00 00       	call   1eac88 <__i915_gem_object_create_region.cold+0x15f>	1eac84: R_X86_64_PLT32	__trace_bprintk-0x4
015f   1eac88:	bf 01 00 00 00       	mov    $0x1,%edi
0164   1eac8d:	e8 00 00 00 00       	call   1eac92 <__i915_gem_object_create_region.cold+0x169>	1eac8e: R_X86_64_PLT32	ftrace_dump-0x4
0169   1eac92:	31 f6                	xor    %esi,%esi
016b   1eac94:	bf 09 00 00 00       	mov    $0x9,%edi
0170   1eac99:	e8 00 00 00 00       	call   1eac9e <__i915_gem_object_create_region.cold+0x175>	1eac9a: R_X86_64_PLT32	add_taint-0x4
0175   1eac9e:	90                   	nop
0176   1eac9f:	0f 0b                	ud2
0178   1eaca1:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	1eaca4: R_X86_64_32S	.rodata+0xb78160
017f   1eaca8:	ba 4a 00 00 00       	mov    $0x4a,%edx
0184   1eacad:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	1eacb0: R_X86_64_32S	.rodata+0xb782c0
018b   1eacb4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1eacb7: R_X86_64_32S	.rodata+0xb77a60
0192   1eacbb:	e8 00 00 00 00       	call   1eacc0 <__i915_gem_object_create_region.cold+0x197>	1eacbc: R_X86_64_PLT32	_printk-0x4
0197   1eacc0:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 1eacc7 <__i915_gem_object_create_region.cold+0x19e>	1eacc3: R_X86_64_PC32	__trace_printk_fmt+0x4324
019e   1eacc7:	49 c7 c0 00 00 00 00 	mov    $0x0,%r8	1eacca: R_X86_64_32S	.rodata+0xb78160
01a5   1eacce:	b9 4a 00 00 00       	mov    $0x4a,%ecx
01aa   1eacd3:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	1eacd6: R_X86_64_32S	.rodata+0xb782c0
01b1   1eacda:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1eacdd: R_X86_64_32S	.text.unlikely+0x1eaca1
01b8   1eace1:	e8 00 00 00 00       	call   1eace6 <__i915_gem_object_create_region.cold+0x1bd>	1eace2: R_X86_64_PLT32	__trace_bprintk-0x4
01bd   1eace6:	bf 01 00 00 00       	mov    $0x1,%edi
01c2   1eaceb:	e8 00 00 00 00       	call   1eacf0 <__i915_gem_object_create_region.cold+0x1c7>	1eacec: R_X86_64_PLT32	ftrace_dump-0x4
01c7   1eacf0:	31 f6                	xor    %esi,%esi
01c9   1eacf2:	bf 09 00 00 00       	mov    $0x9,%edi
01ce   1eacf7:	e8 00 00 00 00       	call   1eacfc <__i915_gem_object_create_region.cold+0x1d3>	1eacf8: R_X86_64_PLT32	add_taint-0x4
01d3   1eacfc:	90                   	nop
01d4   1eacfd:	0f 0b                	ud2
01d6   1eacff:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	1ead02: R_X86_64_32S	.rodata+0xb78060
01dd   1ead06:	ba 41 00 00 00       	mov    $0x41,%edx
01e2   1ead0b:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	1ead0e: R_X86_64_32S	.rodata+0xb782c0
01e9   1ead12:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1ead15: R_X86_64_32S	.rodata+0xb77a60
01f0   1ead19:	e8 00 00 00 00       	call   1ead1e <__i915_gem_object_create_region.cold+0x1f5>	1ead1a: R_X86_64_PLT32	_printk-0x4
01f5   1ead1e:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 1ead25 <__i915_gem_object_create_region.cold+0x1fc>	1ead21: R_X86_64_PC32	__trace_printk_fmt+0x4354
01fc   1ead25:	49 c7 c0 00 00 00 00 	mov    $0x0,%r8	1ead28: R_X86_64_32S	.rodata+0xb78060
0203   1ead2c:	b9 41 00 00 00       	mov    $0x41,%ecx
0208   1ead31:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	1ead34: R_X86_64_32S	.rodata+0xb782c0
020f   1ead38:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1ead3b: R_X86_64_32S	.text.unlikely+0x1ead5d
0216   1ead3f:	e8 00 00 00 00       	call   1ead44 <__i915_gem_object_create_region.cold+0x21b>	1ead40: R_X86_64_PLT32	__trace_bprintk-0x4
021b   1ead44:	bf 01 00 00 00       	mov    $0x1,%edi
0220   1ead49:	e8 00 00 00 00       	call   1ead4e <__i915_gem_object_create_region.cold+0x225>	1ead4a: R_X86_64_PLT32	ftrace_dump-0x4
0225   1ead4e:	31 f6                	xor    %esi,%esi
0227   1ead50:	bf 09 00 00 00       	mov    $0x9,%edi
022c   1ead55:	e8 00 00 00 00       	call   1ead5a <__i915_gem_object_create_region.cold+0x231>	1ead56: R_X86_64_PLT32	add_taint-0x4
0231   1ead5a:	90                   	nop
0232   1ead5b:	0f 0b                	ud2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
