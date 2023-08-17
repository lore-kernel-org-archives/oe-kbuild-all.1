Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FA613FF2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 13:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692279647; x=1723815647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S6WjJAFIQQXZ1MvcjmZ9qTN8X1kEZvOWYowA/UCDE1w=;
  b=lrtxWYMFUm+hxF/3OqNzk5IYdk3lGJyh/CvVCokfwnf8zcIP407t9g9q
   1FiRsmjAW8/Vk6U+Y0/RHQ8JpKl4ehelTV8H1ipHvNMBtBY4bgy+9+fE/
   VSuLRHimSHy8zbiMZKzQ+MUccHHka/ZAdrah/hSFdSUzCkE/0QAivlLPZ
   8HQC/9qSYc1QCkZVsz/jCFFZikG8eQI7PA4HzIuN4iTnAdB+vxZFr+/WA
   Bf9NpslCSomZVVYSvvlgSisNivclKU/6M/jAMiEG9lo4JnGoTiM48CXId
   x1h+Tw9+d5BXjwgR3imu1it19qpvnM8kERdPYUDWJpK232SZwfhaZt6FC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="371717244"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="371717244"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 06:40:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="908411149"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="908411149"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Aug 2023 06:40:43 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWdEw-0001An-1K;
	Thu, 17 Aug 2023 13:40:42 +0000
Date: Thu, 17 Aug 2023 21:39:48 +0800
From: kernel test robot <lkp@intel.com>
To: Olga Kornievskaia <kolga@netapp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Anna Schumaker <Anna.Schumaker@netapp.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 9/9999] fs/nfs/nfs4proc.c:8063: warning:
 Function parameter or member 'server' not described in
 'nfs4_proc_get_locations'
Message-ID: <202308172114.wJLyKDlY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Olga,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   f6f7927ac664ba23447f8dd3c3dfe2f4ee39272f
commit: 6f2836341d8a39e1e000572b10959347d7e61fd9 [9/9999] NFSv4.1 query for fs_location attr on a new file system
config: x86_64-randconfig-x062-20230817 (https://download.01.org/0day-ci/archive/20230817/202308172114.wJLyKDlY-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308172114.wJLyKDlY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308172114.wJLyKDlY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfs/nfs4proc.c:8063: warning: Function parameter or member 'server' not described in 'nfs4_proc_get_locations'
>> fs/nfs/nfs4proc.c:8063: warning: Function parameter or member 'fhandle' not described in 'nfs4_proc_get_locations'
>> fs/nfs/nfs4proc.c:8063: warning: Excess function parameter 'inode' description in 'nfs4_proc_get_locations'


vim +8063 fs/nfs/nfs4proc.c

b03d735b4ca237 Chuck Lever       2013-10-17  8041  
b03d735b4ca237 Chuck Lever       2013-10-17  8042  /**
b03d735b4ca237 Chuck Lever       2013-10-17  8043   * nfs4_proc_get_locations - discover locations for a migrated FSID
b03d735b4ca237 Chuck Lever       2013-10-17  8044   * @inode: inode on FSID that is migrating
b03d735b4ca237 Chuck Lever       2013-10-17  8045   * @locations: result of query
b03d735b4ca237 Chuck Lever       2013-10-17  8046   * @page: buffer
b03d735b4ca237 Chuck Lever       2013-10-17  8047   * @cred: credential to use for this operation
b03d735b4ca237 Chuck Lever       2013-10-17  8048   *
b03d735b4ca237 Chuck Lever       2013-10-17  8049   * Returns NFS4_OK on success, a negative NFS4ERR status code if the
b03d735b4ca237 Chuck Lever       2013-10-17  8050   * operation failed, or a negative errno if a local error occurred.
b03d735b4ca237 Chuck Lever       2013-10-17  8051   *
b03d735b4ca237 Chuck Lever       2013-10-17  8052   * On success, "locations" is filled in, but if the server has
b03d735b4ca237 Chuck Lever       2013-10-17  8053   * no locations information, NFS_ATTR_FATTR_V4_LOCATIONS is not
b03d735b4ca237 Chuck Lever       2013-10-17  8054   * asserted.
b03d735b4ca237 Chuck Lever       2013-10-17  8055   *
b03d735b4ca237 Chuck Lever       2013-10-17  8056   * -NFS4ERR_LEASE_MOVED is returned if the server still has leases
b03d735b4ca237 Chuck Lever       2013-10-17  8057   * from this client that require migration recovery.
b03d735b4ca237 Chuck Lever       2013-10-17  8058   */
6f2836341d8a39 Olga Kornievskaia 2022-01-12  8059  int nfs4_proc_get_locations(struct nfs_server *server,
6f2836341d8a39 Olga Kornievskaia 2022-01-12  8060  			    struct nfs_fh *fhandle,
b03d735b4ca237 Chuck Lever       2013-10-17  8061  			    struct nfs4_fs_locations *locations,
a52458b48af142 NeilBrown         2018-12-03  8062  			    struct page *page, const struct cred *cred)
b03d735b4ca237 Chuck Lever       2013-10-17 @8063  {
b03d735b4ca237 Chuck Lever       2013-10-17  8064  	struct nfs_client *clp = server->nfs_client;
b03d735b4ca237 Chuck Lever       2013-10-17  8065  	const struct nfs4_mig_recovery_ops *ops =
b03d735b4ca237 Chuck Lever       2013-10-17  8066  					clp->cl_mvops->mig_recovery_ops;
0688e64bc60038 Trond Myklebust   2019-04-07  8067  	struct nfs4_exception exception = {
0688e64bc60038 Trond Myklebust   2019-04-07  8068  		.interruptible = true,
0688e64bc60038 Trond Myklebust   2019-04-07  8069  	};
b03d735b4ca237 Chuck Lever       2013-10-17  8070  	int status;
b03d735b4ca237 Chuck Lever       2013-10-17  8071  
b03d735b4ca237 Chuck Lever       2013-10-17  8072  	dprintk("%s: FSID %llx:%llx on \"%s\"\n", __func__,
b03d735b4ca237 Chuck Lever       2013-10-17  8073  		(unsigned long long)server->fsid.major,
b03d735b4ca237 Chuck Lever       2013-10-17  8074  		(unsigned long long)server->fsid.minor,
b03d735b4ca237 Chuck Lever       2013-10-17  8075  		clp->cl_hostname);
6f2836341d8a39 Olga Kornievskaia 2022-01-12  8076  	nfs_display_fhandle(fhandle, __func__);
b03d735b4ca237 Chuck Lever       2013-10-17  8077  
b03d735b4ca237 Chuck Lever       2013-10-17  8078  	do {
6f2836341d8a39 Olga Kornievskaia 2022-01-12  8079  		status = ops->get_locations(server, fhandle, locations, page,
6f2836341d8a39 Olga Kornievskaia 2022-01-12  8080  					    cred);
b03d735b4ca237 Chuck Lever       2013-10-17  8081  		if (status != -NFS4ERR_DELAY)
b03d735b4ca237 Chuck Lever       2013-10-17  8082  			break;
b03d735b4ca237 Chuck Lever       2013-10-17  8083  		nfs4_handle_exception(server, status, &exception);
b03d735b4ca237 Chuck Lever       2013-10-17  8084  	} while (exception.retry);
b03d735b4ca237 Chuck Lever       2013-10-17  8085  	return status;
b03d735b4ca237 Chuck Lever       2013-10-17  8086  }
b03d735b4ca237 Chuck Lever       2013-10-17  8087  

:::::: The code at line 8063 was first introduced by commit
:::::: b03d735b4ca2375d2251195cd848713bc55e7d79 NFS: Add method to retrieve fs_locations during migration recovery

:::::: TO: Chuck Lever <chuck.lever@oracle.com>
:::::: CC: Trond Myklebust <Trond.Myklebust@netapp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
