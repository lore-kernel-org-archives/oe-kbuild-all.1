Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5712B81ABF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Apr 2024 13:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712928019; cv=none; b=WqAhdVDqZs4qD1zOc9TJzQ9Zv30PqHQnHcAoIFO9xL4yh0K+2s+s9Km4tagMXhk3+d+/WGkIOPuGadw/kUo0IPByrW4LMZLVaGXfwD+5vD9CgCRLL4EOOdn7cJQ7muIRfLowA8g0gMVdKOIb9GXReqqk109Gsz8x6LBkan/w2fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712928019; c=relaxed/simple;
	bh=TCWicq675Q+KY0VByUGs1cfi9adJAiWeUQxC1C9dHXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IvJUZPBdRU+pFuDc9Ib2mgNxoJDiqr01G/ANXBnVigMm/pVG4lUe/uTJi0U/ImQ42Yi7G8raRGdv/BLupooz/1LW41jIiARw+Xa4FrLg67JIKhgJ4f924yBS11WAcPx5IKbvdfmLl4i5FUeE8eoLVwk/Ye4o2cXYo8i7T5VWPA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KGdaDc/r; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KGdaDc/r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712928018; x=1744464018;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TCWicq675Q+KY0VByUGs1cfi9adJAiWeUQxC1C9dHXA=;
  b=KGdaDc/r0/vNn0s3UcTlf5WGFBXYB1Oey9+Z7qXXqQNR/HhTitVLT7v3
   TedXW73Cm29zeF/fwHCtwcLICfJVwJ3bWr0TfGpscbPByzcMBhjgb/KEU
   tn0FpKQn0W6ZpCiBgWKkWnTgzYA0uiAOpUy6lMxwGVQj4iXuDm0/JGN82
   6xbaAZJV+KeMsU85tNhe3xmjFKfSuqjR2QFc9S3T7ZkSxTnrTODsfNmLB
   llzVgCpAHdGreLepG0A4jWQt4vpqPd01KFIXPif1aS3odLi4Gl1qn8Yiz
   LYzpwS2LdLfxls/D9+YlqiHqyg4qEUCW9hOMf0EHOF++TiI+Mhe4O3P3P
   Q==;
X-CSE-ConnectionGUID: WxtPnx72RzSik3kz9MEqyw==
X-CSE-MsgGUID: Y6+e98PYTUiIx443bBCqIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19775855"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="19775855"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 06:20:15 -0700
X-CSE-ConnectionGUID: s5JyuX/ET1y+s/ILBIGzmw==
X-CSE-MsgGUID: d9MPNIaiSEq6WAZhX3wCsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="21211606"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Apr 2024 06:20:13 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvGp9-0009mz-14;
	Fri, 12 Apr 2024 13:20:11 +0000
Date: Fri, 12 Apr 2024 21:19:18 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/4] scsi: ufs: Make the polling code report which
 command has been completed
Message-ID: <202404122115.KtVU7OGe-lkp@intel.com>
References: <20240412000246.1167600-4-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412000246.1167600-4-bvanassche@acm.org>

Hi Bart,

kernel test robot noticed the following build errors:

[auto build test ERROR on mkp-scsi/for-next]
[also build test ERROR on jejb-scsi/for-next linus/master v6.9-rc3 next-20240412]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bart-Van-Assche/scsi-ufs-Declare-ufshcd_mcq_poll_cqe_lock-once/20240412-080540
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20240412000246.1167600-4-bvanassche%40acm.org
patch subject: [PATCH 3/4] scsi: ufs: Make the polling code report which command has been completed
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240412/202404122115.KtVU7OGe-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404122115.KtVU7OGe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404122115.KtVU7OGe-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/ufs/host/ufs-mediatek.c: In function 'ufs_mtk_mcq_intr':
>> drivers/ufs/host/ufs-mediatek.c:1717:17: error: too few arguments to function 'ufshcd_mcq_poll_cqe_lock'
    1717 |                 ufshcd_mcq_poll_cqe_lock(hba, hwq);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/ufs/host/ufs-mediatek.c:23:
   include/ufs/ufshcd.h:1267:15: note: declared here
    1267 | unsigned long ufshcd_mcq_poll_cqe_lock(struct ufs_hba *hba,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/ufshcd_mcq_poll_cqe_lock +1717 drivers/ufs/host/ufs-mediatek.c

e152a616c88653 Po-Wen Kao 2023-07-01  1701  
e152a616c88653 Po-Wen Kao 2023-07-01  1702  static irqreturn_t ufs_mtk_mcq_intr(int irq, void *__intr_info)
e152a616c88653 Po-Wen Kao 2023-07-01  1703  {
e152a616c88653 Po-Wen Kao 2023-07-01  1704  	struct ufs_mtk_mcq_intr_info *mcq_intr_info = __intr_info;
e152a616c88653 Po-Wen Kao 2023-07-01  1705  	struct ufs_hba *hba = mcq_intr_info->hba;
e152a616c88653 Po-Wen Kao 2023-07-01  1706  	struct ufs_hw_queue *hwq;
e152a616c88653 Po-Wen Kao 2023-07-01  1707  	u32 events;
e152a616c88653 Po-Wen Kao 2023-07-01  1708  	int qid = mcq_intr_info->qid;
e152a616c88653 Po-Wen Kao 2023-07-01  1709  
e152a616c88653 Po-Wen Kao 2023-07-01  1710  	hwq = &hba->uhq[qid];
e152a616c88653 Po-Wen Kao 2023-07-01  1711  
e152a616c88653 Po-Wen Kao 2023-07-01  1712  	events = ufshcd_mcq_read_cqis(hba, qid);
e152a616c88653 Po-Wen Kao 2023-07-01  1713  	if (events)
e152a616c88653 Po-Wen Kao 2023-07-01  1714  		ufshcd_mcq_write_cqis(hba, events, qid);
e152a616c88653 Po-Wen Kao 2023-07-01  1715  
e152a616c88653 Po-Wen Kao 2023-07-01  1716  	if (events & UFSHCD_MCQ_CQIS_TAIL_ENT_PUSH_STS)
e152a616c88653 Po-Wen Kao 2023-07-01 @1717  		ufshcd_mcq_poll_cqe_lock(hba, hwq);
e152a616c88653 Po-Wen Kao 2023-07-01  1718  
e152a616c88653 Po-Wen Kao 2023-07-01  1719  	return IRQ_HANDLED;
e152a616c88653 Po-Wen Kao 2023-07-01  1720  }
e152a616c88653 Po-Wen Kao 2023-07-01  1721  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
