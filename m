Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECD92DA771
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 19:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770494278; cv=none; b=W0hB/3h7c0uqtmAuoEm1hU6S2f5TLeUhKNEX2OwFJ3/lEMsnCc53J97sggMeWDoVnL1Fkp+nesWGK/Y98Emxylgd/eNkpvWn8uCpAZrbykdFEirhuhqnIymnOZwqancrKky/YscRAjWL1hCI1KQFDsxP1qIjk0Ly90xpiX8UD/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770494278; c=relaxed/simple;
	bh=RghVCkc5VwWW4D14++YXRjz97kfxgjvzEF1cYxWD82I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fg/x03s3IJXRnU+kMznRvmloXcMXxs4q07W7+Q0QegxJ+THnkVSGJhHTY6rqma0Oc9GppB8NoIb9pO0cVi5uvwFZeUb7y3El5EK53gTbc41wmY+pXXnW7COVogG6pcbhZl7AjaTD3bniBaNhvIQpVo4+EpHjawSGzFTczuBDjLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0h0haUZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0h0haUZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770494278; x=1802030278;
  h=date:from:to:cc:subject:message-id;
  bh=RghVCkc5VwWW4D14++YXRjz97kfxgjvzEF1cYxWD82I=;
  b=b0h0haUZUxr4oAZS6CWxfRcHIoaKWCtMKGYEJvu1qM1T+PO4OFNSXANB
   eTD4izYJdDYqURdBkJH3l+bs/N36QNXk21W8YuxLfTIXUynwmZuR6lNgL
   w+PDbC6NyagIPP0+urp3hSBzmbzr5tpkMh9F1lnhpyvu4NBsaqNiaJD3L
   mwUhGbQ8siWfOh3HYW4NXFHT0PrELKeaZ6CZJ/tGZtLfnWpfnB4CB7cUE
   /Lv+25BqHm0S7Avt9h34SimxZ/PcKOn5E3CNu3P5w0+BE0SUjPowAFdc4
   liCdRhcOk0iZ0bdc70fKgSEwfw/qCv2PQDCgShY1UopG65dBJwp3fEq/c
   A==;
X-CSE-ConnectionGUID: EA8+ZB+NTYyJvLTw34zRnQ==
X-CSE-MsgGUID: Jd98H4QUTaagvqu0fispwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11694"; a="71704715"
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="71704715"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 11:57:57 -0800
X-CSE-ConnectionGUID: FEOpCJJITRi8PKYi0XX5NQ==
X-CSE-MsgGUID: 4m5RvUNKS165YUp1E0W2xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="234135012"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Feb 2026 11:57:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vooRF-00000000lrI-02Bf;
	Sat, 07 Feb 2026 19:57:53 +0000
Date: Sun, 08 Feb 2026 03:57:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/6]
 arch/x86/kvm/vmx/pkvm/hyp/../../../pkvm/x86.c:1099:7: warning: variable
 'can_inject' set but not used
Message-ID: <202602080302.8GyAzvpM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   1d370994ba023ff99b9ddab815c6e190e10b3403
commit: 902ee1f41cc85a4bf6843b453f27da8c004746d5 [0/6] ANDROID: pkvm: x86: Handle the KVM_REQ_EVENT request
config: x86_64-randconfig-123-20260207 (https://download.01.org/0day-ci/archive/20260208/202602080302.8GyAzvpM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260208/202602080302.8GyAzvpM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602080302.8GyAzvpM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/vmx/pkvm/hyp/../../../pkvm/x86.c:1099:7: warning: variable 'can_inject' set but not used [-Wunused-but-set-variable]
    1099 |         bool can_inject;
         |              ^
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +/can_inject +1099 arch/x86/kvm/vmx/pkvm/hyp/../../../pkvm/x86.c

  1056	
  1057	/*
  1058	 * Check for any event (interrupt or exception) that is ready to be injected,
  1059	 * and if there is at least one event, inject the event with the highest
  1060	 * priority.  This handles both "pending" events, i.e. events that have never
  1061	 * been injected into the guest, and "injected" events, i.e. events that were
  1062	 * injected as part of a previous VM-Enter, but weren't successfully delivered
  1063	 * and need to be re-injected.
  1064	 *
  1065	 * Note, this is not guaranteed to be invoked on a guest instruction boundary,
  1066	 * i.e. doesn't guarantee that there's an event window in the guest.  KVM must
  1067	 * be able to inject exceptions in the "middle" of an instruction, and so must
  1068	 * also be able to re-inject NMIs and IRQs in the middle of an instruction.
  1069	 * I.e. for exceptions and re-injected events, NOT invoking this on instruction
  1070	 * boundaries is necessary and correct.
  1071	 *
  1072	 * For simplicity, KVM uses a single path to inject all events (except events
  1073	 * that are injected directly from L1 to L2) and doesn't explicitly track
  1074	 * instruction boundaries for asynchronous events.  However, because VM-Exits
  1075	 * that can occur during instruction execution typically result in KVM skipping
  1076	 * the instruction or injecting an exception, e.g. instruction and exception
  1077	 * intercepts, and because pending exceptions have higher priority than pending
  1078	 * interrupts, KVM still honors instruction boundaries in most scenarios.
  1079	 *
  1080	 * But, if a VM-Exit occurs during instruction execution, and KVM does NOT skip
  1081	 * the instruction or inject an exception, then KVM can incorrecty inject a new
  1082	 * asynchronous event if the event became pending after the CPU fetched the
  1083	 * instruction (in the guest).  E.g. if a page fault (#PF, #NPF, EPT violation)
  1084	 * occurs and is resolved by KVM, a coincident NMI, SMI, IRQ, etc... can be
  1085	 * injected on the restarted instruction instead of being deferred until the
  1086	 * instruction completes.
  1087	 *
  1088	 * In practice, this virtualization hole is unlikely to be observed by the
  1089	 * guest, and even less likely to cause functional problems.  To detect the
  1090	 * hole, the guest would have to trigger an event on a side effect of an early
  1091	 * phase of instruction execution, e.g. on the instruction fetch from memory.
  1092	 * And for it to be a functional problem, the guest would need to depend on the
  1093	 * ordering between that side effect, the instruction completing, _and_ the
  1094	 * delivery of the asynchronous event.
  1095	 */
  1096	static int kvm_check_and_inject_events(struct kvm_vcpu *vcpu,
  1097					       bool *req_immediate_exit)
  1098	{
> 1099		bool can_inject;
  1100		int r;
  1101	
  1102		/*
  1103		 * Process nested events first, as nested VM-Exit supersedes event
  1104		 * re-injection.  If there's an event queued for re-injection, it will
  1105		 * be saved into the appropriate vmc{b,s}12 fields on nested VM-Exit.
  1106		 */
  1107		if (is_guest_mode(vcpu))
  1108			r = kvm_check_nested_events(vcpu);
  1109		else
  1110			r = 0;
  1111	
  1112		/*
  1113		 * Re-inject exceptions and events *especially* if immediate entry+exit
  1114		 * to/from L2 is needed, as any event that has already been injected
  1115		 * into L2 needs to complete its lifecycle before injecting a new event.
  1116		 *
  1117		 * Don't re-inject an NMI or interrupt if there is a pending exception.
  1118		 * This collision arises if an exception occurred while vectoring the
  1119		 * injected event, KVM intercepted said exception, and KVM ultimately
  1120		 * determined the fault belongs to the guest and queues the exception
  1121		 * for injection back into the guest.
  1122		 *
  1123		 * "Injected" interrupts can also collide with pending exceptions if
  1124		 * userspace ignores the "ready for injection" flag and blindly queues
  1125		 * an interrupt.  In that case, prioritizing the exception is correct,
  1126		 * as the exception "occurred" before the exit to userspace.  Trap-like
  1127		 * exceptions, e.g. most #DBs, have higher priority than interrupts.
  1128		 * And while fault-like exceptions, e.g. #GP and #PF, are the lowest
  1129		 * priority, they're only generated (pended) during instruction
  1130		 * execution, and interrupts are recognized at instruction boundaries.
  1131		 * Thus a pending fault-like exception means the fault occurred on the
  1132		 * *previous* instruction and must be serviced prior to recognizing any
  1133		 * new events in order to fully complete the previous instruction.
  1134		 */
  1135		if (vcpu->arch.exception.injected)
  1136			kvm_inject_exception(vcpu);
  1137		else if (kvm_is_exception_pending(vcpu))
  1138			; /* see above */
  1139		else if (vcpu->arch.nmi_injected)
  1140			kvm_x86_call(inject_nmi)(vcpu);
  1141		else if (vcpu->arch.interrupt.injected)
  1142			kvm_x86_call(inject_irq)(vcpu, true);
  1143	
  1144		/*
  1145		 * Exceptions that morph to VM-Exits are handled above, and pending
  1146		 * exceptions on top of injected exceptions that do not VM-Exit should
  1147		 * either morph to #DF or, sadly, override the injected exception.
  1148		 */
  1149		WARN_ON_ONCE(vcpu->arch.exception.injected &&
  1150			     vcpu->arch.exception.pending);
  1151	
  1152		/*
  1153		 * Bail if immediate entry+exit to/from the guest is needed to complete
  1154		 * nested VM-Enter or event re-injection so that a different pending
  1155		 * event can be serviced (or if KVM needs to exit to userspace).
  1156		 *
  1157		 * Otherwise, continue processing events even if VM-Exit occurred.  The
  1158		 * VM-Exit will have cleared exceptions that were meant for L2, but
  1159		 * there may now be events that can be injected into L1.
  1160		 */
  1161		if (r < 0)
  1162			goto out;
  1163	
  1164		/*
  1165		 * A pending exception VM-Exit should either result in nested VM-Exit
  1166		 * or force an immediate re-entry and exit to/from L2, and exception
  1167		 * VM-Exits cannot be injected (flag should _never_ be set).
  1168		 */
  1169		WARN_ON_ONCE(vcpu->arch.exception_vmexit.injected ||
  1170			     vcpu->arch.exception_vmexit.pending);
  1171	
  1172		/*
  1173		 * New events, other than exceptions, cannot be injected if KVM needs
  1174		 * to re-inject a previous event.  See above comments on re-injecting
  1175		 * for why pending exceptions get priority.
  1176		 */
  1177		can_inject = !kvm_event_needs_reinjection(vcpu);
  1178	
  1179		if (vcpu->arch.exception.pending) {
  1180			/*
  1181			 * Fault-class exceptions, except #DBs, set RF=1 in the RFLAGS
  1182			 * value pushed on the stack.  Trap-like exception and all #DBs
  1183			 * leave RF as-is (KVM follows Intel's behavior in this regard;
  1184			 * AMD states that code breakpoint #DBs excplitly clear RF=0).
  1185			 *
  1186			 * Note, most versions of Intel's SDM and AMD's APM incorrectly
  1187			 * describe the behavior of General Detect #DBs, which are
  1188			 * fault-like.  They do _not_ set RF, a la code breakpoints.
  1189			 */
  1190			if (exception_type(vcpu->arch.exception.vector) == EXCPT_FAULT)
  1191				__kvm_set_rflags(vcpu, kvm_get_rflags(vcpu) |
  1192						     X86_EFLAGS_RF);
  1193	
  1194			if (vcpu->arch.exception.vector == DB_VECTOR) {
  1195				kvm_deliver_exception_payload(vcpu, &vcpu->arch.exception);
  1196				if (vcpu->arch.dr7 & DR7_GD) {
  1197					vcpu->arch.dr7 &= ~DR7_GD;
  1198					kvm_update_dr7(vcpu);
  1199				}
  1200			}
  1201	
  1202			kvm_inject_exception(vcpu);
  1203	
  1204			vcpu->arch.exception.pending = false;
  1205			vcpu->arch.exception.injected = true;
  1206	
  1207			can_inject = false;
  1208		}
  1209	
  1210		/* Don't inject interrupts if the user asked to avoid doing so */
  1211		if (vcpu->guest_debug & KVM_GUESTDBG_BLOCKIRQ)
  1212			return 0;
  1213	
  1214		/*
  1215		 * The host will use the PV interfaces to check and inject the
  1216		 * smi/nmi/interrupt, and the pkvm hypervisor just needs to check if
  1217		 * needs to re-inject which is done at the beginning.
  1218		 */
  1219	#ifndef __PKVM_HYP__
  1220		/*
  1221		 * Finally, inject interrupt events.  If an event cannot be injected
  1222		 * due to architectural conditions (e.g. IF=0) a window-open exit
  1223		 * will re-request KVM_REQ_EVENT.  Sometimes however an event is pending
  1224		 * and can architecturally be injected, but we cannot do it right now:
  1225		 * an interrupt could have arrived just now and we have to inject it
  1226		 * as a vmexit, or there could already an event in the queue, which is
  1227		 * indicated by can_inject.  In that case we request an immediate exit
  1228		 * in order to make progress and get back here for another iteration.
  1229		 * The kvm_x86_ops hooks communicate this by returning -EBUSY.
  1230		 */
  1231	#ifdef CONFIG_KVM_SMM
  1232		if (vcpu->arch.smi_pending) {
  1233			r = can_inject ? kvm_x86_call(smi_allowed)(vcpu, true) :
  1234					 -EBUSY;
  1235			if (r < 0)
  1236				goto out;
  1237			if (r) {
  1238				vcpu->arch.smi_pending = false;
  1239				++vcpu->arch.smi_count;
  1240				enter_smm(vcpu);
  1241				can_inject = false;
  1242			} else
  1243				kvm_x86_call(enable_smi_window)(vcpu);
  1244		}
  1245	#endif
  1246	
  1247		if (vcpu->arch.nmi_pending) {
  1248			r = can_inject ? kvm_x86_call(nmi_allowed)(vcpu, true) :
  1249					 -EBUSY;
  1250			if (r < 0)
  1251				goto out;
  1252			if (r) {
  1253				--vcpu->arch.nmi_pending;
  1254				vcpu->arch.nmi_injected = true;
  1255				kvm_x86_call(inject_nmi)(vcpu);
  1256				can_inject = false;
  1257				WARN_ON(kvm_x86_call(nmi_allowed)(vcpu, true) < 0);
  1258			}
  1259			if (vcpu->arch.nmi_pending)
  1260				kvm_x86_call(enable_nmi_window)(vcpu);
  1261		}
  1262	
  1263		if (kvm_cpu_has_injectable_intr(vcpu)) {
  1264			r = can_inject ? kvm_x86_call(interrupt_allowed)(vcpu, true) :
  1265					 -EBUSY;
  1266			if (r < 0)
  1267				goto out;
  1268			if (r) {
  1269				int irq = kvm_cpu_get_interrupt(vcpu);
  1270	
  1271				if (!WARN_ON_ONCE(irq == -1)) {
  1272					kvm_queue_interrupt(vcpu, irq, false);
  1273					kvm_x86_call(inject_irq)(vcpu, false);
  1274					WARN_ON(kvm_x86_call(interrupt_allowed)(vcpu, true) < 0);
  1275				}
  1276			}
  1277			if (kvm_cpu_has_injectable_intr(vcpu))
  1278				kvm_x86_call(enable_irq_window)(vcpu);
  1279		}
  1280	#endif
  1281	
  1282		if (is_guest_mode(vcpu) &&
  1283		    kvm_x86_ops.nested_ops->has_events &&
  1284		    kvm_x86_ops.nested_ops->has_events(vcpu, true))
  1285			*req_immediate_exit = true;
  1286	
  1287		/*
  1288		 * KVM must never queue a new exception while injecting an event; KVM
  1289		 * is done emulating and should only propagate the to-be-injected event
  1290		 * to the VMCS/VMCB.  Queueing a new exception can put the vCPU into an
  1291		 * infinite loop as KVM will bail from VM-Enter to inject the pending
  1292		 * exception and start the cycle all over.
  1293		 *
  1294		 * Exempt triple faults as they have special handling and won't put the
  1295		 * vCPU into an infinite loop.  Triple fault can be queued when running
  1296		 * VMX without unrestricted guest, as that requires KVM to emulate Real
  1297		 * Mode events (see kvm_inject_realmode_interrupt()).
  1298		 */
  1299		WARN_ON_ONCE(vcpu->arch.exception.pending ||
  1300			     vcpu->arch.exception_vmexit.pending);
  1301		return 0;
  1302	
  1303	out:
  1304		if (r == -EBUSY) {
  1305			*req_immediate_exit = true;
  1306			r = 0;
  1307		}
  1308		return r;
  1309	}
  1310	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
