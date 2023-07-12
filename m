Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F04441F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 10:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689158634; x=1720694634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/5E6oQTGDsqNuAIcDnLG1ju1GbkJz0rR/8X5mdWHD+A=;
  b=WgoC3W+owozp+hTTLo2cib5Y/M6oV8WkqP2XcDkDsc1ALdsT032Kk++e
   /vvn5NmQfqElDT5mwsi62A1cFX48RF8cdhSVgDojlabmHur0MIF6l9exa
   3FW5aGMaCZJ6IZi1KwVGWN62ijFUQXNtE1Hbdq1XBhQlx6wHNiP8neuwV
   s4fhwv7ZFAiRMTuU+TmHMBP5CUi5APdd1h96XKaEQ9zk9bY3SlLc7ThLa
   tgh8ZhoesFb3Pm5Dk2csMRv1l9DPiQ5+Y9P19b3UANK398mCshQtgRb7J
   YNCqtlFG31oC9MutXdih9TYAPWkcH4t4Q5go0Jt3sdhu9TDlyoY7KQGm0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="362323262"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="362323262"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 03:43:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="724841776"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="724841776"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Jul 2023 03:43:52 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJXK3-0005dJ-2c;
	Wed, 12 Jul 2023 10:43:51 +0000
Date: Wed, 12 Jul 2023 18:43:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Babrou <github@ivan.computer>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bobrik:ivan/kernfs-fsid 1/1] fs/kernfs/mount.c:50:5: warning: no
 previous prototype for 'kernfs_statfs'
Message-ID: <202307121811.orL7hDGV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bobrik/linux ivan/kernfs-fsid
head:   556d2ad5c816ebd4bc5144ef2cf82e2a5622b040
commit: 556d2ad5c816ebd4bc5144ef2cf82e2a5622b040 [1/1] kernfs: attach uuid for every kernfs and report it in fsid
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230712/202307121811.orL7hDGV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307121811.orL7hDGV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307121811.orL7hDGV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/kernfs/mount.c:50:5: warning: no previous prototype for 'kernfs_statfs' [-Wmissing-prototypes]
      50 | int kernfs_statfs(struct dentry *dentry, struct kstatfs *buf)
         |     ^~~~~~~~~~~~~


vim +/kernfs_statfs +50 fs/kernfs/mount.c

    49	
  > 50	int kernfs_statfs(struct dentry *dentry, struct kstatfs *buf)
    51	{
    52		simple_statfs(dentry, buf);
    53		buf->f_fsid = uuid_to_fsid(dentry->d_sb->s_uuid.b);
    54		return 0;
    55	}
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
