Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792523142;
	b=4QkGIiwLTyPOwu+BZ7jiZXY1IbEuHrm49zzvBQhfwUr4b0acBnPWACoUGmXHF4tvbkZm
	 HZf4Q9LIvFeYd7dfmHene/Z27djpTG+X9K+1LZXCxrKj/DqyN6kgcrniFEV3jKCRaFEpx
	 RRNZ19DIT5n6jLb5JzXRTAx1+dmcQGJYPOointlJpRmA5ivinvIhXLkTzOuQLdTM5qIki
	 aYBFKhpQCccxFohM773vKgUBmtEi1cwV0mp+vvbcAUmWCOxzjBhFnzYsA9BJPL8VNQ8RA
	 u+MVfJhHfjlv3JCqc8TfOZ/raqi2+zBhYNReHN42wk0wEkrr8AmvDvjfkJ7Y+V4is1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792523142;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=fuwpmysGemuWfuPAOMvEh6o8VpFgZ+PrDzjdQygoN94=;
	b=VD3wSmjVe5Q2FDHmpZwuJGq030XT8cc1naoIewQS0gfzLOQIUF3rwT1zYoYwr8LKxEkE
	 HmfTyLSPG93VmvUBAaTUkF8S6sO/HrPA2nAwIwSJV0cx/cdGF9vkvUQZuc4AZcgt3+htQ
	 3jhKXOpEj3+tjoAHzoq7h9hFjc6C6NLEqMWVLZnelsZdouB/ftXGeLoZBZ/LY8TOMLOZG
	 GjmbxXwvcpI3z1e88hy5dwi7NCrBTLwUcygvH4JFuRf4ILnixJpncAAgYwMptWqdgShMP
	 ASkVHv7b2UuboOJUtJ4zjTYBaS1JbDRLH+W6T9Z6ZEaZzUZw1L4KDp6wx5NDfrwB6qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OeHTeNYU;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A2C606A31B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 19:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46A2C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OeHTeNYU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792523140; x=1824059140;
  h=date:from:to:cc:subject:message-id;
  bh=GbbW6oLDN5ZlyFJGkLYHIFJGNrJ4b6QS1cnmWulI2jw=;
  b=OeHTeNYUQIjc7AbvNsIuNEt6J+EPhAsvgrDH1fVWoboPOFc0uBl63zhS
   9hHFvXSMv0ou9gPdMPQ6ku+e0ZZsah9o9LMjSIP2lnFdl0VPZSP9AeHcD
   Dswu0CvAKXMpFdd71qkhWeqP2VhlzxC8MIKjiI5fa+rrwGLXqYYRTZlDA
   gJYdiejqI1shHK2goJUdMP+r1afvGnb6m3R7MR36tOZoCHJVCBiib+L2P
   O92MfK7G+evVCyFw7YUCu7ldO6NF/aVwW3Qc+/Wbb7C9br56cP8tYAsxJ
   6G8pYSLW+rPiGDaLNPPfK7OgN1M3kMSNYaBN5ip3heTB7fOQTBzle4dXA
   Q==;
X-CSE-ConnectionGUID: G1qH3E/MSbyob5mqr6AXJA==
X-CSE-MsgGUID: 8CPVeWgnQkaiNfHTo6hFrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1339564"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1339564"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 12:05:40 -0700
X-CSE-ConnectionGUID: 9Z1K5z+QR+6tSZO38wfTDg==
X-CSE-MsgGUID: Z8T0djoXRDqugfqWwYObAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3226397"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Oct 2026 12:05:38 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJF9T-00000000OG2-2wiu;
	Tue, 20 Oct 2026 19:05:35 +0000
Date: Wed, 21 Oct 2026 03:05:05 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Marc Zyngier <maz@kernel.org>
Subject: [linux-next:master 4811/17742]
 arch/arm64/kvm/vgic/vgic-irs-v5.c:1016:15: warning: variable 'addr' set but
 not used
Message-ID: <202610210232.uzFGXnjw-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Sascha,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3d229ce89862b8e82d71a9e11d6f840ca272a6d6
commit: 71091136d1452b6125579b210d29efec3e79681a [4811/17742] KVM: arm64: gic-v5: Handle userspace accesses to IRS MMIO region
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20261021/202610210232.uzFGXnjw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261021/202610210232.uzFGXnjw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610210232.uzFGXnjw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/vgic/vgic-irs-v5.c: In function 'vgic_v5_has_attr_regs':
>> arch/arm64/kvm/vgic/vgic-irs-v5.c:1016:15: warning: variable 'addr' set but not used [-Wunused-but-set-variable=]
    1016 |         gpa_t addr, offset;
         |               ^~~~


vim +/addr +1016 arch/arm64/kvm/vgic/vgic-irs-v5.c

  1010	
  1011	int vgic_v5_has_attr_regs(struct kvm_device *dev, struct kvm_device_attr *attr)
  1012	{
  1013		const struct vgic_register_region *region;
  1014		struct vgic_reg_attr reg_attr;
  1015		struct kvm_vcpu *vcpu;
> 1016		gpa_t addr, offset;
  1017		int ret, align;
  1018	
  1019		ret = vgic_v5_parse_attr(dev, attr, &reg_attr);
  1020		if (ret)
  1021			return ret;
  1022	
  1023		vcpu = reg_attr.vcpu;
  1024		addr = reg_attr.addr;
  1025	
  1026		if (attr->group == KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS)
  1027			return vgic_v5_has_cpu_sysregs_attr(vcpu, attr);
  1028	
  1029		offset = attr->attr;
  1030	
  1031		region = vgic_find_mmio_region(vgic_v5_irs_registers,
  1032					       ARRAY_SIZE(vgic_v5_irs_registers),
  1033					       offset);
  1034		if (!region)
  1035			return -ENXIO;
  1036	
  1037		align = region->access_flags & VGIC_ACCESS_64bit ? 0x7 : 0x3;
  1038		if (offset & align)
  1039			return -EINVAL;
  1040	
  1041		return 0;
  1042	}
  1043	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
