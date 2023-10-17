Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C262D2EB02
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 21:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l2F59Kie"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697578077; x=1729114077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s3i9WGRU+dWt8xAbJ8jQtCmFkrfgMGhbWmx0dApJKm4=;
  b=l2F59Kie/B9gpM52Ok/KjO4C5MJNaqFgZTWYhC0Gaf+L3n6A1+38rG8q
   RaO259sormQzVj4Vo2l3Hld+l8Iuyyi/mEw3HtkGksgZEKJwjBh/Y1HIl
   aUSoERgCEXi0QiIURbZ2B31n3xhLuKY0uu7x9arnUY2k8qbjt8SrkBtuN
   c7uhSgpVDJsw5lJRQSvyTqKE5BHAaTt9BJ93Lme8TL5Z97KXEHN4lc7dt
   LJlTfj7NgIQFOY3F9c2o53iUQWpb8CxPXLyKUw67TK/3qgOvUJUW/xbV/
   j+5ZpHSnh0mwfhQAEQNHO4L9Q+x+TS0BjWs0NGR6aq5qFxoNFxxuPfCJV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="416982880"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="416982880"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 14:27:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="756305854"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="756305854"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 17 Oct 2023 14:27:55 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsrbV-000A6J-0a;
	Tue, 17 Oct 2023 21:27:53 +0000
Date: Wed, 18 Oct 2023 05:27:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 10366/29113]
 drivers/scsi/ufs/ufshcd.c:6651: warning: Function parameter or member 'hba'
 not described in 'ufshcd_try_to_abort_task'
Message-ID: <202310180541.4WHVslLm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   c8eebb1ab1c0d8d550ddcd3197172b2e86e62e1c
commit: dd77d5a377b9ea395c50cd8d0e890793d8c63731 [10366/29113] BACKPORT: FROMGIT: scsi: ufs: Abort tasks before clearing them from doorbell
config: x86_64-randconfig-004-20231018 (https://download.01.org/0day-ci/archive/20231018/202310180541.4WHVslLm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310180541.4WHVslLm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180541.4WHVslLm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/ufs/ufshcd.c:6411: warning: Function parameter or member 'cmd_type' not described in 'ufshcd_issue_devman_upiu_cmd'
   drivers/scsi/ufs/ufshcd.c:6411: warning: Excess function parameter 'msgcode' description in 'ufshcd_issue_devman_upiu_cmd'
>> drivers/scsi/ufs/ufshcd.c:6651: warning: Function parameter or member 'hba' not described in 'ufshcd_try_to_abort_task'
>> drivers/scsi/ufs/ufshcd.c:6651: warning: Function parameter or member 'tag' not described in 'ufshcd_try_to_abort_task'
>> drivers/scsi/ufs/ufshcd.c:6651: warning: Excess function parameter 'cmd' description in 'ufshcd_try_to_abort_task'


vim +6651 drivers/scsi/ufs/ufshcd.c

  6637	
  6638	/**
  6639	 * ufshcd_try_to_abort_task - abort a specific task
  6640	 * @cmd: SCSI command pointer
  6641	 *
  6642	 * Abort the pending command in device by sending UFS_ABORT_TASK task management
  6643	 * command, and in host controller by clearing the door-bell register. There can
  6644	 * be race between controller sending the command to the device while abort is
  6645	 * issued. To avoid that, first issue UFS_QUERY_TASK to check if the command is
  6646	 * really issued and then try to abort it.
  6647	 *
  6648	 * Returns zero on success, non-zero on failure
  6649	 */
  6650	static int ufshcd_try_to_abort_task(struct ufs_hba *hba, int tag)
> 6651	{
  6652		struct ufshcd_lrb *lrbp = &hba->lrb[tag];
  6653		int err = 0;
  6654		int poll_cnt;
  6655		u8 resp = 0xF;
  6656		u32 reg;
  6657	
  6658		for (poll_cnt = 100; poll_cnt; poll_cnt--) {
  6659			err = ufshcd_issue_tm_cmd(hba, lrbp->lun, lrbp->task_tag,
  6660					UFS_QUERY_TASK, &resp);
  6661			if (!err && resp == UPIU_TASK_MANAGEMENT_FUNC_SUCCEEDED) {
  6662				/* cmd pending in the device */
  6663				dev_err(hba->dev, "%s: cmd pending in the device. tag = %d\n",
  6664					__func__, tag);
  6665				break;
  6666			} else if (!err && resp == UPIU_TASK_MANAGEMENT_FUNC_COMPL) {
  6667				/*
  6668				 * cmd not pending in the device, check if it is
  6669				 * in transition.
  6670				 */
  6671				dev_err(hba->dev, "%s: cmd at tag %d not pending in the device.\n",
  6672					__func__, tag);
  6673				reg = ufshcd_readl(hba, REG_UTP_TRANSFER_REQ_DOOR_BELL);
  6674				if (reg & (1 << tag)) {
  6675					/* sleep for max. 200us to stabilize */
  6676					usleep_range(100, 200);
  6677					continue;
  6678				}
  6679				/* command completed already */
  6680				dev_err(hba->dev, "%s: cmd at tag %d successfully cleared from DB.\n",
  6681					__func__, tag);
  6682				goto out;
  6683			} else {
  6684				dev_err(hba->dev,
  6685					"%s: no response from device. tag = %d, err %d\n",
  6686					__func__, tag, err);
  6687				if (!err)
  6688					err = resp; /* service response error */
  6689				goto out;
  6690			}
  6691		}
  6692	
  6693		if (!poll_cnt) {
  6694			err = -EBUSY;
  6695			goto out;
  6696		}
  6697	
  6698		err = ufshcd_issue_tm_cmd(hba, lrbp->lun, lrbp->task_tag,
  6699				UFS_ABORT_TASK, &resp);
  6700		if (err || resp != UPIU_TASK_MANAGEMENT_FUNC_COMPL) {
  6701			if (!err) {
  6702				err = resp; /* service response error */
  6703				dev_err(hba->dev, "%s: issued. tag = %d, err %d\n",
  6704					__func__, tag, err);
  6705			}
  6706			goto out;
  6707		}
  6708	
  6709		err = ufshcd_clear_cmd(hba, tag);
  6710		if (err)
  6711			dev_err(hba->dev, "%s: Failed clearing cmd at tag %d, err %d\n",
  6712				__func__, tag, err);
  6713	
  6714	out:
  6715		return err;
  6716	}
  6717	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
