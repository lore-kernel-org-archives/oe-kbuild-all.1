Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E252C3251
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Jun 2025 05:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749015369; cv=none; b=nTLCmbcVULIT8D7VTKQu619Z7i8a1V3KMNzoxzukJMsV0WDIRZz/TSNTtQWEK/B5DUEFjO9SfCrDAv671FsbzdkPfi5w4hU84a52AgFCEskfVHPQAci9vSR8zOWMcxE/G1CIPiXQdhUwD7nzLN+Cjfsku2+2KGaSgkmrpbv8D84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749015369; c=relaxed/simple;
	bh=i9Fg9vaG0p4zgnXBWrio0WZqWYInKFFuUbfuuP+++Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pKLd1LStl8TXjrL229N7XfDk0yDPUEe/p25sl8PDVGbv0TJvqp3A7QWThnwyUeVDhAc572k+N147rg0o8ogCD+TOk5zw449a7NSOMQxfFspbVmv2ttDpgGHHMcQRpJSAs08sYt7sfUgmpqxF0xabyoPGZ+zWMFTmhuJNauOMYLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6RmOQF7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6RmOQF7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749015367; x=1780551367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i9Fg9vaG0p4zgnXBWrio0WZqWYInKFFuUbfuuP+++Jk=;
  b=M6RmOQF7Opl7ixDn1GULrohSbitJg5JR6HYWawojvrD4r9FKMV24t/Ns
   6UXSpSuNaS3JzdQi3pMGog1LKeNGtDqcKomvvcmx4wm0PHmNYn5WVWaog
   38VAFNMDAnBH7CLgM1lUQNyLrGeYK1wykdSg/H+LQzyIzDPEPHC+L0Cmy
   kiu6xhs9NAXfiEFjKdVimtLH7dQz35pSVxN/Mv55xZ8Ht3wicGLDYNsAB
   zVdh+1FI1C6mRQP56blwLVEk7Sjwmpf6tKsjmJlF8FpbCoCxxBQqPXAC6
   TJMixmgPRxW0USc3iAzPQLtWOP1C9RjjPncNGpV+6HJMv/OycetENqX+3
   Q==;
X-CSE-ConnectionGUID: 4Fev7PpqRMawjBi7s7eJrw==
X-CSE-MsgGUID: Y5wkE6bZTveXM+Ti/sYolw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="54739396"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="54739396"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 22:36:03 -0700
X-CSE-ConnectionGUID: 7eTXdvpkQhOvX7LI2tS6fA==
X-CSE-MsgGUID: e2DA9C7eQVayJ2qrjnNJ4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="148915604"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Jun 2025 22:35:33 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMgmh-0001dW-0Q;
	Wed, 04 Jun 2025 05:35:31 +0000
Date: Wed, 4 Jun 2025 13:35:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2882/2882] fs/cachefiles/rdwr.c:860:6: warning:
 no previous prototype for 'cachefiles_readpages_work_func'
Message-ID: <202506041325.btoa4Y26-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b5ec139da1a4916dfc9644ee3d9426dbd6f23c13
commit: 33ba25cc4869bab81ad31784e7bbb25e5da2a2ad [2882/2882] anolis: fscache,cachefiles: add fscache_prepare_read() helper
config: x86_64-buildonly-randconfig-2003-20250502 (https://download.01.org/0day-ci/archive/20250604/202506041325.btoa4Y26-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506041325.btoa4Y26-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506041325.btoa4Y26-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/cachefiles/rdwr.c:860:6: warning: no previous prototype for 'cachefiles_readpages_work_func' [-Wmissing-prototypes]
     860 | void cachefiles_readpages_work_func(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
