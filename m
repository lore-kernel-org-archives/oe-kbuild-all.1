Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C512F3A8F4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 19:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NoTwRqod"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700077572; x=1731613572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v0s9Qj/S2hf8yaJEDOD2sO2ksek5SA3/tKx574pwuiE=;
  b=NoTwRqod4xYZIVFCRzdDaAW2zFMF/zwfmM2XAw/JjavG4gE1RdwiFaSU
   lS0RZXZGeW56xuFdIAt96xKN3BE8TLUWUaaY8BzmImgqSUHlqGmvxqazk
   PiSesltE/srILmIEONjlEkIMTlLzAAoMDAxCvqvbh1RftMYVA3kmP7zib
   E//gSOj2E+0qa5AiV61TvoNItfDf109bgCJyVZ0lBgPZXwdOcOECzvjMc
   841QtjdpT3P+NUlECLB9p8s0dHIKiiRcI60xySrmovEV9ha+8bBHRBhhe
   9FIGj2p39RQN1njxhBqjU7ofcLsCXjzPep5PwJFPb/XeR9gji7gsceBsv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="4022458"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="4022458"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 11:46:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="714966020"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="714966020"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Nov 2023 11:46:08 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3Lpt-0000lY-2H;
	Wed, 15 Nov 2023 19:46:05 +0000
Date: Thu, 16 Nov 2023 03:45:51 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 32/60] fs/xfs/xfs_quota.h:171:10: error:
 parameter name omitted
Message-ID: <202311160333.ACq7OCIA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   1f3ae3d354c278bed39a2951003c1411ebf428eb
commit: 55c775f7f07c2222007068a151e3808734654259 [32/60] xfs: turn the xfs_trans_mod_dquot_byino stub into an inline function
config: i386-randconfig-016-20231116 (https://download.01.org/0day-ci/archive/20231116/202311160333.ACq7OCIA-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160333.ACq7OCIA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311160333.ACq7OCIA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/xfs/libxfs/xfs_imeta.c:20:0:
   fs/xfs/xfs_quota.h: In function 'xfs_trans_mod_dquot_byino':
>> fs/xfs/xfs_quota.h:171:10: error: parameter name omitted
      struct xfs_inode *ip, uint, int64_t)
             ^~~~~~~~~
>> fs/xfs/xfs_quota.h:171:10: error: parameter name omitted


vim +171 fs/xfs/xfs_quota.h

   156	
   157	#else
   158	static inline int
   159	xfs_qm_vop_dqalloc(struct xfs_inode *ip, kuid_t kuid, kgid_t kgid,
   160			prid_t prid, uint flags, struct xfs_dquot **udqp,
   161			struct xfs_dquot **gdqp, struct xfs_dquot **pdqp)
   162	{
   163		*udqp = NULL;
   164		*gdqp = NULL;
   165		*pdqp = NULL;
   166		return 0;
   167	}
   168	#define xfs_trans_dup_dqinfo(tp, tp2)
   169	#define xfs_trans_free_dqinfo(tp)
   170	static inline void xfs_trans_mod_dquot_byino(struct xfs_trans *tp,
 > 171			struct xfs_inode *ip, uint, int64_t)
   172	{
   173	}
   174	#define xfs_trans_apply_dquot_deltas(tp)
   175	#define xfs_trans_unreserve_and_mod_dquots(tp)
   176	static inline int xfs_trans_reserve_quota_nblks(struct xfs_trans *tp,
   177			struct xfs_inode *ip, int64_t dblocks, int64_t rblocks,
   178			bool force)
   179	{
   180		return 0;
   181	}
   182	static inline int xfs_trans_reserve_quota_bydquots(struct xfs_trans *tp,
   183			struct xfs_mount *mp, struct xfs_dquot *udqp,
   184			struct xfs_dquot *gdqp, struct xfs_dquot *pdqp,
   185			int64_t nblks, long nions, uint flags)
   186	{
   187		return 0;
   188	}
   189	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
