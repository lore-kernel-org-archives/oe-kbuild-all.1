Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80C02EC8BE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Mar 2024 00:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711328385; cv=none; b=RIiw5x3gC5LVNaJY0seIHpgPMY80ZVBinnx/yx6EG2YtP4S8GDKkdSiEvn5HtGC1gjA2TA/63ZVS8JfW5FXrU7l832J7bRYS6WjEOOi6a0kgG3JYirg86w092G8ftAPWmTiO87E13xMaf9THuNUtRNk28wmPBf52wQGUFJApFjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711328385; c=relaxed/simple;
	bh=zzLlDlj7ZedSWq7pSafzZ17N66MQSymMlKOGTVGaKUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U7DYpHGaLjV1OOh6EMcQMXjH7NdqzRi5VCEFVv4NnUGXYBj2JN6V94lxMa0T4bb9NzCIPti7unkTxEFk1ydWkzX6ei0UD8mAoHuXVme+hzcbSJ+jzB5uvtZ3GJZWCYjalrgAEIEIdCxfYU2KngzxSShkx9SC6sjQ+oMKkJSA7+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P6oRrMaG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6oRrMaG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711328383; x=1742864383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zzLlDlj7ZedSWq7pSafzZ17N66MQSymMlKOGTVGaKUM=;
  b=P6oRrMaGC32Iv6sFwQdTy2BuvmSI3WHrVT4C3859IjSnMUTPyiYxlK+9
   jB6mh+tmMeqR6QtpKTSIIU7NSLWpascTscqhzalexe98K2mtXNHGoUDG7
   9Nlt6KjRxa32LlbKs01UwGgclBp3MjGJ98FvHwYrQInLwsFdvbsrxfz3x
   wzvKJ0MFxzV4XtgV3vmg1bMazKenJZQZspVsStMCzHXnOLhl8LhnOzrBo
   wDHM0+mKkLtn2YeObS+2p/S29NzUyQKpNIjmQAU/ZyHVw3fUW0SwieCnT
   S06TL6lbBM9gKK2HBV5hSD+HZTqTCAASg+/MzUY6aH+5yBbKGgXTdiO3G
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="9265806"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="9265806"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 17:59:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="15433323"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Mar 2024 17:59:40 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roYga-000M67-2U;
	Mon, 25 Mar 2024 00:59:36 +0000
Date: Mon, 25 Mar 2024 08:59:16 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>,
	Jan Kara <jack@suse.cz>,
	Gabriel Krisman Bertazi <krisman@collabora.com>
Subject: [cel:nfsd-5.15.y 1/391] include/linux/fsnotify.h:235:41: error:
 passing argument 4 of 'fsnotify_name' from incompatible pointer type
Message-ID: <202403250807.vqRS7yyj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-5.15.y
head:   00f016a743ef8a7ac9a13c48499a67614a0077ed
commit: af7130545d85312d5caf9c37e308db100ac172ac [1/391] fsnotify: pass data_type to fsnotify_name()
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240325/202403250807.vqRS7yyj-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240325/202403250807.vqRS7yyj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403250807.vqRS7yyj-lkp@intel.com/

Note: the cel/nfsd-5.15.y HEAD 00f016a743ef8a7ac9a13c48499a67614a0077ed builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:74:
   include/linux/fsnotify.h: In function 'fsnotify_delete':
>> include/linux/fsnotify.h:235:23: warning: passing argument 1 of 'fsnotify_name' makes integer from pointer without a cast [-Wint-conversion]
     235 |         fsnotify_name(dir, mask, inode, &dentry->d_name, 0);
         |                       ^~~
         |                       |
         |                       struct inode *
   include/linux/fsnotify.h:29:39: note: expected '__u32' {aka 'unsigned int'} but argument is of type 'struct inode *'
      29 | static inline int fsnotify_name(__u32 mask, const void *data, int data_type,
         |                                 ~~~~~~^~~~
>> include/linux/fsnotify.h:235:28: warning: passing argument 2 of 'fsnotify_name' makes pointer from integer without a cast [-Wint-conversion]
     235 |         fsnotify_name(dir, mask, inode, &dentry->d_name, 0);
         |                            ^~~~
         |                            |
         |                            __u32 {aka unsigned int}
   include/linux/fsnotify.h:29:57: note: expected 'const void *' but argument is of type '__u32' {aka 'unsigned int'}
      29 | static inline int fsnotify_name(__u32 mask, const void *data, int data_type,
         |                                             ~~~~~~~~~~~~^~~~
   include/linux/fsnotify.h:235:34: warning: passing argument 3 of 'fsnotify_name' makes integer from pointer without a cast [-Wint-conversion]
     235 |         fsnotify_name(dir, mask, inode, &dentry->d_name, 0);
         |                                  ^~~~~
         |                                  |
         |                                  struct inode *
   include/linux/fsnotify.h:29:67: note: expected 'int' but argument is of type 'struct inode *'
      29 | static inline int fsnotify_name(__u32 mask, const void *data, int data_type,
         |                                                               ~~~~^~~~~~~~~
>> include/linux/fsnotify.h:235:41: error: passing argument 4 of 'fsnotify_name' from incompatible pointer type [-Werror=incompatible-pointer-types]
     235 |         fsnotify_name(dir, mask, inode, &dentry->d_name, 0);
         |                                         ^~~~~~~~~~~~~~~
         |                                         |
         |                                         struct qstr *
   include/linux/fsnotify.h:30:47: note: expected 'struct inode *' but argument is of type 'struct qstr *'
      30 |                                 struct inode *dir, const struct qstr *name,
         |                                 ~~~~~~~~~~~~~~^~~
>> include/linux/fsnotify.h:235:9: error: too few arguments to function 'fsnotify_name'
     235 |         fsnotify_name(dir, mask, inode, &dentry->d_name, 0);
         |         ^~~~~~~~~~~~~
   include/linux/fsnotify.h:29:19: note: declared here
      29 | static inline int fsnotify_name(__u32 mask, const void *data, int data_type,
         |                   ^~~~~~~~~~~~~
   io_uring/io_uring.c: In function 'io_queue_async_work':
   io_uring/io_uring.c:1476:61: warning: parameter 'locked' set but not used [-Wunused-but-set-parameter]
    1476 | static void io_queue_async_work(struct io_kiocb *req, bool *locked)
         |                                                       ~~~~~~^~~~~~
   cc1: some warnings being treated as errors


vim +/fsnotify_name +235 include/linux/fsnotify.h

ece95912db94d9 Jan Kara       2008-02-06  218  
3d7b7272ce9deb Amir Goldstein 2022-01-20  219  /*
3d7b7272ce9deb Amir Goldstein 2022-01-20  220   * fsnotify_delete - @dentry was unlinked and unhashed
3d7b7272ce9deb Amir Goldstein 2022-01-20  221   *
3d7b7272ce9deb Amir Goldstein 2022-01-20  222   * Caller must make sure that dentry->d_name is stable.
3d7b7272ce9deb Amir Goldstein 2022-01-20  223   *
3d7b7272ce9deb Amir Goldstein 2022-01-20  224   * Note: unlike fsnotify_unlink(), we have to pass also the unlinked inode
3d7b7272ce9deb Amir Goldstein 2022-01-20  225   * as this may be called after d_delete() and old_dentry may be negative.
3d7b7272ce9deb Amir Goldstein 2022-01-20  226   */
3d7b7272ce9deb Amir Goldstein 2022-01-20  227  static inline void fsnotify_delete(struct inode *dir, struct inode *inode,
3d7b7272ce9deb Amir Goldstein 2022-01-20  228  				   struct dentry *dentry)
3d7b7272ce9deb Amir Goldstein 2022-01-20  229  {
3d7b7272ce9deb Amir Goldstein 2022-01-20  230  	__u32 mask = FS_DELETE;
3d7b7272ce9deb Amir Goldstein 2022-01-20  231  
3d7b7272ce9deb Amir Goldstein 2022-01-20  232  	if (S_ISDIR(inode->i_mode))
3d7b7272ce9deb Amir Goldstein 2022-01-20  233  		mask |= FS_ISDIR;
3d7b7272ce9deb Amir Goldstein 2022-01-20  234  
3d7b7272ce9deb Amir Goldstein 2022-01-20 @235  	fsnotify_name(dir, mask, inode, &dentry->d_name, 0);
3d7b7272ce9deb Amir Goldstein 2022-01-20  236  }
3d7b7272ce9deb Amir Goldstein 2022-01-20  237  

:::::: The code at line 235 was first introduced by commit
:::::: 3d7b7272ce9deb7157670f584274f37d8b12f81f fsnotify: invalidate dcache before IN_DELETE event

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
