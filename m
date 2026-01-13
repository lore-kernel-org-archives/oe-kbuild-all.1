Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B685138E11C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 11:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768305302; cv=none; b=mWRaXJhHRTCLt90EChx/Sw6DAZiET1Fq+W2dT9X/77Fw6y0lebHD3pam/iY2Gh/wuYlg1pQmSCU6UHHkADiThof79HNYPtJYAbsItGCVxmaujxhkGR0tCimsw/AL6M3hspnUicwFP+7tChehi+Pn3YUFL8nLtNk6TtlXxmXPE4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768305302; c=relaxed/simple;
	bh=uKqzLnRhJDqBS/ZeUjor7SGwJF6cuwdo3d+Fl7Yw/Lo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A9Q3vqPAMWCQ9adtnXxSPQIJQc05GRtDEmnTaUmk3RW0e3yU6fhVzxqk2dEiFskoYsEc15myTu/TjqTjErdWNaCsT5zDD/+PBoMjsmc64Fd2n0Ooh+IVOQF3ciX7ys0vSacANBLa0jynHIgw7qrjGxGCG7UmU6w50QNs6OIZxgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O/PLv1UC; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O/PLv1UC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768305300; x=1799841300;
  h=date:from:to:cc:subject:message-id;
  bh=uKqzLnRhJDqBS/ZeUjor7SGwJF6cuwdo3d+Fl7Yw/Lo=;
  b=O/PLv1UCW0kurfefDiSJyRYPjVGjk4NDajxmM92NvEcG2rLCFuo1k53g
   lnNbyeIhFF9cCMFvwIqf6wquYS5MpJLljs4o58lpvv705YziXQhQ1CPG4
   bDNGpM0II65k6Tdcm3skFZmD7gvvg5OlI0N0mY3JpzB19SUfnCs0Amj1b
   Ryu5x2NzudMTsLh46NB+SbGNoaBDjgPTLU4+Cy4g4GCqOfrm8rU8HTRv7
   w6RwK6/GsKDekVBdDaOapxsBIbEOkLAnI6cm5OfJSkFt6ElhtvJsSWT9d
   xosncHcgn6aHeqRRn7UMqYExVmz2CmzKGyhYAsdOKWkzw1U2KR04wIdzf
   A==;
X-CSE-ConnectionGUID: VV/M4Y48Q0yp4QRluTMGVQ==
X-CSE-MsgGUID: L4xyYE2PTRyUaM8BvBA9cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="95061781"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="95061781"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 03:55:00 -0800
X-CSE-ConnectionGUID: Xpqo+KObQIiVozvR3DZYsQ==
X-CSE-MsgGUID: Am0gQjb3SSuZcfifiCX5qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="209197094"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Jan 2026 03:54:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfcz9-00000000Egw-49YJ;
	Tue, 13 Jan 2026 11:54:55 +0000
Date: Tue, 13 Jan 2026 19:54:49 +0800
From: kernel test robot <lkp@intel.com>
To: Quinn Tran <qutran@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Nilesh Javali <njavali@marvell.com>,
 Himanshu Madhani <himanshu.madhani@oracle.com>
Subject: drivers/scsi/qla2xxx/qla_dfs.c:521:35: sparse: sparse: Using
 plain integer as NULL pointer
Message-ID: <202601131955.wPmFqPoY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: 841df27d619ee1f5ca6473e15227b39d6136562d scsi: qla2xxx: Move FCE Trace buffer allocation to user control
date:   1 year, 1 month ago
config: i386-randconfig-063-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131955.wPmFqPoY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131955.wPmFqPoY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131955.wPmFqPoY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/scsi/qla2xxx/qla_dfs.c:521:35: sparse: sparse: Using plain integer as NULL pointer

vim +521 drivers/scsi/qla2xxx/qla_dfs.c

   495	
   496	static ssize_t
   497	qla2x00_dfs_fce_write(struct file *file, const char __user *buffer,
   498			      size_t count, loff_t *pos)
   499	{
   500		struct seq_file *s = file->private_data;
   501		struct scsi_qla_host *vha = s->private;
   502		struct qla_hw_data *ha = vha->hw;
   503		char *buf;
   504		int rc = 0;
   505		unsigned long enable;
   506	
   507		if (!IS_QLA25XX(ha) && !IS_QLA81XX(ha) && !IS_QLA83XX(ha) &&
   508		    !IS_QLA27XX(ha) && !IS_QLA28XX(ha)) {
   509			ql_dbg(ql_dbg_user, vha, 0xd034,
   510			       "this adapter does not support FCE.");
   511			return -EINVAL;
   512		}
   513	
   514		buf = memdup_user_nul(buffer, count);
   515		if (IS_ERR(buf)) {
   516			ql_dbg(ql_dbg_user, vha, 0xd037,
   517			    "fail to copy user buffer.");
   518			return PTR_ERR(buf);
   519		}
   520	
 > 521		enable = kstrtoul(buf, 0, 0);
   522		rc = count;
   523	
   524		mutex_lock(&ha->fce_mutex);
   525	
   526		if (enable) {
   527			if (ha->flags.user_enabled_fce) {
   528				mutex_unlock(&ha->fce_mutex);
   529				goto out_free;
   530			}
   531			ha->flags.user_enabled_fce = 1;
   532			if (!ha->fce) {
   533				rc = qla2x00_alloc_fce_trace(vha);
   534				if (rc) {
   535					ha->flags.user_enabled_fce = 0;
   536					mutex_unlock(&ha->fce_mutex);
   537					goto out_free;
   538				}
   539	
   540				/* adjust fw dump buffer to take into account of this feature */
   541				if (!ha->flags.fce_dump_buf_alloced)
   542					qla2x00_alloc_fw_dump(vha);
   543			}
   544	
   545			if (!ha->flags.fce_enabled)
   546				qla_enable_fce_trace(vha);
   547	
   548			ql_dbg(ql_dbg_user, vha, 0xd045, "User enabled FCE .\n");
   549		} else {
   550			if (!ha->flags.user_enabled_fce) {
   551				mutex_unlock(&ha->fce_mutex);
   552				goto out_free;
   553			}
   554			ha->flags.user_enabled_fce = 0;
   555			if (ha->flags.fce_enabled) {
   556				qla2x00_disable_fce_trace(vha, NULL, NULL);
   557				ha->flags.fce_enabled = 0;
   558			}
   559	
   560			qla2x00_free_fce_trace(ha);
   561			/* no need to re-adjust fw dump buffer */
   562	
   563			ql_dbg(ql_dbg_user, vha, 0xd04f, "User disabled FCE .\n");
   564		}
   565	
   566		mutex_unlock(&ha->fce_mutex);
   567	out_free:
   568		kfree(buf);
   569		return rc;
   570	}
   571	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
