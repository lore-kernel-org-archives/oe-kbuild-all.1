Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946469;
	b=OK1mBxFVSMXKmNO3YBDfzWbo4dRm9zXiwfyfArXpfWdDGPhTxRgil956DAtREeidD97G
	 YVhxR1SP9viCEFjNCbixOTQUZd27XXAv2LTdw+2756z3fjv9DA8DWru6PiUZXGpRzYAFs
	 0IgjoHsCRkChewYd31XAAZXrlzkliO0pCVtqdO/bHWCXaBr18wAcCCRyjg39hBCGtcquK
	 cSBCIVNXkoZ8JsBQxB1jeb/qy2gTOaxa9LHvKGnDuxTrbQQImsE6VdxXVqblmrNvHd9KR
	 vKxFGOZlK33/l+yIMH55fvQy7Golhq32I7uWXW6xAyVi4/9yqL3mNxiunqB6imdaW7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946469;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-Ironport-Invalid-End-Of-Message:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 User-Agent;
	bh=c7cKBzMrfO+Ho2rDPiu3Ci8km0Phzx4M3z+CA2UXDRM=;
	b=uBcQAKO41sVS3NSmt26U/WuUtvVRLyRtCXmvT87hSno5ahhP4yTFwILwXIe1IDLhqcB3
	 lmpeCJ9BAbkzTDo4GXj/03OB+Tay3HwWksPAWAH+qW5k8SAdjQyuwfJSgSdBKCvnmbEQN
	 QsBI3li4ajWWXkrrJlWOBCZHvNNfxbeI/1Zuh/X2I95xp6eiOUCx0ytTAG2VL97ptIKyb
	 h25ZvTbHYp3I03AhL0MvMHMGgsm3oXE+aAinlU3Hib2j0csDmPE2iUaotcTEw5PnAPKsO
	 xhidgwOlDgDIyPhgarvNLkfyo1oO1q52lPduIPwUXP9wfSZWr/HDGHZnzqSC1l9v6nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mB8s1Zd5;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C60606A329
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 06:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04C60606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mB8s1Zd5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793946469; x=1825482469;
  h=date:from:to:cc:subject:message-id;
  bh=u4VyCXh04nHHAkq8vsXByQTZgSDGSlZC+a1IU/y82mg=;
  b=mB8s1Zd5rTY7l5+2JXdeDWkQ+iUl5y76fev7cueJQoRIQ7Mlr14eRSie
   GalvQJkguMgTTqXLOcw6pkEv29osFvjUtmewDbg5/EXYeoeev/OcoCiE6
   Pl7ZJD3D9nAUBPiF9bAXLOARoQl+NtvtQo1xWaRV+7c1PIq+Brkzg78Vv
   FUd3XNh3Q5HxRMfNVoBNWOXZEL8XhH/sNci/aJ4gRoVoMED6Hi1DKawuy
   pO/MM4e2dbKZ/bGj1TdHR+EeUL30JlX9dpidlNM9kO2ZunqoRKz0ij8v9
   VjzxpdSDpYMN0wgiecs0oKnuAKOA/bsprCplhQQMxR+15JXtdoVn27PtU
   Q==;
X-CSE-ConnectionGUID: ogqBGVGFSke53ro72W/WGg==
X-CSE-MsgGUID: wznJWyV9RSesxCiw1Y4bTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2642509"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2642509"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 22:27:45 -0800
X-CSE-ConnectionGUID: efqCn+9OSZCBrxBEtHhzCg==
X-CSE-MsgGUID: gfMVeZEiR4qpBdOZjdwHNw==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7106083"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 05 Nov 2026 22:27:43 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPDQL-00000000A6P-0qtq;
	Fri, 06 Nov 2026 06:27:41 +0000
Date: Fri, 06 Nov 2026 07:27:11 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 arch/arm64/kvm/handle_exit.c:495:48: sparse: sparse: cast to restricted gfp_t
Message-ID: <202611060732.6HzXdmOW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   b835509d43ba8175031f800f12347f8e8206a471
commit: d0c5a9934e73da6103c39838c3d03b849731962d [1/1] ANDROID: KVM: arm64: Generalize kvm_hyp_req ser/des to smccc
config: arm64-randconfig-r2302-20261104 (https://download.01.org/0day-ci/archive/20261106/202611060732.6HzXdmOW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060732.6HzXdmOW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611060732.6HzXdmOW-lkp@intel.com/

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
