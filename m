Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01A4A21
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 02:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688611334; x=1720147334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ofg9z7L36rw7yrei1hO3cOhkHSDR65e8qugYcSMkhcc=;
  b=AznZ/LRh/BmaFtECWHSbdIeyzuDRQA50E0SrzzLUnPAYBC7MBIPQ7KwY
   T702QxM+kb3LolUbttdm8YXgxyW0AY0iW3Zp7s2Ji0aYO3U31dHdCTvFg
   v3sQXKd4tlHfOzdD8AToJ/Hs3qxpR+ZPYHuNdc/u1QMX4/G3VA10D2Jd6
   uhyKdp51wIjPiD4TtbL5y4KkOKqwcqdBoG1BKqeqcSMZ+y0hxyjNXADon
   x6I2yOoj9bR/gKh8VoeTsxip7HtHYg0xTDDclTFWCKj3dU4C1jxdImy3k
   iHfLAJFurBfqRzZ6eFsF6Is6HO6kMUsRWs8618kEPpt4D7IeKCu0NvKxO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="366063443"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="366063443"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 19:42:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="754588890"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="754588890"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Jul 2023 19:42:13 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHEwe-00010W-2L;
	Thu, 06 Jul 2023 02:42:12 +0000
Date: Thu, 6 Jul 2023 10:41:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:ctime-next 51/93] fs/hostfs/hostfs_kern.c:520:36: error:
 incompatible type for argument 2 of 'inode_set_ctime_to_ts'
Message-ID: <202307061044.V09C5J4z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git ctime-next
head:   0e040b500830cfb4a228a32ce754b2d868b21779
commit: 57758153d414f883fcc208930e2b0911bc6b50e3 [51/93] hostfs: convert to ctime accessor functions
config: um-defconfig (https://download.01.org/0day-ci/archive/20230706/202307061044.V09C5J4z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307061044.V09C5J4z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307061044.V09C5J4z-lkp@intel.com/

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
