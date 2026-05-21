Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D966D3002DD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 03:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779334724; cv=none; b=h/Bqp0YrF2IqqKrgcYT1hw/WMYU0VaBaMv+ZuODQs8NxNQjJgkFYuhxH8MbOz/99zHkZj+WzKVRnPKxOb+UZKqy07BF35iiGniw01ywc4Wy7X+2hSIq0igzMh7knWXrA1v2TXJMchmlYCOvS2pp++KHRoQ4WgmvRYnyOOvlBHW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779334724; c=relaxed/simple;
	bh=EroiodVqmjg8Z/J4Nmt4Ki51FE04rh0DMrSkB8UaEag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bB+LBveSCBCc2wQMC5qzYXOqp3QNYjIqyMG0hnCaf4Ki3aEV0sq+8VbnOcUGt6rVe1wPm5CL5+X/bkU7nfjEZco9h770UOgCxg3ger46e3dgls3jCqG1KGiDWFxwSs9oBaO9tUCHv9V4JdVB9q6OGN5StPHX2aZYDwcYSbHXcf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QzOR2bWP; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QzOR2bWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779334720; x=1810870720;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EroiodVqmjg8Z/J4Nmt4Ki51FE04rh0DMrSkB8UaEag=;
  b=QzOR2bWPG4x8zU88j0llJm2glXB6DyMrZnRyuQt1FrLQpgGHoxycGiXH
   zpNE/MwnlO1hcP0wFSaGsbQGGKz5rSehR+ml8weaKmOdQlEpCvh0T+ZKX
   jLer5HklV+y3+HVlajTXKGkU8MZfOfFDgpXMuHIF+K4SyeFOBpwjD+P0E
   k/yQfhaS4AK9wSflGpUvzGDKYMexhD7/whJrJWGPuHiTWVk0RFbfAF909
   A2H2FXvgpvMZVczUl1ZxCSEnw0snFbtjXiAW3W4ql9INo/W7I1lxdipjD
   acvL4KVF7qG35c3jfFyzcTbDzMKaWO3+0LE1c+5q2nm+6N4tr96H0orsL
   g==;
X-CSE-ConnectionGUID: hAEerRUDSnm8W7ycIx/3mQ==
X-CSE-MsgGUID: Ey9NGdNsRZ6zi23LlwbB1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="97676989"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="97676989"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 20:38:39 -0700
X-CSE-ConnectionGUID: arBJ54o0Ru236y13+B3fDw==
X-CSE-MsgGUID: 6rZqI56qQgC+MNAkztBkJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="239550775"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 20 May 2026 20:38:36 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPuER-000000004J1-0U67;
	Thu, 21 May 2026 03:38:05 +0000
Date: Thu, 21 May 2026 11:33:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2]
 arch/arm64/kvm/hyp/include/nvhe/modules.h:47:9: warning: 'return' with a
 value, in function returning void
Message-ID: <202605211108.31UWSlNO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Quentin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   f26b61355a1b5a3b8286d5bddc7a3fa5a5191317
commit: 489e4bb847d0800b869c810143d2be0f635d02f3 [2/2] ANDROID: KVM: arm64:=
 Allow memcache topup from guest SMC handler
config: arm64-randconfig-r072-20260521 (https://download.01.org/0day-ci/arc=
hive/20260521/202605211108.31UWSlNO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260521/202605211108.31UWSlNO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211108.31UWSlNO-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:29:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: 'struct pk=
vm_sglist_page' declared inside parameter list will not be visible outside =
of this definition or declaration
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size=
_t nr_pages);
                                             ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:30:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous pro=
totype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
    bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, =
u64 addr) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous pro=
totype for 'module_handle_host_smc' [-Wmissing-prototypes]
    bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: error: return type is an=
 incomplete type
    module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smc=
cc_1_2_regs *res,
    ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: warning: no previous pro=
totype for 'module_handle_guest_smc' [-Wmissing-prototypes]
   arch/arm64/kvm/hyp/include/nvhe/modules.h: In function 'module_handle_gu=
est_smc':
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:47:9: warning: 'return' with a=
 value, in function returning void
     return false;
            ^~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: note: declared here
    module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smc=
cc_1_2_regs *res,
    ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:24:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: 'struct pk=
vm_sglist_page' declared inside parameter list will not be visible outside =
of this definition or declaration
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size=
_t nr_pages);
                                             ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:25:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous pro=
totype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
    bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, =
u64 addr) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous pro=
totype for 'module_handle_host_smc' [-Wmissing-prototypes]
    bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: error: return type is an=
 incomplete type
    module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smc=
cc_1_2_regs *res,
    ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: warning: no previous pro=
totype for 'module_handle_guest_smc' [-Wmissing-prototypes]
   arch/arm64/kvm/hyp/include/nvhe/modules.h: In function 'module_handle_gu=
est_smc':
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:47:9: warning: 'return' with a=
 value, in function returning void
     return false;
            ^~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: note: declared here
    module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smc=
cc_1_2_regs *res,
    ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: At top level:
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:22: warning: initialized field ov=
erwritten [-Woverride-init]
     [ESR_ELx_EC_WFx]  =3D handle_pvm_entry_wfx,
                         ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:22: note: (near initialization fo=
r 'entry_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:24: warning: initialized field ov=
erwritten [-Woverride-init]
     [ESR_ELx_EC_HVC64]  =3D handle_pvm_entry_hvc64,
                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:24: note: (near initialization fo=
r 'entry_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:24: warning: initialized field ov=
erwritten [-Woverride-init]
     [ESR_ELx_EC_SYS64]  =3D handle_pvm_entry_sys64,
                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:24: note: (near initialization fo=
r 'entry_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:466:27: warning: initialized field ov=
erwritten [-Woverride-init]
     [ESR_ELx_EC_IABT_LOW]  =3D handle_pvm_entry_iabt,
                              ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:466:27: note: (near initialization fo=
r 'entry_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:467:27: warning: initialized field ov=
erwritten [-Woverride-init]
     [ESR_ELx_EC_DABT_LOW]  =3D handle_pvm_entry_dabt,
                              ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:467:27: note: (near initialization fo=
r 'entry_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:472:22: warning: initialized field ov=
erwritten [-Woverride-init]
     [ESR_ELx_EC_WFx]  =3D handle_pvm_exit_wfx,
                         ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:472:22: note: (near initialization fo=
r 'exit_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:24: warning: initialized field ov=
erwritten [-Woverride-init]
     [ESR_ELx_EC_HVC64]  =3D handle_pvm_exit_hvc64,
                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:24: note: (near initialization fo=
r 'exit_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:474:24: warning: initialized field ov=
erwritten [-Woverride-init]
     [ESR_ELx_EC_SYS64]  =3D handle_pvm_exit_sys64,
                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:474:24: note: (near initialization fo=
r 'exit_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:27: warning: initialized field ov=
erwritten [-Woverride-init]
     [ESR_ELx_EC_IABT_LOW]  =3D handle_pvm_exit_iabt,
                              ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:27: note: (near initialization fo=
r 'exit_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:27: warning: initialized field ov=
erwritten [-Woverride-init]
     [ESR_ELx_EC_DABT_LOW]  =3D handle_pvm_exit_dabt,
                              ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:27: note: (near initialization fo=
r 'exit_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:485:27: warning: initialized field ov=
erwritten [-Woverride-init]
     [ESR_ELx_EC_IABT_LOW]  =3D handle_vm_exit_abt,
                              ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:485:27: note: (near initialization fo=
r 'exit_hyp_vm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:486:27: warning: initialized field ov=
erwritten [-Woverride-init]
     [ESR_ELx_EC_DABT_LOW]  =3D handle_vm_exit_abt,
                              ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:486:27: note: (near initialization fo=
r 'exit_hyp_vm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: In function 'handle_host_hcall':
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:2023:32: error: passing argument 1 of=
 'handle_host_dynamic_hcall' from incompatible pointer type [-Werror=3Dinco=
mpatible-pointer-types]
     if (handle_host_dynamic_hcall(&host_ctxt->regs, id) =3D=3D HCALL_HANDL=
ED)
                                   ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:25:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:36:51: note: expected 'struct =
kvm_cpu_context *' but argument is of type 'struct user_pt_regs *'
    handle_host_dynamic_hcall(struct kvm_cpu_context *host_ctxt, int id)
                              ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/arm64/kvm/hyp/nvhe/psci-relay.c:15:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: 'struct pk=
vm_sglist_page' declared inside parameter list will not be visible outside =
of this definition or declaration
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size=
_t nr_pages);
                                             ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/psci-relay.c:17:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous pro=
totype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
    bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, =
u64 addr) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous pro=
totype for 'module_handle_host_smc' [-Wmissing-prototypes]
    bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: error: return type is an=
 incomplete type
    module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smc=
cc_1_2_regs *res,
    ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: warning: no previous pro=
totype for 'module_handle_guest_smc' [-Wmissing-prototypes]
   arch/arm64/kvm/hyp/include/nvhe/modules.h: In function 'module_handle_gu=
est_smc':
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:47:9: warning: 'return' with a=
 value, in function returning void
     return false;
            ^~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: note: declared here
    module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smc=
cc_1_2_regs *res,
    ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: At top level:
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:30:58: error: parameter 1 ('notif')=
 has incomplete type
    static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct =
kvm_cpu_context *host_ctxt)
                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:30:13: error: function declaration =
isn't a prototype [-Werror=3Dstrict-prototypes]
    static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct =
kvm_cpu_context *host_ctxt)
                ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function 'pkvm_psci_notify':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:33:22: error: type of formal parame=
ter 1 is incomplete
      pkvm_psci_notifier(notif, &host_ctxt->regs);
                         ^~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function 'psci_cpu_suspend':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:192:19: error: 'PKVM_PSCI_CPU_SUSPE=
ND' undeclared (first use in this function); did you mean 'KVM_PSCI_FN_CPU_=
SUSPEND'?
     pkvm_psci_notify(PKVM_PSCI_CPU_SUSPEND, host_ctxt);
                      ^~~~~~~~~~~~~~~~~~~~~
                      KVM_PSCI_FN_CPU_SUSPEND
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:192:19: note: each undeclared ident=
ifier is reported only once for each function it appears in
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function 'psci_system_suspend':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:223:19: error: 'PKVM_PSCI_SYSTEM_SU=
SPEND' undeclared (first use in this function); did you mean 'KVM_PSCI_FN_C=
PU_SUSPEND'?
     pkvm_psci_notify(PKVM_PSCI_SYSTEM_SUSPEND, host_ctxt);
                      ^~~~~~~~~~~~~~~~~~~~~~~~
                      KVM_PSCI_FN_CPU_SUSPEND
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function '__kvm_host_psci_cpu_e=
ntry':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:254:19: error: 'PKVM_PSCI_CPU_ENTRY=
' undeclared (first use in this function); did you mean 'KVM_PSCI_RET_DENIE=
D'?
     pkvm_psci_notify(PKVM_PSCI_CPU_ENTRY, host_ctxt);
                      ^~~~~~~~~~~~~~~~~~~
                      KVM_PSCI_RET_DENIED
   cc1: some warnings being treated as errors
--
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:21:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: 'struct pk=
vm_sglist_page' declared inside parameter list will not be visible outside =
of this definition or declaration
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size=
_t nr_pages);
                                             ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:23:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous pro=
totype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
    bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, =
u64 addr) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous pro=
totype for 'module_handle_host_smc' [-Wmissing-prototypes]
    bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: error: return type is an=
 incomplete type
    module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smc=
cc_1_2_regs *res,
    ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: warning: no previous pro=
totype for 'module_handle_guest_smc' [-Wmissing-prototypes]
   arch/arm64/kvm/hyp/include/nvhe/modules.h: In function 'module_handle_gu=
est_smc':
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:47:9: warning: 'return' with a=
 value, in function returning void
     return false;
            ^~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: note: declared here
    module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smc=
cc_1_2_regs *res,
    ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c: At top level:
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:42: warning: 'struct pkvm_sgl=
ist_page' declared inside parameter list will not be visible outside of thi=
s definition or declaration
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size=
_t nr_pages)
                                             ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:5: error: conflicting types f=
or '__pkvm_host_donate_sglist_hyp'
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size=
_t nr_pages)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:21:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:5: note: previous decla=
ration of '__pkvm_host_donate_sglist_hyp' was here
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size=
_t nr_pages);
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from arch/arm64/include/asm/processor.h:35,
                    from include/linux/sched.h:13,
                    from include/linux/resume_user_mode.h:6,
                    from include/linux/entry-virt.h:6,
                    from include/linux/kvm_host.h:5,
                    from arch/arm64/kvm/hyp/nvhe/mem_protect.c:7:
   arch/arm64/kvm/hyp/nvhe/mem_protect.c: In function '__pkvm_host_donate_s=
glist_hyp':
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1500:70: error: dereferencing poin=
ter to incomplete type 'struct pkvm_sglist_page'
     WARN_ON(__hyp_check_page_state_range((u64)sglist, nr_pages * sizeof(*s=
glist),
                                                                         ^~=
~~~~~
   include/asm-generic/bug.h:123:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on =3D !!(condition);    \
                            ^~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1508:13: error: invalid use of und=
efined type 'struct pkvm_sglist_page'
      if (sglist[p].order > max_order) {
                ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1512:29: error: invalid use of und=
efined type 'struct pkvm_sglist_page'
      size =3D PAGE_SIZE << sglist[p].order;
                                ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1514:33: error: invalid use of und=
efined type 'struct pkvm_sglist_page'
      if (!pfn_range_is_valid(sglist[p].pfn, size >> PAGE_SHIFT)) {
                                    ^
   In file included from arch/arm64/kvm/hyp/include/nvhe/gfp.h:7,
                    from arch/arm64/kvm/hyp/nvhe/mem_protect.c:18:
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1518:32: error: invalid use of und=
efined type 'struct pkvm_sglist_page'
      phys =3D hyp_pfn_to_phys(sglist[p].pfn);
                                   ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:80:46: note: in definition of m=
acro 'hyp_pfn_to_phys'
    #define hyp_pfn_to_phys(pfn) ((phys_addr_t)((pfn) << PAGE_SHIFT))
                                                 ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1530:36: error: invalid use of und=
efined type 'struct pkvm_sglist_page'
      size_t size =3D PAGE_SIZE << sglist[p].order;
                                       ^
   In file included from arch/arm64/kvm/hyp/include/nvhe/gfp.h:7,
                    from arch/arm64/kvm/hyp/nvhe/mem_protect.c:18:
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1531:36: error: invalid use of und=
efined type 'struct pkvm_sglist_page'
      u64 phys =3D hyp_pfn_to_phys(sglist[p].pfn);
                                       ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:80:46: note: in definition of m=
acro 'hyp_pfn_to_phys'
    #define hyp_pfn_to_phys(pfn) ((phys_addr_t)((pfn) << PAGE_SHIFT))
                                                 ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1543:34: error: invalid use of und=
efined type 'struct pkvm_sglist_page'
        phys =3D hyp_pfn_to_phys(sglist[p].pfn);
                                     ^
   arch/arm64/kvm/hyp/include/nvhe/memory.h:80:46: note: in definition of m=
acro 'hyp_pfn_to_phys'
    #define hyp_pfn_to_phys(pfn) ((phys_addr_t)((pfn) << PAGE_SHIFT))
                                                 ^~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1544:31: error: invalid use of und=
efined type 'struct pkvm_sglist_page'
        size =3D PAGE_SIZE << sglist[p].order;
                                  ^
--
   In file included from arch/arm64/kvm/hyp/nvhe/pkvm.c:21:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: 'struct pk=
vm_sglist_page' declared inside parameter list will not be visible outside =
of this definition or declaration
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size=
_t nr_pages);
                                             ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/pkvm.c:23:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous pro=
totype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
    bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, =
u64 addr) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous pro=
totype for 'module_handle_host_smc' [-Wmissing-prototypes]
    bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: error: return type is an=
 incomplete type
    module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smc=
cc_1_2_regs *res,
    ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: warning: no previous pro=
totype for 'module_handle_guest_smc' [-Wmissing-prototypes]
   arch/arm64/kvm/hyp/include/nvhe/modules.h: In function 'module_handle_gu=
est_smc':
>> arch/arm64/kvm/hyp/include/nvhe/modules.h:47:9: warning: 'return' with a=
 value, in function returning void
     return false;
            ^~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:44:1: note: declared here
    module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smc=
cc_1_2_regs *res,
    ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'module_handle_guest_trng_rn=
g':
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1869:8: error: implicit declaration of fu=
nction 'module_get_guest_trng_rng'; did you mean 'module_handle_guest_trng_=
rng'? [-Werror=3Dimplicit-function-declaration]
     ret =3D module_get_guest_trng_rng(entropy, nbits);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
           module_handle_guest_trng_rng
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'module_handle_guest_trng':
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1888:9: error: implicit declaration of fu=
nction 'module_get_guest_trng_uuid'; did you mean 'module_handle_guest_trng=
_rng'? [-Werror=3Dimplicit-function-declaration]
     uuid =3D module_get_guest_trng_uuid();
            ^~~~~~~~~~~~~~~~~~~~~~~~~~
            module_handle_guest_trng_rng
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1888:7: warning: assignment to 'const uui=
d_t *' {aka 'const struct <anonymous> *'} from 'int' makes pointer from int=
eger without a cast [-Wint-conversion]
     uuid =3D module_get_guest_trng_uuid();
          ^
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'kvm_handle_pvm_smc64':
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1931:28: error: storage size of 'handler_=
ret' isn't known
     enum pkvm_smc_handler_ret handler_ret;
                               ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1951:7: error: 'GUEST_SMC_HANDLED' undecl=
ared (first use in this function); did you mean 'TRACE_TYPE_HANDLED'?
     case GUEST_SMC_HANDLED:
          ^~~~~~~~~~~~~~~~~
          TRACE_TYPE_HANDLED
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1951:7: note: each undeclared identifier =
is reported only once for each function it appears in
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1954:7: error: 'GUEST_SMC_NOT_HANDLED' un=
declared (first use in this function)
     case GUEST_SMC_NOT_HANDLED:
          ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1957:7: error: 'GUEST_SMC_NEED_TOPUP' und=
eclared (first use in this function)
     case GUEST_SMC_NEED_TOPUP:
          ^~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1931:28: warning: unused variable 'handle=
r_ret' [-Wunused-variable]
     enum pkvm_smc_handler_ret handler_ret;
                               ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/return +47 arch/arm64/kvm/hyp/include/nvhe/modules.h

905de63a80084ee Vincent Donnefort  2023-11-09  18 =20
94d30106c7722f4 Quentin Perret     2022-10-06  19  #ifdef CONFIG_MODULES
07e87abe4be64a1 Vincent Donnefort  2024-09-24  20  int __pkvm_init_module(v=
oid *host_mod);
15d5bab7e86b00a Vincent Donnefort  2022-09-27  21  int __pkvm_register_hcal=
l(unsigned long hfn_hyp_va);
35b4aef425c3e60 Vincent Donnefort  2024-03-08  22  int handle_host_dynamic_=
hcall(struct user_pt_regs *regs, int id);
2968360a9bc2c1f Vincent Donnefort  2022-11-18  23  void __pkvm_close_module=
_registration(void);
c141eb26c339351 Vincent Donnefort  2024-12-06  24  bool module_handle_host_=
perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr);
30eefcc7af64a3a Vincent Donnefort  2025-01-14  25  bool module_handle_host_=
smc(struct user_pt_regs *regs);
489e4bb847d0800 Quentin Perret     2025-10-23  26  enum pkvm_smc_handler_ret
489e4bb847d0800 Quentin Perret     2025-10-23  27  module_handle_guest_smc(=
struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
2864d7152511a57 Nikita Ioffe       2025-05-12  28  			pkvm_handle_t handle);
eff36ac2fe9748d Bart=C5=82omiej Grzesik 2025-06-24  29  const uuid_t *modul=
e_get_guest_trng_uuid(void);
eff36ac2fe9748d Bart=C5=82omiej Grzesik 2025-06-24  30  u64 module_get_gues=
t_trng_rng(u64 *entropy, int nbits);
94d30106c7722f4 Quentin Perret     2022-10-06  31  #else
94d30106c7722f4 Quentin Perret     2022-10-06  32  static inline int __pkvm=
_init_module(void *module_init) { return -EOPNOTSUPP; }
15d5bab7e86b00a Vincent Donnefort  2022-09-27  33  static inline int
15d5bab7e86b00a Vincent Donnefort  2022-09-27  34  __pkvm_register_hcall(un=
signed long hfn_hyp_va) { return -EOPNOTSUPP; }
35b4aef425c3e60 Vincent Donnefort  2024-03-08  35  static inline int
35b4aef425c3e60 Vincent Donnefort  2024-03-08  36  handle_host_dynamic_hcal=
l(struct kvm_cpu_context *host_ctxt, int id)
15d5bab7e86b00a Vincent Donnefort  2022-09-27  37  {
15d5bab7e86b00a Vincent Donnefort  2022-09-27  38  	return HCALL_UNHANDLED;
15d5bab7e86b00a Vincent Donnefort  2022-09-27  39  }
2968360a9bc2c1f Vincent Donnefort  2022-11-18  40  static inline void __pkv=
m_close_module_registration(void) { }
c141eb26c339351 Vincent Donnefort  2024-12-06  41  bool module_handle_host_=
perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
30eefcc7af64a3a Vincent Donnefort  2025-01-14  42  bool module_handle_host_=
smc(struct user_pt_regs *regs) { return false; }
489e4bb847d0800 Quentin Perret     2025-10-23  43  enum pkvm_smc_handler_ret
489e4bb847d0800 Quentin Perret     2025-10-23  44  module_handle_guest_smc(=
struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
2864d7152511a57 Nikita Ioffe       2025-05-12  45  			pkvm_handle_t handle)
2864d7152511a57 Nikita Ioffe       2025-05-12  46  {
2864d7152511a57 Nikita Ioffe       2025-05-12 @47  	return false;

:::::: The code at line 47 was first introduced by commit
:::::: 2864d7152511a57f4ffcf2636d4cc7c42d544c45 ANDROID: KVM: arm64: Add sm=
c64 trap handling for protected guests

:::::: TO: Nikita Ioffe <ioffe@google.com>
:::::: CC: Fuad Tabba <tabba@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
