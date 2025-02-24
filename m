Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F9924C692
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 10:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740392272; cv=none; b=YkVmEjQjBRpTjMdLGg11oINuvOuE/6k8kRILZJHZKZvIolTc6umpCQjxqPLA1iKxLUXvCmjCIXPk9sK2fC4VNt0B7QZzKnZuu9fu61W0WSgxLN/mtmlFN7zrPme9G7Azw9fUGk6/fRH6MJSF53sU4v4XF9s52wcvMBeKh6QuJkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740392272; c=relaxed/simple;
	bh=2YXnct9il1GxwAzPhKWISo1kOXBcDcuEt5tGSPrLd1E=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZuTQ2nyh4u0aaJu+9q7B0zV3/43bfLeuBdy1k0lu4fmZDCjHS3BirmINfXYlIaDNzVqjhuFgcLbe1Mp0/MzZqKUutCpZGlOa5MNXXz4CapnmolweMXR/rd73Bf3vOX8hrHsj2dDI8omGtXZ7KCxNG7kXc934PjLvw1OGhP8CeGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I+bGXaIn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I+bGXaIn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740392271; x=1771928271;
  h=date:from:cc:subject:message-id:mime-version;
  bh=2YXnct9il1GxwAzPhKWISo1kOXBcDcuEt5tGSPrLd1E=;
  b=I+bGXaInwKays6p5vUS+neHLWThlhf1eY5m//mQkyEkftsm0lxHi/ZG1
   jT1gFibucOb0e1qs9hm69Na1AEQjvSwvMizPHM63h7Eup8nwb3MTZW5tF
   BtNpdHlQcbm52EkfNw3wojHB+YNbKWyR8HM7Ysk/2u34Dmm8/RnxZGPl8
   03iuc3w6E5LIIILbbgrCBTdBZ7lOklt9Ng43TN7eUDw8Ypwx/S+0eutL6
   7he0M8I0QPhLCH3lgdmCa1o1l4sBGJV5EevEVRBxI9TulGf7cYdTB9IjK
   tSJjyWAwou/FJ2wl2dVWi7gpJhqUellp6RvFtZmrN9Epk3YVCnpHrq003
   Q==;
X-CSE-ConnectionGUID: btD2oZl1QGKi5XSmir6nuQ==
X-CSE-MsgGUID: 6jLjRwTYSVynNMuFwHExHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="41402911"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="41402911"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 02:17:51 -0800
X-CSE-ConnectionGUID: quX4rXyZT/uuvMVkCqzQLg==
X-CSE-MsgGUID: 3/HT1fi+Qc+sy+jcCkNjVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120142922"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 24 Feb 2025 02:17:50 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmVX1-0008Ah-2k
	for oe-kbuild-all@lists.linux.dev;
	Mon, 24 Feb 2025 10:17:47 +0000
Date: Mon, 24 Feb 2025 18:17:05 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/69 1/1] fs/f2fs/sysfs.c:282:37: warning:
 'f2fs_seq_segment_bits_fops' defined but not used
Message-ID: <202502241808.glXCpKAN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chao,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/69
head:   f36ea6678b4077d9bbb4644e73977fb91d187ab7
commit: 8ceffcb29e61ba882a011b1e4d73ca03691fdc2e [1/1] f2fs: move sysfs code from super.c to fs/f2fs/sysfs.c
config: s390-randconfig-001-20250224 (https://download.01.org/0day-ci/archive/20250224/202502241808.glXCpKAN-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250224/202502241808.glXCpKAN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502241808.glXCpKAN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/sysfs.c:282:37: warning: 'f2fs_seq_segment_bits_fops' defined but not used [-Wunused-const-variable=]
    static const struct file_operations f2fs_seq_##_name##_fops = {  \
                                        ^
   fs/f2fs/sysfs.c:290:1: note: in expansion of macro 'F2FS_PROC_FILE_DEF'
    F2FS_PROC_FILE_DEF(segment_bits);
    ^~~~~~~~~~~~~~~~~~
>> fs/f2fs/sysfs.c:282:37: warning: 'f2fs_seq_segment_info_fops' defined but not used [-Wunused-const-variable=]
    static const struct file_operations f2fs_seq_##_name##_fops = {  \
                                        ^
   fs/f2fs/sysfs.c:289:1: note: in expansion of macro 'F2FS_PROC_FILE_DEF'
    F2FS_PROC_FILE_DEF(segment_info);
    ^~~~~~~~~~~~~~~~~~


vim +/f2fs_seq_segment_bits_fops +282 fs/f2fs/sysfs.c

   275	
   276	#define F2FS_PROC_FILE_DEF(_name)					\
   277	static int _name##_open_fs(struct inode *inode, struct file *file)	\
   278	{									\
   279		return single_open(file, _name##_seq_show, PDE_DATA(inode));	\
   280	}									\
   281										\
 > 282	static const struct file_operations f2fs_seq_##_name##_fops = {		\
   283		.open = _name##_open_fs,					\
   284		.read = seq_read,						\
   285		.llseek = seq_lseek,						\
   286		.release = single_release,					\
   287	};
   288	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
