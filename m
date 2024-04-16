Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64A53B29D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 05:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713246770; cv=none; b=NAvWWQcIUyNQxMsLb0kmQYicDIXjPrMBNbeWJK6X6HMb57URuxHrzLoFqKWY4SKcY0/YfCpucWhNda1jww+pcXpxwfX2W5VdpSfM4mvUHd0wrBtlXuIuQj1Ru70A/JCfx5rOc0/FV910Ogr6FV78P2GipsqPQCVydeqCGOe+TCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713246770; c=relaxed/simple;
	bh=wieWwyodS85UEbpO0+WfZgVwwhzl1qyyvhb2K5qvXAo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c2ZyeNnRx/BvjoFJ1d4EB3gR5mRAo+FwKJIoWs/Nr3k+P8ktvdb6iGqldz73BRHKEMY4kBMIXSLK6eHgutntsxr0bQO7X0ihq3jPvIYqjPQA63W5kapNoj+oR2BAZpnvJRmj/+q3udJ+7Koc0yQ3mb4C+okYFFs/deBaGTmNAas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gIf5s5fC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gIf5s5fC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713246769; x=1744782769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wieWwyodS85UEbpO0+WfZgVwwhzl1qyyvhb2K5qvXAo=;
  b=gIf5s5fCM4aqMfDDQvwnh1UkkTq6Tf1LjWdmfMsFQarkc82Q7nBmJSdn
   sW3QM5VseM6NJOYOReJ0YJa+oDaggFC1//K6QUMzZbWZBIAH61oc7WfLE
   HDYYTAzQ9ZodjywfFBHG1kU6kgur8bFsfdTSiTvTh6+0anvyvOmxur64K
   1sUPiJCn75MiOpo6qMKQ4aMoWgmgRvK+m9/xCVGtaI6xa9ZhRauJwx/UE
   3ElRpZ7f7fs5LnnzJeJIntzXeYnIjzaVEfmFwhKR5oeHHjQDOJmi3GOGV
   mi6vnIgXUUNP/uqHaKhyUvni6xHnUO5Skbc80CnyF8bT95nLCo2FfsXjZ
   Q==;
X-CSE-ConnectionGUID: h7ii414aSUaInpgg+Ax//A==
X-CSE-MsgGUID: 2to6hFr7SPSOG4VsUHvsJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8544387"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8544387"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 22:52:48 -0700
X-CSE-ConnectionGUID: OUfmGL+nR52Hp/C5ncs36g==
X-CSE-MsgGUID: RXVIZaOITHyeuXaPTNjw4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="59599494"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Apr 2024 22:52:47 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwbkK-0004z6-38;
	Tue, 16 Apr 2024 05:52:44 +0000
Date: Tue, 16 Apr 2024 13:51:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 16506/22120]
 arch/arm64/kernel/paravirt.c:40:1: sparse: sparse: symbol
 '__pcpu_scope_pvsched_vcpu_region' was not declared. Should it be static?
Message-ID: <202404161352.JgrF3OwH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ab90000f05ebb295378878af0ab18daacb6f3ccf
commit: ad26870d2a02a2e49aa18dc7c48e09585a67cb8a [16506/22120] KVM: arm64: Support the vCPU preemption check
config: arm64-randconfig-r113-20240401 (https://download.01.org/0day-ci/archive/20240416/202404161352.JgrF3OwH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240416/202404161352.JgrF3OwH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404161352.JgrF3OwH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/paravirt.c:40:1: sparse: sparse: symbol '__pcpu_scope_pvsched_vcpu_region' was not declared. Should it be static?

vim +/__pcpu_scope_pvsched_vcpu_region +40 arch/arm64/kernel/paravirt.c

    39	
  > 40	DEFINE_PER_CPU(struct pvsched_vcpu_state, pvsched_vcpu_region) __aligned(64);
    41	EXPORT_PER_CPU_SYMBOL(pvsched_vcpu_region);
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
