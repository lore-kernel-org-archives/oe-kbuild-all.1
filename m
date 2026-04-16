Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3272F5498
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Apr 2026 15:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776354963; cv=none; b=KzgW4Z/COnOm5zV6N4MI4HsPT+xHjnANnVjfkaE8LFvyUEz5yM3adbkbXtzkH03gGdxQMOB0VGJ/KllwoSyHgMEsqYdJ2g1ag6R+rnncf5ZoM+kCqiei3hQ7Exms2TG0/Dt/Va3kFDX9WeEpC7ULHZLzMXkCODqEo7UQ6Pw9uzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776354963; c=relaxed/simple;
	bh=5l8+LvkaQnop2KIWgKwCOv4s21R92qe6eEI6aq1elyc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RXA0fjRi5m4js036qzFxUo2lxMJATpShwvF2TFoHFy8h5XYwNq5DIYKpbVahTWsNeU/WsFVMZVmxLbbHb50/SHBDtF1XfN6LPS03OEM79ECIGbNVkP9jetHTO3Ul+s7pKlt/07jHogFjsrCCZvRUA51UBQtWKckgSnECG57RiWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8no6Jj3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8no6Jj3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776354960; x=1807890960;
  h=date:from:to:cc:subject:message-id;
  bh=5l8+LvkaQnop2KIWgKwCOv4s21R92qe6eEI6aq1elyc=;
  b=X8no6Jj3/pQAfBLAolzlxlVb/bje7OzWZ1aWlnBY1XppHe0i2VfdggY6
   ly/uezAGGGFTQFwmdOOVnvnFs7UhDbHOjhr/oJxiDa/pvgBh/HXs/iBze
   ZYuQ9n/MwwFxncv3a5h2Pyv7Sj2D/NbmwFIDvKcmo9c9hSWuzq9/LEW6x
   u8WdC0RbnP1zPYZmCC9h3+sukP9CzsmQx1uHsdVueRWVowrDbttpB5D0M
   3M/BRInPD/ZtHffZcqi8CmU8mpbnxP7pp1BpV9+IbRvXOpdqAd0xsaZc9
   cseTPNiVlbPWVCZRBDE7d6nmMHDuD7sb0Sa/fZXWqy+uYN8UbMyFkH+uZ
   w==;
X-CSE-ConnectionGUID: AXrEdGolSb6F8ZLKv5JQ5g==
X-CSE-MsgGUID: JO8BrfNJRb6IheTG1QvEfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77431394"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="77431394"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 08:55:59 -0700
X-CSE-ConnectionGUID: QgwLZpUkQdiViVpCgEz5xQ==
X-CSE-MsgGUID: wVenW9pPS5Sgpp0fHLXLeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="226059524"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Apr 2026 08:55:58 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDP4N-000000001i6-29bn;
	Thu, 16 Apr 2026 15:55:55 +0000
Date: Thu, 16 Apr 2026 23:55:02 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Namjae Jeon <linkinjeon@kernel.org>
Subject: [linkinjeon-ntfs:ntfs-next 47/48] fs/ntfs/file.c:657:13:
 error: implicit declaration of function 'vma_desc_test'; did you mean
 'vma_desc_pages'?
Message-ID: <202604162346.ovX9CHOt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   75579d45c31244811d57ae99692b6c3d197560b4
commit: 50ba0870ccdba0b8fa15f1eb0e11bfa08185c383 [47/48] ntfs: fix build error due to vma_desc_test() rename
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260416/202604162346.ovX9CHOt-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604162346.ovX9CHOt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604162346.ovX9CHOt-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ntfs/file.c: In function 'ntfs_file_mmap_prepare':
>> fs/ntfs/file.c:657:13: error: implicit declaration of function 'vma_desc_test'; did you mean 'vma_desc_pages'? [-Wimplicit-function-declaration]
     657 |         if (vma_desc_test(desc, VMA_WRITE_BIT)) {
         |             ^~~~~~~~~~~~~
         |             vma_desc_pages


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
 > 657		if (vma_desc_test(desc, VMA_WRITE_BIT)) {
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
