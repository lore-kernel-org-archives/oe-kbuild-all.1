Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1C3A2A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 00:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712278702; cv=none; b=rnzXRzniAkORoWoJKYW1aGUE9DWZZB2okTUu3x+rgI5Ui0JVHcd2gjRceJlVfUWhjc6Tp5W6nVwb8cFH7gae32AjsAilu9xLMvEcUVEYV3BohTCyxHVNPsVzW/Zp+qgaGJ6eQn2KqnYfzWWmUxcvYQVbax1eYEoXhWf32Q2/in4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712278702; c=relaxed/simple;
	bh=9FAk1YdUP8bl7q8jc9ZyJBeQ19q1uU3tBavTdsuFvso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DXIWWASlZ2gE45ScPvFYG3Lpbis3QDNo5Oht6UWb2vjvbs8IZczJYtibdAi6JivWh1OTcwdnwrKKxMjQvoM9+Xf6raW3o/amWNfuYsG8+C7yliCPqIy5supOtgM1fIoJVkwp2F4kXUoX7GmDtPcXXv1myXAQGxkSaeNskPxUu3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZnR6aHiL; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZnR6aHiL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712278700; x=1743814700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9FAk1YdUP8bl7q8jc9ZyJBeQ19q1uU3tBavTdsuFvso=;
  b=ZnR6aHiL7a5rMBi4G+H1j2dI6vGLAEp9pyONowvgKQCUfJnnQAxK5vFi
   X7KikA933fTBwfQT002O9c8bNmGgyoP2+NaVP7LlGt0HN1nuOTmE9E128
   3IYLZ+WRE8Vx1akQ5qX0B0g+rKDX75RZMePpa8Kw3lAl3ezBD+WKGMZmC
   jXY9xu5Fc2tMCF5vHj9ZmmNACZUMOi+TIRIaOs9juc7XmjX4t0y3WQayS
   a54RfEd7PHEvu1hTJ7bKTfGauEzL9rG38YRwIXXx+acHZc4muVf2PXeXD
   hcwcLntS+lnonkSQ6kJ2aJvfMTEBS6ZnMhTBz7iyVBaaejh2d020qXCI7
   Q==;
X-CSE-ConnectionGUID: +KZFOb/YT/aujBdlfoZsQA==
X-CSE-MsgGUID: 2gijJet/T9C/SBXM54BgWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7439060"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7439060"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 17:58:19 -0700
X-CSE-ConnectionGUID: gqpINyv/R6m3s7+l92MqGQ==
X-CSE-MsgGUID: t4z1kf+VSeCapHPgKrRuaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="18867331"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Apr 2024 17:58:18 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsXuJ-0001h4-19;
	Fri, 05 Apr 2024 00:58:15 +0000
Date: Fri, 5 Apr 2024 08:57:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 29/29] fs/nfsd/nfsctl.c:137:27: error:
 initialization of 'struct module *' from incompatible pointer type 'ssize_t
 (*)(struct file *, const char *, size_t,  loff_t *)' {aka 'long int
 (*)(struct file *, const char *, long unsigned int,  long long int *)'}
Message-ID: <202404050845.zhxT11cX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   34a49de340a534b0cb222309e73d1ef215ff4db6
commit: 34a49de340a534b0cb222309e73d1ef215ff4db6 [29/29] WIP
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20240405/202404050845.zhxT11cX-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404050845.zhxT11cX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050845.zhxT11cX-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfsd/nfsctl.c:137:10: error: 'const struct file_operations' has no member named 'write'
     137 |         .write          = nfsctl_transaction_write,
         |          ^~~~~
   fs/nfsd/nfsctl.c:137:27: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     137 |         .write          = nfsctl_transaction_write,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfsctl.c:137:27: note: (near initialization for 'transaction_ops')
>> fs/nfsd/nfsctl.c:137:27: error: initialization of 'struct module *' from incompatible pointer type 'ssize_t (*)(struct file *, const char *, size_t,  loff_t *)' {aka 'long int (*)(struct file *, const char *, long unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
   fs/nfsd/nfsctl.c:137:27: note: (near initialization for 'transaction_ops.owner')
   fs/nfsd/nfsctl.c:138:10: error: 'const struct file_operations' has no member named 'read'
     138 |         .read           = nfsctl_transaction_read,
         |          ^~~~
   fs/nfsd/nfsctl.c:138:27: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     138 |         .read           = nfsctl_transaction_read,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfsctl.c:138:27: note: (near initialization for 'transaction_ops')
   fs/nfsd/nfsctl.c:138:27: error: initialization of 'loff_t (*)(struct file *, loff_t,  int)' {aka 'long long int (*)(struct file *, long long int,  int)'} from incompatible pointer type 'ssize_t (*)(struct file *, char *, size_t,  loff_t *)' {aka 'long int (*)(struct file *, char *, long unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
   fs/nfsd/nfsctl.c:138:27: note: (near initialization for 'transaction_ops.llseek')
   fs/nfsd/nfsctl.c:140:27: warning: initialized field overwritten [-Woverride-init]
     140 |         .llseek         = default_llseek,
         |                           ^~~~~~~~~~~~~~
   fs/nfsd/nfsctl.c:140:27: note: (near initialization for 'transaction_ops.llseek')
   fs/nfsd/nfsctl.c:165:10: error: 'const struct file_operations' has no member named 'read'
     165 |         .read           = seq_read,
         |          ^~~~
   fs/nfsd/nfsctl.c:165:27: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     165 |         .read           = seq_read,
         |                           ^~~~~~~~
   fs/nfsd/nfsctl.c:165:27: note: (near initialization for 'exports_nfsd_operations')
>> fs/nfsd/nfsctl.c:165:27: error: initialization of 'int (*)(struct file *, void *)' from incompatible pointer type 'ssize_t (*)(struct file *, char *, size_t,  loff_t *)' {aka 'long int (*)(struct file *, char *, long unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
   fs/nfsd/nfsctl.c:165:27: note: (near initialization for 'exports_nfsd_operations.flush')
   fs/nfsd/nfsctl.c:180:10: error: 'const struct file_operations' has no member named 'read'
     180 |         .read           = seq_read,
         |          ^~~~
   fs/nfsd/nfsctl.c:180:27: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     180 |         .read           = seq_read,
         |                           ^~~~~~~~
   fs/nfsd/nfsctl.c:180:27: note: (near initialization for 'pool_stats_operations')
   fs/nfsd/nfsctl.c:180:27: error: initialization of 'int (*)(struct file *, void *)' from incompatible pointer type 'ssize_t (*)(struct file *, char *, size_t,  loff_t *)' {aka 'long int (*)(struct file *, char *, long unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
   fs/nfsd/nfsctl.c:180:27: note: (near initialization for 'pool_stats_operations.flush')
   cc1: some warnings being treated as errors


vim +137 fs/nfsd/nfsctl.c

7390022d697bcc NeilBrown            2005-11-07  135  
4b6f5d20b04dcb Arjan van de Ven     2006-03-28  136  static const struct file_operations transaction_ops = {
^1da177e4c3f41 Linus Torvalds       2005-04-16 @137  	.write		= nfsctl_transaction_write,
7390022d697bcc NeilBrown            2005-11-07  138  	.read		= nfsctl_transaction_read,
^1da177e4c3f41 Linus Torvalds       2005-04-16  139  	.release	= simple_transaction_release,
6038f373a3dc1f Arnd Bergmann        2010-08-15 @140  	.llseek		= default_llseek,
^1da177e4c3f41 Linus Torvalds       2005-04-16  141  };
^1da177e4c3f41 Linus Torvalds       2005-04-16  142  
96d851c4d28de8 Stanislav Kinsbursky 2013-02-01  143  static int exports_net_open(struct net *net, struct file *file)
^1da177e4c3f41 Linus Torvalds       2005-04-16  144  {
f2c7ea10f901b7 Stanislav Kinsbursky 2012-03-28  145  	int err;
f2c7ea10f901b7 Stanislav Kinsbursky 2012-03-28  146  	struct seq_file *seq;
96d851c4d28de8 Stanislav Kinsbursky 2013-02-01  147  	struct nfsd_net *nn = net_generic(net, nfsd_net_id);
f2c7ea10f901b7 Stanislav Kinsbursky 2012-03-28  148  
f2c7ea10f901b7 Stanislav Kinsbursky 2012-03-28  149  	err = seq_open(file, &nfs_exports_op);
f2c7ea10f901b7 Stanislav Kinsbursky 2012-03-28  150  	if (err)
f2c7ea10f901b7 Stanislav Kinsbursky 2012-03-28  151  		return err;
f2c7ea10f901b7 Stanislav Kinsbursky 2012-03-28  152  
f2c7ea10f901b7 Stanislav Kinsbursky 2012-03-28  153  	seq = file->private_data;
e5f06f720eff24 Stanislav Kinsbursky 2012-04-11  154  	seq->private = nn->svc_export_cache;
f2c7ea10f901b7 Stanislav Kinsbursky 2012-03-28  155  	return 0;
^1da177e4c3f41 Linus Torvalds       2005-04-16  156  }
^1da177e4c3f41 Linus Torvalds       2005-04-16  157  
96d851c4d28de8 Stanislav Kinsbursky 2013-02-01  158  static int exports_nfsd_open(struct inode *inode, struct file *file)
96d851c4d28de8 Stanislav Kinsbursky 2013-02-01  159  {
96d851c4d28de8 Stanislav Kinsbursky 2013-02-01  160  	return exports_net_open(inode->i_sb->s_fs_info, file);
96d851c4d28de8 Stanislav Kinsbursky 2013-02-01  161  }
96d851c4d28de8 Stanislav Kinsbursky 2013-02-01  162  
96d851c4d28de8 Stanislav Kinsbursky 2013-02-01  163  static const struct file_operations exports_nfsd_operations = {
96d851c4d28de8 Stanislav Kinsbursky 2013-02-01  164  	.open		= exports_nfsd_open,
^1da177e4c3f41 Linus Torvalds       2005-04-16 @165  	.read		= seq_read,
^1da177e4c3f41 Linus Torvalds       2005-04-16  166  	.llseek		= seq_lseek,
^1da177e4c3f41 Linus Torvalds       2005-04-16  167  	.release	= seq_release,
^1da177e4c3f41 Linus Torvalds       2005-04-16  168  };
^1da177e4c3f41 Linus Torvalds       2005-04-16  169  

:::::: The code at line 137 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
