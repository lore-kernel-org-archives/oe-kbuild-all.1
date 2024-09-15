Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634BC6FDC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 23:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726444786; cv=none; b=j3cpBjzCOAq9IHRHVmjvL/PAyzOgaYRB16SwmKsFukG3FpbDTi4JEh8ErkXkpWCsvCOgFVf6cZuzWH4lLyah03N6itrhlQ/F0P5uTjwfNEbJWlhB4UG75dbjJcV6nNZq1dcj/WyD+RaqF+aSMqD8S0SHPK+Di9wmGjeytr4CiLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726444786; c=relaxed/simple;
	bh=v6G2hMAfBwzxYCObfzVih8doHdai4g5r/G2r/U5WL0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ndc4R/X6xbvtnl9mtPljUH2qHj8wyIFOYspCFd2yKDP6YesGHIANipSyvj7e4Z8s41AdbujsIKN0KimuXYlZP2lxXp2U5Wrk9wb9ITtPyvfOZHe7O4/kDNSj8JZDFat9rmw1VjwIc5oPsovhiEkbLs1sjTFKDZ352xWNSm5OdbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OnBCj+Pc; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OnBCj+Pc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726444785; x=1757980785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v6G2hMAfBwzxYCObfzVih8doHdai4g5r/G2r/U5WL0o=;
  b=OnBCj+Pc0W0pbJySEicsGZj/ZV2RwNGnuxSb1SC1gQDJvvbvUprwiRH9
   Ba7lWDfQqlOQDAcwfBeCa08pfA458bxlRSnGiEB/023CkNWDzkqNX2DrQ
   V2ksJFltPJgJ4h08Yzdm0+5y/MTD/TwGbdh2HdxLUXEl60dLtaXcX7sgq
   +WT4BCMriHCvEcL79Ofq3EXspKdRpLX+jfKOr4e+6YtnDVOESKjlonJyH
   68Lf+tk8IDn1OD5e483d10l9ojGHNo/UrL0rAd+4juX0vetr1ZUsJAkWm
   swjHE3RiUMcSB3noaNKWhqLpZFJp4sjGajVynBYWym89Hv78xQl1giAjn
   A==;
X-CSE-ConnectionGUID: hId2ghS3SISXePb8tE+oXQ==
X-CSE-MsgGUID: B//4nUp7S4CXYdnlr0kbLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="25399217"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="25399217"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 16:59:44 -0700
X-CSE-ConnectionGUID: ZcjWIsQrTj+NUnCJMbREZA==
X-CSE-MsgGUID: 7DPvIEcKTpOt517qsbC9jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="68335316"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Sep 2024 16:59:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spz9Y-00099A-1y;
	Sun, 15 Sep 2024 23:59:40 +0000
Date: Mon, 16 Sep 2024 07:59:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 9450/17485]
 arch/arm64/kvm/hyp/nvhe/hyp-main.c:39:1: sparse: sparse: symbol
 '__pcpu_scope_host_hyp_reqs' was not declared. Should it be static?
Message-ID: <202409160748.NKkJaUtC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   1fa94a14074632ecff57ab73a2c9677521b7524f
commit: 70ade4bab360fa86696d8c60412d0de98bb9645b [9450/17485] ANDROID: KVM: arm64: Encode hyp requests in HVC return
config: arm64-randconfig-r122-20240915 (https://download.01.org/0day-ci/archive/20240916/202409160748.NKkJaUtC-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20240916/202409160748.NKkJaUtC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409160748.NKkJaUtC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/hyp-main.c:39:1: sparse: sparse: symbol '__pcpu_scope_host_hyp_reqs' was not declared. Should it be static?

vim +/__pcpu_scope_host_hyp_reqs +39 arch/arm64/kvm/hyp/nvhe/hyp-main.c

    34	
    35	/*
    36	 * Holds one request only, in theory we can compress more, but
    37	 * typically HVC returns on first failure.
    38	 */
  > 39	DEFINE_PER_CPU(struct kvm_hyp_req, host_hyp_reqs);
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
