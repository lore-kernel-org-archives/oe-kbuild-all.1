Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD36B179A3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jul 2024 06:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722061281; cv=none; b=j7dDjwUUNHfGHfEu43djVjw3FfU4WTWXATbJBhqgRXNWZ8EYXw46vEeol6+zlnUYeggxMdHqFMtJ7bxJIDGcyQ5my7LmD8/8P0Z9wQh8kT2JAheAxZyV8HLdFOfXKsA7hlJfcdQPHyI+EdvlB0YLX4X+P5mF7dyo9TXaFSMlJio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722061281; c=relaxed/simple;
	bh=IPEY6i/CBdeNQdUvuM2ljmi1mIIGbjmDz2yOvj2xMGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aOTzQscaiJpoyUfQNhHKsQVAq0fIVNOPljSQaBstLi9/rvRrH1XcATtsla1CLkr1IZ+hYy9tqXVpfYlNiw0adpU1PXPSJ7cE3EAYq+hjXOuYJ/VBK8hJeJxppJ0OtVh21712cZALJuldoU32vBG8dLbLmT4H7QknMScTn5phOn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZZUFiibx; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZZUFiibx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722061279; x=1753597279;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IPEY6i/CBdeNQdUvuM2ljmi1mIIGbjmDz2yOvj2xMGU=;
  b=ZZUFiibxWiOdTTNX5k+xPUhP8/bNgmbFp4prTg5cpsTY4rUmyqPG5SjH
   2KO+HMrsdv+sMeTvtNSAo2Cfj0Hn17qZkTiDbzyJwJ7jEiYr8vBdzRkl1
   QjD3ULwjLWacLAOMmqBHKHZVzM3i/ruU6gv6bC9aIEFpUElkzE9Up3sur
   wzt/ZusnIx98yrN24/NLKujvVhZfCtgEjgy/Ddh76yuWy1MnvI7GhRqHl
   glmvKxtBZKD1v3ohsodSJhVA5QYplx8SP8rcvBi94Ky1kcL/+TcLSwuSw
   hho27CrS4Birfej+QYqCxNJ7BmuIQjQflE0JlhcrVufjaAvmWM2/RBWlJ
   Q==;
X-CSE-ConnectionGUID: WXmKx+lPTZ+Hy4YQgsrMQQ==
X-CSE-MsgGUID: Ls8w2TNnTGi4XD8OuRNK5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="20003319"
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; 
   d="scan'208";a="20003319"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2024 23:21:18 -0700
X-CSE-ConnectionGUID: wrqB6XbHT0yVUORWIXh/UQ==
X-CSE-MsgGUID: nb7j2S3VQ0SQ27x8vZlnow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; 
   d="scan'208";a="57623237"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Jul 2024 23:21:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXanq-000pfQ-20;
	Sat, 27 Jul 2024 06:21:14 +0000
Date: Sat, 27 Jul 2024 14:20:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 9458/23370]
 drivers/iommu/.tmp_amd_iommu_quirks.o: warning: objtool: missing symbol for
 section .text
Message-ID: <202407271424.5G6KyQ0z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   365ea86d72567c1550e42ecf0e3f4521da9a5570
commit: fe2ee4839a7421367da12f5610e1b45c619fcbad [9458/23370] iommu/amd: Override wrong IVRS IOAPIC on Raven Ridge systems
config: x86_64-buildonly-randconfig-005-20240727 (https://download.01.org/0day-ci/archive/20240727/202407271424.5G6KyQ0z-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240727/202407271424.5G6KyQ0z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407271424.5G6KyQ0z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/.tmp_amd_iommu_quirks.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
