Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C5DCA4B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 14:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735654931; cv=none; b=rkS4U89JuLzNFFbKTrYzyD6MMPBN1hS7NaD5xBAEddBbXzvfCcFnmjJuxcUSKx+EH4Igw80jQWIg1E4Sku4RnSJqmYhTMQwkqCimkJOSlhZvTuvb3K/WE5BMasUOQB2V4g7mSGjIu6K+9qTWddYcX3CTTurb/NTB1/7j7XpW0p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735654931; c=relaxed/simple;
	bh=dsgVfOxGMDRGHXrOJogEqYSWlNTDBfrPYpoIzKV0u/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aPonPyyRkKqMqTBqGew0iLDsdy3qLIoxbfaDCpqW8WFopItXYy5JfVdULpSB9dlKE8d0foTxom5IuYamdyrqrN3SJBeoYegSmgW+m2srazkxdQCl0WtckG0sgMYA474nrfGPc8z6hCrJ4i7d/lQ70/z2/qm8KmEh6uVAbRShm8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1eqYGHs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1eqYGHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735654929; x=1767190929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dsgVfOxGMDRGHXrOJogEqYSWlNTDBfrPYpoIzKV0u/E=;
  b=F1eqYGHs/DZJCVRSTdBeO/LbF69E3c8o4bkZRE7wcwCy2b0tyO28NaU3
   Dvvb9sxah89pk5mfXO8GIIspUjD0NEspEweenFB8uIs6tozPY+Z3LJfRB
   5zR2pCHjB0oUDjijcjme0aebh2QzhmlWAT1A3ChJFb9NQbaGwt66RgMXv
   rvIDXxx5P9VbF9IMMP6NMsrfFpjpBj64DaPAxFpY2j55c3HeksypJ/uuv
   Zaqe9FB1QeBE9zCfmKjZ0y6q8szF1XlfY4sLSPuB9zP3W9lGinEOqkbfa
   kbjQ+6Y1obJSaxtpWdqeBwhKmfsep4e5M8wbWftzOy998d2AwkryrjiQ8
   g==;
X-CSE-ConnectionGUID: BVdYp0oyRTacpFHqZFWgOg==
X-CSE-MsgGUID: Qyxbop1nReSAtrfkRtV8XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35818789"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; 
   d="scan'208";a="35818789"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 06:22:08 -0800
X-CSE-ConnectionGUID: Ynaaj+4CRyWwmVjg9cmQXw==
X-CSE-MsgGUID: w1iZ430eRu65ksXy8xqDbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="138404178"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 31 Dec 2024 06:22:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSd8H-0007Al-0w;
	Tue, 31 Dec 2024 14:22:05 +0000
Date: Tue, 31 Dec 2024 22:21:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1359/1359] mm/cma.o: warning: objtool:
 missing symbol for section .text.unlikely
Message-ID: <202412312256.AeCQ4M5D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   c5153b86663f32200bbb4d8b3640acb261912e6b
commit: 775947c125d5bd6e00e0dcf9d12c57fd5d44d07f [1359/1359] asm-generic: fix -Wtype-limits compiler warnings
config: x86_64-buildonly-randconfig-002-20241231 (https://download.01.org/0day-ci/archive/20241231/202412312256.AeCQ4M5D-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412312256.AeCQ4M5D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412312256.AeCQ4M5D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/cma.o: warning: objtool: missing symbol for section .text.unlikely
--
>> arch/x86/kernel/hpet.o: warning: objtool: missing symbol for section .text.unlikely
--
>> net/ipv6/icmp.o: warning: objtool: missing symbol for section .text.unlikely

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
