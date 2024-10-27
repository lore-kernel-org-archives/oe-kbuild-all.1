Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DF0B65C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 00:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729988435; cv=none; b=Lx1L81zTHr69Lb1sDkaB65MlwOlQvUeuHkxetiLg/X6ZRAao3PVQQxqfxa3r7yHtCvmO3gUbieYbXXeqygEaAnIbnEtXKmXDqIGPQCL/f8m5rr0g2b2xmMrANgZCo0HPKAoqwHre6tWt7bkkA9nRcRXWTN4kTwhl6bdMY3tAsKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729988435; c=relaxed/simple;
	bh=4pqTt0YrvNe8QGqFBYsKmb7RjzFcPux94D2CLXJBc68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CUL89C+69ESpSRcR9bxeLJ1kzS92VhiEf/+xvVdsxB2cASBLYHgB8mpnH74QYIfZ2It6kA1EDOOtrZmhf6E+XAvDLYDJ9f87Vxdp0L87aXE1QnJC68dveXtzA0X15Du2sR3NaPXst7aSKyEMODJstlO+kIVG3DeDpTZjUVblzHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FNxvh1qU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FNxvh1qU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729988433; x=1761524433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4pqTt0YrvNe8QGqFBYsKmb7RjzFcPux94D2CLXJBc68=;
  b=FNxvh1qU7Qe8SKjjxs2NrcADkPG6uB7xDpsGdvJ8IQWS8vkjJduVf5Dh
   u4nIhmeFsvSfl0cfrWTWr2VcISQbO6QBrYAr1m76zbExObNvlWsUq0zYQ
   csmCleYHNOKpmi3tdm0rwnifRLQF7WhF0syXdLKEAHyW/xqd/QmnfR4Eb
   EswFPqStYg5yAfGBzUrWhxpqizjeTeBTdeOU5ZkP45RNf/kVQCEVGfQ4s
   XVFTiuklZp9mI5fYKtDvumuWG4Ia1mUFDfMYGwNdiPVrs11MfbZbE3QXE
   BCgjC8/28g7WZL8ufUIm2Z+gEaMKXxFxVRRmNdw7ObZWUY+V7jOYlHvAI
   w==;
X-CSE-ConnectionGUID: i1b+vqIWSt+v+UXdN1gYvw==
X-CSE-MsgGUID: u0sNEuW7QMCEoVoqn55w3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="29840921"
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="29840921"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 17:20:32 -0700
X-CSE-ConnectionGUID: HnrEjemoSE2OadafChIjsw==
X-CSE-MsgGUID: xmZ5MewKRIWh+T4qRzv1mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="85866200"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Oct 2024 17:20:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4r1B-000aCG-0w;
	Sun, 27 Oct 2024 00:20:29 +0000
Date: Sun, 27 Oct 2024 08:19:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jiantao Xiao <xiaojiantao1@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 14232/30000]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:4413:46: warning:
 implicit conversion from 'enum hnae3_reset_type' to 'enum
 hnae3_event_type_custom'
Message-ID: <202410270825.dsHEmsVP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tian,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   412556141b3c12f2f160acc3a09a40c937837ee3
commit: 62aede9feaf6f4729af43df72be267a32bda43d1 [14232/30000] net: hns3: add support customized exception handling interfaces.
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20241027/202410270825.dsHEmsVP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410270825.dsHEmsVP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270825.dsHEmsVP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_reset_event':
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:4413:46: warning: implicit conversion from 'enum hnae3_reset_type' to 'enum hnae3_event_type_custom' [-Wenum-conversion]
    4413 |         ret = hclge_ext_call_event(hdev, hdev->reset_level);
         |                                          ~~~~^~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_get_strings':
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:668:50: warning: '%s' directive output may be truncated writing up to 4895 bytes into a region of size 32 [-Wformat-truncation=]
     668 |                 snprintf(buff, ETH_GSTRING_LEN, "%s", strs[i].desc);
         |                                                  ^~
   In function 'hclge_comm_get_strings',
       inlined from 'hclge_get_strings' at drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:781:7:
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:668:17: note: 'snprintf' output between 1 and 4896 bytes into a destination of size 32
     668 |                 snprintf(buff, ETH_GSTRING_LEN, "%s", strs[i].desc);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
