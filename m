Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AF518D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 00:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693010992; x=1724546992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q175luwHx5038P0HnyemLJSqPjZsZ5FyyPuU1t0GWhM=;
  b=KvqFPLJ0oA8+9/QN5hWjJ4h8LA9Ma5RkEyIt35K80gldOrmA2awaVGeS
   VyUlK8OvfcDUBQrhnqMjstvoYnCoDhI3Ja+by2GQlhd63KbLXJ0ojMiGc
   Fz5PGeWmnry9Xq1BaH3gFdjnLLw5w3IFTLqqP7yfUhkl6GE7RhM49DRKE
   jJqOBOC+vHUMn/4McnfM4za+kFk6+t4jZCiEXwa0ldkAgUB/JXJ96l2A0
   2nRC4jXJR2QwSTcWviKJMLkfkRcz9fLrDsRPfVpkVU1hRSHoawWp9OOgC
   MP2xtU8uOJ7rAkf3VC55oJqavOjEMDWhNEBAUMBrGLISiQWxn3t3+xaw+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="461197822"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="461197822"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 17:49:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="984281662"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="984281662"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 25 Aug 2023 17:49:50 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZhUr-0004BL-28;
	Sat, 26 Aug 2023 00:49:49 +0000
Date: Sat, 26 Aug 2023 08:49:14 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 155/167]
 drivers/s390/crypto/zcrypt_msgtype6.c:1170:46: error: 'AP_MSG_FLAG_ADMIN'
 undeclared; did you mean 'AP_MSG_FLAG_SPECIAL'?
Message-ID: <202308260818.BzY4jnjq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   b0877f85780f9385c158a9ccc1c8cabd63ababf8
commit: c28383389215cca0a5c3d93f1064725ecca8526d [155/167] s390/zcrypt: do not retry administrative requests
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230826/202308260818.BzY4jnjq-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260818.BzY4jnjq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260818.BzY4jnjq-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/s390/crypto/zcrypt_msgtype6.c: In function 'zcrypt_msgtype6_send_cprb':
>> drivers/s390/crypto/zcrypt_msgtype6.c:1170:46: error: 'AP_MSG_FLAG_ADMIN' undeclared (first use in this function); did you mean 'AP_MSG_FLAG_SPECIAL'?
    1170 |         if (rc == -EAGAIN && ap_msg->flags & AP_MSG_FLAG_ADMIN)
         |                                              ^~~~~~~~~~~~~~~~~
         |                                              AP_MSG_FLAG_SPECIAL
   drivers/s390/crypto/zcrypt_msgtype6.c:1170:46: note: each undeclared identifier is reported only once for each function it appears in
   drivers/s390/crypto/zcrypt_msgtype6.c: In function 'zcrypt_msgtype6_send_ep11_cprb':
   drivers/s390/crypto/zcrypt_msgtype6.c:1279:46: error: 'AP_MSG_FLAG_ADMIN' undeclared (first use in this function); did you mean 'AP_MSG_FLAG_SPECIAL'?
    1279 |         if (rc == -EAGAIN && ap_msg->flags & AP_MSG_FLAG_ADMIN)
         |                                              ^~~~~~~~~~~~~~~~~
         |                                              AP_MSG_FLAG_SPECIAL


vim +1170 drivers/s390/crypto/zcrypt_msgtype6.c

  1142	
  1143	/*
  1144	 * The request distributor calls this function if it picked the CEXxC
  1145	 * device to handle a send_cprb request.
  1146	 * @zq: pointer to zcrypt_queue structure that identifies the
  1147	 *	CEXxC device to the request distributor
  1148	 * @xcRB: pointer to the send_cprb request buffer
  1149	 */
  1150	static long zcrypt_msgtype6_send_cprb(bool userspace, struct zcrypt_queue *zq,
  1151					      struct ica_xcRB *xcRB,
  1152					      struct ap_message *ap_msg)
  1153	{
  1154		int rc;
  1155		struct response_type *rtype = (struct response_type *)(ap_msg->private);
  1156	
  1157		init_completion(&rtype->work);
  1158		rc = ap_queue_message(zq->queue, ap_msg);
  1159		if (rc)
  1160			goto out;
  1161		rc = wait_for_completion_interruptible(&rtype->work);
  1162		if (rc == 0) {
  1163			rc = ap_msg->rc;
  1164			if (rc == 0)
  1165				rc = convert_response_xcrb(userspace, zq, ap_msg, xcRB);
  1166		} else
  1167			/* Signal pending. */
  1168			ap_cancel_message(zq->queue, ap_msg);
  1169	
> 1170		if (rc == -EAGAIN && ap_msg->flags & AP_MSG_FLAG_ADMIN)
  1171			rc = -EIO; /* do not retry administrative requests */
  1172	
  1173	out:
  1174		return rc;
  1175	}
  1176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
