Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40F3FC01
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 06:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710483368; cv=none; b=DlC/sT7L0FAd/+Oq7iFOqTEMLiSLDy/oDLIWYa1whBA/y9/oYeu4eUOEyZHtYUEb58dfYS6ul4WgkUi+sr1VV4YyWyeSX6bwR17EsXtol7BX8brhE5lzfgCffyjiRYwMEP6bmWmzDtZRAQMaARHJRWEPWOkBEXl85PlCr3Wn2CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710483368; c=relaxed/simple;
	bh=zVZlchyYPC6UfzJ6Pel8Is51EX98jzcWX8pIQcb4BeM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lVncbqe2tAHy5x9nz4OmWJwKsoO8CAJChQHmINruumAbRolPY7k8pa76XC83NOTVfcNTsd4JQh23ZNeJJj/YMD0rR3B4SY+1b3942j1Usjl9B7FeTAwMtxiSEPb5q2EM9u3dprYHpXpsPbAFMdCPBApqSvdIQw5DyR7KzWLLgkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y58mw98k; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y58mw98k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710483363; x=1742019363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zVZlchyYPC6UfzJ6Pel8Is51EX98jzcWX8pIQcb4BeM=;
  b=Y58mw98kCofjG2zW8nSNPxeOHBP6oV0ODROz3BFe2YwvP59cWPWwEfpd
   5Iqwd/lpW2EzLaz1Z/Uo//K6Yj8ZKmnzLnuQLiWaFa8WPRWGgCWLTxUwj
   UiGay8N1hV67KsLKjaWUd9gdRbyls7BHzENi/EqOJif2Fee27gVPOb3IK
   dXdVHG/LY19ScdREVkVI+tBtW8kMml27oN1DYl54Pk2T6AyeMT5MqkKFC
   GRLwJZUyLFX6AZbEKz0JVXXSp5l3lP1+jvy90kN6/pzgYWwCaTDUdTn9a
   UbIkau31TivkBobNP7v/5FBz9JlI49IB8uvjdnBaz8UD6s/84f3/RNpjV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="8278337"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="8278337"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 23:16:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="13012830"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Mar 2024 23:15:58 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rl0rE-000EBV-0C;
	Fri, 15 Mar 2024 06:15:56 +0000
Date: Fri, 15 Mar 2024 14:15:28 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: arch/arm64/kvm/../../../virt/kvm/arm/arm.c:212:21: error:
 'KVM_MAX_VCPU_ID' undeclared; did you mean 'KVM_MAX_VCPU_IDS'?
Message-ID: <202403151458.02U5QNPM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhuo,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   c13208f42a275b32080b8b1f05865c408364ef9f
commit: 1eb67485861c9474b53c1feebdaa3bbc5cf9e2cc kvm: rename KVM_MAX_VCPU_ID to KVM_MAX_VCPU_IDS
date:   9 months ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240315/202403151458.02U5QNPM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403151458.02U5QNPM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403151458.02U5QNPM-lkp@intel.com/

Note: the opencloudos/linux-5.4/lts/5.4.119-20.0009.spr HEAD c13208f42a275b32080b8b1f05865c408364ef9f builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   arch/arm64/kvm/../../../virt/kvm/arm/arm.c:147:5: warning: no previous prototype for 'kvm_arch_create_vcpu_debugfs' [-Wmissing-prototypes]
     147 | int kvm_arch_create_vcpu_debugfs(struct kvm_vcpu *vcpu)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/arm/arm.c: In function 'kvm_vm_ioctl_check_extension':
>> arch/arm64/kvm/../../../virt/kvm/arm/arm.c:212:21: error: 'KVM_MAX_VCPU_ID' undeclared (first use in this function); did you mean 'KVM_MAX_VCPU_IDS'?
     212 |                 r = KVM_MAX_VCPU_ID;
         |                     ^~~~~~~~~~~~~~~
         |                     KVM_MAX_VCPU_IDS
   arch/arm64/kvm/../../../virt/kvm/arm/arm.c:212:21: note: each undeclared identifier is reported only once for each function it appears in


vim +212 arch/arm64/kvm/../../../virt/kvm/arm/arm.c

^590eaf1fec755 Kaixu Xia 2021-03-16  179  
^590eaf1fec755 Kaixu Xia 2021-03-16  180  int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
^590eaf1fec755 Kaixu Xia 2021-03-16  181  {
^590eaf1fec755 Kaixu Xia 2021-03-16  182  	int r;
^590eaf1fec755 Kaixu Xia 2021-03-16  183  	switch (ext) {
^590eaf1fec755 Kaixu Xia 2021-03-16  184  	case KVM_CAP_IRQCHIP:
^590eaf1fec755 Kaixu Xia 2021-03-16  185  		r = vgic_present;
^590eaf1fec755 Kaixu Xia 2021-03-16  186  		break;
^590eaf1fec755 Kaixu Xia 2021-03-16  187  	case KVM_CAP_IOEVENTFD:
^590eaf1fec755 Kaixu Xia 2021-03-16  188  	case KVM_CAP_DEVICE_CTRL:
^590eaf1fec755 Kaixu Xia 2021-03-16  189  	case KVM_CAP_USER_MEMORY:
^590eaf1fec755 Kaixu Xia 2021-03-16  190  	case KVM_CAP_SYNC_MMU:
^590eaf1fec755 Kaixu Xia 2021-03-16  191  	case KVM_CAP_DESTROY_MEMORY_REGION_WORKS:
^590eaf1fec755 Kaixu Xia 2021-03-16  192  	case KVM_CAP_ONE_REG:
^590eaf1fec755 Kaixu Xia 2021-03-16  193  	case KVM_CAP_ARM_PSCI:
^590eaf1fec755 Kaixu Xia 2021-03-16  194  	case KVM_CAP_ARM_PSCI_0_2:
^590eaf1fec755 Kaixu Xia 2021-03-16  195  	case KVM_CAP_READONLY_MEM:
^590eaf1fec755 Kaixu Xia 2021-03-16  196  	case KVM_CAP_MP_STATE:
^590eaf1fec755 Kaixu Xia 2021-03-16  197  	case KVM_CAP_IMMEDIATE_EXIT:
^590eaf1fec755 Kaixu Xia 2021-03-16  198  	case KVM_CAP_VCPU_EVENTS:
^590eaf1fec755 Kaixu Xia 2021-03-16  199  	case KVM_CAP_ARM_IRQ_LINE_LAYOUT_2:
^590eaf1fec755 Kaixu Xia 2021-03-16  200  		r = 1;
^590eaf1fec755 Kaixu Xia 2021-03-16  201  		break;
^590eaf1fec755 Kaixu Xia 2021-03-16  202  	case KVM_CAP_ARM_SET_DEVICE_ADDR:
^590eaf1fec755 Kaixu Xia 2021-03-16  203  		r = 1;
^590eaf1fec755 Kaixu Xia 2021-03-16  204  		break;
^590eaf1fec755 Kaixu Xia 2021-03-16  205  	case KVM_CAP_NR_VCPUS:
^590eaf1fec755 Kaixu Xia 2021-03-16  206  		r = num_online_cpus();
^590eaf1fec755 Kaixu Xia 2021-03-16  207  		break;
^590eaf1fec755 Kaixu Xia 2021-03-16  208  	case KVM_CAP_MAX_VCPUS:
^590eaf1fec755 Kaixu Xia 2021-03-16  209  		r = KVM_MAX_VCPUS;
^590eaf1fec755 Kaixu Xia 2021-03-16  210  		break;
^590eaf1fec755 Kaixu Xia 2021-03-16  211  	case KVM_CAP_MAX_VCPU_ID:
^590eaf1fec755 Kaixu Xia 2021-03-16 @212  		r = KVM_MAX_VCPU_ID;
^590eaf1fec755 Kaixu Xia 2021-03-16  213  		break;
^590eaf1fec755 Kaixu Xia 2021-03-16  214  	case KVM_CAP_MSI_DEVID:
^590eaf1fec755 Kaixu Xia 2021-03-16  215  		if (!kvm)
^590eaf1fec755 Kaixu Xia 2021-03-16  216  			r = -EINVAL;
^590eaf1fec755 Kaixu Xia 2021-03-16  217  		else
^590eaf1fec755 Kaixu Xia 2021-03-16  218  			r = kvm->arch.vgic.msis_require_devid;
^590eaf1fec755 Kaixu Xia 2021-03-16  219  		break;
^590eaf1fec755 Kaixu Xia 2021-03-16  220  	case KVM_CAP_ARM_USER_IRQ:
^590eaf1fec755 Kaixu Xia 2021-03-16  221  		/*
^590eaf1fec755 Kaixu Xia 2021-03-16  222  		 * 1: EL1_VTIMER, EL1_PTIMER, and PMU.
^590eaf1fec755 Kaixu Xia 2021-03-16  223  		 * (bump this number if adding more devices)
^590eaf1fec755 Kaixu Xia 2021-03-16  224  		 */
^590eaf1fec755 Kaixu Xia 2021-03-16  225  		r = 1;
^590eaf1fec755 Kaixu Xia 2021-03-16  226  		break;
^590eaf1fec755 Kaixu Xia 2021-03-16  227  	default:
^590eaf1fec755 Kaixu Xia 2021-03-16  228  		r = kvm_arch_vm_ioctl_check_extension(kvm, ext);
^590eaf1fec755 Kaixu Xia 2021-03-16  229  		break;
^590eaf1fec755 Kaixu Xia 2021-03-16  230  	}
^590eaf1fec755 Kaixu Xia 2021-03-16  231  	return r;
^590eaf1fec755 Kaixu Xia 2021-03-16  232  }
^590eaf1fec755 Kaixu Xia 2021-03-16  233  

:::::: The code at line 212 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
