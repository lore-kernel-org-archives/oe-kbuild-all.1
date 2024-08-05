Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF2C42A9F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Aug 2024 22:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722897370; cv=none; b=l7TgDWH4SWEow5jWKYjdg/wc8bFmikWpCZmDfdXGj8pBHWpiwalk6bXf/kEUV8Chho88jVWOPcaJIDuyiMyyz8ymfitrZneazgaOq/UKaY5+ZFOgZEdQORQIIck1WTCzFq1G254KwFXNZQRxXPW/frr6Wyvx7aS+13SjU010zhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722897370; c=relaxed/simple;
	bh=43dnGTGZZbSaUIOlkbCkc0UEocR+2izz7uEaWoKVN1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RRiB0qzd6OYbiu98WKbWBhjhKg7Gu9HL8Ox6uHKKxV+f/+MBDrt+bEQYVXzGv6v/l7m/8mdrvNDSEAjGSbhN5dLwOQO9QkGuScqQPC4VozvIAm/zjUw48Qsj4zhkNXIoyUxgTaFDhKZg0eTZVIgdRYKFVORxHlh8tvbZedX0roA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k2A8eUaI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2A8eUaI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722897368; x=1754433368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=43dnGTGZZbSaUIOlkbCkc0UEocR+2izz7uEaWoKVN1o=;
  b=k2A8eUaIvvX19HbvugRsCpkhmJGFMZ2qWNXfaE0eLlKvcVhg7WEwVfum
   CA4ekA2vou/gos3TNDrvjRv34Cnh0tHWUwbdeCyxhxF3zoqLPdw4QuIrv
   Vp8NT/FZb+9Q7mbPBvjrlPCDEP3u7UIqMzEFR0sGaob/dUK6R5hORe35r
   JhM5QaHqqRD6Kp+E9ROy7MynrtHfKwWrjCCWoJAv8EHtI5ilTZQKPQ66u
   +n4c1PfNDpUW7Rol2yn9JrwzmQYdeKNLoFd1lisG+LB/7v6k5DwA/v2PP
   ul0kFgtee0y47uCKeB94YaKFyZytb6m3iEi5l6Q0KI8AICKDvDdLHNc4l
   w==;
X-CSE-ConnectionGUID: afIrOch3TCq2qqubee84TQ==
X-CSE-MsgGUID: d3zWJ3aCQ0qVnzwpGtbXKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20467267"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="20467267"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 15:36:08 -0700
X-CSE-ConnectionGUID: LYibMPd/TeyF3mRywoumjw==
X-CSE-MsgGUID: e6LS9SqNRlGhqA1zmJLgLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="55990209"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 05 Aug 2024 15:36:07 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sb6JB-0003q0-0T;
	Mon, 05 Aug 2024 22:36:05 +0000
Date: Tue, 6 Aug 2024 06:35:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 28/30] fs/open.c:640:16: error: variable
 'delegated_inode' has initializer but incomplete type
Message-ID: <202408060621.1lh3pegF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   3ef3065a07c0fc797ef9b034216f09d8b324e0b1
commit: 7fe1a63b7276713f10c1d9d23aaa10c40869fbb5 [28/30] fs: add struct delegated_inode
config: m68k-m5407c3_defconfig (https://download.01.org/0day-ci/archive/20240806/202408060621.1lh3pegF-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408060621.1lh3pegF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408060621.1lh3pegF-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/open.c: In function 'chmod_common':
>> fs/open.c:640:16: error: variable 'delegated_inode' has initializer but incomplete type
     640 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
>> fs/open.c:640:32: error: storage size of 'delegated_inode' isn't known
     640 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/open.c:640:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/open.c: In function 'chown_common':
   fs/open.c:764:16: error: variable 'delegated_inode' has initializer but incomplete type
     764 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/open.c:764:32: error: storage size of 'delegated_inode' isn't known
     764 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/open.c:764:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
--
   fs/namei.c: In function 'open_last_lookups':
>> fs/namei.c:3613:16: error: variable 'delegated_inode' has initializer but incomplete type
    3613 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
>> fs/namei.c:3613:32: error: storage size of 'delegated_inode' isn't known
    3613 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:3613:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function 'do_mknodat':
   fs/namei.c:4155:16: error: variable 'delegated_inode' has initializer but incomplete type
    4155 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4155:32: error: storage size of 'delegated_inode' isn't known
    4155 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4155:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function 'do_mkdirat':
   fs/namei.c:4278:16: error: variable 'delegated_inode' has initializer but incomplete type
    4278 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4278:32: error: storage size of 'delegated_inode' isn't known
    4278 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4278:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function 'do_rmdir':
   fs/namei.c:4389:16: error: variable 'delegated_inode' has initializer but incomplete type
    4389 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4389:32: error: storage size of 'delegated_inode' isn't known
    4389 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4389:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function 'do_unlinkat':
   fs/namei.c:4538:16: error: variable 'delegated_inode' has initializer but incomplete type
    4538 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4538:32: error: storage size of 'delegated_inode' isn't known
    4538 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4538:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function 'do_linkat':
   fs/namei.c:4804:16: error: variable 'delegated_inode' has initializer but incomplete type
    4804 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4804:32: error: storage size of 'delegated_inode' isn't known
    4804 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4804:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function 'do_renameat2':
   fs/namei.c:5104:16: error: variable 'delegated_inode' has initializer but incomplete type
    5104 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:5104:32: error: storage size of 'delegated_inode' isn't known
    5104 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:5104:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
--
   fs/xattr.c: In function 'vfs_setxattr':
>> fs/xattr.c:308:16: error: variable 'delegated_inode' has initializer but incomplete type
     308 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
>> fs/xattr.c:308:32: error: storage size of 'delegated_inode' isn't known
     308 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/xattr.c:308:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/xattr.c: In function 'vfs_removexattr':
   fs/xattr.c:570:16: error: variable 'delegated_inode' has initializer but incomplete type
     570 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/xattr.c:570:32: error: storage size of 'delegated_inode' isn't known
     570 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/xattr.c:570:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
--
   fs/utimes.c: In function 'vfs_utimes':
>> fs/utimes.c:25:16: error: variable 'delegated_inode' has initializer but incomplete type
      25 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
>> fs/utimes.c:25:32: error: storage size of 'delegated_inode' isn't known
      25 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/utimes.c:25:32: warning: unused variable 'delegated_inode' [-Wunused-variable]


vim +/delegated_inode +640 fs/open.c

   636	
   637	int chmod_common(const struct path *path, umode_t mode)
   638	{
   639		struct inode *inode = path->dentry->d_inode;
 > 640		struct delegated_inode delegated_inode = { };
   641		struct iattr newattrs;
   642		int error;
   643	
   644		error = mnt_want_write(path->mnt);
   645		if (error)
   646			return error;
   647	retry_deleg:
   648		inode_lock(inode);
   649		error = security_path_chmod(path, mode);
   650		if (error)
   651			goto out_unlock;
   652		newattrs.ia_mode = (mode & S_IALLUGO) | (inode->i_mode & ~S_IALLUGO);
   653		newattrs.ia_valid = ATTR_MODE | ATTR_CTIME;
   654		error = notify_change(mnt_idmap(path->mnt), path->dentry,
   655				      &newattrs, &delegated_inode);
   656	out_unlock:
   657		inode_unlock(inode);
   658		if (delegated_inode.di_inode) {
   659			error = break_deleg_wait(&delegated_inode);
   660			if (!error)
   661				goto retry_deleg;
   662		}
   663		mnt_drop_write(path->mnt);
   664		return error;
   665	}
   666	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
