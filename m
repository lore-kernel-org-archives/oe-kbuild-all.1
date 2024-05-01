Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18D6168B0A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 May 2024 23:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714605993; cv=none; b=cTrQZdY685uOXXDTMLaQTchmmyOhzfWqcuPxt7I7KmjGDeqnPH5agwxoePkXjgYQsfrg83zl15lv+s8f29wLDEGBW5zkQL459lss5oA1OxmWzP40OYvrqfHRg8pdIr6HxCgJCZldP1QVTBrC6dBvobMpGboIb6IoaaCsPnddjYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714605993; c=relaxed/simple;
	bh=sceQlYFsx+WvlDt0NjvEmMRy8j8F2Hp8psXrv2XrTAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nXUcfvGxMwbQVljVjaf8rMR3vxaE7ntpf6fKbLyBQaSpOvj7RlX6s8u8E+Uggb7dgO8S8qpNfdq0860XLx1fVYDN9eXJtRK8B5AGkDoQ5pWSTnB4lTcpjrVdwyBQtzaTrFA0Xm346yg97tytq0LCQt1ZCpvReaaOGHyEvaWnx4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kHKrE5QI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHKrE5QI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714605991; x=1746141991;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sceQlYFsx+WvlDt0NjvEmMRy8j8F2Hp8psXrv2XrTAQ=;
  b=kHKrE5QI123slMg2Y+taSqH4ZlEUzaAwo9o4sVPycQB5aIjxUm66DLGB
   T8wqbIhfDct+Qsy3ani2EtljDb7JAGzjYUMMdbhaJKZon9tfYLYEWDxa4
   mSnTbJ7pbDGYKcNsiumozoIF9CEZx4M1wZaxTLqW34NEoAA2DJmJhn5at
   JPMyZkoBQt/udi9h+yUSIXYSJUqsEGX0DSYbayiFuUM4lK4bCe/pyGq7l
   NVsitWxd5LLzpaV1+HcaHjO/zTjt0vnPKCYZsGMab2YCmChH3I8xeHeni
   DA8ocZ6tSDJbGMX7pwhenMn4wLLWAhJCng741traoU0BuVGOvKC6W1JfF
   Q==;
X-CSE-ConnectionGUID: 4HCEYNocSeq3gF3LVBcYCw==
X-CSE-MsgGUID: fFe5NS/nQIePBHBDPM2gpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10526566"
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; 
   d="scan'208";a="10526566"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 16:26:31 -0700
X-CSE-ConnectionGUID: u0y5Kia4Sxm/7429L3cHyQ==
X-CSE-MsgGUID: Suly2fkXTo+hTV5X2MqmAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; 
   d="scan'208";a="31553671"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 May 2024 16:26:30 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2JLH-000A9E-11;
	Wed, 01 May 2024 23:26:27 +0000
Date: Thu, 2 May 2024 07:26:18 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:vfs.xattr 5/5] fs/xattr.c:838:25: warning:
 'lookup_flags' is used uninitialized
Message-ID: <202405020724.WgxZDhkB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.xattr
head:   0703b9aad555387113b9112cdc84469d12fda266
commit: 0703b9aad555387113b9112cdc84469d12fda266 [5/5] xattr: handle AT_EMPTY_PATH correctly
config: arm64-randconfig-001-20240502 (https://download.01.org/0day-ci/archive/20240502/202405020724.WgxZDhkB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240502/202405020724.WgxZDhkB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405020724.WgxZDhkB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function 'do_getxattrat',
       inlined from '__do_sys_getxattr' at fs/xattr.c:878:9,
       inlined from '__se_sys_getxattr' at fs/xattr.c:875:1,
       inlined from '__arm64_sys_getxattr' at fs/xattr.c:875:1:
>> fs/xattr.c:838:25: warning: 'lookup_flags' is used uninitialized [-Wuninitialized]
     838 |                 error = user_path_at(dfd, pathname, lookup_flags, &path);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xattr.c: In function '__arm64_sys_getxattr':
   fs/xattr.c:822:13: note: 'lookup_flags' was declared here
     822 |         int lookup_flags;
         |             ^~~~~~~~~~~~
   In function 'do_getxattrat',
       inlined from '__do_sys_lgetxattr' at fs/xattr.c:884:9,
       inlined from '__se_sys_lgetxattr' at fs/xattr.c:881:1,
       inlined from '__arm64_sys_lgetxattr' at fs/xattr.c:881:1:
>> fs/xattr.c:838:25: warning: 'lookup_flags' is used uninitialized [-Wuninitialized]
     838 |                 error = user_path_at(dfd, pathname, lookup_flags, &path);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xattr.c: In function '__arm64_sys_lgetxattr':
   fs/xattr.c:822:13: note: 'lookup_flags' was declared here
     822 |         int lookup_flags;
         |             ^~~~~~~~~~~~
   In function 'do_listxattrat',
       inlined from '__do_sys_listxattr' at fs/xattr.c:977:9,
       inlined from '__se_sys_listxattr' at fs/xattr.c:974:1,
       inlined from '__arm64_sys_listxattr' at fs/xattr.c:974:1:
   fs/xattr.c:955:25: warning: 'lookup_flags' is used uninitialized [-Wuninitialized]
     955 |                 error = user_path_at(dfd, pathname, lookup_flags, &path);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xattr.c: In function '__arm64_sys_listxattr':
   fs/xattr.c:939:13: note: 'lookup_flags' was declared here
     939 |         int lookup_flags;
         |             ^~~~~~~~~~~~
   In function 'do_listxattrat',
       inlined from '__do_sys_llistxattr' at fs/xattr.c:983:9,
       inlined from '__se_sys_llistxattr' at fs/xattr.c:980:1,
       inlined from '__arm64_sys_llistxattr' at fs/xattr.c:980:1:
   fs/xattr.c:955:25: warning: 'lookup_flags' is used uninitialized [-Wuninitialized]
     955 |                 error = user_path_at(dfd, pathname, lookup_flags, &path);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xattr.c: In function '__arm64_sys_llistxattr':
   fs/xattr.c:939:13: note: 'lookup_flags' was declared here
     939 |         int lookup_flags;
         |             ^~~~~~~~~~~~


vim +/lookup_flags +838 fs/xattr.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  815  
71491cbe0205be Christian Göttsche 2024-04-26  816  static ssize_t do_getxattrat(int dfd, const char __user *pathname, unsigned int at_flags,
8cc431165d8fbd Eric Biggers       2014-10-12  817  			     const char __user *name, void __user *value,
71491cbe0205be Christian Göttsche 2024-04-26  818  			     size_t size)
^1da177e4c3f41 Linus Torvalds     2005-04-16  819  {
2d8f30380ab8c7 Al Viro            2008-07-22  820  	struct path path;
0703b9aad55538 Christian Brauner  2024-04-30  821  	ssize_t error = 0;
71491cbe0205be Christian Göttsche 2024-04-26  822  	int lookup_flags;
71491cbe0205be Christian Göttsche 2024-04-26  823  
71491cbe0205be Christian Göttsche 2024-04-26  824  	if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) != 0)
71491cbe0205be Christian Göttsche 2024-04-26  825  		return -EINVAL;
71491cbe0205be Christian Göttsche 2024-04-26  826  
0703b9aad55538 Christian Brauner  2024-04-30  827  	if (at_flags & AT_EMPTY_PATH && vfs_empty_path(dfd, pathname)) {
0703b9aad55538 Christian Brauner  2024-04-30  828  		CLASS(fd, f)(dfd);
0703b9aad55538 Christian Brauner  2024-04-30  829  
0703b9aad55538 Christian Brauner  2024-04-30  830  		if (!f.file)
0703b9aad55538 Christian Brauner  2024-04-30  831  			return -EBADF;
0703b9aad55538 Christian Brauner  2024-04-30  832  
0703b9aad55538 Christian Brauner  2024-04-30  833  		path = f.file->f_path;
0703b9aad55538 Christian Brauner  2024-04-30  834  		audit_file(f.file);
0703b9aad55538 Christian Brauner  2024-04-30  835  		path_get(&path);
0703b9aad55538 Christian Brauner  2024-04-30  836  	} else {
60e66b48ca2081 Jeff Layton        2012-12-11  837  retry:
71491cbe0205be Christian Göttsche 2024-04-26 @838  		error = user_path_at(dfd, pathname, lookup_flags, &path);
^1da177e4c3f41 Linus Torvalds     2005-04-16  839  		if (error)
^1da177e4c3f41 Linus Torvalds     2005-04-16  840  			return error;
0703b9aad55538 Christian Brauner  2024-04-30  841  	}
5a6f52d20ce3cd Christian Brauner  2022-10-28  842  	error = getxattr(mnt_idmap(path.mnt), path.dentry, name, value, size);
2d8f30380ab8c7 Al Viro            2008-07-22  843  	path_put(&path);
60e66b48ca2081 Jeff Layton        2012-12-11  844  	if (retry_estale(error, lookup_flags)) {
60e66b48ca2081 Jeff Layton        2012-12-11  845  		lookup_flags |= LOOKUP_REVAL;
60e66b48ca2081 Jeff Layton        2012-12-11  846  		goto retry;
60e66b48ca2081 Jeff Layton        2012-12-11  847  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  848  	return error;
^1da177e4c3f41 Linus Torvalds     2005-04-16  849  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  850  
71491cbe0205be Christian Göttsche 2024-04-26  851  SYSCALL_DEFINE6(getxattrat, int, dfd, const char __user *, pathname, unsigned int, at_flags,
71491cbe0205be Christian Göttsche 2024-04-26  852  		const char __user *, name, struct xattr_args __user *, uargs, size_t, usize)
71491cbe0205be Christian Göttsche 2024-04-26  853  {
71491cbe0205be Christian Göttsche 2024-04-26  854  	struct xattr_args args = {};
71491cbe0205be Christian Göttsche 2024-04-26  855  	int error;
71491cbe0205be Christian Göttsche 2024-04-26  856  
71491cbe0205be Christian Göttsche 2024-04-26  857  	BUILD_BUG_ON(sizeof(struct xattr_args) < XATTR_ARGS_SIZE_VER0);
71491cbe0205be Christian Göttsche 2024-04-26  858  	BUILD_BUG_ON(sizeof(struct xattr_args) != XATTR_ARGS_SIZE_LATEST);
71491cbe0205be Christian Göttsche 2024-04-26  859  
71491cbe0205be Christian Göttsche 2024-04-26  860  	if (unlikely(usize < XATTR_ARGS_SIZE_VER0))
71491cbe0205be Christian Göttsche 2024-04-26  861  		return -EINVAL;
71491cbe0205be Christian Göttsche 2024-04-26  862  	if (usize > PAGE_SIZE)
71491cbe0205be Christian Göttsche 2024-04-26  863  		return -E2BIG;
71491cbe0205be Christian Göttsche 2024-04-26  864  
71491cbe0205be Christian Göttsche 2024-04-26  865  	error = copy_struct_from_user(&args, sizeof(args), uargs, usize);
71491cbe0205be Christian Göttsche 2024-04-26  866  	if (error)
71491cbe0205be Christian Göttsche 2024-04-26  867  		return error;
71491cbe0205be Christian Göttsche 2024-04-26  868  
71491cbe0205be Christian Göttsche 2024-04-26  869  	if (args.flags != 0)
71491cbe0205be Christian Göttsche 2024-04-26  870  		return -EINVAL;
71491cbe0205be Christian Göttsche 2024-04-26  871  
71491cbe0205be Christian Göttsche 2024-04-26  872  	return do_getxattrat(dfd, pathname, at_flags, name, (void __user *)args.value, args.size);
71491cbe0205be Christian Göttsche 2024-04-26  873  }
71491cbe0205be Christian Göttsche 2024-04-26  874  
8cc431165d8fbd Eric Biggers       2014-10-12  875  SYSCALL_DEFINE4(getxattr, const char __user *, pathname,
64fd1de3d82165 Heiko Carstens     2009-01-14  876  		const char __user *, name, void __user *, value, size_t, size)
^1da177e4c3f41 Linus Torvalds     2005-04-16  877  {
71491cbe0205be Christian Göttsche 2024-04-26 @878  	return do_getxattrat(AT_FDCWD, pathname, 0, name, value, size);
3a3e159dbfe405 Jeff Layton        2012-12-11  879  }
8cc431165d8fbd Eric Biggers       2014-10-12  880  

:::::: The code at line 838 was first introduced by commit
:::::: 71491cbe0205be53be1a044594698eb21c1c15f4 fs/xattr: add *at family syscalls

:::::: TO: Christian Göttsche <cgzones@googlemail.com>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
