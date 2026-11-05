Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872375;
	b=W6qikd/Iuwql1D/MYxSdvf07/3lz/hiFJ4uDNQNK6vEBdXIcAR0S/17U9pzzH675FtJ+
	 neGD1Bbq+GPpPmPDYgeKrEkW7UQGqC/e7AlYAMKCRjdUscMgusV1ro47NwRs/rIEIpgoC
	 omcEoQ3vyjOl8+tZSTe4tprFacNGsxItC05z+LSpWmrpBkg3pEMOWO75eTt1WzYef0TTx
	 rgdWU0Xyu+jR0adN/deNfNPaboFoXJEYFYqOjyNRBJj5AUpBvGP7OgqgPmsL3uTMwOA05
	 E9SchtaMKHNmXMglsjClnn2j/YHdBckXyJ9ReOCyZB7yzxa2tYdld4E2EU+OAx3mSgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872375;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=8nopL7RvOxvPq+0PIJ0MDtWjhxRFYXjb4rJnAVoTH30=;
	b=ZVFo3CX+LV08aY+OYbIkry5QF63W0GvEvlfCSxPQtmiM3dipenMoqaOsbR8jxR5mjZg2
	 6NlyNUtGeYxmrZ375nibWIDXaG8y4YN+XCd1fRn0aIER0Qtv+JNPYqKU/jdtqQoU//v4p
	 ksJyA1w5Uq8l90bqjye/+QJKmupmB/iF1UaW7YcGRmvaclf81usu7zgXFQ+LAQZr3LPou
	 obLiiGaQvWxjbLlUCltwL+Kj611qYJSdtj3NZd1EVz/ijaOelMUF3ybuLrjDrCbNl+jUb
	 78tXm9HUZHGHZNMM7dwiGwQDRhXx9TF3dpq1D2T4z2u6GPo3Qon5dOAVSNKBCZP+RbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V2wjmTFG;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAF2606A331
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 09:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FAF2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V2wjmTFG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793872375; x=1825408375;
  h=date:from:to:cc:subject:message-id;
  bh=N7ghw3xebHFgkmoSJzBeYCptvYsWJjQTsLNL1NT048c=;
  b=V2wjmTFGLMK/eeuEccJoehgeg/VR9KSDcax6v2rz2+u4utIAbwNZieYX
   QVnkbiDFVIxCOySwTEsncbpCr+GunNqaiuoTNCH2uoUwOpKX+hTuhU9QE
   gV0sVrO4Mhptr/8w2DApShPWspMpxVndTcz36Dh9D9hea58nszE1gZ9so
   DrxeoQ4u7DWZdgMm0ieRG9NTm4iOeQguQAAVwMoZRa4WFMfOyjw4QdGKE
   1DQzGepeSCFvFTdw/qIY48nL/VjzQmQ4+r6x1ylsUbyTLSkh4oxmpAHEA
   JPnkF4kJEl/vkh0vLowhLufYbFfynL4C3TTCGmaB3KxRoFbpcE2xAc3/8
   g==;
X-CSE-ConnectionGUID: GsfqSWBZQv2TvlSFdKH9DA==
X-CSE-MsgGUID: 2G+K1h0jQ4iIoahSglBOIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2551706"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2551706"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:52:54 -0800
X-CSE-ConnectionGUID: Q2/sAgDvSRqoLUEQ8fyqkw==
X-CSE-MsgGUID: GhhX+9J4R4mezli1ucsjXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7529856"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 05 Nov 2026 01:52:08 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOu8b-000000009cl-3HCp;
	Thu, 05 Nov 2026 09:52:05 +0000
Date: Thu, 05 Nov 2026 10:51:28 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 arch/arm64/kvm/handle_exit.c:495:48: sparse: sparse: cast to restricted gfp_t
Message-ID: <202611051014.WWDiI1uo-lkp@intel.com>
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
head:   e1b556eb2d11c07ede833cd0a20d9b02914dec3c
commit: d0c5a9934e73da6103c39838c3d03b849731962d [1/1] ANDROID: KVM: arm64: Generalize kvm_hyp_req ser/des to smccc
config: arm64-randconfig-r2302-20261104 (https://download.01.org/0day-ci/archive/20261105/202611051014.WWDiI1uo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611051014.WWDiI1uo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611051014.WWDiI1uo-lkp@intel.com/

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
