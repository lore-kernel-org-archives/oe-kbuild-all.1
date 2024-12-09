Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1845A14F9F3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 03:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733716328; cv=none; b=QZ643pyP9mi2XUC5BV/l+1G+QqFhx9ZvsRQYdf7BsVgOHfJLB/2g6j0CDsYtV8P37Q9vQg19yXOBNM6xT3rTzp92fKrSTthToWqRprRI1cng6+1RiReX+Vc/Jyc/Lpq5AKiIL2NVbUpyiyvBiOmRY+9RH5Ia/KMOYx2jV6rDkGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733716328; c=relaxed/simple;
	bh=P5XRkNvMKRYHZ8Ns4Bk12Nve8VwdCD0BVBbp/U2vPLE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fh9t3cFW72kigY7pGaf3HL2IHgHFqsbPaYiUzFmU9xeXBrcuCeIOyL6KecVgGEU5ipcXwmHmVyyu6U1Mhs4763avlNqAv5dWyrdsT3FZr1FGR9aSbnfMPd5FoGS2AtRpPPzVpIDnvJ8+1VplgY5bBFWfueuO6AH+CfJGMGXUHjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E+paGeRu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E+paGeRu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733716327; x=1765252327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P5XRkNvMKRYHZ8Ns4Bk12Nve8VwdCD0BVBbp/U2vPLE=;
  b=E+paGeRu0JtDNQK2XWemyJgfI82U8zzFHLZh8IWHoiNL010G2kEoEAUm
   h8gqsIJCj3XFYT5uC6E06E4sD9rcI6iDudE1BQ4Fpke2aiDrQ/Cu5rBzf
   JJNY9FisI/Gmcmn5PNJk8pSn9q96XCR25dZChBzxhTvSk2cFfXwfTZno6
   mM8wB8o1bONlaV0zlhZRGyPWJof80qJBSD/HDiEc50Kvnj9dLeiPKeytL
   +pw26TgY1G5I+Aaj+JNsHRUfWOwgN0xoxC8Rgyuth3FWxTo+euXXyEWRk
   OKBKgaNml/3jCNBYTE4EaOFPK7sZJsQcEYKivLzDC7yUR/XMR2dC8R3jj
   w==;
X-CSE-ConnectionGUID: McHvnPJ9QsmClV0J5/+lnA==
X-CSE-MsgGUID: zYccCaARSRiK+FdRTM9Jbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="59401555"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="59401555"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 19:52:04 -0800
X-CSE-ConnectionGUID: e2RISkpuT0+c3jblT7R/8Q==
X-CSE-MsgGUID: tX5o4kg2RSOrv7ZIpkAlSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="100000435"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Dec 2024 19:52:03 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKUoS-0003kv-1K;
	Mon, 09 Dec 2024 03:52:00 +0000
Date: Mon, 9 Dec 2024 11:51:32 +0800
From: kernel test robot <lkp@intel.com>
To: Quinn Tran <qutran@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Nilesh Javali <njavali@marvell.com>,
	Himanshu Madhani <himanshu.madhani@oracle.com>
Subject: [linux-next:master 1743/2462] drivers/scsi/qla2xxx/qla_dfs.c:521:35:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202412070850.dpNOEFNT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ebe1b11614e079c5e366ce9bd3c8f44ca0fbcc1b
commit: 841df27d619ee1f5ca6473e15227b39d6136562d [1743/2462] scsi: qla2xxx: Move FCE Trace buffer allocation to user control
config: i386-randconfig-061-20241207 (https://download.01.org/0day-ci/archive/20241207/202412070850.dpNOEFNT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412070850.dpNOEFNT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070850.dpNOEFNT-lkp@intel.com/

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
