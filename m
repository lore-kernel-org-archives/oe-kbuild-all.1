Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF8622D7A1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Sep 2026 09:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789811006; cv=none; b=qxyS6DxRd3HLVRL0hshO0a8De7zdqFDGI14Vf6l8pn1PjbAEH3ptA8eXcO+M17TvVVhiKWeogrgV3bqm3XBHdOXr0le4ELxGwIEcCDBPtrtMduxCthWKe8N7eXTw5dq4RyRwxKGFzVyqRhsriCQVOXbZBLhBl9uA/xByyKS5bMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789811006; c=relaxed/simple;
	bh=UWYCSrVnKZ7KScbhrf+SXhqTGFv5ABt9OfBhwLNCpJw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T50NzSa+LITGcaCknN15aZnimksQDZJS1ysUHg7e6jyq8WJbJDTYJDqSeChB0vpTsTLQznkbeZsUj2q+6GVjRKDMnQkCozxGmoUBM82KMxZSbujUPNXHMs1tNtiLf8zPjqW5P363vaAkdU/rp71gPIVR2gwMrngqbFpMJuFLEnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kIF1PzPz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kIF1PzPz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789811005; x=1821347005;
  h=date:from:to:cc:subject:message-id;
  bh=UWYCSrVnKZ7KScbhrf+SXhqTGFv5ABt9OfBhwLNCpJw=;
  b=kIF1PzPzu3DmwVoajO7N1bllkfG+arHjp2aXtu+reVR99tvhDMY/bJ8b
   T8oN7jtfQqqIMQYu3sIoC/EN6eCJUTnNTq58vT95DaDcjJZYlr70nlxeo
   oeQqZ8WKgPbpKw3CrSFue/sVSWVyrimGA3waz1+hpdANuBqLjKkwjPmfb
   LqrRY4L/OyVn9fsLoq9rsa67+YOaAMhFbi0xBTwkfeYY8qaICoWMa2P/D
   nExSs3KmMvZda0UMeNoEkUq/KALtNvVZY63RhpLla+vzum3d+T4HNiciV
   9VAU1eMnFX6o+ubTCVbV+mARn6Ofu/wyPwk3lX7IncxhhTxEIgh74K23r
   A==;
X-CSE-ConnectionGUID: YOzfhMh0ROWt4xmEDL4SNw==
X-CSE-MsgGUID: avz9hhxAQA28PNqqWylPvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="107847246"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="107847246"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 02:43:24 -0700
X-CSE-ConnectionGUID: CTPW8N5rT266okM5BOrHYg==
X-CSE-MsgGUID: mEWbPJD9R1mFgH7f9OQKzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="272102727"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Sep 2026 02:43:22 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7rbI-00000000AoL-0cvt;
	Sat, 19 Sep 2026 09:43:16 +0000
Date: Sat, 19 Sep 2026 17:42:42 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 5609/8449]
 arch/arm64/kvm/hyp/nvhe/hyp-main.c:849:1: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202609191703.VLP7KJSb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
commit: 892fc33977cf8b2cf98065e5ae532e4ddbbe09cc [5609/8449] Merge branch kvm-arm64/hyp-type-checking-7.4 into kvmarm-master/next
config: arm64-randconfig-r1307-20260918 (https://download.01.org/0day-ci/archive/20260919/202609191703.VLP7KJSb-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7252edd9aa82ef1c570ff6694ef7f4763a8a5d2f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609191703.VLP7KJSb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609191703.VLP7KJSb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:849:1: sparse: sparse: symbol '__do___vgic_v5_make_resident' redeclared with different type (incompatible argument 1 (different address spaces)):
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:849:1: sparse:    void static [toplevel] __do___vgic_v5_make_resident( ... )
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:849:1: sparse: note: previously declared as:
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:849:1: sparse:    void static [toplevel] [usertype] __do___vgic_v5_make_resident( ... )
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:858:1: sparse: sparse: symbol '__do___vgic_v5_make_non_resident' redeclared with different type (incompatible argument 1 (different address spaces)):
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:858:1: sparse:    void static [toplevel] __do___vgic_v5_make_non_resident( ... )
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:858:1: sparse: note: previously declared as:
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:858:1: sparse:    void static [toplevel] [usertype] __do___vgic_v5_make_non_resident( ... )
>> arch/arm64/kvm/hyp/nvhe/hyp-main.c:849:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct vgic_v5_cpu_if *cpu_if @@     got struct vgic_v5_cpu_if [noderef] __kern * @@
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:849:1: sparse:     expected struct vgic_v5_cpu_if *cpu_if
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:849:1: sparse:     got struct vgic_v5_cpu_if [noderef] __kern *
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:858:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct vgic_v5_cpu_if *cpu_if @@     got struct vgic_v5_cpu_if [noderef] __kern * @@
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:858:1: sparse:     expected struct vgic_v5_cpu_if *cpu_if
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:858:1: sparse:     got struct vgic_v5_cpu_if [noderef] __kern *

vim +849 arch/arm64/kvm/hyp/nvhe/hyp-main.c

   848	
 > 849	DEFINE_KVM_HOST_HCALL(void, __vgic_v5_make_resident,
   850			      struct vgic_v5_cpu_if __kern *, cpu_if)
   851	{
   852		if (unlikely(is_protected_kvm_enabled()))
   853			return;
   854	
   855		__vgic_v5_make_resident(kern_hyp_va_host(cpu_if));
   856	}
   857	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
