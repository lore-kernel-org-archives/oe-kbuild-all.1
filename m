Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3DF54654
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 22:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772836392; cv=none; b=WuK4NQMIymz2Q5SFdZtb+0SGXJqXAVqyUPYGThTqXu6lqiL2oy+TD1sQqhDhimp2vTkNYtYaGEchSoKoaOwnWOUzOJpUyWSoM10orLVSakveET5Epc8urWFpy8KjZn0N3J0ZhoQa83sgvjAhgH9p2GOnMNcdxrzZby7GE0pX3Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772836392; c=relaxed/simple;
	bh=0Phjkdon23dcLONqGDw6DUvXUifo369cNvhZ9zUTWVk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I+W8jLBfkqdCpluxHR6KbwcNTwZEu8GggTVPL2rIgE9IdH2zuKFffS3wWbVh3QGvTqlp1Lsjq29Llggxhq7LBOtcR6TjvO7TXrUTO0XXzpDmX9M+trz9CdzlfB1ekjg7V4/KR89SlhzItNdpa8v8mq+U1DZRpFWRoDTZM/vy2sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mWU626HK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mWU626HK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772836390; x=1804372390;
  h=date:from:to:cc:subject:message-id;
  bh=0Phjkdon23dcLONqGDw6DUvXUifo369cNvhZ9zUTWVk=;
  b=mWU626HKob2DxHZi7r3wcu+SNapHkLHmpzQ3G3VmkWgItl7IrciUJ6V4
   eT/1xssSNNaJAd//+CW4tdYmrueh417xairdncyMYc400acxxS5w7DLzY
   zCstBCTgn4AdV8BUWGnNbd1JyxX8Tv0klqYz8E/ddjeLL0YU2FLdoWRux
   hGZy5V5PboIdQe0B9JsVibUDK3lLhrBCCIlGKRvCuET8DyRRjCu2mxaay
   chh5U1AeT80A8vLbDB+PEArmQa4F9MY83Ft6lOfE+XxrvFsBLYoLHpCMF
   8D0UKNdx5mo0CyLbWVHs1o74QoKveZfTfe92ng1SFDvFxzkb7yQQaGme8
   g==;
X-CSE-ConnectionGUID: LDfYWKHxT9GqvyribFarvA==
X-CSE-MsgGUID: 5KktrqpkT9O1NQJvykJXrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="85301456"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="85301456"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 14:33:10 -0800
X-CSE-ConnectionGUID: s27szXoVRTOvbFG91O5/Vg==
X-CSE-MsgGUID: h7f2eTQnR8iDy+dM7Sn/3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="215775741"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Mar 2026 14:33:08 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vydjG-000000001R3-0tgp;
	Fri, 06 Mar 2026 22:33:06 +0000
Date: Sat, 07 Mar 2026 06:32:26 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fan_mark_userns 4/10] fs/erofs/ishare.c:109:13:
 error: too few arguments to function 'alloc_empty_backing_file'
Message-ID: <202603070617.E0ww1Kk0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/amir73il/linux fan_mark_userns
head:   4d7cad2f077449767de4cc8ab6d869f080a121a2
commit: b66d24d8d654b23fbadf70e520e34d945219e8e5 [4/10] backing_file: store user_path_file
config: nios2-randconfig-001-20260307 (https://download.01.org/0day-ci/archive/20260307/202603070617.E0ww1Kk0-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070617.E0ww1Kk0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070617.E0ww1Kk0-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/erofs/ishare.c: In function 'erofs_ishare_file_open':
>> fs/erofs/ishare.c:109:13: error: too few arguments to function 'alloc_empty_backing_file'
     109 |  realfile = alloc_empty_backing_file(O_RDONLY|O_NOATIME, current_cred());
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/erofs/ishare.c:10:
   fs/erofs/../internal.h:109:14: note: declared here
     109 | struct file *alloc_empty_backing_file(int flags, const struct cred *cred,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
>> fs/erofs/ishare.c:117:2: error: implicit declaration of function 'backing_file_set_user_path'; did you mean 'backing_file_open_user_path'? [-Werror=implicit-function-declaration]
     117 |  backing_file_set_user_path(realfile, &file->f_path);
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |  backing_file_open_user_path
   cc1: some warnings being treated as errors


vim +/alloc_empty_backing_file +109 fs/erofs/ishare.c

5ef3208e3be50a Hongzhen Luo 2026-01-23  101  
5ef3208e3be50a Hongzhen Luo 2026-01-23  102  static int erofs_ishare_file_open(struct inode *inode, struct file *file)
5ef3208e3be50a Hongzhen Luo 2026-01-23  103  {
5ef3208e3be50a Hongzhen Luo 2026-01-23  104  	struct inode *sharedinode = EROFS_I(inode)->sharedinode;
5ef3208e3be50a Hongzhen Luo 2026-01-23  105  	struct file *realfile;
5ef3208e3be50a Hongzhen Luo 2026-01-23  106  
5ef3208e3be50a Hongzhen Luo 2026-01-23  107  	if (file->f_flags & O_DIRECT)
5ef3208e3be50a Hongzhen Luo 2026-01-23  108  		return -EINVAL;
5ef3208e3be50a Hongzhen Luo 2026-01-23 @109  	realfile = alloc_empty_backing_file(O_RDONLY|O_NOATIME, current_cred());
5ef3208e3be50a Hongzhen Luo 2026-01-23  110  	if (IS_ERR(realfile))
5ef3208e3be50a Hongzhen Luo 2026-01-23  111  		return PTR_ERR(realfile);
5ef3208e3be50a Hongzhen Luo 2026-01-23  112  	ihold(sharedinode);
5ef3208e3be50a Hongzhen Luo 2026-01-23  113  	realfile->f_op = &erofs_file_fops;
5ef3208e3be50a Hongzhen Luo 2026-01-23  114  	realfile->f_inode = sharedinode;
5ef3208e3be50a Hongzhen Luo 2026-01-23  115  	realfile->f_mapping = sharedinode->i_mapping;
5ef3208e3be50a Hongzhen Luo 2026-01-23  116  	path_get(&file->f_path);
5ef3208e3be50a Hongzhen Luo 2026-01-23 @117  	backing_file_set_user_path(realfile, &file->f_path);
5ef3208e3be50a Hongzhen Luo 2026-01-23  118  
5ef3208e3be50a Hongzhen Luo 2026-01-23  119  	file_ra_state_init(&realfile->f_ra, file->f_mapping);
5ef3208e3be50a Hongzhen Luo 2026-01-23  120  	realfile->private_data = EROFS_I(inode);
5ef3208e3be50a Hongzhen Luo 2026-01-23  121  	file->private_data = realfile;
5ef3208e3be50a Hongzhen Luo 2026-01-23  122  	return 0;
5ef3208e3be50a Hongzhen Luo 2026-01-23  123  }
5ef3208e3be50a Hongzhen Luo 2026-01-23  124  

:::::: The code at line 109 was first introduced by commit
:::::: 5ef3208e3be50aa08b4e7a2832f34e16d42c08b3 erofs: introduce the page cache share feature

:::::: TO: Hongzhen Luo <hongzhen@linux.alibaba.com>
:::::: CC: Gao Xiang <hsiangkao@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
