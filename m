Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885331365
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jul 2023 02:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689562301; x=1721098301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=58Q3AEe+kWxlav7Tok1x+EGvmE4GKXlVtJo7HkfLfX4=;
  b=Qz1Sw4RFykDpqxD3f3AHuV+iLt9ushSde36cvc68gd0lG65yTL5Hlcv2
   KKLYAmZTvp56Ert5SXbMLzgSouOLMGyqX7SncAtfwcK7VIYpDdp+y/9l6
   N9aHYFvPQ1HljU0Blg/XIkh3nzHNoeC4RZXKJ6EUQtKSgTrPI9cT5x/mP
   SfDBiTDCcUBo8CihEJKqbIrCmJ/QSyI/xrJK+m5vcultTXZP3zJ6N9hks
   Czv67cKWULFRJb5CXkk+5Mcg/gH6oUY1ZiAr6MNdAsIwXXwKpMD30/06+
   W/SPML1ZWtDR7G1gb4ACn8VhYSAmE8ZY3IAr1BeNFSJ5NZdlVCBgyesgc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="345422505"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="345422505"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2023 19:51:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="969696425"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="969696425"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 16 Jul 2023 19:51:39 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLEKo-00099Y-2R;
	Mon, 17 Jul 2023 02:51:38 +0000
Date: Mon, 17 Jul 2023 10:50:46 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>
Subject: [samba-ksmbd:ksmbd-for-next-next 2/2] fs/smb/server/vfs.c:113:48:
 error: 'KSMBD_SHARE_FLAG_CROSSMNT' undeclared; did you mean
 'KSMBD_SHARE_FLAG_STREAMS'?
Message-ID: <202307171058.2onUUbC3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
head:   ad297d25edb98d80a162f7ab8280ffbc025e8ebf
commit: ad297d25edb98d80a162f7ab8280ffbc025e8ebf [2/2] ksmbd: check if a mount point is crossed during path lookup
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230717/202307171058.2onUUbC3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230717/202307171058.2onUUbC3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307171058.2onUUbC3-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/smb/server/vfs.c: In function 'ksmbd_vfs_path_lookup_locked':
>> fs/smb/server/vfs.c:113:48: error: 'KSMBD_SHARE_FLAG_CROSSMNT' undeclared (first use in this function); did you mean 'KSMBD_SHARE_FLAG_STREAMS'?
     113 |         if (test_share_config_flag(share_conf, KSMBD_SHARE_FLAG_CROSSMNT)) {
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                KSMBD_SHARE_FLAG_STREAMS
   fs/smb/server/vfs.c:113:48: note: each undeclared identifier is reported only once for each function it appears in


vim +113 fs/smb/server/vfs.c

    63	
    64	static int ksmbd_vfs_path_lookup_locked(struct ksmbd_share_config *share_conf,
    65						char *pathname, unsigned int flags,
    66						struct path *parent_path,
    67						struct path *path)
    68	{
    69		struct qstr last;
    70		struct filename *filename;
    71		struct path *root_share_path = &share_conf->vfs_path;
    72		int err, type;
    73		struct dentry *d;
    74	
    75		if (pathname[0] == '\0') {
    76			pathname = share_conf->path;
    77			root_share_path = NULL;
    78		} else {
    79			flags |= LOOKUP_BENEATH;
    80		}
    81	
    82		filename = getname_kernel(pathname);
    83		if (IS_ERR(filename))
    84			return PTR_ERR(filename);
    85	
    86		err = vfs_path_parent_lookup(filename, flags,
    87					     parent_path, &last, &type,
    88					     root_share_path);
    89		if (err) {
    90			putname(filename);
    91			return err;
    92		}
    93	
    94		if (unlikely(type != LAST_NORM)) {
    95			path_put(parent_path);
    96			putname(filename);
    97			return -ENOENT;
    98		}
    99	
   100		inode_lock_nested(parent_path->dentry->d_inode, I_MUTEX_PARENT);
   101		d = lookup_one_qstr_excl(&last, parent_path->dentry, 0);
   102		if (IS_ERR(d))
   103			goto err_out;
   104	
   105		if (d_is_negative(d)) {
   106			dput(d);
   107			goto err_out;
   108		}
   109	
   110		path->dentry = d;
   111		path->mnt = mntget(parent_path->mnt);
   112	
 > 113		if (test_share_config_flag(share_conf, KSMBD_SHARE_FLAG_CROSSMNT)) {
   114			err = follow_down(path, 0);
   115			if (err < 0) {
   116				path_put(path);
   117				goto err_out;
   118			}
   119		}
   120	
   121		putname(filename);
   122		return 0;
   123	
   124	err_out:
   125		inode_unlock(d_inode(parent_path->dentry));
   126		path_put(parent_path);
   127		putname(filename);
   128		return -ENOENT;
   129	}
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
