Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D127B15CD79
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 16:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735404257; cv=none; b=VL6b23UU9uCT+vOHjRTPjvD9G8k+31m815txsKPdOnDAFeppzxzrmFWVh9qPvnz1rI7ZSf4vxdC1A0xYxKijmtr7bjV+AIMPXOiQ+bq7zOZLGLXdn2sqLOvRRCo4UIH0YePHL2RhUUEvVD6Ur8s4vwqXsLEyuFh8UhUqsUyy50M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735404257; c=relaxed/simple;
	bh=EGwPotvsje5TJPxYzC97WzY2aCCfsDqXq57oI3tEjjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bluKc6myQfY8nN09isMic5BdQ4UOsHKI0U3zGwwKcUMKdIBa+shcB7vA5OeGsE0GHBfRDfSYfRQOU9erwaItH4yTjXF6OnLxd/OIf2pIpT9Iw3fwIP/MD8etKdtQdMQo7IPQVHiFo12Q5klN4pMCR7z+YH6QGT64sKI03JlskNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=czk9VhZp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="czk9VhZp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735404255; x=1766940255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EGwPotvsje5TJPxYzC97WzY2aCCfsDqXq57oI3tEjjw=;
  b=czk9VhZpCUF4DtAVX8s3nA1XZrtuvxNYqeXXCzWVlEvfCcTirWk1BYMq
   1rc852T9HbXA12xBuBDT4R09/Z2tYKWxIyO1hfq3E10jdszJEf6UKzcQq
   vbdvbabwWLLRn6mw8fQ8fU9Shdys7wuC6uRRG9pKn/FC4Y317OUDPKpMT
   mBhZ0CPk9ulkktkNylLliODZucjnujD23XwXC8Sa0GN472NbGlm/RIbJo
   nFjk626oAFHLMvp+LNvC3pnbsa9ObeePzQLrNorvEE+iuEd1Es9ZS2RIM
   er9UL2ENsgr3r65SNnIorPD++iZTotbPer3Vo7Q6tI1+Xc8YStZ4rpOHt
   g==;
X-CSE-ConnectionGUID: 6txPBMhnQ82cZQ1no59AIQ==
X-CSE-MsgGUID: OmpMBcRrRVWhrvd9xaZ7NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="58226931"
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="58226931"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 08:44:14 -0800
X-CSE-ConnectionGUID: 4vSiNwvcRo21CW3dYYKvAA==
X-CSE-MsgGUID: 9+f+D/50SV+uu0dtZOxTMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104458335"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Dec 2024 08:44:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRZv8-0004BS-1w;
	Sat, 28 Dec 2024 16:44:10 +0000
Date: Sun, 29 Dec 2024 00:43:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1345/1345] mm/.tmp_mmu_gather.o:
 warning: objtool: missing symbol for section .text
Message-ID: <202412290049.0DgodFXr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   773f731853f1368508a0b112047bd9b5a4bb9a5e
commit: 1f7b24152a85bec4ea4f5a6219b4702853ffd3e6 [1345/1345] mm/memory: Move mmu_gather and TLB invalidation code into its own file
config: x86_64-buildonly-randconfig-001-20241224 (https://download.01.org/0day-ci/archive/20241229/202412290049.0DgodFXr-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290049.0DgodFXr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412290049.0DgodFXr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/mmu_gather.c:6:
   include/linux/pagemap.h:401:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     401 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
>> mm/.tmp_mmu_gather.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
