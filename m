Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1211DA3D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 20:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735591485; cv=none; b=AIphConXnWHAK3/zOudTEYFljc131aGZy5p4vXn7YPMXXOZrhZwQl9m+Lx4tiwrm2m2ja+5nOeUkjTSLofAymLgWRitb+2v87g0hvZo5yGWLj7FuHVzfqN6VzcOjN83cYxSf3B6Exa9rYAAWxRN36dk1Zsl9aNEkq2AbfCv4Jak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735591485; c=relaxed/simple;
	bh=hQqUO5ahHwvpdKBEBRExGdUIH7N6XUIk09HaMbGRhPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S1iVMdXrkkHlj+ndp9wcPKFRYv8gRgglq0u/uwl8XcG57lhqz0Y25YNPoiqUyueH5gdkGjfhg0k0txHJ8zXsp/aZPGCJpoKUo/9V/q8MMFpO4nBlSgWLDnj41PZvAjeySr0gEHj1x68oIUu8z2vbLYXBVJsv67fXE5svBKXWIOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U9PSLqmT; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U9PSLqmT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735591483; x=1767127483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hQqUO5ahHwvpdKBEBRExGdUIH7N6XUIk09HaMbGRhPM=;
  b=U9PSLqmT6wTAEHWehQwLwHawAQkZv6B1/r2KaL/fhWjPjB7exY6gxlRt
   XKVnkYt5pZIdJZv0nti+pxiIae67w0NN9tEsYxNicAtJU6nlvdDAOVEPw
   lQtgaWfYt07x7lQO6g1Bzbh81SiunV7/f02orgos8z/BvTfEb4iBzIGMQ
   7lu2Pb2idytUTxHCwcLTCCeI5OnigVieXl2K6AJeNEEEaCL7yad9oWPG2
   C3UH1c70czxLLpvEy8/6fZFZ4pnU/umOBIjvMimQLX5DFc14P3TjRg4kj
   nSBIdAgXsr4J4UWkUMy1csEs3TgCZIO8r4OHtsWusxbeV7NU2vKeU7HGU
   A==;
X-CSE-ConnectionGUID: 8CaWQHoTSe+O5ozGyCfFXQ==
X-CSE-MsgGUID: DjhEeXYxTUG4NSTa3XpIPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="46876005"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="46876005"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 12:44:43 -0800
X-CSE-ConnectionGUID: GEze2yNcR/+8H+XijYwxMA==
X-CSE-MsgGUID: s9DOaUObS9Sjstv6S5qp8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="101052443"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Dec 2024 12:44:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSMcw-0006Nz-34;
	Mon, 30 Dec 2024 20:44:38 +0000
Date: Tue, 31 Dec 2024 04:44:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2610/2610] fs/cachefiles/rdwr.c:860:6: warning:
 no previous prototype for 'cachefiles_readpages_work_func'
Message-ID: <202412310433.hkwF4RYM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   8bba4b17284e774544bd01d9ea5190546e93a849
commit: 33ba25cc4869bab81ad31784e7bbb25e5da2a2ad [2610/2610] anolis: fscache,cachefiles: add fscache_prepare_read() helper
config: arm64-randconfig-004-20241230 (https://download.01.org/0day-ci/archive/20241231/202412310433.hkwF4RYM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412310433.hkwF4RYM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412310433.hkwF4RYM-lkp@intel.com/

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
