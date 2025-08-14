Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1F827B50F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 22:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755210554; cv=none; b=R/HdEoR19Gguw3KJptaRWLyGYkfpmdkxNslCt0jwDDRvGkf9C9/1suYT11pI38HUuihhk08O0KYwiVvyQrOFHqSpNR/Nl3SjmgKJBeqzq0LrCKN+FdJ591kaIIj9qojWt/gCsx4pSUbFgkdwRw3xf5yTXxC7FgGCEuf0emUtMUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755210554; c=relaxed/simple;
	bh=Y2N18eQnm2TRaNrIB7qVD7GGFzO9rH5z+xMvU70DETc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o6HcheJLvyq9Ugab3gE3CPtUWu/4UeNDaUAFUxrF/ZmOK8wb2xSAHALQz1mSXEy324y3fy6GDDsIhcw1r2OHqKoAR3z+/zRr5Ervt3j4uF7E4Q4+Zg4OZqWJsOaR94nt8+0xilkJCiMbu7duBvDTkP4DweUAOIAwt4AFhZ7Qyes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QwDh3/9B; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QwDh3/9B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755210554; x=1786746554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y2N18eQnm2TRaNrIB7qVD7GGFzO9rH5z+xMvU70DETc=;
  b=QwDh3/9B8a2rQxgaMZsGhLZCTyZ/+ef/Dg42yRfN4gphcKUFSjmHluTP
   nekMOwu6UJu5hXg0UwVzwcxZzefIWBvCM6TATUJK4hroHqpqPqxGsgi0f
   i3/u+CaGulyex64H+TeEuPAnZf88m1niUYlJadqaTQU+wkjdSao/SijKU
   FkaCSE4OIcRmO/y5ZFenuKeJItfpDJxuj8fTxt/2FAcqiDzJsjDFsXu2Q
   NwMok/PGECwlFg1k3NBalHiXwTv7YJHAO3G8wmCf1rIEXL6WyIewj+ymD
   qofb8dNhzGjAr+oSqCNaDQ2F3p/XZEeMUcpLf71WDpnB3NnBwNKzSyZrX
   w==;
X-CSE-ConnectionGUID: g3RERbwARimGk7zSd+vIyg==
X-CSE-MsgGUID: 4JvTsWZgS8uMOgmwmdnE4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="82974757"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="82974757"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 15:29:13 -0700
X-CSE-ConnectionGUID: xp3qAJL7QGOQaJTEHhnizg==
X-CSE-MsgGUID: EbOiwKtyTVy6aWajbjgOSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="204055910"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 14 Aug 2025 15:29:12 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umgRZ-0000Ln-1x;
	Thu, 14 Aug 2025 22:29:09 +0000
Date: Fri, 15 Aug 2025 00:28:37 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 4/4]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:77:23: warning: no previous prototype
 for '__get_vcpu'
Message-ID: <202508150023.GmIXnWCi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   125206b4d7d6898a8a5d0c088a5ba75114266b81
commit: 41148bbeb73900a1fe8c5d7c64bbec5207d84c06 [4/4] ANDROID: KVM: arm64: iommu: Make allocation guest aware
config: arm64-randconfig-2001-20250814 (https://download.01.org/0day-ci/archive/20250815/202508150023.GmIXnWCi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150023.GmIXnWCi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150023.GmIXnWCi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:77:23: warning: no previous prototype for '__get_vcpu' [-Wmissing-prototypes]
    struct pkvm_hyp_vcpu *__get_vcpu(void)
                          ^~~~~~~~~~


vim +/__get_vcpu +77 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

    75	
    76	/* Return current vcpu or NULL for host. */
  > 77	struct pkvm_hyp_vcpu *__get_vcpu(void)
    78	{
    79		struct kvm_vcpu *vcpu = this_cpu_ptr(&kvm_host_data)->host_ctxt.__hyp_running_vcpu;
    80	
    81		if (vcpu)
    82			return container_of(vcpu, struct pkvm_hyp_vcpu, vcpu);
    83		return NULL;
    84	}
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
