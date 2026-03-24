Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37513537F7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 20:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774384636; cv=none; b=pOuoAsuBFYqYNm1qVYLUjCJ6YuvLKoNZKCe3pb17ixVJG0S4WyUkwC7s7457TSUszzdTYC2S1eFySpUefD2dfwsTjx5E2aRxKOVHAAO2eMLsXPKOhp+Yd5uQvQSGeqagByMan/dLV+eT8Iqq/vyMUOs3pDpLg6riDlgAv2pjr/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774384636; c=relaxed/simple;
	bh=/ctgdXNo8o/fQoZInUUONe+m7x/YRd4pccnzBzuiqwY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FPpzr+ELT5dQypUR7JqC2kab4sGvaPtGU2hvVHztLfxY7Mt31MTqgdyMkGs9kRiBrTSDVwZwRrcDsZzBobki4UmrJWdMTxwIf81cOmqiW+YM9F5z2doc/KYSvq6ZNyK06A1O30Q74mnxrD33ecF8CFb0/SBVVjojOS05RsblBBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BX4EmxZ4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BX4EmxZ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774384634; x=1805920634;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/ctgdXNo8o/fQoZInUUONe+m7x/YRd4pccnzBzuiqwY=;
  b=BX4EmxZ4CiTxdGTOoBVF/ZYGo8shnz7zAKoUL3w2keaZYbo+XBjARMf2
   GuZ7JsA/XARcf1+2M9USDWi2GDERjWNWXWV8RxkAp3MvCteimsbphwHFa
   M7nrNPTjlom/P4EwuCrtxCoSnqRvsdDQQXfclngToE5W/UTQJXjqLBnoV
   BHLieF+yVA1J4ZW+1sgC6Oc+aBeBLTTyxxv+XgCtiNj9A6cEDsiTpTCs3
   U0qKPxjYSMrjjWEs7ZbXLAoJoF85EnBgoB/fbfaWEzURid3eujJQ3mEpJ
   NE1w3g88QUs2hWmv2/drYOjnSTS3jxswKnn2130bPzOeBAom7IPPANiIO
   A==;
X-CSE-ConnectionGUID: Idlj0M9fSnS2bP8b4msr+Q==
X-CSE-MsgGUID: LFCaKX6RT2q0eSlKASQ1SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86030714"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86030714"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 13:37:13 -0700
X-CSE-ConnectionGUID: puh5N8v+SiqcEashU3mRfA==
X-CSE-MsgGUID: I57U0z0KSa2OCiB13WjsfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224420886"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Mar 2026 13:37:10 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w58Uu-000000005PZ-0ii9;
	Tue, 24 Mar 2026 20:37:08 +0000
Date: Wed, 25 Mar 2026 04:36:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 arch/x86/kvm/pkvm/../vmx/vmx.c:5605:6: warning: variable 'vect_info' set but
 not used
Message-ID: <202603250433.acqDOshu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   1615510160bbb9f512f4e4e2125b1a80e78f84a3
commit: 21fa7eff6312c8696a8161d871b049845003e74c [1/1] ANDROID: pKVM: VMX: =
Handle EXIT_REASON_EXCEPTION_NMI
config: x86_64-randconfig-r063-20260325 (https://download.01.org/0day-ci/ar=
chive/20260325/202603250433.acqDOshu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260325/202603250433.acqDOshu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603250433.acqDOshu-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/pkvm/../vmx/vmx.c:5605:6: warning: variable 'vect_info' set=
 but not used [-Wunused-but-set-variable]
    5605 |         u32 vect_info;
         |             ^
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_SCU
   Depends on [n]: X86_PLATFORM_DEVICES [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_X86_CONFIGS [=3Dy] && X86 [=3Dy]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for DRM_PRIVACY_SCREEN
   Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=3Dy] && X86 [=3Dy]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=3Dy] && CAN_DEV [=3Dn] && CAN_NETLINK [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=3Dy]


vim +/vect_info +5605 arch/x86/kvm/pkvm/../vmx/vmx.c

d62c02af7a96c8 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2024-09-30  5596 =
=20
95b5a48c4f2b77 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2019-04-19  5597 =
 static int handle_exception_nmi(struct kvm_vcpu *vcpu)
6aa8b732ca01c3 drivers/kvm/vmx.c      Avi Kivity          2006-12-10  5598 =
 {
1155f76a8166ae drivers/kvm/vmx.c      Avi Kivity          2007-11-22  5599 =
 	struct vcpu_vmx *vmx =3D to_vmx(vcpu);
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5600 =
 #ifndef __PKVM_HYP__
851ba6922ac575 arch/x86/kvm/vmx.c     Avi Kivity          2009-08-24  5601 =
 	struct kvm_run *kvm_run =3D vcpu->run;
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5602 =
 #endif
d0bfb940ecabf0 arch/x86/kvm/vmx.c     Jan Kiszka          2008-12-15  5603 =
 	u32 intr_info, ex_no, error_code;
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5604 =
 	unsigned long dr6;
6aa8b732ca01c3 drivers/kvm/vmx.c      Avi Kivity          2006-12-10 @5605 =
 	u32 vect_info;
6aa8b732ca01c3 drivers/kvm/vmx.c      Avi Kivity          2006-12-10  5606 =
=20
1155f76a8166ae drivers/kvm/vmx.c      Avi Kivity          2007-11-22  5607 =
 	vect_info =3D vmx->idt_vectoring_info;
f27ad73a6ef791 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-04-27  5608 =
 	intr_info =3D vmx_get_intr_info(vcpu);
6aa8b732ca01c3 drivers/kvm/vmx.c      Avi Kivity          2006-12-10  5609 =
=20
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5610 =
 	/* The MC and NMI will be handled by the host. */
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5611 =
 #ifndef __PKVM_HYP__
11df586d774f4a arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-12-13  5612 =
 	/*
11df586d774f4a arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-12-13  5613 =
 	 * Machine checks are handled by handle_exception_irqoff(), or by
11df586d774f4a arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-12-13  5614 =
 	 * vmx_vcpu_run() if a #MC occurs on VM-Entry.  NMIs are handled by
11df586d774f4a arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-12-13  5615 =
 	 * vmx_vcpu_enter_exit().
11df586d774f4a arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-12-13  5616 =
 	 */
2ea72039808d50 arch/x86/kvm/vmx/vmx.c Paolo Bonzini       2019-06-06  5617 =
 	if (is_machine_check(intr_info) || is_nmi(intr_info))
11df586d774f4a arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-12-13  5618 =
 		return 1;
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5619 =
 #endif
2ab455ccceb079 drivers/kvm/vmx.c      Anthony Liguori     2007-04-27  5620 =
=20
ec5be88ab29fd9 arch/x86/kvm/vmx/vmx.c Jing Liu            2022-01-05  5621 =
 	/*
ec5be88ab29fd9 arch/x86/kvm/vmx/vmx.c Jing Liu            2022-01-05  5622 =
 	 * Queue the exception here instead of in handle_nm_fault_irqoff().
ec5be88ab29fd9 arch/x86/kvm/vmx/vmx.c Jing Liu            2022-01-05  5623 =
 	 * This ensures the nested_vmx check is not skipped so vmexit can
ec5be88ab29fd9 arch/x86/kvm/vmx/vmx.c Jing Liu            2022-01-05  5624 =
 	 * be reflected to L1 (when it intercepts #NM) before reaching this
ec5be88ab29fd9 arch/x86/kvm/vmx/vmx.c Jing Liu            2022-01-05  5625 =
 	 * point.
ec5be88ab29fd9 arch/x86/kvm/vmx/vmx.c Jing Liu            2022-01-05  5626 =
 	 */
ec5be88ab29fd9 arch/x86/kvm/vmx/vmx.c Jing Liu            2022-01-05  5627 =
 	if (is_nm_fault(intr_info)) {
d62c02af7a96c8 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2024-09-30  5628 =
 		kvm_queue_exception_p(vcpu, NM_VECTOR,
d62c02af7a96c8 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2024-09-30  5629 =
 				      is_xfd_nm_fault(vcpu) ? vcpu->arch.guest_fpu.xfd_err : 0);
ec5be88ab29fd9 arch/x86/kvm/vmx/vmx.c Jing Liu            2022-01-05  5630 =
 		return 1;
ec5be88ab29fd9 arch/x86/kvm/vmx/vmx.c Jing Liu            2022-01-05  5631 =
 	}
ec5be88ab29fd9 arch/x86/kvm/vmx/vmx.c Jing Liu            2022-01-05  5632 =
=20
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5633 =
 	/*
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5634 =
 	 * The pKVM hypervisor doesn't intercept #UD for pVM. For npVM, this
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5635 =
 	 * can be handled by the host.
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5636 =
 	 */
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5637 =
 #ifndef __PKVM_HYP__
082d06edab49f3 arch/x86/kvm/vmx.c     Wanpeng Li          2018-04-03  5638 =
 	if (is_invalid_opcode(intr_info))
082d06edab49f3 arch/x86/kvm/vmx.c     Wanpeng Li          2018-04-03  5639 =
 		return handle_ud(vcpu);
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5640 =
 #endif
7aa81cc04781b5 drivers/kvm/vmx.c      Anthony Liguori     2007-09-17  5641 =
=20
743f1773366461 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2024-05-17  5642 =
 	if (WARN_ON_ONCE(is_ve_fault(intr_info))) {
bca99c0356524a arch/x86/kvm/vmx/vmx.c Sean Christopherson 2024-05-17  5643 =
 		struct vmx_ve_information *ve_info =3D vmx->ve_info;
bca99c0356524a arch/x86/kvm/vmx/vmx.c Sean Christopherson 2024-05-17  5644 =
=20
bca99c0356524a arch/x86/kvm/vmx/vmx.c Sean Christopherson 2024-05-17  5645 =
 		WARN_ONCE(ve_info->exit_reason !=3D EXIT_REASON_EPT_VIOLATION,
bca99c0356524a arch/x86/kvm/vmx/vmx.c Sean Christopherson 2024-05-17  5646 =
 			  "Unexpected #VE on VM-Exit reason 0x%x", ve_info->exit_reason);
743f1773366461 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2024-05-17  5647 =
 		dump_vmcs(vcpu);
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5648 =
 #ifndef __PKVM_HYP__
bca99c0356524a arch/x86/kvm/vmx/vmx.c Sean Christopherson 2024-05-17  5649 =
 		kvm_mmu_print_sptes(vcpu, ve_info->guest_physical_address, "#VE");
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5650 =
 #endif
40e8a6901a2c98 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2024-05-17  5651 =
 		return 1;
743f1773366461 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2024-05-17  5652 =
 	}
8131cf5b4fd8c5 arch/x86/kvm/vmx/vmx.c Isaku Yamahata      2024-01-22  5653 =
=20
6aa8b732ca01c3 drivers/kvm/vmx.c      Avi Kivity          2006-12-10  5654 =
 	error_code =3D 0;
2e11384c2c6f1c arch/x86/kvm/vmx.c     Ryan Harper         2008-02-11  5655 =
 	if (intr_info & INTR_INFO_DELIVER_CODE_MASK)
6aa8b732ca01c3 drivers/kvm/vmx.c      Avi Kivity          2006-12-10  5656 =
 		error_code =3D vmcs_read32(VM_EXIT_INTR_ERROR_CODE);
bf4ca23ef597a4 arch/x86/kvm/vmx.c     Xiao Guangrong      2012-10-17  5657 =
=20
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5658 =
 	/*
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5659 =
 	 * The pKVM hypervisor has disabled enable_vmware_backdoor thus #GP will
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5660 =
 	 * not be intercepted for pVM and npVM.
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5661 =
 	 *
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5662 =
 	 * #PF is only intercepted for npVM, which can be handled by the host.
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5663 =
 	 */
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5664 =
 #ifndef __PKVM_HYP__
9e86948041f2ec arch/x86/kvm/vmx.c     Liran Alon          2018-03-12  5665 =
 	if (!vmx->rmode.vm86_active && is_gp_fault(intr_info)) {
9e86948041f2ec arch/x86/kvm/vmx.c     Liran Alon          2018-03-12  5666 =
 		WARN_ON_ONCE(!enable_vmware_backdoor);
a6c6ed1e81060e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2019-08-27  5667 =
=20
a6c6ed1e81060e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2019-08-27  5668 =
 		/*
a6c6ed1e81060e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2019-08-27  5669 =
 		 * VMware backdoor emulation on #GP interception only handles
a6c6ed1e81060e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2019-08-27  5670 =
 		 * IN{S}, OUT{S}, and RDPMC, none of which generate a non-zero
a6c6ed1e81060e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2019-08-27  5671 =
 		 * error code on #GP.
a6c6ed1e81060e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2019-08-27  5672 =
 		 */
a6c6ed1e81060e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2019-08-27  5673 =
 		if (error_code) {
a6c6ed1e81060e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2019-08-27  5674 =
 			kvm_queue_exception_e(vcpu, GP_VECTOR, error_code);
a6c6ed1e81060e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2019-08-27  5675 =
 			return 1;
a6c6ed1e81060e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2019-08-27  5676 =
 		}
60fc3d02d5b882 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2019-08-27  5677 =
 		return kvm_emulate_instruction(vcpu, EMULTYPE_VMWARE_GP);
9e86948041f2ec arch/x86/kvm/vmx.c     Liran Alon          2018-03-12  5678 =
 	}
9e86948041f2ec arch/x86/kvm/vmx.c     Liran Alon          2018-03-12  5679 =
=20
bf4ca23ef597a4 arch/x86/kvm/vmx.c     Xiao Guangrong      2012-10-17  5680 =
 	/*
bf4ca23ef597a4 arch/x86/kvm/vmx.c     Xiao Guangrong      2012-10-17  5681 =
 	 * The #PF with PFEC.RSVD =3D 1 indicates the guest is accessing
bf4ca23ef597a4 arch/x86/kvm/vmx.c     Xiao Guangrong      2012-10-17  5682 =
 	 * MMIO, it is better to report an internal error.
bf4ca23ef597a4 arch/x86/kvm/vmx.c     Xiao Guangrong      2012-10-17  5683 =
 	 * See the comments in vmx_handle_exit.
bf4ca23ef597a4 arch/x86/kvm/vmx.c     Xiao Guangrong      2012-10-17  5684 =
 	 */
bf4ca23ef597a4 arch/x86/kvm/vmx.c     Xiao Guangrong      2012-10-17  5685 =
 	if ((vect_info & VECTORING_INFO_VALID_MASK) &&
bf4ca23ef597a4 arch/x86/kvm/vmx.c     Xiao Guangrong      2012-10-17  5686 =
 	    !(is_page_fault(intr_info) && !(error_code & PFERR_RSVD_MASK))) {
bf4ca23ef597a4 arch/x86/kvm/vmx.c     Xiao Guangrong      2012-10-17  5687 =
 		vcpu->run->exit_reason =3D KVM_EXIT_INTERNAL_ERROR;
bf4ca23ef597a4 arch/x86/kvm/vmx.c     Xiao Guangrong      2012-10-17  5688 =
 		vcpu->run->internal.suberror =3D KVM_INTERNAL_ERROR_SIMUL_EX;
1aa561b1a4c0ae arch/x86/kvm/vmx/vmx.c Jim Mattson         2020-06-03  5689 =
 		vcpu->run->internal.ndata =3D 4;
bf4ca23ef597a4 arch/x86/kvm/vmx.c     Xiao Guangrong      2012-10-17  5690 =
 		vcpu->run->internal.data[0] =3D vect_info;
bf4ca23ef597a4 arch/x86/kvm/vmx.c     Xiao Guangrong      2012-10-17  5691 =
 		vcpu->run->internal.data[1] =3D intr_info;
80f0e95d1b2216 arch/x86/kvm/vmx.c     Radim Kr=C4=8Dm=C3=A1=C5=99        20=
15-04-02  5692  		vcpu->run->internal.data[2] =3D error_code;
8a14fe4f0c54f2 arch/x86/kvm/vmx/vmx.c Jim Mattson         2020-06-03  5693 =
 		vcpu->run->internal.data[3] =3D vcpu->arch.last_vmentry_cpu;
bf4ca23ef597a4 arch/x86/kvm/vmx.c     Xiao Guangrong      2012-10-17  5694 =
 		return 0;
bf4ca23ef597a4 arch/x86/kvm/vmx.c     Xiao Guangrong      2012-10-17  5695 =
 	}
bf4ca23ef597a4 arch/x86/kvm/vmx.c     Xiao Guangrong      2012-10-17  5696 =
=20
6aa8b732ca01c3 drivers/kvm/vmx.c      Avi Kivity          2006-12-10  5697 =
 	if (is_page_fault(intr_info)) {
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5698 =
 		unsigned long cr2 =3D vmx_get_exit_qual(vcpu);
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5699 =
=20
1dbf5d68af6ffd arch/x86/kvm/vmx/vmx.c Mohammed Gamal      2020-07-10  5700 =
 		if (enable_ept && !vcpu->arch.apf.host_apf_flags) {
1dbf5d68af6ffd arch/x86/kvm/vmx/vmx.c Mohammed Gamal      2020-07-10  5701 =
 			/*
1dbf5d68af6ffd arch/x86/kvm/vmx/vmx.c Mohammed Gamal      2020-07-10  5702 =
 			 * EPT will cause page fault only if we need to
1dbf5d68af6ffd arch/x86/kvm/vmx/vmx.c Mohammed Gamal      2020-07-10  5703 =
 			 * detect illegal GPAs.
1dbf5d68af6ffd arch/x86/kvm/vmx/vmx.c Mohammed Gamal      2020-07-10  5704 =
 			 */
b96e6506c2ea7c arch/x86/kvm/vmx/vmx.c Mohammed Gamal      2020-09-03  5705 =
 			WARN_ON_ONCE(!allow_smaller_maxphyaddr);
1dbf5d68af6ffd arch/x86/kvm/vmx/vmx.c Mohammed Gamal      2020-07-10  5706 =
 			kvm_fixup_and_inject_pf_error(vcpu, cr2, error_code);
1dbf5d68af6ffd arch/x86/kvm/vmx/vmx.c Mohammed Gamal      2020-07-10  5707 =
 			return 1;
1dbf5d68af6ffd arch/x86/kvm/vmx/vmx.c Mohammed Gamal      2020-07-10  5708 =
 		} else
d0006530576f1c arch/x86/kvm/vmx.c     Paolo Bonzini       2017-08-11  5709 =
 			return kvm_handle_page_fault(vcpu, error_code, cr2, NULL, 0);
6aa8b732ca01c3 drivers/kvm/vmx.c      Avi Kivity          2006-12-10  5710 =
 	}
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5711 =
 #endif
6aa8b732ca01c3 drivers/kvm/vmx.c      Avi Kivity          2006-12-10  5712 =
=20
d0bfb940ecabf0 arch/x86/kvm/vmx.c     Jan Kiszka          2008-12-15  5713 =
 	ex_no =3D intr_info & INTR_INFO_VECTOR_MASK;
0ca1b4f4ba3a9f arch/x86/kvm/vmx.c     Gleb Natapov        2012-12-20  5714 =
=20
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5715 =
 	/*
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5716 =
 	 * The pKVM hypervisor requires to enable unrestricted guest feature
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5717 =
 	 * thus vm86_active won't be set and no rmode exception to be handled.
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5718 =
 	 */
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5719 =
 #ifndef __PKVM_HYP__
0ca1b4f4ba3a9f arch/x86/kvm/vmx.c     Gleb Natapov        2012-12-20  5720 =
 	if (vmx->rmode.vm86_active && rmode_exception(vcpu, ex_no))
0ca1b4f4ba3a9f arch/x86/kvm/vmx.c     Gleb Natapov        2012-12-20  5721 =
 		return handle_rmode_exception(vcpu, ex_no, error_code);
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5722 =
 #endif
0ca1b4f4ba3a9f arch/x86/kvm/vmx.c     Gleb Natapov        2012-12-20  5723 =
=20
42dbaa5a057736 arch/x86/kvm/vmx.c     Jan Kiszka          2008-12-15  5724 =
 	switch (ex_no) {
42dbaa5a057736 arch/x86/kvm/vmx.c     Jan Kiszka          2008-12-15  5725 =
 	case DB_VECTOR:
5addc235199f15 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-04-15  5726 =
 		dr6 =3D vmx_get_exit_qual(vcpu);
42dbaa5a057736 arch/x86/kvm/vmx.c     Jan Kiszka          2008-12-15  5727 =
 		if (!(vcpu->guest_debug &
42dbaa5a057736 arch/x86/kvm/vmx.c     Jan Kiszka          2008-12-15  5728 =
 		      (KVM_GUESTDBG_SINGLESTEP | KVM_GUESTDBG_USE_HW_BP))) {
b9bed78e2fa957 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-01-20  5729 =
 			/*
b9bed78e2fa957 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-01-20  5730 =
 			 * If the #DB was due to ICEBP, a.k.a. INT1, skip the
b9bed78e2fa957 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-01-20  5731 =
 			 * instruction.  ICEBP generates a trap-like #DB, but
b9bed78e2fa957 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-01-20  5732 =
 			 * despite its interception control being tied to #DB,
b9bed78e2fa957 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-01-20  5733 =
 			 * is an instruction intercept, i.e. the VM-Exit occurs
65ec8f01beb62f arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-08-30  5734 =
 			 * on the ICEBP itself.  Use the inner "skip" helper to
65ec8f01beb62f arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-08-30  5735 =
 			 * avoid single-step #DB and MTF updates, as ICEBP is
65ec8f01beb62f arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-08-30  5736 =
 			 * higher priority.  Note, skipping ICEBP still clears
65ec8f01beb62f arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-08-30  5737 =
 			 * STI and MOVSS blocking.
b9bed78e2fa957 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-01-20  5738 =
 			 *
b9bed78e2fa957 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-01-20  5739 =
 			 * For all other #DBs, set vmcs.PENDING_DBG_EXCEPTIONS.BS
b9bed78e2fa957 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-01-20  5740 =
 			 * if single-step is enabled in RFLAGS and STI or MOVSS
b9bed78e2fa957 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-01-20  5741 =
 			 * blocking is active, as the CPU doesn't set the bit
b9bed78e2fa957 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-01-20  5742 =
 			 * on VM-Exit due to #DB interception.  VM-Entry has a
b9bed78e2fa957 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-01-20  5743 =
 			 * consistency check that a single-step #DB is pending
b9bed78e2fa957 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-01-20  5744 =
 			 * in this scenario as the previous instruction cannot
b9bed78e2fa957 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-01-20  5745 =
 			 * have toggled RFLAGS.TF 0=3D>1 (because STI and POP/MOV
b9bed78e2fa957 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-01-20  5746 =
 			 * don't modify RFLAGS), therefore the one instruction
b9bed78e2fa957 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-01-20  5747 =
 			 * delay when activating single-step breakpoints must
b9bed78e2fa957 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-01-20  5748 =
 			 * have already expired.  Note, the CPU sets/clears BS
b9bed78e2fa957 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-01-20  5749 =
 			 * as appropriate for all other VM-Exits types.
b9bed78e2fa957 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-01-20  5750 =
 			 */
32d43cd391bacb arch/x86/kvm/vmx.c     Linus Torvalds      2018-03-20  5751 =
 			if (is_icebp(intr_info))
1957aa63be5395 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2019-08-27  5752 =
 				WARN_ON(!skip_emulated_instruction(vcpu));
b9bed78e2fa957 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-01-20  5753 =
 			else if ((vmx_get_rflags(vcpu) & X86_EFLAGS_TF) &&
b9bed78e2fa957 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-01-20  5754 =
 				 (vmcs_read32(GUEST_INTERRUPTIBILITY_INFO) &
b9bed78e2fa957 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-01-20  5755 =
 				  (GUEST_INTR_STATE_STI | GUEST_INTR_STATE_MOV_SS)))
b9bed78e2fa957 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-01-20  5756 =
 				vmcs_writel(GUEST_PENDING_DBG_EXCEPTIONS,
b9bed78e2fa957 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2022-01-20  5757 =
 					    vmcs_readl(GUEST_PENDING_DBG_EXCEPTIONS) | DR6_BS);
fd2a445a94d2ab arch/x86/kvm/vmx.c     Huw Davies          2014-04-16  5758 =
=20
4d5523cfd5d298 arch/x86/kvm/vmx/vmx.c Paolo Bonzini       2020-05-05  5759 =
 			kvm_queue_exception_p(vcpu, DB_VECTOR, dr6);
42dbaa5a057736 arch/x86/kvm/vmx.c     Jan Kiszka          2008-12-15  5760 =
 			return 1;
42dbaa5a057736 arch/x86/kvm/vmx.c     Jan Kiszka          2008-12-15  5761 =
 		}
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5762 =
 #ifndef __PKVM_HYP__
9a3ecd5e2aa10a arch/x86/kvm/vmx/vmx.c Chenyi Qiang        2021-02-02  5763 =
 		kvm_run->debug.arch.dr6 =3D dr6 | DR6_ACTIVE_LOW;
42dbaa5a057736 arch/x86/kvm/vmx.c     Jan Kiszka          2008-12-15  5764 =
 		kvm_run->debug.arch.dr7 =3D vmcs_readl(GUEST_DR7);
df561f6688fef7 arch/x86/kvm/vmx/vmx.c Gustavo A. R. Silva 2020-08-23  5765 =
 		fallthrough;
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5766 =
 #else
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5767 =
 		/*
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5768 =
 		 * The #DB caused by KVM_GUESTDBG_SINGLESTEP or
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5769 =
 		 * KVM_GUESTDBG_USE_HW_BP needs to be handled by exiting to the
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5770 =
 		 * user space VMM in the host side, which should be done by the
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5771 =
 		 * host.
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5772 =
 		 */
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5773 =
 		break;
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5774 =
 #endif
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5775 =
 		/*
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5776 =
 		 * The #BP is not intercepted for pVM but only npVM. It is
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5777 =
 		 * handled by exiting to the user space VMM, which should be
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5778 =
 		 * done by the host.
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5779 =
 		 */
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5780 =
 #ifndef __PKVM_HYP__
42dbaa5a057736 arch/x86/kvm/vmx.c     Jan Kiszka          2008-12-15  5781 =
 	case BP_VECTOR:
c573cd22939e54 arch/x86/kvm/vmx.c     Jan Kiszka          2010-02-23  5782 =
 		/*
c573cd22939e54 arch/x86/kvm/vmx.c     Jan Kiszka          2010-02-23  5783 =
 		 * Update instruction length as we may reinject #BP from
c573cd22939e54 arch/x86/kvm/vmx.c     Jan Kiszka          2010-02-23  5784 =
 		 * user space while in guest debugging mode. Reading it for
c573cd22939e54 arch/x86/kvm/vmx.c     Jan Kiszka          2010-02-23  5785 =
 		 * #DB as well causes no harm, it is not used in that case.
c573cd22939e54 arch/x86/kvm/vmx.c     Jan Kiszka          2010-02-23  5786 =
 		 */
c573cd22939e54 arch/x86/kvm/vmx.c     Jan Kiszka          2010-02-23  5787 =
 		vmx->vcpu.arch.event_exit_inst_len =3D
c573cd22939e54 arch/x86/kvm/vmx.c     Jan Kiszka          2010-02-23  5788 =
 			vmcs_read32(VM_EXIT_INSTRUCTION_LEN);
6aa8b732ca01c3 drivers/kvm/vmx.c      Avi Kivity          2006-12-10  5789 =
 		kvm_run->exit_reason =3D KVM_EXIT_DEBUG;
e87e46d5f3182f arch/x86/kvm/vmx/vmx.c Yuan Yao            2021-05-26  5790 =
 		kvm_run->debug.arch.pc =3D kvm_get_linear_rip(vcpu);
d0bfb940ecabf0 arch/x86/kvm/vmx.c     Jan Kiszka          2008-12-15  5791 =
 		kvm_run->debug.arch.exception =3D ex_no;
42dbaa5a057736 arch/x86/kvm/vmx.c     Jan Kiszka          2008-12-15  5792 =
 		break;
21fa7eff6312c8 arch/x86/kvm/vmx/vmx.c Chuanxiao Dong      2025-10-29  5793 =
 #endif
e6f8b6c12f0381 arch/x86/kvm/vmx/vmx.c Xiaoyao Li          2020-04-10  5794 =
 	case AC_VECTOR:
b33bb78a1fada6 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2021-06-22  5795 =
 		if (vmx_guest_inject_ac(vcpu)) {
e6f8b6c12f0381 arch/x86/kvm/vmx/vmx.c Xiaoyao Li          2020-04-10  5796 =
 			kvm_queue_exception_e(vcpu, AC_VECTOR, error_code);
e6f8b6c12f0381 arch/x86/kvm/vmx/vmx.c Xiaoyao Li          2020-04-10  5797 =
 			return 1;
e6f8b6c12f0381 arch/x86/kvm/vmx/vmx.c Xiaoyao Li          2020-04-10  5798 =
 		}
e6f8b6c12f0381 arch/x86/kvm/vmx/vmx.c Xiaoyao Li          2020-04-10  5799 =
=20

:::::: The code at line 5605 was first introduced by commit
:::::: 6aa8b732ca01c3d7a54e93f4d701b8aabbe60fb7 [PATCH] kvm: userspace inte=
rface

:::::: TO: Avi Kivity <avi@qumranet.com>
:::::: CC: Linus Torvalds <torvalds@woody.osdl.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
