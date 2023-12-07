Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202732908
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Dec 2023 13:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZGB/yF9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701956448; x=1733492448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mmA5z1ipxouD/3eLpGFBl6hygC1SnKSZ8arwoswg3CQ=;
  b=eZGB/yF9kvVxthVowWUJgs0gi82RFscVn5AUX6B/7792i3MH5952VFmX
   bUyeDIomyZc6IwAQpK6KnDjSHYN7P5hu+NntLKVGN2ZA+4eB/SQE1SfXB
   sIXTmXkB0uzBdOD1LmT4ob5mahilt1DAww/dLUQhdiThf2gy5U9wE2PH/
   Y/B7HlGZvZr1GiZTjKqueXdkHMxp3pynFhK6URRrAup3vYKT0Oh4YKmcU
   aXNZCIZs3HVu+Mrso+k7GfJ245oYjcnM6/eKAFJ5Ty0W3VhraDPJDP+0P
   HySa7T9Dp5LuF+HCZm7V3l+cqoN2HyWdfBA4waT9aCumG0K8nIeG5agbC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373721019"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="373721019"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 05:40:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="13116101"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 07 Dec 2023 05:40:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBEcO-000CJA-05;
	Thu, 07 Dec 2023 13:40:44 +0000
Date: Thu, 7 Dec 2023 21:39:46 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:kvm-arm64-sme 17/27] arch/arm64/kvm/guest.c:325:21:
 error: implicit declaration of function 'vq_available'; did you mean
 'sve_vq_available'?
Message-ID: <202312072157.sbiLz59D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kvm-arm64-sme
head:   cf8673c4f464f79c9b5528a6ca24001cb40e5605
commit: b948f3b5a5178b920f02a7295195db311ea7f215 [17/27] KVM: arm64: Implement SME vector length configuration
config: arm64-randconfig-003-20231201 (https://download.01.org/0day-ci/archive/20231207/202312072157.sbiLz59D-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312072157.sbiLz59D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312072157.sbiLz59D-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/guest.c: In function 'get_vec_vls':
>> arch/arm64/kvm/guest.c:325:21: error: implicit declaration of function 'vq_available'; did you mean 'sve_vq_available'? [-Werror=implicit-function-declaration]
     325 |                 if (vq_available(vec_type, vq))
         |                     ^~~~~~~~~~~~
         |                     sve_vq_available
   cc1: some warnings being treated as errors


vim +325 arch/arm64/kvm/guest.c

   311	
   312	static int get_vec_vls(enum vec_type vec_type, struct kvm_vcpu *vcpu,
   313			      const struct kvm_one_reg *reg)
   314	{
   315		unsigned int max_vq, vq;
   316		u64 vqs[KVM_ARM64_SVE_VLS_WORDS];
   317	
   318		if (WARN_ON(!sve_vl_valid(vcpu->arch.max_vl[vec_type])))
   319			return -EINVAL;
   320	
   321		memset(vqs, 0, sizeof(vqs));
   322	
   323		max_vq = vcpu_vec_max_vq(vec_type, vcpu);
   324		for (vq = SVE_VQ_MIN; vq <= max_vq; ++vq)
 > 325			if (vq_available(vec_type, vq))
   326				vqs[vq_word(vq)] |= vq_mask(vq);
   327	
   328		if (copy_to_user((void __user *)reg->addr, vqs, sizeof(vqs)))
   329			return -EFAULT;
   330	
   331		return 0;
   332	}
   333	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
