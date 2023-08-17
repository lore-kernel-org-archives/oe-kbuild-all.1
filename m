Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D91F2918
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 20:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692304983; x=1723840983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lmSzuPjgESfdCKMXYxXpnpobq4euqXG1vhhzNML+Op0=;
  b=GDQ50bcSTg6TvLLvJizEY4d8rm4GfAKLo7+rG6Mtv75MCB+m/9FGXIH5
   pqHi/33Aj06IZmWOQ0C3s+CiqZ18yQ1D87Nceh74NTeLkVu6jAMYiCk0z
   Yl1MaTHeM0/WmuTKdXj6y1pm2Og5ni+Lzms6fAQe0KZvOJhz7rTSB/pS1
   86gxF8mqhkGTFG0IkexanY85sTpMPU1T3pIFG2/0LYQtqoWQ/QiNMTsxg
   U+yQu9bLHVLW1QpYBnCCn+it8ArVykQYYmbj1t6pjnXTwkrTQe8jjq+h4
   wCrOOXu2eyFzjhzCBZ1/3vW9hRHCCk357e6Zu7r0Ql/3YEihx3LAHNDYi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="371826885"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="371826885"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 13:43:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="764260031"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="764260031"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 17 Aug 2023 13:42:57 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWjpY-0001Sh-2E;
	Thu, 17 Aug 2023 20:42:56 +0000
Date: Fri, 18 Aug 2023 04:42:38 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:sb_write_barrier 38/42] fs/namespace.c:560: warning:
 Function parameter or member 'file' not described in 'mnt_drop_write_file'
Message-ID: <202308180427.jfWbckDY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux sb_write_barrier
head:   9bcb451a73fb8cb2bff4e5945bce0942909db148
commit: aa7b43ffcbf1c512ea9fa2acc0ae69823cf2de14 [38/42] fs: add srcu variants for mnt_{want,drop}_write() helpers
config: x86_64-rhel-8.3-ltp (https://download.01.org/0day-ci/archive/20230818/202308180427.jfWbckDY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180427.jfWbckDY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180427.jfWbckDY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/namespace.c:560: warning: Function parameter or member 'file' not described in 'mnt_drop_write_file'
>> fs/namespace.c:560: warning: Excess function parameter 'mnt' description in 'mnt_drop_write_file'
>> fs/namespace.c:576: warning: Function parameter or member 'file' not described in 'mnt_drop_write_file_srcu'
>> fs/namespace.c:576: warning: Excess function parameter 'mnt' description in 'mnt_drop_write_file_srcu'
   fs/namespace.c:3130: warning: Function parameter or member 'mp' not described in 'can_move_mount_beneath'


vim +560 fs/namespace.c

eb04c28288bb00 Jan Kara       2012-06-12  550  
aa7b43ffcbf1c5 Amir Goldstein 2022-11-20  551  /**
aa7b43ffcbf1c5 Amir Goldstein 2022-11-20  552   * mnt_drop_write_file - give up write access to a file's mount
aa7b43ffcbf1c5 Amir Goldstein 2022-11-20  553   * @mnt: the mount on which to give up write access
aa7b43ffcbf1c5 Amir Goldstein 2022-11-20  554   *
aa7b43ffcbf1c5 Amir Goldstein 2022-11-20  555   * Tells the low-level filesystem that we are done performing writes to it and
aa7b43ffcbf1c5 Amir Goldstein 2022-11-20  556   * also allows filesystem to be frozen again.  Must be matched with
aa7b43ffcbf1c5 Amir Goldstein 2022-11-20  557   * mnt_want_write_file() call above.
aa7b43ffcbf1c5 Amir Goldstein 2022-11-20  558   */
7c6893e3c9abf6 Miklos Szeredi 2017-09-05  559  void mnt_drop_write_file(struct file *file)
7c6893e3c9abf6 Miklos Szeredi 2017-09-05 @560  {
a6795a585929d9 Miklos Szeredi 2018-07-18  561  	__mnt_drop_write_file(file);
7c6893e3c9abf6 Miklos Szeredi 2017-09-05  562  	sb_end_write(file_inode(file)->i_sb);
7c6893e3c9abf6 Miklos Szeredi 2017-09-05  563  }
2a79f17e4a641a Al Viro        2011-12-09  564  EXPORT_SYMBOL(mnt_drop_write_file);
2a79f17e4a641a Al Viro        2011-12-09  565  
aa7b43ffcbf1c5 Amir Goldstein 2022-11-20  566  /**
aa7b43ffcbf1c5 Amir Goldstein 2022-11-20  567   * mnt_drop_write_file_srcu - give up write access to a file's mount
aa7b43ffcbf1c5 Amir Goldstein 2022-11-20  568   * @mnt: the mount on which to give up write access
aa7b43ffcbf1c5 Amir Goldstein 2022-11-20  569   * @idx: return value from corresponding mnt_want_write_file_srcu()
aa7b43ffcbf1c5 Amir Goldstein 2022-11-20  570   *
aa7b43ffcbf1c5 Amir Goldstein 2022-11-20  571   * Tells the low-level filesystem that we are done performing writes to it and
aa7b43ffcbf1c5 Amir Goldstein 2022-11-20  572   * also allows filesystem to be frozen again.  Must be matched with
aa7b43ffcbf1c5 Amir Goldstein 2022-11-20  573   * mnt_want_write_file_srcu() call above.
aa7b43ffcbf1c5 Amir Goldstein 2022-11-20  574   */
aa7b43ffcbf1c5 Amir Goldstein 2022-11-20  575  void mnt_drop_write_file_srcu(struct file *file, int idx)
aa7b43ffcbf1c5 Amir Goldstein 2022-11-20 @576  {
aa7b43ffcbf1c5 Amir Goldstein 2022-11-20  577  	__mnt_drop_write_file(file);
aa7b43ffcbf1c5 Amir Goldstein 2022-11-20  578  	sb_end_write_srcu(file_inode(file)->i_sb, idx);
aa7b43ffcbf1c5 Amir Goldstein 2022-11-20  579  }
aa7b43ffcbf1c5 Amir Goldstein 2022-11-20  580  EXPORT_SYMBOL_GPL(mnt_drop_write_file_srcu);
aa7b43ffcbf1c5 Amir Goldstein 2022-11-20  581  

:::::: The code at line 560 was first introduced by commit
:::::: 7c6893e3c9abf6a9676e060a1e35e5caca673d57 ovl: don't allow writing ioctl on lower layer

:::::: TO: Miklos Szeredi <mszeredi@redhat.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
