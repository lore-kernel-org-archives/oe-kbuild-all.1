Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1C91DA49
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jan 2024 20:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705437337; cv=none; b=hWGL88B9XR9btD+O1i/aLGpH5EArke9QLFtAKBNeDPB56kHIHU3aN2x2PbDWcn6nGI7obz/bJCRGHOusAMMyphQMWD6lsVDwBf8DWjC+jWibsMA+VWExvZbdtpTjpqOHaot6oJTDeS+b7LiDHh6DHDf4MuVTae/eVpbb/4FdtWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705437337; c=relaxed/simple;
	bh=jbCqj83BmT4iET6xr6P3fUXs0HWBgnrHgbCisbDvIOk=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=BA0WDFZo9AjPTQrgQb3sVJDidGJA+zqTmvlZzOWPvrJF2z1fnU7j9ESDRfEaSjGw6dlj2vxeqDmMOtAajf6U2B6dnJ+B89pGIijzFI/kgMsfT5FijXafsPh72ZGPVjwJ4jgY+5JkTPR93/7Q/iE6BTAvwrB/VM47mwFtUYEEOsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJ5Ml0A/; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJ5Ml0A/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705437336; x=1736973336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jbCqj83BmT4iET6xr6P3fUXs0HWBgnrHgbCisbDvIOk=;
  b=BJ5Ml0A/Ifx6qyyZqKYb9W5kiTE4sAiqUM4+WwltSAZXAtyNLB5Y6UUx
   LJ+dUmzMFXe2S8s1IjMeHlp6JL6/GaljNwNFQG4MKN47UNzyt0mg5B+vC
   iVvr2ytRAPUEVdAd1RsGItjQq1stWcKgDd6miVi+qHgCobxAX9K1o0UEk
   vREjab3Nqyh+X557uxM4VRLZ89KLvq1eWFfmGpQOivmQ1OoOa+ebRKscc
   9i7gIQqZZ/gGLb1v5ZPnBaOv+gpf+thDTrgfr05XW8Mk3Udkze3Xf1mxo
   HhEDvTUlOoVqNTkMuNRLDIxN0NFBKDy52Mvp9CVwqtFVOuTC/owcdnDOq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="403733444"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="403733444"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 12:35:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="760311409"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="760311409"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 16 Jan 2024 12:35:31 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPq9f-0001Co-1s;
	Tue, 16 Jan 2024 20:35:27 +0000
Date: Wed, 17 Jan 2024 04:34:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 21665/30000]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:4413:46: warning:
 implicit conversion from 'enum hnae3_reset_type' to 'enum
 hnae3_event_type_custom'
Message-ID: <202401170427.OhYh4zd8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e4bd0053052e24e0c30e34d05ec042203c41976c
commit: 62aede9feaf6f4729af43df72be267a32bda43d1 [21665/30000] net: hns3: add support customized exception handling interfaces.
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240117/202401170427.OhYh4zd8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401170427.OhYh4zd8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401170427.OhYh4zd8-lkp@intel.com/

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
