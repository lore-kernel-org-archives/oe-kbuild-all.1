Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602E38F73
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 10:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693045178; x=1724581178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d94v3OfNK4yHBGUxcx3qNh138v1viDQnGrMundxNuWQ=;
  b=VIXJ08b9SWaAf7GcLNmkkM0RFKrP/KoCrKd7fwS/5qAbMTW42XTQd1zU
   OAfnsX8FjhvUg3VzbQO/IyBZxyLPeN4JIF2Cw4XsIFO3UXhZjTI7OuSkc
   pt5BZ8tEglUGLHjjfGBgfTsbsrFwURyQ85uD13KTXakFdOjAvy8gc+cJb
   vEa0lqWRG9g0JvSZa05Tuh/WtN/FUg9yGOweaAP75PINrRxKKzcO/3jrk
   sgl54CYQw6rVZBj2ll0RCfH2Jvs73E7HE4RBnrBlDyLI27Eret+/c5Sdj
   amzN5dlOLVpDP1eWjUNeHqWzYf9/HaeTpKE7lQbn680nGUT/pSGI2C3pz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="377601479"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="377601479"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 03:19:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="881425308"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2023 03:19:41 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZqOF-0004bH-1Z;
	Sat, 26 Aug 2023 10:19:35 +0000
Date: Sat, 26 Aug 2023 18:18:41 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 155/167]
 drivers/s390/crypto/zcrypt_msgtype6.c:1170:39: error: use of undeclared
 identifier 'AP_MSG_FLAG_ADMIN'
Message-ID: <202308261835.iFGQGo8Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   9d4510ff70a0941bfdd50e530e365b240f7d64ea
commit: c28383389215cca0a5c3d93f1064725ecca8526d [155/167] s390/zcrypt: do not retry administrative requests
config: s390-randconfig-r015-20230826 (https://download.01.org/0day-ci/archive/20230826/202308261835.iFGQGo8Q-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308261835.iFGQGo8Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308261835.iFGQGo8Q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/s390/crypto/zcrypt_msgtype6.c:1170:39: error: use of undeclared identifier 'AP_MSG_FLAG_ADMIN'
    1170 |         if (rc == -EAGAIN && ap_msg->flags & AP_MSG_FLAG_ADMIN)
         |                                              ^
   drivers/s390/crypto/zcrypt_msgtype6.c:1279:39: error: use of undeclared identifier 'AP_MSG_FLAG_ADMIN'
    1279 |         if (rc == -EAGAIN && ap_msg->flags & AP_MSG_FLAG_ADMIN)
         |                                              ^
   2 errors generated.


vim +/AP_MSG_FLAG_ADMIN +1170 drivers/s390/crypto/zcrypt_msgtype6.c

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
