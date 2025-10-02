Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7F13C1F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Oct 2025 15:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759417400; cv=none; b=ZKbYAxDvKM45rSF8eAl/0zgF+CJkgkg1FW6J72XVd1SmcF/q1M56UQyqgBIfHOgVjM80ksUxBmE7BsrmG+qe/LyIhzZFTxGVVimvjHmXe67PsaCWsD6l3383ZLejVDY977hJfUoe6S/EzOigoOJMWdvVjODpr3CRV1b8tt/r6uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759417400; c=relaxed/simple;
	bh=7r4ilKb7rZ0PnX9WiGRAbE8ektKsRGTixRKVMCgiHF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mhL8bNFnkcOUXM0lCCgGd4pQ2I8U2xgzY0MxBD+H5QVUvc6QKnvlBezQkFPiFFcPQGXQGHMDVrvTgCdFab2ZCnGeo1KNB/Nz+V8nFqj/MeFzdvNYRbxwa7qsA6qv391+S3hKOCEFcMsIjU/9J5B5ZBXUv0rJsFWP+Za9DlkBsYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NMrnv+Fe; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NMrnv+Fe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759417399; x=1790953399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7r4ilKb7rZ0PnX9WiGRAbE8ektKsRGTixRKVMCgiHF8=;
  b=NMrnv+Fetniyh91SUGXn3fOynJBpgZVwjpnvXUhNujZynWgMaCYQVlRq
   bWV8njHz4Q0rQ6z+y6qqP7eCwWiUC1UL4ZEPlvcWFSu7JIqxAfN55Z/SL
   TbbkXMKp1XtQasggTzIQZKKugK8CFoEvKhxgxWNSdkPOsqzY135DagkEq
   VGu/WUBWHTi/X3pH+Z4PArpcIpZeoKtD/M9vS5oY8ZUZ9FZ5tMhdK/iaP
   BW0th9aEuoni0OfnvBOXVnYp6cW5b/5YXGRjGGofY73wIcls58ReKLElQ
   2ZGqwAdsdh8tiep2TNfMJkSF2CeqMg7VIjHKzPI/YVhkZESH2UJIUl6Lx
   Q==;
X-CSE-ConnectionGUID: +DY85VrDQAmqUsWemvHDfA==
X-CSE-MsgGUID: EIAZfgAnTIqq0wUfJ8+Mkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61412573"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="61412573"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 08:03:18 -0700
X-CSE-ConnectionGUID: glAJvZImSpSE3Qgtz8OJ3g==
X-CSE-MsgGUID: Dpa6TkqDR3WFWwTqpgAlEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="178167522"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Oct 2025 08:03:16 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4Kpu-0003st-15;
	Thu, 02 Oct 2025 15:03:14 +0000
Date: Thu, 2 Oct 2025 23:02:59 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Wang <wei.w.wang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Kai Huang <kai.huang@intel.com>
Subject: [intel-tdx:mig-dpamt-v3 56/97] arch/x86/kvm/x86.c:6999:37: warning:
 cast to pointer from integer of different size
Message-ID: <202510022211.TBpBiWdM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git mig-dpamt-v3
head:   365885765611aa7959870e2388dda12ce2126442
commit: ee47fd5c9471109b9fb20d3ada309b7836e5f639 [56/97] KVM: x86/cgm: Add KVM_CAP_CGM
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251002/202510022211.TBpBiWdM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251002/202510022211.TBpBiWdM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510022211.TBpBiWdM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/x86.c: In function 'kvm_vm_ioctl_enable_cap':
>> arch/x86/kvm/x86.c:6999:37: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    6999 |                 void __user *argp = (void __user *)cap->args[0];
         |                                     ^


vim +6999 arch/x86/kvm/x86.c

  6747	
  6748	int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
  6749				    struct kvm_enable_cap *cap)
  6750	{
  6751		int r;
  6752	
  6753		if (cap->flags)
  6754			return -EINVAL;
  6755	
  6756		switch (cap->cap) {
  6757		case KVM_CAP_DISABLE_QUIRKS2:
  6758			r = -EINVAL;
  6759			if (cap->args[0] & ~kvm_caps.supported_quirks)
  6760				break;
  6761			fallthrough;
  6762		case KVM_CAP_DISABLE_QUIRKS:
  6763			kvm->arch.disabled_quirks |= cap->args[0] & kvm_caps.supported_quirks;
  6764			r = 0;
  6765			break;
  6766		case KVM_CAP_SPLIT_IRQCHIP: {
  6767			mutex_lock(&kvm->lock);
  6768			r = -EINVAL;
  6769			if (cap->args[0] > MAX_NR_RESERVED_IOAPIC_PINS)
  6770				goto split_irqchip_unlock;
  6771			r = -EEXIST;
  6772			if (irqchip_in_kernel(kvm))
  6773				goto split_irqchip_unlock;
  6774			if (kvm->created_vcpus)
  6775				goto split_irqchip_unlock;
  6776			/* Pairs with irqchip_in_kernel. */
  6777			smp_wmb();
  6778			kvm->arch.irqchip_mode = KVM_IRQCHIP_SPLIT;
  6779			kvm->arch.nr_reserved_ioapic_pins = cap->args[0];
  6780			kvm_clear_apicv_inhibit(kvm, APICV_INHIBIT_REASON_ABSENT);
  6781			r = 0;
  6782	split_irqchip_unlock:
  6783			mutex_unlock(&kvm->lock);
  6784			break;
  6785		}
  6786		case KVM_CAP_X2APIC_API:
  6787			r = -EINVAL;
  6788			if (cap->args[0] & ~KVM_X2APIC_API_VALID_FLAGS)
  6789				break;
  6790	
  6791			if (cap->args[0] & KVM_X2APIC_API_USE_32BIT_IDS)
  6792				kvm->arch.x2apic_format = true;
  6793			if (cap->args[0] & KVM_X2APIC_API_DISABLE_BROADCAST_QUIRK)
  6794				kvm->arch.x2apic_broadcast_quirk_disabled = true;
  6795	
  6796			r = 0;
  6797			break;
  6798		case KVM_CAP_X86_DISABLE_EXITS:
  6799			r = -EINVAL;
  6800			if (cap->args[0] & ~kvm_get_allowed_disable_exits())
  6801				break;
  6802	
  6803			mutex_lock(&kvm->lock);
  6804			if (kvm->created_vcpus)
  6805				goto disable_exits_unlock;
  6806	
  6807	#define SMT_RSB_MSG "This processor is affected by the Cross-Thread Return Predictions vulnerability. " \
  6808			    "KVM_CAP_X86_DISABLE_EXITS should only be used with SMT disabled or trusted guests."
  6809	
  6810			if (!mitigate_smt_rsb && boot_cpu_has_bug(X86_BUG_SMT_RSB) &&
  6811			    cpu_smt_possible() &&
  6812			    (cap->args[0] & ~(KVM_X86_DISABLE_EXITS_PAUSE |
  6813					      KVM_X86_DISABLE_EXITS_APERFMPERF)))
  6814				pr_warn_once(SMT_RSB_MSG);
  6815	
  6816			kvm_disable_exits(kvm, cap->args[0]);
  6817			r = 0;
  6818	disable_exits_unlock:
  6819			mutex_unlock(&kvm->lock);
  6820			break;
  6821		case KVM_CAP_MSR_PLATFORM_INFO:
  6822			kvm->arch.guest_can_read_msr_platform_info = cap->args[0];
  6823			r = 0;
  6824			break;
  6825		case KVM_CAP_EXCEPTION_PAYLOAD:
  6826			kvm->arch.exception_payload_enabled = cap->args[0];
  6827			r = 0;
  6828			break;
  6829		case KVM_CAP_X86_TRIPLE_FAULT_EVENT:
  6830			kvm->arch.triple_fault_event = cap->args[0];
  6831			r = 0;
  6832			break;
  6833		case KVM_CAP_X86_USER_SPACE_MSR:
  6834			r = -EINVAL;
  6835			if (cap->args[0] & ~KVM_MSR_EXIT_REASON_VALID_MASK)
  6836				break;
  6837			kvm->arch.user_space_msr_mask = cap->args[0];
  6838			r = 0;
  6839			break;
  6840		case KVM_CAP_X86_BUS_LOCK_EXIT:
  6841			r = -EINVAL;
  6842			if (cap->args[0] & ~KVM_BUS_LOCK_DETECTION_VALID_MODE)
  6843				break;
  6844	
  6845			if ((cap->args[0] & KVM_BUS_LOCK_DETECTION_OFF) &&
  6846			    (cap->args[0] & KVM_BUS_LOCK_DETECTION_EXIT))
  6847				break;
  6848	
  6849			if (kvm_caps.has_bus_lock_exit &&
  6850			    cap->args[0] & KVM_BUS_LOCK_DETECTION_EXIT)
  6851				kvm->arch.bus_lock_detection_enabled = true;
  6852			r = 0;
  6853			break;
  6854	#ifdef CONFIG_X86_SGX_KVM
  6855		case KVM_CAP_SGX_ATTRIBUTE: {
  6856			unsigned long allowed_attributes = 0;
  6857	
  6858			r = sgx_set_attribute(&allowed_attributes, cap->args[0]);
  6859			if (r)
  6860				break;
  6861	
  6862			/* KVM only supports the PROVISIONKEY privileged attribute. */
  6863			if ((allowed_attributes & SGX_ATTR_PROVISIONKEY) &&
  6864			    !(allowed_attributes & ~SGX_ATTR_PROVISIONKEY))
  6865				kvm->arch.sgx_provisioning_allowed = true;
  6866			else
  6867				r = -EINVAL;
  6868			break;
  6869		}
  6870	#endif
  6871		case KVM_CAP_VM_COPY_ENC_CONTEXT_FROM:
  6872			r = -EINVAL;
  6873			if (!kvm_x86_ops.vm_copy_enc_context_from)
  6874				break;
  6875	
  6876			r = kvm_x86_call(vm_copy_enc_context_from)(kvm, cap->args[0]);
  6877			break;
  6878		case KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM:
  6879			r = -EINVAL;
  6880			if (!kvm_x86_ops.vm_move_enc_context_from)
  6881				break;
  6882	
  6883			r = kvm_x86_call(vm_move_enc_context_from)(kvm, cap->args[0]);
  6884			break;
  6885		case KVM_CAP_EXIT_HYPERCALL:
  6886			if (cap->args[0] & ~KVM_EXIT_HYPERCALL_VALID_MASK) {
  6887				r = -EINVAL;
  6888				break;
  6889			}
  6890			kvm->arch.hypercall_exit_enabled = cap->args[0];
  6891			r = 0;
  6892			break;
  6893		case KVM_CAP_EXIT_ON_EMULATION_FAILURE:
  6894			r = -EINVAL;
  6895			if (cap->args[0] & ~1)
  6896				break;
  6897			kvm->arch.exit_on_emulation_error = cap->args[0];
  6898			r = 0;
  6899			break;
  6900		case KVM_CAP_PMU_CAPABILITY:
  6901			r = -EINVAL;
  6902			if (!enable_pmu || (cap->args[0] & ~KVM_CAP_PMU_VALID_MASK))
  6903				break;
  6904	
  6905			mutex_lock(&kvm->lock);
  6906			if (!kvm->created_vcpus) {
  6907				kvm->arch.enable_pmu = !(cap->args[0] & KVM_PMU_CAP_DISABLE);
  6908				r = 0;
  6909			}
  6910			mutex_unlock(&kvm->lock);
  6911			break;
  6912		case KVM_CAP_MAX_VCPU_ID:
  6913			r = -EINVAL;
  6914			if (cap->args[0] > KVM_MAX_VCPU_IDS)
  6915				break;
  6916	
  6917			mutex_lock(&kvm->lock);
  6918			if (kvm->arch.bsp_vcpu_id > cap->args[0]) {
  6919				;
  6920			} else if (kvm->arch.max_vcpu_ids == cap->args[0]) {
  6921				r = 0;
  6922			} else if (!kvm->arch.max_vcpu_ids) {
  6923				kvm->arch.max_vcpu_ids = cap->args[0];
  6924				r = 0;
  6925			}
  6926			mutex_unlock(&kvm->lock);
  6927			break;
  6928		case KVM_CAP_X86_NOTIFY_VMEXIT:
  6929			r = -EINVAL;
  6930			if ((u32)cap->args[0] & ~KVM_X86_NOTIFY_VMEXIT_VALID_BITS)
  6931				break;
  6932			if (!kvm_caps.has_notify_vmexit)
  6933				break;
  6934			if (!((u32)cap->args[0] & KVM_X86_NOTIFY_VMEXIT_ENABLED))
  6935				break;
  6936			mutex_lock(&kvm->lock);
  6937			if (!kvm->created_vcpus) {
  6938				kvm->arch.notify_window = cap->args[0] >> 32;
  6939				kvm->arch.notify_vmexit_flags = (u32)cap->args[0];
  6940				r = 0;
  6941			}
  6942			mutex_unlock(&kvm->lock);
  6943			break;
  6944		case KVM_CAP_VM_DISABLE_NX_HUGE_PAGES:
  6945			r = -EINVAL;
  6946	
  6947			/*
  6948			 * Since the risk of disabling NX hugepages is a guest crashing
  6949			 * the system, ensure the userspace process has permission to
  6950			 * reboot the system.
  6951			 *
  6952			 * Note that unlike the reboot() syscall, the process must have
  6953			 * this capability in the root namespace because exposing
  6954			 * /dev/kvm into a container does not limit the scope of the
  6955			 * iTLB multihit bug to that container. In other words,
  6956			 * this must use capable(), not ns_capable().
  6957			 */
  6958			if (!capable(CAP_SYS_BOOT)) {
  6959				r = -EPERM;
  6960				break;
  6961			}
  6962	
  6963			if (cap->args[0])
  6964				break;
  6965	
  6966			mutex_lock(&kvm->lock);
  6967			if (!kvm->created_vcpus) {
  6968				kvm->arch.disable_nx_huge_pages = true;
  6969				r = 0;
  6970			}
  6971			mutex_unlock(&kvm->lock);
  6972			break;
  6973		case KVM_CAP_X86_APIC_BUS_CYCLES_NS: {
  6974			u64 bus_cycle_ns = cap->args[0];
  6975			u64 unused;
  6976	
  6977			/*
  6978			 * Guard against overflow in tmict_to_ns(). 128 is the highest
  6979			 * divide value that can be programmed in APIC_TDCR.
  6980			 */
  6981			r = -EINVAL;
  6982			if (!bus_cycle_ns ||
  6983			    check_mul_overflow((u64)U32_MAX * 128, bus_cycle_ns, &unused))
  6984				break;
  6985	
  6986			r = 0;
  6987			mutex_lock(&kvm->lock);
  6988			if (!irqchip_in_kernel(kvm))
  6989				r = -ENXIO;
  6990			else if (kvm->created_vcpus)
  6991				r = -EINVAL;
  6992			else
  6993				kvm->arch.apic_bus_cycle_ns = bus_cycle_ns;
  6994			mutex_unlock(&kvm->lock);
  6995			break;
  6996		}
  6997		case KVM_CAP_CGM: {
  6998			struct kvm_cap_cgm cap_cgm;
> 6999			void __user *argp = (void __user *)cap->args[0];
  7000	
  7001			r = -EINVAL;
  7002			if (!kvm_x86_ops.cgm_enable_cap)
  7003				break;
  7004	
  7005			r = -EFAULT;
  7006			if (copy_from_user(&cap_cgm, argp, sizeof(struct kvm_cap_cgm)))
  7007				break;
  7008	
  7009			r = static_call(kvm_x86_cgm_enable_cap)(kvm, &cap_cgm);
  7010			if (r)
  7011				break;
  7012	
  7013			r = -EFAULT;
  7014			if (copy_to_user(argp, &cap_cgm, sizeof(struct kvm_cap_cgm)))
  7015				break;
  7016			r = 0;
  7017			break;
  7018		}
  7019		default:
  7020			r = -EINVAL;
  7021			break;
  7022		}
  7023		return r;
  7024	}
  7025	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
