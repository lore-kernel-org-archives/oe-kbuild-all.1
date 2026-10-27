Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793075297;
	b=YKjh/35/xenyOgganIQIMy5YC04c9iY9qSMZIiAnF+g5kqbXzsOyeFAo7H7U6E/f4TuW
	 9TreQ8boD3b0DB2E5Iy+RCg+uA13oFBOMsp4oCir6GaYrZ8XmVKZ4wk3YcsgHm2eDMGFM
	 gQVJ9sCdFK4zOrcnTo/5ny1dW+evSx/QjOXdxgiNerdqYOQX2B0XHJGBl7LJ1bEBzY2bi
	 /q+fljNbuChJbQr/Lr53KqA2Jk6skWPwBS+DZwu6X/Bat0sAz/tIuHxy4OqjqeNI5Aqq3
	 Dtvz7i4QDXfd/fDTn+IpWNXm9Suyhuy86ZE0W4lik6pMUbbiw1ahNdI2hvlS6u8fPIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793075297;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=FxmyJTnrYup8u3Qwm+nl6wQpneqB0xXb8SC8+J21rD4=;
	b=XuQecnzBSMp8g+DNvpVDdf5fZdRx7qxfHnSckH3Kvu0pBd7MAEjnQDxW4e4N+k3HTP54
	 byYIeZm29fIF0n2zZw3Czmc9c0VZman3SQnCmT0o5lVjiRX7TqqHQQLk1xxjE1BW3Rx6P
	 8TUJe/HVyfjP4v4A3u1Mth5IyM5VFJXcW1L4amTT9VMNREHNWSCbjPbf7efR2bsMaA2de
	 s3ATdhMQelcpDXSXuEBVwztXTNL0HnM00O0qKQ1iQMpfT8o0M7tIJrh4MGqnzbgyyWRpD
	 E/0II4bwAaKisl0rrhFb9ny2S7YnFEBhzjlR+DBLuclcyAg18NzF95Qjzu7EAi6QN8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BIRfSYVE;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAB1606A31A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 04:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FAB1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BIRfSYVE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793075296; x=1824611296;
  h=date:from:to:cc:subject:message-id;
  bh=5fNJh8eCtK+KN00+eiUWYiz3rU2exoEIEo2wrDsgXjw=;
  b=BIRfSYVE9dECP9nbzypa6OyEoobxWS/53hvVCxCuuxtZZ4np2uqgqA8Z
   SZnSBBkWVMFQ+O1xGFEE0BQsJaI5q6j7WFGknx9jzzSvVwgOeX0/Nclb6
   7szYU0ILG6COHkboyjbdqqydZ7LGFQGfLfp2GbfPuBgVUyLSKbvSHKid7
   Dp5lwD8X1wjQ53ZsvUAfXyZfJVMLrou+SEx76SPIF+RytgGZBU3UtiFZq
   WWL37ajunoCZSok+fJBBM1ff+IqQa/9mWPom9LsDNkAwq21tBqM+qD6ei
   NOBMBaMTbiAyFp+cNYesE/6IYKszXUXOcxZNGkUYBxjMV4TrA1bmF4E/v
   g==;
X-CSE-ConnectionGUID: SeqsPwG4QHuUMV/ZBCrKpw==
X-CSE-MsgGUID: 6gdknYm6QuWESdkVUMyzKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1767475"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1767475"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 21:28:16 -0700
X-CSE-ConnectionGUID: h+983I/NTAS5YIMC/dTOtg==
X-CSE-MsgGUID: BJuRPUrKRNasWjoYquO0GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4787816"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 26 Oct 2026 21:28:14 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLYnD-000000004OB-1Nt5;
	Tue, 27 Oct 2026 04:28:11 +0000
Date: Tue, 27 Oct 2026 05:27:24 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 0/353]
 drivers/scsi/qla2xxx/qla_dfs.c:521:35: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202610270548.R3vAPeSV-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   6b915aa34a0d468d55e46535173b0d946dfcf9a5
commit: 57c029cab0d908942e3ed9ff9fd0361144d01944 [0/353] scsi: qla2xxx: Move FCE Trace buffer allocation to user control
config: x86_64-randconfig-2302-20261027 (https://download.01.org/0day-ci/archive/20261027/202610270548.R3vAPeSV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610270548.R3vAPeSV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610270548.R3vAPeSV-lkp@intel.com/

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
