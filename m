Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D063C5CB9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jun 2023 15:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685891752; x=1717427752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OTLlpsxtHurBkC0pL0fQE8k92Sl9AVNggSvV+YpNbhY=;
  b=B1SHrWC/qXCTZYkXoEQq2eeEJwRsV1JV6iS0urxzT56Wn441rhJC/9oc
   w4Pdl1yReS1+d5GSHoBMLAlCW9Xdk8DK5qidbyqjrppdKfO/jdUqlInfr
   f47URpgC2Qpo81OkV0ufjdRlSxS14Fk0+Xo7w+fa2eczsi7ae0RTqMhbz
   HspfubU+zJdraR2Ay0Ykn7b3YUBmYbFW/husaDbiVQYTPZ4QlSpoBqzYa
   gsd+NCYKtkOz8Jz7/dcZjKsm4Pe5adA+8P4HU0gwCSzwbCDRDia9brt93
   MM1xBieiJOPJ7a7cE7cma08bwRppJsgs06D7HfvvNuVDNdbLn3m7RjtGI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="345784700"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="345784700"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 08:15:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="702505597"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="702505597"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 04 Jun 2023 08:15:51 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5pSQ-0002yF-1M;
	Sun, 04 Jun 2023 15:15:50 +0000
Date: Sun, 4 Jun 2023 23:15:15 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.4 19/79]
 drivers/infiniband/hw/bnxt_re/ib_verbs.c:1289:37: warning: variable
 'dev_attr' set but not used
Message-ID: <202306042331.lNt6gLLg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.4
head:   e224ead9931a98988ee0bbe416e77e43f8636527
commit: ee38671133091dd9f8f866e4aab22c80769eb440 [19/79] RDMA/bnxt_re: Refactor queue pair creation code
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230604/202306042331.lNt6gLLg-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=ee38671133091dd9f8f866e4aab22c80769eb440
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.4
        git checkout ee38671133091dd9f8f866e4aab22c80769eb440
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/infiniband/hw/bnxt_re/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306042331.lNt6gLLg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/hw/bnxt_re/ib_verbs.c: In function 'bnxt_re_create_gsi_qp':
>> drivers/infiniband/hw/bnxt_re/ib_verbs.c:1289:37: warning: variable 'dev_attr' set but not used [-Wunused-but-set-variable]
    1289 |         struct bnxt_qplib_dev_attr *dev_attr;
         |                                     ^~~~~~~~


vim +/dev_attr +1289 drivers/infiniband/hw/bnxt_re/ib_verbs.c

  1285	
  1286	static int bnxt_re_create_gsi_qp(struct bnxt_re_qp *qp, struct bnxt_re_pd *pd,
  1287					 struct ib_qp_init_attr *init_attr)
  1288	{
> 1289		struct bnxt_qplib_dev_attr *dev_attr;
  1290		struct bnxt_re_dev *rdev;
  1291		struct bnxt_qplib_qp *qplqp;
  1292		int rc = 0;
  1293	
  1294		rdev = qp->rdev;
  1295		qplqp = &qp->qplib_qp;
  1296		dev_attr = &rdev->dev_attr;
  1297	
  1298		qplqp->rq_hdr_buf_size = BNXT_QPLIB_MAX_QP1_RQ_HDR_SIZE_V2;
  1299		qplqp->sq_hdr_buf_size = BNXT_QPLIB_MAX_QP1_SQ_HDR_SIZE_V2;
  1300	
  1301		rc = bnxt_qplib_create_qp1(&rdev->qplib_res, qplqp);
  1302		if (rc) {
  1303			dev_err(rdev_to_dev(rdev), "create HW QP1 failed!");
  1304			goto out;
  1305		}
  1306	
  1307		rc = bnxt_re_create_shadow_gsi(qp, pd);
  1308	out:
  1309		return rc;
  1310	}
  1311	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
