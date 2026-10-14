Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307071E47CC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Oct 2026 20:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792010629; cv=none; b=aFAefLwc5MlhK0zwUklkjojjS1Uk0NLTRpB+z7NI47BmW0lLGARLVB0p+Tkm/qjgPBE7+OcIxGX8cPZ3rtFqHhdRN57lTLMLu6BVusJdoy646KqNc1+GOdhroWRsRv3CwJiCss6rWiKQNZccBag+ylOx7kplxn3Pkv2xAQLPGfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792010629; c=relaxed/simple;
	bh=/AGrnqchaBLnfgUY3kwLkWOGyg7hVo0Ysv3/bLvd+3M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Caaplc9L/AoxyjpLRy92yBge9eM7FZ+SkOL7PxTMLKDcLGN6SequdT1mD5BcG8O9FAa+rlN2csQKP0RPpRgMzVfuyeL6ejc73ulBNU4OyFrE8wedd3Fn5bWybvuFNe5ZJN/g5uHGW97TwlG6TF9nPqPV21eD7WrBRdG3hZHPZe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dBlWvtYs; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBlWvtYs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792010628; x=1823546628;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/AGrnqchaBLnfgUY3kwLkWOGyg7hVo0Ysv3/bLvd+3M=;
  b=dBlWvtYsRGKaqjeVEEjxPQC8TtPWkl20E/CbGiE9CkLbFOCEJmduD3UI
   Tnf3fZjaEPCR/GR/dmp4r8aSI5SML2TU+brDWTDOqp2wUcd7C494vFsVT
   lj/cbGPfDKiogDR57Fl8Gq5qNvDw3rm/WCl5l3Z5xJel23TMbu+nb+oCa
   8dk9r8xbNtdGd2BOn7Ai3kKNlkPuUgGqxxb/CSPU6MH8T/AWbk6LntbH/
   HWZnYIFyLaOtAKrNzDrFjnBdWgutXLHLmM4mBvKrIsQ1DhglEdt3fuAPQ
   uYnJjAaY+ACFbYFkVRI9Or2uFVmawjnekgLdzIHwo9p7dBlIP+fpxW7ar
   g==;
X-CSE-ConnectionGUID: J9g4KtzbRMaWGYv3p8zQhw==
X-CSE-MsgGUID: USlhrxZ+RMGlD7xOYz3i5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="761268"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="761268"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 13:43:48 -0700
X-CSE-ConnectionGUID: pZX7+QStSs6Ls+Z5BpAPqg==
X-CSE-MsgGUID: oyY3MfrtQP2CLmCMSVqW0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1955047"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Oct 2026 13:43:46 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH5p9-00000000FBf-3cvq;
	Wed, 14 Oct 2026 20:43:43 +0000
Date: Thu, 15 Oct 2026 04:43:08 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/kill_should_kick_with_force 6/7]
 arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3872:79: error: 'wait'
 undeclared; did you mean 'wfit'?
Message-ID: <202610150447.eKBjX4vx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/sean-jc/linux x86/kill_should_kick_with_force
head:   01d71338eb030f22b384bb16b117a6429b0ed13a
commit: b5478e7ec85c764e4e846b20f8aafc5b0af2502f [6/7] KVM: Plumb the full =
request into __kvm_vcpu_kick()
config: arm64-randconfig-1002-20261014 (https://download.01.org/0day-ci/arc=
hive/20261015/202610150447.eKBjX4vx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261015/202610150447.eKBjX4vx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150447.eKBjX4vx-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/../../../virt/kvm/kvm_main.c: In function '__kvm_vcpu_kic=
k':
>> arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3872:79: error: 'wait' undec=
lared (first use in this function); did you mean 'wfit'?
    3872 |                                 smp_call_function_single(cpu, ac=
k_kick, NULL, wait);
         |                                                                 =
              ^~~~
         |                                                                 =
              wfit
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3872:79: note: each undeclar=
ed identifier is reported only once for each function it appears in


vim +3872 arch/arm64/kvm/../../../virt/kvm/kvm_main.c

dd1a4cc1fbdf516 Radim Kr=C4=8Dm=C3=A1=C5=99        2016-05-04  3824 =20
0266c894b51c41d Paolo Bonzini       2017-05-04  3825  #ifndef CONFIG_S390
dd1a4cc1fbdf516 Radim Kr=C4=8Dm=C3=A1=C5=99        2016-05-04  3826  /*
dd1a4cc1fbdf516 Radim Kr=C4=8Dm=C3=A1=C5=99        2016-05-04  3827   * Kic=
k a sleeping VCPU, or a guest VCPU in guest mode, into host kernel mode.
dd1a4cc1fbdf516 Radim Kr=C4=8Dm=C3=A1=C5=99        2016-05-04  3828   */
b5478e7ec85c764 Sean Christopherson 2026-10-13  3829  void __kvm_vcpu_kick(=
struct kvm_vcpu *vcpu, int req, bool force)
dd1a4cc1fbdf516 Radim Kr=C4=8Dm=C3=A1=C5=99        2016-05-04  3830  {
85b640450ddcfa0 Sean Christopherson 2021-08-27  3831  	int me, cpu;
dd1a4cc1fbdf516 Radim Kr=C4=8Dm=C3=A1=C5=99        2016-05-04  3832 =20
178f02ffafafc59 Radim Kr=C4=8Dm=C3=A1=C5=99        2017-04-26  3833  	if (k=
vm_vcpu_wake_up(vcpu))
178f02ffafafc59 Radim Kr=C4=8Dm=C3=A1=C5=99        2017-04-26  3834  		retu=
rn;
178f02ffafafc59 Radim Kr=C4=8Dm=C3=A1=C5=99        2017-04-26  3835 =20
aefdc2ed445eb47 Paolo Bonzini       2021-10-20  3836  	me =3D get_cpu();
aefdc2ed445eb47 Paolo Bonzini       2021-10-20  3837  	/*
aefdc2ed445eb47 Paolo Bonzini       2021-10-20  3838  	 * The only state ch=
ange done outside the vcpu mutex is IN_GUEST_MODE
aefdc2ed445eb47 Paolo Bonzini       2021-10-20  3839  	 * to EXITING_GUEST_=
MODE.  Therefore the moderately expensive "should
aefdc2ed445eb47 Paolo Bonzini       2021-10-20  3840  	 * kick" check does =
not need atomic operations if kvm_vcpu_kick is used
aefdc2ed445eb47 Paolo Bonzini       2021-10-20  3841  	 * within the vCPU t=
hread itself.
aefdc2ed445eb47 Paolo Bonzini       2021-10-20  3842  	 */
aefdc2ed445eb47 Paolo Bonzini       2021-10-20  3843  	if (vcpu =3D=3D __th=
is_cpu_read(kvm_running_vcpu)) {
aefdc2ed445eb47 Paolo Bonzini       2021-10-20  3844  		if (vcpu->mode =3D=
=3D IN_GUEST_MODE)
aefdc2ed445eb47 Paolo Bonzini       2021-10-20  3845  			WRITE_ONCE(vcpu->m=
ode, EXITING_GUEST_MODE);
aefdc2ed445eb47 Paolo Bonzini       2021-10-20  3846  		goto out;
aefdc2ed445eb47 Paolo Bonzini       2021-10-20  3847  	}
aefdc2ed445eb47 Paolo Bonzini       2021-10-20  3848 =20
85b640450ddcfa0 Sean Christopherson 2021-08-27  3849  	/*
85b640450ddcfa0 Sean Christopherson 2021-08-27  3850  	 * Note, the vCPU co=
uld get migrated to a different pCPU at any point
82c1e532e026a23 Sean Christopherson 2026-10-13  3851  	 * after kvm_vcpu_sh=
ould_kick(), which could result in sending an
85b640450ddcfa0 Sean Christopherson 2021-08-27  3852  	 * IPI to the previo=
us pCPU.  But, that's ok because the purpose of the
85b640450ddcfa0 Sean Christopherson 2021-08-27  3853  	 * IPI is to force t=
he vCPU to leave IN_GUEST_MODE, and migrating the
cc49503cc46665c Sean Christopherson 2026-10-13  3854  	 * vCPU also require=
s it to leave IN_GUEST_MODE
cc49503cc46665c Sean Christopherson 2026-10-13  3855  	 *
cc49503cc46665c Sean Christopherson 2026-10-13  3856  	 * Note #2, do NOT c=
heck if an IPI is needed if @force is true, as the
cc49503cc46665c Sean Christopherson 2026-10-13  3857  	 * check also modifi=
es vcpu->mode and KVM PPC needs to avoid that side
cc49503cc46665c Sean Christopherson 2026-10-13  3858  	 * effect for unknow=
n historical reasons.
85b640450ddcfa0 Sean Christopherson 2021-08-27  3859  	 */
82c1e532e026a23 Sean Christopherson 2026-10-13  3860  	if (force || kvm_vcp=
u_should_kick(vcpu)) {
85b640450ddcfa0 Sean Christopherson 2021-08-27  3861  		cpu =3D READ_ONCE(v=
cpu->cpu);
309d28576f0a239 Tom Lendacky        2025-03-27  3862  		if (cpu !=3D me && =
(unsigned int)cpu < nr_cpu_ids && cpu_online(cpu)) {
309d28576f0a239 Tom Lendacky        2025-03-27  3863  			/*
b5478e7ec85c764 Sean Christopherson 2026-10-13  3864  			 * Use a reschedul=
e IPI to kick the vCPU if the request
b5478e7ec85c764 Sean Christopherson 2026-10-13  3865  			 * doesn't need to=
 wait for a response (or there is no
b5478e7ec85c764 Sean Christopherson 2026-10-13  3866  			 * request), as KV=
M allows kicking vCPUs while IRQs are
b5478e7ec85c764 Sean Christopherson 2026-10-13  3867  			 * disabled, but u=
sing the SMP function call framework
b5478e7ec85c764 Sean Christopherson 2026-10-13  3868  			 * with IRQs disab=
led can deadlock due to taking cross-
b5478e7ec85c764 Sean Christopherson 2026-10-13  3869  			 * CPU locks.
309d28576f0a239 Tom Lendacky        2025-03-27  3870  			 */
b5478e7ec85c764 Sean Christopherson 2026-10-13  3871  			if (req & KVM_REQU=
EST_WAIT)
309d28576f0a239 Tom Lendacky        2025-03-27 @3872  				smp_call_function=
_single(cpu, ack_kick, NULL, wait);
309d28576f0a239 Tom Lendacky        2025-03-27  3873  			else
b6d33834bd4e8bd Christoffer Dall    2012-03-08  3874  				smp_send_reschedu=
le(cpu);
85b640450ddcfa0 Sean Christopherson 2021-08-27  3875  		}
309d28576f0a239 Tom Lendacky        2025-03-27  3876  	}
aefdc2ed445eb47 Paolo Bonzini       2021-10-20  3877  out:
b6d33834bd4e8bd Christoffer Dall    2012-03-08  3878  	put_cpu();
b6d33834bd4e8bd Christoffer Dall    2012-03-08  3879  }
20c48920583675e Sean Christopherson 2025-09-18  3880  EXPORT_SYMBOL_FOR_KVM=
_INTERNAL(__kvm_vcpu_kick);
0266c894b51c41d Paolo Bonzini       2017-05-04  3881  #endif /* !CONFIG_S39=
0 */
b6d33834bd4e8bd Christoffer Dall    2012-03-08  3882 =20

:::::: The code at line 3872 was first introduced by commit
:::::: 309d28576f0a23931a36bf67324868448f79a77e KVM: SVM: Fix SNP AP destro=
y race with VMRUN

:::::: TO: Tom Lendacky <thomas.lendacky@amd.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
