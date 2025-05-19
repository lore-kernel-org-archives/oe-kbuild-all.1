Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADD720E6EB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 14:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665218; cv=none; b=ZhXP8o0D2tMopT7lf/BkSDPyjw3WnvAlq1autr19z0qCXFRLgIgS5aaFZhlZrrhn5BvshCR6FcmXzeONpxEuKiP3JjyJRvm+F+r6x/uEtzA8RDlTKrfot8lAgCVzLWTZS5Dc5ZtM+4qaPKUslhIqhtRrcsj5VZm/mQkrstKbEUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665218; c=relaxed/simple;
	bh=V2AqlgM2v+yzhiQHtDO0hFFlbzrZ+rmKfY59fpH2BpM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ByiarSY6Ao7i7993ep6mK/9Z7J+swgExfcCacBadUzGEmgq32r4Rjw4YDB8bq2+AQT3+SndwqYjNYKkijx4D6GC9yjhC1SedJARJhf3YTvtsA8bItNH2d6HfFNgKo2VWXQJdI8wl+ABO/B4S02WT/Zs31uSVaVB4XigL3GyYQjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tc4vGD4D; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tc4vGD4D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747665216; x=1779201216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V2AqlgM2v+yzhiQHtDO0hFFlbzrZ+rmKfY59fpH2BpM=;
  b=Tc4vGD4DP+EW7kc/d8f5ZVxGhzriR8gn3zdXXJfuC7fNWC3Yn9O9xofR
   R//zFM7qf79G9aOWuhYta80yJyVR2P8MSqaTBUZRJZvgpKoxxW+BctOMu
   Uyylf6Aa4kHrYbN+4cT5hyz6+gPVzqBdQXMR4ThcElg5EwqgKSYn3vIrH
   KAZJU6O3bQ2D+DixefCdVfqi/bZ4qprr55vkTRabGIjvXLquTFw+CsIOi
   ivFeM4x50nWVNtzNW0j70XY2aPyJse44LMqSn3CsYUAUKU1IfMKroaB6b
   3XD6lfCZKcE0TKKk5Hf2HPyVv0DNTidq1SWmCfEES6jXVNxoLzzrzReTU
   g==;
X-CSE-ConnectionGUID: Y2ZawbRzQ8y3HTW3fQr4aA==
X-CSE-MsgGUID: 39m1a0fAQdW3yZ/+mq9PAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49632743"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="49632743"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 07:33:35 -0700
X-CSE-ConnectionGUID: 3dC0xdcJT8CwVjKvk9+jGg==
X-CSE-MsgGUID: 3ErBFJwHS8+Ghgd5DLAnBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="139435059"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 May 2025 07:33:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uH1Ya-000LZk-0P;
	Mon, 19 May 2025 14:33:32 +0000
Date: Mon, 19 May 2025 22:32:56 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>,
	Fuad Tabba <tabba@google.com>
Subject: [weiny2:ackerley-1g-master 24/75]
 arch/powerpc/kvm/../../../virt/kvm/guest_memfd.c:431:30: error:
 'GUEST_MEMFD_MAGIC' undeclared
Message-ID: <202505192226.USrgNsjs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git ackerley-1g-master
head:   773f26b5bef6e4d3094a33605165a5c6ab9aa0f0
commit: 907fd36df148056d5eaa45850e722970a33fc7ec [24/75] KVM: guest_memfd: Make guest mem use guest mem inodes instead of anonymous inodes
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20250519/202505192226.USrgNsjs-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505192226.USrgNsjs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505192226.USrgNsjs-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kvm/../../../virt/kvm/guest_memfd.c: In function 'kvm_gmem_init_fs_context':
>> arch/powerpc/kvm/../../../virt/kvm/guest_memfd.c:431:30: error: 'GUEST_MEMFD_MAGIC' undeclared (first use in this function)
     431 |         if (!init_pseudo(fc, GUEST_MEMFD_MAGIC))
         |                              ^~~~~~~~~~~~~~~~~
   arch/powerpc/kvm/../../../virt/kvm/guest_memfd.c:431:30: note: each undeclared identifier is reported only once for each function it appears in
   arch/powerpc/kvm/../../../virt/kvm/guest_memfd.c: In function 'kvm_gmem_create':
   arch/powerpc/kvm/../../../virt/kvm/guest_memfd.c:654:13: error: implicit declaration of function 'kvm_arch_vm_supports_gmem_shared_mem' [-Wimplicit-function-declaration]
     654 |         if (kvm_arch_vm_supports_gmem_shared_mem(kvm))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/GUEST_MEMFD_MAGIC +431 arch/powerpc/kvm/../../../virt/kvm/guest_memfd.c

   426	
   427	static int kvm_gmem_init_fs_context(struct fs_context *fc)
   428	{
   429		struct pseudo_fs_context *ctx;
   430	
 > 431		if (!init_pseudo(fc, GUEST_MEMFD_MAGIC))
   432			return -ENOMEM;
   433	
   434		ctx = fc->fs_private;
   435		ctx->ops = &kvm_gmem_super_operations;
   436	
   437		return 0;
   438	}
   439	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
