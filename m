Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA3FDF5C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 19:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735585294; cv=none; b=Bka8dyQWmGDQLyqgrsUQC54Z97XaXRZHsGdcIh/RHQQ9V8qZ6iJtJ95C1K3U1lsWhPKel/mKoti0n47zPbVwlsFHvjuI9K3f8F6gC+kXSdapkq6o8n/5qh+auexGmoBds1IUGCBjzijBPkmu3GePECUejlnGY4Do6Mbr5moTB4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735585294; c=relaxed/simple;
	bh=bg23US6NwpADecYG7TH/sQ4TsPkEbOmQRgSeueLyHuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CsmJ/aJWI3GW17s9SzFUQbQO6Lyi4boKzVxBVIOxVqNlsl+I6eDnPSPSOKb20MIIzJaBe3qksRPX/f28YQExnuXfqNljv8xdWip+aJv3RHGm4G+0Gv9Q7RK3cic6TEvdDjuEVtgOmxY8Kn5JsFBRFJAP+il3i37Ygs45bXsNgPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ekJHo265; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ekJHo265"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735585293; x=1767121293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bg23US6NwpADecYG7TH/sQ4TsPkEbOmQRgSeueLyHuE=;
  b=ekJHo265RO7PWxbQ4dh64l61GukI2hCZx8ppT/MmKNrFcPbb3xLY4X8b
   52cHaHkPi03bN51XD20uw7hLfH99VUp2NMfLU3l015nkSuhPZoFdFFQlo
   uWMUwQlklMg9TJzyYtEJeZuDKE/y44/B1uccs3Em5EG9lepHjAk7DZDu0
   eqyj6JO2EvoPbtqRCHFvgd5zJTgrBFGPE5Re9dwHYwhremROBMEwZBV6y
   aEoVL3hn7Gkl6KzI8lKmLyjtlncykJpa0GrBlro6NcuPmeyTUMxIOTU8P
   Hh7GB0eE96WK/VtmIzkf5K4BjKcXBK9FYdQcCQ+nVe1ZAR+v/wDdlIjnX
   g==;
X-CSE-ConnectionGUID: qlzANP0bTyWhqJz1OZSEpA==
X-CSE-MsgGUID: is61GjecRJSmpcq2H5BgaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="58340077"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="58340077"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 11:01:32 -0800
X-CSE-ConnectionGUID: eAL9qnNPRBGSsQFp6mGX/Q==
X-CSE-MsgGUID: da3LJcSdRyaEFYq0lqLviQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101714588"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Dec 2024 11:01:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSL16-0006Kd-1t;
	Mon, 30 Dec 2024 19:01:28 +0000
Date: Tue, 31 Dec 2024 03:01:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2610/2610] fs/cachefiles/rdwr.c:860:6: warning:
 no previous prototype for function 'cachefiles_readpages_work_func'
Message-ID: <202412310255.QS4rGSOC-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-001-20241230 (https://download.01.org/0day-ci/archive/20241231/202412310255.QS4rGSOC-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412310255.QS4rGSOC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412310255.QS4rGSOC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/cachefiles/rdwr.c:11:
   In file included from include/linux/swap.h:10:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:28:
   In file included from include/linux/cgroup-defs.h:22:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:12:
   In file included from include/linux/mm.h:1587:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/cachefiles/rdwr.c:860:6: warning: no previous prototype for function 'cachefiles_readpages_work_func' [-Wmissing-prototypes]
     860 | void cachefiles_readpages_work_func(struct work_struct *work)
         |      ^
   fs/cachefiles/rdwr.c:860:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     860 | void cachefiles_readpages_work_func(struct work_struct *work)
         | ^
         | static 
   2 warnings generated.


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
