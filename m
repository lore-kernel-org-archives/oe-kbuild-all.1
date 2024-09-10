Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FE016C684
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 17:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725987840; cv=none; b=QvApSyAl95a++Sjb4pupADo7hbfo69i2dggy+p7GI3yfqUur5iPuuK6sEFkjE20Pw88iuE2p5WqS4+s+dsVf9uuskjag+x9hYqLpG+IKNbYEXDzyBlFBIhjyv72ijVvZEybkbZbR34f/E6Rg2t6ZFehEBCWv9xUAHNpiWLRH7aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725987840; c=relaxed/simple;
	bh=ILfy75VKoyNc8fPm0BxL+0A28LZxbGddW9+V9yEB2rs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bZgiyPex19g46XQ9BY8TjlDrAHcAgx2x01fJ1VZJJp+vbo1C1RFdIqhDEeSzyWrtZmRhW8hdx3EthJu06P10WmqrUrPgCFLONHGXU38jCMUU+4lCyJYSuSLGy4o108+aNkaGGNl4B2WRb9yIIGZB74Dwry3kEFDbXwjpmhLIHWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iDDBivi/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iDDBivi/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725987838; x=1757523838;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ILfy75VKoyNc8fPm0BxL+0A28LZxbGddW9+V9yEB2rs=;
  b=iDDBivi/+Y29ayzzI23J+b9N6KDZzUUn9cAZjE2lewB+Pud+Vmx90eP/
   Y4M1r/rCn90FrKW5jESUMCc3oRrL1HVxno3BbtJ/7Uq0z5xcvUtrDSbS5
   mI20hgcw56k1SkYPeYP9pPRyNfbb4VhbisnzYDQK88kiVTQfKt7M1/tMy
   MzwzlD+yKuwBsqL10JrnAZLEdZFn6w0+D5mTLdesWfGq6j7zk1tjas7IQ
   UKGepNgKY4IkQjP5xcCmgJJ3t40jhVQ01NNlq9jX3vEf55evOd+jWBPv1
   cAom4o2F4QWL7IzYks+Bf0pibeqE5qr00LTC8CbQ0KOp9IVVng5/+/5xD
   A==;
X-CSE-ConnectionGUID: 3QSG4mMWRjqe6fNf5WahJg==
X-CSE-MsgGUID: vKbQcJ30RAe2R+2eflhqOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="50164960"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="50164960"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 10:03:57 -0700
X-CSE-ConnectionGUID: EU9okrF/QS+Xof/ttZsJgQ==
X-CSE-MsgGUID: cLlXIWJWQheuBJIevXYBzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="71861341"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Sep 2024 10:03:56 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1so4HR-0002Pe-2R;
	Tue, 10 Sep 2024 17:03:53 +0000
Date: Wed, 11 Sep 2024 01:03:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-09 15723/17419]
 arch/arm64/kvm/arm.c:55:1: sparse: sparse: symbol
 '__pcpu_scope_kvm_arm_hyp_stack_base' was not declared. Should it be static?
Message-ID: <202409110038.cV2G6HYs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-09
head:   90126a16a9a623123963a17972c39fdee257240d
commit: f9df46617dcd6b10cb80aa8fa3f836f43941acd9 [15723/17419] ANDROID: KVM: Update nVHE stack size to 8KB
config: arm64-randconfig-r112-20240910 (https://download.01.org/0day-ci/archive/20240911/202409110038.cV2G6HYs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240911/202409110038.cV2G6HYs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409110038.cV2G6HYs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/arm.c:55:1: sparse: sparse: symbol '__pcpu_scope_kvm_arm_hyp_stack_base' was not declared. Should it be static?
   arch/arm64/kvm/arm.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:247:46: sparse: sparse: self-comparison always evaluates to false

vim +/__pcpu_scope_kvm_arm_hyp_stack_base +55 arch/arm64/kvm/arm.c

    54	
  > 55	DEFINE_PER_CPU(unsigned long, kvm_arm_hyp_stack_base);
    56	DECLARE_KVM_NVHE_PER_CPU(struct kvm_nvhe_init_params, kvm_init_params);
    57	DECLARE_KVM_NVHE_PER_CPU(int, hyp_cpu_number);
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
