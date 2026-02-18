Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB132FE577
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 12:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771416294; cv=none; b=AR7KXpNzIhT68bTeHM3+2YuvD3fxwzCeGZNtfXDzoA1NUrLst83w6Aui3C6BYEZ4vtEa0xLQ13mrmTUv1qrS3UtCH7nEXf9tMFcMGMByrS0L+ZbnT4Gub5bhcj1szEOPAJeDL3DHwCyGWpCD43aPLgYaJYtOCdQuFzkPNZOaFpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771416294; c=relaxed/simple;
	bh=ddMC6eL/U7ma5ALwwnKywakcYVVcmVstJFTcs19mNwM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=STf3AfdKsBWIlskGKH8iaT4lFuWn0DuzW/UGLyy3A1jTSp2FKeRshJLuRIZDYVd2AK9W6yZ1103cIcfH4bc3J+4Monhxuq/A1o7bQBIi2TdbCkwbDVk+GmT4snSaCht/7/WzOa3yt8No47Enwx+o8bmWNmwnAbclPX+ePeWACzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kWiXti79; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kWiXti79"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771416292; x=1802952292;
  h=date:from:to:cc:subject:message-id;
  bh=ddMC6eL/U7ma5ALwwnKywakcYVVcmVstJFTcs19mNwM=;
  b=kWiXti79RKZ/eR7Uvh6wWAv0oqi3PZxq0OemX70E32FnHTspsowxWJ8U
   4VCkkNUAochxbe/5XUFfX+fBWLmB3NXn+g5sZIBpmsWLsmYKjAL0tNNH8
   RHvdFh7BwhZ9gPCm5/5inJeSN/5d71+6P1A5JhFdDBj9yj/4zMurtsFPW
   nI/0SyIdWQPQ7C0j6Y/ei7X/aP1+yTvqmpWjuHrGYqA5QtU1t6BUAvrH4
   qzEFeV473vPuUMKsikGAFWkM+zbM7BHtSX1MwBOR32znbFEtnP5ZOgv5N
   /M5miuqijwbFT1SoeJac8I3V+depTumyAovVh6hE/sWUJstF9c617CbSv
   A==;
X-CSE-ConnectionGUID: MfKGo3eJQtO+qiKytGcxeA==
X-CSE-MsgGUID: VUF5SXiHQeyYjSDYlsxz5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="71690122"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="71690122"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 04:04:51 -0800
X-CSE-ConnectionGUID: yLn/u7D7SKyn6KPXgWOQpA==
X-CSE-MsgGUID: yRAUoEEbRh2KcweO+Ugu1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="218026246"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Feb 2026 04:04:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsgIR-000000012Js-2wvb;
	Wed, 18 Feb 2026 12:04:47 +0000
Date: Wed, 18 Feb 2026 20:04:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:container 6/18] fs/namespace.c:5976:13:
 warning: unused variable 'ret'
Message-ID: <202602181945.XRY4L8Ld-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git container
head:   322545d60dd20abbe7456256165d81cd33aa1689
commit: cdad5d3d4674f6c790848cb76868c93e198950ae [6/18] fork: Handle copy_process() and do_exit()
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260218/202602181945.XRY4L8Ld-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602181945.XRY4L8Ld-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602181945.XRY4L8Ld-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/namespace.c: In function 'init_mount_tree':
>> fs/namespace.c:5976:13: warning: unused variable 'ret' [-Wunused-variable]
    5976 |         int ret;
         |             ^~~


vim +/ret +5976 fs/namespace.c

  5970	
  5971	static void __init init_mount_tree(void)
  5972	{
  5973		struct vfsmount *mnt;
  5974		struct mount *m;
  5975		struct path root;
> 5976		int ret;
  5977	
  5978		mnt = vfs_kern_mount(&rootfs_fs_type, 0, "rootfs", initramfs_options);
  5979		if (IS_ERR(mnt))
  5980			panic("Can't create rootfs");
  5981	
  5982		m = real_mount(mnt);
  5983		init_mnt_ns.root = m;
  5984		init_mnt_ns.nr_mounts = 1;
  5985		mnt_add_to_ns(&init_mnt_ns, m);
  5986		init_task.nsproxy->mnt_ns = &init_mnt_ns;
  5987		get_mnt_ns(&init_mnt_ns);
  5988	
  5989		root.mnt = mnt;
  5990		root.dentry = mnt->mnt_root;
  5991	
  5992		set_fs_pwd(current->fs, &root);
  5993		set_fs_root(current->fs, &root);
  5994	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
