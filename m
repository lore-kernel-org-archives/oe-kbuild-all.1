Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C954715C1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 00:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674174812; x=1705710812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P02MsSuYzK8SH4UyL8vWyRzzGP2ubjOFJrh5Qlt85t0=;
  b=JShLqQIPwizGX/P2jf8vYjHEnfdthNQrsRtrROCJcA02gFI36bSOgHmP
   E5oilzGIipT9It1Lhy8XxNrP6cnMa7b5MRYk3YCUG1zBck+KC8aUwV9/x
   Un9WYCInWXg327SLqL7ePJUU1rN2GmcAjyu8YJJzr11hS7WEhW8sxrJy6
   QI7aR0Eu0l1O5UH0dvjwZNIfZfMCmabxB9tjWxp1VgDWRm+K6jdcTYDTl
   5sNanmqzoepTvTxGjdLwUsnzE8gE3JOjyf2t/Nr08JJyN6wA7SJ1k8h3A
   sX/2sUYPYDnnMgLkonZd/Hl5GkrapLdhV/RrJp7GN3h7cZOWlWaM5BTGy
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="389989764"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="389989764"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 16:33:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="653603418"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="653603418"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 19 Jan 2023 16:33:31 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIfLW-000216-0p;
	Fri, 20 Jan 2023 00:33:30 +0000
Date: Fri, 20 Jan 2023 08:33:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:for-next 16/16] io_uring/msg_ring.c:79:21: warning:
 variable 'flags' set but not used
Message-ID: <202301200837.IdLDCuui-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
head:   15fa664f1d8476bb1c28e80eb2bbd547a15201f4
commit: 15fa664f1d8476bb1c28e80eb2bbd547a15201f4 [16/16] Merge branch 'for-6.3/io_uring' into for-next
config: i386-randconfig-a003 (https://download.01.org/0day-ci/archive/20230120/202301200837.IdLDCuui-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?id=15fa664f1d8476bb1c28e80eb2bbd547a15201f4
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block for-next
        git checkout 15fa664f1d8476bb1c28e80eb2bbd547a15201f4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   io_uring/msg_ring.c: In function 'io_msg_tw_complete':
>> io_uring/msg_ring.c:79:21: warning: variable 'flags' set but not used [-Wunused-but-set-variable]
      79 |                 u32 flags = 0;
         |                     ^~~~~


vim +/flags +79 io_uring/msg_ring.c

    68	
    69	static void io_msg_tw_complete(struct callback_head *head)
    70	{
    71		struct io_msg *msg = container_of(head, struct io_msg, tw);
    72		struct io_kiocb *req = cmd_to_io_kiocb(msg);
    73		struct io_ring_ctx *target_ctx = req->file->private_data;
    74		int ret = 0;
    75	
    76		if (current->flags & PF_EXITING) {
    77			ret = -EOWNERDEAD;
    78		} else {
  > 79			u32 flags = 0;
    80	
    81			if (msg->flags & IORING_MSG_RING_FLAGS_PASS)
    82				flags = msg->cqe_flags;
    83	
    84			/*
    85			 * If the target ring is using IOPOLL mode, then we need to be
    86			 * holding the uring_lock for posting completions. Other ring
    87			 * types rely on the regular completion locking, which is
    88			 * handled while posting.
    89			 */
    90			if (target_ctx->flags & IORING_SETUP_IOPOLL)
    91				mutex_lock(&target_ctx->uring_lock);
    92			if (!io_post_aux_cqe(target_ctx, msg->user_data, msg->len, 0))
    93				ret = -EOVERFLOW;
    94			if (target_ctx->flags & IORING_SETUP_IOPOLL)
    95				mutex_unlock(&target_ctx->uring_lock);
    96		}
    97	
    98		if (ret < 0)
    99			req_set_fail(req);
   100		io_req_queue_tw_complete(req, ret);
   101	}
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
