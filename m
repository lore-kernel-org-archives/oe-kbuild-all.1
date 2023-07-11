Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CF91EA65
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 18:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689100224; x=1720636224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fVfADn1/5SjnXuw9DtDiZqUXoepVGxGGsvtIIkJ8rHU=;
  b=Lo3xxkTnu5Oi0YbLmskyiqUwD8fuk5cs/3WNOxeW98DOeIUMLo417usc
   dYZhrcstVL+B+zmZscDAZyjOlZyjZS5IMeP7YfWMSDwG0de8wBAUHXAd3
   eYha6oDh8Dmi1hxn+JyeUl6F/NDzh2nWpwNnb5tUWzmTQL3grlD1ClHk/
   qu9dAK5MGzQo+uuDayIYUaMiNcZp7Rf7h0nQ/gUe4lHkDSuCaic2Svbw4
   4q3SCATfprBSy7ViNQvz0CCiBC1K8Pa79ehNk1JUAusLxK0t6jepEDyU/
   OXwNKrCa5MDy9Q3JPUjAydSpLkyj6cQ4Uy5RP13jYvIPTnXDSD2v7JZVG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="363566188"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="363566188"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 11:30:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="811307100"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="811307100"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Jul 2023 11:30:14 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJI7p-00051F-1r;
	Tue, 11 Jul 2023 18:30:13 +0000
Date: Wed, 12 Jul 2023 02:30:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>
Subject: [jlayton:mgctime 50/118] fs/hostfs/hostfs_kern.c:520:36: error:
 incompatible type for argument 2 of 'inode_set_ctime_to_ts'
Message-ID: <202307120235.UI0A6Op0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgctime
head:   61142a4e29e09f59b3b640f0f691e00af4c4a6f9
commit: 2ceaa835b4f50d1b0c0fa678f352bb4f6f5f8062 [50/118] hostfs: convert to ctime accessor functions
config: um-defconfig (https://download.01.org/0day-ci/archive/20230712/202307120235.UI0A6Op0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307120235.UI0A6Op0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307120235.UI0A6Op0-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/hostfs/hostfs_kern.c: In function 'hostfs_inode_update':
>> fs/hostfs/hostfs_kern.c:520:36: error: incompatible type for argument 2 of 'inode_set_ctime_to_ts'
     520 |         inode_set_ctime_to_ts(ino, &st->ctime);
         |                                    ^~~~~~~~~~
         |                                    |
         |                                    const struct hostfs_timespec *
   In file included from fs/hostfs/hostfs_kern.c:9:
   include/linux/fs.h:1499:73: note: expected 'struct timespec64' but argument is of type 'const struct hostfs_timespec *'
    1499 |                                                       struct timespec64 ts)
         |                                                       ~~~~~~~~~~~~~~~~~~^~


vim +/inode_set_ctime_to_ts +520 fs/hostfs/hostfs_kern.c

   510	
   511	static int hostfs_inode_update(struct inode *ino, const struct hostfs_stat *st)
   512	{
   513		set_nlink(ino, st->nlink);
   514		i_uid_write(ino, st->uid);
   515		i_gid_write(ino, st->gid);
   516		ino->i_atime =
   517			(struct timespec64){ st->atime.tv_sec, st->atime.tv_nsec };
   518		ino->i_mtime =
   519			(struct timespec64){ st->mtime.tv_sec, st->mtime.tv_nsec };
 > 520		inode_set_ctime_to_ts(ino, &st->ctime);
   521		ino->i_size = st->size;
   522		ino->i_blocks = st->blocks;
   523		return 0;
   524	}
   525	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
