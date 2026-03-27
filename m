Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7409E32FA29
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 23:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774655622; cv=none; b=vEs7mHs7pu6xGLCITOSUZiAR/uiFokQbjddIH3Tpxwh8r1aeIbCxe/i+O3xOGrEeBlduujNqMEmhg2cd77raE6nr7N7rGvEGXNc+yCw/y5OMZa7kHk78JimsttFQ66fK9lEq496WQcV7lRkSJeNTFOlbYXoloNtYi93dzfxkSyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774655622; c=relaxed/simple;
	bh=cVoIwrWV4eiu7ul1ElhsMumTCSolrMbRX9v70skgJnY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VFnDG68BvRP6KRrUI0mutuh/siRBNwPKj4Mj7DlM/VUKbsOwFZn0Rk8kIffrb8LlJ9ceQG7ritILeDQkIWB+mUpzOo3F5wEOS6Uhrd+g4A9sm7Fk3THSJd5DZ2QsgMerJT+/4rTk9EvEK0lPx5GQPYxfEnr1NSEq/deo2Ka1pxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e9WILInM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e9WILInM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774655621; x=1806191621;
  h=date:from:to:cc:subject:message-id;
  bh=cVoIwrWV4eiu7ul1ElhsMumTCSolrMbRX9v70skgJnY=;
  b=e9WILInMgVkthUt4S2H016po9m0W2O+d8wBwgyQ0jdoDFctQAtQbxwdU
   fjU9jt2qF/ySbzK9oHHvyQgnxlI+UglwdpYUBEPV508NVWAUwYpym8JVf
   hiPQc36RZFSRdwNEWp6Hu9sVpHZsLIoAiFxkZWL+4FTZkdaUW+GOKPZ2f
   +Npd0DdADzzTQZoJ1Htv5ciVE8EidQb2fJjuYY3p9zuEMKIJpRaE7Q+4Y
   iaNwRyXDINAglZ4yBDS93ikP7xU4fBsdUWPLpvJyFJikKSHt5B/vh2X+3
   KfcpXzfTwLvyNaTj/8Dw9h8H0K1ikBC6+aCqGFfgodzVv9mz1udm5Fi5O
   g==;
X-CSE-ConnectionGUID: oFhfDywsT8qX6doHcl4MZA==
X-CSE-MsgGUID: LqRC32tTSBWZnZk2t4OfdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="63288662"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="63288662"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 16:53:38 -0700
X-CSE-ConnectionGUID: 8DlIKRUNREKNghV09SG+Pg==
X-CSE-MsgGUID: 7jL++pk9R3WEEYGr46IP7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="230238699"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Mar 2026 16:53:36 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6Gze-00000000Atx-027V;
	Fri, 27 Mar 2026 23:53:34 +0000
Date: Sat, 28 Mar 2026 07:52:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 0/2]
 drivers/ufs/core/ufs-mcq.c:608: warning: Function parameter or member 'cmd'
 not described in 'ufshcd_mcq_abort'
Message-ID: <202603280753.sKBIp12W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   5358ce5b12374ccfca58d40797ac7c5dad72ff05
commit: e3d62e38a9d5dde5e491c5aeefffb35d6d71e8df [0/2] FROMLIST: ufs: mcq: Added ufshcd_mcq_abort()
config: i386-buildonly-randconfig-004-20260327 (https://download.01.org/0day-ci/archive/20260328/202603280753.sKBIp12W-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280753.sKBIp12W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280753.sKBIp12W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ufs/core/ufs-mcq.c:483: warning: Function parameter or member 'hba' not described in 'ufshcd_mcq_sq_cleanup'
   drivers/ufs/core/ufs-mcq.c:483: warning: Function parameter or member 'task_tag' not described in 'ufshcd_mcq_sq_cleanup'
   drivers/ufs/core/ufs-mcq.c:541: warning: Function parameter or member 'utrd' not described in 'ufshcd_mcq_nullify_sqe'
   drivers/ufs/core/ufs-mcq.c:564: warning: Function parameter or member 'hba' not described in 'ufshcd_mcq_sqe_search'
   drivers/ufs/core/ufs-mcq.c:564: warning: Function parameter or member 'hwq' not described in 'ufshcd_mcq_sqe_search'
   drivers/ufs/core/ufs-mcq.c:564: warning: Function parameter or member 'task_tag' not described in 'ufshcd_mcq_sqe_search'
>> drivers/ufs/core/ufs-mcq.c:608: warning: Function parameter or member 'cmd' not described in 'ufshcd_mcq_abort'


vim +608 drivers/ufs/core/ufs-mcq.c

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
   541	{
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
   564	{
   565		struct ufshcd_lrb *lrbp = &hba->lrb[task_tag];
   566		struct utp_transfer_req_desc *utrd;
   567		u32 mask = hwq->max_entries - 1;
   568		__le64  cmd_desc_base_addr;
   569		bool ret = false;
   570		u64 addr, match;
   571		u32 sq_head_slot;
   572	
   573		mutex_lock(&hwq->sq_mutex);
   574	
   575		ufshcd_mcq_sq_stop(hba, hwq);
   576		sq_head_slot = ufshcd_mcq_get_sq_head_slot(hwq);
   577		if (sq_head_slot == hwq->sq_tail_slot)
   578			goto out;
   579	
   580		cmd_desc_base_addr = lrbp->utr_descriptor_ptr->command_desc_base_addr;
   581		addr = le64_to_cpu(cmd_desc_base_addr) & CQE_UCD_BA;
   582	
   583		while (sq_head_slot != hwq->sq_tail_slot) {
   584			utrd = hwq->sqe_base_addr +
   585					sq_head_slot * sizeof(struct utp_transfer_req_desc);
   586			match = le64_to_cpu(utrd->command_desc_base_addr) & CQE_UCD_BA;
   587			if (addr == match) {
   588				ufshcd_mcq_nullify_sqe(utrd);
   589				ret = true;
   590				goto out;
   591			}
   592			sq_head_slot = (sq_head_slot + 1) & mask;
   593		}
   594	
   595	out:
   596		ufshcd_mcq_sq_start(hba, hwq);
   597		mutex_unlock(&hwq->sq_mutex);
   598		return ret;
   599	}
   600	
   601	/**
   602	 * ufshcd_mcq_abort - Abort the command in MCQ.
   603	 * @cmd - The command to be aborted.
   604	 *
   605	 * Returns SUCCESS or FAILED error codes
   606	 */
   607	int ufshcd_mcq_abort(struct scsi_cmnd *cmd)
 > 608	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
