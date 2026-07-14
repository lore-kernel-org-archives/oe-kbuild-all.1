Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D39B3BBFC4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jul 2026 13:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784036853; cv=none; b=bj/jwHao4c8NpnmS2QahWqXSNg0hScqcay1omPstmTYYu0wmpYgWBprntO4SCPsJjtUNm5dY6FdMBWGrZR/hga4aXPPCSoNs7Je/ntPXRpG5HN8txACQOij6FiPa61y6bYO0LxwVegFL9QXjHB3Wxca8yYJBowXjoRjv+2Z8X48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784036853; c=relaxed/simple;
	bh=4R2wf1Jabi1klxv8UqZUDuiuFG39sGfoS5TsM+ceJAY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A0p89OfplK6S8mQL78CnTa7dxIwzYUlSWjeuYu/x5xftbyt0piIlw09fkmTnnK6hyPCF4elH6F9ZL98vmMMoRN83hbCKa9l3oQQ+cL/2a7ZwgRS1610dxwC/YVZEsuDaLJejiXHKPg1kDetAppvvjlMfk5M1byFj9r1oTtEdsJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vqq8nkWF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vqq8nkWF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784036852; x=1815572852;
  h=date:from:to:cc:subject:message-id;
  bh=4R2wf1Jabi1klxv8UqZUDuiuFG39sGfoS5TsM+ceJAY=;
  b=Vqq8nkWFIjPPSiwesEJTLJ4SKsEo8f4cVRqWR4mBTjU0q3gm1KOYnYy1
   ALAQQqA2S4X6lmXd17Noj90GmjYB8WXY0ouoBWkSbh6beKCClcRlINsOP
   Zv+0Kunzi6SHzXNjlX7INmoEsIuOp+JHgaGzFTmpdWgRHfkt/J/Y4yoCZ
   4C1T4MsT+TNwI3RjFBgv+SW8kCwGfXFjg4tOSLf0Y9NBrZW38UxrESJ33
   L6tUpFNBI7n5gFQKM6HFLyR8yj11Bd6tz3U+BqnQys5423G5hfxxa4TZ2
   CGasC3MtSbi+Sg5X7tYKJRzKpRmT9JPiUvAD9AFRa58ieLvjZvO3br6UX
   w==;
X-CSE-ConnectionGUID: g1YPVnegSuufHb9Mh3D8dw==
X-CSE-MsgGUID: LUrhMtaYQhSrrWOGYlQJhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84679894"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84679894"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 06:47:32 -0700
X-CSE-ConnectionGUID: b4/3+F91TByIdYIjE21jDQ==
X-CSE-MsgGUID: 6DA+yplpQnqWfUkr+rtL3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="256506740"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 14 Jul 2026 06:47:29 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjdTq-00000000MgA-2xyw;
	Tue, 14 Jul 2026 13:47:26 +0000
Date: Tue, 14 Jul 2026 21:47:15 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Machhiwal <amachhiw@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [linuxppc:merge-test 8/10]
 arch/powerpc/kvm/powerpc.c:262:33: error: invalid use of undefined type
 'struct kvmppc_vcore'
Message-ID: <202607142107.CrgQhmsx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linuxppc/linux merge-test
head:   3ca739706580462a132d3a0706e801d9893aaa9e
commit: a7452640914469676b5fcffee80ee045525bddb8 [8/10] KVM: PPC: Book3S HV: Validate arch_compat against host compatibility mode
config: powerpc64-randconfig-002-20260713 (https://download.01.org/0day-ci/archive/20260714/202607142107.CrgQhmsx-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607142107.CrgQhmsx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607142107.CrgQhmsx-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kvm/powerpc.c: In function 'kvmppc_sanity_check':
>> arch/powerpc/kvm/powerpc.c:262:33: error: invalid use of undefined type 'struct kvmppc_vcore'
     262 |                 vcpu->arch.vcore->arch_compat == PVR_ARCH_INVALID)
         |                                 ^~
   arch/powerpc/kvm/powerpc.c: In function 'kvmppc_set_vmx_dword':
   arch/powerpc/kvm/powerpc.c:1047:9: error: implicit declaration of function 'kvmppc_get_vsx_vr'; did you mean 'kvmppc_get_sr'? [-Werror=implicit-function-declaration]
    1047 |         kvmppc_get_vsx_vr(vcpu, index, &val.vval);
         |         ^~~~~~~~~~~~~~~~~
         |         kvmppc_get_sr
   arch/powerpc/kvm/powerpc.c:1049:9: error: implicit declaration of function 'kvmppc_set_vsx_vr'; did you mean 'kvmppc_set_sr'? [-Werror=implicit-function-declaration]
    1049 |         kvmppc_set_vsx_vr(vcpu, index, &val.vval);
         |         ^~~~~~~~~~~~~~~~~
         |         kvmppc_set_sr
   In file included from arch/powerpc/kvm/powerpc.c:25:
   arch/powerpc/kvm/powerpc.c: In function 'kvm_vcpu_ioctl_get_one_reg':
   arch/powerpc/kvm/powerpc.c:1715:52: error: implicit declaration of function 'kvmppc_get_vscr'; did you mean 'kvmppc_get_sr'? [-Werror=implicit-function-declaration]
    1715 |                         val = get_reg_val(reg->id, kvmppc_get_vscr(vcpu));
         |                                                    ^~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:411:29: note: in definition of macro 'get_reg_val'
     411 |         case 4: __u.wval = (reg); break;        \
         |                             ^~~
   arch/powerpc/kvm/powerpc.c:1718:52: error: implicit declaration of function 'kvmppc_get_vrsave'; did you mean 'kvmppc_get_sr'? [-Werror=implicit-function-declaration]
    1718 |                         val = get_reg_val(reg->id, kvmppc_get_vrsave(vcpu));
         |                                                    ^~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:411:29: note: in definition of macro 'get_reg_val'
     411 |         case 4: __u.wval = (reg); break;        \
         |                             ^~~
   arch/powerpc/kvm/powerpc.c: In function 'kvm_vcpu_ioctl_set_one_reg':
   arch/powerpc/kvm/powerpc.c:1766:25: error: implicit declaration of function 'kvmppc_set_vscr'; did you mean 'kvmppc_set_sr'? [-Werror=implicit-function-declaration]
    1766 |                         kvmppc_set_vscr(vcpu, set_reg_val(reg->id, val));
         |                         ^~~~~~~~~~~~~~~
         |                         kvmppc_set_sr
   arch/powerpc/kvm/powerpc.c:1773:25: error: implicit declaration of function 'kvmppc_set_vrsave'; did you mean 'kvmppc_set_sr'? [-Werror=implicit-function-declaration]
    1773 |                         kvmppc_set_vrsave(vcpu, set_reg_val(reg->id, val));
         |                         ^~~~~~~~~~~~~~~~~
         |                         kvmppc_set_sr
   cc1: some warnings being treated as errors


vim +262 arch/powerpc/kvm/powerpc.c

   252	
   253	int kvmppc_sanity_check(struct kvm_vcpu *vcpu)
   254	{
   255		int r = false;
   256	
   257		/* We have to know what CPU to virtualize */
   258		if (!vcpu->arch.pvr)
   259			goto out;
   260	
   261		if (vcpu->arch.vcore &&
 > 262			vcpu->arch.vcore->arch_compat == PVR_ARCH_INVALID)
   263			goto out;
   264	
   265		/* PAPR only works with book3s_64 */
   266		if ((vcpu->arch.cpu_type != KVM_CPU_3S_64) && vcpu->arch.papr_enabled)
   267			goto out;
   268	
   269		/* HV KVM can only do PAPR mode for now */
   270		if (!vcpu->arch.papr_enabled && is_kvmppc_hv_enabled(vcpu->kvm))
   271			goto out;
   272	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
