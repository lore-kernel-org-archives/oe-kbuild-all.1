Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E7E4642D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 04:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741323275; cv=none; b=DdVdNdhtXotpMn0LzLbk3Vt20A3+R6zc9+MvqL1khOe8GAF+ezTucuKmsSwBsneVVhNP0N7zO2aRdSK/LBz4hnR+RXGi1rzy6fiQ6c4JqNexaBPp7V9776TQgsuDzrXTJnWeK4aa4makniDFXVGbNOCGwJFt0/8RfpB/JoB0k0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741323275; c=relaxed/simple;
	bh=LtNDCQXgKnyraVWN+eTC4u+6DxovO+WLW/AyXwo7RcU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y7xvnkti4CV89VHrjGLa3CiLXve+sUOGp/gtsyw7L0ucO2CNJXypjU/Qcmw+/LG/zAaQOqRuiey7zbpd5LA3VeIPe03p1y/sxmGBRJH8r/vjjDm88vx/w6gBdlCCIX9YmQsSCk08iskR6+Vxf7LQUq3neSjdkQ3xNv+IDW4Vzz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fNBdTUKW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fNBdTUKW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741323273; x=1772859273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LtNDCQXgKnyraVWN+eTC4u+6DxovO+WLW/AyXwo7RcU=;
  b=fNBdTUKW+K7EHsB30EI+ywN+ehUT2da8GEg+1QH2J86/J4M2U/YX8IZ7
   RKMN9IWTOUW1wmUTRrXsK3o8SSvTHI6ISJHLw0w+gNRVuVe/9EQO4+tbq
   0k2EmbalU8BfdYn8HoTiqwmGR+P+TLuyWLS63KYsajwg68flQSdg3VC/n
   ZjUvPycZvS7yXEd+6uZGoAXSyMyr8syG0eCEpXI+Um2r4mwPs8Zz9BsQU
   mq8CXrDtENb5YNoAQuDhqekgLUpwa/LIP01KWOSSR4w5Iz//o0AWxp/fT
   FNYn9z52DJpzHd0/HXgIwXvULOOrtvzayyUQidBPNW8TLDWJhvqdcMDjJ
   Q==;
X-CSE-ConnectionGUID: fQ8VvuFHRD23rH+ShaOUIA==
X-CSE-MsgGUID: qBCCBPhiSlKiONtI7UBKxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42494889"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="42494889"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 20:54:33 -0800
X-CSE-ConnectionGUID: lkp1B78AQau8Z85uMhltkg==
X-CSE-MsgGUID: zC1/1DfjT8GUW+cg/uCfnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119148247"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 06 Mar 2025 20:54:32 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqPjB-000OXE-0u;
	Fri, 07 Mar 2025 04:54:29 +0000
Date: Fri, 7 Mar 2025 12:53:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/kvm/hyp/nvhe/power/scmi.c:215:36: sparse: sparse: incorrect type
 in assignment (different address spaces)
Message-ID: <202503071256.PHb434VH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   7d22ae2248e26f0c940277ad47f974ba897a7fa8
commit: 220be807706d350ba6a1f17f0a3586269d844eda [1/1] BACKPORT: FROMLIST: KVM: arm64: pkvm: Support SCMI power domain
config: arm64-randconfig-r122-20250307 (https://download.01.org/0day-ci/archive/20250307/202503071256.PHb434VH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250307/202503071256.PHb434VH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503071256.PHb434VH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/power/scmi.c:215:36: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *static [assigned] [toplevel] shmem @@     got void * @@
   arch/arm64/kvm/hyp/nvhe/power/scmi.c:215:36: sparse:     expected void [noderef] __iomem *static [assigned] [toplevel] shmem
   arch/arm64/kvm/hyp/nvhe/power/scmi.c:215:36: sparse:     got void *

vim +215 arch/arm64/kvm/hyp/nvhe/power/scmi.c

   191	
   192	int pkvm_init_scmi_pd(struct kvm_power_domain *pd,
   193			      const struct kvm_power_domain_ops *ops)
   194	{
   195		int ret;
   196	
   197		if (!IS_ALIGNED(pd->arm_scmi.shmem_base, PAGE_SIZE) ||
   198		    pd->arm_scmi.shmem_size < PAGE_SIZE) {
   199			return -EINVAL;
   200		}
   201	
   202		if (!scmi_channel.shmem) {
   203			unsigned long shmem;
   204	
   205			/* FIXME: Do we need to mark those pages shared in the host s2? */
   206			ret = __pkvm_create_private_mapping(pd->arm_scmi.shmem_base,
   207							    pd->arm_scmi.shmem_size,
   208							    PAGE_HYP_DEVICE,
   209							    &shmem);
   210			if (ret)
   211				return ret;
   212	
   213			scmi_channel.smc_id = pd->arm_scmi.smc_id;
   214			scmi_channel.shmem_pfn = hyp_phys_to_pfn(pd->arm_scmi.shmem_base);
 > 215			scmi_channel.shmem = (void *)shmem;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
