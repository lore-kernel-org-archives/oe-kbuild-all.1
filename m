Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF6C20B22
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Apr 2025 01:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744939779; cv=none; b=h/GOOu/oXQyuRbM/atQZiKvazpWifM+iVcJhZh9PALe7l7ENSDeRWA+ZxMgHhH80LidQNtRujdIzF3w+Gk4D0Cz8+aswlM+r2VOZSYHlHrqq2TZyx6V8vtics9H9hcN2EyTkSEVeOKepm0FCgjFGxeNmaroRST/Vxr3wB3VmfiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744939779; c=relaxed/simple;
	bh=L+rTQAPQjvLjB8n1Fv3ptNvNb2ivSm75pSJXtSGm3SA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GM5OB1YZ+lV2g1aoH1+ocnMNpRRXCa/M7rtQ7506AVqE2N26RPptwYNZag19v85ptQ7Az0d9c2fIZeo35+WZqrL3GIxsUNeEX1solYgf4GXCRXM//b7scXQvwWE5a/NYkVGtRKzqsu3szA/UqI2VHGzurUlbUtNi5csy9Na7QMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h+vFIU2l; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h+vFIU2l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744939778; x=1776475778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L+rTQAPQjvLjB8n1Fv3ptNvNb2ivSm75pSJXtSGm3SA=;
  b=h+vFIU2l1yzaxvgODmoX+uS/H6y/CRhYljZ/lvNyLtsZfmGHFI5pCJ+k
   cHgT88c7bIEnUDkjUzPDurCzJELqvQaYS7D8sEUpfp0JQeffhv0strvjE
   24Zxfed3MIC1HKke86i1JVuIqoW3gVEigqxoVJ5lV1CWjqaKFPPv5N5tZ
   qiWtP1grfJjDRM5y0RGhpmpSa0+9ZZNQpVbZ64Qq2NQHUfacCW9ZQgTwU
   guwJvv0or/kBzIl0buCn8QfFElNiIcEzxadlJYO5jBKYvSGFrYbF0xT8s
   Go64+XNYZAF6EeRlFUzKvXamEqqgs7WlZHFA26N7nTXPXEXtYG5nWRiaO
   Q==;
X-CSE-ConnectionGUID: zEN5XyoNRj23/s6diAAWxA==
X-CSE-MsgGUID: wG1wWWakRlO6KPO373RL+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46734765"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="46734765"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 18:29:37 -0700
X-CSE-ConnectionGUID: +SBqPs04Tee49FEmh+LcKw==
X-CSE-MsgGUID: uMU9z6/3QMCjbiAlnMVI+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="131519135"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Apr 2025 18:29:37 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5aXu-0002GT-0g;
	Fri, 18 Apr 2025 01:29:34 +0000
Date: Fri, 18 Apr 2025 09:28:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1510/1510] mm/mmu_gather.o: warning:
 objtool: missing symbol for section .text
Message-ID: <202504180904.aJTbSHsO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   c61927b921388695af91d0e58b8709040ed6cb17
commit: 1f7b24152a85bec4ea4f5a6219b4702853ffd3e6 [1510/1510] mm/memory: Move mmu_gather and TLB invalidation code into its own file
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250418/202504180904.aJTbSHsO-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250418/202504180904.aJTbSHsO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504180904.aJTbSHsO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/mmu_gather.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
