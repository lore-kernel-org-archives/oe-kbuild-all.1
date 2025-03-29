Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A004A50
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Mar 2025 04:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743223037; cv=none; b=W783ZPpoX73oICRYjcXTloLGlEYKvnWXexrR4Nlg2PmoeWrQsldHfneAaqbcfgcp6u9I6LORYLskfKlENkeJXgr81xQE754QzwqH3oqgrDms7rNpFdK8gi8IsYsPg1LUw9v6jZ3FB5uYu5M8m+MDOhCn2x2/kbe0685dHwxrt/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743223037; c=relaxed/simple;
	bh=tR5wxfnXGLMP/pf5PfiF163uXtSzhbdan1uMVMQBeKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G5/WHn+Bg61hMV0HDr2CLO0F+3nzgqOYlEtSxlaAbg9BmJE3nZfQPkvODJg5Fi/x+lNaNyStb08hJS6w9s6vx4VMZ5FQnH7Qo2oEn4dztDQp/qE8W6DkE1BpkIwu6FdAnwy7oPdLlcw8j+oGnAgc6YQgTpG/89ZiKSqsuznM/jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MckTjVOe; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MckTjVOe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743223035; x=1774759035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tR5wxfnXGLMP/pf5PfiF163uXtSzhbdan1uMVMQBeKc=;
  b=MckTjVOejRc3D/bjqsHngJA3JSL+l2qmKX21QFE9vfHboMclHE9XTu6Z
   pcpmImw6zMy44vefYn/NcuDyzP2JINY0vfid/b9qZPdhwnoIvhzZLQ5b6
   sYKjtUxgK3fjNAx0aXdNfSINIeM6odTI4SGwmeG7xwP6B8l3T8A+aPzER
   Vujm8KiwFBHdLMtQNxYzM+Cuvje8di672SSqvrwGMgVEd1+LEupQmsgav
   JzDspNH6delTra5PX8/zv/gQKXLHNUiUTAw/sSXgc5YSDA51l8niFz+aY
   bun+TZSH3yJrwNeBwDPdnjf20tRl7QwwfhbsAbjWkkfNqj9/VaCKOTp0/
   Q==;
X-CSE-ConnectionGUID: UXy4pJJPTz2rEJ0hVUvzWA==
X-CSE-MsgGUID: S0K3BdSCQWC0xPTt9nW3ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55966257"
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="55966257"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 21:37:14 -0700
X-CSE-ConnectionGUID: kZ21dv+wQA+ygNpgbXr7wA==
X-CSE-MsgGUID: YzWNHu/mQqGsA+2pAxEC3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="130464296"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 28 Mar 2025 21:37:12 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyNwU-0007tm-14;
	Sat, 29 Mar 2025 04:37:10 +0000
Date: Sat, 29 Mar 2025 12:36:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/unfudge_irq_bypass 71/72] arch/x86/kvm/svm/avic.c:1074:
 undefined reference to `amd_iommu_fake_irte'
Message-ID: <202503291236.kproiZFD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/unfudge_irq_bypass
head:   4f099563d661ed8fc857fa56cae7425fa4ad306d
commit: bbe82c73f0093dfe41aecd96de0fa95b6a014be9 [71/72] *** DO NOT MERGE *** iommu/amd: Hack to fake IRQ posting support
config: x86_64-buildonly-randconfig-003-20250329 (https://download.01.org/0day-ci/archive/20250329/202503291236.kproiZFD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503291236.kproiZFD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503291236.kproiZFD-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `avic_pi_handler':
>> arch/x86/kvm/svm/avic.c:1074: undefined reference to `amd_iommu_fake_irte'
>> ld: arch/x86/kvm/svm/avic.c:1074: undefined reference to `amd_iommu_fake_irte'
>> ld: arch/x86/kvm/svm/avic.c:1074: undefined reference to `amd_iommu_fake_irte'
>> ld: arch/x86/kvm/svm/avic.c:1074: undefined reference to `amd_iommu_fake_irte'
>> ld: arch/x86/kvm/svm/avic.c:1074: undefined reference to `amd_iommu_fake_irte'
   ld: vmlinux.o:arch/x86/kvm/svm/avic.c:1074: more undefined references to `amd_iommu_fake_irte' follow


vim +1074 arch/x86/kvm/svm/avic.c

  1068	
  1069	static void avic_pi_handler(void)
  1070	{
  1071		struct amd_iommu_pi_data pi;
  1072		struct kvm_vcpu *vcpu;
  1073	
> 1074		memcpy(&pi, &amd_iommu_fake_irte, sizeof(pi));
  1075	
  1076		if (!pi.is_guest_mode) {
  1077			pr_warn("IRQ %u arrived with !is_guest_mode\n", pi.vector);
  1078			return;
  1079		}
  1080	
  1081		vcpu = avic_ga_log_get_vcpu(pi.ga_tag);
  1082		if (!vcpu) {
  1083			pr_warn("No vCPU for IRQ %u\n", pi.vector);
  1084			return;
  1085		}
  1086		WARN_ON_ONCE(pi.vapic_addr << 12 != avic_get_backing_page_address(to_svm(vcpu)));
  1087	
  1088		/*
  1089		 * When updating a vCPU's IRTE, the fake posted IRQ can race with the
  1090		 * IRTE update.  Take ir_list_lock so that the IRQ can be processed
  1091		 * atomically.  In real hardware, the IOMMU will complete IRQ delivery
  1092		 * before accepting the new IRTE.
  1093		 */
  1094		guard(spinlock_irqsave)(&to_svm(vcpu)->ir_list_lock);
  1095	
  1096		if (amd_iommu_fake_irte.ga_tag != pi.ga_tag) {
  1097			WARN_ON_ONCE(amd_iommu_fake_irte.is_guest_mode);
  1098			return;
  1099		}
  1100	
  1101		memcpy(&pi, &amd_iommu_fake_irte, sizeof(pi));
  1102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
