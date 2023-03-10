Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522657B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 04:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678421394; x=1709957394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g3Tb+uWuXeSPqJwy9zDFXM3D6FPztaBc+O+oAmer8ww=;
  b=EkZ7One8V1zvixgWN1F4WpCaiGfT2gxsk53wzbMr8qQAKz9yeXDDqHkl
   wX40Ez3hvyqcZlgBeyZLHrlWO3nRfjmxWWIrhLI841xBkwoLcQnGHa7Mq
   gLpRAGge4FUqeqLXVCqfy9vU9Lym3aN3i74LoyrIVJSvBJPjDXVEfWjRd
   nempOH5DTkLoYv1tOQyfN8xpOhmM88jq6cAWp7fVln4r5m3J1oPH1UZ++
   DPtc96LW6W5r/QCZIRzqfPhvFmPtZyUd11v26IR4+gF7Ov6lwRjzYEKvN
   oqo7pvPY7aYVP/oQS1M1/SlGYodQMcYSpLuUo00nXXh59rN6BBAvM5M2n
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="364293030"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="364293030"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 20:09:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="923523148"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="923523148"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Mar 2023 20:09:52 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paU4m-0003Tl-0e;
	Fri, 10 Mar 2023 04:09:52 +0000
Date: Fri, 10 Mar 2023 12:09:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 6/6]
 drivers/scsi/ufs/ufshcd.c:8821:27: warning: variable 'scmd' set but not used
Message-ID: <202303101237.1cYMUnec-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   174add77871fae6fc97f2e8a6dcaa15541b4077b
commit: 174add77871fae6fc97f2e8a6dcaa15541b4077b [6/6] UPSTREAM: scsi: ufs: Introduce the function ufshcd_execute_start_stop()
config: x86_64-randconfig-a011 (https://download.01.org/0day-ci/archive/20230310/202303101237.1cYMUnec-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.10
        git checkout 174add77871fae6fc97f2e8a6dcaa15541b4077b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/scsi/ufs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303101237.1cYMUnec-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/ufs/ufshcd.c: In function 'ufshcd_execute_start_stop':
>> drivers/scsi/ufs/ufshcd.c:8821:27: warning: variable 'scmd' set but not used [-Wunused-but-set-variable]
    8821 |         struct scsi_cmnd *scmd;
         |                           ^~~~
   At top level:
   drivers/scsi/ufs/ufshcd.c:150:13: warning: 'system_suspending' defined but not used [-Wunused-variable]
     150 | static bool system_suspending;
         |             ^~~~~~~~~~~~~~~~~


vim +/scmd +8821 drivers/scsi/ufs/ufshcd.c

  8813	
  8814	static int ufshcd_execute_start_stop(struct scsi_device *sdev,
  8815					     enum ufs_dev_pwr_mode pwr_mode,
  8816					     struct scsi_sense_hdr *sshdr)
  8817	{
  8818		unsigned char cdb[6] = { START_STOP, 0, 0, 0, pwr_mode << 4, 0 };
  8819		struct request *req;
  8820		struct scsi_request *rq;
> 8821		struct scsi_cmnd *scmd;
  8822		int ret;
  8823	
  8824		req = blk_get_request(sdev->request_queue, REQ_OP_SCSI_IN,
  8825				      BLK_MQ_REQ_PM);
  8826		if (IS_ERR(req))
  8827			return PTR_ERR(req);
  8828		rq = scsi_req(req);
  8829	
  8830		scmd = blk_mq_rq_to_pdu(req);
  8831		rq->cmd_len = COMMAND_SIZE(cdb[0]);
  8832		memcpy(rq->cmd, cdb, rq->cmd_len);
  8833		rq->retries = 0;
  8834		req->timeout = 1 * HZ;
  8835		req->rq_flags |= RQF_PM | RQF_QUIET;
  8836	
  8837		blk_execute_rq(req->q, NULL, req, /*at_head=*/true);
  8838	
  8839		if (sshdr)
  8840			scsi_normalize_sense(rq->sense, rq->sense_len, sshdr);
  8841		ret = rq->result;
  8842	
  8843		blk_put_request(req);
  8844	
  8845		return ret;
  8846	}
  8847	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
