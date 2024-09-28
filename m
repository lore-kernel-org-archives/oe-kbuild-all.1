Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A7719E7E4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 09:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727514431; cv=none; b=ldcKLog2iKqBe4omxz+HR5oQ/KZS3Sq/Iw6HQ7MQWFIFPzke929LnqWxE6d41K42/Y2Bugn4UdSkj+2ch7VxhutquZuezjX+zmnaXGBRHPlSZNAL4uO4ZOC9F2hpyU2yEu64VOiWm0pPkXXJDw9dc0s/lz5XoI86WAvBWFhSldg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727514431; c=relaxed/simple;
	bh=zBmiZAE4Hv3roydCNLdLfFAi/4warXAQzE6aqplCEXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jbUrabkmSWuZ/rC8o5tSap6iSJSof9i+ZsjzCnkvmlrazeecMk3gAbtHXXVTMyjJPKjkSPThNRJ5CKIgMAOI6bplL8clvpklxvgRkYwN5Cgpl/CsHtgIQHb3IbGugQzV9MuxFdL1ia3hFUVyof78B39yuAdWoEJU+3O9ao/Gpts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQ91g/Xf; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQ91g/Xf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727514430; x=1759050430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zBmiZAE4Hv3roydCNLdLfFAi/4warXAQzE6aqplCEXk=;
  b=QQ91g/Xf7f1Kc+SrghqZJup8j9/33YUY5Wo8s7LqqV34xTDOyWTP1w7t
   E+l3lv7RF/7ppz3bD/yr9ucpWJfpbb3kdj/s30VqtZdfYS0aBgKRUToIi
   zAdbV3MZPKCyUQA21TVHHX7sgx1xFTQpmdwyiK+R2tqObf6VOveyl9zXf
   zajXrcmy7pj8tfxJDCoaOtEqX1h/fzm7E7PvG5JkQbI5Am1tsaD/jW1XR
   UE5NdRsZThhAvQksXtye97NAxJ8hft2G7SRHd5LcPOHiUHSHfyPrN664r
   KMnm4x30TY6KM/NOGWXyp9zgYtLFjnRk2E9AYit/DlgwOxFnLoM/4Z7xM
   Q==;
X-CSE-ConnectionGUID: XGcaTTVcRy6fvL8YVzaoxQ==
X-CSE-MsgGUID: ckzHyjgCRsqkJwqTnwsXWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26608796"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26608796"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 02:07:08 -0700
X-CSE-ConnectionGUID: 3Sb2cmFFQ6WqAQYWe2xR2A==
X-CSE-MsgGUID: 4V2UXs9bRJ6zAhTMk4luJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72840871"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Sep 2024 02:07:06 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suTPs-000N4p-0o;
	Sat, 28 Sep 2024 09:07:04 +0000
Date: Sat, 28 Sep 2024 17:06:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jiantao Xiao <xiaojiantao1@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 14637/30000]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:4413:46: sparse:
 sparse: mixing different enum types:
Message-ID: <202409281736.VfwcJjb4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   bef6f06e039b8929481350d15d6d8c3ba81c6fd2
commit: 62aede9feaf6f4729af43df72be267a32bda43d1 [14637/30000] net: hns3: add support customized exception handling interfaces.
config: arm64-randconfig-r131-20240925 (https://download.01.org/0day-ci/archive/20240928/202409281736.VfwcJjb4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240928/202409281736.VfwcJjb4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281736.VfwcJjb4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:4413:46: sparse: sparse: mixing different enum types:
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:4413:46: sparse:    unsigned int enum hnae3_reset_type
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:4413:46: sparse:    unsigned int enum hnae3_event_type_custom
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:5902:37: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:5903:37: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:6137:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:6231:17: sparse: sparse: restricted __be32 degrades to integer
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:13772:21: sparse: sparse: symbol 'hclge_ops' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:5473:31: sparse: sparse: context imbalance in 'hclge_sync_fd_user_def_cfg' - unexpected unlock
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:12714:23: sparse: sparse: memset with byte count of 131072

vim +4413 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c

  4374	
  4375	void hclge_reset_event(struct pci_dev *pdev, struct hnae3_handle *handle)
  4376	{
  4377		struct hnae3_ae_dev *ae_dev = pci_get_drvdata(pdev);
  4378		struct hclge_dev *hdev = ae_dev->priv;
  4379		int ret;
  4380	
  4381		/* We might end up getting called broadly because of 2 below cases:
  4382		 * 1. Recoverable error was conveyed through APEI and only way to bring
  4383		 *    normalcy is to reset.
  4384		 * 2. A new reset request from the stack due to timeout
  4385		 *
  4386		 * check if this is a new reset request and we are not here just because
  4387		 * last reset attempt did not succeed and watchdog hit us again. We will
  4388		 * know this if last reset request did not occur very recently (watchdog
  4389		 * timer = 5*HZ, let us check after sufficiently large time, say 4*5*Hz)
  4390		 * In case of new request we reset the "reset level" to PF reset.
  4391		 * And if it is a repeat reset request of the most recent one then we
  4392		 * want to make sure we throttle the reset request. Therefore, we will
  4393		 * not allow it again before 3*HZ times.
  4394		 */
  4395	
  4396		if (time_before(jiffies, (hdev->last_reset_time +
  4397					  HCLGE_RESET_INTERVAL))) {
  4398			mod_timer(&hdev->reset_timer, jiffies + HCLGE_RESET_INTERVAL);
  4399			return;
  4400		}
  4401	
  4402		if (hdev->default_reset_request) {
  4403			hdev->reset_level =
  4404				hclge_get_reset_level(ae_dev,
  4405						      &hdev->default_reset_request);
  4406		} else if (time_after(jiffies, (hdev->last_reset_time + 4 * 5 * HZ))) {
  4407			hdev->reset_level = HNAE3_FUNC_RESET;
  4408		}
  4409	
  4410		dev_info(&hdev->pdev->dev, "received reset event, reset type is %d\n",
  4411			 hdev->reset_level);
  4412	
> 4413		ret = hclge_ext_call_event(hdev, hdev->reset_level);
  4414		if (ret) {
  4415			/* request reset & schedule reset task */
  4416			set_bit(hdev->reset_level, &hdev->reset_request);
  4417			hclge_reset_task_schedule(hdev);
  4418		}
  4419	
  4420		if (hdev->reset_level < HNAE3_GLOBAL_RESET)
  4421			hdev->reset_level++;
  4422	}
  4423	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
