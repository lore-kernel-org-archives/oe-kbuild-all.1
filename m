Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A87D84A3A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 17:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707414778; cv=none; b=KEeqW7eVuGQqfW3NzdASDrxchsOUhkUYfpvzAY4XN2w59xGp0MFmFuyke5/KPw60lbVKM/f5om/Vi3wPbm8f+Qv5kGUEw77o/7dRIcHQWbi+u8LJH8g+mjETeK4KxRbvqR2n35f5B0goKvLY0r0gVvwRvMceO7pzGUQ/PqClm04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707414778; c=relaxed/simple;
	bh=Zqe1neisN8Bj2fKCCR38SvcRGwNNC4dd5l08xaeUCD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RGVXlvTG9WKpV+m4nytbZw9eYcmaeAdX2vExuOAVn5MK/zZ3AwrqNHmBswoYdl/JIMWpIzeKeYrThUkbboHtBpyJ47rZ1v2AMHUYUf4bwQxJa56jc2TfAcleJyWhDuIfVc8xKsmmJq3/5pvVZ8fzQPieBBOiPnZvd0IakAMqiYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rzh9ZyNA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rzh9ZyNA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707414775; x=1738950775;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Zqe1neisN8Bj2fKCCR38SvcRGwNNC4dd5l08xaeUCD4=;
  b=Rzh9ZyNAXDRsHKGkfPyCTfbhaAaKU2FwSfFjviTUmptd3HC9unNp/cz6
   16Ls42j191nfoivAzzAQ7PjL7CDHxNaDGIwWkmz8P3/fDM/1gPohibKb3
   A8Wux1MsCrDikmXsDVU2m9ni4kbJoFbeEgrRHeyDy3rNgTCVxjSsyLvid
   JpyikOr2+1O7uQH31pv41Z2xiycKKq+elILvQRV4Eg3iZEJbWB/b69YC0
   /a+gP0pZrHB2hBXHS4rsq4uEu6/NKxE6JiLZPG0I7n3sUCpjssz56chZt
   dcfkE2YU7eTW9YV0dCzAgGqGtORnSdGean30x9x//i+Wz7nFzfYzm7seN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1165332"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1165332"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 09:52:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="6328922"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Feb 2024 09:52:52 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rY8Zu-00040I-1j;
	Thu, 08 Feb 2024 17:52:50 +0000
Date: Fri, 9 Feb 2024 01:52:21 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/nested_ept_exit_qual 2/2]
 arch/x86/kvm/vmx/vmx.c:6510:57: error: 'struct kvm_vcpu_arch' has no member
 named 'exit_qualification'
Message-ID: <202402090136.2ITqpFv4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/sean-jc/linux x86/nested_ept_exit_qual
head:   6e842da15a5a575a869cbb1d1dfecd0f7c50546a
commit: 6e842da15a5a575a869cbb1d1dfecd0f7c50546a [2/2] KVM: x86: Move
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240209/202402090136.2ITqpFv4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240209/202402090136.2ITqpFv4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402090136.2ITqpFv4-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/vmx/vmx.c: In function '__vmx_handle_exit':
>> arch/x86/kvm/vmx/vmx.c:6510:57: error: 'struct kvm_vcpu_arch' has no member named 'exit_qualification'
    6510 |                 vcpu->run->internal.data[2] = vcpu->arch.exit_qualification;
         |                                                         ^


vim +6510 arch/x86/kvm/vmx/vmx.c

a8bc284eb70f58 arch/x86/kvm/vmx.c     Jim Mattson         2016-11-30  6395  
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6396  /*
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6397   * The guest has exited.  See if we can fix it or if we need userspace
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6398   * assistance.
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6399   */
fe6b6bc802b400 arch/x86/kvm/vmx/vmx.c Chenyi Qiang        2020-11-06  6400  static int __vmx_handle_exit(struct kvm_vcpu *vcpu, fastpath_t exit_fastpath)
63846663eac783 arch/x86/kvm/vmx.c     Nadav Har'El        2011-05-25  6401  {
63846663eac783 arch/x86/kvm/vmx.c     Nadav Har'El        2011-05-25  6402  	struct vcpu_vmx *vmx = to_vmx(vcpu);
8e53324021645f arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-11-06  6403  	union vmx_exit_reason exit_reason = vmx->exit_reason;
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6404  	u32 vectoring_info = vmx->idt_vectoring_info;
8e53324021645f arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-11-06  6405  	u16 exit_handler_index;
63846663eac783 arch/x86/kvm/vmx.c     Nadav Har'El        2011-05-25  6406  
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6407  	/*
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6408  	 * Flush logged GPAs PML buffer, this will make dirty_bitmap more
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6409  	 * updated. Another good is, in kvm_vm_ioctl_get_dirty_log, before
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6410  	 * querying dirty_bitmap, we only need to kick all vcpus out of guest
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6411  	 * mode as if vcpus is in root mode, the PML buffer must has been
c3bb9a20834ffe arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-02-12  6412  	 * flushed already.  Note, PML is never enabled in hardware while
c3bb9a20834ffe arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-02-12  6413  	 * running L2.
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6414  	 */
c3bb9a20834ffe arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-02-12  6415  	if (enable_pml && !is_guest_mode(vcpu))
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6416  		vmx_flush_pml_buffer(vcpu);
63846663eac783 arch/x86/kvm/vmx.c     Nadav Har'El        2011-05-25  6417  
db438592807e05 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-04-22  6418  	/*
cd0e615c49e5e5 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-12-07  6419  	 * KVM should never reach this point with a pending nested VM-Enter.
cd0e615c49e5e5 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-12-07  6420  	 * More specifically, short-circuiting VM-Entry to emulate L2 due to
cd0e615c49e5e5 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-12-07  6421  	 * invalid guest state should never happen as that means KVM knowingly
cd0e615c49e5e5 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-12-07  6422  	 * allowed a nested VM-Enter with an invalid vmcs12.  More below.
db438592807e05 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-04-22  6423  	 */
673692735fdc40 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-07-02  6424  	if (KVM_BUG_ON(vmx->nested.nested_run_pending, vcpu->kvm))
673692735fdc40 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-07-02  6425  		return -EIO;
db438592807e05 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-04-22  6426  
96b100cd1464ce arch/x86/kvm/vmx/vmx.c Paolo Bonzini       2020-03-17  6427  	if (is_guest_mode(vcpu)) {
c3bb9a20834ffe arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-02-12  6428  		/*
c3bb9a20834ffe arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-02-12  6429  		 * PML is never enabled when running L2, bail immediately if a
c3bb9a20834ffe arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-02-12  6430  		 * PML full exit occurs as something is horribly wrong.
c3bb9a20834ffe arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-02-12  6431  		 */
c3bb9a20834ffe arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-02-12  6432  		if (exit_reason.basic == EXIT_REASON_PML_FULL)
c3bb9a20834ffe arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-02-12  6433  			goto unexpected_vmexit;
c3bb9a20834ffe arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-02-12  6434  
96b100cd1464ce arch/x86/kvm/vmx/vmx.c Paolo Bonzini       2020-03-17  6435  		/*
96b100cd1464ce arch/x86/kvm/vmx/vmx.c Paolo Bonzini       2020-03-17  6436  		 * The host physical addresses of some pages of guest memory
96b100cd1464ce arch/x86/kvm/vmx/vmx.c Paolo Bonzini       2020-03-17  6437  		 * are loaded into the vmcs02 (e.g. vmcs12's Virtual APIC
96b100cd1464ce arch/x86/kvm/vmx/vmx.c Paolo Bonzini       2020-03-17  6438  		 * Page). The CPU may write to these pages via their host
96b100cd1464ce arch/x86/kvm/vmx/vmx.c Paolo Bonzini       2020-03-17  6439  		 * physical address while L2 is running, bypassing any
96b100cd1464ce arch/x86/kvm/vmx/vmx.c Paolo Bonzini       2020-03-17  6440  		 * address-translation-based dirty tracking (e.g. EPT write
96b100cd1464ce arch/x86/kvm/vmx/vmx.c Paolo Bonzini       2020-03-17  6441  		 * protection).
96b100cd1464ce arch/x86/kvm/vmx/vmx.c Paolo Bonzini       2020-03-17  6442  		 *
96b100cd1464ce arch/x86/kvm/vmx/vmx.c Paolo Bonzini       2020-03-17  6443  		 * Mark them dirty on every exit from L2 to prevent them from
96b100cd1464ce arch/x86/kvm/vmx/vmx.c Paolo Bonzini       2020-03-17  6444  		 * getting out of sync with dirty tracking.
96b100cd1464ce arch/x86/kvm/vmx/vmx.c Paolo Bonzini       2020-03-17  6445  		 */
96b100cd1464ce arch/x86/kvm/vmx/vmx.c Paolo Bonzini       2020-03-17  6446  		nested_mark_vmcs12_pages_dirty(vcpu);
96b100cd1464ce arch/x86/kvm/vmx/vmx.c Paolo Bonzini       2020-03-17  6447  
cd0e615c49e5e5 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-12-07  6448  		/*
cd0e615c49e5e5 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-12-07  6449  		 * Synthesize a triple fault if L2 state is invalid.  In normal
cd0e615c49e5e5 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-12-07  6450  		 * operation, nested VM-Enter rejects any attempt to enter L2
cd0e615c49e5e5 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-12-07  6451  		 * with invalid state.  However, those checks are skipped if
cd0e615c49e5e5 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-12-07  6452  		 * state is being stuffed via RSM or KVM_SET_NESTED_STATE.  If
cd0e615c49e5e5 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-12-07  6453  		 * L2 state is invalid, it means either L1 modified SMRAM state
cd0e615c49e5e5 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-12-07  6454  		 * or userspace provided bad state.  Synthesize TRIPLE_FAULT as
cd0e615c49e5e5 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-12-07  6455  		 * doing so is architecturally allowed in the RSM case, and is
cd0e615c49e5e5 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-12-07  6456  		 * the least awful solution for the userspace case without
cd0e615c49e5e5 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-12-07  6457  		 * risking false positives.
cd0e615c49e5e5 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-12-07  6458  		 */
cd0e615c49e5e5 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-12-07  6459  		if (vmx->emulation_required) {
cd0e615c49e5e5 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-12-07  6460  			nested_vmx_vmexit(vcpu, EXIT_REASON_TRIPLE_FAULT, 0, 0);
cd0e615c49e5e5 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-12-07  6461  			return 1;
cd0e615c49e5e5 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-12-07  6462  		}
cd0e615c49e5e5 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-12-07  6463  
f47baaed4fef3e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-04-15  6464  		if (nested_vmx_reflect_vmexit(vcpu))
789afc5ccd4ef1 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-04-15  6465  			return 1;
96b100cd1464ce arch/x86/kvm/vmx/vmx.c Paolo Bonzini       2020-03-17  6466  	}
cbf712792b6e61 arch/x86/kvm/vmx.c     Radim Krčmář        2017-05-19  6467  
cd0e615c49e5e5 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-12-07  6468  	/* If guest state is invalid, start emulating.  L2 is handled above. */
cd0e615c49e5e5 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-12-07  6469  	if (vmx->emulation_required)
cd0e615c49e5e5 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-12-07  6470  		return handle_invalid_guest_state(vcpu);
cd0e615c49e5e5 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-12-07  6471  
8e53324021645f arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-11-06  6472  	if (exit_reason.failed_vmentry) {
0702a3cbbf735a arch/x86/kvm/vmx/vmx.c David Edmondson     2021-03-18  6473  		dump_vmcs(vcpu);
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6474  		vcpu->run->exit_reason = KVM_EXIT_FAIL_ENTRY;
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6475  		vcpu->run->fail_entry.hardware_entry_failure_reason
8e53324021645f arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-11-06  6476  			= exit_reason.full;
8a14fe4f0c54f2 arch/x86/kvm/vmx/vmx.c Jim Mattson         2020-06-03  6477  		vcpu->run->fail_entry.cpu = vcpu->arch.last_vmentry_cpu;
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6478  		return 0;
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6479  	}
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6480  
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6481  	if (unlikely(vmx->fail)) {
0702a3cbbf735a arch/x86/kvm/vmx/vmx.c David Edmondson     2021-03-18  6482  		dump_vmcs(vcpu);
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6483  		vcpu->run->exit_reason = KVM_EXIT_FAIL_ENTRY;
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6484  		vcpu->run->fail_entry.hardware_entry_failure_reason
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6485  			= vmcs_read32(VM_INSTRUCTION_ERROR);
8a14fe4f0c54f2 arch/x86/kvm/vmx/vmx.c Jim Mattson         2020-06-03  6486  		vcpu->run->fail_entry.cpu = vcpu->arch.last_vmentry_cpu;
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6487  		return 0;
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6488  	}
cbf712792b6e61 arch/x86/kvm/vmx.c     Radim Krčmář        2017-05-19  6489  
fca91f6d60b6ee arch/x86/kvm/vmx.c     Jim Mattson         2017-03-15  6490  	/*
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6491  	 * Note:
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6492  	 * Do not try to fix EXIT_REASON_EPT_MISCONFIG if it caused by
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6493  	 * delivery event since it indicates guest is accessing MMIO.
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6494  	 * The vm-exit can be triggered again after return to guest that
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6495  	 * will cause infinite loop.
fca91f6d60b6ee arch/x86/kvm/vmx.c     Jim Mattson         2017-03-15  6496  	 */
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6497  	if ((vectoring_info & VECTORING_INFO_VALID_MASK) &&
8e53324021645f arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-11-06  6498  	    (exit_reason.basic != EXIT_REASON_EXCEPTION_NMI &&
8e53324021645f arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-11-06  6499  	     exit_reason.basic != EXIT_REASON_EPT_VIOLATION &&
8e53324021645f arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-11-06  6500  	     exit_reason.basic != EXIT_REASON_PML_FULL &&
8e53324021645f arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-11-06  6501  	     exit_reason.basic != EXIT_REASON_APIC_ACCESS &&
2f4073e08f4cc5 arch/x86/kvm/vmx/vmx.c Tao Xu              2022-05-24  6502  	     exit_reason.basic != EXIT_REASON_TASK_SWITCH &&
2f4073e08f4cc5 arch/x86/kvm/vmx/vmx.c Tao Xu              2022-05-24  6503  	     exit_reason.basic != EXIT_REASON_NOTIFY)) {
04c4f2ee3f68c9 arch/x86/kvm/vmx/vmx.c Reiji Watanabe      2021-04-13  6504  		int ndata = 3;
04c4f2ee3f68c9 arch/x86/kvm/vmx/vmx.c Reiji Watanabe      2021-04-13  6505  
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6506  		vcpu->run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6507  		vcpu->run->internal.suberror = KVM_INTERNAL_ERROR_DELIVERY_EV;
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6508  		vcpu->run->internal.data[0] = vectoring_info;
8e53324021645f arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-11-06  6509  		vcpu->run->internal.data[1] = exit_reason.full;
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03 @6510  		vcpu->run->internal.data[2] = vcpu->arch.exit_qualification;
8e53324021645f arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-11-06  6511  		if (exit_reason.basic == EXIT_REASON_EPT_MISCONFIG) {
04c4f2ee3f68c9 arch/x86/kvm/vmx/vmx.c Reiji Watanabe      2021-04-13  6512  			vcpu->run->internal.data[ndata++] =
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6513  				vmcs_read64(GUEST_PHYSICAL_ADDRESS);
fca91f6d60b6ee arch/x86/kvm/vmx.c     Jim Mattson         2017-03-15  6514  		}
04c4f2ee3f68c9 arch/x86/kvm/vmx/vmx.c Reiji Watanabe      2021-04-13  6515  		vcpu->run->internal.data[ndata++] = vcpu->arch.last_vmentry_cpu;
04c4f2ee3f68c9 arch/x86/kvm/vmx/vmx.c Reiji Watanabe      2021-04-13  6516  		vcpu->run->internal.ndata = ndata;
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6517  		return 0;
63846663eac783 arch/x86/kvm/vmx.c     Nadav Har'El        2011-05-25  6518  	}
63846663eac783 arch/x86/kvm/vmx.c     Nadav Har'El        2011-05-25  6519  
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6520  	if (unlikely(!enable_vnmi &&
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6521  		     vmx->loaded_vmcs->soft_vnmi_blocked)) {
db438592807e05 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-04-22  6522  		if (!vmx_interrupt_blocked(vcpu)) {
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6523  			vmx->loaded_vmcs->soft_vnmi_blocked = 0;
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6524  		} else if (vmx->loaded_vmcs->vnmi_blocked_time > 1000000000LL &&
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6525  			   vcpu->arch.nmi_pending) {
4f2777bc97974b arch/x86/kvm/vmx.c     David Matlack       2016-07-13  6526  			/*
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6527  			 * This CPU don't support us in finding the end of an
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6528  			 * NMI-blocked window if the guest runs with IRQs
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6529  			 * disabled. So we pull the trigger after 1 s of
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6530  			 * futile waiting, but inform the user about this.
4f2777bc97974b arch/x86/kvm/vmx.c     David Matlack       2016-07-13  6531  			 */
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6532  			printk(KERN_WARNING "%s: Breaking out of NMI-blocked "
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6533  			       "state on VCPU %d after 1 s timeout\n",
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6534  			       __func__, vcpu->vcpu_id);
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6535  			vmx->loaded_vmcs->soft_vnmi_blocked = 0;
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6536  		}
63846663eac783 arch/x86/kvm/vmx.c     Nadav Har'El        2011-05-25  6537  	}
63846663eac783 arch/x86/kvm/vmx.c     Nadav Har'El        2011-05-25  6538  
404d5d7bff0d41 arch/x86/kvm/vmx/vmx.c Wanpeng Li          2020-04-28  6539  	if (exit_fastpath != EXIT_FASTPATH_NONE)
1e9e2622a149e8 arch/x86/kvm/vmx/vmx.c Wanpeng Li          2019-11-21  6540  		return 1;
c926f2f7230b1a arch/x86/kvm/vmx/vmx.c Marios Pomonis      2019-12-11  6541  
8e53324021645f arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-11-06  6542  	if (exit_reason.basic >= kvm_vmx_max_exit_handlers)
c926f2f7230b1a arch/x86/kvm/vmx/vmx.c Marios Pomonis      2019-12-11  6543  		goto unexpected_vmexit;
4289d2728664fc arch/x86/kvm/vmx/vmx.c Andrea Arcangeli    2019-11-04  6544  #ifdef CONFIG_RETPOLINE
8e53324021645f arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-11-06  6545  	if (exit_reason.basic == EXIT_REASON_MSR_WRITE)
4289d2728664fc arch/x86/kvm/vmx/vmx.c Andrea Arcangeli    2019-11-04  6546  		return kvm_emulate_wrmsr(vcpu);
8e53324021645f arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-11-06  6547  	else if (exit_reason.basic == EXIT_REASON_PREEMPTION_TIMER)
4289d2728664fc arch/x86/kvm/vmx/vmx.c Andrea Arcangeli    2019-11-04  6548  		return handle_preemption_timer(vcpu);
8e53324021645f arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-11-06  6549  	else if (exit_reason.basic == EXIT_REASON_INTERRUPT_WINDOW)
4289d2728664fc arch/x86/kvm/vmx/vmx.c Andrea Arcangeli    2019-11-04  6550  		return handle_interrupt_window(vcpu);
8e53324021645f arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-11-06  6551  	else if (exit_reason.basic == EXIT_REASON_EXTERNAL_INTERRUPT)
4289d2728664fc arch/x86/kvm/vmx/vmx.c Andrea Arcangeli    2019-11-04  6552  		return handle_external_interrupt(vcpu);
8e53324021645f arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-11-06  6553  	else if (exit_reason.basic == EXIT_REASON_HLT)
4289d2728664fc arch/x86/kvm/vmx/vmx.c Andrea Arcangeli    2019-11-04  6554  		return kvm_emulate_halt(vcpu);
8e53324021645f arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-11-06  6555  	else if (exit_reason.basic == EXIT_REASON_EPT_MISCONFIG)
4289d2728664fc arch/x86/kvm/vmx/vmx.c Andrea Arcangeli    2019-11-04  6556  		return handle_ept_misconfig(vcpu);
4289d2728664fc arch/x86/kvm/vmx/vmx.c Andrea Arcangeli    2019-11-04  6557  #endif
c926f2f7230b1a arch/x86/kvm/vmx/vmx.c Marios Pomonis      2019-12-11  6558  
8e53324021645f arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-11-06  6559  	exit_handler_index = array_index_nospec((u16)exit_reason.basic,
c926f2f7230b1a arch/x86/kvm/vmx/vmx.c Marios Pomonis      2019-12-11  6560  						kvm_vmx_max_exit_handlers);
8e53324021645f arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-11-06  6561  	if (!kvm_vmx_exit_handlers[exit_handler_index])
c926f2f7230b1a arch/x86/kvm/vmx/vmx.c Marios Pomonis      2019-12-11  6562  		goto unexpected_vmexit;
c926f2f7230b1a arch/x86/kvm/vmx/vmx.c Marios Pomonis      2019-12-11  6563  
8e53324021645f arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-11-06  6564  	return kvm_vmx_exit_handlers[exit_handler_index](vcpu);
c926f2f7230b1a arch/x86/kvm/vmx/vmx.c Marios Pomonis      2019-12-11  6565  
c926f2f7230b1a arch/x86/kvm/vmx/vmx.c Marios Pomonis      2019-12-11  6566  unexpected_vmexit:
8e53324021645f arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-11-06  6567  	vcpu_unimpl(vcpu, "vmx: unexpected exit reason 0x%x\n",
8e53324021645f arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-11-06  6568  		    exit_reason.full);
0702a3cbbf735a arch/x86/kvm/vmx/vmx.c David Edmondson     2021-03-18  6569  	dump_vmcs(vcpu);
7396d337cfadc7 arch/x86/kvm/vmx/vmx.c Liran Alon          2019-08-26  6570  	vcpu->run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
7396d337cfadc7 arch/x86/kvm/vmx/vmx.c Liran Alon          2019-08-26  6571  	vcpu->run->internal.suberror =
7396d337cfadc7 arch/x86/kvm/vmx/vmx.c Liran Alon          2019-08-26  6572  			KVM_INTERNAL_ERROR_UNEXPECTED_EXIT_REASON;
1aa561b1a4c0ae arch/x86/kvm/vmx/vmx.c Jim Mattson         2020-06-03  6573  	vcpu->run->internal.ndata = 2;
8e53324021645f arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-11-06  6574  	vcpu->run->internal.data[0] = exit_reason.full;
8a14fe4f0c54f2 arch/x86/kvm/vmx/vmx.c Jim Mattson         2020-06-03  6575  	vcpu->run->internal.data[1] = vcpu->arch.last_vmentry_cpu;
7396d337cfadc7 arch/x86/kvm/vmx/vmx.c Liran Alon          2019-08-26  6576  	return 0;
55d2375e58a61b arch/x86/kvm/vmx/vmx.c Sean Christopherson 2018-12-03  6577  }
63846663eac783 arch/x86/kvm/vmx.c     Nadav Har'El        2011-05-25  6578  

:::::: The code at line 6510 was first introduced by commit
:::::: 55d2375e58a61be072431dd3d3c8a320f4a4a01b KVM: nVMX: Move nested code to dedicated files

:::::: TO: Sean Christopherson <sean.j.christopherson@intel.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
