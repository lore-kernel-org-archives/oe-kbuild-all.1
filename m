Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070062848BB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 12:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771332646; cv=none; b=OmutLr9ftAiTTEbgMo91P8MzqQQV11I+gmyg35B9EUDA53IPwhJQgECqNtv83tq0wpk3kAr19i3aDilpV2dtBlKq/xgW58qs3GgMUyW90ouGTQn95xQ4/CS3eMAMxU3wxUAQPP4mbdbLN47jRL448eCupAsTVKSehzADVL81MVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771332646; c=relaxed/simple;
	bh=JWhBMFmP60u96fUmrnW+Et46p+vXRSTmhIrrV7Bi5g4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HrWv4z/Ixt2KcwqMk1vRCvjHmtuMoJlzG0rj1ippvcmyQYUQDZVGPwsIcaRJAxK/ZpzjZNF1tTvV9JS06+IfUdX8xzhHnMAUB/V0y916oRMNyWEh9frOZI04s9ceCpzGNlsrUVKzbzQePR66FLajyk4GPvbF1KwwtHq6w97dyBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z3FHsLJi; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z3FHsLJi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771332645; x=1802868645;
  h=date:from:to:cc:subject:message-id;
  bh=JWhBMFmP60u96fUmrnW+Et46p+vXRSTmhIrrV7Bi5g4=;
  b=Z3FHsLJiNm6C4Eq+CtPgiXsrmBQctbFq+eKPNkO6tb0/beZB7AXc/QYw
   HMBEiy1X41XRyqxqtI7xTnP1pm5GJynANfwdqbjrZDhxPyFVt+YEJ777I
   pui17aVUszGctiKRzeY6Uhiw3bNPsOBLH3iPQC5/yBx1BeKNVe1UMjCid
   cF6WddlGMh5OGXijBI0B7/ijVfZE0epTbv5eHiP8mOiCjd0mi75HaQIX1
   1QhHqeHvob1ql4uI49RSavLb/oj7VosyldQ1dDMQE1aAlWXNnxb0PcyrS
   6Nns0yobLH3l2HCK5aCM9l0QJHUEUHzIXN36BlP+j4C19Rpst1Y9Kkj83
   w==;
X-CSE-ConnectionGUID: OelttHghT3e6erdRCW+NmA==
X-CSE-MsgGUID: GM4StNgqS0amxwUTJjOPRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72306026"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="72306026"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 04:50:44 -0800
X-CSE-ConnectionGUID: f6A2hbMEQLuqfFPYeY5pzg==
X-CSE-MsgGUID: WMFD7AWySaGn//fickVNzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="213884267"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Feb 2026 04:50:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsKXI-000000010zE-2Jj6;
	Tue, 17 Feb 2026 12:50:40 +0000
Date: Tue, 17 Feb 2026 20:49:58 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linkinjeon-ntfs:ntfs-next 18/18] fs/ntfs/file.c:657:13:
 error: implicit declaration of function 'vma_desc_test_flags'; did you mean
 'bdev_test_flag'?
Message-ID: <202602172032.yKMLCF3c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Namjae,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   225383c049d157bd7d3af29707c830a9474bf74a
commit: 225383c049d157bd7d3af29707c830a9474bf74a [18/18] ntfs: update all remaining mmap_prepare users to use vma_flags_t
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260217/202602172032.yKMLCF3c-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602172032.yKMLCF3c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602172032.yKMLCF3c-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ntfs/file.c: In function 'ntfs_file_mmap_prepare':
>> fs/ntfs/file.c:657:13: error: implicit declaration of function 'vma_desc_test_flags'; did you mean 'bdev_test_flag'? [-Wimplicit-function-declaration]
     657 |         if (vma_desc_test_flags(desc, VMA_WRITE_BIT)) {
         |             ^~~~~~~~~~~~~~~~~~~
         |             bdev_test_flag


vim +657 fs/ntfs/file.c

   645	
   646	static int ntfs_file_mmap_prepare(struct vm_area_desc *desc)
   647	{
   648		struct file *file = desc->file;
   649		struct inode *inode = file_inode(file);
   650	
   651		if (NVolShutdown(NTFS_SB(file->f_mapping->host->i_sb)))
   652			return -EIO;
   653	
   654		if (NInoCompressed(NTFS_I(inode)))
   655			return -EOPNOTSUPP;
   656	
 > 657		if (vma_desc_test_flags(desc, VMA_WRITE_BIT)) {
   658			struct inode *inode = file_inode(file);
   659			loff_t from, to;
   660			int err;
   661	
   662			from = ((loff_t)desc->pgoff << PAGE_SHIFT);
   663			to = min_t(loff_t, i_size_read(inode),
   664				   from + desc->end - desc->start);
   665	
   666			if (NTFS_I(inode)->initialized_size < to) {
   667				err = ntfs_extend_initialized_size(inode, to, to, false);
   668				if (err)
   669					return err;
   670			}
   671		}
   672	
   673	
   674		file_accessed(file);
   675		desc->vm_ops = &ntfs_file_vm_ops;
   676		return 0;
   677	}
   678	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
