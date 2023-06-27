Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3C6EA1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jun 2023 04:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687839177; x=1719375177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZHe3DKGMb6v1R75qFC82a5/JlcB8izt0zLN9dBfD2Cc=;
  b=GIZiMRpwHeBM+kVeFgOkxerN3iKUihJKs6qVF3nnazkAveqrplFXDU5n
   AusdrRP9tPOdI5KyN4++cwZY4FB3coXseSk8A5Bea9DzSh//6PIv1v5LH
   DuBAxdszA5Sqw4j6Ts5RNcfSylng2zXKMolXDgEs4Ffffcu01qCY/jLmk
   WxAkWI5yIzY8kfGY2ikRBh+m0W33eYIfMJteAGo9PzYwkCOwt8YcNEkFa
   ZlqF56nbhhbonA95J1Kb8PItNF6M9YRtdDNhEMoBoHfbq3hoOoaxNA3PR
   yJ4q2xyZajUICbjhqc9+21twP/pYDbe+18vXy1Kat0L7+LpxEroWrF7u8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="360332568"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="360332568"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 21:12:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="829491345"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="829491345"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 26 Jun 2023 21:12:55 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qE04U-000Bhd-36;
	Tue, 27 Jun 2023 04:12:54 +0000
Date: Tue, 27 Jun 2023 12:12:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jan Kara <jack@suse.cz>
Subject: [jlayton:mgctime-next 7/93] fs/inode.c:2513:9: error: implicit
 declaration of function 'inode_set_ctime'; did you mean 'node_set_state'?
Message-ID: <202306271226.ag15jTLR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgctime-next
head:   154d68715278864ebe582de85bd53efc328a429e
commit: b961e9d5d1cc00e5300057fc34118fbb64efd968 [7/93] fs: add ctime accessors infrastructure
config: i386-randconfig-i061-20230625 (https://download.01.org/0day-ci/archive/20230627/202306271226.ag15jTLR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230627/202306271226.ag15jTLR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306271226.ag15jTLR-lkp@intel.com/

Note: the jlayton/mgctime-next HEAD 154d68715278864ebe582de85bd53efc328a429e builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   fs/inode.c: In function 'inode_ctime_set_current':
>> fs/inode.c:2513:9: error: implicit declaration of function 'inode_set_ctime'; did you mean 'node_set_state'? [-Werror=implicit-function-declaration]
    2513 |         inode_set_ctime(inode, now);
         |         ^~~~~~~~~~~~~~~
         |         node_set_state
   cc1: some warnings being treated as errors


vim +2513 fs/inode.c

  2501	
  2502	/**
  2503	 * inode_ctime_set_current - set the ctime to current_time
  2504	 * @inode: inode
  2505	 *
  2506	 * Set the inode->i_ctime to the current value for the inode. Returns
  2507	 * the current value that was assigned to i_ctime.
  2508	 */
  2509	struct timespec64 inode_ctime_set_current(struct inode *inode)
  2510	{
  2511		struct timespec64 now = current_time(inode);
  2512	
> 2513		inode_set_ctime(inode, now);
  2514		return now;
  2515	}
  2516	EXPORT_SYMBOL(inode_ctime_set_current);
  2517	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
