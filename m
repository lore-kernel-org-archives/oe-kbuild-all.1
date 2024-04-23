Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8F41E898
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Apr 2024 16:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713890861; cv=none; b=nY/z9z3dw2qc9UhDkPgct+nmG3K6Zg5BvfwDe2GYZr6iVGHkUFr7UL8ViNIquLuN3hXKeeYz/y4q5O64q6JbG6YmPw0dfscVlLIsRcvJ56l1YicSHSq4XvzVvj8QU87v1PftvG6tojKBW+kFlfH1qG3VfH3m32AT6c6iNIIK1Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713890861; c=relaxed/simple;
	bh=Iw7/ax9uuInIQ7nxMG0tcsWKLkON3MoOL52mhDqLwFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I8AOI8m7Vhq8zuavnV3O9yaHACQSLfr+aCBmtvVYogjHkaOCAYKkdigz6qouZmDG1M2iuZUXQmje7QNdYUXWbioEbOdgOnt11QkeFlwCpR4yjakbzTIt6ypw8HdPNrN0X/wVDwR6cE69NP0UrkhxP+Ws83IIwD7vUHwCvI9Hxuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PAlfoCXX; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PAlfoCXX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713890860; x=1745426860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Iw7/ax9uuInIQ7nxMG0tcsWKLkON3MoOL52mhDqLwFc=;
  b=PAlfoCXXaFu1YplR5YxfmwgGtWx5qM/VUZotJ3uxe35apOaNh19fxXir
   BpMGb2sa73dblav1uBrG4fNjanOrIjIKZuJnpF7igCY3iu+b4toOHdQot
   a+iZswKB2sjuBkr6jCCBGxBwk3DQTXJPIozY6dSJrhdNuAeKgS4qwxm6H
   eIxx5vAMaKUr4JvEn6KIk3IglFV0QZ6qQ8ZcvE0SKhw2q4skL1O7XGEXM
   RjKszZVHoS+fvSMasePPoebuv9J+8ginqxcefn+/2hLc1q8F9d0wn/LSZ
   Zc/OQXbm/ko6s6lIaf4mQBH7qVW7Jq/hNuXnbI4KXl6FXBtD+aKXIbzQS
   g==;
X-CSE-ConnectionGUID: kcwfQC+UQjGQdj7BfIbahA==
X-CSE-MsgGUID: Tv5AxuR6TxCRiAO8ho/Gkg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9339037"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9339037"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 09:47:39 -0700
X-CSE-ConnectionGUID: IXu9YeSVQw6rre4x7YgBMA==
X-CSE-MsgGUID: YWZVkG2mTX6KCE0t2Mc8gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="55402063"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Apr 2024 09:47:38 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzJIt-0000M0-17;
	Tue, 23 Apr 2024 16:47:35 +0000
Date: Wed, 24 Apr 2024 00:47:04 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [weiny2:cxl-cper-testing 2/6] drivers/acpi/apei/ghes.c:710:1:
 sparse: sparse: symbol 'cxl_cper_fifo' was not declared. Should it be
 static?
Message-ID: <202404240040.YT2KAtSx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git cxl-cper-testing
head:   9b1f33314e8488506dbad63dc1c896386d4803d6
commit: 5cda2b55e5656f16f327e45c71af123d9d934fdb [2/6] acpi/ghes: Process CXL Component Events
config: i386-randconfig-063-20240423 (https://download.01.org/0day-ci/archive/20240424/202404240040.YT2KAtSx-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404240040.YT2KAtSx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404240040.YT2KAtSx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/acpi/apei/ghes.c:710:1: sparse: sparse: symbol 'cxl_cper_fifo' was not declared. Should it be static?
>> drivers/acpi/apei/ghes.c:721:20: sparse: sparse: symbol 'cxl_cper_work' was not declared. Should it be static?
   drivers/acpi/apei/ghes.c:723:13: sparse: sparse: context imbalance in 'cxl_cper_post_event' - different lock contexts for basic block
   drivers/acpi/apei/ghes.c:756:5: sparse: sparse: context imbalance in 'cxl_cper_register_callback' - different lock contexts for basic block

vim +/cxl_cper_fifo +710 drivers/acpi/apei/ghes.c

   709	
 > 710	DEFINE_KFIFO(cxl_cper_fifo, struct cxl_cper_work_data, 32);
   711	static DEFINE_SPINLOCK(cxl_cper_work_lock);
   712	static cxl_cper_callback cper_callback;
   713	static void cxl_cper_cb_fn(struct work_struct *work)
   714	{
   715		struct cxl_cper_work_data wd;
   716	
   717		while (kfifo_get(&cxl_cper_fifo, &wd))
   718			cper_callback(wd.event_type, &wd.rec);
   719	}
   720	static DECLARE_WORK(cxl_cb_work, cxl_cper_cb_fn);
 > 721	struct work_struct *cxl_cper_work = NULL;
   722	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
