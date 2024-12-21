Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E9A2E40E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 05:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734757320; cv=none; b=qSlP+xPN7vKQbXdAKQ6L9ZcQsLr4PEVrxNeJgI+Fy4xGb7Uqo0HT08mP14TaXldaJ0qOaMzfFcBX6r2bDgwuYwuzQxar3ohuqwr+RZnU43ryb02336XU7VzAuNJPb7X5Gv8sUqApH9eX/x1aEYk8wmZDhh2YQuSGhy2u8QtIJiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734757320; c=relaxed/simple;
	bh=IyvQj0rMjVBcfmvT6sFZp8xmqSyb7Sg9Y5qRkpgxDow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZWEJfZCTcM6nH6ziBPLUcGxxZxLJ13LlYvPF6WE0FXfCrPHBa9fMqJ4WAgaa7XvldybGFL/2fMcebK4rEqS0BG2KkXD+AD5ivLTIiOG5KnJ3kSIs7EHH1hBSr9d26nU8vunRoFLhozvxjoNkHHcl55NZHu3ZF0slFT8WICPTwIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nEfqpoy4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nEfqpoy4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734757317; x=1766293317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IyvQj0rMjVBcfmvT6sFZp8xmqSyb7Sg9Y5qRkpgxDow=;
  b=nEfqpoy43jmcEasYQx8PQG0d1g2xvVWpaUMhrEVLp6YeUuH5sqHEoMM4
   +/PLEWAgjx0wuy5U/ne/NUaW2d7W5Eq0OX49uf/mNISUvLqftUrN4Svsb
   dHgDbr0tjIJ4irrfDzO+KPDNYNnorJFNxCLTaZMc+I0CHZce/WcRB65/r
   1oRwXsYPeTT1ACVDO1wSZnpPRcoYJtY8iAfR8LE3a3Cr1GehhTGnCpQWe
   oqbHvDbUl1IfQzKwPk5jj/JG8LPt1vrt6o8p8b2nuqH8P3VXXPJbyhSMU
   vSj5KbQa/sSoPu5KvZaMQ1xdF5Dt587u2odAh5qT0UpUya0+iwY0rT3EM
   Q==;
X-CSE-ConnectionGUID: qqUSocSORDy9mLluRKJEQQ==
X-CSE-MsgGUID: csBeAcDmSDqQuQXfUaNxtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="39087359"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="39087359"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 21:01:55 -0800
X-CSE-ConnectionGUID: oBZMWswzTfSOphJz6AJVaA==
X-CSE-MsgGUID: rpEQxMX2QjOkX3hMa9WBAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="98907632"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Dec 2024 21:01:54 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOrce-0001w3-0R;
	Sat, 21 Dec 2024 05:01:52 +0000
Date: Sat, 21 Dec 2024 13:01:25 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:uaccess-hardening-2 6/7] fs/readdir.c:81:9: error:
 implicit declaration of function 'unsafe_copy_to_user'; did you mean
 'kmsan_copy_to_user'?
Message-ID: <202412211228.8GnR4PWz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git uaccess-hardening-2
head:   3bdf7366340d6baa8c06d0f8f0093868c0c675d2
commit: 43815105e17e4070555526222913036e603b7a7c [6/7] x86/uaccess: Speed up unsafe_copy_to_user()
config: i386-buildonly-randconfig-002-20241221 (https://download.01.org/0day-ci/archive/20241221/202412211228.8GnR4PWz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412211228.8GnR4PWz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412211228.8GnR4PWz-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/readdir.c: In function 'fillonedir':
>> fs/readdir.c:81:9: error: implicit declaration of function 'unsafe_copy_to_user'; did you mean 'kmsan_copy_to_user'? [-Werror=implicit-function-declaration]
      81 |         unsafe_copy_to_user(dst, src, len, label);              \
         |         ^~~~~~~~~~~~~~~~~~~
   fs/readdir.c:208:9: note: in expansion of macro 'unsafe_copy_dirent_name'
     208 |         unsafe_copy_dirent_name(dirent->d_name, name, namlen, efault_end);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
>> fs/readdir.c:208:63: error: 'efault_end' undeclared (first use in this function)
     208 |         unsafe_copy_dirent_name(dirent->d_name, name, namlen, efault_end);
         |                                                               ^~~~~~~~~~
   fs/readdir.c:81:44: note: in definition of macro 'unsafe_copy_dirent_name'
      81 |         unsafe_copy_to_user(dst, src, len, label);              \
         |                                            ^~~~~
   fs/readdir.c:208:63: note: each undeclared identifier is reported only once for each function it appears in
     208 |         unsafe_copy_dirent_name(dirent->d_name, name, namlen, efault_end);
         |                                                               ^~~~~~~~~~
   fs/readdir.c:81:44: note: in definition of macro 'unsafe_copy_dirent_name'
      81 |         unsafe_copy_to_user(dst, src, len, label);              \
         |                                            ^~~~~
   fs/readdir.c: In function 'filldir':
   fs/readdir.c:294:63: error: 'efault_end' undeclared (first use in this function)
     294 |         unsafe_copy_dirent_name(dirent->d_name, name, namlen, efault_end);
         |                                                               ^~~~~~~~~~
   fs/readdir.c:81:44: note: in definition of macro 'unsafe_copy_dirent_name'
      81 |         unsafe_copy_to_user(dst, src, len, label);              \
         |                                            ^~~~~
   fs/readdir.c: In function 'filldir64':
   fs/readdir.c:374:63: error: 'efault_end' undeclared (first use in this function)
     374 |         unsafe_copy_dirent_name(dirent->d_name, name, namlen, efault_end);
         |                                                               ^~~~~~~~~~
   fs/readdir.c:81:44: note: in definition of macro 'unsafe_copy_dirent_name'
      81 |         unsafe_copy_to_user(dst, src, len, label);              \
         |                                            ^~~~~
   cc1: some warnings being treated as errors
--
   net/core/scm.c: In function 'put_cmsg':
>> net/core/scm.c:258:17: error: implicit declaration of function 'unsafe_copy_to_user'; did you mean 'kmsan_copy_to_user'? [-Werror=implicit-function-declaration]
     258 |                 unsafe_copy_to_user(CMSG_USER_DATA(cm), data,
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 kmsan_copy_to_user
>> net/core/scm.c:259:58: error: 'efault_end' undeclared (first use in this function)
     259 |                                     cmlen - sizeof(*cm), efault_end);
         |                                                          ^~~~~~~~~~
   net/core/scm.c:259:58: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +81 fs/readdir.c

3e327154967078 Linus Torvalds      2023-08-05   71  
9f79b78ef74436 Linus Torvalds      2016-05-21   72  /*
992f03ff8661bb Thorsten Blum       2024-06-02   73   * Note the "unsafe_put_user()" semantics: we goto a
9f79b78ef74436 Linus Torvalds      2016-05-21   74   * label for errors.
9f79b78ef74436 Linus Torvalds      2016-05-21   75   */
9f79b78ef74436 Linus Torvalds      2016-05-21   76  #define unsafe_copy_dirent_name(_dst, _src, _len, label) do {	\
9f79b78ef74436 Linus Torvalds      2016-05-21   77  	char __user *dst = (_dst);				\
9f79b78ef74436 Linus Torvalds      2016-05-21   78  	const char *src = (_src);				\
9f79b78ef74436 Linus Torvalds      2016-05-21   79  	size_t len = (_len);					\
c512c69187197f Linus Torvalds      2019-10-07   80  	unsafe_put_user(0, dst+len, label);			\
c512c69187197f Linus Torvalds      2019-10-07  @81  	unsafe_copy_to_user(dst, src, len, label);		\
9f79b78ef74436 Linus Torvalds      2016-05-21   82  } while (0)
9f79b78ef74436 Linus Torvalds      2016-05-21   83  
9f79b78ef74436 Linus Torvalds      2016-05-21   84  
5c0ba4e0762e6d Al Viro             2013-05-15   85  int iterate_dir(struct file *file, struct dir_context *ctx)
^1da177e4c3f41 Linus Torvalds      2005-04-16   86  {
496ad9aa8ef448 Al Viro             2013-01-23   87  	struct inode *inode = file_inode(file);
^1da177e4c3f41 Linus Torvalds      2005-04-16   88  	int res = -ENOTDIR;
3e327154967078 Linus Torvalds      2023-08-05   89  
3e327154967078 Linus Torvalds      2023-08-05   90  	if (!file->f_op->iterate_shared)
^1da177e4c3f41 Linus Torvalds      2005-04-16   91  		goto out;
^1da177e4c3f41 Linus Torvalds      2005-04-16   92  
^1da177e4c3f41 Linus Torvalds      2005-04-16   93  	res = security_file_permission(file, MAY_READ);
^1da177e4c3f41 Linus Torvalds      2005-04-16   94  	if (res)
^1da177e4c3f41 Linus Torvalds      2005-04-16   95  		goto out;
^1da177e4c3f41 Linus Torvalds      2005-04-16   96  
d9e5d31084b024 Amir Goldstein      2023-12-12   97  	res = fsnotify_file_perm(file, MAY_READ);
d9e5d31084b024 Amir Goldstein      2023-12-12   98  	if (res)
d9e5d31084b024 Amir Goldstein      2023-12-12   99  		goto out;
d9e5d31084b024 Amir Goldstein      2023-12-12  100  
0dc208b5d5feed Kirill Tkhai        2017-09-29  101  	res = down_read_killable(&inode->i_rwsem);
002354112f1e3c Al Viro             2016-05-26  102  	if (res)
002354112f1e3c Al Viro             2016-05-26  103  		goto out;
da78451190bdaa Liam R. Howlett     2007-12-06  104  
^1da177e4c3f41 Linus Torvalds      2005-04-16  105  	res = -ENOENT;
^1da177e4c3f41 Linus Torvalds      2005-04-16  106  	if (!IS_DEADDIR(inode)) {
bb6f619b3a49f9 Al Viro             2013-05-15  107  		ctx->pos = file->f_pos;
6192269444ebfb Al Viro             2016-04-20  108  		res = file->f_op->iterate_shared(file, ctx);
bb6f619b3a49f9 Al Viro             2013-05-15  109  		file->f_pos = ctx->pos;
d4c7cf6cffb1bc Heinrich Schuchardt 2014-06-04  110  		fsnotify_access(file);
^1da177e4c3f41 Linus Torvalds      2005-04-16  111  		file_accessed(file);
^1da177e4c3f41 Linus Torvalds      2005-04-16  112  	}
6192269444ebfb Al Viro             2016-04-20  113  	inode_unlock_shared(inode);
^1da177e4c3f41 Linus Torvalds      2005-04-16  114  out:
^1da177e4c3f41 Linus Torvalds      2005-04-16  115  	return res;
^1da177e4c3f41 Linus Torvalds      2005-04-16  116  }
5c0ba4e0762e6d Al Viro             2013-05-15  117  EXPORT_SYMBOL(iterate_dir);
^1da177e4c3f41 Linus Torvalds      2005-04-16  118  
8a23eb804ca4f2 Linus Torvalds      2019-10-05  119  /*
8a23eb804ca4f2 Linus Torvalds      2019-10-05  120   * POSIX says that a dirent name cannot contain NULL or a '/'.
8a23eb804ca4f2 Linus Torvalds      2019-10-05  121   *
8a23eb804ca4f2 Linus Torvalds      2019-10-05  122   * It's not 100% clear what we should really do in this case.
8a23eb804ca4f2 Linus Torvalds      2019-10-05  123   * The filesystem is clearly corrupted, but returning a hard
8a23eb804ca4f2 Linus Torvalds      2019-10-05  124   * error means that you now don't see any of the other names
8a23eb804ca4f2 Linus Torvalds      2019-10-05  125   * either, so that isn't a perfect alternative.
8a23eb804ca4f2 Linus Torvalds      2019-10-05  126   *
8a23eb804ca4f2 Linus Torvalds      2019-10-05  127   * And if you return an error, what error do you use? Several
8a23eb804ca4f2 Linus Torvalds      2019-10-05  128   * filesystems seem to have decided on EUCLEAN being the error
8a23eb804ca4f2 Linus Torvalds      2019-10-05  129   * code for EFSCORRUPTED, and that may be the error to use. Or
8a23eb804ca4f2 Linus Torvalds      2019-10-05  130   * just EIO, which is perhaps more obvious to users.
8a23eb804ca4f2 Linus Torvalds      2019-10-05  131   *
8a23eb804ca4f2 Linus Torvalds      2019-10-05  132   * In order to see the other file names in the directory, the
8a23eb804ca4f2 Linus Torvalds      2019-10-05  133   * caller might want to make this a "soft" error: skip the
8a23eb804ca4f2 Linus Torvalds      2019-10-05  134   * entry, and return the error at the end instead.
8a23eb804ca4f2 Linus Torvalds      2019-10-05  135   *
8a23eb804ca4f2 Linus Torvalds      2019-10-05  136   * Note that this should likely do a "memchr(name, 0, len)"
8a23eb804ca4f2 Linus Torvalds      2019-10-05  137   * check too, since that would be filesystem corruption as
8a23eb804ca4f2 Linus Torvalds      2019-10-05  138   * well. However, that case can't actually confuse user space,
8a23eb804ca4f2 Linus Torvalds      2019-10-05  139   * which has to do a strlen() on the name anyway to find the
8a23eb804ca4f2 Linus Torvalds      2019-10-05  140   * filename length, and the above "soft error" worry means
8a23eb804ca4f2 Linus Torvalds      2019-10-05  141   * that it's probably better left alone until we have that
8a23eb804ca4f2 Linus Torvalds      2019-10-05  142   * issue clarified.
2c6b7bcd747201 Linus Torvalds      2020-01-23  143   *
2c6b7bcd747201 Linus Torvalds      2020-01-23  144   * Note the PATH_MAX check - it's arbitrary but the real
2c6b7bcd747201 Linus Torvalds      2020-01-23  145   * kernel limit on a possible path component, not NAME_MAX,
2c6b7bcd747201 Linus Torvalds      2020-01-23  146   * which is the technical standard limit.
8a23eb804ca4f2 Linus Torvalds      2019-10-05  147   */
8a23eb804ca4f2 Linus Torvalds      2019-10-05  148  static int verify_dirent_name(const char *name, int len)
8a23eb804ca4f2 Linus Torvalds      2019-10-05  149  {
2c6b7bcd747201 Linus Torvalds      2020-01-23  150  	if (len <= 0 || len >= PATH_MAX)
8a23eb804ca4f2 Linus Torvalds      2019-10-05  151  		return -EIO;
b9959c7a347d6a Linus Torvalds      2019-10-18  152  	if (memchr(name, '/', len))
8a23eb804ca4f2 Linus Torvalds      2019-10-05  153  		return -EIO;
8a23eb804ca4f2 Linus Torvalds      2019-10-05  154  	return 0;
8a23eb804ca4f2 Linus Torvalds      2019-10-05  155  }
8a23eb804ca4f2 Linus Torvalds      2019-10-05  156  
^1da177e4c3f41 Linus Torvalds      2005-04-16  157  /*
^1da177e4c3f41 Linus Torvalds      2005-04-16  158   * Traditional linux readdir() handling..
^1da177e4c3f41 Linus Torvalds      2005-04-16  159   *
^1da177e4c3f41 Linus Torvalds      2005-04-16  160   * "count=1" is a special case, meaning that the buffer is one
^1da177e4c3f41 Linus Torvalds      2005-04-16  161   * dirent-structure in size and that the code can't handle more
^1da177e4c3f41 Linus Torvalds      2005-04-16  162   * anyway. Thus the special "fillonedir()" function for that
^1da177e4c3f41 Linus Torvalds      2005-04-16  163   * case (the low-level handlers don't need to care about this).
^1da177e4c3f41 Linus Torvalds      2005-04-16  164   */
^1da177e4c3f41 Linus Torvalds      2005-04-16  165  
^1da177e4c3f41 Linus Torvalds      2005-04-16  166  #ifdef __ARCH_WANT_OLD_READDIR
^1da177e4c3f41 Linus Torvalds      2005-04-16  167  
^1da177e4c3f41 Linus Torvalds      2005-04-16  168  struct old_linux_dirent {
^1da177e4c3f41 Linus Torvalds      2005-04-16  169  	unsigned long	d_ino;
^1da177e4c3f41 Linus Torvalds      2005-04-16  170  	unsigned long	d_offset;
^1da177e4c3f41 Linus Torvalds      2005-04-16  171  	unsigned short	d_namlen;
2507135e4ff231 Gustavo A. R. Silva 2023-06-20  172  	char		d_name[];
^1da177e4c3f41 Linus Torvalds      2005-04-16  173  };
^1da177e4c3f41 Linus Torvalds      2005-04-16  174  
^1da177e4c3f41 Linus Torvalds      2005-04-16  175  struct readdir_callback {
5c0ba4e0762e6d Al Viro             2013-05-15  176  	struct dir_context ctx;
^1da177e4c3f41 Linus Torvalds      2005-04-16  177  	struct old_linux_dirent __user * dirent;
^1da177e4c3f41 Linus Torvalds      2005-04-16  178  	int result;
^1da177e4c3f41 Linus Torvalds      2005-04-16  179  };
^1da177e4c3f41 Linus Torvalds      2005-04-16  180  
25885a35a72007 Al Viro             2022-08-16  181  static bool fillonedir(struct dir_context *ctx, const char *name, int namlen,
ac7576f4b1da8c Miklos Szeredi      2014-10-30  182  		      loff_t offset, u64 ino, unsigned int d_type)
^1da177e4c3f41 Linus Torvalds      2005-04-16  183  {
ac7576f4b1da8c Miklos Szeredi      2014-10-30  184  	struct readdir_callback *buf =
ac7576f4b1da8c Miklos Szeredi      2014-10-30  185  		container_of(ctx, struct readdir_callback, ctx);
^1da177e4c3f41 Linus Torvalds      2005-04-16  186  	struct old_linux_dirent __user * dirent;
afefdbb28a0a2a David Howells       2006-10-03  187  	unsigned long d_ino;
^1da177e4c3f41 Linus Torvalds      2005-04-16  188  
^1da177e4c3f41 Linus Torvalds      2005-04-16  189  	if (buf->result)
25885a35a72007 Al Viro             2022-08-16  190  		return false;
0c93ac69407d63 Linus Torvalds      2021-04-17  191  	buf->result = verify_dirent_name(name, namlen);
25885a35a72007 Al Viro             2022-08-16  192  	if (buf->result)
25885a35a72007 Al Viro             2022-08-16  193  		return false;
afefdbb28a0a2a David Howells       2006-10-03  194  	d_ino = ino;
8f3f655da72885 Al Viro             2008-08-12  195  	if (sizeof(d_ino) < sizeof(ino) && d_ino != ino) {
8f3f655da72885 Al Viro             2008-08-12  196  		buf->result = -EOVERFLOW;
25885a35a72007 Al Viro             2022-08-16  197  		return false;
8f3f655da72885 Al Viro             2008-08-12  198  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  199  	buf->result++;
^1da177e4c3f41 Linus Torvalds      2005-04-16  200  	dirent = buf->dirent;
391b7461d4a14e Al Viro             2020-02-18  201  	if (!user_write_access_begin(dirent,
^1da177e4c3f41 Linus Torvalds      2005-04-16  202  			(unsigned long)(dirent->d_name + namlen + 1) -
^1da177e4c3f41 Linus Torvalds      2005-04-16  203  				(unsigned long)dirent))
^1da177e4c3f41 Linus Torvalds      2005-04-16  204  		goto efault;
391b7461d4a14e Al Viro             2020-02-18  205  	unsafe_put_user(d_ino, &dirent->d_ino, efault_end);
391b7461d4a14e Al Viro             2020-02-18  206  	unsafe_put_user(offset, &dirent->d_offset, efault_end);
391b7461d4a14e Al Viro             2020-02-18  207  	unsafe_put_user(namlen, &dirent->d_namlen, efault_end);
391b7461d4a14e Al Viro             2020-02-18 @208  	unsafe_copy_dirent_name(dirent->d_name, name, namlen, efault_end);
391b7461d4a14e Al Viro             2020-02-18  209  	user_write_access_end();
25885a35a72007 Al Viro             2022-08-16  210  	return true;
391b7461d4a14e Al Viro             2020-02-18  211  efault_end:
391b7461d4a14e Al Viro             2020-02-18  212  	user_write_access_end();
^1da177e4c3f41 Linus Torvalds      2005-04-16  213  efault:
^1da177e4c3f41 Linus Torvalds      2005-04-16  214  	buf->result = -EFAULT;
25885a35a72007 Al Viro             2022-08-16  215  	return false;
^1da177e4c3f41 Linus Torvalds      2005-04-16  216  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  217  

:::::: The code at line 81 was first introduced by commit
:::::: c512c69187197fe08026cb5bbe7b9709f4f89b73 uaccess: implement a proper unsafe_copy_to_user() and switch filldir over to it

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
