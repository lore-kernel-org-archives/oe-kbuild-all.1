Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB0C184E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 01:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744852693; cv=none; b=ZkKL4iUDz7LnfSYITOYyk1Lvh+ZVxuRgjKTTPOZiATpzHnPTD4RD6SM1H32hx0QO8yTEJNcA4XeAWoEmHp75KDoeJtye9wGKBnOnzQqZhcjHgRADGAqjjMgPH4BPk6JvBMDhO+NXSOLWSqDOOdqO6WHNRWbq3bzq1rZDhv9wbVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744852693; c=relaxed/simple;
	bh=IJo3p+CchLm8reUHQCBM1oqakMjxtxWSY8NtFrXtQmE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GHlivepChTGpuc4uDGOjqIh2D9lXFI6Fx5rCtNZr3KGqrLwrDa97uFoND7UaHl5+v2zy6QYbHDO0yiqrg84yyj2lzidJdhx8VfwUPes2GtjTbL9IqNhptXzmsTLhHwqO0EloVt31GmNnA17EAj/2tcTTJqHsOBsLDvqJ3i+7ZnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HoUJYuC+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HoUJYuC+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744852692; x=1776388692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IJo3p+CchLm8reUHQCBM1oqakMjxtxWSY8NtFrXtQmE=;
  b=HoUJYuC+nO7OeBu4kyZwdkTvFetcQD3J+uzG7h3gVmmMmIG1I1sA3ePs
   z3Hi45o7grzEH3Ei821LDDvOuOftN0qTn2XxYw9OqsJESsJIN5h9GOGkd
   ZOcnXgoFISUyT8YnNIsfIyyx8VF21u9y9eWdj5eBXFrpM5WGjlxbK9w83
   uwpFv8BqUJFx7cITjlQRLKpyemImi7dBHrDcioxuHLtnXSxQvTmynJak3
   163V4Q1yeIIjqV8hJx9IbezhRwygmlvdTvrBM1iyidtUaMBc/COtYRJwf
   K3hl2t+meml5rgwKBifo/HdM4+ccq3B+dcn4DT+z5zsmIn0cCkTFsYQLm
   w==;
X-CSE-ConnectionGUID: Hmi/dEIBQQ+8vAUoxVnNvg==
X-CSE-MsgGUID: SB2SUxfPRlGVDo0SJemDpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46554280"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="46554280"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:18:11 -0700
X-CSE-ConnectionGUID: YSWlQVAgTOusbZDOKazQkA==
X-CSE-MsgGUID: /IKJ4Us1Ty6lk3oedmIdFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="131553871"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Apr 2025 18:18:09 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5DtH-000KWO-1l;
	Thu, 17 Apr 2025 01:18:07 +0000
Date: Thu, 17 Apr 2025 09:17:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhenyu Ye <yezhenyu2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2130/2130] arch/arm64/kvm/mmu.c:1665:21: warning:
 unused variable 'iss2'
Message-ID: <202504170921.RaPjZtnT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   58353f394bfe86212d5089bc9c1c235ffc761e2c
commit: 8d2e1e3b26a99872309a1c2afa3f0f35f1102137 [2130/2130] arm64/config: add config to control whether enable HDBSS feature
config: arm64-randconfig-001-20250417 (https://download.01.org/0day-ci/archive/20250417/202504170921.RaPjZtnT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504170921.RaPjZtnT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504170921.RaPjZtnT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/mmu.c: In function 'kvm_handle_guest_abort':
>> arch/arm64/kvm/mmu.c:1665:21: warning: unused variable 'iss2' [-Wunused-variable]
     unsigned long hva, iss2;
                        ^~~~
--
   arch/arm64/kvm/reset.c: In function 'kvm_arm_vcpu_destroy':
>> arch/arm64/kvm/reset.c:165:15: warning: unused variable 'hdbss_pg' [-Wunused-variable]
     struct page *hdbss_pg;
                  ^~~~~~~~


vim +/iss2 +1665 arch/arm64/kvm/mmu.c

aeda9130c38e2e arch/arm/kvm/mmu.c   Marc Zyngier     2015-03-12  1648  
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall 2013-01-20  1649  /**
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall 2013-01-20  1650   * kvm_handle_guest_abort - handles all 2nd stage aborts
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall 2013-01-20  1651   * @vcpu:	the VCPU pointer
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall 2013-01-20  1652   *
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall 2013-01-20  1653   * Any abort that gets to the host is almost guaranteed to be caused by a
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall 2013-01-20  1654   * missing second stage translation table entry, which can mean that either the
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall 2013-01-20  1655   * guest simply needs more memory and we must allocate an appropriate page or it
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall 2013-01-20  1656   * can mean that the guest tried to access I/O memory, which is emulated by user
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall 2013-01-20  1657   * space. The distinction is based on the IPA causing the fault and whether this
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall 2013-01-20  1658   * memory region has been registered as standard RAM by user space.
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall 2013-01-20  1659   */
74cc7e0c35c1e4 arch/arm64/kvm/mmu.c Tianjia Zhang    2020-06-23  1660  int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
342cd0ab0e6ca3 arch/arm/kvm/mmu.c   Christoffer Dall 2013-01-20  1661  {
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall 2013-01-20  1662  	unsigned long fault_status;
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall 2013-01-20  1663  	phys_addr_t fault_ipa;
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall 2013-01-20  1664  	struct kvm_memory_slot *memslot;
6d60015590c3f5 arch/arm64/kvm/mmu.c eillon           2025-04-02 @1665  	unsigned long hva, iss2;
98047888bb9fd5 arch/arm/kvm/mmu.c   Christoffer Dall 2014-08-19  1666  	bool is_iabt, write_fault, writable;
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall 2013-01-20  1667  	gfn_t gfn;
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall 2013-01-20  1668  	int ret, idx;
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall 2013-01-20  1669  
621f48e40ee9b0 virt/kvm/arm/mmu.c   Tyler Baicar     2017-06-21  1670  	fault_status = kvm_vcpu_trap_get_fault_type(vcpu);
621f48e40ee9b0 virt/kvm/arm/mmu.c   Tyler Baicar     2017-06-21  1671  
621f48e40ee9b0 virt/kvm/arm/mmu.c   Tyler Baicar     2017-06-21  1672  	fault_ipa = kvm_vcpu_get_fault_ipa(vcpu);
bb428921b777a5 virt/kvm/arm/mmu.c   James Morse      2017-07-18  1673  	is_iabt = kvm_vcpu_trap_is_iabt(vcpu);
621f48e40ee9b0 virt/kvm/arm/mmu.c   Tyler Baicar     2017-06-21  1674  

:::::: The code at line 1665 was first introduced by commit
:::::: 6d60015590c3f56b0188b2409cfb3ad9e05ded00 arm64/kvm: support to handle the HDBSSF event

:::::: TO: eillon <yezhenyu2@huawei.com>
:::::: CC: Zhenyu Ye <yezhenyu2@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
