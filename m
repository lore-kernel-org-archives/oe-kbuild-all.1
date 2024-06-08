Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BFBD53C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 23:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717888895; cv=none; b=cWfSuRYBBjoe+hMqXE8zNqkaq9mCPO4ykBUzI0hPB/e/dFzJykWEBPggOt3yQDITGsxCPn1wDVirt19XE2zcmH5dmqEWLltBtxLj0Einbmebvb+UA9kmZVQ/36XnSMu5SjUw5f5cPjaekWcR7ppM9gmvhGpHAlyaDJhkrxZ8s9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717888895; c=relaxed/simple;
	bh=CGhkRUg8ljXyF+t7xx542S3hzec4XC/IJoeJWyQRZDw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b6BWM8OJuB8r/ZQWYxRinR80zWQNJrh4236/+MkcmRrgQ8VGZUwNzlnkZMd47a9EuYTDAhrb43ME/pLbn0C5I2XnL9/AUMRmTVlJGmHyedfytZmq18K1a0lPz+daAd6d1EueQ8y48Z6ndPo2mT8fEAr29U0gHZ1DERHHulsWnuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZ5xsYed; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZ5xsYed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717888893; x=1749424893;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CGhkRUg8ljXyF+t7xx542S3hzec4XC/IJoeJWyQRZDw=;
  b=KZ5xsYed0eHke+0dA0xrmzod6Sc8X44udtkOlFYdE8SPoikeP6P+Xb/I
   CMB7meEavjXhikpfRb4NfKyGawAS5DEpHYL0NfgRB1WjcJZmmpyqn9d3W
   0EPJo5aK2rmLEvddPpRULRpq9fxClIov+aiUB9COQg64lUYecAQmwHOmY
   Xn897pgnwxsjBhNEhtBFNiDmEJwxsUmdQ/AZsVbavqC2wgP6NlLafJTZj
   8CqNrMU2MmQfXNifV77iWcd2YTc95j1McJLRAR4aA5ehnCBpbCaI7YUwJ
   ZhYZ/9fnDl5ZZ9y537ExSPRsul6BOIZDnwvQOZlAqDY+p/kWLXJg71L2q
   Q==;
X-CSE-ConnectionGUID: YpSuqdRpRNS0XSUdIzu4Mw==
X-CSE-MsgGUID: S1ZmRn6nSSiihH35NqBNjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="17512056"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="17512056"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 16:21:32 -0700
X-CSE-ConnectionGUID: Xb8SxBqjTpqXC9EmoetNiQ==
X-CSE-MsgGUID: N6yWTYfBQKykXJkI/mPeLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="69847768"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Jun 2024 16:21:31 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sG5NI-0000cg-26;
	Sat, 08 Jun 2024 23:21:28 +0000
Date: Sun, 9 Jun 2024 07:20:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18952/22827] mm/shmem.c:1601:19:
 sparse: sparse: invalid assignment: |=
Message-ID: <202406090739.J3hAY6q8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   6a98543755cf2f636ae3169f3774d226d328d2cf
commit: 3a3a1f75d885bc1d1a25bb753dd2cf9111c457f7 [18952/22827] shmem: Introduce shmem reliable
config: arm64-randconfig-r123-20240607 (https://download.01.org/0day-ci/archive/20240609/202406090739.J3hAY6q8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240609/202406090739.J3hAY6q8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406090739.J3hAY6q8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/shmem.c:1601:19: sparse: sparse: invalid assignment: |=
   mm/shmem.c:1601:19: sparse:    left side has type restricted gfp_t
   mm/shmem.c:1601:19: sparse:    right side has type unsigned int
   mm/shmem.c: note: in included file (through include/linux/percpu_counter.h, include/linux/quota.h, include/linux/fs.h):
   include/linux/gfp.h:457:34: sparse: sparse: restricted gfp_t degrades to integer
   mm/shmem.c: In function 'shmem_fh_to_dentry':
   mm/shmem.c:3403:24: warning: array subscript 2 is outside array bounds of '__u32[0]' {aka 'unsigned int[]'} [-Warray-bounds=]
    3403 |         inum = fid->raw[2];
         |                ~~~~~~~~^~~
   In file included from mm/shmem.c:53:
   include/linux/exportfs.h:129:23: note: while referencing 'raw'
     129 |                 __u32 raw[0];
         |                       ^~~
   mm/shmem.c:3404:39: warning: array subscript 1 is outside array bounds of '__u32[0]' {aka 'unsigned int[]'} [-Warray-bounds=]
    3404 |         inum = (inum << 32) | fid->raw[1];
         |                               ~~~~~~~~^~~
   include/linux/exportfs.h:129:23: note: while referencing 'raw'
     129 |                 __u32 raw[0];
         |                       ^~~
   mm/shmem.c:3406:61: warning: array subscript 0 is outside array bounds of '__u32[0]' {aka 'unsigned int[]'} [-Warray-bounds=]
    3406 |         inode = ilookup5(sb, (unsigned long)(inum + fid->raw[0]),
         |                                                     ~~~~~~~~^~~
   include/linux/exportfs.h:129:23: note: while referencing 'raw'
     129 |                 __u32 raw[0];
         |                       ^~~

vim +1601 mm/shmem.c

  1595	
  1596	static inline void shmem_prepare_alloc(gfp_t *gfp_mask)
  1597	{
  1598		if (!shmem_reliable_is_enabled())
  1599			return;
  1600	
> 1601		*gfp_mask |= ___GFP_RELIABILITY;
  1602	}
  1603	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
