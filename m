Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421EB36A375
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 07:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790406420; cv=none; b=V/Sgm04av+wXrFK5IuoUEPt2W6N4dFvxLE7oMTRMeYMcIBOkFY6bJrn5p/bG8zEE8BhqTewbU/eUAM9mQ10R2eSwifoyJtdzrnDZV9DPysbwsDVm/HeLuR6RnMURfGalvzOisIv+sYsZ4x06/w28fEA4RmMDcon6NPG9CUFuKaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790406420; c=relaxed/simple;
	bh=nzVsIvGDpA3Xtf1AAc9cNx3YbBUsM91qIKNoPtl7MVk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nRnlejPMh3sXJnRoDVUzUvXSynvNkww8+1F7lEmqyiBtmShJlx5cminncHmoShvkh2ynb8vf2zR5POlJ9E7OLU6cw1mwtod+qAl78vsSu7LwFJzfp4/QN20lLmj9hfGbzy22wJ6DShWKFMFnLVFdBk09b5YuU2Zo6dO9WPfig0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YLxX4pH5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YLxX4pH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790406416; x=1821942416;
  h=date:from:to:cc:subject:message-id;
  bh=nzVsIvGDpA3Xtf1AAc9cNx3YbBUsM91qIKNoPtl7MVk=;
  b=YLxX4pH5WgFXUU3uTx31XYcQh58Pcy/CAmLGoVuHbkBP090AsJ+v86tJ
   jsOXLqSrBEdWPsXMqmAnuPPO/QGwExLQgHkV0lIjnJ4jmnkRFMU+RVrWK
   aeqXpZIR4pmsvX8BJtFx8EXSS0ix1aKEpNDWghFywh9YheAnl0x17xZD3
   Odm25T2Ke4WYvhYCXGy5ZP3kyEhPX6UggEEr35uUrnD9rXtyXA4+smCP8
   p125gSZkeNFedkgGsNaDhttGfK78m+oPt6ZMVfgOTzOqoY13IHh7WvXlT
   R2A7tYNAojJwRpfg92eHfTh/jzUBGGYbuJUZEV8/enu7reVKC7a/WTheh
   g==;
X-CSE-ConnectionGUID: fej64sqRRzGgRBC3jShF6Q==
X-CSE-MsgGUID: P8WpE9V0SjqzBIS867kymg==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90225258"
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="90225258"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 00:06:54 -0700
X-CSE-ConnectionGUID: TAUwvz0eSr+DefJC/ovn+Q==
X-CSE-MsgGUID: rm3fGxE2QOyaIG9BhFt/1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="273731761"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Sep 2026 00:06:53 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAMUk-00000000Lbp-2zxk;
	Sat, 26 Sep 2026 07:06:50 +0000
Date: Sat, 26 Sep 2026 15:06:38 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:tdx/triple_fault_on_pending_sept 93/95]
 include/linux/kvm_host.h:2529:6: error: 'struct kvm_vcpu' has no member named
 'mmio_needed'
Message-ID: <202609261456.7kyCYHvf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux tdx/triple_fault_on_pending_sept
head:   bdd6b6c0176b2b8645c34a3326f6aa5b9cb66d14
commit: c238f70d432aeea545b2d74b7d9815386530474d [93/95] KVM: x86: Add a helper to prepare vcpu->run for a SHUTDOWN exit to userspace
config: s390-randconfig-1001-20260926 (https://download.01.org/0day-ci/archive/20260926/202609261456.7kyCYHvf-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609261456.7kyCYHvf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609261456.7kyCYHvf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/nmi.c:24:
   include/linux/kvm_host.h: In function 'kvm_prepare_shutdown_exit':
>> include/linux/kvm_host.h:2529:6: error: 'struct kvm_vcpu' has no member named 'mmio_needed'
     vcpu->mmio_needed = 0;
         ^~


vim +2529 include/linux/kvm_host.h

  2525	
  2526	static inline void kvm_prepare_shutdown_exit(struct kvm_vcpu *vcpu)
  2527	{
  2528		vcpu->run->exit_reason = KVM_EXIT_SHUTDOWN;
> 2529		vcpu->mmio_needed = 0;
  2530	}
  2531	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
