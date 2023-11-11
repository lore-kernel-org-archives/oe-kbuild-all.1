Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552C81FC1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 01:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W7WBOXPg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699666078; x=1731202078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+tAZLjD/AChXKX77rVXLApM2CGpISi6wc0Hm6XipHEk=;
  b=W7WBOXPg76REgrUpRgA4L+zssQL74wP03nPkm3/2B+4vMauZB1X4sMEL
   llqhLaWmD6OSaXZYt+JKUiBct6v1Qzi26+sfibYQ3LelRjdASYIx1yNoK
   pFHcOi9RfPwnerjQzzWL00pIcMb57WUmz/0tQ0/sPgVWe73EQak2s3ukX
   S05eT3ERhMMMqlByut5iSeKTwKPSEagnKEObS9d9ZRuf0v7qn7tHbI9sQ
   nOb8ugqgRjb5aVu88cXzgswuCwOwD/Ox0NtOl76aTbfJ/zJLWV+zygXXD
   SO7Exh2QjxtgiKEmlR0Gy6Bk5lZAIMpDl7UA10Xf51PCrcAzWmgZP/W0H
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="369580208"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="369580208"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 17:27:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="1011068589"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="1011068589"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Nov 2023 17:27:56 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1cmw-000A7u-0p;
	Sat, 11 Nov 2023 01:27:54 +0000
Date: Sat, 11 Nov 2023 09:27:13 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:sb_write_barrier 23/27] fs/namespace.c:562: warning:
 Function parameter or member 'file' not described in 'mnt_drop_write_file'
Message-ID: <202311110947.yS4u4M2C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux sb_write_barrier
head:   c93dcd4dd4f0b7d45aa59f62ee184ee81e190028
commit: 4c221040079eada6aeabaa04efdf6fffcd2e4ba1 [23/27] fs: add srcu variants for mnt_{want,drop}_write() helpers
config: loongarch-randconfig-001-20231111 (https://download.01.org/0day-ci/archive/20231111/202311110947.yS4u4M2C-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110947.yS4u4M2C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110947.yS4u4M2C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/namespace.c:562: warning: Function parameter or member 'file' not described in 'mnt_drop_write_file'
>> fs/namespace.c:562: warning: Excess function parameter 'mnt' description in 'mnt_drop_write_file'
>> fs/namespace.c:578: warning: Function parameter or member 'file' not described in 'mnt_drop_write_file_srcu'
>> fs/namespace.c:578: warning: Excess function parameter 'mnt' description in 'mnt_drop_write_file_srcu'
   fs/namespace.c:3132: warning: Function parameter or member 'mp' not described in 'can_move_mount_beneath'


vim +562 fs/namespace.c

eb04c28288bb00 Jan Kara       2012-06-12  552  
4c221040079ead Amir Goldstein 2023-11-10  553  /**
4c221040079ead Amir Goldstein 2023-11-10  554   * mnt_drop_write_file - give up write access to a file's mount
4c221040079ead Amir Goldstein 2023-11-10  555   * @mnt: the mount on which to give up write access
4c221040079ead Amir Goldstein 2023-11-10  556   *
4c221040079ead Amir Goldstein 2023-11-10  557   * Tells the low-level filesystem that we are done performing writes to it and
4c221040079ead Amir Goldstein 2023-11-10  558   * also allows filesystem to be frozen again.  Must be matched with
4c221040079ead Amir Goldstein 2023-11-10  559   * mnt_want_write_file() call above.
4c221040079ead Amir Goldstein 2023-11-10  560   */
7c6893e3c9abf6 Miklos Szeredi 2017-09-05  561  void mnt_drop_write_file(struct file *file)
7c6893e3c9abf6 Miklos Szeredi 2017-09-05 @562  {
3e15dcf77b23b8 Amir Goldstein 2023-09-08  563  	mnt_put_write_access_file(file);
7c6893e3c9abf6 Miklos Szeredi 2017-09-05  564  	sb_end_write(file_inode(file)->i_sb);
7c6893e3c9abf6 Miklos Szeredi 2017-09-05  565  }
2a79f17e4a641a Al Viro        2011-12-09  566  EXPORT_SYMBOL(mnt_drop_write_file);
2a79f17e4a641a Al Viro        2011-12-09  567  
4c221040079ead Amir Goldstein 2023-11-10  568  /**
4c221040079ead Amir Goldstein 2023-11-10  569   * mnt_drop_write_file_srcu - give up write access to a file's mount
4c221040079ead Amir Goldstein 2023-11-10  570   * @mnt: the mount on which to give up write access
4c221040079ead Amir Goldstein 2023-11-10  571   * @idx: return value from corresponding mnt_want_write_file_srcu()
4c221040079ead Amir Goldstein 2023-11-10  572   *
4c221040079ead Amir Goldstein 2023-11-10  573   * Tells the low-level filesystem that we are done performing writes to it and
4c221040079ead Amir Goldstein 2023-11-10  574   * also allows filesystem to be frozen again.  Must be matched with
4c221040079ead Amir Goldstein 2023-11-10  575   * mnt_want_write_file_srcu() call above.
4c221040079ead Amir Goldstein 2023-11-10  576   */
4c221040079ead Amir Goldstein 2023-11-10  577  void mnt_drop_write_file_srcu(struct file *file, int idx)
4c221040079ead Amir Goldstein 2023-11-10 @578  {
4c221040079ead Amir Goldstein 2023-11-10  579  	mnt_put_write_access_file(file);
4c221040079ead Amir Goldstein 2023-11-10  580  	sb_end_write_srcu(file_inode(file)->i_sb, idx);
4c221040079ead Amir Goldstein 2023-11-10  581  }
4c221040079ead Amir Goldstein 2023-11-10  582  EXPORT_SYMBOL_GPL(mnt_drop_write_file_srcu);
4c221040079ead Amir Goldstein 2023-11-10  583  

:::::: The code at line 562 was first introduced by commit
:::::: 7c6893e3c9abf6a9676e060a1e35e5caca673d57 ovl: don't allow writing ioctl on lower layer

:::::: TO: Miklos Szeredi <mszeredi@redhat.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
