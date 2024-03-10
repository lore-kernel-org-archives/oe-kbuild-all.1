Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAD92030A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Mar 2024 10:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710067749; cv=none; b=smzrDE8KiJendyCjFaFJAYGx3ESb2kAyCYjEocNaJz3GqY6VnyVROZkL0IA7Tg3s7IjeY1u26QP2y/yRekpDrNF6BRaz5X8I3lTB5a00MIOi5iFdFzRiFk6ljlDNfEhXenovlcwl2PeMeirOx5HH9lfR7xhxV6TSvS2n3NboVXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710067749; c=relaxed/simple;
	bh=zmymGIfhMeLPUkaRiL6C9ffFBYSAJoKjXunUtgKx+U8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=etl3lv+Fp39W9iryOlfP51fp4JiP+fW6QMBOGzJ0EVhc7CkqKv5utdKN9sHKIS5+yh5N3/QnUkoX4D1lyr/sMSz8mA9WX8TlalPwLPkTdQ17rAXJ5AnpY0wJSJHLF/XTc7r81hsUICV8AdJEGiPfiYuBtfW6yk2+BqJ5ROC7MzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZfzzpVgw; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZfzzpVgw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710067748; x=1741603748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zmymGIfhMeLPUkaRiL6C9ffFBYSAJoKjXunUtgKx+U8=;
  b=ZfzzpVgw+kZf4nkAKCj83Yg5YEv8cgU2EJzkjwbdIsuL/xOtzHdau0US
   35VyVBIaa3yxiUzb0uJcULPlqb2LL2ASJYYhOoHcTzi/ZsRMSiIu8eh8e
   AqqVDUnfQ2H2XoQzTAB55HN+L11HRzkIdFzEPPqJFIbYW3xWbHR9R2TjI
   PzSJHUkW2ogfieX7XoOMywKgIRuSQLuO3wkooczkBaHhhA2zzk/yzfNZb
   DVNCDcMvbGJOac6ObS6IffGqWzbnRWqjHFvqvwAjFUFEcRvRD8CToWMgp
   PdCwf9Fdsv7aQshRJxiMdk7kfchTjb8tJIQ+oa87ZvQBzjO0TNmqmRsCJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="8492255"
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="8492255"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 03:49:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="15546171"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Mar 2024 03:49:06 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjGjn-0008Bk-1i;
	Sun, 10 Mar 2024 10:49:03 +0000
Date: Sun, 10 Mar 2024 18:48:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 35/57]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:84:21: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202403101812.TM57dakY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   6b00f1b219465a71cb11664536629575c5312bd0
commit: 3f596ed5c5bdcea4fbe368a6d951f440c14f7bc3 [35/57] ANDROID: KVM: arm64: smmu-v3: Reduce critical section in map() and unmap()
config: arm64-randconfig-r122-20240307 (https://download.01.org/0day-ci/archive/20240310/202403101812.TM57dakY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240310/202403101812.TM57dakY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403101812.TM57dakY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:84:21: sparse: sparse: Using plain integer as NULL pointer

vim +84 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

    60	
    61	static struct kvm_hyp_iommu_domain *
    62	handle_to_domain(pkvm_handle_t domain_id)
    63	{
    64		int idx;
    65		struct kvm_hyp_iommu_domain *domains;
    66	
    67		if (domain_id >= KVM_IOMMU_MAX_DOMAINS)
    68			return NULL;
    69		domain_id = array_index_nospec(domain_id, KVM_IOMMU_MAX_DOMAINS);
    70	
    71		idx = domain_id >> KVM_IOMMU_DOMAIN_ID_SPLIT;
    72		domains = (struct kvm_hyp_iommu_domain *)READ_ONCE(kvm_hyp_iommu_domains[idx]);
    73		if (!domains) {
    74			domains = kvm_iommu_donate_page();
    75			if (!domains)
    76				return NULL;
    77			/*
    78			 * handle_to_domain() does not have to be called under a lock,
    79			 * but even though we allocate a leaf in all cases, it's only
    80			 * really a valid thing to do under alloc_domain(), which uses a
    81			 * lock. Races are therefore a host bug and we don't need to be
    82			 * delicate about it.
    83			 */
  > 84			if (WARN_ON(cmpxchg64_relaxed(&kvm_hyp_iommu_domains[idx], 0,
    85						      (void *)domains) != 0)) {
    86				kvm_iommu_reclaim_page(domains);
    87				return NULL;
    88			}
    89		}
    90	
    91		return &domains[domain_id & KVM_IOMMU_DOMAIN_ID_LEAF_MASK];
    92	}
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
