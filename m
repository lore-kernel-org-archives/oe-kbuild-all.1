Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5FC1F5FA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 00:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736469510; cv=none; b=Jj9IpJeIZtk7arGejOXNzYgFXCKGtK4dVywIKQK7yjq4LCz4cu2Rar0wMq1z81v9WODVktlG9UbozoyL8fPkkD29V7u9NUL5edwoL3GZP9qpyp1tf1A9w9Nz3kwq3sXs7GrV+Bjt9fkdt7mUfTOE3HHHNDFeg0hdD/4bKgxUXKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736469510; c=relaxed/simple;
	bh=x4AKC6OiVF3xpYz8drFJwzw503NZa0ohjB8Y+653ASM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y6AiGqTPP2ooBUhVnIe9hzWHz+3ryjsUTbf67WpTSayl9aCVNTKdKWuBItQ/pisbQYYHYCtxXRuxfZFYhRHRRKA5u0VfZCnNRGL+dQadkzO9mbPmx3hOHOVpq6KTRsILMwwJQBFwmufnymU7lW62z6uK04csfAooLW2DIkRUQhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+oRoXAH; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+oRoXAH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736469509; x=1768005509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x4AKC6OiVF3xpYz8drFJwzw503NZa0ohjB8Y+653ASM=;
  b=m+oRoXAHq9I5SFpwU+zbqLx5VUG6+brnAsQaoymtk87B3SpjXCxec3+D
   +vXSqzVIrQab8rNwYkUpUescs+3y9zyVqwx7scdRvqXyT/EhtYpe9UBWh
   0rdOjbnZlfFBiorg5LwVPUbBCv/kBA4jiZfmEdR9L5b0EMhTNp9wjCRsh
   e9Ex88YaKCJEKwoXTRPqV+pqhMhuKYwZXmzVZeiMsAscLpUzREnTXUTu+
   On4XLQbqS9u6XQ+3MXkIjFPE5GXyWoRzC1btRUEtakbJVbE0DSrbE23v1
   Pcfeb+5Vj7Rx3gDRz0+K+Qez9sdPVf0Emq91iWIRZzLsGsBbepJogTIpR
   w==;
X-CSE-ConnectionGUID: wWB7uhafSHyc+XZICXTEfw==
X-CSE-MsgGUID: L0JYT/6yTlGUA/qkBriyzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="48121172"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="48121172"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 16:38:29 -0800
X-CSE-ConnectionGUID: j6nC+EKPTwKsmT5r2/6vtw==
X-CSE-MsgGUID: 4jGNPhhRRpmnU60gulIKTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107615259"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Jan 2025 16:38:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW32O-000IKx-17;
	Fri, 10 Jan 2025 00:38:08 +0000
Date: Fri, 10 Jan 2025 08:37:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2668/2668] fs/cachefiles/rdwr.c:860:6: sparse:
 sparse: symbol 'cachefiles_readpages_work_func' was not declared. Should it
 be static?
Message-ID: <202501100858.H4pnEZpa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1c1825ed0360fc09f928a4b2e1300f7b718df8dc
commit: 33ba25cc4869bab81ad31784e7bbb25e5da2a2ad [2668/2668] anolis: fscache,cachefiles: add fscache_prepare_read() helper
config: x86_64-randconfig-121-20250108 (https://download.01.org/0day-ci/archive/20250110/202501100858.H4pnEZpa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501100858.H4pnEZpa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501100858.H4pnEZpa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/cachefiles/rdwr.c:860:6: sparse: sparse: symbol 'cachefiles_readpages_work_func' was not declared. Should it be static?
   fs/cachefiles/rdwr.c:1106:25: sparse: sparse: self-comparison always evaluates to true

vim +/cachefiles_readpages_work_func +860 fs/cachefiles/rdwr.c

   859	
 > 860	void cachefiles_readpages_work_func(struct work_struct *work)
   861	{
   862		struct cachefiles_kiocb *ki = container_of(work, struct cachefiles_kiocb, work);
   863		int ret;
   864	
   865		ret = vfs_iocb_iter_read(ki->iocb.ki_filp, &ki->iocb, &ki->iter);
   866		/* complete the request if there's any progress or error occurred */
   867		if (ret != -EIOCBQUEUED) {
   868			struct fscache_retrieval *op = ki->op;
   869			unsigned int nr_pages = atomic_read(&op->n_pages);
   870			unsigned int done_pages = 0;
   871			int i, error;
   872	
   873			if (ret > 0)
   874				done_pages = ret / PAGE_SIZE;
   875	
   876			for (i = 0; i < nr_pages; i++) {
   877				error = i < done_pages ? 0 : -EIO;
   878				fscache_end_io(op, ki->bvs[i].bv_page, error);
   879			}
   880	
   881			fscache_retrieval_complete(op, nr_pages);
   882			fscache_put_retrieval(op);
   883			kfree(ki);
   884		}
   885	}
   886	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
