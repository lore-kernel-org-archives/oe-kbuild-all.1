Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13309A93E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 21:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682456593; x=1713992593;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HNmp1l3ZAet+UalcixAw4xQVfcIkr69KI/4gsxJQ41I=;
  b=HfjyrY92edwrfuy+WWbXpl4fpGwRzYXfjCcHVJxu2UdSuGkVs+iiRbGM
   dTa5xEq8F3naPk39iuLr3h4weIEc58jkTFTY+dj26JbTe9qQgJCNV9gyP
   HcbZHQQ7L01jSGqYJnHa7lAwd22360CV0aTTJfyNRscxXx1KfCb5TPFjQ
   5M4qy2R53B9B0VDDysePnRcRjpyDN0PAfjxn1uqsOr78cTafBOsFt+DNI
   3qX+NHAguqARQR02GtmILJDMWLKUKs8Q4agII7Euo1/LgzeEuYsvz4QDH
   DcFrTSPPeFk9N4pPfy9W/icnnD8Adth8I75tA/Rb337POI8LHhMXZ374K
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="326503597"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; 
   d="scan'208";a="326503597"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 14:03:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="837600842"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; 
   d="scan'208";a="837600842"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 25 Apr 2023 14:03:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prPoR-000jm2-2b;
	Tue, 25 Apr 2023 21:02:59 +0000
Date: Wed, 26 Apr 2023 05:02:05 +0800
From: kernel test robot <lkp@intel.com>
To: Selvin Xavier <selvin.xavier@broadcom.com>, jgg@ziepe.ca,
	leon@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-rdma@vger.kernel.org,
	andrew.gospodarek@broadcom.com,
	Selvin Xavier <selvin.xavier@broadcom.com>
Subject: Re: [PATCH v2 for-next 3/6] RDMA/bnxt_re: Query function
 capabilities from firmware
Message-ID: <202304260421.Wr6M1Ys9-lkp@intel.com>
References: <1682450993-17711-4-git-send-email-selvin.xavier@broadcom.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1682450993-17711-4-git-send-email-selvin.xavier@broadcom.com>

Hi Selvin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rdma/for-next]
[also build test WARNING on linus/master v6.3 next-20230425]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Selvin-Xavier/RDMA-bnxt_re-Use-the-common-mmap-helper-functions/20230426-033131
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
patch link:    https://lore.kernel.org/r/1682450993-17711-4-git-send-email-selvin.xavier%40broadcom.com
patch subject: [PATCH v2 for-next 3/6] RDMA/bnxt_re: Query function capabilities from firmware
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230426/202304260421.Wr6M1Ys9-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2e3cab6bf041dd376d6aeae617adfdcdd68f8a4b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Selvin-Xavier/RDMA-bnxt_re-Use-the-common-mmap-helper-functions/20230426-033131
        git checkout 2e3cab6bf041dd376d6aeae617adfdcdd68f8a4b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/infiniband/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304260421.Wr6M1Ys9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/hw/bnxt_re/main.c: In function 'bnxt_re_hwrm_qcaps':
>> drivers/infiniband/hw/bnxt_re/main.c:347:37: warning: variable 'cctx' set but not used [-Wunused-but-set-variable]
     347 |         struct bnxt_qplib_chip_ctx *cctx;
         |                                     ^~~~


vim +/cctx +347 drivers/infiniband/hw/bnxt_re/main.c

   340	
   341	/* Query function capabilities using common hwrm */
   342	int bnxt_re_hwrm_qcaps(struct bnxt_re_dev *rdev)
   343	{
   344		struct bnxt_en_dev *en_dev = rdev->en_dev;
   345		struct hwrm_func_qcaps_output resp = {0};
   346		struct hwrm_func_qcaps_input req = {0};
 > 347		struct bnxt_qplib_chip_ctx *cctx;
   348		struct bnxt_fw_msg fw_msg;
   349	
   350		cctx = rdev->chip_ctx;
   351		memset(&fw_msg, 0, sizeof(fw_msg));
   352		bnxt_re_init_hwrm_hdr(rdev, (void *)&req,
   353				      HWRM_FUNC_QCAPS, -1, -1);
   354		req.fid = cpu_to_le16(0xffff);
   355		bnxt_re_fill_fw_msg(&fw_msg, (void *)&req, sizeof(req), (void *)&resp,
   356				    sizeof(resp), DFLT_HWRM_CMD_TIMEOUT);
   357		return bnxt_send_msg(en_dev, &fw_msg);
   358	}
   359	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
