Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4CC392C2E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 17:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792344656; cv=none; b=if8ziKX2JTZTVq+y9q0mNSagdQgERdk2D/fmObXlOfFGjdzRBuRGXZ/jrqV3cg4T6JjSsbXMmOdr0iafsnGbI/emLniey+dUszJtiT+rKtair5TQLTGgCiAIhmmJRx56UOkFj96st7SnwEJe1gOLjlt8HWmQRH0BkdTyL9ycxxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792344656; c=relaxed/simple;
	bh=BnhKh15CF733e+aKcAAn18aF/AXzWwxrEjAn1aybo30=;
	h=Date:From:To:Cc:Subject:Message-ID; b=flhsapxbjCkkWlXFTWUGcYnppXJfnAzs6h25GihDln3cOokk1+7b91JqCmqI1vhlBCharXHPz8gOKQZW+LI6dQbwcKwnJvSqhgQBIC33V6Iv7+vI89bE9KREJu6WdfOv0C71RcEOaNt3w8Bt1mi/EQenVDvQIm+IS0q+6OWP7Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iun+nTVU; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iun+nTVU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792344654; x=1823880654;
  h=date:from:to:cc:subject:message-id;
  bh=BnhKh15CF733e+aKcAAn18aF/AXzWwxrEjAn1aybo30=;
  b=iun+nTVUKB4ukNZT563Ve1C4wFIDv7hTZOl7WK/4XKWDqMcoS7Bwqm4H
   6ceGpH1NPHr/yHALo+mx2q7napApqE5dv3xgl/kwFOU45o5te6oQstep1
   AyXD7cVXP+54IoTtwmGXrtK46+N21YW59Y6SQdwiy4g6li2lbC7OzH+Ep
   jhdu5yBfM+anBWO3JI6N2gpB7W0NJhiDXm5bE7jGGW9XNP1Wcs2iqlTwb
   yqnFVrZMTCnKW46E1bBJ8/e2dKvssrbOTUoeHXZBuGXb+F6k4MKVgJ/Ns
   sT3qRSRiq+QgfR/6rk/5MMmQouF4PXI+cGkm1ARddCU8pXTZLmst8xiqQ
   g==;
X-CSE-ConnectionGUID: /s6z+kKXTu6tlD/6PtJNzw==
X-CSE-MsgGUID: O/EkHrCXSJyTH2GYW554Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="945117"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="945117"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 10:30:53 -0700
X-CSE-ConnectionGUID: w1jJ+esPQN2IcfOr/e4rUA==
X-CSE-MsgGUID: SATqlaudRQGpcjwLgCLatA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2753758"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 18 Oct 2026 10:30:52 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIUig-000000005Bj-0yQQ;
	Sun, 18 Oct 2026 17:30:50 +0000
Date: Sun, 18 Oct 2026 19:30:13 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 336/336]
 drivers/ufs/core/ufs-mcq.c:483: warning: Function parameter or member 'hba'
 not described in 'ufshcd_mcq_sq_cleanup'
Message-ID: <202610181912.Ynj6xqz2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   85239205a20932568f405bb06f7dc3187e755674
commit: 2bbead6020e69a3f76448635b4f10827ff34307f [336/336] FROMLIST: ufs: mcq: Add supporting functions for mcq abort
config: arm64-randconfig-2000-20261018 (https://download.01.org/0day-ci/archive/20261018/202610181912.Ynj6xqz2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610181912.Ynj6xqz2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610181912.Ynj6xqz2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ufs/core/ufs-mcq.c:483: warning: Function parameter or member 'hba' not described in 'ufshcd_mcq_sq_cleanup'
>> drivers/ufs/core/ufs-mcq.c:483: warning: Function parameter or member 'task_tag' not described in 'ufshcd_mcq_sq_cleanup'
>> drivers/ufs/core/ufs-mcq.c:541: warning: Function parameter or member 'utrd' not described in 'ufshcd_mcq_nullify_sqe'
>> drivers/ufs/core/ufs-mcq.c:564: warning: Function parameter or member 'hba' not described in 'ufshcd_mcq_sqe_search'
>> drivers/ufs/core/ufs-mcq.c:564: warning: Function parameter or member 'hwq' not described in 'ufshcd_mcq_sqe_search'
>> drivers/ufs/core/ufs-mcq.c:564: warning: Function parameter or member 'task_tag' not described in 'ufshcd_mcq_sqe_search'


vim +483 drivers/ufs/core/ufs-mcq.c

   473	
   474	/**
   475	 * ufshcd_mcq_sq_cleanup - Clean up submission queue resources
   476	 * associated with the pending command.
   477	 * @hba - per adapter instance.
   478	 * @task_tag - The command's task tag.
   479	 *
   480	 * Returns 0 for success; error code otherwise.
   481	 */
   482	int ufshcd_mcq_sq_cleanup(struct ufs_hba *hba, int task_tag)
 > 483	{
   484		struct ufshcd_lrb *lrbp = &hba->lrb[task_tag];
   485		struct scsi_cmnd *cmd = lrbp->cmd;
   486		struct ufs_hw_queue *hwq;
   487		void __iomem *reg, *opr_sqd_base;
   488		u32 nexus, id, val;
   489		int err;
   490	
   491		if (task_tag != hba->nutrs - UFSHCD_NUM_RESERVED) {
   492			if (!cmd)
   493				return -EINVAL;
   494			hwq = ufshcd_mcq_req_to_hwq(hba, scsi_cmd_to_rq(cmd));
   495		} else {
   496			hwq = hba->dev_cmd_queue;
   497		}
   498	
   499		id = hwq->id;
   500	
   501		mutex_lock(&hwq->sq_mutex);
   502	
   503		/* stop the SQ fetching before working on it */
   504		err = ufshcd_mcq_sq_stop(hba, hwq);
   505		if (err)
   506			goto unlock;
   507	
   508		/* SQCTI = EXT_IID, IID, LUN, Task Tag */
   509		nexus = lrbp->lun << 8 | task_tag;
   510		opr_sqd_base = mcq_opr_base(hba, OPR_SQD, id);
   511		writel(nexus, opr_sqd_base + REG_SQCTI);
   512	
   513		/* SQRTCy.ICU = 1 */
   514		writel(SQ_ICU, opr_sqd_base + REG_SQRTC);
   515	
   516		/* Poll SQRTSy.CUS = 1. Return result from SQRTSy.RTC */
   517		reg = opr_sqd_base + REG_SQRTS;
   518		err = read_poll_timeout(readl, val, val & SQ_CUS, 20,
   519					MCQ_POLL_US, false, reg);
   520		if (err)
   521			dev_err(hba->dev, "%s: failed. hwq=%d, tag=%d err=%ld\n",
   522				__func__, id, task_tag,
   523				FIELD_GET(SQ_ICU_ERR_CODE_MASK, readl(reg)));
   524	
   525		if (ufshcd_mcq_sq_start(hba, hwq))
   526			err = -ETIMEDOUT;
   527	
   528	unlock:
   529		mutex_unlock(&hwq->sq_mutex);
   530		return err;
   531	}
   532	
   533	/**
   534	 * ufshcd_mcq_nullify_sqe - Nullify the submission queue entry.
   535	 * Write the sqe's Command Type to 0xF. The host controller will not
   536	 * fetch any sqe with Command Type = 0xF.
   537	 *
   538	 * @utrd - UTP Transfer Request Descriptor to be nullified.
   539	 */
   540	static void ufshcd_mcq_nullify_sqe(struct utp_transfer_req_desc *utrd)
 > 541	{
   542		u32 dword_0;
   543	
   544		dword_0 = le32_to_cpu(utrd->header.dword_0);
   545		dword_0 &= ~UPIU_COMMAND_TYPE_MASK;
   546		dword_0 |= FIELD_PREP(UPIU_COMMAND_TYPE_MASK, 0xF);
   547		utrd->header.dword_0 = cpu_to_le32(dword_0);
   548	}
   549	
   550	/**
   551	 * ufshcd_mcq_sqe_search - Search for the command in the submission queue
   552	 * If the command is in the submission queue and not issued to the device yet,
   553	 * nullify the sqe so the host controller will skip fetching the sqe.
   554	 *
   555	 * @hba - per adapter instance.
   556	 * @hwq - Hardware Queue to be searched.
   557	 * @task_tag - The command's task tag.
   558	 *
   559	 * Returns true if the SQE containing the command is present in the SQ
   560	 * (not fetched by the controller); returns false if the SQE is not in the SQ.
   561	 */
   562	static bool ufshcd_mcq_sqe_search(struct ufs_hba *hba,
   563					  struct ufs_hw_queue *hwq, int task_tag)
 > 564	{

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
