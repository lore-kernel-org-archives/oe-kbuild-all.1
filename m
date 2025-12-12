Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EF43128CA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 09:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765530710; cv=none; b=SFy0PzhMgagLy6o2wSIBpwx44UwbVA1oMdn37KD1nHbPyk2Jeq5POdFuBPUEmdrvVK3Ql8Eu15KgOcJTQHq/ncRRzVuJav+mN8zu0UHoQZt+I9lzqQ1fFdklbXmXPvZbfBzYjxn/trxnfSekE5KRi5Q5h5BoGZYwHOkhivrGtlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765530710; c=relaxed/simple;
	bh=xmFrG8v1VUJa3/yCkpORhjShI0B9sgqruFW+6ihbwI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K67GDihrrcD7mjheJzLki7+tals3aYyWacCa3YcaKZNqNw3F237vjj6PC1kMCYeaRRjBCQAuSI00y8JMSS7mr6NJM0UImVgyx0Wv/RvvVpMrobmZeJE3wOlGR/yZFG1rgbdfSRi0c3klVe1p3NgoabadrTT9jm0iV8VbrBjWq4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QnKJEVl9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QnKJEVl9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765530708; x=1797066708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xmFrG8v1VUJa3/yCkpORhjShI0B9sgqruFW+6ihbwI8=;
  b=QnKJEVl9BfE+AwvZXi1TxfD8Gj6ASQPIDKp+wy7sJ5FWisrHNLu+m0Jo
   P7VTaRo4Glc4V9Y2q/GzSFvVHrj0L4BThkLReWQkE2grkcqiO0LyhLnBL
   /zxOFf7/wDM2jizrE9oAIdLM9Pev160s9XaZREbpLRLlGoaWoMv/phYgb
   poW5tkunhBvZVfkORElbffr6EOu7ULxDfwQXo0U8MZV7vYqe2gfKih+/u
   b8mrIOxL8gIx8Ahr6bUWMTUcZ9hfv54QESTdcPk190mdlVhzIYdAJMQ0L
   nuAMDaxZDyizv+FiIr7YvrMi1WhWalEqVKtBrD640MnyGHfI23AXuzvCB
   A==;
X-CSE-ConnectionGUID: ZBAp3ZopTQS44p3N3quK3w==
X-CSE-MsgGUID: ijD/IjHPSIqg9hhc9jd+bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67595696"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="67595696"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 01:11:45 -0800
X-CSE-ConnectionGUID: fcmPalicQSy7EmRn2WIviQ==
X-CSE-MsgGUID: e33FEYptR1uPzNkFhE/d1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="197089359"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Dec 2025 01:11:43 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTzBc-000000005qc-16OB;
	Fri, 12 Dec 2025 09:11:40 +0000
Date: Fri, 12 Dec 2025 17:10:47 +0800
From: kernel test robot <lkp@intel.com>
To: Quinn Tran <qutran@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Nilesh Javali <njavali@marvell.com>,
	Himanshu Madhani <himanshu.madhani@oracle.com>
Subject: drivers/scsi/qla2xxx/qla_dfs.c:521:35: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202512121723.Sfe8lVTL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 841df27d619ee1f5ca6473e15227b39d6136562d scsi: qla2xxx: Move FCE Trace buffer allocation to user control
date:   1 year ago
config: i386-randconfig-062-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121723.Sfe8lVTL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121723.Sfe8lVTL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121723.Sfe8lVTL-lkp@intel.com/

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
