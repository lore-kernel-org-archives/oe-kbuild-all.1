Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E442032D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 13:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772200118; cv=none; b=dHOsziuagIQT89Krmc3OpgS0f97tFP0NCh8gCbEu9hYj0KwLiCvWHKe415R1JfIFf08Fr0afDUom+e9ZwKrfFF588tAR3ZULRkjpUhjgtVZuWAeTp33hKsgYvUY9vgUOZMdNUmjvH7VNgsQMhZFisihGjZ33EtFBQHht0N9JlAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772200118; c=relaxed/simple;
	bh=+CAwkRXy0qL/4lbQIBDLncQY/YfmYiu6UYGLlo5ab74=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nXx/JZJSjPztE0WlsMm9vbquBw3bm6s2S39hYTQk7hnY2mD4mGAQUaxggWbbAcB/0iH3JSsgJ4fmj9r1uBdMOTthTdUElBfWHTM6RPRj82AdYxrki6MZNp1S5LDj+AqfX2YeXudmji0/gLp6TISUciU2HacShjyE83PCYByTHSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dP+BgqvQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dP+BgqvQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772200116; x=1803736116;
  h=date:from:to:cc:subject:message-id;
  bh=+CAwkRXy0qL/4lbQIBDLncQY/YfmYiu6UYGLlo5ab74=;
  b=dP+BgqvQPvBR1hd8kh+iJkscEQvcgi+4sDhYvlyMhp31/fWZaFnkXxWB
   byKhmBbfAwUsfYonnndDpN1lIThcIBk4Jzdi16CSIKkHyqM5h0HRMLB9i
   4jW6YhoDurHNh+WX6/WjRmRvcx3ZYrHgrfYbSk14N9nE0zdg54B5KRRV9
   4cde3F7jZ0NrWj2CnKVVvfX7UUWYg+iB8zvo8IeZMx5FiJBvV8CqTbDw/
   U37ETvpJ47HdRHjtSN7lHTRDRQsh5XJOVAZ561+O74K7MhutLz2DmnfeR
   UXzzTMr6BNWt6dNtghsOigbcLRGV7/7BIC3RCluKa/n5LIcavk53iUAC/
   w==;
X-CSE-ConnectionGUID: vvwXHqXCQaiKGbu8ejEm0g==
X-CSE-MsgGUID: GnICkcJERPW8hjH1TrowiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="77122015"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="77122015"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 05:48:36 -0800
X-CSE-ConnectionGUID: GYx6nkt4SLmEjV/NT7XFXg==
X-CSE-MsgGUID: YtooyfzRTBae1hLjLMSPrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="244283051"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 27 Feb 2026 05:48:34 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvyCl-00000000Ad1-45QE;
	Fri, 27 Feb 2026 13:48:32 +0000
Date: Fri, 27 Feb 2026 21:48:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 arch/arm64/kvm/handle_exit.c:495:48: sparse: sparse: cast to restricted gfp_t
Message-ID: <202602272110.qUW9bDP0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   71f2074b8c1e4e009b1e126ca1a2a9ce14201030
commit: d0c5a9934e73da6103c39838c3d03b849731962d [1/1] ANDROID: KVM: arm64: Generalize kvm_hyp_req ser/des to smccc
config: arm64-randconfig-r132-20260227 (https://download.01.org/0day-ci/archive/20260227/202602272110.qUW9bDP0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602272110.qUW9bDP0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602272110.qUW9bDP0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/handle_exit.c:495:48: sparse: sparse: cast to restricted gfp_t
--
>> arch/arm64/kvm/iommu.c:178:16: sparse: sparse: cast from restricted gfp_t
   arch/arm64/kvm/iommu.c:187:16: sparse: sparse: cast from restricted gfp_t
   arch/arm64/kvm/iommu.c:203:16: sparse: sparse: cast from restricted gfp_t
   arch/arm64/kvm/iommu.c:224:26: sparse: sparse: cast from restricted gfp_t
   arch/arm64/kvm/iommu.c:252:28: sparse: sparse: cast from restricted gfp_t
   arch/arm64/kvm/iommu.c:310:16: sparse: sparse: cast from restricted gfp_t
   arch/arm64/kvm/iommu.c:358:26: sparse: sparse: cast from restricted gfp_t

vim +495 arch/arm64/kvm/handle_exit.c

   486	
   487	int handle_hyp_req(struct kvm_vcpu *vcpu, struct kvm_hyp_req *req, void *arg)
   488	{
   489		switch (req->type) {
   490		case KVM_HYP_REQ_TYPE_HYP_ALLOC:
   491			return __pkvm_topup_hyp_alloc(req->mem.nr_pages);
   492	
   493		case KVM_HYP_REQ_TYPE_MEM_IOMMU:
   494			return __pkvm_topup_hyp_iommu(1, req->mem.nr_pages << PAGE_SHIFT,
 > 495						      (gfp_t)(uintptr_t)arg);
   496	
   497		case KVM_HYP_REQ_TYPE_MEM:
   498			return handle_hyp_req_mem(vcpu, req);
   499	
   500		case KVM_HYP_REQ_TYPE_MAP:
   501			if (!vcpu)
   502				return -EINVAL;
   503			return pkvm_mem_abort_range(vcpu, req->map.guest_ipa, req->map.size);
   504	
   505		case KVM_HYP_REQ_TYPE_SPLIT:
   506			if (!vcpu)
   507				return -EINVAL;
   508			return __pkvm_pgtable_stage2_split(vcpu, req->split.guest_ipa, req->split.size);
   509	
   510		case KVM_HYP_LAST_REQ:
   511			return 0;
   512		}
   513	
   514		pr_warn("Unknown kvm_hyp_req type: %d\n", req->type);
   515		return -EINVAL;
   516	}
   517	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
