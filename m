Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F8A1FA5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 00:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727829319; cv=none; b=KTeEaEYrMKR6fQPGwqasxRpHMRJao6xOaQSTiDv4A+m3QRxttEoi9HY75KCxoLulzi7IlWemWGPNZSoOv/0MlFrFfMiwZYc5WrTuhhVPpkfdS0Ut98F7u/h+FySfyOD0YqzoKjk2Xydger21wzQfNN8HPxAp02mYzzM0HcTPOWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727829319; c=relaxed/simple;
	bh=b/KfAWehbIzs0jZfqlLrmMm9gT8LC1D/4VnXt/QUMLA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p8UzDyxXEcyFUQAcyLJv29cvhy/YLJQ5E8Ojo/F+l81E0Yg6FeCaU0lqip9HYRMLbO0Ce/g9s3ok9AOzV+NBvmEkg7V5qTEqZglje7A0DiozuiN8x1hn54r3tIO2WA+nZQ5q3VPu1S9QzBfwdgO0Hk/1Dt6FCxnnPpaJzjzwWlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PXoUam3p; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PXoUam3p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727829318; x=1759365318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b/KfAWehbIzs0jZfqlLrmMm9gT8LC1D/4VnXt/QUMLA=;
  b=PXoUam3pAIBkr+L5NMiPpFa5QbG8AxFmT8pChrRi0NktSSY1ONhsi34s
   3HnpDU6dKYOs3B3ggHDE1YFj6H+mWwXOYthBQuebYcPiK0ojwmrUlDUMF
   mHEmhFiI5y+owJNZXtvzPs1b/haxx5CvDMJRaxHJGMrBZ31qNKTRx31qS
   TQmJX58x9qEijALBZcO2yikTCwb2ZLVS5NOdfQzXWYYY2G46VkDktzgde
   Efw0b1yiLzeaYsTx+RKX4+bhxxrA9eFamFpvIq0v/xBb13CQIEwIUaCqH
   YG5RYKC2jKMWy+Sc+V3520/KJzb0yQbs0tDIonhzIatvC/mqmF7sWwHP5
   A==;
X-CSE-ConnectionGUID: T/4G8iDURhOeW6XrRs9Qeg==
X-CSE-MsgGUID: ncNgIyOITQKnJY+smWem1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="37662251"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="37662251"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 17:35:17 -0700
X-CSE-ConnectionGUID: P8ZiruNoQMG6vQ8e62WqEA==
X-CSE-MsgGUID: 9XvTVNadRw2eAvwRJo9Hdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="97199631"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Oct 2024 17:35:17 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svnKj-000RMN-3A;
	Wed, 02 Oct 2024 00:35:13 +0000
Date: Wed, 2 Oct 2024 08:34:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-f9d942cf7d57 239/1491]
 arch/x86/kvm/x86.c:10692:13: warning: 'kvm_vcpu_pv_sched_init' defined but
 not used
Message-ID: <202410020800.y8eUAO5g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-f9d942cf7d57
head:   ef2c757e09b49fa8c905e77b7c1e55ccf2be08ee
commit: c3948d53e4231f38d775cbce0ce59e30aae26632 [239/1491] CHROMIUM: kvm: x86: paravirt sched framework
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241002/202410020800.y8eUAO5g-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020800.y8eUAO5g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020800.y8eUAO5g-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/x86.c:10692:13: warning: 'kvm_vcpu_pv_sched_init' defined but not used [-Wunused-function]
   10692 | static void kvm_vcpu_pv_sched_init(struct kvm_vcpu *vcpu)
         |             ^~~~~~~~~~~~~~~~~~~~~~


vim +/kvm_vcpu_pv_sched_init +10692 arch/x86/kvm/x86.c

 10691	
 10692	static void kvm_vcpu_pv_sched_init(struct kvm_vcpu *vcpu)
 10693	{
 10694		kvm_arch_vcpu_set_kerncs_prio(&vcpu->arch, VCPU_KERN_CS_PRIO);
 10695		kvm_arch_vcpu_set_kerncs_policy(&vcpu->arch, VCPU_KERN_CS_POLICY);
 10696		kvm_arch_vcpu_set_default_sched_attr(&vcpu->arch, kvm_vcpu_get_sched(vcpu));
 10697	}
 10698	#else
 10699	static inline void record_vcpu_pv_sched(struct kvm_vcpu *vcpu) { }
 10700	static inline void kvm_vcpu_do_pv_sched(struct kvm_vcpu *vcpu) { }
 10701	static inline void kvm_vcpu_pv_sched_init(struct kvm_vcpu *vcpu) { }
 10702	#endif
 10703	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
