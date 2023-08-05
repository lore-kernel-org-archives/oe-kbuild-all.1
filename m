Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7531523E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Aug 2023 12:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691237432; x=1722773432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ssoGci8Wb7PWefq4yyKXd7gfOrw8PaGXbQh4Vb+6o+Q=;
  b=FvTjVLZFl9/hJG503x5ckk5WIsc/FL7fUzDM0b0GLpVsRAuMloWtImvJ
   3RZ3GFKHYtet5cItzEyhN0ASGWu5wQOIOOSm2Zl29q/nZyoK3TPndEzJI
   YUTSLtBtIWl65ErkGvUoTo13sWJWQOhubD23AMqVt5s3BxrUuveYJVYSW
   hkckjnnC10oMlIAfjBZHplbd+LJbrWbs5TRlTOQy4bQ3LA9K8RLzifcvy
   bhpzKI8BtJOE1kFBtpJSgpSKwruwkTqgn2o5lEt6v8huBhEVCez2CzbL/
   IYRgrk67TSbLbCnjLgEsvib4WOrBfHCQoMvPqwGdU3hZFO523gLIPLTkG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="401274350"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; 
   d="scan'208";a="401274350"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2023 05:10:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="820446295"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; 
   d="scan'208";a="820446295"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Aug 2023 05:10:31 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSG74-0003VP-1N;
	Sat, 05 Aug 2023 12:10:30 +0000
Date: Sat, 5 Aug 2023 20:10:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgctime 5/10] fs/btrfs/inode.c:6066:27: warning: unused
 variable 'now'
Message-ID: <202308052000.Y5GRBebJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgctime
head:   e84ede6c44e4d6e1716d0d54bbda0b1b298cc801
commit: d337fa60b28d72d78c829e3985805e062c2fd2c6 [5/10] fs: drop the timespec64 argument from update_time prototype
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230805/202308052000.Y5GRBebJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308052000.Y5GRBebJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308052000.Y5GRBebJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/inode.c: In function 'btrfs_update_time':
>> fs/btrfs/inode.c:6066:27: warning: unused variable 'now' [-Wunused-variable]
    6066 |         struct timespec64 now = current_time(inode);
         |                           ^~~


vim +/now +6066 fs/btrfs/inode.c

  6057	
  6058	/*
  6059	 * This is a copy of file_update_time.  We need this so we can return error on
  6060	 * ENOSPC for updating the inode in the case of file write and mmap writes.
  6061	 */
  6062	static int btrfs_update_time(struct inode *inode, int flags)
  6063	{
  6064		struct btrfs_root *root = BTRFS_I(inode)->root;
  6065		bool dirty = flags & ~S_VERSION;
> 6066		struct timespec64 now = current_time(inode);
  6067	
  6068		if (btrfs_root_readonly(root))
  6069			return -EROFS;
  6070	
  6071		dirty = inode_update_timestamps(inode, flags);
  6072		return dirty ? btrfs_dirty_inode(BTRFS_I(inode)) : 0;
  6073	}
  6074	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
