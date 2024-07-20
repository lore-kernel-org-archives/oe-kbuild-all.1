Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0DF10E4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 00:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721434856; cv=none; b=hCoYJ6Trasip19KWihphFmlU8opP+gY6gouQg3NUKSMpCk8VH4u5QkHJqbRBOyk8ks2ZHWPRQtAqpkkhmbTkScCM9vg/YrAv/DFk+ErNxnD4TzfuQaxzBTTyNOzYD6RONz/FoRBNITnEO3svC1a3ykaTgi/cMJ/vWDuAyySAk10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721434856; c=relaxed/simple;
	bh=9oZ++/dAiu71Sk75kviO4dWBiqy5Hgdc9njgW0Dsji4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BGv17H3NoA4OmRJ9R66eXMU5s5iALjZifvpQrMkMxuqUcxarUiknroQ9q7OhrWB00RmyfIZoFNiTPS60xYFOuM/Bo9+igoiLFMlbZclSjdWlhLsH68MLL6ldZ3R+qHTBg9oPIUzETFDW5nW0F6jJi4W4HMZ0g1gWQmK26N2kwOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNqQCQaY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNqQCQaY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721434854; x=1752970854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9oZ++/dAiu71Sk75kviO4dWBiqy5Hgdc9njgW0Dsji4=;
  b=HNqQCQaYLXg5hJkMuXpH6VGr9ISHflE8HuaK/s4TSnTfEJcFhehyL/eS
   Sz/CzyqZlsoeirZ4WmH80qk78Gqtt2LsVPwdxkstM336gA+q7DkQruwq0
   Zw29560Ge8tXbRHc7yJMPEy7Hy6b2xdZO6By29uYWuYG6jnkCYLepYa9v
   ncR51vGPeef6MgMMaQU5szLyXX5rJSlVuWR0nPWdulDb8XVwraOvFqXNr
   pO60Fg6uiimfglHAEhGf8xypGHw82WIUGFOEbGdx24hNH4I59aCsK21lK
   /WHBKFznmncDnt+addwTdC8R3EbZ/Nb4PIqdB/VlC5AEwJ5NoaGSSXXbe
   g==;
X-CSE-ConnectionGUID: XiaJPpoTRjK5kzZRLN3m/Q==
X-CSE-MsgGUID: 2LNB2IfaSsmpIAQaqgKHtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="19197423"
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="19197423"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 17:20:54 -0700
X-CSE-ConnectionGUID: zPERuByLT4y6jfopHaedXQ==
X-CSE-MsgGUID: 2OZEEcMtRgSHI2zX398o5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="88742724"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Jul 2024 17:20:51 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUxqD-000ihW-1a;
	Sat, 20 Jul 2024 00:20:49 +0000
Date: Sat, 20 Jul 2024 08:20:07 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, kvm@vger.kernel.org,
	Robert Hu <robert.hu@intel.com>,
	Farrah Chen <farrah.chen@intel.com>,
	Danmei Wei <danmei.wei@intel.com>
Subject: [kvm:queue 22/34] arch/x86/kvm/svm/svm.c:4952:26: error: 'struct
 kvm_arch' has no member named 'pre_fault_allowed'
Message-ID: <202407200823.WsY9eowy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
head:   90433378a1bea709c362a855c99b4662c92e49be
commit: ca9ddf0b7d74a71b6d71ea5355825922b89f5fd7 [22/34] KVM: x86: disallow pre-fault for SNP VMs before initialization
config: i386-buildonly-randconfig-003-20240720 (https://download.01.org/0day-ci/archive/20240720/202407200823.WsY9eowy-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407200823.WsY9eowy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407200823.WsY9eowy-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/svm/svm.c: In function 'svm_vm_init':
>> arch/x86/kvm/svm/svm.c:4952:26: error: 'struct kvm_arch' has no member named 'pre_fault_allowed'
    4952 |                 kvm->arch.pre_fault_allowed = !kvm->arch.has_private_mem;
         |                          ^
--
   arch/x86/kvm/x86.c: In function 'kvm_arch_init_vm':
>> arch/x86/kvm/x86.c:12650:18: error: 'struct kvm_arch' has no member named 'pre_fault_allowed'
   12650 |         kvm->arch.pre_fault_allowed =
         |                  ^
--
   arch/x86/kvm/mmu/mmu.c: In function 'kvm_arch_vcpu_pre_fault_memory':
>> arch/x86/kvm/mmu/mmu.c:4746:29: error: 'struct kvm_arch' has no member named 'pre_fault_allowed'
    4746 |         if (!vcpu->kvm->arch.pre_fault_allowed)
         |                             ^


vim +4952 arch/x86/kvm/svm/svm.c

  4940	
  4941	static int svm_vm_init(struct kvm *kvm)
  4942	{
  4943		int type = kvm->arch.vm_type;
  4944	
  4945		if (type != KVM_X86_DEFAULT_VM &&
  4946		    type != KVM_X86_SW_PROTECTED_VM) {
  4947			kvm->arch.has_protected_state =
  4948				(type == KVM_X86_SEV_ES_VM || type == KVM_X86_SNP_VM);
  4949			to_kvm_sev_info(kvm)->need_init = true;
  4950	
  4951			kvm->arch.has_private_mem = (type == KVM_X86_SNP_VM);
> 4952			kvm->arch.pre_fault_allowed = !kvm->arch.has_private_mem;
  4953		}
  4954	
  4955		if (!pause_filter_count || !pause_filter_thresh)
  4956			kvm->arch.pause_in_guest = true;
  4957	
  4958		if (enable_apicv) {
  4959			int ret = avic_vm_init(kvm);
  4960			if (ret)
  4961				return ret;
  4962		}
  4963	
  4964		return 0;
  4965	}
  4966	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
