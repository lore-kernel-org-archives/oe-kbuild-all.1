Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400771FDE02
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Apr 2025 20:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744489441; cv=none; b=gU68vWEmByOK8n75oA2lc0hokJMmk5LFQBgZNByc1EANFQo37qQN3X+2fSDejEB86OZUYDuoQV/cpmdbYEmud6GkjbitqYHMSLM8wTIn9NMqyvrStRgBeUVaeZJVRT8xXG1fX0EenZ4Y0aj5OAO4JISeNStgkbxKlNqlPYhemnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744489441; c=relaxed/simple;
	bh=sjV3XLOBWS5xOu5c5r0i9OWfaTN6mYnE6Vq+ICs+I/4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LjntDfOS+ToYg7TjEESmGrWt6QbxuLcOoDYBiXe+mGc7uyz9c9B1wCKIi9sqDNargajTLl94buw934kCDj1L5TO64hYUc7EpXr8u2r8qCtnzRwb0jxrkND7ylYHG1zgTFtwE5KfkPhK8c0B1r1J0mFwjSkgw40o4we2/Dx2Ycos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XkY7jYFN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XkY7jYFN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744489439; x=1776025439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sjV3XLOBWS5xOu5c5r0i9OWfaTN6mYnE6Vq+ICs+I/4=;
  b=XkY7jYFNsdboW2VuSmobjyTOhXAQh0k+sbzseWC2OAhNpAwKBDuLGBDm
   TymWHb8YbX3TolNq/0L3NbZmUWdutfVY8ADyxCuxA/WoWBRNiQlLuXz1/
   3+tie6JzSuAahUsaTXRV/abiBGaFDEcUCunJdHixtZqd3c1NNvHbE7m4j
   LY2gCM0UGJZ3rbDfU9af1g0j/krOCvP8VWGPJKHpoMW7OJ3rUa8FzFeLc
   +nglriVvaVmfzqqiYqZAsn1gzKiMXgXyo0zPl2gvH+4Lkvs2wXhj2OSTb
   1e7ZTenIMRWsG5ugmqETqhGVhWOX/0IAoIg3BVkr5bYjKG12+w3JED4U1
   g==;
X-CSE-ConnectionGUID: G+08NWx9RYCsa1ddUf/V/w==
X-CSE-MsgGUID: B8f/fyg8SDuBcsKY7ceL5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45245583"
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="45245583"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 13:23:58 -0700
X-CSE-ConnectionGUID: +1pANfxLQUOoPn+pUbqLkw==
X-CSE-MsgGUID: Wtts6+lKQmiHLorYqOG/Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="134454692"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Apr 2025 13:23:58 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3hON-000C6i-1E;
	Sat, 12 Apr 2025 20:23:55 +0000
Date: Sun, 13 Apr 2025 04:23:09 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/unfudge_irq_bypass 72/72]
 arch/x86/kvm/svm/avic.c:857:58: error: 'ir' undeclared; did you mean 'idr'?
Message-ID: <202504130437.Mxg2ywJT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/unfudge_irq_bypass
head:   eb313cd2befb6b7fdcab08d5c7d41ad3cb8f3ec2
commit: eb313cd2befb6b7fdcab08d5c7d41ad3cb8f3ec2 [72/72] tmp
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250413/202504130437.Mxg2ywJT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504130437.Mxg2ywJT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504130437.Mxg2ywJT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/svm/avic.c:31:
   arch/x86/include/../../../drivers/iommu/amd/amd_iommu_types.h:895:17: error: unknown type name 'u128'
     895 |                 u128 data128[2];
         |                 ^~~~
   arch/x86/include/../../../drivers/iommu/amd/amd_iommu_types.h:1053:17: error: unknown type name 'u128'
    1053 |                 u128 irte;
         |                 ^~~~
   In file included from arch/x86/include/asm/bug.h:103,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:6,
                    from include/linux/string.h:392,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/kvm_types.h:23,
                    from arch/x86/kvm/svm/avic.c:17:
   arch/x86/kvm/svm/avic.c: In function 'avic_update_iommu_vcpu_affinity':
>> arch/x86/kvm/svm/avic.c:857:58: error: 'ir' undeclared (first use in this function); did you mean 'idr'?
     857 |                         WARN_ON_ONCE(amd_iommu_update_ga(ir->data, cpu, ga_log_intr));
         |                                                          ^~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   arch/x86/kvm/svm/avic.c:857:58: note: each undeclared identifier is reported only once for each function it appears in
     857 |                         WARN_ON_ONCE(amd_iommu_update_ga(ir->data, cpu, ga_log_intr));
         |                                                          ^~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~


vim +857 arch/x86/kvm/svm/avic.c

   836	
   837	static void avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu,
   838						    enum avic_vcpu_action action)
   839	{
   840		bool ga_log_intr = (action & AVIC_START_BLOCKING);
   841		struct vcpu_svm *svm = to_svm(vcpu);
   842		struct kvm_kernel_irqfd *irqfd;
   843	
   844		lockdep_assert_held(&svm->ir_list_lock);
   845	
   846		/*
   847		 * Here, we go through the per-vcpu ir_list to update all existing
   848		 * interrupt remapping table entry targeting this vcpu.
   849		 */
   850		if (list_empty(&svm->ir_list))
   851			return;
   852	
   853		list_for_each_entry(irqfd, &svm->ir_list, vcpu_list) {
   854			void *data = irqfd->irq_bypass_data;
   855	
   856			if (!(action & AVIC_TOGGLE_ON_OFF))
 > 857				WARN_ON_ONCE(amd_iommu_update_ga(ir->data, cpu, ga_log_intr));
   858			else if (cpu >= 0)
   859				WARN_ON_ONCE(amd_iommu_activate_guest_mode(data, cpu, ga_log_intr));
   860			else
   861				WARN_ON_ONCE(amd_iommu_deactivate_guest_mode(data));
   862		}
   863	}
   864	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
