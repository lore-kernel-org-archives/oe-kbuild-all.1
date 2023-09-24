Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF01A654
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Sep 2023 04:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695528399; x=1727064399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=efg9XCfpiHKIVzUE/lLLomVKor5PTga+ky8+ocreh3M=;
  b=iu3t9zYBx9kRe1HlRStWjQ+t+TfbuQfA5OfzuoNUlfLWOBpVL7Iqu/DX
   iX/ej5WwFPskMjpIciv0rJQK+Kk2ijJcrj+YulFepvaMGiH0IRRjmmHiW
   +uqzz+sMYwR1V38//KsmbJERaerMaFoB+BNv3VA07Cdh9ReTTnOvo5EKE
   0G+4SrvHiwChPnYLo/Z2aIOemWiSeLLJaeIjC8mrUkzytfw4cTk48FXSm
   8SWj2TA9rDExVQ/cQTIdMkf+16I+rtG0N4ZKiovuGJNkoK+3oTMeDDPSF
   /V0B503u3cwWL4iSWE9AFHnk9NkBeSzeiY29iW6siRu+gIXhPrkq3TzDx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="383832104"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="383832104"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 21:06:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="1078829017"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="1078829017"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 23 Sep 2023 21:06:38 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkGOC-0003Cz-02;
	Sun, 24 Sep 2023 04:06:36 +0000
Date: Sun, 24 Sep 2023 12:05:51 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:kvm-arm64-sme 18/27] arch/arm64/kvm/guest.c:325:21:
 error: implicit declaration of function 'vq_available'; did you mean
 'sve_vq_available'?
Message-ID: <202309241102.5RKw4zQU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kvm-arm64-sme
head:   3e5863d28a938ea056bd9d37038f775e5b2bc2ba
commit: a8e878a2374c3cc1f74304beb371d5a747d50c92 [18/27] KVM: arm64: Implement SME vector length configuration
config: arm64-randconfig-004-20230924 (https://download.01.org/0day-ci/archive/20230924/202309241102.5RKw4zQU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309241102.5RKw4zQU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309241102.5RKw4zQU-lkp@intel.com/

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
