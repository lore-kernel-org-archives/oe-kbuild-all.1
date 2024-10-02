Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C533E1CDA20
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 10:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727864057; cv=none; b=pNpTSF+RL79ksVFs5y25svHH4i28iDKDMX3Q0djAoSw6EK/hKJREbEu6i4lu1MQA2GB7f+EEbiZ/KN/04FBsDdFJrEUV7TjOwh4UWoImr2Wmd+awsRxsGr2Rrp6ISDSYqpIgRqM/L6FwoKYrBF6/hSN0QLXsTegRlb9paW9nPIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727864057; c=relaxed/simple;
	bh=/GW160ErcDtT+CfYuMy0/0/VYV+CXhfiqvpWx1mWlDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C25fpgjMoMC1dhCpTkhH2+IQftfILieCsoSvN3Q9Wr4/W4DvgwavmqexHEvAyk6/w9i1vYRXTe21947TSGxp6EwX/tqHtccCPPMZ+EE6wiO5fO9ZZHkTRF55JpHQMohVGSCIMII+ICRf2ITXX+8DbYx3cMk7SxFk5RuUfWMVRIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iV0zBiYj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iV0zBiYj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727864055; x=1759400055;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/GW160ErcDtT+CfYuMy0/0/VYV+CXhfiqvpWx1mWlDc=;
  b=iV0zBiYjSGAqdXVLUtQID4J4Oq59aP9Mm1KpBwiW4iR5x48e93wKw1Ic
   8rzYJxg2cU1Tg8GlTQM7w+LnfKXbpfaaZW7s1uG+Rdue/FXZ1RVJvRj62
   IH2HwjQTSBqET2BjFcONZa08KHlh8KkSBrzrfcfQvLyyoJ8DR0LdhDQ19
   ElRu+yAD3frpUGDuPurAoBX2ucX3Yy83qDfriPgJxzFY3E1y16XGQkbpI
   CD4W93TDZMut3UlyxV/m7DdvE6tptupvaoo0fVQOR0uJsKuD+VSxUJ+LI
   ze63VdbmBvyLXKjbzUGDTo2OEHee7OxdTKiVAfrAjl0jxAcVY6fEB97LE
   g==;
X-CSE-ConnectionGUID: hzo7IvhpQ7uhiv3jxB/u6g==
X-CSE-MsgGUID: mSko0e4wRnKLGYuPoQx1eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="49544138"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="49544138"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 03:14:15 -0700
X-CSE-ConnectionGUID: iIPGbj5wSImvc2lKZevlGw==
X-CSE-MsgGUID: 1SGyAgasR3ym56gwf7+qqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="74195385"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Oct 2024 03:14:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svwMy-000RuT-38;
	Wed, 02 Oct 2024 10:14:08 +0000
Date: Wed, 2 Oct 2024 18:13:47 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1975/2444]
 arch/arm64/kvm/../../../virt/kvm/arm/arm.c:212:21: error: 'KVM_MAX_VCPU_ID'
 undeclared; did you mean 'KVM_MAX_VCPU_IDS'?
Message-ID: <202410021816.q5OfpeQM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Zhuo,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   aabcc6dc6d7f9e12baf1f117341469c84afd545d
commit: 2e1cb4523f3590fd773eeea95c0a8c436308a98a [1975/2444] kvm: rename KVM_MAX_VCPU_ID to KVM_MAX_VCPU_IDS
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241002/202410021816.q5OfpeQM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021816.q5OfpeQM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021816.q5OfpeQM-lkp@intel.com/

Note: the opencloudos/linux-5.4/lts/5.4.119-20.0009.spr HEAD aabcc6dc6d7f9e12baf1f117341469c84afd545d builds fine.
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

749cf76c5a363e arch/arm/kvm/arm.c Christoffer Dall 2013-01-20  179  
784aa3d7fb6f72 arch/arm/kvm/arm.c Alexander Graf   2014-07-14  180  int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
749cf76c5a363e arch/arm/kvm/arm.c Christoffer Dall 2013-01-20  181  {
749cf76c5a363e arch/arm/kvm/arm.c Christoffer Dall 2013-01-20  182  	int r;
749cf76c5a363e arch/arm/kvm/arm.c Christoffer Dall 2013-01-20  183  	switch (ext) {
1a89dd9113badd arch/arm/kvm/arm.c Marc Zyngier     2013-01-21  184  	case KVM_CAP_IRQCHIP:
c7da6fa43cb1c5 arch/arm/kvm/arm.c Pavel Fedin      2015-12-18  185  		r = vgic_present;
c7da6fa43cb1c5 arch/arm/kvm/arm.c Pavel Fedin      2015-12-18  186  		break;
d44758c0dfc599 arch/arm/kvm/arm.c Nikolay Nikolaev 2015-01-24  187  	case KVM_CAP_IOEVENTFD:
7330672befe626 arch/arm/kvm/arm.c Christoffer Dall 2013-10-25  188  	case KVM_CAP_DEVICE_CTRL:
749cf76c5a363e arch/arm/kvm/arm.c Christoffer Dall 2013-01-20  189  	case KVM_CAP_USER_MEMORY:
749cf76c5a363e arch/arm/kvm/arm.c Christoffer Dall 2013-01-20  190  	case KVM_CAP_SYNC_MMU:
749cf76c5a363e arch/arm/kvm/arm.c Christoffer Dall 2013-01-20  191  	case KVM_CAP_DESTROY_MEMORY_REGION_WORKS:
749cf76c5a363e arch/arm/kvm/arm.c Christoffer Dall 2013-01-20  192  	case KVM_CAP_ONE_REG:
aa024c2f35a07c arch/arm/kvm/arm.c Marc Zyngier     2013-01-20  193  	case KVM_CAP_ARM_PSCI:
4447a208f7fc2e arch/arm/kvm/arm.c Anup Patel       2014-04-29  194  	case KVM_CAP_ARM_PSCI_0_2:
98047888bb9fd5 arch/arm/kvm/arm.c Christoffer Dall 2014-08-19  195  	case KVM_CAP_READONLY_MEM:
ecccf0cc722f40 arch/arm/kvm/arm.c Alex Bennée      2015-03-13  196  	case KVM_CAP_MP_STATE:
460df4c1fc7c00 arch/arm/kvm/arm.c Paolo Bonzini    2017-02-08  197  	case KVM_CAP_IMMEDIATE_EXIT:
58bf437ff64eac virt/kvm/arm/arm.c Dongjiu Geng     2018-10-13  198  	case KVM_CAP_VCPU_EVENTS:
92f35b751c71d1 virt/kvm/arm/arm.c Marc Zyngier     2019-08-18  199  	case KVM_CAP_ARM_IRQ_LINE_LAYOUT_2:
749cf76c5a363e arch/arm/kvm/arm.c Christoffer Dall 2013-01-20  200  		r = 1;
749cf76c5a363e arch/arm/kvm/arm.c Christoffer Dall 2013-01-20  201  		break;
3401d54696f992 arch/arm/kvm/arm.c Christoffer Dall 2013-01-23  202  	case KVM_CAP_ARM_SET_DEVICE_ADDR:
3401d54696f992 arch/arm/kvm/arm.c Christoffer Dall 2013-01-23  203  		r = 1;
ca46e10fb239d4 arch/arm/kvm/arm.c Marc Zyngier     2013-04-03  204  		break;
749cf76c5a363e arch/arm/kvm/arm.c Christoffer Dall 2013-01-20  205  	case KVM_CAP_NR_VCPUS:
749cf76c5a363e arch/arm/kvm/arm.c Christoffer Dall 2013-01-20  206  		r = num_online_cpus();
749cf76c5a363e arch/arm/kvm/arm.c Christoffer Dall 2013-01-20  207  		break;
749cf76c5a363e arch/arm/kvm/arm.c Christoffer Dall 2013-01-20  208  	case KVM_CAP_MAX_VCPUS:
749cf76c5a363e arch/arm/kvm/arm.c Christoffer Dall 2013-01-20  209  		r = KVM_MAX_VCPUS;
749cf76c5a363e arch/arm/kvm/arm.c Christoffer Dall 2013-01-20  210  		break;
a86cb413f4bf27 virt/kvm/arm/arm.c Thomas Huth      2019-05-23  211  	case KVM_CAP_MAX_VCPU_ID:
a86cb413f4bf27 virt/kvm/arm/arm.c Thomas Huth      2019-05-23 @212  		r = KVM_MAX_VCPU_ID;
a86cb413f4bf27 virt/kvm/arm/arm.c Thomas Huth      2019-05-23  213  		break;
2988509dd8a0e9 arch/arm/kvm/arm.c Vladimir Murzin  2016-11-02  214  	case KVM_CAP_MSI_DEVID:
2988509dd8a0e9 arch/arm/kvm/arm.c Vladimir Murzin  2016-11-02  215  		if (!kvm)
2988509dd8a0e9 arch/arm/kvm/arm.c Vladimir Murzin  2016-11-02  216  			r = -EINVAL;
2988509dd8a0e9 arch/arm/kvm/arm.c Vladimir Murzin  2016-11-02  217  		else
2988509dd8a0e9 arch/arm/kvm/arm.c Vladimir Murzin  2016-11-02  218  			r = kvm->arch.vgic.msis_require_devid;
2988509dd8a0e9 arch/arm/kvm/arm.c Vladimir Murzin  2016-11-02  219  		break;
f7214e6023c86c arch/arm/kvm/arm.c Christoffer Dall 2017-02-01  220  	case KVM_CAP_ARM_USER_IRQ:
f7214e6023c86c arch/arm/kvm/arm.c Christoffer Dall 2017-02-01  221  		/*
f7214e6023c86c arch/arm/kvm/arm.c Christoffer Dall 2017-02-01  222  		 * 1: EL1_VTIMER, EL1_PTIMER, and PMU.
f7214e6023c86c arch/arm/kvm/arm.c Christoffer Dall 2017-02-01  223  		 * (bump this number if adding more devices)
f7214e6023c86c arch/arm/kvm/arm.c Christoffer Dall 2017-02-01  224  		 */
f7214e6023c86c arch/arm/kvm/arm.c Christoffer Dall 2017-02-01  225  		r = 1;
f7214e6023c86c arch/arm/kvm/arm.c Christoffer Dall 2017-02-01  226  		break;
749cf76c5a363e arch/arm/kvm/arm.c Christoffer Dall 2013-01-20  227  	default:
375bdd3b5d4f7c virt/kvm/arm/arm.c Dongjiu Geng     2018-10-13  228  		r = kvm_arch_vm_ioctl_check_extension(kvm, ext);
749cf76c5a363e arch/arm/kvm/arm.c Christoffer Dall 2013-01-20  229  		break;
749cf76c5a363e arch/arm/kvm/arm.c Christoffer Dall 2013-01-20  230  	}
749cf76c5a363e arch/arm/kvm/arm.c Christoffer Dall 2013-01-20  231  	return r;
749cf76c5a363e arch/arm/kvm/arm.c Christoffer Dall 2013-01-20  232  }
749cf76c5a363e arch/arm/kvm/arm.c Christoffer Dall 2013-01-20  233  

:::::: The code at line 212 was first introduced by commit
:::::: a86cb413f4bf273a9d341a3ab2c2ca44e12eb317 KVM: s390: Do not report unusabled IDs via KVM_CAP_MAX_VCPU_ID

:::::: TO: Thomas Huth <thuth@redhat.com>
:::::: CC: Christian Borntraeger <borntraeger@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
