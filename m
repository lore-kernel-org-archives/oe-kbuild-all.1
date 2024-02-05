Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3347F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 00:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707094378; cv=none; b=VGj11f3Y95x1OKa5ohwOFcjdxocZF3VEWUuKuDGc/N8sPsnH1Xjth0gZobF5SOdr0IRFkNRtTKhYhKUJvMTp0a0aoOUPVkA1kTzMWZX6i/plobsIbGKHr8jGNrlD4ZfHk6IvS9LsPBE0A9wOM1LKN555qRxjh99hg4Ieu+6r3aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707094378; c=relaxed/simple;
	bh=O3l02SRVDbrw5/W00h5eJYMcV895/1kLrB5U04efRe4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hGGqUuwgJjimFschf63zH16HJJhocm8ODkKgfW3wnsGUJNYQBvnmt1/VFdUYwb3pMxawT66b+CVsrCva1Dt9XwhzUoxlm+ySF3YptkIGEOPv1rKewDBL7etLaiu7OGBbPpmDf+sFtT9TqdsFb94A6XcotE81VCdX5qWrg1pWJIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TWiOz3sd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TWiOz3sd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707094377; x=1738630377;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O3l02SRVDbrw5/W00h5eJYMcV895/1kLrB5U04efRe4=;
  b=TWiOz3sdvA63GPyXoRYOH+Tud5b3fAPOhLZQAm6OFPkp6FxhGNkuFZ+c
   Wf1XET0h7mCpVC+cqvvsQs/gmRTntSku8aTQW+AihbwFltswiEd91SQeY
   VrvUD78l2HwTxSW86aoCFpLj444KQuwnjLDGQyKdUwTKSIvGWaqSHGaqW
   go3Pkj44a/DBTjLFuDNzJ0L5oRXFGm5CabvnW652ilgb7cwQdONgDG8Yo
   Ho4fkTELl/XXPSrUOvBeB4Z35feGT5ciQgVqzNIu+oDWWBdzmlBZactmg
   2nkyL9KVy8vJA/3EA2Q6XT6gqBGCU08GqXOjjrG8rbaeru0kI6UdGFzgi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="11522725"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="11522725"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 16:52:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="865485"
Received: from lkp-server02.sh.intel.com (HELO 1098e01a32bc) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 04 Feb 2024 16:52:55 -0800
Received: from kbuild by 1098e01a32bc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWnEC-00003K-2p;
	Mon, 05 Feb 2024 00:52:52 +0000
Date: Mon, 5 Feb 2024 08:52:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 4140/30000]
 arch/arm64/kvm/hyp/nvhe/setup.c:19:27: sparse: sparse: symbol
 'pkvm_pgtable_mm_ops' was not declared. Should it be static?
Message-ID: <202402050724.PQKjRXAR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   bc4cd26292c67455a84d6e7f6b7355e6fc9377f7
commit: ae1ed8a984395ff05728ea212fde0abb93d95864 [4140/30000] FROMLIST: KVM: arm64: Prepare the creation of s1 mappings at EL2
config: arm64-randconfig-r123-20240204 (https://download.01.org/0day-ci/archive/20240205/202402050724.PQKjRXAR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240205/202402050724.PQKjRXAR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402050724.PQKjRXAR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/setup.c:19:27: sparse: sparse: symbol 'pkvm_pgtable_mm_ops' was not declared. Should it be static?

vim +/pkvm_pgtable_mm_ops +19 arch/arm64/kvm/hyp/nvhe/setup.c

    17	
    18	struct hyp_pool hpool;
  > 19	struct kvm_pgtable_mm_ops pkvm_pgtable_mm_ops;
    20	unsigned long hyp_nr_cpus;
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
