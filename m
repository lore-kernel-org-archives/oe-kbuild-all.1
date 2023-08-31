Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5998B1429F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 23:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693524855; x=1725060855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MJDCfCCp7VTwwiHRveIPHHETL4cbiNVJpPvhR3L3DDk=;
  b=RG5cnYmGBv7Wu6DZ1vTmbIoYEYpNxkrhAluV20PeFeJy2+pZ52CpeYAm
   uJGvr4fmybBrxH7CqYpycZ0Dl0C2ABNHxTPNeQOUNfp8qiCA4euCO34mg
   ux54z4ZtVwCViZeyDzKfZoVpgsddCcEpOEpQPP6F6FZ/WkSSBUi9OjfhI
   SsfvLnCmdKj/g0CBdyP13xbyD+dGxnu6LxEdzUMqoG/1nnOpdd0e7sGH3
   QYJQPq6y1w30FMkRjCHkZIlc88xeSlJZgRGodpxZis9nc4RwteWcv9DZc
   KZv3mG7Q46JCXQyPVWtUFam9CQPqRANvMDk/ItnRgesP5R/MOgnK+t1EM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="366319303"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="366319303"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 16:34:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="913476268"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="913476268"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 31 Aug 2023 16:34:12 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbrAw-0000eh-1V;
	Thu, 31 Aug 2023 23:34:10 +0000
Date: Fri, 1 Sep 2023 07:33:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 79/120] vmlinux.o: warning: objtool:
 _RNvXs2S_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_8vma_lockNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14:
 missing int3 after ret
Message-ID: <202309010744.crOcoFBj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   20266a0652baf8ac0e9f0ca1de1cb8af8af430ef
commit: 200745f46ac4e87d0cd8cf0cb49d4c838ab5e2e5 [79/120] UPSTREAM: mm: separate vma->lock from vm_area_struct
config: x86_64-buildonly-randconfig-005-20230830 (https://download.01.org/0day-ci/archive/20230901/202309010744.crOcoFBj-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010744.crOcoFBj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010744.crOcoFBj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: _RNvXsD_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB5_20jailhouse_setup_dataNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsE_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB5_11boot_paramsNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsH_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB5_25__fpstate_32__bindgen_ty_1NtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsI_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB5_25__fpstate_32__bindgen_ty_2NtNtCs3yuwAp0waWO_4core7default7Default7default+0x32: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsJ_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB5_11__fpstate_32NtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsL_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB5_11__fpstate_64NtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsM_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB5_11__ymmh_stateNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsN_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB5_7__xstateNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsQ_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB5_8msr_infoNtNtCs3yuwAp0waWO_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsS_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB5_9saved_msrNtNtCs3yuwAp0waWO_4core7default7Default7default+0x2a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsX_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB5_10tracepointNtNtCs3yuwAp0waWO_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsY_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB5_17bpf_raw_event_mapNtNtCs3yuwAp0waWO_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs11_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_8idt_dataNtNtCs3yuwAp0waWO_4core7default7Default7default+0x1a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs13_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_26fxregs_state__bindgen_ty_1NtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs14_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_26fxregs_state__bindgen_ty_2NtNtCs3yuwAp0waWO_4core7default7Default7default+0x32: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs15_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_12fxregs_stateNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs16_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_12swregs_stateNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs17_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_11reg_512_bitNtNtCs3yuwAp0waWO_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs18_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_13reg_1024_byteNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1a_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_16mpx_bndcsr_stateNtNtCs3yuwAp0waWO_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1b_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_18avx_512_hi16_stateNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1c_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_10xtile_dataNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1d_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_11xregs_stateNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1e_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_12fpregs_stateNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1f_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_7fpstateNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1h_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_3fpuNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1i_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_9fpu_guestNtNtCs3yuwAp0waWO_4core7default7Default7default+0x2a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1j_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_25cpuinfo_x86__bindgen_ty_1NtNtCs3yuwAp0waWO_4core7default7Default7default+0x5a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1k_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_11cpuinfo_x86NtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1m_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_11entry_stackNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1n_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_16entry_stack_pageNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1o_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_13x86_io_bitmapNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1p_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_10tss_structNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1q_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_9irq_stackNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1r_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_17fixed_percpu_dataNtNtCs3yuwAp0waWO_4core7default7Default7default+0x32: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1s_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_13thread_structNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1w_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_32___call_single_node__bindgen_ty_1NtNtCs3yuwAp0waWO_4core7default7Default7default+0x8: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1x_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_18___call_single_nodeNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1y_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_18___call_single_dataNtNtCs3yuwAp0waWO_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1z_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_9lock_listNtNtCs3yuwAp0waWO_4core7default7Default7default+0x3a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1A_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_10lock_chainNtNtCs3yuwAp0waWO_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1C_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_9held_lockNtNtCs3yuwAp0waWO_4core7default7Default7default+0x2a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1E_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_36spinlock__bindgen_ty_1__bindgen_ty_1NtNtCs3yuwAp0waWO_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1F_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_22spinlock__bindgen_ty_1NtNtCs3yuwAp0waWO_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1G_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_8rwlock_tNtNtCs3yuwAp0waWO_4core7default7Default7default+0x3a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1H_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_16hlist_nulls_headNtNtCs3yuwAp0waWO_4core7default7Default7default+0x8: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1I_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_16hlist_nulls_nodeNtNtCs3yuwAp0waWO_4core7default7Default7default+0x8: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1J_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_16wait_queue_entryNtNtCs3yuwAp0waWO_4core7default7Default7default+0x2a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1K_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_15wait_queue_headNtNtCs3yuwAp0waWO_4core7default7Default7default+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1L_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_20optimistic_spin_nodeNtNtCs3yuwAp0waWO_4core7default7Default7default+0x1a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1M_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_5mutexNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1N_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_8seqcountNtNtCs3yuwAp0waWO_4core7default7Default7default+0x32: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1O_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_21seqcount_raw_spinlockNtNtCs3yuwAp0waWO_4core7default7Default7default+0x3a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1S_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_16seqcount_latch_tNtNtCs3yuwAp0waWO_4core7default7Default7default+0x32: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1T_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_9seqlock_tNtNtCs3yuwAp0waWO_4core7default7Default7default+0x7a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1U_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_15pcpu_group_infoNtNtCs3yuwAp0waWO_4core7default7Default7default+0x1a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1V_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_15pcpu_alloc_infoNtNtCs3yuwAp0waWO_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1W_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_9page_fragNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1X_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_7rb_nodeNtNtCs3yuwAp0waWO_4core7default7Default7default+0x1a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1Z_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_14rb_root_cachedNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs20_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_42maple_range_64__bindgen_ty_1__bindgen_ty_1NtNtCs3yuwAp0waWO_4core7default7Default7default+0x82: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs21_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_28maple_range_64__bindgen_ty_1NtNtCs3yuwAp0waWO_4core7default7Default7default+0x82: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs22_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_14maple_range_64NtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs23_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_15maple_arange_64NtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs24_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_11maple_allocNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs27_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_10maple_treeNtNtCs3yuwAp0waWO_4core7default7Default7default+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs28_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_38maple_node__bindgen_ty_1__bindgen_ty_1NtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs29_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_38maple_node__bindgen_ty_1__bindgen_ty_2NtNtCs3yuwAp0waWO_4core7default7Default7default+0x32: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2a_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_24maple_node__bindgen_ty_1NtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2b_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_10maple_nodeNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2d_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_8ma_stateNtNtCs3yuwAp0waWO_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2e_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_11ma_wr_stateNtNtCs3yuwAp0waWO_4core7default7Default7default+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2f_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_12rw_semaphoreNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2g_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_16swait_queue_headNtNtCs3yuwAp0waWO_4core7default7Default7default+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2h_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_11swait_queueNtNtCs3yuwAp0waWO_4core7default7Default7default+0x1a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2i_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_10completionNtNtCs3yuwAp0waWO_4core7default7Default7default+0x5a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2j_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_15uprobe_consumerNtNtCs3yuwAp0waWO_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2k_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_14___kernel_timexNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2m_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_11old_timex32NtNtCs3yuwAp0waWO_4core7default7Default7default+0x82: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2n_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_20system_time_snapshotNtNtCs3yuwAp0waWO_4core7default7Default7default+0x3a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2p_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_9debug_objNtNtCs3yuwAp0waWO_4core7default7Default7default+0x2a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2q_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_15debug_obj_descrNtNtCs3yuwAp0waWO_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2r_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_10timer_listNtNtCs3yuwAp0waWO_4core7default7Default7default+0x62: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2s_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_11work_structNtNtCs3yuwAp0waWO_4core7default7Default7default+0x5a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2t_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_12delayed_workNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2u_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_8rcu_workNtNtCs3yuwAp0waWO_4core7default7Default7default+0x72: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2v_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_12execute_workNtNtCs3yuwAp0waWO_4core7default7Default7default+0x5a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2w_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_12mm_context_tNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2z_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_32page__bindgen_ty_1__bindgen_ty_1NtNtCs3yuwAp0waWO_4core7default7Default7default+0x2a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2B_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_32page__bindgen_ty_1__bindgen_ty_2NtNtCs3yuwAp0waWO_4core7default7Default7default+0x2a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2C_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_32page__bindgen_ty_1__bindgen_ty_4NtNtCs3yuwAp0waWO_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2E_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_32page__bindgen_ty_1__bindgen_ty_5NtNtCs3yuwAp0waWO_4core7default7Default7default+0x2a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2G_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_18page__bindgen_ty_1NtNtCs3yuwAp0waWO_4core7default7Default7default+0x2a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2I_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_4pageNtNtCs3yuwAp0waWO_4core7default7Default7default+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2J_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_61folio__bindgen_ty_1__bindgen_ty_1__bindgen_ty_1__bindgen_ty_1NtNtCs3yuwAp0waWO_4core7default7Default7default+0x8: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2L_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_33folio__bindgen_ty_1__bindgen_ty_1NtNtCs3yuwAp0waWO_4core7default7Default7default+0x3a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2M_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_19folio__bindgen_ty_1NtNtCs3yuwAp0waWO_4core7default7Default7default+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2N_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_5folioNtNtCs3yuwAp0waWO_4core7default7Default7default+0x72: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2O_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_15page_frag_cacheNtNtCs3yuwAp0waWO_4core7default7Default7default+0x1a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2P_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_9vm_regionNtNtCs3yuwAp0waWO_4core7default7Default7default+0x52: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs2S_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_8vma_lockNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs2V_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_42vm_area_struct__bindgen_ty_3__bindgen_ty_1NtNtCs3yuwAp0waWO_4core7default7Default7default+0x22: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs2W_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_28vm_area_struct__bindgen_ty_3NtNtCs3yuwAp0waWO_4core7default7Default7default+0x22: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs2X_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_14vm_area_structNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs2Y_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_37mm_struct__bindgen_ty_1__bindgen_ty_1NtNtCs3yuwAp0waWO_4core7default7Default7default+0x1a: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs2Z_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_23mm_struct__bindgen_ty_1NtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs30_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_9mm_structNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs31_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_15lru_gen_mm_listNtNtCs3yuwAp0waWO_4core7default7Default7default+0x52: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs32_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_12vma_iteratorNtNtCs3yuwAp0waWO_4core7default7Default7default+0x42: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs34_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_12local_lock_tNtNtCs3yuwAp0waWO_4core7default7Default7default+0x32: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs35_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_9free_areaNtNtCs3yuwAp0waWO_4core7default7Default7default+0x5a: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs36_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_13lru_gen_folioNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs37_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_16lru_gen_mm_stateNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs38_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_15lru_gen_mm_walkNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs39_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_6lruvecNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs3a_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_13per_cpu_pagesNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs3b_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_16per_cpu_nodestatNtNtCs3yuwAp0waWO_4core7default7Default7default+0x2e: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs3c_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_4zoneNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs3e_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_8zonelistNtNtCs3yuwAp0waWO_4core7default7Default7default+0x42: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs3f_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_11pglist_dataNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3h_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_13rcu_segcblistNtNtCs3yuwAp0waWO_4core7default7Default7default+0x7a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3i_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_11srcu_structNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3j_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_14notifier_blockNtNtCs3yuwAp0waWO_4core7default7Default7default+0x1a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3k_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_20atomic_notifier_headNtNtCs3yuwAp0waWO_4core7default7Default7default+0x4a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3l_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_22blocking_notifier_headNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3n_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_18srcu_notifier_headNtNtCs3yuwAp0waWO_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3o_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_10mhp_paramsNtNtCs3yuwAp0waWO_4core7default7Default7default+0x1a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3q_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_15scale_freq_dataNtNtCs3yuwAp0waWO_4core7default7Default7default+0x8: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3r_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_15percpu_ref_dataNtNtCs3yuwAp0waWO_4core7default7Default7default+0x3a: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs3yuwAp0waWO_4core3ptr13drop_in_placeQNtNtCsfATHBUcknU9_6kernel3str12RawFormatterEBL_+0x8: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtCs3yuwAp0waWO_4core3fmtQNtNtCsfATHBUcknU9_6kernel3str12RawFormatterNtB2_5Write10write_charBw_+0x117: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtCs3yuwAp0waWO_4core3fmtQNtNtCsfATHBUcknU9_6kernel3str12RawFormatterNtB2_5Write9write_fmtBw_+0x5a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtCs3yuwAp0waWO_4core3fmtQNtNtCsfATHBUcknU9_6kernel3str12RawFormatterNtB2_5Write9write_strBw_+0x5f: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtCsfATHBUcknU9_6kernel5errorNtB2_5Error15to_kernel_errno+0x8: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_NtCsfATHBUcknU9_6kernel5errorNtB4_5ErrorINtNtCs3yuwAp0waWO_4core7convert4FromNtNtCsdvv6pRyacSq_5alloc11collections15TryReserveErrorE4from+0xb: missing int3 after ret
   vmlinux.o: warning: objtool: rust_fmt_argument+0x73: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtNtCsfATHBUcknU9_6kernel5print14format_strings8generate+0xb2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_NtCsfATHBUcknU9_6kernel3strNtB4_12RawFormatterNtNtCs3yuwAp0waWO_4core3fmt5Write9write_str+0x5f: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs_CsfATHBUcknU9_6kernelNtB4_10ThisModule8from_ptr+0x9: missing int3 after ret
   vmlinux.o: warning: objtool: __rg_realloc+0x85: missing int3 after ret
   vmlinux.o: warning: objtool: __rg_alloc_zeroed+0x4a: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs3yuwAp0waWO_4core3ptr13drop_in_placeINtNtB4_6option6OptionNtCsdVu6umiBwhr_12rust_minimal11RustMinimalEEB14_+0xe9: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs3yuwAp0waWO_4core3ptr13drop_in_placeRjECsdVu6umiBwhr_12rust_minimal+0x8: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCsdvv6pRyacSq_5alloc7raw_vec11finish_growNtNtB4_5alloc6GlobalECsdVu6umiBwhr_12rust_minimal+0x9f: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs_NtCsdvv6pRyacSq_5alloc7raw_vecINtB4_6RawVeclE20try_reserve_for_pushCsdVu6umiBwhr_12rust_minimal+0xca: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsm_NtCsdvv6pRyacSq_5alloc3vecINtB5_3VeclENtNtCs3yuwAp0waWO_4core3fmt5Debug3fmtCsdVu6umiBwhr_12rust_minimal+0x86: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXCsdVu6umiBwhr_12rust_minimalNtB2_11RustMinimalNtCsfATHBUcknU9_6kernel6Module4init+0x1d7: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_CsdVu6umiBwhr_12rust_minimalNtB4_11RustMinimalNtNtNtCs3yuwAp0waWO_4core3ops4drop4Drop4drop+0xad: missing int3 after ret
   vmlinux.o: warning: objtool: __rust_minimal_init+0x54: missing int3 after ret


objdump-func vmlinux.o _RNvXs2S_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_8vma_lockNtNtCs3yuwAp0waWO_4core7default7Default7default:
0000 00000000000232e0 <_RNvXs2S_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_8vma_lockNtNtCs3yuwAp0waWO_4core7default7Default7default>:
0000    232e0:	53                   	push   %rbx
0001    232e1:	ba 98 00 00 00       	mov    $0x98,%edx
0006    232e6:	31 f6                	xor    %esi,%esi
0008    232e8:	48 89 fb             	mov    %rdi,%rbx
000b    232eb:	e8 00 00 00 00       	call   232f0 <_RNvXs2S_NtCs3XUU1alqrUZ_8bindings12bindings_rawNtB6_8vma_lockNtNtCs3yuwAp0waWO_4core7default7Default7default+0x10>	232ec: R_X86_64_PLT32	memset-0x4
0010    232f0:	48 89 d8             	mov    %rbx,%rax
0013    232f3:	5b                   	pop    %rbx
0014    232f4:	c3                   	ret
0015    232f5:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
001f    232ff:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
