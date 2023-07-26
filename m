Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E3E1FCC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 06:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690351218; x=1721887218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jG5CNtGYatsgZCgEg+CzRd4sB5yWsft+KVf9rdLeGsE=;
  b=Kg5yVPIKaYD5aAFKEg9VU6O2SPjE4t+2ivDQw3pWqouPS6wfUUIUFTQU
   gvUqA+VPm+8I43mHjiixJMVK7n/aoeVfK5TMG9Hk60OiDQGQzCKN6xxH0
   ujGYg9NZsRcxC0aHwYxqnJ3frfdWyVULyZDiafGk8HmfJUgloMsb7cLLA
   lqtVXI5sjTQ2WoaRaz2x7APYbuGDcw6eKuvP0YPYTnOCJ+B2TCwX+uUfo
   LOXD5xFODSMyQhih8R62Dexi5gRLTWOik9LqVUESsPP7Fl2ZthdhsDwjM
   TQPem7tN2Dn9VcE6ZW3aIS7yE4Y28UWGHrwryLUtAG4CwBDyXiVmnAlaK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="398848400"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="398848400"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 22:59:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="729703674"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="729703674"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 25 Jul 2023 22:59:58 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOXYz-0000iH-1G;
	Wed, 26 Jul 2023 05:59:57 +0000
Date: Wed, 26 Jul 2023 13:59:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 109/134] fs/ceph/addr.c:193:25: error:
 invalid use of undefined type 'struct ceph_netfs_request_data'
Message-ID: <202307261330.Ri2WOB43-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   87f4ba57f1150224de9c636607e1c320d21b5f48
commit: 2e7ad1f4bed3c73ced43e438d22dcc563073aee3 [109/134] ceph: fix blindly expanding the readahead windows
config: sh-randconfig-r016-20230725 (https://download.01.org/0day-ci/archive/20230726/202307261330.Ri2WOB43-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261330.Ri2WOB43-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307261330.Ri2WOB43-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ceph/addr.c: In function 'ceph_netfs_expand_readahead':
>> fs/ceph/addr.c:193:25: error: invalid use of undefined type 'struct ceph_netfs_request_data'
     193 |                 if (priv->file_ra_disabled)
         |                         ^~
   fs/ceph/addr.c:196:41: error: invalid use of undefined type 'struct ceph_netfs_request_data'
     196 |                         max_pages = priv->file_ra_pages;
         |                                         ^~


vim +193 fs/ceph/addr.c

   179	
   180	static void ceph_netfs_expand_readahead(struct netfs_read_request *rreq)
   181	{
   182		struct inode *inode = rreq->inode;
   183		struct ceph_inode_info *ci = ceph_inode(inode);
   184		struct ceph_file_layout *lo = &ci->i_layout;
   185		unsigned long max_pages = inode->i_sb->s_bdi->ra_pages;
   186		loff_t end = rreq->start + rreq->len, new_end;
   187		struct ceph_netfs_request_data *priv = rreq->netfs_priv;
   188		unsigned long max_len;
   189		u32 blockoff;
   190	
   191		if (priv) {
   192			/* Readahead is disabled by posix_fadvise POSIX_FADV_RANDOM */
 > 193			if (priv->file_ra_disabled)
   194				max_pages = 0;
   195			else
   196				max_pages = priv->file_ra_pages;
   197	
   198		}
   199	
   200		/* Readahead is disabled */
   201		if (!max_pages)
   202			return;
   203	
   204		max_len = max_pages << PAGE_SHIFT;
   205	
   206		/*
   207		 * Try to expand the length forward by rounding up it to the next
   208		 * block, but do not exceed the file size, unless the original
   209		 * request already exceeds it.
   210		 */
   211		new_end = min(round_up(end, lo->stripe_unit), rreq->i_size);
   212		if (new_end > end && new_end <= rreq->start + max_len)
   213			rreq->len = new_end - rreq->start;
   214	
   215		/* Try to expand the start downward */
   216		div_u64_rem(rreq->start, lo->stripe_unit, &blockoff);
   217		if (rreq->len + blockoff <= max_len) {
   218			rreq->start -= blockoff;
   219			rreq->len += blockoff;
   220		}
   221	}
   222	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
