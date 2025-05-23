Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576542DCC12
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 02:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747966725; cv=none; b=WwZSpmjDEknJbwxidayeMrvOddMPZbuOp5B0gsbLJ/XvXtscX55+QdVP1s+uAMk/Ih2bEOad8zk5QVOuyEzAVo3Ix3WbbXGJryrLdapRbGZ2gUDhfY6ycSYwasMThj4Q4i/I/GadFbu78CRi5sBekfWZOv2p4hQWjqPik0PeUPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747966725; c=relaxed/simple;
	bh=kKYBJunTVZMSvf1Zeb9sFiD5kmNuDWkXUDgmTD2uTeo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CN9w46luHbUtJlRAOoNLBYptV3ISst7JOtVEqy6T/YJDo+QPnCH3y89JvR9Vz+lEPF6tfFkguPFHEdpxC4WbapJ++GsymojSMYffeANOxmciRFclmmvbpM7J5UpgOYSXHkpgcBztYR3WsuEyIVnhcOUEvoO4rAGRrcS6o+v3EHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=grB5iEgG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="grB5iEgG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747966723; x=1779502723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kKYBJunTVZMSvf1Zeb9sFiD5kmNuDWkXUDgmTD2uTeo=;
  b=grB5iEgG7yD7yFoVFgLrHhCcPGOWigF/E8zXe/8p4MnDfE+r1q369WnW
   mUzujAznMjEvW5nUJZVk6muG349pZWK7QrCNJJoWC8/we164B0hVoCq1u
   58NBlzkE7xRQ9Fx7Y1Lbd/WYOeUdIgcmj85NcHraWUDkHgPdr8yw/QBk+
   /Vz1C8tmr4yiKc8UaWXc101f0/mcOWZ8swD+AM1LpRgn2pKlWqR/ydZ21
   J/FSQzJy1n7x41mn2+FGLkZaUgUcrYNECu6dOxU++5LrhQeyjOGX4kex9
   igEa03l+dkVhKEv1I/1yKRcwHO2Z0piaSZYrHjteJcv/I6snUZKtOEb8y
   g==;
X-CSE-ConnectionGUID: Cs2YTYQjT+GQYfIwIyCoAQ==
X-CSE-MsgGUID: zhmV2uvqQqCdC6tNI7BF9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49720049"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="49720049"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 19:18:43 -0700
X-CSE-ConnectionGUID: of2eMtbGT3KGH/hdf7RsAg==
X-CSE-MsgGUID: MhF9hf8UQvGiCRFuYIOl9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="145730077"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 May 2025 19:15:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIHwr-000Prs-16;
	Fri, 23 May 2025 02:15:49 +0000
Date: Fri, 23 May 2025 10:15:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap 36/43] fs/fuse/file_iomap.c:392:16: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202505231022.xMLlkPSu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap
head:   5b397601da90a62bdc9e22c480dee2381a16ec90
commit: 62a8ddd6c0a5180a7eb697ab35f39959470da65f [36/43] fuse: add a notification to add new iomap devices
config: riscv-randconfig-r111-20250523 (https://download.01.org/0day-ci/archive/20250523/202505231022.xMLlkPSu-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250523/202505231022.xMLlkPSu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505231022.xMLlkPSu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/fuse/file_iomap.c:392:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __user *__p @@     got unsigned int [usertype] *const map_dev @@
   fs/fuse/file_iomap.c:392:16: sparse:     expected void [noderef] __user *__p
   fs/fuse/file_iomap.c:392:16: sparse:     got unsigned int [usertype] *const map_dev

vim +392 fs/fuse/file_iomap.c

   365	
   366	int fuse_iomap_add_device(struct fuse_conn *fc,
   367				  const struct fuse_iomap_add_device_out *outarg)
   368	{
   369		struct file *file;
   370		int ret;
   371	
   372		if (!fc->iomap)
   373			return -EINVAL;
   374	
   375		if (outarg->reserved)
   376			return -EINVAL;
   377	
   378		CLASS(fd, somefd)(outarg->fd);
   379		if (fd_empty(somefd))
   380			return -EBADF;
   381		file = fd_file(somefd);
   382	
   383		if (!S_ISBLK(file_inode(file)->i_mode))
   384			return -ENODEV;
   385	
   386		down_read(&fc->killsb);
   387		ret = __fuse_iomap_add_device(fc, file);
   388		up_read(&fc->killsb);
   389		if (ret < 0)
   390			return ret;
   391	
 > 392		return put_user(ret, outarg->map_dev);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
